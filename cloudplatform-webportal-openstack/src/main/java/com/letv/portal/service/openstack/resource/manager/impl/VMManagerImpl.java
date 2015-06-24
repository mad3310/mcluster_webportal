package com.letv.portal.service.openstack.resource.manager.impl;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.jclouds.ContextBuilder;
import org.jclouds.logging.slf4j.config.SLF4JLoggingModule;
import org.jclouds.openstack.neutron.v2.NeutronApi;
import org.jclouds.openstack.neutron.v2.domain.FloatingIP.CreateFloatingIP;
import org.jclouds.openstack.neutron.v2.domain.Network;
import org.jclouds.openstack.neutron.v2.domain.Port.CreatePort;
import org.jclouds.openstack.neutron.v2.features.NetworkApi;
import org.jclouds.openstack.nova.v2_0.NovaApi;
import org.jclouds.openstack.nova.v2_0.domain.Address;
import org.jclouds.openstack.nova.v2_0.domain.Flavor;
import org.jclouds.openstack.nova.v2_0.domain.FloatingIP;
import org.jclouds.openstack.nova.v2_0.domain.Server;
import org.jclouds.openstack.nova.v2_0.domain.ServerCreated;
import org.jclouds.openstack.nova.v2_0.extensions.FloatingIPApi;
import org.jclouds.openstack.nova.v2_0.features.FlavorApi;
import org.jclouds.openstack.nova.v2_0.features.ServerApi;
import org.jclouds.openstack.nova.v2_0.options.CreateServerOptions;
import org.slf4j.Logger;

import com.google.common.base.Optional;
import com.google.common.collect.ImmutableSet;
import com.google.inject.Module;
import com.letv.portal.service.openstack.exception.APINotAvailableException;
import com.letv.portal.service.openstack.exception.OpenStackException;
import com.letv.portal.service.openstack.exception.RegionNotFoundException;
import com.letv.portal.service.openstack.exception.ResourceNotFoundException;
import com.letv.portal.service.openstack.exception.VMDeleteException;
import com.letv.portal.service.openstack.impl.OpenStackConf;
import com.letv.portal.service.openstack.impl.OpenStackUser;
import com.letv.portal.service.openstack.resource.FlavorResource;
import com.letv.portal.service.openstack.resource.NetworkResource;
import com.letv.portal.service.openstack.resource.VMResource;
import com.letv.portal.service.openstack.resource.impl.FlavorResourceImpl;
import com.letv.portal.service.openstack.resource.impl.VMResourceImpl;
import com.letv.portal.service.openstack.resource.manager.ImageManager;
import com.letv.portal.service.openstack.resource.manager.NetworkManager;
import com.letv.portal.service.openstack.resource.manager.VMCreateConf;
import com.letv.portal.service.openstack.resource.manager.VMManager;

public class VMManagerImpl extends AbstractResourceManager implements VMManager {

	private static final Logger logger = org.slf4j.LoggerFactory
			.getLogger(VMManager.class);

	private NovaApi novaApi;

	private ImageManager imageManager;

	private NetworkManager networkManager;

	public VMManagerImpl(OpenStackConf openStackConf,
			OpenStackUser openStackUser) {
		super(openStackConf, openStackUser);

		Iterable<Module> modules = ImmutableSet
				.<Module> of(new SLF4JLoggingModule());

		novaApi = ContextBuilder
				.newBuilder("openstack-nova")
				.endpoint(openStackConf.getPublicEndpoint())
				.credentials(
						openStackUser.getUserId() + ":"
								+ openStackUser.getUserId(),
						openStackUser.getPassword()).modules(modules)
				.buildApi(NovaApi.class);
	}

	@Override
	public void close() throws IOException {
		novaApi.close();
	}

	@Override
	public Set<String> getRegions() {
		return novaApi.getConfiguredRegions();
	}

