/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50518
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-05-09 10:39:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `infox_project_emp_working`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_emp_working`;
CREATE TABLE `infox_project_emp_working` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `project_role` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PEW_PID` varchar(255) DEFAULT NULL,
  `PROJECT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_n6r4r99gnknh70nqmgue1kjt3` (`EMP_ID`),
  KEY `FK_9ptulgtiebssvu6reqewrspm0` (`PEW_PID`),
  KEY `FK_h9d10dyrql3fb9e1fac7elilh` (`PROJECT_ID`),
  CONSTRAINT `FK_9ptulgtiebssvu6reqewrspm0` FOREIGN KEY (`PEW_PID`) REFERENCES `infox_project_emp_working` (`id`),
  CONSTRAINT `FK_h9d10dyrql3fb9e1fac7elilh` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_n6r4r99gnknh70nqmgue1kjt3` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_emp_working
-- ----------------------------
INSERT INTO `infox_project_emp_working` VALUES ('000722', '2014-04-17 10:20:17', '2014-02-26', '1', '2013-12-03', '4', '0993', null, '295928');
INSERT INTO `infox_project_emp_working` VALUES ('020703', '2014-04-17 10:57:06', '2014-01-17', '4', '2014-01-13', '4', '1296', null, '079644');
INSERT INTO `infox_project_emp_working` VALUES ('036528', '2014-04-17 10:21:22', '2014-01-26', '3', '2013-12-10', '4', '0866', null, '396952');
INSERT INTO `infox_project_emp_working` VALUES ('044727', '2014-04-17 10:57:06', '2014-01-27', '4', '2013-12-30', '4', '1028', null, '079644');
INSERT INTO `infox_project_emp_working` VALUES ('072978', '2014-04-17 10:19:51', '2014-01-19', '3', '2013-11-15', '4', '0053', null, '194660');
INSERT INTO `infox_project_emp_working` VALUES ('112182', '2014-04-17 10:15:54', '2013-12-27', '3', '2013-09-12', '4', '0579', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('165353', '2014-04-17 10:21:22', '2014-02-21', '1', '2013-12-10', '4', '0520', null, '396952');
INSERT INTO `infox_project_emp_working` VALUES ('205180', '2014-04-30 11:52:30', '2014-08-03', 'PG', '2014-03-03', '1', '0579', null, '400494');
INSERT INTO `infox_project_emp_working` VALUES ('216064', '2014-04-17 10:15:54', '2013-09-22', '4', '2013-09-09', '4', '0793', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('222355', '2014-04-30 11:52:30', '2014-08-03', 'PG', '2014-03-03', '1', '0498', null, '400494');
INSERT INTO `infox_project_emp_working` VALUES ('225586', '2014-04-30 11:52:30', '2014-08-03', 'PG', '2014-03-03', '1', '0453', null, '400494');
INSERT INTO `infox_project_emp_working` VALUES ('279895', '2014-04-17 10:15:54', '2013-11-01', '3', '2013-09-09', '4', '0670', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('308891', '2014-04-17 10:21:22', '2014-01-26', '4', '2013-12-16', '4', '1158', null, '396952');
INSERT INTO `infox_project_emp_working` VALUES ('358512', '2014-04-17 10:19:51', '2014-01-17', '1', '2013-11-16', '4', '1223', null, '194660');
INSERT INTO `infox_project_emp_working` VALUES ('374137', '2014-04-17 10:57:06', '2014-01-17', '4', '2014-01-13', '4', '0748', null, '079644');
INSERT INTO `infox_project_emp_working` VALUES ('419460', '2014-04-17 10:19:51', '2014-01-17', '4', '2013-12-12', '4', '1211', null, '194660');
INSERT INTO `infox_project_emp_working` VALUES ('435877', '2014-04-30 11:52:30', '2014-08-03', 'PG', '2014-03-03', '1', '0621', null, '400494');
INSERT INTO `infox_project_emp_working` VALUES ('439235', '2014-04-17 10:15:54', '2014-08-11', '1', '2013-09-03', '4', '0155', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('458040', '2014-04-17 10:21:22', '2014-01-26', '3', '2013-12-10', '4', '0150', null, '396952');
INSERT INTO `infox_project_emp_working` VALUES ('471124', '2014-04-17 10:22:05', '2014-02-14', '1', '2013-12-16', '4', '0428', null, '907300');
INSERT INTO `infox_project_emp_working` VALUES ('473590', '2014-04-17 10:21:08', '2014-02-12', '4', '2013-12-16', '4', '1220', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('476598', '2014-04-17 10:57:06', '2014-01-14', '4', '2014-01-10', '4', '0753', null, '079644');
INSERT INTO `infox_project_emp_working` VALUES ('506713', '2014-04-30 11:52:30', '2014-08-03', 'PG', '2014-03-03', '1', '0583', null, '400494');
INSERT INTO `infox_project_emp_working` VALUES ('531452', '2014-04-17 10:22:05', '2014-01-27', '4', '2013-12-16', '4', '1236', null, '907300');
INSERT INTO `infox_project_emp_working` VALUES ('550054', '2014-04-17 10:15:54', '2013-09-22', '4', '2013-09-09', '4', '1212', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('562778', '2014-04-17 10:21:08', '2014-01-13', '4', '2013-12-03', '4', '1179', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('595652', '2014-04-17 10:20:17', '2014-02-26', '4', '2013-12-03', '4', '1060', null, '295928');
INSERT INTO `infox_project_emp_working` VALUES ('608092', '2014-04-17 10:21:08', '2014-02-12', '1', '2013-12-03', '4', '1084', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('615865', '2014-04-17 10:21:22', '2014-01-26', '4', '2013-12-10', '4', '1237', null, '396952');
INSERT INTO `infox_project_emp_working` VALUES ('627222', '2014-04-17 10:15:54', '2014-01-28', '3', '2013-09-22', '4', '0669', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('639629', '2014-04-17 10:21:08', '2014-02-12', '4', '2013-12-03', '4', '1071', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('668141', '2014-04-17 10:20:17', '2014-01-24', '4', '2013-12-03', '4', '1099', null, '295928');
INSERT INTO `infox_project_emp_working` VALUES ('700227', '2014-04-17 10:17:44', '2014-02-13', '3', '2013-09-22', '4', '0803', null, '177998');
INSERT INTO `infox_project_emp_working` VALUES ('706552', '2014-04-17 10:21:08', '2014-02-12', '3', '2013-12-03', '4', '1074', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('707911', '2014-04-17 10:21:08', '2014-02-12', '4', '2013-12-03', '4', '1082', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('736495', '2014-04-30 11:52:30', '2014-08-03', 'PG', '2014-03-03', '1', '0669', null, '400494');
INSERT INTO `infox_project_emp_working` VALUES ('767991', '2014-04-17 10:15:54', '2013-12-05', '4', '2013-09-09', '4', '1184', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('777508', '2014-04-30 11:52:30', '2014-08-03', 'PG', '2014-03-03', '1', '0520', null, '400494');
INSERT INTO `infox_project_emp_working` VALUES ('801372', '2014-04-17 10:21:08', '2014-02-12', '3', '2013-12-03', '4', '1234', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('840037', '2014-04-17 10:15:54', '2013-10-23', '3', '2013-09-09', '4', '0583', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('900582', '2014-04-17 10:15:54', '2013-12-05', '4', '2013-09-09', '4', '1193', null, '473394');
INSERT INTO `infox_project_emp_working` VALUES ('947049', '2014-04-17 10:21:08', '2014-02-12', '5', '2013-12-10', '4', '1255', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('954491', '2014-04-17 10:21:08', '2014-02-12', '4', '2013-12-03', '4', '1145', null, '906912');
INSERT INTO `infox_project_emp_working` VALUES ('985406', '2014-04-17 10:19:51', '2014-01-17', '3', '2013-12-19', '4', '0032', null, '194660');
INSERT INTO `infox_project_emp_working` VALUES ('997879', '2014-04-17 10:21:08', '2014-02-12', '5', '2013-12-10', '4', '1287', null, '906912');

-- ----------------------------
-- Table structure for `infox_project_maillist`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_maillist`;
CREATE TABLE `infox_project_maillist` (
  `id` varchar(255) NOT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PROJECT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bq2ik7889xo03safp9bwivu15` (`EMP_ID`),
  KEY `FK_r87cb1fvctw5uxpo2dtn1kng0` (`PROJECT_ID`),
  CONSTRAINT `FK_bq2ik7889xo03safp9bwivu15` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`),
  CONSTRAINT `FK_r87cb1fvctw5uxpo2dtn1kng0` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_maillist
