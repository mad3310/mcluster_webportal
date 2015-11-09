CREATE TABLE `WEBPORTAL_CLOUDVM_KEY_PAIR` (
	`ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`REGION` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FINGERPRINT` char(47) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
	`TENANT_ID` bigint(20) unsigned NOT NULL,
	`DELETED` tinyint(4) DEFAULT NULL,
	`CREATE_TIME` datetime DEFAULT NULL,
	`UPDATE_TIME` datetime DEFAULT NULL,
	`CREATE_USER` bigint(20) unsigned DEFAULT NULL,
	`UPDATE_USER` bigint(20) unsigned DEFAULT NULL,
	PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;