	@Override
	public List<VMResource> list(String region) throws RegionNotFoundException,
			ResourceNotFoundException {
		checkRegion(region);

		ServerApi serverApi = novaApi.getServerApi(region);
		List<Server> resources = serverApi.listInDetail().concat().toList();
		List<VMResource> vmResources = new ArrayList<VMResource>(
				resources.size());
		for (Server resource : resources) {
			vmResources.add(new VMResourceImpl(region, resource, this,
					imageManager));
		}
		return vmResources;
	}

	@Override
	public VMResource get(String region, String id)
			throws RegionNotFoundException, ResourceNotFoundException {
		checkRegion(region);

		ServerApi serverApi = novaApi.getServerApi(region);
		Server server = serverApi.get(id);
		if (server != null) {
			return new VMResourceImpl(region, server, this, imageManager);
		} else {
			throw new ResourceNotFoundException(MessageFormat.format(
					"VM \"{0}\" is not found.", id));
		}
	}

	@Override
	public VMResource create(String region, VMCreateConf conf)
			throws OpenStackException {
		checkRegion(region);

		CreateServerOptions createServerOptions = new CreateServerOptions();

		Set<String> networks = new HashSet<String>();
		List<NetworkResource> networkResources = conf.getNetworkResources();
		if (networkResources != null) {
			for (int i = 0; i < networkResources.size(); i++) {
				networks.add(networkResources.get(i).getId());
			}
		}
		// test code begin(ssh login)
		{
			NetworkManagerImpl networkManagerImpl = (NetworkManagerImpl) networkManager;
			NeutronApi neutronApi = networkManagerImpl.getNeutronApi();
			NetworkApi networkApi = neutronApi.getNetworkApi(region);
			for (Network network : networkApi.list().concat().toList()) {
				if (openStackConf.getUserPrivateNetworkName().equals(
						network.getName())) {
					networks.add(network.getId());
					break;
				}
			}

			if (openStackUser.getInternalUser()) {
				networks.add(openStackConf.getGlobalSharedNetworkId());
			}
		}
		// test code end
		createServerOptions.networks(networks);

		String adminPass = conf.getAdminPass();
		if (adminPass != null) {
			createServerOptions.adminPass(adminPass);
		}

		// test code begin(ssh login)
		{
			// Optional<SecurityGroupApi> securityGroupApi = novaApi
			// .getSecurityGroupApi(region);
			// if (securityGroupApi.isPresent()) {
			// SecurityGroup defaultSecurityGroup = null;
			// List<SecurityGroup> securityGroups = securityGroupApi.get()
			// .list().toList();
			// for (SecurityGroup securityGroup : securityGroups) {
			// if ("default".equals(securityGroup.getName())) {
			// defaultSecurityGroup = securityGroup;
			// break;
			// }
			// }
			// if (defaultSecurityGroup != null) {
			// } else {
			// throw new
			// OpenStackException("Default security group is not found.");
			// }
			// } else {
			// throw new APINotAvailableException(SecurityGroupApi.class);
			// }

			createServerOptions.securityGroupNames("default");
		}
		// test code end

		ServerApi serverApi = novaApi.getServerApi(region);
		ServerCreated serverCreated = serverApi.create(conf.getName(), conf
				.getImageResource().getId(), conf.getFlavorResource().getId(),
				createServerOptions);
		Server server = serverApi.get(serverCreated.getId());

		// test code begin(ssh login)
		// {
		// Optional<FloatingIPApi> floatingIPApiOptional = novaApi
		// .getFloatingIPApi(region);
		// if (!floatingIPApiOptional.isPresent()) {
		// throw new APINotAvailableException(FloatingIPApi.class);
		// }
		// FloatingIPApi floatingIPApi = floatingIPApiOptional.get();
		// // FloatingIP floatingIP = floatingIPApi.create();
		// for(Entry<String,Address> entry:server.getAddresses().entries()){
		// logger.info(MessageFormat.format("server address: {0} => {1}",
		// entry.getKey(),entry.getValue().getAddr()));
		// }
		// // floatingIPApi.addToServer(floatingIP.getIp(), server.getId());
		// }
		// test code end

		return new VMResourceImpl(region, server, this, imageManager);
	}