-- ----------------------------
INSERT INTO `infox_project_maillist` VALUES ('048908', '0055', '473394');
INSERT INTO `infox_project_maillist` VALUES ('100689', '0669', '400494');
INSERT INTO `infox_project_maillist` VALUES ('160795', '0055', '177998');
INSERT INTO `infox_project_maillist` VALUES ('195958', '0803', '079644');
INSERT INTO `infox_project_maillist` VALUES ('212828', '0098', '907300');
INSERT INTO `infox_project_maillist` VALUES ('223291', '0055', '194660');
INSERT INTO `infox_project_maillist` VALUES ('343916', '0055', '295928');
INSERT INTO `infox_project_maillist` VALUES ('396145', '0428', '400494');
INSERT INTO `infox_project_maillist` VALUES ('528121', '0098', '396952');
INSERT INTO `infox_project_maillist` VALUES ('585461', '0098', '906912');
INSERT INTO `infox_project_maillist` VALUES ('587064', '0453', '400494');
INSERT INTO `infox_project_maillist` VALUES ('744691', '0583', '400494');
INSERT INTO `infox_project_maillist` VALUES ('782936', '0621', '400494');
INSERT INTO `infox_project_maillist` VALUES ('819470', '0520', '400494');
INSERT INTO `infox_project_maillist` VALUES ('830230', '0452', '400494');
INSERT INTO `infox_project_maillist` VALUES ('909751', '0498', '400494');
INSERT INTO `infox_project_maillist` VALUES ('974253', '0579', '400494');

-- ----------------------------
-- Table structure for `infox_project_overtime`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_overtime`;
CREATE TABLE `infox_project_overtime` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `holidaysHour` float DEFAULT NULL,
  `holidaysHour1` float DEFAULT NULL,
  `hour` float DEFAULT NULL,
  `normalHour` float DEFAULT NULL,
  `normalHour1` float DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `weekendHour` float DEFAULT NULL,
  `weekendHour1` float DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PROJECT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rls4or1b482lf2y8dov82psb6` (`EMP_ID`),
  KEY `FK_hlw8m8ushj1nwojmnbmkklcja` (`PROJECT_ID`),
  CONSTRAINT `FK_hlw8m8ushj1nwojmnbmkklcja` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_rls4or1b482lf2y8dov82psb6` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_overtime
-- ----------------------------
INSERT INTO `infox_project_overtime` VALUES ('500813', '2014-04-17 11:03:58', null, '0', '0', null, '20', '20', null, '10', '10', '0579', '473394');
INSERT INTO `infox_project_overtime` VALUES ('520540', '2014-04-17 11:04:10', null, '0', '0', null, '25', '25', null, '0', '0', '0793', '473394');
INSERT INTO `infox_project_overtime` VALUES ('565927', '2014-04-17 11:04:56', null, '0', '0', null, '30', '30', null, '10', '10', '0155', '473394');
INSERT INTO `infox_project_overtime` VALUES ('810504', '2014-04-17 11:05:10', null, '0', '0', null, '15', '15', null, '0', '0', '1184', '473394');
INSERT INTO `infox_project_overtime` VALUES ('834779', '2014-04-17 11:04:19', null, '0', '0', null, '5', '5', null, '0', '0', '0670', '473394');

-- ----------------------------
-- Table structure for `infox_project_project`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_project`;
CREATE TABLE `infox_project_project` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `contractNum` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createrId` varchar(255) DEFAULT NULL,
  `createrName` varchar(255) DEFAULT NULL,
  `deptname` varchar(255) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `lastmod` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `projectNum` varchar(255) DEFAULT NULL,
  `project_bjscx` varchar(255) DEFAULT NULL,
  `project_bjzry` varchar(255) DEFAULT NULL,
  `project_buglv` varchar(255) DEFAULT NULL,
  `project_clrl` varchar(255) DEFAULT NULL,
  `project_desc` varchar(255) DEFAULT NULL,
  `project_gm` float DEFAULT NULL,
  `project_manyidu` varchar(255) DEFAULT NULL,
  `project_scx` varchar(255) DEFAULT NULL,
  `project_target` varchar(255) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `project_ydscx` varchar(255) DEFAULT NULL,
  `project_yjtrzry` varchar(255) DEFAULT NULL,
  `quot` float DEFAULT NULL,
  `shouzhu` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `taskScope` varchar(255) DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `DEPT_PID` varchar(255) DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PROJECT_PID` varchar(255) DEFAULT NULL,
  `project_cclrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oc4cyt5xd9fbcqevg6qgleu7u` (`DEPT_PID`),
  KEY `FK_58k8x19mnvcpcr2dbrbenvrnd` (`EMP_ID`),
  KEY `FK_6xotk0sp040j9x9f62gto9jln` (`PROJECT_PID`),
  CONSTRAINT `FK_58k8x19mnvcpcr2dbrbenvrnd` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`),
  CONSTRAINT `FK_6xotk0sp040j9x9f62gto9jln` FOREIGN KEY (`PROJECT_PID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_oc4cyt5xd9fbcqevg6qgleu7u` FOREIGN KEY (`DEPT_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_project
-- ----------------------------
INSERT INTO `infox_project_project` VALUES ('079644', null, '140110-1-1', '2014-04-17 10:38:00', '9999', '超级管理员', null, '2014-01-27 00:00:00', '2014-04-17 10:38:00', 'ADAM機能追加iOS７対応', 'G13BM011', '', '', '', '', null, null, null, null, null, '', '', '', '1', '0', '2013-12-30 00:00:00', '3', '', null, '604742', '1046', null, null);
INSERT INTO `infox_project_project` VALUES ('177998', null, '131104-1-2', '2014-04-16 16:45:12', '9999', '超级管理员', null, '2014-02-13 00:00:00', '2014-04-16 16:45:12', '业务支援', 'G13BM019', '', '', '', '', null, null, null, null, null, '', '', '', '1', '0', '2013-09-22 00:00:00', '3', '', null, '604742', '0803', null, null);
INSERT INTO `infox_project_project` VALUES ('194660', null, '131219-1-1', '2014-04-16 16:38:50', '9999', '超级管理员', null, '2014-01-10 00:00:00', '2014-04-16 16:38:50', 'DLR车辆展示系统', 'G13BM020', '', '', '', '', null, null, null, null, null, '', '', '', '1', '0', '2013-11-15 00:00:00', '3', '', null, '604742', '1223', null, null);
INSERT INTO `infox_project_project` VALUES ('237796', null, '140115-2', '2014-04-17 11:15:16', '9999', '超级管理员', null, '2014-03-31 00:00:00', '2014-04-17 11:15:16', '新MERITS', 'G14HY001', '', '', '', '', null, null, null, null, null, '', '', '', '1', '1', '2014-01-14 00:00:00', '0', '', null, '615802', '0032', null, null);
INSERT INTO `infox_project_project` VALUES ('295928', null, '091118-1-38', '2014-04-16 16:28:32', '9999', '超级管理员', null, '2014-02-26 00:00:00', '2014-04-16 16:28:32', 'ADWORLD農家台帳系统开发', 'G13HY004-4', '', '', '', '', null, null, null, null, null, '', '', '', '1', '1', '2013-12-02 00:00:00', '3', '', null, '528026', '0993', null, null);
INSERT INTO `infox_project_project` VALUES ('396952', null, '130919-1-2', '2014-04-17 08:36:57', '9999', '超级管理员', null, '2014-02-21 00:00:00', '2014-04-17 08:36:57', 'ADWORLD福祉系统开发', 'G13HY003-4', '', '', '', '', null, null, null, null, null, '', '', '', '1', '0', '2013-12-10 00:00:00', '3', '', null, '528026', '0520', null, null);
INSERT INTO `infox_project_project` VALUES ('400494', null, '140210-2-2', '2014-04-30 11:52:30', null, null, null, '2014-08-03 00:00:00', '2014-04-30 11:52:30', '滋賀銀行殿次期為替端末開発', 'G14HY006-C', null, null, null, null, null, '0', null, null, null, null, null, null, '0.5', '0', '2014-05-03 00:00:00', '0', null, null, '649496', '0215', null, null);
INSERT INTO `infox_project_project` VALUES ('473394', null, '130913-1-1', '2014-04-16 17:00:38', '9999', '超级管理员', null, '2014-02-11 00:00:00', '2014-04-16 17:00:38', 'i-CROP再構築', 'G13BM018', '', '', '', '', null, null, null, null, null, '', '', '', '1', '1', '2013-09-03 00:00:00', '3', '', null, '604742', '0155', null, null);
INSERT INTO `infox_project_project` VALUES ('906912', null, '120731-1-14', '2014-04-16 15:09:26', '9999', '超级管理员', null, '2014-02-12 00:00:00', '2014-04-16 15:09:26', 'ADWORLD国民年金系统开发', 'G14HY001-1', '2.2', '6', '0.15', '38', null, '10', null, null, null, '对日长期保守', '1.5', '6', '1', '1', '2013-12-02 00:00:00', '3', '详细设计-CT', null, '528026', '1084', null, null);
INSERT INTO `infox_project_project` VALUES ('907300', null, '120611-1-16', '2014-04-17 08:37:08', '9999', '超级管理员', null, '2014-02-14 00:00:00', '2014-04-17 08:37:08', 'AD機能改善（料金共通）２月', 'G13HY032-4', '2', '4', '0.2', '40', null, '5', null, null, null, '对日长期保守', '1.5', '2', '1', '0', '2013-12-16 00:00:00', '3', 'PG-UT', null, '528026', '0428', null, null);

