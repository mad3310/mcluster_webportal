package com.letv.portal.proxy.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.letv.common.dao.QueryParam;
import com.letv.common.paging.impl.Page;
import com.letv.portal.dao.IBaseDao;
import com.letv.portal.dao.IContainerDao;
import com.letv.portal.dao.IDbApplyStandardDao;
import com.letv.portal.dao.IHostDao;
import com.letv.portal.model.HostModel;
import com.letv.portal.proxy.IHostProxy;
import com.letv.portal.service.IMclusterService;

@Component
public class HostProxyImpl extends BaseProxyImpl<HostModel> implements
		IHostProxy{
	
	private final static Logger logger = LoggerFactory.getLogger(HostProxyImpl.class);
	
	private static final String PYTHON_URL = "";
	private static final String SUCCESS_CODE = "";
	
	@Resource
	private IHostDao hostDao;
	@Resource
	private IDbApplyStandardDao dbApplyStandardDao;
	
	@Resource
	private IContainerDao containerDao;
	
	@Resource
	private IMclusterService mclusterService;

	public HostProxyImpl() {
		super(HostModel.class);
	}

	@Override
	public IBaseDao<HostModel> getDao() {
		return this.hostDao;
	}

	@Override
	public void updateNodeCount(String hostId,String type) {
		HostModel host = this.hostDao.selectById(hostId);
		Integer number = "+".equals(type)?host.getNodesNumber()+1:host.getNodesNumber()-1;
		host.setNodesNumber(number);
		this.hostDao.updateNodesNumber(host);
		
	}

	@Override
	public Page findPagebyParams(Map<String, Object> params, Page page) {
		QueryParam param = new QueryParam(params,page);
		page.setData(this.hostDao.selectPageByMap(param));
		page.setTotalRecords(this.hostDao.selectByMapCount(params));
		return page;
	}

}