	@Override
	public void publish(String region, VMResource vm) throws OpenStackException {
		checkRegion(region);

		Server server = ((VMResourceImpl) (vm)).server;
//		Collection<Address> addresses = server.getAddresses().get(
//				openStackConf.getUserPrivateNetworkName());
//		// for (Entry<String, Address> entry : ((VMResourceImpl) (vm)).server
//		// .getAddresses().entries()) {
//		// System.out.println(MessageFormat.format("server address: {0} => {1}",
//		// entry.getKey(), entry.getValue().getAddr()));
//		// }
//		if (addresses.isEmpty()) {
//			throw new OpenStackException(
//					"Virtual machine is not assigned IP address of user private network.");
//		}
//		Address address = addresses.iterator().next();
//		String ip = address.getAddr();

		 Optional<FloatingIPApi> floatingIPApiOptional = novaApi
		 .getFloatingIPApi(region);
		 if (!floatingIPApiOptional.isPresent()) {
		 throw new APINotAvailableException(FloatingIPApi.class);
		 }
		 FloatingIPApi floatingIPApi = floatingIPApiOptional.get();
		 FloatingIP floatingIP = floatingIPApi.allocateFromPool(openStackConf
		 .getGlobalPublicNetworkId());
		 floatingIPApi.addToServer(floatingIP.getIp(), server.getId());
		
//		NetworkManagerImpl networkManagerImpl = (NetworkManagerImpl) networkManager;
//		NeutronApi neutronApi = networkManagerImpl.getNeutronApi();
//		neutronApi.getPortApi(region).create(CreatePort.createBuilder(""))
//		neutronApi
//				.getFloatingIPApi(region)
//				.get()
//				.create(CreateFloatingIP.createBuilder(
//						openStackConf.getGlobalPublicNetworkId()).portId("sss").build());
	}

	@Override
	public void delete(String region, VMResource vm)
			throws RegionNotFoundException, VMDeleteException {
		checkRegion(region);

		ServerApi serverApi = novaApi.getServerApi(region);
		boolean isSuccess = serverApi.delete(vm.getId());
		if (!isSuccess) {
			throw new VMDeleteException(MessageFormat.format(
					"VM \"{0}\" delete failed.", vm.getId()));
		}
	}

	@Override
	public void start(String region, VMResource vm)
			throws RegionNotFoundException {
		checkRegion(region);

		ServerApi serverApi = novaApi.getServerApi(region);
		serverApi.start(vm.getId());
	}

	@Override
	public void stop(String region, VMResource vm)
			throws RegionNotFoundException {
		checkRegion(region);

		ServerApi serverApi = novaApi.getServerApi(region);
		serverApi.stop(vm.getId());
	}

	@Override
	public List<FlavorResource> listFlavorResources(String region)
			throws RegionNotFoundException {
		checkRegion(region);

		FlavorApi flavorApi = novaApi.getFlavorApi(region);
		List<Flavor> resources = flavorApi.listInDetail().concat().toList();
		List<FlavorResource> flavorResources = new ArrayList<FlavorResource>(
				resources.size());
		for (Flavor resource : resources) {
			flavorResources.add(new FlavorResourceImpl(region, resource));
		}
		return flavorResources;
	}

	@Override
	public FlavorResource getFlavorResource(String region, String id)
			throws RegionNotFoundException, ResourceNotFoundException {
		checkRegion(region);

		FlavorApi flavorApi = novaApi.getFlavorApi(region);
		Flavor flavor = flavorApi.get(id);
		if (flavor != null) {
			return new FlavorResourceImpl(region, flavor);
		} else {
			throw new ResourceNotFoundException(MessageFormat.format(
					"Flavor \"{0}\" is not found.", id));
		}
	}

	public void setImageManager(ImageManager imageManager) {
		this.imageManager = imageManager;
	}

	public void setNetworkManager(NetworkManager networkManager) {
		this.networkManager = networkManager;
	}

}
