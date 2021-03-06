package com.letv.portal.task.rds.service.add.impl;

import com.letv.common.exception.ValidateException;
import com.letv.common.result.ApiResultObject;
import com.letv.portal.enumeration.MclusterStatus;
import com.letv.portal.model.ContainerModel;
import com.letv.portal.model.MclusterModel;
import com.letv.portal.model.task.TaskResult;
import com.letv.portal.model.task.service.IBaseTaskService;
import com.letv.portal.python.service.IPythonService;
import com.letv.portal.service.IContainerService;
import com.letv.portal.service.IHostService;
import com.letv.portal.service.IMclusterService;
import com.letv.portal.task.rds.service.impl.BaseTask4RDSServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("taskMclusterAddInitAdminUserAndPwdService")
public class TaskMclusterInitAdminUserAndPwdServiceImpl extends BaseTask4RDSServiceImpl implements IBaseTaskService{

	@Autowired
	private IPythonService pythonService;
	@Autowired
	private IContainerService containerService;
	@Autowired
	private IHostService hostService;
	@Autowired
	private IMclusterService mclusterService;
	
	private final static Logger logger = LoggerFactory.getLogger(TaskMclusterInitAdminUserAndPwdServiceImpl.class);
	
	@Override
	public TaskResult execute(Map<String, Object> params) throws Exception{
		TaskResult tr = super.execute(params);
		if(!tr.isSuccess())
			return tr;
		
		Long mclusterId = getLongFromObject(params.get("mclusterId"));
		if(mclusterId == null)
			throw new ValidateException("params's mclusterId is null");
		//执行业务
		MclusterModel mclusterModel = this.mclusterService.selectById(mclusterId);
		if(mclusterModel == null)
			throw new ValidateException("mclusterModel is null by mclusterId:" + mclusterId);

		String namesstr = (String)params.get("addNames");
		String[] addNames = namesstr.split(",");
		List<ContainerModel> containers = new ArrayList<ContainerModel>();
		for (String addName:addNames) {
			containers.add(this.containerService.selectByName(addName));
		}
		if(containers.isEmpty())
			throw new ValidateException("containers is empty by name:" + namesstr);
		String username = mclusterModel.getAdminUser();
		String password = mclusterModel.getAdminPassword();
		for (int i = 0; i < containers.size(); i++) {
			String ipAddr = containers.get(i).getIpAddr();
			ApiResultObject result = this.pythonService.initUserAndPwd4Manager(ipAddr,username,password);
			tr = analyzeRestServiceResult(result);
			if(!tr.isSuccess()) {
				tr.setResult("the" + (i+1) +"node error:" + tr.getResult());
				break;
			}
		}

		//set params
		tr.setParams(params);
		return tr;
	}
	@Override
	public void callBack(TaskResult tr) {
//		super.callBack(tr);
	}

	@Override
	public void rollBack(TaskResult tr) {
		String namesstr  =  (String) ((Map<String, Object>) tr.getParams()).get("addNames");
		String[] addNames = namesstr.split(",");
		for (String addName:addNames) {
			ContainerModel containerModel = this.containerService.selectByName(addName);
			if(MclusterStatus.ADDING.getValue() == containerModel.getStatus()) {
				containerModel.setStatus(MclusterStatus.ADDINGFAILED.getValue());
				this.containerService.updateBySelective(containerModel);
			}
		}
		Long mclusterId = getLongFromObject(((Map<String, Object>) tr.getParams()).get("mclusterId"));
		MclusterModel mcluster = this.mclusterService.selectById(mclusterId);
		mcluster.setStatus(MclusterStatus.ADDINGFAILED.getValue());
		this.mclusterService.updateBySelective(mcluster);
//		super.rollBack(tr);
	}
	
}
