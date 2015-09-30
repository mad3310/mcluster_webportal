CREATE TABLE `WEBPORTAL_CLOUDVM_IMAGE` (
	`ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`REGION` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
	`IMAGE_ID` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
	`NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`CONTAINER_FORMAT` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`DISK_FORMAT` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`SIZE` integer unsigned DEFAULT NULL,
	`CHECKSUM` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`MIN_DISK` integer unsigned DEFAULT NULL,
	`MIN_RAM` integer unsigned DEFAULT NULL,
	`LOCATION` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`OWNER` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`UPDATED_AT` datetime DEFAULT NULL,
	`CREATED_AT` datetime DEFAULT NULL,
	`DELETED_AT` datetime DEFAULT NULL,
	`STATUS` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`IS_PUBLIC` tinyint(4) unsigned DEFAULT NULL,
	`DELETED` tinyint(4) DEFAULT NULL,
	`CREATE_TIME` datetime DEFAULT NULL,
	`UPDATE_TIME` datetime DEFAULT NULL,
	`CREATE_USER` bigint(20) unsigned DEFAULT NULL,
	`UPDATE_USER` bigint(20) unsigned DEFAULT NULL,
	PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