-- ----------------------------
-- Table structure for `infox_sysmgr_emp`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_emp`;
CREATE TABLE `infox_sysmgr_emp` (
  `id` varchar(255) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `bysj` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `dbmDate` varchar(255) DEFAULT NULL,
  `dbmType` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isLeader` varchar(255) DEFAULT NULL,
  `japanese` varchar(255) DEFAULT NULL,
  `lastmod` datetime DEFAULT NULL,
  `lbmDate` varchar(255) DEFAULT NULL,
  `lbmType` int(11) DEFAULT NULL,
  `modifyer` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `positionDate` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `rzsj` date DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `workStatus` int(11) DEFAULT NULL,
  `ORG_PID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_opvxa3fodnk27n7px66hed13k` (`ORG_PID`),
  CONSTRAINT `FK_opvxa3fodnk27n7px66hed13k` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emp
-- ----------------------------
INSERT INTO `infox_sysmgr_emp` VALUES ('0032', 'suweilai', '2006-07-25', '2014-04-16 15:55:21', null, '', '3', null, 'yanghaoquan@whizen.com', 'Y', '二级', '2014-04-16 15:55:21', '', null, null, null, '', null, '2010-09-26', '男', '0', 'N', null, '苏炜来', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0053', 'Christom', '2006-07-25', '2014-04-16 15:21:33', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 15:21:33', null, null, null, '97443108', null, null, '2010-09-26', '男', '0', 'N', null, '谭建斌', '0', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('0055', 'luowen', '2006-07-10', '2014-04-21 09:22:02', null, '', '3', null, 'yanghaoquan@whizen.com', '', '一级', '2014-04-21 09:22:02', '2014-04-21', '4', null, null, '', null, '2010-09-23', '男', '0', 'N', null, '罗文', '0', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('0098', 'liqinghai', '2006-07-25', '2014-04-16 15:55:42', null, '', '3', null, 'yanghaoquan@whizen.com', 'Y', '一级', '2014-04-16 15:55:42', '', null, null, null, '', null, '2010-09-26', '男', '0', 'N', null, '刘青海', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('0150', 'xuying', '2006-07-25', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 14:37:21', null, null, null, '87492824', null, null, '2010-09-26', '女', '0', 'N', null, '徐滢', '0', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('0155', 'zhuweiyong', '2006-07-25', '2014-04-18 09:18:53', null, '', '3', null, 'yanghaoquan@whizen.com', '', '三级', '2014-04-18 09:18:53', '2014-01-31', '3', null, null, '', null, '2010-09-26', '男', '0', 'N', null, '朱偉勇', '3', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0215', 'xiaojun', '2004-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 14:37:21', null, null, null, '69990653', null, null, '2010-09-22', '男', '0', 'N', null, '肖俊', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0217', 'wangyang', '2006-07-25', '2014-04-17 11:26:33', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-17 11:26:33', null, null, null, '10967916', null, null, '2011-11-18', '男', '0', 'N', null, '汪扬', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('0377', 'liuyuan', '2004-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '74703440', null, null, '2010-09-06', '男', '0', 'N', null, '劉淵', '0', '649496');
INSERT INTO `infox_sysmgr_emp` VALUES ('0428', 'shenhao', '2006-07-24', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 14:37:21', null, null, null, '41457275', null, null, '2010-09-26', '男', '0', 'N', null, '沈浩', '1', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('0452', 'xiayunhuan', '2006-07-25', '2014-04-17 11:26:34', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-17 11:26:34', null, null, null, '56201350', null, null, '2011-11-18', '男', '0', 'N', null, '夏耘寰', '1', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('0453', 'lining', '2006-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '39579622', null, null, '2010-09-09', '男', '0', 'N', null, '李寧', '1', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0498', 'caojuan', '2006-07-10', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '16901939', null, null, '2010-09-02', '女', '0', 'N', null, '曹娟', '1', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('0520', 'yanghui', '2006-07-25', '2014-04-16 15:31:47', null, '', '3', null, 'yanghaoquan@whizen.com', '', '二级', '2014-04-16 15:31:47', '', null, null, null, '', '岗位变更历史[变更前岗位：高级程序员    变更后岗位：系统工程师    实施日期：],', '2010-09-26', '女', '0', 'N', null, '楊輝', '1', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('0579', 'houxiaohui', '2006-07-10', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:37:21', null, null, null, '10764367', null, null, '2010-09-25', '女', '0', 'N', null, '侯小惠', '1', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0583', 'chenshunyin', '2006-07-25', '2014-04-16 14:54:48', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:54:48', null, null, null, '83603725', null, null, '2010-09-26', '男', '0', 'N', null, '陈舜殷', '1', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('0621', 'zouzhiwei', '1998-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:37:21', null, null, null, '91733278', null, null, '2010-09-19', '男', '0', 'N', null, '邹志伟', '1', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('0669', 'huangjiakui', '2006-07-25', '2014-04-16 14:54:48', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:54:48', null, null, null, '97664067', null, null, '2010-09-26', '男', '0', 'N', null, '黄加魁', '1', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('0670', 'huanglindi', '2006-07-25', '2014-04-16 14:54:48', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:54:48', null, null, null, '18707794', null, null, '2010-09-26', '男', '0', 'N', null, '黄林娣', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0748', 'chengpeng', '2006-07-25', '2014-04-17 10:29:16', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-17 10:29:16', null, null, null, '40680603', null, null, '2010-09-26', '男', '0', 'N', null, '程鹏', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('0753', 'pengyao', '2006-07-25', '2014-04-17 10:29:16', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-17 10:29:16', null, null, null, '28218680', null, null, '2010-09-26', '男', '0', 'N', null, '彭尧', '0', '009014');
INSERT INTO `infox_sysmgr_emp` VALUES ('0793', 'luoqiyu', '2006-07-25', '2014-04-16 14:54:48', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:54:48', null, null, null, '49968303', null, null, '2010-09-26', '男', '0', 'N', null, '罗奇郁', '0', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('0803', 'yaolihua', '2006-07-25', '2014-04-16 14:54:48', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:54:48', null, null, null, '98911048', null, null, '2010-09-26', '女', '0', 'N', null, '姚利花', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('0817', 'lichao', '2006-07-25', '2014-04-16 15:55:31', null, '', '3', null, 'yanghaoquan@whizen.com', 'Y', '一级', '2014-04-16 15:55:31', '', null, null, null, '', null, '2010-09-26', '男', '0', 'N', null, '李超', '0', '649496');
INSERT INTO `infox_sysmgr_emp` VALUES ('0860', 'xiongliuhua', '2003-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '46480870', null, null, '2010-09-04', '女', '0', 'N', null, '熊柳華', '0', '166101');
INSERT INTO `infox_sysmgr_emp` VALUES ('0866', 'fengying', '2006-07-25', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '15441146', null, null, '2010-09-26', '女', '0', 'N', null, '馮瑛', '0', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('0868', 'huangyong0868', '1999-07-31', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '40536599', null, null, '2010-09-03', '男', '0', 'N', null, '黄勇', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0876', 'laohanye', '2009-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 14:37:21', null, null, null, '94493052', null, null, '2010-09-07', '男', '0', 'N', null, '労漢業', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0883', 'heweixin', '2006-07-18', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '70752315', null, null, '2010-09-15', '男', '0', 'N', null, '何伟新', '0', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('0920', 'lukui', '2004-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '34405509', null, null, '2010-09-08', '男', '0', 'N', null, '陸魁', '0', '166101');
INSERT INTO `infox_sysmgr_emp` VALUES ('0931', 'wangliping', '1999-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '48417179', null, null, '2008-09-01', '女', '0', 'N', null, '汪麗平', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0950', 'zhouyi', '1991-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '63036251', null, null, '2010-09-14', '男', '0', 'N', null, '周意', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0974', 'yangzuxia', '2003-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '89645186', null, null, '2010-09-11', '女', '0', 'N', null, '杨足霞', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0993', 'xiaoweihua', '2006-07-21', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '36896407', null, null, '2010-09-26', '男', '0', 'N', null, '肖衛華', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1004', 'lizhiyong', '2005-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '89670999', null, null, '2010-09-05', '男', '0', 'N', null, '李智勇', '0', '166101');
INSERT INTO `infox_sysmgr_emp` VALUES ('1028', 'chenzhenrui', '2006-07-25', '2014-04-17 10:29:16', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-17 10:29:16', null, null, null, '89025931', null, null, '2010-09-26', '男', '0', 'N', null, '陈振锐', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('1046', 'cenlijian', '2006-07-25', '2014-04-17 10:35:58', null, null, '3', null, 'yanghaoquan@whizen.com', null, '', '2014-04-17 10:35:58', null, null, null, '82888065', null, null, '2011-11-18', '男', '0', 'N', null, '岑礼健', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('1060', 'zhangjushuang', '2006-07-22', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '98255609', null, null, '2010-09-26', '男', '0', 'N', null, '張居爽', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1071', 'liuweijuan', '2006-07-14', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '64636537', null, null, '2011-09-26', '女', '0', 'N', null, '劉偉絹', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1074', 'hushanshan', '2006-07-17', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '87695075', null, null, '2011-09-26', '女', '0', 'N', null, '胡珊瑚', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1082', 'zhouyaogao', '2006-07-13', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '47320548', null, null, '2010-09-26', '男', '0', 'N', null, '周耀高', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1084', 'yexiaomeng', '2006-07-11', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 14:37:21', null, null, null, '41522441', null, null, '2010-09-26', '女', '0', 'N', null, '葉暁夢', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1099', 'yeqintai', '2006-07-23', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:37:21', null, null, null, '07499195', null, null, '2010-09-26', '男', '0', 'N', null, '葉秦泰', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1112', 'linkenghong', '1998-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '07999060', null, null, '2010-09-20', '男', '0', 'N', null, '林铿鸿', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('1145', 'yinzhilan', '2006-07-15', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '20252271', null, null, '2011-09-26', '女', '0', 'N', null, '尹芝蘭', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1149', 'zouguangchu', '2006-07-25', '2014-04-17 11:26:33', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-17 11:26:33', null, null, null, '43680809', null, null, '2011-11-18', '男', '0', 'N', null, '邹广初', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('1150', 'wengkaikeng', '2006-07-25', '2014-04-17 11:26:34', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-17 11:26:34', null, null, null, '47968364', null, null, '2011-11-18', '男', '0', 'N', null, '翁开铿', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('1151', 'liangcuilong', '2004-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '09226908', null, null, '2010-09-18', '男', '0', 'N', null, '梁翠龙', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('1156', 'huangsen', '2006-07-25', '2014-04-17 11:26:34', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-17 11:26:34', null, null, null, '77644110', null, null, '2011-11-18', '男', '0', 'N', null, '黄森', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('1158', 'lizhengzong', '2006-07-25', '2014-04-16 14:54:48', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:54:48', null, null, null, '66383516', null, null, '2010-09-26', '男', '0', 'N', null, '李正宗', '0', '812076');
INSERT INTO `infox_sysmgr_emp` VALUES ('1174', 'liujurong', '2004-07-17', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '57180533', null, null, '2010-09-16', '女', '0', 'N', null, '刘菊容', '0', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('1179', 'zhouwei', '2006-07-16', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '99694976', null, null, '2011-09-26', '女', '0', 'N', null, '周蔚', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1184', 'yuanxiaoli', '2006-07-10', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '16507223', null, null, '2010-09-24', '女', '0', 'N', null, '袁小利', '0', '812076');
INSERT INTO `infox_sysmgr_emp` VALUES ('1186', 'heyunwen', '2006-06-30', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '86379760', null, null, '2010-09-10', '女', '0', 'N', null, '何云文', '0', '812076');
INSERT INTO `infox_sysmgr_emp` VALUES ('1191', 'liuhui', '1988-06-29', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '62075452', null, null, '2010-09-21', '女', '0', 'N', null, '刘慧', '0', '812076');
INSERT INTO `infox_sysmgr_emp` VALUES ('1192', 'xuxiaoshuang', '1991-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '31836725', null, null, '2010-09-17', '男', '0', 'N', null, '许小双', '0', '812076');
INSERT INTO `infox_sysmgr_emp` VALUES ('1193', 'ganjiamei', '2001-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '92264311', null, null, '2010-09-13', '女', '0', 'N', null, '甘佳美', '0', '812076');
INSERT INTO `infox_sysmgr_emp` VALUES ('1211', 'xiebei', '2006-07-25', '2014-04-16 15:21:33', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 15:21:33', null, null, null, '77419684', null, null, '2010-09-26', '女', '0', 'N', null, '谢贝', '0', '097175');
INSERT INTO `infox_sysmgr_emp` VALUES ('1212', 'chenjialiang', '2006-07-25', '2014-04-16 14:54:48', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:54:48', null, null, null, '50526983', null, null, '2010-09-26', '男', '0', 'N', null, '陈嘉亮', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('1220', 'lvjieqiang', '2006-07-20', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '26862613', null, null, '2010-09-26', '男', '0', 'N', null, '呂傑強', '0', '649496');
INSERT INTO `infox_sysmgr_emp` VALUES ('1223', 'zhangguofu', '2006-07-25', '2014-04-16 15:21:33', null, null, '3', null, 'yanghaoquan@whizen.com', null, '二级', '2014-04-16 15:21:33', null, null, null, '09823094', null, null, '2010-09-26', '男', '0', 'N', null, '张国富', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('1234', 'fangjinｇtao', '2006-07-12', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '30220042', null, null, '2010-09-26', '男', '0', 'N', null, '方敬濤', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1236', 'tangxingxing', '2006-07-25', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:37:21', null, null, null, '61928015', null, null, '2010-09-26', '男', '0', 'N', null, '唐星星', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1237', 'mingxuanyu', '2006-07-25', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-16 14:37:21', null, null, null, '49625622', null, null, '2010-09-26', '男', '0', 'N', null, '明玄宇', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1255', 'pengjianwei', '2006-07-18', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:37:21', null, null, null, '38217393', null, null, '2013-09-26', '男', '0', 'N', null, '彭建威', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1275', 'xiemeifang', '2006-07-25', '2014-04-17 11:26:33', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-04-17 11:26:33', null, null, null, '37560793', null, null, '2011-11-18', '女', '0', 'N', null, '谢美芳', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('1276', 'chenxiang', '2006-07-01', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '一级', '2014-04-16 14:37:21', null, null, null, '01446136', null, null, '2010-09-12', '女', '0', 'N', null, '陈香', '0', '649496');
INSERT INTO `infox_sysmgr_emp` VALUES ('1287', 'jiangjunqiang', '2006-07-19', '2014-04-16 14:37:21', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-16 14:37:21', null, null, null, '13803514', null, null, '2013-09-26', '男', '0', 'N', null, '蒋俊強', '0', '528026');
INSERT INTO `infox_sysmgr_emp` VALUES ('1296', 'luoshuming', '2006-07-25', '2014-04-17 10:29:16', null, null, '3', null, 'yanghaoquan@whizen.com', null, '四级', '2014-04-17 10:29:16', null, null, null, '57546681', null, null, '2010-09-26', '男', '0', 'N', null, '骆树明', '0', '604742');
INSERT INTO `infox_sysmgr_emp` VALUES ('9999', 'admin', null, null, null, null, null, null, 'yanghaoquan@whizen.com', null, null, null, null, null, null, '12345678', null, null, null, null, null, 'Y', null, '超级管理员', '9999', null);

-- ----------------------------
-- Table structure for `infox_sysmgr_empjob`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_empjob`;
CREATE TABLE `infox_sysmgr_empjob` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_level` varchar(255) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `job_sname` varchar(255) DEFAULT NULL,
  `EMPJOB_PID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5p57rxyf89nxjp7nth1v9ji91` (`EMPJOB_PID`),
  CONSTRAINT `FK_5p57rxyf89nxjp7nth1v9ji91` FOREIGN KEY (`EMPJOB_PID`) REFERENCES `infox_sysmgr_empjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_empjob
-- ----------------------------
INSERT INTO `infox_sysmgr_empjob` VALUES ('059294', '2014-04-03 13:39:02', '', 'L8', '副技术总监', '副总监', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('084650', '2014-04-03 13:39:47', '', 'L1', '质量保证员', 'SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('108539', '2014-04-03 13:37:46', '', 'L6', '开发部主管', '科长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('200454', '2014-04-03 13:38:36', '', 'L7', '开发部经理', '部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('219377', '2014-04-03 13:40:44', '', 'L9', '品质部部长', '部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('222368', '2014-04-03 13:37:11', '', 'L5', '主管系统工程师', '主管SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('364361', '2014-04-03 13:35:21', '', 'L16', '高级系统工程师', '高级SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('366186', '2014-04-03 13:32:57', '', 'L16', '开发本部长', '本部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('436803', '2014-04-03 13:36:38', '', 'L4', '系统工程师', 'SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('575853', '2014-04-03 13:36:07', '', 'L3', '高级程序员', '高级PG', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('591380', '2014-04-03 13:32:25', '', 'L15', '开发部部长', '部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('791596', '2014-04-03 13:35:41', '', 'L2', '程序员', 'PG', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('938396', '2014-04-03 13:39:22', '', 'L17', '总经理', '总裁', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('998481', '2014-04-03 13:40:18', '', 'L2', '中级质量保证员', '中级SQA', null);

-- ----------------------------
-- Table structure for `infox_sysmgr_emponline`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_emponline`;
CREATE TABLE `infox_sysmgr_emponline` (
  `id` varchar(255) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `empid` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `logindate` datetime DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emponline
-- ----------------------------
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448619be01448619be0b0000', 'admin', '000000', '本地', '2014-03-03 12:00:37', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486c13a014486c13af80000', 'admin', '0000', '本地', '2014-03-03 15:03:34', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486c643014486c643160000', 'admin', '9999', '本地', '2014-03-03 15:09:04', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486c643014486dc0a0f0001', 'admin', '9999', '本地', '2014-03-03 15:32:51', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486c643014486dc5adb0002', 'admin', '9999', '本地', '2014-03-03 15:33:12', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486f19d014486f19d190000', 'admin', '9999', '本地', '2014-03-03 15:56:25', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486f19d01448717a5e80001', 'admin', '9999', '192.168.1.7', '2014-03-03 16:37:57', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486f19d0144872212a80002', 'admin', '9999', '本地', '2014-03-03 16:49:21', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824486f19d0144872c27100003', 'admin', '9999', '192.168.1.7', '2014-03-03 17:00:21', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824487cec7014487cec74d0000', 'admin', '9999', '本地', '2014-03-03 19:57:59', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881824487e781014487e781690000', 'admin', '9999', '本地', '2014-03-03 20:24:59', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818244888bda0144888bda890000', 'admin', '9999', '本地', '2014-03-03 23:24:30', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448abdd401448abdd4160000', 'admin', '9999', '本地', '2014-03-04 09:38:20', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448ac6f2ae0000', 'admin', '9999', '本地', '2014-03-04 09:48:17', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448ae6e1350001', 'admin', '9999', '本地', '2014-03-04 10:23:10', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448af170db0002', 'admin', '9999', '本地', '2014-03-04 10:34:42', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448afb1cab0003', 'admin', '9999', '本地', '2014-03-04 10:45:16', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448afb25200004', 'admin', '9999', '本地', '2014-03-04 10:45:18', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448b0cc9ea0005', 'admin', '9999', '本地', '2014-03-04 11:04:35', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448b18d7530007', 'admin', '9999', '本地', '2014-03-04 11:17:44', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ac6f201448b2b2a740008', 'admin', '9999', '本地', '2014-03-04 11:37:45', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448b7c4001448b7c40410000', 'admin', '9999', '本地', '2014-03-04 13:06:19', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448b7c4001448b8fa3080001', 'admin', '9999', '本地', '2014-03-04 13:27:30', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448b7c4001448bca1b9b0002', 'admin', '9999', '本地', '2014-03-04 14:31:22', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448bce3301448bce330b0000', 'admin', '9999', '本地', '2014-03-04 14:35:50', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448bce3301448bf1cf1c0007', 'admin', '9999', '本地', '2014-03-04 15:14:44', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448bce3301448bf7b5a30008', 'admin', '9999', '本地', '2014-03-04 15:21:10', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c05ec01448c05ec9c0000', 'admin', '9999', '本地', '2014-03-04 15:36:42', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c1a4801448c1a488d0000', 'admin', '9999', '本地', '2014-03-04 15:58:56', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c1e4101448c1e41e30000', 'admin', '9999', '本地', '2014-03-04 16:03:17', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c388301448c38833b0000', 'admin', '9999', '本地', '2014-03-04 16:31:57', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c524101448c5241e70000', 'admin', '9999', '本地', '2014-03-04 17:00:04', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c70c001448c70c0960000', 'admin', '9999', '本地', '2014-03-04 17:33:23', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c72ae01448c72ae280000', 'admin', '9999', '本地', '2014-03-04 17:35:29', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c744301448c7443b70000', 'admin', '9999', '本地', '2014-03-04 17:37:13', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c775d01448c775dbb0000', 'admin', '9999', '本地', '2014-03-04 17:40:36', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c7ce901448c7ce9620000', 'admin', '9999', '本地', '2014-03-04 17:46:40', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c7df401448c7df4970000', 'admin', '9999', '本地', '2014-03-04 17:47:48', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c7fc201448c7fc2130000', 'admin', '9999', '本地', '2014-03-04 17:49:46', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c927b01448c927bb70000', 'admin', '9999', '本地', '2014-03-04 18:10:14', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448c9c3801448c9c384f0000', 'admin', '9999', '本地', '2014-03-04 18:20:52', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ca5e701448ca5e7300000', 'admin', '9999', '本地', '2014-03-04 18:31:26', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448caf0301448caf03d70000', 'admin', '9999', '本地', '2014-03-04 18:41:23', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448cb21d01448cb21d1b0000', 'admin', '9999', '本地', '2014-03-04 18:44:46', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448cc73d01448cc73dcf0000', 'admin', '9999', '本地', '2014-03-04 19:07:51', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448ccd6a01448ccd6a440000', 'admin', '9999', '本地', '2014-03-04 19:14:36', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448cdaa601448cdaa6730000', 'admin', '9999', '本地', '2014-03-04 19:29:03', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448cdaa601448d1608f20013', 'admin', '9999', '本地', '2014-03-04 20:33:55', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448cdaa601448d2a27d60014', 'admin', '9999', '本地', '2014-03-04 20:55:54', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448d3b6c01448d3b6c6e0000', 'admin', '9999', '本地', '2014-03-04 21:14:45', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288182448d59db01448d59db4a0000', 'admin', '9999', '本地', '2014-03-04 21:48:00', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854490ae5c014490ae5c4d0000', 'admin', '9999', '127.0.0.1', '2014-03-05 13:19:09', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854490c782014490c782ff0000', 'admin', '9999', '127.0.0.1', '2014-03-05 13:46:38', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854490c782014490dc52b60007', 'admin', '9999', '127.0.0.1', '2014-03-05 14:09:22', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854490c782014491d3ceed0008', 'admin', '9999', '127.0.0.1', '2014-03-05 18:39:41', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854491d6a0014491d6a0c70000', 'admin', '9999', '127.0.0.1', '2014-03-05 18:42:46', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854491d6a0014491f583c2000b', 'admin', '9999', '127.0.0.1', '2014-03-05 19:16:30', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854492969c014492969c360000', 'admin', '9999', '127.0.0.1', '2014-03-05 22:12:27', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854492969c014492d8112e0003', 'admin', '9999', '127.0.0.1', '2014-03-05 23:23:57', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854492969c014492f17eb00004', 'admin', '9999', '127.0.0.1', '2014-03-05 23:51:44', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854492fe6b014492fe6b4c0000', 'admin', '9999', '127.0.0.1', '2014-03-06 00:05:51', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449311ae01449311ae7d0000', 'admin', '9999', '127.0.0.1', '2014-03-06 00:26:53', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449315ae01449315ae900000', 'admin', '9999', '127.0.0.1', '2014-03-06 00:31:15', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449328f801449328f88b0000', 'admin', '9999', '127.0.0.1', '2014-03-06 00:52:19', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544932cd50144932cd54c0000', 'admin', '9999', '127.0.0.1', '2014-03-06 00:56:32', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854493520c014493520c6f0000', 'admin', '9999', '127.0.0.1', '2014-03-06 01:37:11', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854495161e014495161ed30000', 'admin', '9999', '127.0.0.1', '2014-03-06 09:50:58', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854495161e014495a05dc20028', 'admin', '9999', '127.0.0.1', '2014-03-06 12:21:58', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854495161e014495a709e90029', 'admin', '9999', '127.0.0.1', '2014-03-06 12:29:16', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('402881854495cd38014495cd38b10000', 'admin', '9999', '127.0.0.1', '2014-03-06 13:10:58', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449b42b401449b42b4900000', 'admin', '9999', '127.0.0.1', '2014-03-07 14:37:23', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449b42b401449b659ae80001', 'admin', '9999', '127.0.0.1', '2014-03-07 15:15:31', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449b68c701449b68c7f80000', 'admin', '9999', '127.0.0.1', '2014-03-07 15:18:59', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449b8ee801449b8ee82f0000', 'admin', '9999', '127.0.0.1', '2014-03-07 16:00:37', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449b9e7201449b9e724a0000', 'admin', '9999', '127.0.0.1', '2014-03-07 16:17:36', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449bb25e01449bb25e410000', 'admin', '9999', '127.0.0.1', '2014-03-07 16:39:21', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449bfadc01449bfadca40000', 'admin', '9999', '127.0.0.1', '2014-03-07 17:58:32', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449bfadc01449c1f8e360001', 'admin', '9999', '127.0.0.1', '2014-03-07 18:38:37', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449bfadc01449ca930390002', 'admin', '9999', '127.0.0.1', '2014-03-07 21:08:57', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449cdc2601449cdc26e10000', 'admin', '9999', '127.0.0.1', '2014-03-07 22:04:37', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449cea1801449cea18090000', 'admin', '9999', '127.0.0.1', '2014-03-07 22:19:51', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449cfcdc01449cfcdc6c0000', 'admin', '9999', '127.0.0.1', '2014-03-07 22:40:21', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288185449d31e201449d31e2620000', 'admin', '9999', '127.0.0.1', '2014-03-07 23:38:16', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a464030144a464038e0000', 'admin', '9999', '127.0.0.1', '2014-03-09 09:10:21', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a46f2d0144a46f2da80000', 'admin', '9999', '127.0.0.1', '2014-03-09 09:22:33', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a46f2d0144a483df8e0001', 'admin', '9999', '127.0.0.1', '2014-03-09 09:45:09', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a46f2d0144a541a6850002', 'admin', '9999', '127.0.0.1', '2014-03-09 13:12:27', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a46f2d0144a5427dc90003', 'admin', '9999', '127.0.0.1', '2014-03-09 13:13:22', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a46f2d0144a5428a7e0004', 'admin', '9999', '127.0.0.1', '2014-03-09 13:13:25', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a46f2d0144a5559a120005', 'admin', '9999', '127.0.0.1', '2014-03-09 13:34:14', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a59eb00144a59eb0900000', 'admin', '9999', '127.0.0.1', '2014-03-09 14:54:04', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a5a8940144a5a894940000', 'admin', '9999', '127.0.0.1', '2014-03-09 15:04:52', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a5af160144a5af16910000', 'admin', '9999', '127.0.0.1', '2014-03-09 15:11:59', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a5bc320144a5bc32bf0000', 'admin', '9999', '127.0.0.1', '2014-03-09 15:26:18', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a5bc320144a5d871500001', 'admin', '9999', '127.0.0.1', '2014-03-09 15:57:09', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028818544a5bc320144a5df0aa60002', 'admin', '9999', '127.0.0.1', '2014-03-09 16:04:21', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aece4d0144aece4d870000', 'admin', '9999', '192.168.2.206', '2014-03-11 09:42:39', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed2900144aed290410000', 'admin', '9999', '192.168.4.3', '2014-03-11 09:47:18', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aed581b10000', 'admin', '9999', '192.168.4.3', '2014-03-11 09:50:31', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aed6732c0001', 'admin', '9999', '192.168.4.3', '2014-03-11 09:51:33', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aed83f420002', 'admin', '9999', '192.168.4.3', '2014-03-11 09:53:31', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aedaf2f80003', 'admin', '9999', '192.168.4.55', '2014-03-11 09:56:28', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aee893f50004', 'admin', '9999', '192.168.4.3', '2014-03-11 10:11:21', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aee97f010005', 'admin', '9999', '192.168.4.3', '2014-03-11 10:12:21', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aeeb53d00006', 'admin', '9999', '192.168.4.3', '2014-03-11 10:14:21', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144aeefe7bd0007', 'admin', '9999', '192.168.4.55', '2014-03-11 10:19:21', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144af5325fa0008', 'admin', '9999', '192.168.4.3', '2014-03-11 12:07:45', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144af6601a10009', 'admin', '9999', '192.168.4.3', '2014-03-11 12:28:21', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144af8bfc2a000a', 'admin', '9999', '192.168.4.55', '2014-03-11 13:09:50', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b018ac6b001b', 'admin', '9999', '192.168.4.55', '2014-03-11 15:43:30', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b3ab0c9e001c', 'admin', '9999', '192.168.4.55', '2014-03-12 08:22:15', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b3da425b0021', 'admin', '9999', '192.168.4.55', '2014-03-12 09:13:49', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b4a064780022', 'admin', '9999', '192.168.4.3', '2014-03-12 12:50:14', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b4b33f480023', 'admin', '9999', '192.168.4.3', '2014-03-12 13:10:49', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b50561f10024', 'admin', '9999', '192.168.4.55', '2014-03-12 14:40:32', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b52c1ad1002d', 'admin', '9999', '192.168.4.55', '2014-03-12 15:22:50', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b54a970c002e', 'admin', '9999', '192.168.4.55', '2014-03-12 15:56:08', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b566c933002f', 'admin', '9999', '192.168.4.55', '2014-03-12 16:26:56', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b91953590030', 'admin', '9999', '192.168.4.55', '2014-03-13 09:40:48', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b92f60360031', 'admin', '9999', '192.168.4.55', '2014-03-13 10:04:53', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b930704e0032', 'admin', '9999', '192.168.4.55', '2014-03-13 10:06:03', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028824e44aed5810144b9649fa70033', 'admin', '9999', '192.168.4.55', '2014-03-13 11:03:03', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483448561c401448561c4ac0000', 'admin', '000000', '本地', '2014-03-03 08:39:40', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483448567520144856752790000', 'admin', '000000', '本地', '2014-03-03 08:45:44', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483448575ba01448575ba5e0000', 'admin', '000000', '本地', '2014-03-03 09:01:29', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a171b01449a171bc90000', 'admin', '9999', '本地', '2014-03-07 09:10:09', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a171b01449a1b49820001', 'admin', '9999', '本地', '2014-03-07 09:14:43', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a171b01449a1b8fbe0002', 'admin', '9999', '本地', '2014-03-07 09:15:01', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a171b01449a1dd0a10003', 'admin', '9999', '192.168.4.55', '2014-03-07 09:17:29', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a171b01449a2f69040004', 'admin', '9999', '本地', '2014-03-07 09:36:42', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a171b01449a3ba8c80005', 'admin', '9999', '本地', '2014-03-07 09:50:05', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a48d101449a48d1ca0000', 'admin', '9999', '本地', '2014-03-07 10:04:27', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a48d101449a4b022c0001', 'admin', '9999', '192.168.4.55', '2014-03-07 10:06:50', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a48d101449a5b800d0002', 'admin', '9999', '192.168.4.55', '2014-03-07 10:24:51', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a48d101449a6b2abc0003', 'admin', '9999', '192.168.4.55', '2014-03-07 10:41:58', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a48d101449a753d340004', 'admin', '9999', '192.168.4.55', '2014-03-07 10:52:58', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a48d101449a83e6c10005', 'admin', '9999', '192.168.4.55', '2014-03-07 11:08:59', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449a48d101449a9ad6d90006', 'admin', '9999', '192.168.4.55', '2014-03-07 11:34:02', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449aa34701449aa347b00000', 'admin', '9999', '本地', '2014-03-07 11:43:15', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449aa34701449aa56c9b0001', 'admin', '9999', '192.168.4.55', '2014-03-07 11:45:36', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483449aa34701449aafbf9a0002', 'admin', '9999', '192.168.4.55', '2014-03-07 11:56:53', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a96b2f0144a96b2fef0000', 'admin', '9999', '本地', '2014-03-10 08:36:18', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9a8420144a9a842df0000', 'admin', '9999', '192.168.4.55', '2014-03-10 09:43:00', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9a8420144a9a86ce40001', 'admin', '9999', '本地', '2014-03-10 09:43:11', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9bebb0144a9bebb430000', 'admin', '9999', '本地', '2014-03-10 10:07:33', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9bebb0144a9cd93360001', 'admin', '9999', '192.168.4.55', '2014-03-10 10:23:45', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9bebb0144a9d380080006', 'admin', '9999', '本地', '2014-03-10 10:30:14', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9bebb0144a9d3a52b0007', 'admin', '9999', '本地', '2014-03-10 10:30:23', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9d9110144a9d911f90000', 'admin', '9999', '192.168.4.55', '2014-03-10 10:36:19', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9d9110144a9d953250001', 'admin', '9999', '本地', '2014-03-10 10:36:36', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9ea590144a9ea59fb0000', 'admin', '9999', '192.168.4.55', '2014-03-10 10:55:11', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9ea590144a9eacd850001', 'admin', '9999', '本地', '2014-03-10 10:55:41', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9fe160144a9fe16d60000', 'admin', '9999', '192.168.4.55', '2014-03-10 11:16:45', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344a9fe160144a9fe24700001', 'admin', '9999', '本地', '2014-03-10 11:16:48', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa18e80144aa18e83a0000', 'admin', '9999', '本地', '2014-03-10 11:46:02', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa18e80144aa20b9810001', 'admin', '9999', '192.168.4.55', '2014-03-10 11:54:35', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa18e80144aa393e680002', 'admin', '9999', '本地', '2014-03-10 12:21:22', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa18e80144aa3fa8490003', 'admin', '9999', '192.168.4.55', '2014-03-10 12:28:22', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa18e80144aa4312250004', 'admin', '9999', '本地', '2014-03-10 12:32:06', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa4bf80144aa4bf80f0000', 'admin', '9999', '本地', '2014-03-10 12:41:49', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa5fcf0144aa5fcf5f0000', 'admin', '9999', '本地', '2014-03-10 13:03:29', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa5fcf0144aa70e9000001', 'admin', '9999', '192.168.4.55', '2014-03-10 13:22:10', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa5fcf0144aa865e370002', 'admin', '9999', '192.168.4.55', '2014-03-10 13:45:36', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa5fcf0144aa90fe230003', 'admin', '9999', '192.168.4.55', '2014-03-10 13:57:12', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa5fcf0144aa9598ce0004', 'admin', '9999', '本地', '2014-03-10 14:02:14', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aa5fcf0144aa9a2f830005', 'admin', '9999', '192.168.4.55', '2014-03-10 14:07:15', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344aaa0ac0144aaa0ac700000', 'admin', '9999', '本地', '2014-03-10 14:14:20', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344ae96540144ae9654580000', 'admin', '9999', '192.168.4.55', '2014-03-11 08:41:31', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344ae96540144ae9b808d0001', 'admin', '9999', '本地', '2014-03-11 08:47:10', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344ae96540144ae9f88e10006', 'admin', '9999', '本地', '2014-03-11 08:51:34', '超级管理员', '0');
INSERT INTO `infox_sysmgr_emponline` VALUES ('4028848344ae96540144ae9f98770007', 'admin', '9999', '本地', '2014-03-11 08:51:38', '超级管理员', '1');

-- ----------------------------
-- Table structure for `infox_sysmgr_emp_job`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_emp_job`;
CREATE TABLE `infox_sysmgr_emp_job` (
  `EMP_ID` varchar(255) NOT NULL,
  `EMPJOB_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`EMPJOB_ID`,`EMP_ID`),
  KEY `FK_k2fo4944xu48gacxmu3qgvhbm` (`EMPJOB_ID`),
  KEY `FK_cw1g9olayto42fsgmr48gtkoe` (`EMP_ID`),
  CONSTRAINT `FK_cw1g9olayto42fsgmr48gtkoe` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`),
  CONSTRAINT `FK_k2fo4944xu48gacxmu3qgvhbm` FOREIGN KEY (`EMPJOB_ID`) REFERENCES `infox_sysmgr_empjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emp_job
-- ----------------------------
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0032', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0098', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0817', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0053', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0150', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0155', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0215', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0217', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0377', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0428', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0583', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0860', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0868', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0883', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1004', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1046', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1084', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1223', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0055', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0803', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0452', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0498', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0520', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0579', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0866', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0876', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0931', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0993', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1028', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1060', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1237', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0453', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0621', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0669', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0670', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0748', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1071', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1074', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1082', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1099', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1145', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1150', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1156', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1158', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1179', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1220', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1234', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1236', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0753', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0793', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0920', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0950', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0974', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1112', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1149', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1151', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1174', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1184', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1186', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1191', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1192', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1193', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1211', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1212', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1255', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1275', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1276', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1287', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1296', '791596');

-- ----------------------------
-- Table structure for `infox_sysmgr_emp_role`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_emp_role`;
CREATE TABLE `infox_sysmgr_emp_role` (
  `ROLE_ID` varchar(255) NOT NULL,
  `EMP_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`EMP_ID`,`ROLE_ID`),
  KEY `FK_pify6eihswsjuu01h11t73pne` (`EMP_ID`),
  KEY `FK_7kd34vi37djno3on1d4hhs106` (`ROLE_ID`),
  CONSTRAINT `FK_7kd34vi37djno3on1d4hhs106` FOREIGN KEY (`ROLE_ID`) REFERENCES `infox_sysmgr_role` (`id`),
  CONSTRAINT `FK_pify6eihswsjuu01h11t73pne` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emp_role
-- ----------------------------

-- ----------------------------
-- Table structure for `infox_sysmgr_menu`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_menu`;
CREATE TABLE `infox_sysmgr_menu` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `lastmod` datetime DEFAULT NULL,
  `modifyer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `MENU_PID` varchar(255) DEFAULT NULL,
  `disused` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9A08259E4480AEC6` (`MENU_PID`),
  CONSTRAINT `FK9A08259E4480AEC6` FOREIGN KEY (`MENU_PID`) REFERENCES `infox_sysmgr_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_menu
-- ----------------------------
INSERT INTO `infox_sysmgr_menu` VALUES ('068671', null, '2014-02-13 10:39:25', null, 'sysmgr/employee/emp_grant_main.do', 'icon-standard-arrow-undo', '2014-02-13 10:39:25', null, '用户授权', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('134095', null, '2014-02-25 19:14:05', null, '', 'icon-standard-bricks', '2014-02-25 19:14:05', null, '项目管理', '1', null, null, 'R', null, 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('136992', null, '2014-02-17 23:03:40', null, 'sysmgr/data/data_main.do', 'icon-standard-database-save', '2014-02-17 23:03:40', null, '数据备份', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('186776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/set_projectRole.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发人员项目角色操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('200025', null, '2014-02-13 10:31:53', null, 'sysmgr/task/task_main.do', 'icon-standard-clock-red', '2014-02-13 10:31:53', null, '定时作业', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('229865', null, '2014-03-07 15:21:36', null, 'sysmgr/org/org_main.do', 'icon-standard-chart-organisation', '2014-03-07 15:21:36', null, '公司部门', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('361454', null, '2014-02-25 19:14:27', null, 'project/project_main/project_main.do', 'icon-standard-application-side-expand', '2014-02-25 19:14:27', null, '项目管理', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('502906', null, '2014-03-07 10:40:32', null, 'project/project_report/project_tasktime_main.do', 'icon-standard-chart-pie', '2014-03-07 10:40:32', null, '稼动率管理', '0', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('527852', null, '2014-03-07 15:21:26', null, 'sysmgr/empjob/empjob_main.do', 'icon-standard-user-red', '2014-03-07 15:21:26', null, '公司岗位', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('547345', null, '2014-02-22 00:50:30', null, 'sysmgr/employee/emp_main.do', 'icon-hamburg-my-account', '2014-02-22 00:50:30', null, '员工管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('675303', null, '2014-02-18 14:50:50', null, 'sysmgr/filemanager/file_main.do', 'icon-standard-folder-database', '2014-02-18 14:50:50', null, '文件管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('716776', null, '2014-03-24 16:03:50', null, 'project/project_main/addMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('726776', null, '2014-03-24 16:03:50', null, 'project/project_main/deleteMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('736776', null, '2014-03-24 16:03:50', null, 'project/overtime/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('746776', null, '2014-03-24 16:03:50', null, 'project/overtime/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('756776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('766776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/revert.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '移除开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('776776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/set_workdate.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发人员起止日期操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('781776', null, '2014-03-24 16:03:50', null, 'roject/project_main/project_detail.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询详细', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('782776', null, '2014-03-24 16:03:50', null, 'roject/project_main/project_member.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发团队人员页面', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('783776', null, '2014-03-24 16:03:50', null, 'roject/project_main/project_Devdetail.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '开发人员详细列表', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('784776', null, '2014-03-24 16:03:50', null, 'roject/project_main/project_maillist.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '项目参与人员邮件列表', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785716', null, '2014-03-24 16:03:50', null, 'sysmgr/menu/menu_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单页面', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785717', null, '2014-03-24 16:03:50', null, 'sysmgr/menu/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785718', null, '2014-03-24 16:03:50', null, 'sysmgr/menu/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785729', null, '2014-03-24 16:03:50', null, 'sysmgr/menu/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785731', null, '2014-03-24 16:03:50', null, 'sysmgr/employee/emp_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785732', null, '2014-03-24 16:03:50', null, 'sysmgr/employee/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785733', null, '2014-03-24 16:03:50', null, 'sysmgr/employee/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785734', null, '2014-03-24 16:03:50', null, 'sysmgr/employee/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785735', null, '2014-03-24 16:03:50', null, 'sysmgr/employee/datagrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785736', null, '2014-03-24 16:20:05', null, 'sysmgr/employee/set_grant.do', 'icon-standard-layout-header', '2014-03-24 16:20:05', null, '设置授权', '1', null, null, 'O', '068671', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785741', null, '2014-03-24 16:03:50', null, 'sysmgr/org/org_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单', '1', null, null, 'O', '229865', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785742', null, '2014-03-24 16:03:50', null, 'sysmgr/org/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '229865', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785743', null, '2014-03-24 16:03:50', null, 'sysmgr/org/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '229865', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785744', null, '2014-03-24 16:03:50', null, 'sysmgr/org/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '229865', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785745', null, '2014-03-24 16:03:50', null, 'sysmgr/org/treegrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '229865', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785751', null, '2014-03-24 16:16:54', null, 'sysmgr/empjob/empjob_form.do', 'icon-standard-layout-header', '2014-03-24 16:16:54', null, '表单', '1', null, null, 'O', '527852', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785752', null, '2014-03-24 16:03:50', null, 'sysmgr/empjob/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '527852', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785753', null, '2014-03-24 16:03:50', null, 'sysmgr/empjob/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '527852', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785754', null, '2014-03-24 16:03:50', null, 'sysmgr/empjob/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '527852', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785755', null, '2014-03-24 16:03:50', null, 'sysmgr/empjob/treegrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '527852', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785756', null, '2014-03-24 16:03:50', null, 'sysmgr/menu/treegrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785761', null, '2014-03-24 16:03:50', null, 'sysmgr/role/role_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785762', null, '2014-03-24 16:03:50', null, 'sysmgr/role/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785763', null, '2014-03-24 16:03:50', null, 'sysmgr/role/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785764', null, '2014-03-24 16:03:50', null, 'sysmgr/role/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785765', null, '2014-03-24 16:03:50', null, 'sysmgr/role/treegrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785766', null, '2014-03-24 16:20:22', null, 'sysmgr/role/set_grant.do', 'icon-standard-layout-header', '2014-03-24 16:20:22', null, '设置授权', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785771', null, '2014-03-24 16:03:50', null, 'roject/project_main/project_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785772', null, '2014-03-24 16:03:50', null, 'roject/project_main/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785773', null, '2014-03-24 16:03:50', null, 'roject/project_main/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785774', null, '2014-03-24 16:03:50', null, 'roject/project_main/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785775', null, '2014-03-24 16:03:50', null, 'roject/project_main/datagrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785776', null, '2014-03-24 16:03:50', null, 'roject/project_main/statusChange.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置项目状态', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('786776', null, '2014-03-24 16:03:50', null, 'roject/project_main/project_member_overtime.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '加班状态设置页面', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('796776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/saveAndSendMail.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '开发人员邮件通知操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7a5711', null, '2014-03-24 16:03:50', null, 'sysmgr/filemanager/file_deleteff.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除文件', '1', null, null, 'O', '675303', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7a5712', null, '2014-03-24 16:03:50', null, 'sysmgr/filemanager/download.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '下载文件', '1', null, null, 'O', '675303', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7a5713', null, '2014-03-24 16:03:50', null, 'sysmgr/filemanager/upload.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '上传文件', '1', null, null, 'O', '675303', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7a5717', null, '2014-03-24 16:03:50', null, 'sysmgr/filemanager/file_treelist.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '浏览文件', '1', null, null, 'O', '675303', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7a5718', null, '2014-03-24 16:03:50', null, 'sysmgr/filemanager/file_createDir.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '创建目录', '1', null, null, 'O', '675303', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7c2727', null, '2014-03-24 16:03:50', null, 'sysmgr/task/task_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单', '1', null, null, 'O', '200025', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7c5717', null, '2014-03-24 16:03:50', null, 'sysmgr/task/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '200025', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7c5718', null, '2014-03-24 16:03:50', null, 'sysmgr/task/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '200025', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7c5729', null, '2014-03-24 16:03:50', null, 'sysmgr/task/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '200025', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('7c5756', null, '2014-03-24 16:03:50', null, 'sysmgr/task/datagrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '200025', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('825118', null, '2014-04-14 08:55:25', null, 'project/project_main/emp_main.do', 'icon-standard-application-view-list', '2014-04-14 08:55:25', null, '人员信息', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('837844', null, '2014-02-13 10:39:12', null, 'druid/druid.do', 'icon-standard-database-link', '2014-02-13 10:39:12', null, 'Druid监控', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('863930', null, '2014-02-13 10:39:16', null, 'sysmgr/menu/menu_main.do', 'icon-standard-application-side-boxes', '2014-02-13 10:39:16', null, '资源管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('876715', null, '2014-02-10 21:28:13', null, '', 'icon-standard-application-xp-terminal', '2014-02-10 21:28:13', null, '系统管理', '1', null, null, 'R', null, 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('878344', null, '2014-02-13 10:39:21', null, 'sysmgr/role/role_main.do', 'icon-standard-award-star-silver-3', '2014-02-13 10:39:21', null, '角色管理', '1', null, null, 'F', '876715', 'Y');

-- ----------------------------
-- Table structure for `infox_sysmgr_org_dept`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_org_dept`;
CREATE TABLE `infox_sysmgr_org_dept` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `lastmod` datetime DEFAULT NULL,
  `modifyer` varchar(255) DEFAULT NULL,
  `month1` int(11) NOT NULL,
  `month10` int(11) NOT NULL,
  `month11` int(11) NOT NULL,
  `month12` int(11) NOT NULL,
  `month2` int(11) NOT NULL,
  `month3` int(11) NOT NULL,
  `month4` int(11) NOT NULL,
  `month5` int(11) NOT NULL,
  `month6` int(11) NOT NULL,
  `month7` int(11) NOT NULL,
  `month8` int(11) NOT NULL,
  `month9` int(11) NOT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ORG_PID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rwpxh5paok3rmx9s6aie9ps3t` (`ORG_PID`),
  CONSTRAINT `FK_rwpxh5paok3rmx9s6aie9ps3t` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_org_dept
-- ----------------------------
INSERT INTO `infox_sysmgr_org_dept` VALUES ('009014', null, '2014-04-17 10:26:58', null, '', null, null, '其它', null, '2014-04-17 10:26:58', null, '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '华智', '其它', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('097175', null, '2014-04-14 11:23:47', null, '', null, null, '第2开发本部第2开发部', null, '2014-04-14 11:23:47', null, '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD2-2', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('108486', null, '2014-04-14 10:57:21', null, '', null, null, '第四开发本部第二开发部', null, '2014-04-14 10:57:21', null, '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD4-2', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('166101', null, '2014-04-14 11:23:24', null, '', null, null, '第3开发本部第1开发部', null, '2014-04-14 11:23:24', null, '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD3-1', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('400771', null, '2014-04-03 13:21:48', null, '', null, null, '财务部', null, '2014-04-03 13:21:48', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '综合管理部', '', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('429710', null, '2014-04-14 11:24:29', null, '', null, null, '品质保证部', null, '2014-04-14 11:24:29', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '品质部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('474835', null, '2014-04-03 13:21:38', null, '', null, null, '采购部', null, '2014-04-03 13:21:38', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '综合管理部', '', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('526169', null, '2014-04-03 13:30:54', null, '', null, null, '北京分公司', null, '2014-04-03 13:30:54', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('528026', null, '2014-04-14 11:24:51', null, '', null, null, '第1开发本部第2开发部', null, '2014-04-14 11:24:51', null, '0', '0', '0', '0', '0', '0', '17', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD1-2', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('604742', null, '2014-04-14 11:24:08', null, '', null, null, '第2开发本部第1开发部', null, '2014-04-14 11:24:08', null, '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD2-1', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('615802', null, '2014-04-14 11:27:52', null, '', null, null, '第1开发本部第3开发部', null, '2014-04-14 11:27:52', null, '0', '0', '0', '0', '0', '0', '17', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD1-3', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('634670', null, '2014-04-14 11:26:05', null, '', null, null, '苏州开发部', null, '2014-04-14 11:26:05', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '苏州分公司', '苏州', null, 'D', '886155');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('649496', null, '2014-04-14 11:25:12', null, '', null, null, '第1开发本部第1开发部', null, '2014-04-14 11:25:12', null, '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD1-1', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('682781', null, '2014-04-14 11:26:18', null, '', null, null, '综合管理部', null, '2014-04-14 11:26:18', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '管理部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('812076', null, '2014-04-16 13:42:54', null, '', null, null, '第三开发本部第2开发部', null, '2014-04-16 13:42:54', null, '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '华智', 'JD3-2', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('853418', null, '2014-04-03 13:21:58', null, '', null, null, '人事部', null, '2014-04-03 13:21:58', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '综合管理部', '', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('886155', null, '2014-04-03 13:30:23', null, '', null, null, '苏州分公司', null, '2014-04-03 13:30:23', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('923158', null, '2014-04-14 11:22:49', null, '', null, null, '第4开发本部第1开发部', null, '2014-04-14 11:22:49', null, '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD4-1', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('943553', null, '2014-04-14 11:25:54', null, '', null, null, '北京开发部', null, '2014-04-14 11:25:54', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '北京分公司', '北京', null, 'D', '526169');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('973758', null, '2014-04-03 13:18:02', null, '', null, null, '广东华智科技有限公司', null, '2014-04-03 13:18:02', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '华智', null, 'O', null);

-- ----------------------------
-- Table structure for `infox_sysmgr_role`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_role`;
CREATE TABLE `infox_sysmgr_role` (
  `id` varchar(255) NOT NULL,
  `createdatetime` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `modifyer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `PID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_40rk0qb3wi6tr4ojpssiepgar` (`PID`),
  CONSTRAINT `FK_40rk0qb3wi6tr4ojpssiepgar` FOREIGN KEY (`PID`) REFERENCES `infox_sysmgr_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_role
-- ----------------------------

-- ----------------------------
-- Table structure for `infox_sysmgr_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_role_menu`;
CREATE TABLE `infox_sysmgr_role_menu` (
  `ROLE_ID` varchar(255) NOT NULL,
  `MENU_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`MENU_ID`),
  KEY `FK_h6lllim4m2nmod0l8646e6yjy` (`MENU_ID`),
  KEY `FK_5gdg2ybw8rwpcwb2n1eny7phd` (`ROLE_ID`),
  CONSTRAINT `FK_5gdg2ybw8rwpcwb2n1eny7phd` FOREIGN KEY (`ROLE_ID`) REFERENCES `infox_sysmgr_role` (`id`),
  CONSTRAINT `FK_h6lllim4m2nmod0l8646e6yjy` FOREIGN KEY (`MENU_ID`) REFERENCES `infox_sysmgr_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `infox_sysmgr_task`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_task`;
CREATE TABLE `infox_sysmgr_task` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `creater_id` varchar(255) DEFAULT NULL,
  `creater_name` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `relationOperate` varchar(255) DEFAULT NULL,
  `task_code` varchar(255) DEFAULT NULL,
  `task_enable` varchar(255) DEFAULT NULL,
  `task_job_class` varchar(255) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_remark` varchar(255) DEFAULT NULL,
  `task_type` varchar(255) DEFAULT NULL,
  `task_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_task
-- ----------------------------
