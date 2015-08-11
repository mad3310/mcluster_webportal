CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_HEALTH` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '健康监控表主键',
  `HOST_IP` VARCHAR(30) DEFAULT NULL COMMENT '内部ip',
  `HOST_TAG` VARCHAR(100) DEFAULT NULL COMMENT '标签',

  `ROLE` VARCHAR(10) DEFAULT NULL COMMENT '角色',
  `RUN_TIME` FLOAT(30,3) DEFAULT NULL COMMENT '运行时间',
  `VERSION` VARCHAR(20) DEFAULT NULL COMMENT '版本',  
  
  `CONNECT_COUNT` INTEGER(10) DEFAULT NULL COMMENT '连接数',
  `ACTIVITY_COUNT` INTEGER(10) DEFAULT NULL COMMENT '活动数',
  `WAIT_COUNT` INTEGER(10) DEFAULT NULL COMMENT '等待数',  
  
  `SEND` FLOAT(30,3) DEFAULT NULL COMMENT '发送量',
  `RECV` FLOAT(30,3) DEFAULT NULL COMMENT '接收量', 
  
  `QUERY_PS` FLOAT(30,3) DEFAULT NULL COMMENT '每秒查询',
  `TRANSACTION_PS` FLOAT(30,3) DEFAULT NULL COMMENT '每秒事物', 
  `SLOW_QUERY_COUNT` INTEGER(10) DEFAULT NULL COMMENT '慢查询数',
  
  `CPU` FLOAT(30,3) DEFAULT NULL COMMENT 'cpu',
  `MEMORY` FLOAT(30,3) DEFAULT NULL COMMENT '内存',
  
  `DESCN` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='健康监控表';

CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_RESOURCE` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '资源监控表主键',
  `HOST_IP` VARCHAR(30) DEFAULT NULL COMMENT '内部ip',
  `HOST_TAG` VARCHAR(100) DEFAULT NULL COMMENT '标签',
  
  `MAX_CONNECT` INTEGER(10) DEFAULT NULL COMMENT '最大连接数',
  `MAX_CONNECT_ERROR` INTEGER(10) DEFAULT NULL COMMENT '最大错误连接数',
  
  `MAX_OPEN_FILE` INTEGER(10) DEFAULT NULL COMMENT '最大打开文件数',
  `HAD_OPEN_FILE` INTEGER(10) DEFAULT NULL COMMENT '已打开文件数',
  
  `CACHE_TABLE_COUNT` INTEGER(10) DEFAULT NULL COMMENT '表缓存数', 
  `HAD_OPEN_TABLE` INTEGER(10) DEFAULT NULL COMMENT '已打开表',
  `CACHE_TABLE_NOHIT_COUNT` INTEGER(10) DEFAULT NULL COMMENT '表缓存未命中数',
  
  `DESCN` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='资源监控表';

CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_KEYBUFFER` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '键缓存监控表主键',
  `HOST_IP` VARCHAR(30) DEFAULT NULL COMMENT '内部ip',
  `HOST_TAG` VARCHAR(100) DEFAULT NULL COMMENT '标签',
  
  `KEY_BUFFER_SIZE` FLOAT(30,3) DEFAULT NULL COMMENT '索引缓冲区大小',
  `SORT_BUFFER_SIZE` FLOAT(30,3) DEFAULT NULL COMMENT '每个线程排序所需缓冲',
  `JOIN_BUFFER_SIZE` FLOAT(30,3) DEFAULT NULL COMMENT 'Join操作使用内存',
  
  `KEY_BLOCKS_UNUSED` INTEGER(10) DEFAULT NULL COMMENT '未使用的缓存簇',
  `KEY_BLOCKS_USED` INTEGER(10) DEFAULT NULL COMMENT '曾经用到的最大的blocks数',
  `KEY_BLOCKS_NOT_FLUSHED` INTEGER(10) DEFAULT NULL COMMENT '键缓存内已经更改但还没有清空到硬盘上的键的数据块数量',
  
  `KEY_BLOCKS_USED_RATE` FLOAT(30,3) DEFAULT NULL COMMENT '未使用的缓存簇率', 
  `KEY_BUFFER_READ_RATE` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `KEY_BUFFER_WRITE_RATE` FLOAT(30,3) DEFAULT NULL COMMENT '',
  
  `DESCN` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='键缓存监控表';

CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_INNODB` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'InnoDB监控表主键',
  `HOST_IP` VARCHAR(30) DEFAULT NULL COMMENT '内部ip',
  `HOST_TAG` VARCHAR(100) DEFAULT NULL COMMENT '标签',
  
  `INNODB_BUFFER_POOL_SIZE` FLOAT(30,3) DEFAULT NULL COMMENT '缓存区大小',
  `INNODB_BUFFER_READ_HITS` FLOAT(30,3) DEFAULT NULL COMMENT 'Buffer命中率',
  
  `INNODB_ROWS_READ` FLOAT(30,3) DEFAULT NULL COMMENT '每秒读取行数',
  `INNODB_ROWS_INSERT` FLOAT(30,3) DEFAULT NULL COMMENT '每秒增加行数',
  `INNODB_ROWS_UPDATE` FLOAT(30,3) DEFAULT NULL COMMENT '每秒修改行数',
  `INNODB_ROWS_DELETE` FLOAT(30,3) DEFAULT NULL COMMENT '每秒删除行数',
  
  `DESCN` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='InnoDB监控表';

CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_DB_SPACE` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据库空间监控表主键',
  `HOST_IP` VARCHAR(30) DEFAULT NULL COMMENT '内部ip',
  `HOST_TAG` VARCHAR(100) DEFAULT NULL COMMENT '标签',
  
  `NAME` VARCHAR(50) DEFAULT NULL COMMENT '数据库名称',
  `SIZE` FLOAT(30,3) DEFAULT NULL COMMENT '数据库大小',
  
  `DESCN` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='数据库空间监控表';
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_TABLE_SPACE` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表空间监控表主键',
  `DB_SPACE_ID` BIGINT(20) DEFAULT NULL COMMENT '数据库空间监控表主键',
  
  `NAME` VARCHAR(50) DEFAULT NULL COMMENT '表名称',
  `SIZE` FLOAT(30,3) DEFAULT NULL COMMENT '表大小',
  
  `DESCN` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='表空间监控表';

CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_GALERA` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Galera监控表主键',
  `HOST_IP` VARCHAR(30) DEFAULT NULL COMMENT '内部ip',
  `HOST_TAG` VARCHAR(100) DEFAULT NULL COMMENT '标签',
  
  `WSREP_LOCAL_FAIL` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `WSREP_LOCAL_ABORT` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `WSREP_LOCAL_REPLAYS` FLOAT(30,3) DEFAULT NULL COMMENT '',
  
  `WSREP_REPLICATED` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `WSREP_REP_BYTES` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `WSREP_RECEIVED` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `WSREP_REC_BYTES` FLOAT(30,3) DEFAULT NULL COMMENT '',
  
  `WSREP_FLOW_CONTROL_PAUSED` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `WSREP_FLOW_CONTROL_SENT` FLOAT(30,3) DEFAULT NULL COMMENT '',
  `WSREP_FLOW_CONTROL_RECV` FLOAT(30,3) DEFAULT NULL COMMENT '',
  
  `DESCN` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Galera监控表';


CREATE TABLE `WEBPORTAL_MONITOR_ERROR` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '监控异常表主键',
  `TABLE_NAME` VARCHAR(50) DEFAULT NULL COMMENT '表名',
  `URL` VARCHAR(100) DEFAULT NULL COMMENT '调用url',
  `RESULT` VARCHAR(1000) DEFAULT NULL COMMENT '调用结果'
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '创建时间'
  PRIMARY KEY (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='监控异常表';

#===============以下是监控历史表=================================
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_DB_SPACE` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_INNODB_BUFFER` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_KEY_BLOCKS` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_KEY_RATE` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_NET` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_QUERY` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_RESOURCE` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_TABLE_SPACE` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_THREAD` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_WSREP_FLOW_CONTROL` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_WSREP_LOCAL` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `WEBPORTAL_MONITOR_MYSQL_BASE_WSREP_REP_REC` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DETAIL_NAME` varchar(50) DEFAULT NULL,
  `DETAIL_VALUE` float(30,3) DEFAULT NULL,
  `MONITOR_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`,`MONITOR_DATE`),
  KEY `NAME_IP_DATE` (`DETAIL_NAME`(10),`IP`(13),`MONITOR_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
