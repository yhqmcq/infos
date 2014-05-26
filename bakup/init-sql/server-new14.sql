/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-05-26 15:06:49
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
INSERT INTO `infox_project_emp_working` VALUES ('018021', '2014-05-23 13:16:24', '2014-02-13', 'PM', '2013-09-22', '1', '0803', null, '259235');
INSERT INTO `infox_project_emp_working` VALUES ('019250', '2014-05-23 10:33:44', '2014-02-26', 'PM', '2013-12-03', '1', '0993', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('093255', '2014-05-23 11:08:34', '2014-01-26', 'SE', '2013-12-10', '1', '0150', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('102879', '2014-05-26 09:10:15', '2014-01-13', 'PG', '2013-12-03', '1', '1179', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('189126', '2014-05-23 13:25:45', '2014-02-28', 'PG', '2013-12-10', '1', '1214', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('203708', '2014-05-26 09:10:15', '2014-02-12', 'SE', '2013-12-03', '1', '1074', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('229690', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-03', '1', '1145', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('248819', '2014-05-23 13:22:02', '2014-01-09', 'SE', '2013-09-11', '1', '0679', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('261897', '2014-05-26 09:10:15', '2014-02-12', 'PM', '2013-12-03', '1', '1084', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('320394', '2014-05-23 09:44:27', '2014-01-17', 'SE', '2013-12-19', '1', '0032', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('332915', '2014-05-23 09:44:27', '2014-01-17', 'PM', '2013-11-16', '1', '1223', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('358412', '2014-05-26 09:10:15', '2014-02-12', 'SE', '2013-12-03', '1', '1234', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('375252', '2014-05-26 09:10:15', '2014-02-12', '初級PG1', '2013-12-10', '1', '1255', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('389515', '2014-05-23 09:44:27', '2014-01-19', 'SE', '2013-11-15', '1', '0053', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('406888', '2014-05-23 09:44:56', '2014-01-17', 'PG', '2014-01-13', '1', '0748', null, '930788');
INSERT INTO `infox_project_emp_working` VALUES ('453788', '2014-05-23 13:22:02', '2014-01-09', '初級PG1', '2013-09-11', '1', '1250', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('540549', '2014-05-23 09:44:56', '2014-01-27', 'PG', '2014-01-13', '1', '1028', null, '930788');
INSERT INTO `infox_project_emp_working` VALUES ('559877', '2014-05-26 09:10:15', '2014-02-12', '初級PG1', '2013-12-10', '1', '1287', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('574512', '2014-05-23 09:43:15', '2014-01-19', 'PM', '2012-09-27', '1', '1219', null, '232261');
INSERT INTO `infox_project_emp_working` VALUES ('578526', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-03', '1', '1082', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('607292', '2014-05-23 11:08:34', '2014-01-26', 'PG', '2013-12-10', '1', '1237', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('608220', '2014-05-23 11:08:34', '2014-02-21', 'PM', '2013-12-10', '1', '0520', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('608630', '2014-05-23 13:25:45', '2014-02-28', 'PM', '2013-12-16', '1', '0027', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('629758', '2014-05-23 13:19:47', '2014-01-28', 'SE', '2013-09-22', '1', '0669', null, '484656');
INSERT INTO `infox_project_emp_working` VALUES ('646388', '2014-05-23 13:22:02', '2014-01-30', '初級PG1', '2013-09-11', '1', '1274', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('651211', '2014-05-23 09:44:27', '2014-01-17', 'PG', '2013-12-12', '1', '1211', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('663626', '2014-05-23 13:25:45', '2014-01-25', 'SE', '2013-12-10', '1', '0590', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('668902', '2014-05-23 09:44:56', '2014-01-14', 'PG', '2014-01-10', '1', '0753', null, '930788');
INSERT INTO `infox_project_emp_working` VALUES ('685162', '2014-05-23 13:25:45', '2014-01-10', 'SE', '2013-12-10', '1', '0676', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('701591', '2014-05-23 13:22:02', '2014-01-09', 'PG', '2013-10-09', '1', '1282', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('702665', '2014-05-23 13:19:47', '2014-02-11', 'PM', '2013-09-03', '1', '0155', null, '484656');
INSERT INTO `infox_project_emp_working` VALUES ('731099', '2014-05-23 13:22:02', '2014-01-09', 'PM', '2013-09-02', '1', '1225', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('735063', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-16', '1', '1220', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('771651', '2014-05-23 13:22:02', '2014-01-09', 'SE', '2013-09-24', '1', '0850', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('823239', '2014-05-23 10:33:44', '2014-02-26', 'PG', '2013-12-03', '1', '1060', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('823813', '2014-05-23 10:33:44', '2014-01-24', 'PG', '2013-12-03', '1', '1099', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('851292', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-03', '1', '1071', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('949449', '2014-05-23 11:08:34', '2014-01-26', 'PG', '2013-12-16', '1', '1158', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('976204', '2014-05-23 10:34:36', '2014-02-14', 'PM', '2013-12-16', '1', '0428', null, '675005');
INSERT INTO `infox_project_emp_working` VALUES ('988770', '2014-05-23 11:08:34', '2014-01-26', 'SE', '2013-12-10', '1', '0866', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('992792', '2014-05-23 10:34:36', '2014-01-27', 'PG', '2013-12-16', '1', '1236', null, '675005');
INSERT INTO `infox_project_emp_working` VALUES ('996693', '2014-05-23 09:44:56', '2014-01-17', 'PG', '2014-01-13', '1', '1296', null, '930788');

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
INSERT INTO `infox_project_maillist` VALUES ('006729', '0050', '264706');
INSERT INTO `infox_project_maillist` VALUES ('037547', '0100', '930788');
INSERT INTO `infox_project_maillist` VALUES ('056194', '0317', '675005');
INSERT INTO `infox_project_maillist` VALUES ('088647', '0317', '930788');
INSERT INTO `infox_project_maillist` VALUES ('103266', '0100', '844509');
INSERT INTO `infox_project_maillist` VALUES ('110434', '0317', '570315');
INSERT INTO `infox_project_maillist` VALUES ('155211', '0449', '570315');
INSERT INTO `infox_project_maillist` VALUES ('228069', '0190', '484656');
INSERT INTO `infox_project_maillist` VALUES ('299322', '0449', '930788');
INSERT INTO `infox_project_maillist` VALUES ('302320', '1300', '675005');
INSERT INTO `infox_project_maillist` VALUES ('316416', '1300', '259235');
INSERT INTO `infox_project_maillist` VALUES ('317955', '1300', '800184');
INSERT INTO `infox_project_maillist` VALUES ('353585', '0317', '264706');
INSERT INTO `infox_project_maillist` VALUES ('375402', '0100', '484656');
INSERT INTO `infox_project_maillist` VALUES ('400162', '0675', '903080');
INSERT INTO `infox_project_maillist` VALUES ('418608', '1300', '903080');
INSERT INTO `infox_project_maillist` VALUES ('480407', '0317', '484656');
INSERT INTO `infox_project_maillist` VALUES ('482864', '0317', '844509');
INSERT INTO `infox_project_maillist` VALUES ('486712', '0100', '669576');
INSERT INTO `infox_project_maillist` VALUES ('520367', '0449', '844509');
INSERT INTO `infox_project_maillist` VALUES ('534940', '0190', '930788');
INSERT INTO `infox_project_maillist` VALUES ('559355', '0190', '232261');
INSERT INTO `infox_project_maillist` VALUES ('561718', '0190', '259235');
INSERT INTO `infox_project_maillist` VALUES ('566188', '1300', '669576');
INSERT INTO `infox_project_maillist` VALUES ('567547', '0449', '259235');
INSERT INTO `infox_project_maillist` VALUES ('567987', '1300', '844509');
INSERT INTO `infox_project_maillist` VALUES ('570104', '1300', '264706');
INSERT INTO `infox_project_maillist` VALUES ('610174', '0449', '264706');
INSERT INTO `infox_project_maillist` VALUES ('616800', '0190', '669576');
INSERT INTO `infox_project_maillist` VALUES ('626371', '0449', '800184');
INSERT INTO `infox_project_maillist` VALUES ('626398', '0449', '484656');
INSERT INTO `infox_project_maillist` VALUES ('645199', '0449', '903080');
INSERT INTO `infox_project_maillist` VALUES ('658563', '0817', '844509');
INSERT INTO `infox_project_maillist` VALUES ('674160', '0449', '232261');
INSERT INTO `infox_project_maillist` VALUES ('674703', '1300', '930788');
INSERT INTO `infox_project_maillist` VALUES ('725120', '0317', '259235');
INSERT INTO `infox_project_maillist` VALUES ('729706', '0317', '669576');
INSERT INTO `infox_project_maillist` VALUES ('765011', '0100', '800184');
INSERT INTO `infox_project_maillist` VALUES ('768918', '0100', '232261');
INSERT INTO `infox_project_maillist` VALUES ('774524', '0100', '264706');
INSERT INTO `infox_project_maillist` VALUES ('800909', '0449', '669576');
INSERT INTO `infox_project_maillist` VALUES ('867541', '0817', '570315');
INSERT INTO `infox_project_maillist` VALUES ('879516', '0100', '259235');
INSERT INTO `infox_project_maillist` VALUES ('880921', '1300', '484656');
INSERT INTO `infox_project_maillist` VALUES ('907238', '0100', '570315');
INSERT INTO `infox_project_maillist` VALUES ('911959', '1300', '232261');
INSERT INTO `infox_project_maillist` VALUES ('930164', '0317', '232261');
INSERT INTO `infox_project_maillist` VALUES ('937306', '0817', '800184');
INSERT INTO `infox_project_maillist` VALUES ('941130', '0817', '675005');
INSERT INTO `infox_project_maillist` VALUES ('962740', '0100', '675005');
INSERT INTO `infox_project_maillist` VALUES ('966150', '0317', '800184');
INSERT INTO `infox_project_maillist` VALUES ('974101', '1300', '570315');
INSERT INTO `infox_project_maillist` VALUES ('975322', '0100', '903080');
INSERT INTO `infox_project_maillist` VALUES ('980416', '0449', '675005');
INSERT INTO `infox_project_maillist` VALUES ('989439', '0317', '903080');

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
INSERT INTO `infox_project_overtime` VALUES ('090144', '2014-05-26 11:23:49', null, '0', '0', null, '8.1', '8.1', null, '14', '14', '1237', '800184');
INSERT INTO `infox_project_overtime` VALUES ('167926', '2014-05-26 10:14:46', null, '0', '0', null, '101', '101', null, '55', '55', '1074', '844509');
INSERT INTO `infox_project_overtime` VALUES ('238444', '2014-05-26 10:19:51', null, '0', '0', null, '54', '54', null, '0', '0', '1234', '844509');
INSERT INTO `infox_project_overtime` VALUES ('350664', '2014-05-26 10:59:48', null, '0', '0', null, '20', '20', null, '11', '11', '0428', '675005');
INSERT INTO `infox_project_overtime` VALUES ('356947', '2014-05-26 10:21:21', null, '0', '0', null, '24.5', '24.5', null, '9', '9', '1255', '844509');
INSERT INTO `infox_project_overtime` VALUES ('427730', '2014-05-26 09:53:30', null, '0', '0', null, '0', '0', null, '24.5', '24.5', '1219', '232261');
INSERT INTO `infox_project_overtime` VALUES ('480671', '2014-05-26 11:24:35', null, '0', '0', null, '49.7', '49.7', null, '20', '20', '1158', '800184');
INSERT INTO `infox_project_overtime` VALUES ('529827', '2014-05-26 10:12:24', null, '0', '0', null, '28', '28', null, '6.5', '6.5', '1179', '844509');
INSERT INTO `infox_project_overtime` VALUES ('542325', '2014-05-26 10:22:12', null, '0', '0', null, '2', '2', null, '18', '18', '1287', '844509');
INSERT INTO `infox_project_overtime` VALUES ('561175', '2014-05-26 11:20:07', null, '0', '0', null, '29.9', '29.9', null, '4.7', '4.7', '0866', '800184');
INSERT INTO `infox_project_overtime` VALUES ('575858', '2014-05-26 10:25:38', null, '0', '0', null, '68.5', '68.5', null, '46.5', '46.5', '1082', '844509');
INSERT INTO `infox_project_overtime` VALUES ('580246', '2014-05-26 11:33:44', null, '0', '0', null, '34.8', '34.8', null, '23', '23', '0993', '570315');
INSERT INTO `infox_project_overtime` VALUES ('591939', '2014-05-26 11:00:46', null, '0', '0', null, '1', '1', null, '0', '0', '1236', '675005');
INSERT INTO `infox_project_overtime` VALUES ('658025', '2014-05-26 10:26:41', null, '0', '0', null, '86', '86', null, '35', '35', '1220', '844509');
INSERT INTO `infox_project_overtime` VALUES ('733445', '2014-05-26 10:27:16', null, '0', '0', null, '74', '74', null, '0', '0', '1071', '844509');
INSERT INTO `infox_project_overtime` VALUES ('747235', '2014-05-26 11:18:59', null, '0', '0', null, '0', '0', null, '6.6', '6.6', '0150', '800184');
INSERT INTO `infox_project_overtime` VALUES ('751849', '2014-05-26 11:22:59', null, '0', '0', null, '70.6', '70.6', null, '45.8', '45.8', '0520', '800184');
INSERT INTO `infox_project_overtime` VALUES ('777042', '2014-05-26 10:47:46', null, '0', '0', null, '0', '0', null, '8', '8', '0027', '903080');
INSERT INTO `infox_project_overtime` VALUES ('796647', '2014-05-26 10:16:40', null, '0', '0', null, '52.5', '52.5', null, '49.5', '49.5', '1145', '844509');
INSERT INTO `infox_project_overtime` VALUES ('830795', '2014-05-26 11:35:44', null, '0', '0', null, '35.2', '35.2', null, '7.9', '7.9', '1099', '570315');
INSERT INTO `infox_project_overtime` VALUES ('914095', '2014-05-26 11:34:35', null, '0', '0', null, '29.3', '29.3', null, '29.9', '29.9', '1060', '570315');
INSERT INTO `infox_project_overtime` VALUES ('921620', '2014-05-26 10:18:24', null, '0', '0', null, '139.5', '139.5', null, '17.5', '17.5', '1084', '844509');
INSERT INTO `infox_project_overtime` VALUES ('930316', '2014-05-26 10:49:02', null, '0', '0', null, '0', '0', null, '7', '7', '1214', '903080');

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
  `project_cclrl` varchar(255) DEFAULT NULL,
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
  `jiesuan` varchar(255) DEFAULT NULL,
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
INSERT INTO `infox_project_project` VALUES ('232261', null, '120806-1', '2014-05-26 14:55:59', '0449', '符晓燕', null, '2014-01-19 00:00:00', '2014-05-26 14:55:59', 'TOSS DLR配车供需表改善', '120806-1', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '1', '2012-07-16 00:00:00', '1', '', null, '548996', '1219', null, '2');
INSERT INTO `infox_project_project` VALUES ('259235', null, '131104-1-2', '2014-05-26 14:51:02', '0449', '符晓燕', null, '2014-02-13 00:00:00', '2014-05-26 14:51:02', '业务支援', '131104-1-2', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-09-22 00:00:00', '1', '', null, '548996', '0803', null, '2');
INSERT INTO `infox_project_project` VALUES ('264706', null, '130912-1-1', '2014-05-26 14:34:03', '0449', '符晓燕', null, '2014-02-28 00:00:00', '2014-05-26 14:34:03', '中国保险家移动资讯平台圈子功能开发', '130912-1-1', '3', '10', '', '', '-100', null, '30', null, null, null, '公司内部研发项目', '3', '10', '1', '0', '2013-09-06 00:00:00', '1', '需求分析~CT', null, '126300', '1225', null, '');
INSERT INTO `infox_project_project` VALUES ('484656', null, '130913-1-1', '2014-05-23 13:19:47', null, null, null, '2014-02-11 00:00:00', '2014-05-23 13:19:47', 'i-CROP再構築', '130913-1-1', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-09-09 00:00:00', '1', null, null, '548996', '0155', null, null);
INSERT INTO `infox_project_project` VALUES ('570315', null, '091118-1-38', '2014-05-26 14:52:27', '0449', '符晓燕', null, '2014-02-26 00:00:00', '2014-05-26 14:52:27', 'ADWORLD農家台帳系统开发', '091118-1-38', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '1', '2013-12-02 00:00:00', '1', '', null, '723327', '0993', null, '');
INSERT INTO `infox_project_project` VALUES ('669576', null, '131219-1-1', '2014-05-23 16:34:25', '0317', '黄丽嫦', null, '2014-01-10 00:00:00', '2014-05-23 16:34:25', 'DLR车辆展示系统', '131219-1-1', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '0', '2013-11-16 00:00:00', '1', '', null, '548996', '1223', null, '2');
INSERT INTO `infox_project_project` VALUES ('675005', null, '120611-1-16', '2014-05-26 14:50:14', '0449', '符晓燕', null, '2014-02-14 00:00:00', '2014-05-26 14:50:14', 'AD機能改善（料金共通）２月', '120611-1-16', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '1', '2013-12-16 00:00:00', '1', '', null, '723327', '0428', null, '');
INSERT INTO `infox_project_project` VALUES ('800184', null, '130919-1-2', '2014-05-23 11:08:34', null, null, null, '2014-02-21 00:00:00', '2014-05-23 11:08:34', 'ADWORLD福祉系统开发', '130919-1-2', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-12-10 00:00:00', '1', null, null, '723327', '0520', null, null);
INSERT INTO `infox_project_project` VALUES ('844509', null, '120731-1-14', '2014-05-26 09:10:15', null, null, null, '2014-02-12 00:00:00', '2014-05-26 09:10:15', 'ADWORLD国民年金系统开发', '120731-1-14', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-12-02 00:00:00', '1', null, null, '723327', '1084', null, null);
INSERT INTO `infox_project_project` VALUES ('903080', null, '131209-1-1', '2014-05-26 14:17:22', '0449', '符晓燕', null, '2014-02-28 00:00:00', '2014-05-26 14:17:22', '日立粉末冶金様　資材システム開発', '131209-1-1', '1.10', '5.77', '', '', '33.3%', null, '6.36', null, null, null, '项目委托', '0.82', '7.77', '1', '1', '2013-12-12 00:00:00', '1', 'DD~CT', null, '702229', '0027', null, '');
INSERT INTO `infox_project_project` VALUES ('930788', null, '140110-1-1', '2014-05-26 14:57:31', '0449', '符晓燕', null, '2014-01-27 00:00:00', '2014-05-26 14:57:31', 'ADAM機能追加iOS７対応', '140110-1-1', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '1', '2014-01-13 00:00:00', '1', '', null, '548996', '1046', null, '0');

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
INSERT INTO `infox_sysmgr_emp` VALUES ('0001', 'johan', '1995-03-24', '2014-05-26 10:30:15', null, '', '3', null, 'johan@whizen.com', 'N', '一级', '2014-05-26 10:30:15', '', null, null, null, '', null, '2002-07-21', '男', '0', 'Y', null, '梅傲寒', '0', '300199');
INSERT INTO `infox_sysmgr_emp` VALUES ('0007', 'linchaoquan', '2004-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'linchaoquan@whizen.com', null, '二级', '2014-05-15 10:23:18', null, null, null, '66521896', null, null, '2004-07-15', '男', '0', 'Y', null, '林超权', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0013', '722442822222456', '2004-06-01', '2014-05-15 10:23:21', null, null, '3', null, '722442822222456@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '41714065', null, null, '2004-07-15', '男', '0', 'Y', null, '黄海涛', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0027', 'lijia', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'lijia@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '46001546', null, null, '2005-08-01', '男', '0', 'Y', null, '李甲', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('003', 'wangmin', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'wangmin@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '47045645', null, null, '2005-07-04', '女', '0', 'Y', null, '王敏', '0', '682781');
INSERT INTO `infox_sysmgr_emp` VALUES ('0032', 'suweilai', '2005-06-01', '2014-05-23 09:48:52', null, '', '3', null, 'suweilai@whizen.com', 'Y', '一级', '2014-05-23 09:48:52', '', null, null, null, '', null, '2005-08-01', '男', '0', 'Y', null, '苏炜来', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0050', 'xiaohaobo', '2002-06-01', '2014-05-23 09:49:41', null, '', '3', null, 'xiaohaobo@whizen.com', 'Y', '二级', '2014-05-23 09:49:41', '', null, null, '62860458', '', null, '2002-07-21', '男', '0', 'Y', null, '肖浩波', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0052', '736462999397253', '2004-06-01', '2014-05-15 10:23:20', null, null, '3', null, '736462999397253@whizen.com', null, '一级', '2014-05-15 10:23:20', null, null, null, '50218953', null, null, '2004-08-01', '女', '0', 'Y', null, '陈建', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0053', 'christom', '2004-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'christom@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '89381928', null, null, '2004-08-01', '男', '0', 'Y', null, '谭建斌', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0067', 'huangyong', '2004-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huangyong@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '84329728', null, null, '2005-07-04', '男', '0', 'Y', null, '黄勇', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0070', 'jiangsihua', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'jiangsihua@whizen.com', null, '三级', '2014-05-15 10:23:16', null, null, null, '30086439', null, null, '2005-07-25', '男', '0', 'Y', null, '蒋思华', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0086', 'suxiaolan', '2003-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'suxiaolan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '12028423', null, null, '2006-01-24', '女', '0', 'Y', null, '苏肖兰', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0100', 'tanghaiyan', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'tanghaiyan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '44681476', null, null, '2006-03-27', '女', '0', 'Y', null, '唐海艳', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0119', '927493932823494', '2006-06-01', '2014-05-15 10:23:21', null, null, '3', null, '927493932823494@whizen.com', null, '三级', '2014-05-15 10:23:21', null, null, null, '50458580', null, null, '2006-08-01', '女', '0', 'Y', null, '段金余', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0137', 'songlingling', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'songlingling@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '27694070', null, null, '2006-08-01', '女', '0', 'Y', null, '宋玲玲', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0150', 'xuying', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xuying@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '65223027', null, null, '2006-08-01', '女', '0', 'Y', null, '徐滢', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0155', 'zhuweiyong', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zhuweiyong@whizen.com', null, '二级', '2014-05-15 10:23:13', null, null, null, '03071398', null, null, '2006-08-01', '男', '0', 'Y', null, '朱伟勇', '1', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0160', '843852433143873', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, '843852433143873@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '15363435', null, null, '2006-08-01', '女', '0', 'Y', null, '周秀珍', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0183', 'yangchunhua', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'yangchunhua@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '21904611', null, null, '2006-08-01', '女', '0', 'Y', null, '杨春花', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0190', 'liguanjie', '2006-06-01', '2014-05-23 09:47:47', null, '', '3', null, 'liguanjie@whizen.com', 'Y', '二级', '2014-05-23 09:47:47', '', null, null, null, '', null, '2006-08-01', '男', '0', 'Y', null, '李冠杰', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0197', 'zhushuxin', '2006-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'zhushuxin@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '21511568', null, null, '2006-08-01', '男', '0', 'Y', null, '朱树歆', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0201', 'wangchao', '2004-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'wangchao@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '94458695', null, null, '2006-11-14', '男', '0', 'Y', null, '王超', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('0207', 'liuyong', '2002-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'liuyong@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '85474244', null, null, '2007-04-16', '男', '0', 'Y', null, '刘永', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0215', 'xiaojun', '2006-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'xiaojun@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '04775681', null, null, '2007-05-07', '男', '0', 'Y', null, '肖俊', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0216', 'dongpengwu', '2004-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'dongpengwu@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '34229969', null, null, '2007-05-07', '男', '0', 'Y', null, '董鹏武', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0217', 'wangyang', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wangyang@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '58480699', null, null, '2007-05-07', '男', '0', 'Y', null, '汪扬', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0236', 'lizhixian', '2007-06-01', '2014-05-15 10:23:10', null, null, '3', null, 'lizhixian@whizen.com', null, '二级', '2014-05-15 10:23:10', null, null, null, '95083836', null, null, '2007-07-02', '男', '0', 'Y', null, '李智贤', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0262', 'linqunyan', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'linqunyan@whizen.com', null, '二级', '2014-05-26 12:35:39', null, null, null, 'Lqy830617', null, null, '2007-07-02', '女', '0', 'Y', null, '林群艳', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0280', 'zhonghuifeng', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zhonghuifeng@whizen.com', null, '二级', '2014-05-15 10:23:14', null, null, null, '94977490', null, null, '2007-07-02', '女', '0', 'Y', null, '钟惠凤', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0284', 'chenxidong', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'chenxidong@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '28826972', null, null, '2007-07-02', '男', '0', 'Y', null, '陈熙东', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0295', 'huangpengfei', '2007-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huangpengfei@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '76334024', null, null, '2007-07-02', '男', '0', 'Y', null, '黄鹏飞', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0301', 'liumin0301', '2006-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liumin0301@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '43809120', null, null, '2007-07-02', '女', '0', 'Y', null, '刘敏', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0306', '925925812429766', '2007-06-01', '2014-05-15 10:23:26', null, null, '3', null, '925925812429766@whizen.com', null, '二级', '2014-05-15 10:23:26', null, null, null, '55229069', null, null, '2007-08-01', '男', '0', 'Y', null, '游魁良', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('031', 'wanglili', '2005-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'wanglili@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '66939960', null, null, '2005-08-01', '女', '0', 'Y', null, '王莉莉', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0314', 'liuyu', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'liuyu@whizen.com', null, '二级', '2014-05-15 10:23:12', null, null, null, '47724656', null, null, '2007-08-01', '男', '0', 'Y', null, '刘裕', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0317', 'huanglichang', '2012-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huanglichang@whizen.com', null, '三级', '2014-05-15 11:06:19', null, null, null, 'zhujin8970', null, null, '2007-09-10', '女', '0', 'Y', null, '黄丽嫦', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0322', 'zhongjia', '2007-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhongjia@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '14607165', null, null, '2008-01-08', '女', '0', 'Y', null, '钟加', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0339', 'xuhongqi', '2002-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'xuhongqi@whizen.com', null, '一级', '2014-05-26 11:32:36', null, null, null, '200803xhq!', null, null, '2008-03-31', '女', '0', 'Y', null, '徐红齐', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('0342', 'liyan', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liyan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '78555125', null, null, '2008-06-02', '女', '0', 'Y', null, '李艳', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('0348', 'liuting', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liuting@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '71723523', null, null, '2008-08-04', '女', '0', 'Y', null, '刘婷', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0351', '110677875073948', '2008-06-01', '2014-05-15 10:23:25', null, null, '3', null, '110677875073948@whizen.com', null, '二级', '2014-05-15 10:23:25', null, null, null, '12181902', null, null, '2008-08-04', '男', '0', 'Y', null, '李育安', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0377', '808440644119771', '2011-06-30', '2014-05-15 10:23:25', null, null, '3', null, '808440644119771@whizen.com', null, '二级', '2014-05-15 10:23:25', null, null, null, '92167351', null, null, '2008-08-04', '男', '0', 'Y', null, '刘渊', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0394', 'liuwenyu', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liuwenyu@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '00603571', null, null, '2008-08-04', '男', '0', 'Y', null, '刘文育', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0413', 'zhenghui', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'zhenghui@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '96772572', null, null, '2008-08-04', '女', '0', 'Y', null, '郑惠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0428', 'shenhao', '2007-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'shenhao@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '39569635', null, null, '2008-08-04', '男', '0', 'Y', null, '沈浩', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0449', 'fuxiaoyan', '2007-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'fuxiaoyan@whizen.com', null, '二级', '2014-05-26 11:12:08', null, null, null, 'whizen001', null, null, '2009-02-13', '女', '0', 'Y', null, '符晓燕', '0', '474835');
INSERT INTO `infox_sysmgr_emp` VALUES ('0452', 'xiayunhuan', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xiayunhuan@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '67795866', null, null, '2009-05-14', '女', '0', 'Y', null, '夏耘寰', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0453', 'lining', '2007-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'lining@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '86473446', null, null, '2009-07-01', '男', '0', 'Y', null, '李宁', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0480', '572095720199521', '2009-06-01', '2014-05-15 10:23:23', null, null, '3', null, '572095720199521@whizen.com', null, '二级', '2014-05-15 10:23:23', null, null, null, '48211935', null, null, '2009-07-13', '男', '0', 'Y', null, '石元春', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('049', 'zhougang', '2004-06-01', '2014-05-23 09:04:36', null, '', '3', null, 'zhougang@whizen.com', 'YY', '一级', '2014-05-23 09:04:36', '', null, null, null, '', null, '2004-09-15', '男', '0', 'Y', null, '周纲', '0', '917489');
INSERT INTO `infox_sysmgr_emp` VALUES ('0498', 'caojuan', '2009-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'caojuan@whizen.com', null, '三级', '2014-05-15 10:23:16', null, null, null, '35687276', null, null, '2009-07-13', '女', '0', 'Y', null, '曹娟', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('051', 'zhangruolin', '2004-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'zhangruolin@whizen.com', null, '三级', '2014-05-15 10:23:19', null, null, null, '35324521', null, null, '2004-08-01', '男', '0', 'Y', null, '张若林', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0520', 'yanghui', '2009-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'yanghui@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '85443305', null, null, '2009-07-13', '女', '0', 'Y', null, '杨辉', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0546', 'mochengzhang', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'mochengzhang@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '13268442', null, null, '2009-10-13', '男', '0', 'Y', null, '莫承长', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('055', 'luowen', '2003-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'luowen@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '39076491', null, null, '2006-01-01', '男', '0', 'Y', null, '罗文', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0559', 'zhangyuangong', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zhangyuangong@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '83347353', null, null, '2010-01-18', '男', '0', 'Y', null, '张元巩', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0562', 'huangyu', '2009-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huangyu@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '37031038', null, null, '2010-01-21', '男', '0', 'Y', null, '黄宇', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0564', 'hefei', '2003-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'hefei@whizen.com', null, '二级', '2014-05-26 13:42:33', null, null, null, 'abcd@123', null, null, '2010-03-09', '女', '0', 'Y', null, '贺飞', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0569', 'wanghui', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wanghui@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '92706264', null, null, '2010-03-22', '女', '0', 'Y', null, '王晖', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0577', '339321392651630', '2004-06-01', '2014-05-15 10:23:22', null, null, '3', null, '339321392651630@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '71629571', null, null, '2010-04-07', '男', '0', 'Y', null, '吴迪', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0579', 'houxiaohui', '2008-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'houxiaohui@whizen.com', null, '三级', '2014-05-15 10:23:12', null, null, null, '60689421', null, null, '2010-04-26', '女', '0', 'Y', null, '侯小慧', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0583', 'chenshunyin', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'chenshunyin@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '52111701', null, null, '2010-05-06', '男', '0', 'Y', null, '陈舜殷', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0588', 'suyi', '2004-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'suyi@whizen.com', null, '二级', '2014-05-15 10:23:19', null, null, null, '59917324', null, null, '2010-04-07', '男', '0', 'Y', null, '粟毅', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0590', 'yangmengping', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'yangmengping@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '30080725', null, null, '2010-07-02', '女', '0', 'Y', null, '杨孟平', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0601', 'jinyao', '2007-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'jinyao@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '46090411', null, null, '2010-05-14', '男', '0', 'Y', null, '金瑶', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0603', 'zhongzhichao', '2003-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zhongzhichao@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '13543750', null, null, '2010-05-17', '男', '0', 'Y', null, '钟智超', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0621', '582654094947692', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '582654094947692@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '36139071', null, null, '2010-07-05', '男', '0', 'Y', null, '邹志伟', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0624', 'liyue', '2010-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'liyue@whizen.com', null, '三级', '2014-05-26 11:51:40', null, null, null, 'Whizen029', null, null, '2010-07-02', '女', '0', 'Y', null, '李越', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0626', 'shisha', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'shisha@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '20211384', null, null, '2010-07-02', '女', '0', 'Y', null, '石莎', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0627', 'qinyaqiang', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'qinyaqiang@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '21977354', null, null, '2010-07-02', '男', '0', 'Y', null, '秦亚强', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0658', '586427680785499', '2010-06-01', '2014-05-15 10:23:24', null, null, '3', null, '586427680785499@whizen.com', null, '三级', '2014-05-15 10:23:24', null, null, null, '57634200', null, null, '2010-07-02', '女', '0', 'Y', null, '毛秋林', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0666', 'zhangning', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhangning@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '65007772', null, null, '2010-07-02', '男', '0', 'Y', null, '张宁', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0669', 'huangjiakui', '2010-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangjiakui@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '54854706', null, null, '2010-07-02', '男', '0', 'Y', null, '黄加魁', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0670', 'huanglindi', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huanglindi@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '00376935', null, null, '2010-07-02', '女', '0', 'Y', null, '黄林娣', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0671', 'zhouyuhan', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhouyuhan@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '60636650', null, null, '2010-07-02', '女', '0', 'Y', null, '周玉涵', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0674', 'duandehong', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'duandehong@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '67953903', null, null, '2010-07-02', '女', '0', 'Y', null, '段德红', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0675', 'huanghaiping', '2000-06-01', '2014-05-23 09:49:27', null, '', '3', null, 'huanghaiping@whizen.com', 'Y', '二级', '2014-05-23 09:49:27', '', null, null, null, '', null, '2010-07-01', '女', '0', 'Y', null, '黄海萍', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0676', 'wangweibin', '2006-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'wangweibin@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '42956380', null, null, '2010-07-05', '男', '0', 'Y', null, '王伟滨', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0678', '451560194479268', '2010-06-01', '2014-05-15 10:23:20', null, null, '3', null, '451560194479268@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '22708952', null, null, '2010-07-07', '男', '0', 'Y', null, '游洪鑫', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0679', 'huangweicong', '2007-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangweicong@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '28885946', null, null, '2010-07-12', '男', '0', 'Y', null, '黄炜聪', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0681', 'wangzhiqing', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wangzhiqing@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '24565031', null, null, '2010-07-13', '女', '0', 'Y', null, '王志青', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0684', 'chenruiting', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'chenruiting@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '37967335', null, null, '2010-07-21', '男', '0', 'Y', null, '陈瑞庭', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0694', 'luweiniu', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'luweiniu@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '27892010', null, null, '2010-10-08', '男', '0', 'Y', null, '卢炜钮', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0696', 'lanyuping', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'lanyuping@whizen.com', null, '一级', '2014-05-15 10:23:19', null, null, null, '46809289', null, null, '2010-10-18', '女', '0', 'Y', null, '蓝宇萍', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0704', '834683666139373', '1999-06-01', '2014-05-15 10:23:22', null, null, '3', null, '834683666139373@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '73404266', null, null, '2010-12-01', '女', '0', 'Y', null, '袁俏', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0714', 'wangchengwen', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'wangchengwen@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '64569818', null, null, '2010-12-23', '男', '0', 'Y', null, '王成文', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0715', 'wangjunjun', '2011-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'wangjunjun@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '01790225', null, null, '2011-07-04', '女', '0', 'Y', null, '王俊俊', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0718', 'yinli', '2009-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'yinli@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '18260072', null, null, '2010-12-23', '女', '0', 'Y', null, '尹莉', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0721', 'dengliwei', '2008-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'dengliwei@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '36884835', null, null, '2011-01-05', '男', '0', 'Y', null, '邓立伟', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0730', '356947493646265', '2008-06-01', '2014-05-15 10:23:22', null, null, '3', null, '356947493646265@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '95772151', null, null, '2011-03-03', '男', '0', 'Y', null, '宋祖超', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0734', '365737461534190', '2007-06-01', '2014-05-15 10:23:21', null, null, '3', null, '365737461534190@whizen.com', null, '一级', '2014-05-15 10:23:21', null, null, null, '67824773', null, null, '2011-03-14', '男', '0', 'Y', null, '龚朝晖', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0735', '821360403370616', '2011-06-01', '2014-05-15 10:23:24', null, null, '3', null, '821360403370616@whizen.com', null, '三级', '2014-05-15 10:23:24', null, null, null, '84248839', null, null, '2011-07-04', '男', '0', 'Y', null, '杨玉', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0738', 'huangguorong', '1980-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'huangguorong@whizen.com', null, '--', '2014-05-15 10:23:18', null, null, null, '39028680', null, null, '2011-03-28', '男', '0', 'Y', null, '黄国荣', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('0741', 'liang', '2009-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liang@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '06721551', null, null, '2011-04-01', '男', '0', 'Y', null, '李昂', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0747', 'wubaojie', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wubaojie@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '04023002', null, null, '2011-04-11', '男', '0', 'Y', null, '吴保杰', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0748', 'chengpeng', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'chengpeng@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '18317417', null, null, '2011-04-11', '男', '0', 'Y', null, '程鹏', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0749', 'zouke', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zouke@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '79544421', null, null, '2011-04-11', '男', '0', 'Y', null, '邹科', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0752', 'denglixian', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'denglixian@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '06924526', null, null, '2011-05-09', '女', '0', 'Y', null, '邓丽贤', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0753', 'pengyao', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'pengyao@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '24439415', null, null, '2011-05-24', '男', '0', 'Y', null, '彭尧', '1', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0755', 'zhushaofeng', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'zhushaofeng@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '18685259', null, null, '2011-06-07', '女', '0', 'Y', null, '朱韶峰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0757', 'xuwubin', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'xuwubin@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '23381096', null, null, '2011-06-13', '女', '0', 'Y', null, '徐五斌', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0790', '649092515336255', '2011-06-20', '2014-05-15 10:23:21', null, null, '3', null, '649092515336255@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '56722609', null, null, '2011-06-20', '男', '0', 'Y', null, '洪学臣', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0792', 'luzhijun', '2011-06-30', '2014-05-15 10:23:19', null, null, '3', null, 'luzhijun@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '20970906', null, null, '2011-07-04', '男', '0', 'Y', null, '鲁智君', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0793', 'luoqiyu', '2011-07-01', '2014-05-15 10:23:17', null, null, '3', null, 'luoqiyu@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '83708465', null, null, '2011-07-04', '男', '0', 'Y', null, '罗奇郁', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0795', '060057331833599', '2011-06-20', '2014-05-15 10:23:21', null, null, '3', null, '060057331833599@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '13272910', null, null, '2011-06-20', '男', '0', 'Y', null, '李永栋', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0801', 'lanyan', '2006-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'lanyan@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '37679574', null, null, '2006-08-01', '女', '0', 'Y', null, '蓝艳', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0803', 'yaolihua', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'yaolihua@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '10425174', null, null, '2006-08-01', '女', '0', 'Y', null, '姚利花', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0806', 'duanxiaolin', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'duanxiaolin@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '06767818', null, null, '2006-08-01', '男', '0', 'Y', null, '段小林', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0809', 'fangjinzhong', '2006-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'fangjinzhong@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '06312263', null, null, '2006-08-01', '男', '0', 'Y', null, '方进忠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0811', '547551564084666', '2006-06-01', '2014-05-15 10:23:21', null, null, '3', null, '547551564084666@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '83438756', null, null, '2006-08-01', '男', '0', 'Y', null, '向宁', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0814', '283992502327268', '2006-06-01', '2014-05-15 10:23:22', null, null, '3', null, '283992502327268@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '31999800', null, null, '2006-08-01', '男', '0', 'Y', null, '林青', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0817', 'lichao', '2006-06-01', '2014-05-23 09:49:10', null, '', '3', null, 'lichao@whizen.com', 'Y', '一级', '2014-05-23 09:49:10', '', null, null, null, '', null, '2006-08-01', '男', '0', 'Y', null, '李超', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0818', 'jiangbo', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'jiangbo@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '93602466', null, null, '2006-08-01', '男', '0', 'Y', null, '姜波', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0823', 'pengyun', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'pengyun@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '14271396', null, null, '2006-08-01', '男', '0', 'Y', null, '彭昀', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0850', 'panxisheng', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'panxisheng@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '37782105', null, null, '2006-08-01', '男', '0', 'Y', null, '潘熙圣', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0853', 'chendanxi', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'chendanxi@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '69727104', null, null, '2006-08-01', '男', '0', 'Y', null, '陈丹樨', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0854', 'chentengji', '2006-06-01', '2014-05-23 09:02:13', null, '', '3', null, 'chentengji@whizen.com', 'YY', '一级', '2014-05-23 09:02:13', '', null, null, null, '', null, '2006-08-01', '男', '0', 'Y', null, '陈腾记', '0', '188927');
INSERT INTO `infox_sysmgr_emp` VALUES ('0855', 'xuchongjin', '2006-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'xuchongjin@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '32971098', null, null, '2006-08-01', '男', '0', 'Y', null, '许崇锦', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0856', 'zhengshuxi', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'zhengshuxi@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '31455809', null, null, '2006-08-01', '男', '0', 'Y', null, '郑曙熹', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0858', '086971762587780', '2006-06-01', '2014-05-15 10:23:22', null, null, '3', null, '086971762587780@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '38547459', null, null, '2006-08-01', '男', '0', 'Y', null, '伍铭思', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0860', 'xiongliuhua', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'xiongliuhua@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '87456591', null, null, '2006-08-01', '女', '0', 'Y', null, '熊柳华', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0866', 'fengying', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'fengying@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '92902409', null, null, '2007-08-29', '女', '0', 'Y', null, '冯英', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0868', 'huangyong0868', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'huangyong0868@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '92315824', null, null, '2007-08-29', '男', '0', 'Y', null, '黄勇2', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0869', '017711857683321', '2007-06-20', '2014-05-15 10:23:21', null, null, '3', null, '017711857683321@whizen.com', null, '一级', '2014-05-15 10:23:21', null, null, null, '67182170', null, null, '2007-08-29', '男', '0', 'Y', null, '吕军', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0876', 'laohanye', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'laohanye@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '50283579', null, null, '2007-08-29', '男', '0', 'Y', null, '劳汉业', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0883', 'heweixin', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'heweixin@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '50906130', null, null, '2007-08-29', '男', '0', 'Y', null, '何伟新', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0887', 'chenyouxing', '2007-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'chenyouxing@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '62299135', null, null, '2007-08-29', '男', '0', 'Y', null, '陈有兴', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0895', '214133904944328', '2007-06-01', '2014-05-15 10:23:21', null, null, '3', null, '214133904944328@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '46346346', null, null, '2007-08-29', '男', '0', 'Y', null, '罗振坤', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0920', 'lukui', '2011-06-20', '2014-05-15 10:23:15', null, null, '3', null, 'lukui@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '44805723', null, null, '2011-07-04', '男', '0', 'Y', null, '陆魁', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0921', 'liuhui0921', '2011-06-22', '2014-05-15 10:23:15', null, null, '3', null, 'liuhui0921@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '34264545', null, null, '2011-07-04', '男', '0', 'Y', null, '刘辉', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0931', '628458873399359', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '628458873399359@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '43749646', null, null, '2011-07-04', '女', '0', 'Y', null, '汪丽平', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0936', 'kangfuhua', '2011-06-25', '2014-05-15 10:23:13', null, null, '3', null, 'kangfuhua@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '78048362', null, null, '2011-07-04', '男', '0', 'Y', null, '康富华', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0938', 'xiaoshaohai', '2011-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'xiaoshaohai@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '76706841', null, null, '2011-06-22', '男', '0', 'Y', null, '肖少海', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0950', '101552793868886', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '101552793868886@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '22401995', null, null, '2011-06-22', '女', '0', 'Y', null, '周意', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0966', 'wushun', '2011-06-22', '2014-05-15 10:23:17', null, null, '3', null, 'wushun@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '54883056', null, null, '2011-07-04', '男', '0', 'Y', null, '吴顺', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0970', '906830770527898', '2011-06-22', '2014-05-15 10:23:20', null, null, '3', null, '906830770527898@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '96005110', null, null, '2011-07-04', '女', '0', 'Y', null, '李银凤', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0971', '746941880044575', '2011-06-22', '2014-05-15 10:23:21', null, null, '3', null, '746941880044575@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '53058427', null, null, '2011-07-04', '女', '0', 'Y', null, '吴虹莉', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0974', '468951682278813', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '468951682278813@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '07845879', null, null, '2011-07-04', '女', '0', 'Y', null, '杨足霞', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('098', 'liuqinghai', '2001-06-01', '2014-05-15 10:23:10', null, null, '3', null, 'liuqinghai@whizen.com', null, '二级', '2014-05-15 10:23:10', null, null, null, '63849685', null, null, '2006-03-02', '男', '0', 'Y', null, '刘青海', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0985', '184349626058927', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '184349626058927@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '91923322', null, null, '2011-07-04', '女', '0', 'Y', null, '谢羽', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0990', 'lingshouming', '2008-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'lingshouming@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '73877438', null, null, '2011-07-14', '男', '0', 'Y', null, '凌受铭', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0993', 'xiaoweihua', '2009-06-30', '2014-05-15 10:23:11', null, null, '3', null, 'xiaoweihua@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '41979745', null, null, '2011-07-20', '男', '0', 'Y', null, '肖卫华', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0994', 'huangshijue', '2005-06-20', '2014-05-15 10:23:15', null, null, '3', null, 'huangshijue@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '03212105', null, null, '2011-07-25', '女', '0', 'Y', null, '黄仕珏', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1000', 'liping', '2009-06-25', '2014-05-15 10:23:18', null, null, '3', null, 'liping@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '54508431', null, null, '2011-08-22', '女', '0', 'Y', null, '李萍', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('1003', '866808676842773', '2009-06-30', '2014-05-15 10:23:22', null, null, '3', null, '866808676842773@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '82475009', null, null, '2011-08-29', '男', '0', 'Y', null, '廖果', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1004', 'lizhiyong', '2007-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'lizhiyong@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '21699481', null, null, '2011-09-01', '男', '0', 'Y', null, '李智勇', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1015', 'liujiajun', '2011-07-10', '2014-05-15 10:23:14', null, null, '3', null, 'liujiajun@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '94456315', null, null, '2011-10-08', '男', '0', 'Y', null, '刘加俊', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1022', 'lilixia', '2008-07-01', '2014-05-15 10:23:14', null, null, '3', null, 'lilixia@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '96994877', null, null, '2011-10-28', '女', '0', 'Y', null, '李丽霞', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1027', '756572054097161', '2009-06-30', '2014-05-15 10:23:21', null, null, '3', null, '756572054097161@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '03327074', null, null, '2011-11-02', '男', '0', 'Y', null, '张俊林', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1028', 'chenzhenrui', '2008-06-25', '2014-05-15 10:23:14', null, null, '3', null, 'chenzhenrui@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '65655027', null, null, '2011-11-03', '男', '0', 'Y', null, '陈振锐', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1034', 'wangxitao', '2011-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'wangxitao@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '60754863', null, null, '2011-11-03', '男', '0', 'Y', null, '王细桃', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1039', 'yanghaoquan', null, '2014-05-26 08:58:45', null, '', '3', null, 'yanghaoquan@whizen.com', 'N', '', '2014-05-26 08:58:45', '', null, null, '123456', '', null, '2012-11-18', '男', '0', 'Y', null, '杨浩泉', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1046', 'cenlijian', '2003-07-01', '2014-05-15 10:23:14', null, null, '3', null, 'cenlijian@whizen.com', null, '二级', '2014-05-15 10:23:14', null, null, null, '02565828', null, null, '2011-11-18', '男', '0', 'Y', null, '岑礼健', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1054', '759334536020130', '2005-06-30', '2014-05-15 10:23:22', null, null, '3', null, '759334536020130@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '80481003', null, null, '2011-12-12', '男', '0', 'Y', null, '黄勇钦', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1059', 'ganjiawei', '2010-07-01', '2014-05-15 10:23:16', null, null, '3', null, 'ganjiawei@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '27624384', null, null, '2011-12-15', '男', '0', 'Y', null, '甘嘉炜', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1060', 'zhangjushuang', '2008-06-30', '2014-05-15 10:23:11', null, null, '3', null, 'zhangjushuang@whizen.com', null, '四级', '2014-05-15 10:23:11', null, null, null, '57307612', null, null, '2011-12-21', '男', '0', 'Y', null, '张居爽', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1061', 'zengshuxiong', '2004-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'zengshuxiong@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '85505886', null, null, '2012-01-04', '男', '0', 'Y', null, '曾树雄', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1063', 'huanghe', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huanghe@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '01830045', null, null, '2012-07-02', '男', '0', 'Y', null, '黄河', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1064', '439651385483875', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '439651385483875@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '82413730', null, null, '2012-07-02', '男', '0', 'Y', null, '黄权盛', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1065', '486020925167589', '2012-06-01', '2014-05-15 10:23:21', null, null, '3', null, '486020925167589@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '51446176', null, null, '2012-07-02', '女', '0', 'Y', null, '邓洁', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1067', 'chengang1067', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'chengang1067@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '08844726', null, null, '2012-07-02', '男', '0', 'Y', null, '陈刚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1068', 'zhangyuxiang', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'zhangyuxiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '32221690', null, null, '2012-07-02', '男', '0', 'Y', null, '张玉祥', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1071', 'liuweijuan', '2012-06-03', '2014-05-15 10:23:12', null, null, '3', null, 'liuweijuan@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '49054861', null, null, '2012-07-02', '女', '0', 'Y', null, '刘伟娟', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1072', '685874772596027', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '685874772596027@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '18564387', null, null, '2012-07-02', '男', '0', 'Y', null, '张智峰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1073', '736381692509911', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '736381692509911@whizen.com', null, '一级', '2014-05-15 10:23:25', null, null, null, '97681909', null, null, '2012-07-02', '女', '0', 'Y', null, '余沁芸', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1074', '619350611951664', '2012-06-01', '2014-05-15 10:23:26', null, null, '3', null, '619350611951664@whizen.com', null, '三级', '2014-05-15 10:23:26', null, null, null, '89879417', null, null, '2012-07-02', '女', '0', 'Y', null, '胡珊珊', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1079', 'chenya', '2012-06-02', '2014-05-15 10:23:12', null, null, '3', null, 'chenya@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '56726137', null, null, '2012-07-02', '男', '0', 'Y', null, '陈亚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1082', 'zhouyaogao', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'zhouyaogao@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '84583949', null, null, '2012-07-02', '男', '0', 'Y', null, '周耀高', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1084', 'yexiaomeng', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'yexiaomeng@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '51072264', null, null, '2012-02-07', '女', '0', 'Y', null, '叶晓梦', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1097', 'wuxiaoming', '2012-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'wuxiaoming@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '07934693', null, null, '2012-07-02', '男', '0', 'Y', null, '吴晓明', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1099', '221805663251279', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '221805663251279@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '09252386', null, null, '2012-07-02', '男', '0', 'Y', null, '叶秦泰', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1101', 'songqiaohong', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'songqiaohong@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '94045783', null, null, '2012-07-02', '女', '0', 'Y', null, '宋巧红', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1104', 'chenjiansheng', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'chenjiansheng@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '71177303', null, null, '2012-07-02', '男', '0', 'Y', null, '陈剑盛', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1108', '844962744819641', '2012-06-01', '2014-05-15 10:23:21', null, null, '3', null, '844962744819641@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '96156563', null, null, '2012-07-02', '男', '0', 'Y', null, '唐亚军', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1109', 'yuguihong', '2009-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'yuguihong@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '73774827', null, null, '2012-02-21', '女', '0', 'Y', null, '余桂虹', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1110', 'xiongkun', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xiongkun@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '47449454', null, null, '2012-02-27', '男', '0', 'Y', null, '熊坤', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1112', '510453219237197', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '510453219237197@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '83897191', null, null, '2012-07-02', '男', '0', 'Y', null, '林铿鸿', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1113', '702438683314788', '2010-06-01', '2014-05-15 10:23:22', null, null, '3', null, '702438683314788@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '51336932', null, null, '2012-03-01', '男', '0', 'Y', null, '李林', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1117', 'xiaozhiguang', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'xiaozhiguang@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '19255387', null, null, '2012-03-28', '男', '0', 'Y', null, '肖智广', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1121', '465876626090197', '2002-07-01', '2014-05-15 10:23:22', null, null, '3', null, '465876626090197@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '81514101', null, null, '2012-05-02', '女', '0', 'Y', null, '张新', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1122', '903398759319908', '2009-07-10', '2014-05-15 10:23:21', null, null, '3', null, '903398759319908@whizen.com', null, '三级', '2014-05-15 10:23:21', null, null, null, '73571258', null, null, '2012-05-02', '男', '0', 'Y', null, '熊良华', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1127', '333035092357440', '2006-06-28', '2014-05-15 10:23:22', null, null, '3', null, '333035092357440@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '50068632', null, null, '2012-06-04', '男', '0', 'Y', null, '余旺盛', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1132', '563895346935199', '2012-06-26', '2014-05-15 10:23:21', null, null, '3', null, '563895346935199@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '69648924', null, null, '2012-07-02', '男', '0', 'Y', null, '李成臣', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1145', 'yinzhilan', '2012-06-02', '2014-05-15 10:23:12', null, null, '3', null, 'yinzhilan@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '89082565', null, null, '2012-07-02', '女', '0', 'Y', null, '尹芝兰', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1149', 'zouguangchu', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zouguangchu@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '79067487', null, null, '2012-07-02', '男', '0', 'Y', null, '邹广初', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1150', 'wengkaikeng', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'wengkaikeng@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '01380075', null, null, '2012-07-02', '男', '0', 'Y', null, '翁开铿', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1151', '228557429041864', '2010-06-01', '2014-05-15 10:23:24', null, null, '3', null, '228557429041864@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '35734513', null, null, '2012-07-02', '男', '0', 'Y', null, '梁翠龙', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1152', '706643793905698', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '706643793905698@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '07841320', null, null, '2012-07-02', '男', '0', 'Y', null, '唐俊', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1156', 'huangsen', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huangsen@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '25552207', null, null, '2012-07-02', '男', '0', 'Y', null, '黄森', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1158', '272046674368358', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '272046674368358@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '83007658', null, null, '2012-07-02', '男', '0', 'Y', null, '李正宗', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1159', 'jiangwenping', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'jiangwenping@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '83779774', null, null, '2012-07-02', '女', '0', 'Y', null, '蒋文萍', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1163', '590050039223152', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '590050039223152@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '71002115', null, null, '2012-07-02', '男', '0', 'Y', null, '郑贵庭', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1170', 'zhengshasha', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhengshasha@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '29122112', null, null, '2012-07-02', '女', '0', 'Y', null, '郑沙沙', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1172', 'longjianfeng', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'longjianfeng@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '52451517', null, null, '2012-07-02', '男', '0', 'Y', null, '龙建锋', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1174', '972607852431780', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '972607852431780@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '64730189', null, null, '2012-07-02', '女', '0', 'Y', null, '刘菊容', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1175', '035614183947184', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '035614183947184@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '22799139', null, null, '2012-07-02', '女', '0', 'Y', null, '刘文芳', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1176', '861588479053442', '2012-06-01', '2014-05-15 10:23:20', null, null, '3', null, '861588479053442@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '80461996', null, null, '2012-07-02', '女', '0', 'Y', null, '汪丽芬', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1178', 'xianian', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xianian@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '60524974', null, null, '2012-07-02', '女', '0', 'Y', null, '夏念', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1179', '286066522504066', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '286066522504066@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '91439038', null, null, '2012-07-02', '男', '0', 'Y', null, '周蔚', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1183', '466260175588736', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '466260175588736@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '63787519', null, null, '2012-07-02', '女', '0', 'Y', null, '王丹', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1184', '024768317547003', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '024768317547003@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '72397531', null, null, '2012-07-02', '女', '0', 'Y', null, '袁小利', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1186', '665001596072570', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '665001596072570@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '46190100', null, null, '2012-07-02', '男', '0', 'Y', null, '何云文', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1191', '549311601674713', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '549311601674713@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '79779812', null, null, '2012-07-02', '女', '0', 'Y', null, '刘慧', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1192', 'xuxiaoshuang', '2012-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xuxiaoshuang@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '62633561', null, null, '2012-07-02', '女', '0', 'Y', null, '许小双', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1193', '526490333174704', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '526490333174704@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '83104028', null, null, '2012-07-02', '女', '0', 'Y', null, '甘佳美', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1195', '429884507556290', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '429884507556290@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '28389815', null, null, '2012-07-02', '男', '0', 'Y', null, '王石峰', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1206', 'chenjiawen', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'chenjiawen@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '87154848', null, null, '2012-07-10', '女', '0', 'Y', null, '陈嘉雯', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1207', '362243823823655', '2009-06-01', '2014-05-15 10:23:20', null, null, '3', null, '362243823823655@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '97275252', null, null, '2012-07-16', '女', '0', 'Y', null, '谢洁', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1208', 'pijingjing', '2009-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'pijingjing@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '48576764', null, null, '2010-03-29', '男', '0', 'Y', null, '皮晶晶', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1211', '078863833959753', '2009-06-01', '2014-05-15 10:23:26', null, null, '3', null, '078863833959753@whizen.com', null, '四级', '2014-05-15 10:23:26', null, null, null, '21936656', null, null, '2012-08-20', '男', '0', 'Y', null, '谢贝', '1', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1212', 'chenjialiang', '2007-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'chenjialiang@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '23876298', null, null, '2012-08-27', '男', '0', 'Y', null, '陈嘉亮', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1214', '718949706965960', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '718949706965960@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '34438170', null, null, '2012-09-03', '男', '0', 'Y', null, '曾志慧', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1215', 'kongheng', '2009-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'kongheng@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '32821346', null, null, '2012-09-04', '女', '0', 'Y', null, '孔恒', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1219', '423499445534009', '2004-06-01', '2014-05-15 10:23:26', null, null, '3', null, '423499445534009@whizen.com', null, '三级', '2014-05-15 10:23:26', null, null, null, '96626799', null, null, '2012-09-25', '男', '0', 'Y', null, '向国华', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1220', 'lvjieqiang', '2010-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'lvjieqiang@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '26436819', null, null, '2012-09-30', '男', '0', 'Y', null, '吕杰强', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1223', 'zhangguofu', '2000-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'zhangguofu@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '25793515', null, null, '2012-10-31', '男', '0', 'Y', null, '张国富', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1225', 'huangteng', '2008-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangteng@whizen.com', null, '四级', '2014-05-15 10:23:15', null, null, null, '28278582', null, null, '2012-11-12', '男', '0', 'Y', null, '黄腾', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1233', '299557110714390', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '299557110714390@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '64036684', null, null, '2013-07-01', '女', '0', 'Y', null, '卢巧云', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1234', 'fangjingtao', '2008-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'fangjingtao@whizen.com', null, '三级', '2014-05-15 10:23:12', null, null, null, '84335095', null, null, '2013-04-01', '男', '0', 'Y', null, '方敬涛', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1236', 'tangxingxing', '2012-06-04', '2014-05-15 10:23:12', null, null, '3', null, 'tangxingxing@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '03986121', null, null, '2013-04-22', '男', '0', 'Y', null, '唐星星', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1237', '252542090846230', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '252542090846230@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '48933487', null, null, '2013-05-08', '男', '0', 'Y', null, '明玄宇', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1239', 'huyiwen', '2006-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huyiwen@whizen.com', null, '二级', '2014-05-15 10:23:19', null, null, null, '57533578', null, null, '2013-07-01', '男', '0', 'Y', null, '胡义文', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1240', 'huoniuyi', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'huoniuyi@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '94952337', null, null, '2013-09-02', '男', '0', 'Y', null, '霍牛义', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1243', '075837812956962', '2013-06-01', '2014-05-15 10:23:25', null, null, '3', null, '075837812956962@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '29161729', null, null, '2013-09-02', '男', '0', 'Y', null, '彭莉平', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1245', '806703464832914', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '806703464832914@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '51162674', null, null, '2013-09-02', '男', '0', 'Y', null, '李俊', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1246', '461172630767311', '2013-06-01', '2014-05-15 10:23:21', null, null, '3', null, '461172630767311@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '87309845', null, null, '2013-09-02', '男', '0', 'Y', null, '原海南', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1247', '611031529642153', '2013-06-01', '2014-05-15 10:23:25', null, null, '3', null, '611031529642153@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '12185473', null, null, '2013-09-02', '男', '0', 'Y', null, '杨万鹏', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1250', '098689418182626', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '098689418182626@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '05701280', null, null, '2013-09-02', '男', '0', 'Y', null, '黄熹舟', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1255', 'pengjianwei', '2013-06-01', '2014-05-26 08:42:04', null, '', '3', null, 'pengjianwei@whizen.com', 'N', '四级', '2014-05-26 08:42:04', '', null, null, '45600790', '', null, '2013-09-01', '男', '0', 'Y', null, '彭建威', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1257', '092874999728345', '2013-06-01', '2014-05-15 10:23:26', null, null, '3', null, '092874999728345@whizen.com', null, '一级', '2014-05-15 10:23:26', null, null, null, '94694846', null, null, '2013-09-02', '女', '0', 'Y', null, '胡璐瑶', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1260', 'luoling', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'luoling@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '17026594', null, null, '2013-09-02', '女', '0', 'Y', null, '罗玲', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1262', 'liuguanfu', '2013-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'liuguanfu@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '08587383', null, null, '2013-09-04', '男', '0', 'Y', null, '柳官富', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1263', '947518535580761', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '947518535580761@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '56957615', null, null, '2013-09-02', '男', '0', 'Y', null, '吴柯蓉', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1264', 'qinguosheng', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'qinguosheng@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '40226211', null, null, '2013-09-02', '男', '0', 'Y', null, '覃国生', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1265', 'hechenxiang', '2013-07-01', '2014-05-15 10:23:20', null, null, '3', null, 'hechenxiang@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '81781608', null, null, '2013-09-02', '男', '0', 'Y', null, '何晨翔', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1268', '816179302511532', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '816179302511532@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '62205392', null, null, '2013-09-02', '男', '0', 'Y', null, '李龙德', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1269', 'wenzhaoming', '2013-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'wenzhaoming@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '89020025', null, null, '2013-09-02', '男', '0', 'Y', null, '文兆明', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1270', '840588725416150', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '840588725416150@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '93889232', null, null, '2013-09-02', '男', '0', 'Y', null, '覃信鸿', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1272', 'mohuiling', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'mohuiling@whizen.com', null, '四级', '2014-05-26 12:29:30', null, null, null, 'm,332641', null, null, '2013-09-02', '女', '0', 'Y', null, '莫慧玲', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1274', '291972936625814', '2013-07-01', '2014-05-15 10:23:24', null, null, '3', null, '291972936625814@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '63824201', null, null, '2013-09-02', '男', '0', 'Y', null, '莫庭伟', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1275', 'xiemeifang', '2013-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xiemeifang@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '53255715', null, null, '2013-09-02', '女', '0', 'Y', null, '谢美芳', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1276', 'chenxiang', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'chenxiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '35314215', null, null, '2013-09-02', '女', '0', 'Y', null, '陈香', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1278', 'gaobeichen', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'gaobeichen@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '30743920', null, null, '2013-09-02', '女', '0', 'Y', null, '高北晨', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1280', '364780238971736', '2013-06-01', '2014-05-15 10:23:22', null, null, '3', null, '364780238971736@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '75773297', null, null, '2013-09-02', '男', '0', 'Y', null, '方钱', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1282', 'yuhanxiang', '2013-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'yuhanxiang@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '90664848', null, null, '2013-09-02', '男', '0', 'Y', null, '余翰祥', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1283', '064933094339664', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '064933094339664@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '10474817', null, null, '2013-09-02', '男', '0', 'Y', null, '贺关勇', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1285', '760084898314002', '2013-06-01', '2014-05-15 10:23:22', null, null, '3', null, '760084898314002@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '17181573', null, null, '2013-09-02', '女', '0', 'Y', null, '郑莹', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1287', 'jiangjunqiang', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'jiangjunqiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '83916026', null, null, '2013-09-02', '男', '0', 'Y', null, '蒋俊强', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1292', 'chenruibao', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'chenruibao@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '58937486', null, null, '2013-09-02', '男', '0', 'Y', null, '陈瑞保', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1294', 'zhouxian', '2011-06-30', '2014-05-15 10:23:16', null, null, '3', null, 'zhouxian@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '78227381', null, null, '2013-09-01', '女', '0', 'Y', null, '周娴', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1295', '560681622335090', '2003-06-01', '2014-05-15 10:23:21', null, null, '3', null, '560681622335090@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '38020130', null, null, '2013-09-16', '男', '0', 'Y', null, '陈润丰', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1296', '802849539207271', '2010-06-01', '2014-05-15 10:23:26', null, null, '3', null, '802849539207271@whizen.com', null, '四级', '2014-05-15 10:23:26', null, null, null, '86320684', null, null, '2013-10-15', '男', '0', 'Y', null, '骆树明', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1297', '804279212020160', '2009-06-01', '2014-05-15 10:23:22', null, null, '3', null, '804279212020160@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '06895890', null, null, '2013-11-13', '女', '0', 'Y', null, '陈莲妹', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1298', '393890642714090', '2012-06-01', '2014-05-15 10:23:22', null, null, '3', null, '393890642714090@whizen.com', null, '--', '2014-05-15 10:23:22', null, null, null, '13400457', null, null, '2013-12-09', '男', '0', 'Y', null, '段啸', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1299', 'houyannan', '2007-06-01', '2014-05-19 10:50:48', null, '2014-02-10', '1', null, 'houyannan@whizen.com', 'N', '一级', '2014-05-19 10:50:48', '', null, null, '43926540', '', null, '2014-02-10', '男', '0', 'Y', null, '侯延楠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1300', 'supeiyu', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'supeiyu@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '86374735', null, null, '2014-02-13', '女', '0', 'Y', null, '苏佩钰', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1301', 'panshuijun', '2009-06-30', '2014-05-26 13:39:06', null, '2014-02-24', '6', null, 'panshuijun@whizen.com', 'N', '四级', '2014-05-26 13:39:06', '', null, null, '90831634', '', null, '2014-02-24', '男', '0', 'Y', null, '潘水军', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1302', 'ouguijiao', '2008-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'ouguijiao@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '74271096', null, null, '2014-02-26', '女', '0', 'Y', null, '欧桂娇', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1303', '679093734316773', '2014-06-01', '2014-05-15 10:23:26', null, null, '3', null, '679093734316773@whizen.com', null, '二级', '2014-05-15 10:23:26', null, null, null, '31935010', null, null, '2014-02-26', '女', '0', 'Y', null, '冯英媛', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1304', 'liguiyang', '2014-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liguiyang@whizen.com', null, '二级', '2014-05-26 08:48:24', null, null, null, 'Lgy1104.', null, null, '2014-04-29', '女', '0', 'Y', null, '黎桂杨', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1305', 'jiangzhonghui', '2005-06-01', '2014-05-26 13:42:03', null, '2014-05-04', '6', null, 'jiangzhonghui@whizen.com', 'N', '一级', '2014-05-26 13:42:03', '', null, null, '23931678', '', null, '2014-05-04', '男', '0', 'Y', null, '江中辉', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1306', 'chenmin', '2011-06-30', '2014-05-26 13:44:42', null, '2014-05-14', '1', null, 'chenmin@whizen.com', 'N', '无', '2014-05-26 13:44:42', '', null, null, '62456533', '', null, '2014-05-14', '女', '0', 'Y', null, '陈敏', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('205', 'huangmanjing', '2007-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'huangmanjing@whizen.com', null, '二级', '2014-05-15 10:23:18', null, null, null, '44828898', null, null, '2007-03-31', '女', '0', 'Y', null, '黄蔓菁', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('9001', 'xiehe', '1996-07-01', '2014-05-26 14:39:28', null, '', '3', null, 'xiehe@whizen.com', 'N', '一级', '2014-05-26 14:39:28', '', null, null, '60713739', '', null, '2012-04-01', '男', '0', 'Y', null, '谢禾', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9005', 'xuqiang', '2007-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'xuqiang@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '65903908', null, null, '2012-06-01', '男', '0', 'Y', null, '许强', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9009', 'qinwei', '2012-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'qinwei@whizen.com', null, '二级', '2014-05-26 14:37:15', null, null, null, '94637363', null, null, '2012-06-25', '女', '0', 'Y', null, '秦维', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9010', 'zhengyongfu', '2008-03-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhengyongfu@whizen.com ', null, '一级', '2014-05-26 14:37:15', null, null, null, '70089771', null, null, '2012-07-02', '男', '0', 'Y', null, '郑永福', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9017', 'wangyongming', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangyongming@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '53357560', null, null, '2013-07-03', '男', '0', 'Y', null, '汪永明', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9019', 'xueben', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'xueben@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '22365038', null, null, '2013-06-03', '男', '0', 'Y', null, '薛奔', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9023', 'luxiaoming', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'luxiaoming@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '21352020', null, null, '2013-07-10', '男', '0', 'Y', null, '陆晓明', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9032', 'chenzaihan', '2011-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'chenzaihan@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '79836386', null, null, '2012-08-01', '女', '0', 'Y', null, '程仔涵', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9040', 'wangguocheng', '2010-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangguocheng@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '04365419', null, null, '2012-08-13', '男', '0', 'Y', null, '王果成', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9043', 'xuhao', '2008-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'xuhao@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '35982933', null, null, '2012-09-10', '男', '0', 'Y', null, '许浩', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9045', 'hanjinling', '2007-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'hanjinling@whizen.com', null, '一级', '2014-05-26 14:37:15', null, null, null, '80646276', null, null, '2012-10-08', '女', '0', 'Y', null, '韩金玲', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9049', 'zhuchaomin', '2012-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhuchaomin@whizen.com ', null, '四级', '2014-05-26 14:37:15', null, null, null, '66453782', null, null, '2013-02-25', '男', '0', 'Y', null, '朱超民', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9050', 'liyanqi', '2006-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'liyanqi@whizen.com ', null, '一级', '2014-05-26 14:37:15', null, null, null, '88170902', null, null, '2013-02-26', '男', '0', 'Y', null, '李彦祺', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9051', 'jiyue', '2000-03-01', '2014-05-26 14:37:15', null, null, '3', null, 'jiyue@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '23448528', null, null, '2013-03-11', '男', '0', 'Y', null, '季玥', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9052', 'guxiaoyan', '2009-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'guxiaoyan@whizen.com', null, '二级', '2014-05-26 14:37:15', null, null, null, '25810439', null, null, '2013-03-18', '女', '0', 'Y', null, '顾晓彦', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9053', 'liuhongtao', '2009-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'liuhongtao@whizen.com', null, '一级', '2014-05-26 14:37:15', null, null, null, '41309060', null, null, '2013-04-01', '男', '0', 'Y', null, '刘洪涛', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9055', 'caixiaohua', '2011-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'caixiaohua@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '15254502', null, null, '2013-04-15', '男', '0', 'Y', null, '蔡晓桦', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9056', 'zhangruixing', '2012-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhangruixing@whizen.com ', null, '三级', '2014-05-26 14:37:15', null, null, null, '56253903', null, null, '2013-06-03', '女', '0', 'Y', null, '张瑞星', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9058', 'caoting', '2012-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'caoting@whizen.com ', null, '四级', '2014-05-26 14:37:15', null, null, null, '14346177', null, null, '2013-06-17', '女', '0', 'Y', null, '曹婷', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9059', 'longxiao', '2004-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'longxiao@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '28638361', null, null, '2013-06-17', '女', '0', 'Y', null, '龙晓', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9061', 'caiqing', '2006-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'caiqing@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '83821804', null, null, '2013-09-02', '男', '0', 'Y', null, '蔡青', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9062', 'zhangxuejin', '2008-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhangxuejin@whizen.com ', null, '三级', '2014-05-26 14:37:15', null, null, null, '07153374', null, null, '2013-09-22', '男', '0', 'Y', null, '张学进', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9063', 'tantaiwushan', '2010-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'tantaiwushan@whizen.com ', null, '一级', '2014-05-26 14:37:15', null, null, null, '43196019', null, null, '2013-09-23', '男', '0', 'Y', null, '澹台武山', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9064', 'jiangbin', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'jiangbin@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '79654944', null, null, '2013-09-16', '男', '0', 'Y', null, '姜斌', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9067', 'hanbaoqiang', '2012-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'hanbaoqiang@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '07264980', null, null, '2013-10-24', '男', '0', 'Y', null, '韩宝强', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9068', 'make', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'make@whizen.com ', null, 'JTEST-E', '2014-05-26 14:37:15', null, null, null, '90201866', null, null, '2013-11-04', '男', '0', 'Y', null, '马可', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9069', 'heyuan', '2011-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'heyuan@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '20060789', null, null, '2013-11-04', '女', '0', 'Y', null, '何媛', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9070', 'wangqiongshan', '2006-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangqiongshan@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '98413739', null, null, '2013-11-18', '男', '0', 'Y', null, '王琼善', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9071', 'wangyadong', '2010-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangyadong@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '53352778', null, null, '2013-11-18', '男', '0', 'Y', null, '王亚东', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9072', 'zhangjun', '2007-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhangjun@whizen.com ', null, '一级', '2014-05-26 14:37:15', null, null, null, '72438242', null, null, '2013-12-09', '男', '0', 'Y', null, '张俊', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9073', 'yuyi', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'yuyi@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '35585047', null, null, '2013-12-31', '女', '0', 'Y', null, '余意', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9074', 'zhuchun', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhuchun@whizen.com', null, '一级', '2014-05-26 14:37:15', null, null, null, '47738105', null, null, '2013-12-31', '女', '0', 'Y', null, '朱纯', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9075', 'linchangxiang', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'linchangxiang@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '70641768', null, null, '2013-12-31', '男', '0', 'Y', null, '林昌翔', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9076', 'wangchao1286', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangchao1286@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '82158189', null, null, '2013-12-31', '男', '0', 'Y', null, '王超', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9077', 'houchang', '2013-06-01', '2014-05-26 14:44:15', null, '2014-01-06', '1', null, 'houchang@whizen.com', 'N', '无级', '2014-05-26 14:44:15', '', null, null, '57559644', '', null, '2014-01-06', '男', '0', 'Y', null, '侯昌', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9079', 'huangchao', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'huangchao@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '87997522', null, null, '2013-07-09', '男', '0', 'Y', null, '黄超', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9080', 'lili', '2006-03-01', '2014-05-26 14:48:46', null, '2014-03-06', '1', null, 'lili@whizen.com', 'N', '一级', '2014-05-26 14:48:46', '', null, null, '47714232', '', null, '2014-03-06', '男', '0', 'Y', null, '李蠡', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9081', 'dingxin', '2012-06-01', '2014-05-26 14:47:42', null, '2014-03-10', '1', null, 'dingxin@whizen.com', 'N', '三级', '2014-05-26 14:47:42', '', null, null, '48795978', '', null, '2014-03-10', '男', '0', 'Y', null, '丁鑫', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9082', 'danchangjiang', '2012-07-01', '2014-05-26 14:52:17', null, '2014-03-20', '1', null, 'danchangjiang@whizen.com', 'N', 'JTEST-E', '2014-05-26 14:52:17', '', null, null, '62862401', '', null, '2014-03-20', '男', '0', 'Y', null, '单长江', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9084', 'lidongdong', '2012-06-01', '2014-05-26 14:58:01', null, '2014-03-21', '1', null, 'lidongdong@whizen.com', 'N', '三级', '2014-05-26 14:58:01', '', null, null, '99509179', '', null, '2014-03-21', '男', '0', 'Y', null, '李冬冬', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9085', 'tiepeng', '2011-06-01', '2014-05-26 14:59:58', null, '2014-04-22', '1', null, 'tiepeng@whizen.com', 'N', '三级', '2014-05-26 14:59:58', '', null, null, '18443938', '', null, '2014-04-22', '男', '0', 'N', null, '帖鹏', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9086', 'wangcheng', '2011-01-01', '2014-05-26 15:01:51', null, '2014-05-04', '1', null, 'wangcheng@whizen.com', 'N', '二级', '2014-05-26 15:01:51', '', null, null, '70294976', '', null, '2014-05-04', '男', '0', 'N', null, '王诚', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9087', 'zhoupeilin', '2012-07-01', '2014-05-26 15:03:04', null, '2014-05-14', '1', null, 'zhoupeilin@whizen.com', 'N', '无级', '2014-05-26 15:03:04', '', null, null, '59967317', '', null, '2014-05-12', '男', '0', 'N', null, '周培林', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9999', 'admin', null, null, null, null, null, null, 'yhqmcq@126.com', null, null, null, null, null, null, '12345678', null, null, null, null, null, 'Y', null, '超级管理员', '9999', null);

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
INSERT INTO `infox_sysmgr_empjob` VALUES ('054649', '2014-05-15 08:15:34', '', '', '高级系统集成工程师', '高级系统集成工程师', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('059294', '2014-05-14 16:16:43', '', '', '副技术总监', '副技术总监', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('060923', '2014-05-15 16:38:42', '', '', '开发部副经理', '开发部副经理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('084650', '2014-05-14 16:16:23', '', '', '质量保证员', 'SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('108539', '2014-05-14 16:17:06', '', '', '开发部主管', '开发部主管', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('118343', '2014-05-15 08:13:04', '', '', '后勤', '后勤', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('140873', '2014-05-15 08:12:17', '', '', '招聘专员', '招聘专员', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('156378', '2014-05-15 08:14:22', '', '', '采购部专员', '采购部专员', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('169356', '2014-05-15 08:20:49', '', '', '开发事业部总监', '开发事业部总监', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('198233', '2014-05-15 08:12:46', '', '', '劳动关系专员', '劳动关系专员', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('200454', '2014-05-14 16:16:55', '', '', '开发部经理', '开发部经理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('202912', '2014-05-15 08:17:29', '', '', '质量保证员助理', 'SQA助理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('203471', '2014-05-15 08:13:13', '', '', '前台', '前台', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('219377', '2014-05-15 08:17:47', '', '', '品质部经理', '部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('222368', '2014-05-14 16:17:18', '', '', '主管系统工程师', '主管SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('279901', '2014-05-15 08:18:29', '', '', '项目管理专员', 'PJ专员', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('304643', '2014-05-15 08:15:53', '', '', '系统支持工程师', '系统支持工程师', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('308985', '2014-05-15 08:20:32', '', '', '技术总监', '技术总监', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('361960', '2014-05-15 08:16:44', '', '', '主管质量保证员', '主管SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('364361', '2014-05-14 16:17:41', '', '', '高级系统工程师', '高级SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('366186', '2014-05-14 08:17:56', '', '', '开发本部总经理', '本部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('412933', '2014-05-15 16:38:09', '', '', '项目经理', '项目经理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('436803', '2014-05-14 16:17:23', '', '', '系统工程师', 'SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('448906', '2014-05-15 08:11:29', '', '', '综合管理部本部总经理', '本部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('462235', '2014-05-15 08:17:07', '', '', '高级质量保证员', '高级SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('509384', '2014-05-15 08:13:57', '', '', '出纳', '出纳', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('560672', '2014-05-15 08:15:18', '', '', '系统集成部主管', 'SI部主管', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('575853', '2014-05-14 16:17:30', '', '', '高级程序员', '高级PG', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('588192', '2014-05-15 08:22:14', '', '', '系统集成部部门助理', 'SI部门助理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('592397', '2014-05-15 08:13:48', '', '', '会计', '会计', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('753446', '2014-05-15 08:13:39', '', '', '财务部主管', '财务部主管', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('791596', '2014-05-14 16:17:35', '', '', '程序员', 'PG', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('806025', '2014-05-15 08:14:54', '', '', '系统集成部经理', 'SI部经理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('829929', '2014-05-15 08:12:28', '', '', '薪酬福利专员', '薪酬福利专员', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('880887', '2014-05-15 08:12:55', '', '', '项目申报专员', '项目申报专员', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('888332', '2014-05-15 08:18:49', '', '', '项目管理部经理', 'PJ部部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('918824', '2014-05-15 08:14:09', '', '', '行政助理', '行政助理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('929217', '2014-04-22 08:42:38', '', '', '成本核算专员', '成本核算专员', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('938396', '2014-05-15 08:22:45', '', '', '公司总裁', '总裁', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('948486', '2014-05-15 08:21:01', '', '', '副总裁', '副总裁', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('953023', '2014-05-15 08:15:45', '', '', '系统集成工程师', '系统集成工程师', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('998481', '2014-05-14 16:16:18', '', '', '中级质量保证员', '中级SQA', null);

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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0295', '054649');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0588', '054649');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1127', '054649');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1239', '054649');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9010', '060923');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0027', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0053', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0067', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0150', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0155', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0215', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0217', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0236', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0306', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0348', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0351', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0413', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0428', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0559', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0684', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0704', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0806', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0809', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0814', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0850', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0855', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0856', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0883', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1305', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0738', '118343');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0201', '140873');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0449', '156378');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1000', '198233');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0032', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0050', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0052', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0190', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('055', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0675', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0817', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0854', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0858', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('098', '200454');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1240', '202912');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1265', '202912');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1272', '202912');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1278', '202912');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1233', '203471');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1303', '203471');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1304', '203471');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0317', '219377');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('051', '219377');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0013', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0070', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0119', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0216', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0262', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0280', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0284', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0394', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0480', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0564', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0583', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0601', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0679', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0811', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0853', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0866', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0868', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0869', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0994', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1004', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1046', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1084', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1121', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1219', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1223', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1299', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9005', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9043', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9045', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9050', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9051', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9059', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9061', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9062', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9070', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9072', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1183', '279901');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1300', '279901');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0694', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0730', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0752', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0753', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0792', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1064', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1097', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1298', '304643');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0160', '361960');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0183', '361960');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('031', '361960');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0207', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0377', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0803', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0818', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0823', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('049', '366186');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9001', '366186');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9080', '412933');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0314', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0322', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0452', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0498', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0520', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0546', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0569', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0577', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0579', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0590', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0624', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0627', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0658', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0666', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0669', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0671', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0674', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0676', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0681', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0715', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0721', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0734', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0741', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0757', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0801', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0860', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0876', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0887', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0990', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0993', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1054', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1060', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1110', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1113', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1122', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1207', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1225', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1295', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1297', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9032', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9052', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9053', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9055', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9063', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9071', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('003', '448906');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0086', '509384');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0197', '560672');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0453', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0603', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0621', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0626', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0670', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0714', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0718', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0735', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0747', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0748', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0749', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0755', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0790', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0793', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0795', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0920', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0921', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0931', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0936', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0938', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0950', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0966', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0970', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0971', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0974', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0985', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1003', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1015', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1022', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1027', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1028', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1034', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1059', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1063', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1065', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1067', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1068', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1071', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1072', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1073', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1074', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1079', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1082', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1099', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1101', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1104', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1109', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1117', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1145', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1150', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1152', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1156', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1158', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1170', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1172', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1174', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1175', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1178', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1179', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1186', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1191', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1192', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1193', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1206', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1212', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1214', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1215', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1220', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1234', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1236', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1237', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1294', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1296', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1302', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9040', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9049', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9064', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9067', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9068', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9069', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9081', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9082', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9084', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9085', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9086', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9087', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0696', '588192');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0301', '592397');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0100', '753446');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0678', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1108', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1112', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1132', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1149', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1151', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1159', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1163', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1176', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1184', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1195', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1211', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1243', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1245', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1246', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1247', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1250', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1255', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1257', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1260', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1262', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1263', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1264', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1268', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1269', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1270', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1274', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1275', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1276', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1280', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1282', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1283', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1285', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1287', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1292', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1301', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1306', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9009', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9017', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9019', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9023', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9056', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9058', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9073', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9074', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9075', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9076', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9077', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9079', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0007', '806025');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0342', '829929');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0339', '880887');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1061', '888332');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('205', '918824');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0001', '938396');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0562', '953023');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1208', '953023');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0137', '998481');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0895', '998481');

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
INSERT INTO `infox_sysmgr_emp_role` VALUES ('933556', '0001');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0007');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0013');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0027');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '003');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0032');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0050');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0052');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0053');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0067');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0070');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0086');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('367248', '0100');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0119');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '0137');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0150');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0155');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '0160');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '0183');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0190');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0197');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0201');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0207');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0215');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0216');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0217');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0236');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0262');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0280');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0284');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0295');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0301');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0306');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '031');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0314');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '0317');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0322');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0339');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0342');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0348');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0351');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0377');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0394');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0413');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0428');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('348694', '0449');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0452');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0453');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0480');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '049');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0498');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '051');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0520');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0546');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '055');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0559');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0562');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0564');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0569');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0577');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0579');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0583');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0588');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0590');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0601');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0603');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0621');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0624');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0626');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0627');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0658');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0666');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0669');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0670');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0671');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0674');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0675');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0676');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0678');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0679');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0681');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0684');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0694');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0696');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0704');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0714');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0715');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0718');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0721');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0730');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0734');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0735');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0738');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0741');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0747');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0748');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0749');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0752');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0753');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0755');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0757');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0790');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0792');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0793');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0795');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0801');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0803');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0806');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0809');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0811');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0814');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0817');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0818');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0823');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0850');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0853');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0854');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0855');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0856');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0858');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0860');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0866');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0868');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0869');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0876');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0883');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0887');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '0895');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0920');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0921');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0931');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0936');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0938');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0950');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0966');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0970');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0971');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0974');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '098');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0985');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0990');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0993');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0994');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('770063', '1000');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1003');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1004');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1015');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1022');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1027');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1028');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1034');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '1039');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1046');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1054');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1059');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1060');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1061');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1063');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1064');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1065');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1067');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1068');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1071');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1072');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1073');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1074');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1079');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1082');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1084');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1097');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1099');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1101');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1104');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1108');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1109');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1110');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1112');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1113');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1117');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1121');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1122');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1127');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1132');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1145');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1149');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1150');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1151');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1152');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1156');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1158');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1159');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1163');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1170');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1172');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1174');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1175');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1176');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1178');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1179');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1183');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1184');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1186');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1191');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1192');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1193');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1195');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1206');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1207');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1208');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1211');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1212');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1214');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1215');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1219');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1220');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1223');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1225');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1233');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1234');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1236');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1237');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1239');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '1240');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1243');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1245');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1246');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1247');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1250');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1257');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1260');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1262');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1263');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1264');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '1265');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1268');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1269');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1270');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '1272');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1274');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1275');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1276');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '1278');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1280');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1282');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1283');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1285');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1287');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1292');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1294');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1295');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1296');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1297');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1298');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1299');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('687798', '1300');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1302');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1303');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1304');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '205');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9001');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9005');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9009');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9010');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9017');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9019');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9023');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9032');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9040');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9043');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9045');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9049');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9050');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9051');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9052');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9053');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9055');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9056');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9058');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9059');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9061');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9062');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9063');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9064');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9067');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9068');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9069');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9070');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9071');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9072');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9073');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9074');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9075');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9076');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9077');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9079');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9080');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9081');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9082');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9084');

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
INSERT INTO `infox_sysmgr_menu` VALUES ('190762', null, '2014-05-15 11:02:24', null, 'project/project_report/employeeTaskTimeReport.do', 'icon-standard-application-view-tile', '2014-05-15 11:02:24', null, '稼动率查询', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('200025', null, '2014-02-13 10:31:53', null, 'sysmgr/task/task_main.do', 'icon-standard-clock-red', '2014-02-13 10:31:53', null, '定时作业', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('229865', null, '2014-03-07 15:21:36', null, 'sysmgr/org/org_main.do', 'icon-standard-chart-organisation', '2014-03-07 15:21:36', null, '公司部门', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('303350', null, '2014-05-26 13:55:09', null, 'sysmgr/employee/import_emp_data.do', '', '2014-05-26 13:55:09', null, '人员信息上传', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('335051', null, '2014-05-23 09:01:09', null, 'sysmgr/employee/get.do', '', '2014-05-23 09:01:09', null, '获取详细信息', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('361454', null, '2014-02-25 19:14:27', null, 'project/project_main/project_main.do', 'icon-standard-application-side-expand', '2014-02-25 19:14:27', null, '项目管理', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('412653', null, '2014-05-19 10:40:28', null, 'sysmgr/org/get.do', 'icon-standard-application-view-tile', '2014-05-19 10:40:28', null, '获取部门信息', '1', null, null, 'O', '229865', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('450915', null, '2014-05-23 10:04:46', null, 'sysmgr/menu/treegrid.do', '', '2014-05-23 10:04:46', null, '查询', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('459345', null, '2014-05-23 08:38:57', null, 'project/project_report/employeeTaskTimeReport_leader.do', '', '2014-05-23 08:38:57', null, '稼动率总裁专用', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('502906', null, '2014-03-07 10:40:32', null, 'project/project_report/project_tasktime_main.do', 'icon-standard-chart-pie', '2014-03-07 10:40:32', null, '稼动率管理', '0', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('510303', null, '2014-05-15 11:03:39', null, 'sysmgr/role/getPermission.do', '', '2014-05-15 11:03:39', null, '角色资源关联', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('518167', null, '2014-05-23 10:11:57', null, 'project/project_main/get_ProjectDevList.do', '', '2014-05-23 10:11:57', null, '开发人员详细信息查询内容', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('527852', null, '2014-03-07 15:21:26', null, 'sysmgr/empjob/empjob_main.do', 'icon-standard-user-red', '2014-03-07 15:21:26', null, '公司岗位', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('547345', null, '2014-02-22 00:50:30', null, 'sysmgr/employee/emp_main.do', 'icon-hamburg-my-account', '2014-02-22 00:50:30', null, '员工管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('643077', null, '2014-05-15 11:04:27', null, 'sysmgr/employee/getPermission.do', 'icon-standard-application-view-tile', '2014-05-15 11:04:27', null, '用户角色关联', '1', null, null, 'O', '068671', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('668356', null, '2014-05-19 11:15:30', null, 'project/project_main/upload.do', '', '2014-05-19 11:15:30', null, '导入项目信息', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('670332', null, '2014-05-19 11:16:58', null, 'project/project_main/import_project_info.do', '', '2014-05-19 11:16:58', null, '导入Excel', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('675303', null, '2014-02-18 14:50:50', null, 'sysmgr/filemanager/file_main.do', 'icon-standard-folder-database', '2014-02-18 14:50:50', null, '文件管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('699829', null, '2014-05-23 08:37:18', null, 'project/project_main/datagrid_leader.do', '', '2014-05-23 08:37:18', null, '项目总裁专用', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('707850', null, '2014-05-26 13:54:49', null, 'sysmgr/employee/upload.do', '', '2014-05-26 13:54:49', null, '人员信息上传页面', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('716776', null, '2014-03-24 16:03:50', null, 'project/project_main/addMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('726776', null, '2014-03-24 16:03:50', null, 'project/project_main/deleteMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('736776', null, '2014-03-24 16:03:50', null, 'project/overtime/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('746776', null, '2014-03-24 16:03:50', null, 'project/overtime/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('756776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('766776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/revert.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '移除开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('776776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/set_workdate.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发人员起止日期操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('781776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_detail.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询详细', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('782776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_member.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发团队人员页面', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('783776', null, '2014-05-23 10:10:05', null, 'project/project_main/project_Devdetail.do', 'icon-standard-layout-header', '2014-05-23 10:10:05', null, '开发人员详细列表', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('784776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_maillist.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '项目参与人员邮件列表', '1', null, null, 'O', '361454', 'Y');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('785756', null, '2014-05-23 10:01:50', null, 'sysmgr/menu/get.do', '', '2014-05-23 10:01:50', null, '资源详细信息', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785761', null, '2014-03-24 16:03:50', null, 'sysmgr/role/role_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785762', null, '2014-03-24 16:03:50', null, 'sysmgr/role/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785763', null, '2014-03-24 16:03:50', null, 'sysmgr/role/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785764', null, '2014-03-24 16:03:50', null, 'sysmgr/role/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785765', null, '2014-03-24 16:03:50', null, 'sysmgr/role/treegrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785766', null, '2014-03-24 16:20:22', null, 'sysmgr/role/set_grant.do', 'icon-standard-layout-header', '2014-03-24 16:20:22', null, '设置授权', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785771', null, '2014-03-24 16:03:50', null, 'project/project_main/project_form.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '表单', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785772', null, '2014-03-24 16:03:50', null, 'project/project_main/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785773', null, '2014-03-24 16:03:50', null, 'project/project_main/edit.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '编辑', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785774', null, '2014-03-24 16:03:50', null, 'project/project_main/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785775', null, '2014-03-24 16:03:50', null, 'project/project_main/datagrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('785776', null, '2014-03-24 16:03:50', null, 'project/project_main/statusChange.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置项目状态', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('786776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_member_overtime.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '加班状态设置页面', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('796575', null, '2014-05-23 09:46:23', null, 'project/project_main/get.do', '', '2014-05-23 09:46:23', null, '项目详细信息', '1', null, null, 'O', '361454', 'Y');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('814262', null, '2014-05-23 10:13:23', null, 'project/project_report/getMemberInfoListDialog.do', '', '2014-05-23 10:13:23', null, '稼动率详细页面', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('825118', null, '2014-04-14 08:55:25', null, 'project/project_main/emp_main.do', 'icon-standard-application-view-list', '2014-04-14 08:55:25', null, '人员信息', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('837844', null, '2014-02-13 10:39:12', null, 'druid/druid.do', 'icon-standard-database-link', '2014-02-13 10:39:12', null, 'Druid监控', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('863930', null, '2014-02-13 10:39:16', null, 'sysmgr/menu/menu_main.do', 'icon-standard-application-side-boxes', '2014-02-13 10:39:16', null, '资源管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('876715', null, '2014-02-10 21:28:13', null, '', 'icon-standard-application-xp-terminal', '2014-02-10 21:28:13', null, '系统管理', '1', null, null, 'R', null, 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('878344', null, '2014-02-13 10:39:21', null, 'sysmgr/role/role_main.do', 'icon-standard-award-star-silver-3', '2014-02-13 10:39:21', null, '角色管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('896988', null, '2014-05-23 10:14:15', null, 'project/project_report/getMemberInfoList.do', '', '2014-05-23 10:14:15', null, '稼动率详细内容查询', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('981451', null, '2014-05-26 09:02:16', null, 'project/project_main/get_ProjectAllDevMember.do', '', '2014-05-26 09:02:16', null, '项目加班状况查询', '1', null, null, 'O', '361454', 'Y');

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
INSERT INTO `infox_sysmgr_org_dept` VALUES ('126300', null, '2014-05-14 15:52:24', null, '', null, null, '第二开发本部开发二部', null, '2014-05-14 15:52:24', null, '0', '0', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', 'JD2本部', 'JD2-2', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('131621', null, '2014-05-14 15:54:56', null, '', null, null, '项目管理部', null, '2014-05-14 15:54:56', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '华智', '项目管理部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('188927', null, '2014-05-14 15:51:29', null, '', null, null, '第一开发本部', null, '2014-05-14 15:51:29', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', 'JD1本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('300199', null, '2014-05-26 10:23:44', null, '', null, null, '总裁办', null, '2014-05-26 10:23:44', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '广东华智科技有限公司', '总裁办', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('398250', null, '2014-05-14 15:50:21', null, '', null, null, '第一开发本部开发二部', null, '2014-05-14 15:50:21', null, '0', '0', '0', '0', '0', '0', '0', '31', '0', '0', '0', '0', 'JD1', 'JD1-2', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('400771', null, '2014-04-21 13:11:31', null, '', null, null, '财务部', null, '2014-04-21 13:11:31', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理部', '财务部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('429710', null, '2014-05-15 09:31:53', null, '', null, null, '品质保证部', null, '2014-05-15 09:31:53', null, '0', '0', '0', '0', '0', '0', '0', '12', '0', '0', '0', '0', '华智', '品质保证部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('461023', null, '2014-05-14 15:50:50', null, '', null, null, '第一开发本部开发三部', null, '2014-05-14 15:50:50', null, '0', '0', '0', '0', '0', '0', '0', '18', '0', '0', '0', '0', 'JD1', 'JD1-3', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('474835', null, '2014-04-21 13:11:48', null, '', null, null, '采购部', null, '2014-04-21 13:11:48', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '综合管理部', '采购部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('526169', null, '2014-05-19 10:42:34', null, '', null, null, '北京支社', null, '2014-05-19 10:42:34', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '北京支社', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('548996', null, '2014-05-14 15:52:01', null, '', null, null, '第二开发本部开发一部', null, '2014-05-14 15:52:01', null, '0', '0', '0', '0', '0', '0', '0', '40', '0', '0', '0', '0', 'JD2本部', 'JD2-1', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('634670', null, '2014-05-19 10:42:16', null, '', null, null, '苏州软件开发部', null, '2014-05-19 10:42:16', null, '0', '0', '0', '0', '0', '0', '0', '43', '0', '0', '0', '0', '苏州支社', '苏州软件开发部', null, 'D', '886155');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('647431', null, '2014-05-14 15:59:46', null, '', null, null, '系统集成部', null, '2014-05-14 15:59:46', null, '0', '0', '0', '0', '0', '0', '0', '17', '0', '0', '0', '0', '华智', '系统集成部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('682781', null, '2014-05-14 15:58:38', null, '', null, null, '综合管理本部', null, '2014-05-14 15:58:38', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', '综合管理本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('702229', null, '2014-05-14 15:52:53', null, '', null, null, '第二开发本部开发三部', null, '2014-05-14 15:52:53', null, '0', '0', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', 'JD2本部', 'JD2-3', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('723327', null, '2014-05-14 15:49:45', null, '', null, null, '第一开发本部开发一部', null, '2014-05-14 15:49:45', null, '0', '0', '0', '0', '0', '0', '0', '55', '0', '0', '0', '0', 'JD1', 'JD1-1', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('853418', null, '2014-05-14 15:59:28', null, '', null, null, '人力资源部', null, '2014-05-14 15:59:28', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理本部', '人力资源部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('886155', null, '2014-05-19 10:42:02', null, '', null, null, '苏州支社', null, '2014-05-19 10:42:02', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '苏州支社', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('917489', null, '2014-05-14 15:51:19', null, '', null, null, '第二开发本部', null, '2014-05-14 15:51:19', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', 'JD2本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('943553', null, '2014-05-14 15:55:22', null, '', null, null, '北京开发部', null, '2014-05-14 15:55:22', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '北京分公司', '北京开发部', null, 'D', '526169');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('947868', null, '2014-05-14 15:58:58', null, '', null, null, '总务部', null, '2014-05-14 15:58:58', null, '0', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '综合管理本部', '总务部', null, 'D', '682781');
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
INSERT INTO `infox_sysmgr_role` VALUES ('037908', '2014-05-26 13:22:29', null, '', 'ext_group', null, '部长', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('348694', '2014-05-15 10:35:32', null, '采购部专员', 'ext_group', null, '采购部专员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('367248', '2014-05-15 10:38:04', null, '财务部主管', 'ext_group', null, '财务部主管', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('390547', '2014-05-23 08:41:25', null, '', 'ext_group', null, '个人查询', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('687798', '2014-05-15 10:39:14', null, '项目管理专员', 'ext_group', null, '项目管理专员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('770063', '2014-05-15 10:34:49', null, '人事管理', 'ext_group', null, '人事管理', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('921908', '2014-05-15 10:56:49', null, '品质部超级管理员', 'ext_group', null, '品质部超级管理员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('933556', '2014-05-23 08:39:37', null, '', 'ext_group', null, '总裁专用', null, null);

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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '068671');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '136992');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '200025');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '303350');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '335051');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '335051');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '335051');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '412653');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '412653');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '412653');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '450915');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '510303');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '643077');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '675303');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '699829');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '699829');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '699829');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '707850');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785716');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785717');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785718');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785729');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785731');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785731');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785732');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785732');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785733');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785733');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785734');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785734');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785736');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785754');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785754');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785754');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785755');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785755');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785755');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785755');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785755');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785755');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785756');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785761');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785763');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785764');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785765');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785766');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7a5711');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7a5712');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7a5713');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7a5717');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7a5718');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7c2727');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7c5717');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7c5718');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7c5729');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '7c5756');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '837844');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '863930');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '878344');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '981451');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '981451');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '981451');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '981451');

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
