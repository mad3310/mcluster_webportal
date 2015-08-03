package com.letv.portal.service.monitor.mysql.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letv.common.dao.IBaseDao;
import com.letv.portal.dao.monitor.mysql.IMysqlHealthMonitorDao;
import com.letv.portal.model.ContainerModel;
import com.letv.portal.model.monitor.mysql.MysqlHealthMonitor;
import com.letv.portal.service.IMonitorService;
import com.letv.portal.service.impl.BaseServiceImpl;
import com.letv.portal.service.monitor.mysql.IMysqlHealthMonitorService;

@Service("mysqlHealthMonitorService")
public class MysqlHealthMonitorServiceImpl extends BaseServiceImpl<MysqlHealthMonitor> implements IMysqlHealthMonitorService{
	
	private final static Logger logger = LoggerFactory.getLogger(MysqlHealthMonitorServiceImpl.class);
	
	private final static String[] titles = {"node.mysql_cpu.partion","node.mysql_memory.partion","mysql.thread","mysql.net","mysql.query"};
	
	@Resource
	private IMysqlHealthMonitorDao mysqlHealthMonitorDao;
	
	@Autowired
	private IMonitorService monitorService;
	
	public MysqlHealthMonitorServiceImpl() {
		super(MysqlHealthMonitor.class);
	}

	@Override
	public IBaseDao<MysqlHealthMonitor> getDao() {
		return this.mysqlHealthMonitorDao;
	}

	@Override
	public void collectMysqlHealthMonitorData(ContainerModel container,
			Map<String, Object> map, Date d) {
		Map<String, Object> dbResult = this.monitorService.getLatestDataFromMonitorTables(container.getIpAddr(), titles, d);
		MysqlHealthMonitor health = new MysqlHealthMonitor();
		health.setHostIp(container.getIpAddr());
		health.setHostTag(container.getHcluster().getHclusterNameAlias()+"-"+container.getHostIp()+"-"+container.getContainerName());
		health.setRole((String) map.get("stat_wsrep_status_command"));
		health.setRunTime(Float.parseFloat((String) map.get("stat_running_day_command")));
		health.setVersion((String) map.get("stat_version_command"));
		health.setConnectCount(dbResult.get("stat_connection_count_command")==null?null:((Float)dbResult.get("stat_connection_count_command")).intValue());
		health.setActivityCount(dbResult.get("stat_active_count_command")==null?null:((Float)dbResult.get("stat_active_count_command")).intValue());
		health.setWaitCount(dbResult.get("stat_wating_count_command")==null?null:((Float)dbResult.get("stat_wating_count_command")).intValue());
		health.setSend((Float) dbResult.get("stat_net_send_command"));
		health.setRecv((Float) dbResult.get("stat_net_rev_command"));
		health.setQueryPs((Float) dbResult.get("stat_QPS_command"));
		if(dbResult.get("stat_Com_rollback")!=null && dbResult.get("stat_Com_commit_command")!=null) {
			health.setTransactionPs((Float) dbResult.get("stat_Com_rollback")+(Float)dbResult.get("stat_Com_commit_command"));
		}
		health.setSlowQueryCount(dbResult.get("stat_slow_query_command")==null?null:((Float)dbResult.get("stat_slow_query_command")).intValue());
		health.setCpu((Float)dbResult.get("mysql_cpu_partion"));
		health.setMemory((Float) dbResult.get("mysql_mem_partion"));
		int i = this.mysqlHealthMonitorDao.selectByHostIp(container.getIpAddr());
		if(i==1) {
			health.setUpdateTime(new Timestamp(d.getTime()));
			this.mysqlHealthMonitorDao.update(health);
		} else if(i==0) {
			health.setCreateTime(new Timestamp(d.getTime()));
			health.setUpdateTime(new Timestamp(d.getTime()));
			this.mysqlHealthMonitorDao.insert(health);
		} else if(i>1) {
			logger.error("mysqlHealthMonitorDao.selectByHostIp method get many result, this is a bug. HOST_IP :"+container.getIpAddr());
		}
	}
	
	
}