#----所有历史表需要初始化分区信息（时间是示例）---------
ALTER TABLE 历史表 PARTITION BY RANGE (UNIX_TIMESTAMP(`MONITOR_DATE`))  
 (
 PARTITION pa20150810 VALUES LESS THAN (UNIX_TIMESTAMP('2015-08-10 12:00:00')),  
 PARTITION pb20150810 VALUES LESS THAN (UNIX_TIMESTAMP('2015-08-11 00:00:00'))
 );
 
 #================index表初始化数据===============
 insert  into `WEBPORTAL_INDEX_MONITOR`
(`TITLE_TEXT`,`SUB_TITLE_TEXT`,`Y_AXIS_TEXT`,`Y_AXIS_TEXT_1`,`Y_AXIS_TEXT_2`,`Y_AXIS_TEXT_3`,`TOOLTIP_SUFFIX`,`FLUSH_TIME`,`DETAIL_TABLE`,`STATUS`,`DATA_FROM_API`,`MONITOR_POINT`) 
values 
('mysql.thread',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_THREAD',4,'/node/stat/info','stat_connection_count_command,stat_active_count_command,stat_wating_count_command'),
('mysql.net',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_NET',4,'/node/stat/info','stat_net_send_command,stat_net_rev_command'),
('mysql.query',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_QUERY',4,'/node/stat/info','stat_QPS_command,stat_Com_rollback,stat_Com_commit_command,stat_slow_query_command'),
('mysql.resource',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_RESOURCE',4,'/node/stat/info','stat_opened_file_command,stat_opened_table_cach_command,stat_table_cach_noha_command'),
('mysql.unchange',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_INFREQUENT_CHANGE',0,'/node/stat/info','stat_version_command,stat_wsrep_status_command,stat_running_day_command,stat_max_conn_command,stat_max_err_conn_command,stat_max_open_file_command,stat_table_cach_command,stat_innodb_bufferpool_size_command,stat_key_buffer_size_command,stat_sort_buffer_size_command,stat_join_buffer_size_command'),
('mysql.key.blocks',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_KEY_BLOCKS',4,'/node/stat/info','stat_key_blocks_unused_command,stat_key_blocks_used_command,stat_key_blocks_not_flushed_command'),
('mysql.key.rate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_KEY_RATE',4,'/node/stat/info','stat_key_buffer_reads_command,stat_key_buffer_reads_request_command,stat_key_buffer_writes_command,stat_key_buffer_writes_request_command'),
('mysql.innodb.buffer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_INNODB_BUFFER',4,'/node/stat/info','stat_innodb_bufferpool_reads_command,stat_innodb_bufferpool_read_request_command'),
('mysql.table.space',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_TABLE_SPACE',5,'/node/stat/info','stat_table_space_analyze_command'),
('mysql.db.space',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_DB_SPACE',5,'/node/stat/info','stat_database_size_command'),
('mysql.wsrep.local',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_WSREP_LOCAL',4,'/node/stat/info','stat_wsrep_local_fail_command,stat_wsrep_local_bf_aborts_command,stat_wsrep_local_replays_command'),
('mysql.wsrep.rep_rec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_WSREP_REP_REC',4,'/node/stat/info','stat_wsrep_replicated_command,stat_wsrep_replicated_bytes_command,stat_wsrep_received_command,stat_wsrep_received_bytes_command'),
('mysql.wsrep_flow_control',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEBPORTAL_MONITOR_MYSQL_BASE_WSREP_FLOW_CONTROL',4,'/node/stat/info','stat_wsrep_flow_control_paused_command,stat_wsrep_flow_control_sent_command,stat_wsrep_flow_control_recv_command');
