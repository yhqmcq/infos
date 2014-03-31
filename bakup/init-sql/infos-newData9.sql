/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50518
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-03-31 11:04:21
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
  `startDate` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PEW_PID` varchar(255) DEFAULT NULL,
  `PROJECT_ID` varchar(255) DEFAULT NULL,
  `project_role` varchar(255) DEFAULT NULL,
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
INSERT INTO `infox_project_emp_working` VALUES ('015211', '2014-03-11 13:19:58', '2014-03-31', '2014-03-10', '1', '0601', null, '757271', '1');
INSERT INTO `infox_project_emp_working` VALUES ('027876', '2014-03-17 11:54:42', '2014-03-17', '2014-01-26', '4', '0675', null, '553171', '3');
INSERT INTO `infox_project_emp_working` VALUES ('046875', '2014-03-07 11:25:48', '2014-05-26', '2014-03-03', '1', '0993', null, '833942', '1');
INSERT INTO `infox_project_emp_working` VALUES ('048979', '2014-03-10 11:40:56', '2014-03-28', '2014-02-07', '1', '1212', null, '279349', '4');
INSERT INTO `infox_project_emp_working` VALUES ('051072', '2014-03-10 11:25:50', '2014-03-31', '2013-12-02', '1', '0966', null, '228591', '4');
INSERT INTO `infox_project_emp_working` VALUES ('052101', '2014-03-11 14:04:38', '2014-03-31', '2014-03-03', '1', '0215', null, '854328', '1');
INSERT INTO `infox_project_emp_working` VALUES ('081139', '2014-03-07 11:22:55', '2014-05-26', '2014-03-03', '1', '1236', null, '628063', '4');
INSERT INTO `infox_project_emp_working` VALUES ('082220', '2014-03-11 14:04:38', '2014-06-13', '2014-03-03', '1', '0453', null, '854328', '4');
INSERT INTO `infox_project_emp_working` VALUES ('118130', '2014-03-17 11:59:19', '2014-03-17', '2014-03-04', '4', '0747', null, '830753', '4');
INSERT INTO `infox_project_emp_working` VALUES ('140447', '2014-03-11 14:04:38', '2014-06-13', '2014-03-03', '1', '0876', null, '854328', '4');
INSERT INTO `infox_project_emp_working` VALUES ('152392', '2014-03-11 14:33:08', '2014-05-16', '2014-02-10', '3', null, '496628', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('175058', '2014-03-11 13:19:58', '2014-03-31', '2014-03-10', '1', '1292', null, '757271', '5');
INSERT INTO `infox_project_emp_working` VALUES ('175163', '2014-03-10 12:03:26', '2014-04-21', '2014-03-31', '3', null, '561137', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('181912', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1082', null, '709795', '4');
INSERT INTO `infox_project_emp_working` VALUES ('183252', '2014-03-11 13:19:58', '2014-03-31', '2014-03-10', '1', '1264', null, '757271', '5');
INSERT INTO `infox_project_emp_working` VALUES ('193501', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1084', null, '709795', '1');
INSERT INTO `infox_project_emp_working` VALUES ('201903', '2014-03-07 11:30:34', '2014-04-15', '2014-03-03', '1', '1074', null, '709795', '3');
INSERT INTO `infox_project_emp_working` VALUES ('235521', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1071', null, '709795', '4');
INSERT INTO `infox_project_emp_working` VALUES ('262153', '2014-03-11 08:46:33', '2014-05-24', '2014-03-10', '1', '0520', null, '259872', '1');
INSERT INTO `infox_project_emp_working` VALUES ('263539', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '1299', null, '255570', '3');
INSERT INTO `infox_project_emp_working` VALUES ('264589', '2014-03-07 11:15:33', '2014-04-18', '2014-02-17', '1', '1206', null, '235100', '4');
INSERT INTO `infox_project_emp_working` VALUES ('281931', '2014-03-11 13:19:58', '2014-03-31', '2014-03-10', '1', '1067', null, '757271', '4');
INSERT INTO `infox_project_emp_working` VALUES ('293613', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '0817', null, '255570', '1');
INSERT INTO `infox_project_emp_working` VALUES ('295778', '2014-03-14 14:23:24', '2014-04-21', '2014-03-31', '3', null, '561137', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('300010', '2014-03-17 08:30:00', '2014-03-17', '2014-02-17', '4', '1068', null, '846624', '4');
INSERT INTO `infox_project_emp_working` VALUES ('311210', '2014-03-10 11:01:29', '2014-03-31', '2014-02-07', '1', '1296', null, '553171', '4');
INSERT INTO `infox_project_emp_working` VALUES ('313191', '2014-03-07 23:13:27', '2014-03-07', '2014-02-10', '4', '0679', null, '533574', null);
INSERT INTO `infox_project_emp_working` VALUES ('331157', '2014-03-11 13:19:58', '2014-03-31', '2014-03-10', '1', '1079', null, '757271', '4');
INSERT INTO `infox_project_emp_working` VALUES ('344752', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '0348', null, '255570', '2');
INSERT INTO `infox_project_emp_working` VALUES ('371002', '2014-03-14 14:24:37', '2014-04-21', '2014-02-25', '3', null, '982940', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('380208', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1269', null, '533574', '6');
INSERT INTO `infox_project_emp_working` VALUES ('381706', '2014-03-07 11:04:35', '2014-05-16', '2014-02-07', '1', '0684', null, '533574', '1');
INSERT INTO `infox_project_emp_working` VALUES ('387973', '2014-03-10 11:37:49', '2014-03-28', '2014-02-07', '1', '0856', null, '279349', '1');
INSERT INTO `infox_project_emp_working` VALUES ('398182', '2014-03-11 14:06:28', '2014-06-13', '2014-03-10', '1', '1178', null, '854328', '4');
INSERT INTO `infox_project_emp_working` VALUES ('401857', '2014-03-11 14:06:28', '2014-06-13', '2014-03-06', '1', '1192', null, '854328', '4');
INSERT INTO `infox_project_emp_working` VALUES ('407423', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1225', null, '533574', '3');
INSERT INTO `infox_project_emp_working` VALUES ('420607', '2014-03-11 13:19:58', '2014-03-31', '2014-03-10', '1', '0236', null, '757271', '2');
INSERT INTO `infox_project_emp_working` VALUES ('439229', '2014-03-11 14:04:38', '2014-06-13', '2014-03-03', '1', '1149', null, '854328', '4');
INSERT INTO `infox_project_emp_working` VALUES ('446360', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '0377', null, '255570', '2');
INSERT INTO `infox_project_emp_working` VALUES ('479265', '2014-03-11 13:19:58', '2014-03-31', '2014-03-10', '1', '1276', null, '757271', '5');
INSERT INTO `infox_project_emp_working` VALUES ('482846', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '1260', null, '255570', '6');
INSERT INTO `infox_project_emp_working` VALUES ('490725', '2014-03-14 14:06:59', '2014-03-26', '2014-03-07', '3', null, '990064', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('496628', '2014-03-12 08:41:02', '2014-03-12', '2014-02-10', '4', '1274', null, '533574', null);
INSERT INTO `infox_project_emp_working` VALUES ('542191', '2014-03-07 11:22:55', '2014-05-26', '2014-03-03', '1', '0428', null, '628063', '1');
INSERT INTO `infox_project_emp_working` VALUES ('550721', '2014-03-14 14:05:43', '2014-03-14', '2014-02-10', '4', '1250', null, '533574', null);
INSERT INTO `infox_project_emp_working` VALUES ('557474', '2014-03-12 14:49:44', '2014-03-31', '2014-01-01', '1', '0627', null, '975114', '3');
INSERT INTO `infox_project_emp_working` VALUES ('561137', '2014-03-07 11:16:08', '2014-03-31', '2014-02-17', '1', '1219', null, '235100', '3');
INSERT INTO `infox_project_emp_working` VALUES ('564197', '2014-03-11 13:37:08', '2014-04-30', '2014-02-17', '1', '0216', null, '846624', '1');
INSERT INTO `infox_project_emp_working` VALUES ('566470', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1234', null, '709795', '3');
INSERT INTO `infox_project_emp_working` VALUES ('573551', '2014-03-17 11:58:26', '2014-03-17', '2014-02-17', '4', '0669', null, '279349', '4');
INSERT INTO `infox_project_emp_working` VALUES ('579551', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '0755', null, '255570', '3');
INSERT INTO `infox_project_emp_working` VALUES ('612636', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '0741', null, '255570', '3');
INSERT INTO `infox_project_emp_working` VALUES ('740468', '2014-03-10 10:57:06', '2014-04-04', '2014-01-16', '1', '0850', null, '553171', '1');
INSERT INTO `infox_project_emp_working` VALUES ('749537', '2014-03-17 08:31:36', '2014-05-16', '2014-02-10', '3', null, '990064', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('751518', '2014-03-07 11:25:48', '2014-05-26', '2014-03-03', '1', '1245', null, '833942', '6');
INSERT INTO `infox_project_emp_working` VALUES ('758762', '2014-03-14 08:30:00', '2014-03-14', '2014-02-17', '4', '0579', null, '279349', '2');
INSERT INTO `infox_project_emp_working` VALUES ('769609', '2014-03-11 15:22:41', '2014-04-07', '2014-02-17', '3', null, '564197', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('788204', '2014-03-10 11:25:50', '2014-03-31', '2013-12-02', '1', '0351', null, '228591', '1');
INSERT INTO `infox_project_emp_working` VALUES ('789635', '2014-03-17 11:55:09', '2014-03-07', '2014-02-10', '4', '0150', null, '553171', '3');
INSERT INTO `infox_project_emp_working` VALUES ('796595', '2014-03-10 09:59:59', '2014-06-30', '2014-03-10', '1', '1220', null, '255570', '4');
INSERT INTO `infox_project_emp_working` VALUES ('814328', '2014-03-14 14:25:34', '2014-04-21', '2014-02-11', '3', null, '954184', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('816924', '2014-03-10 11:25:50', '2014-03-31', '2013-12-02', '1', '0671', null, '228591', '2');
INSERT INTO `infox_project_emp_working` VALUES ('827643', '2014-03-11 14:04:38', '2014-06-13', '2014-03-03', '1', '0936', null, '854328', '4');
INSERT INTO `infox_project_emp_working` VALUES ('840269', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1145', null, '709795', '4');
INSERT INTO `infox_project_emp_working` VALUES ('842123', '2014-03-07 11:25:48', '2014-05-26', '2014-03-03', '1', '1060', null, '833942', '3');
INSERT INTO `infox_project_emp_working` VALUES ('870895', '2014-03-17 11:57:20', '2014-03-17', '2013-12-02', '4', '1175', null, '228591', '6');
INSERT INTO `infox_project_emp_working` VALUES ('909982', '2014-03-14 14:10:52', '2014-05-16', '2014-02-10', '1', '1104', null, '533574', '4');
INSERT INTO `infox_project_emp_working` VALUES ('917031', '2014-03-14 14:46:55', '2014-04-15', '2014-02-20', '3', null, '201903', null, null);
INSERT INTO `infox_project_emp_working` VALUES ('921296', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1287', null, '709795', '6');
INSERT INTO `infox_project_emp_working` VALUES ('932180', '2014-03-14 14:05:57', '2014-05-16', '2014-02-10', '1', '1282', null, '533574', '6');
INSERT INTO `infox_project_emp_working` VALUES ('937236', '2014-03-12 14:55:40', '2014-03-28', '2014-02-24', '1', '1046', null, '830753', '1');
INSERT INTO `infox_project_emp_working` VALUES ('954184', '2014-03-07 11:15:33', '2014-04-18', '2014-02-17', '1', '0866', null, '235100', '1');
INSERT INTO `infox_project_emp_working` VALUES ('970636', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1257', null, '533574', '6');
INSERT INTO `infox_project_emp_working` VALUES ('977809', '2014-03-10 10:57:06', '2014-04-04', '2014-01-26', '1', '0590', null, '553171', '4');
INSERT INTO `infox_project_emp_working` VALUES ('982940', '2014-03-07 11:15:33', '2014-03-31', '2014-02-26', '1', '0718', null, '235100', '4');
INSERT INTO `infox_project_emp_working` VALUES ('990064', '2014-03-07 23:14:09', '2014-05-16', '2014-03-10', '1', '0679', null, '533574', '3');

-- ----------------------------
-- Table structure for `infox_project_maillist`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_maillist`;
CREATE TABLE `infox_project_maillist` (
  `id` varchar(255) NOT NULL,
  `PROJECT_ID` varchar(255) DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r87cb1fvctw5uxpo2dtn1kng0` (`PROJECT_ID`),
  KEY `FK_bq2ik7889xo03safp9bwivu15` (`EMP_ID`),
  CONSTRAINT `FK_bq2ik7889xo03safp9bwivu15` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`),
  CONSTRAINT `FK_r87cb1fvctw5uxpo2dtn1kng0` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_maillist
-- ----------------------------
INSERT INTO `infox_project_maillist` VALUES ('019598', '533574', '1250');
INSERT INTO `infox_project_maillist` VALUES ('030940', '830753', '1046');
INSERT INTO `infox_project_maillist` VALUES ('039164', '279349', '0856');
INSERT INTO `infox_project_maillist` VALUES ('051682', '553171', '0850');
INSERT INTO `infox_project_maillist` VALUES ('064410', '255570', '0817');
INSERT INTO `infox_project_maillist` VALUES ('115007', '235100', '0741');
INSERT INTO `infox_project_maillist` VALUES ('146953', '228591', '0351');
INSERT INTO `infox_project_maillist` VALUES ('160600', '533574', '1282');
INSERT INTO `infox_project_maillist` VALUES ('227152', '854328', '0215');
INSERT INTO `infox_project_maillist` VALUES ('253755', '757271', '0601');
INSERT INTO `infox_project_maillist` VALUES ('287756', '709795', '1084');
INSERT INTO `infox_project_maillist` VALUES ('295103', '846624', '0216');
INSERT INTO `infox_project_maillist` VALUES ('316357', '259872', '0520');
INSERT INTO `infox_project_maillist` VALUES ('466084', '533574', '0684');
INSERT INTO `infox_project_maillist` VALUES ('466720', '533574', '0679');
INSERT INTO `infox_project_maillist` VALUES ('526991', '533574', '1225');
INSERT INTO `infox_project_maillist` VALUES ('619629', '235100', '0866');
INSERT INTO `infox_project_maillist` VALUES ('639722', '533574', '1104');
INSERT INTO `infox_project_maillist` VALUES ('639861', '533574', '1257');
INSERT INTO `infox_project_maillist` VALUES ('647638', '533574', '1269');
INSERT INTO `infox_project_maillist` VALUES ('740572', '833942', '0993');
INSERT INTO `infox_project_maillist` VALUES ('747794', '628063', '0428');
INSERT INTO `infox_project_maillist` VALUES ('823263', '533574', '1274');
INSERT INTO `infox_project_maillist` VALUES ('833523', '235100', '1206');
INSERT INTO `infox_project_maillist` VALUES ('901422', '975114', '0627');
INSERT INTO `infox_project_maillist` VALUES ('957181', '235100', '0718');

-- ----------------------------
-- Table structure for `infox_project_overtime`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_overtime`;
CREATE TABLE `infox_project_overtime` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `hour` float DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PROJECT_ID` varchar(255) DEFAULT NULL,
  `holidaysHour` float DEFAULT NULL,
  `normalHour` float DEFAULT NULL,
  `weekendHour` float DEFAULT NULL,
  `holidaysHour1` float DEFAULT NULL,
  `normalHour1` float DEFAULT NULL,
  `weekendHour1` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rls4or1b482lf2y8dov82psb6` (`EMP_ID`),
  KEY `FK_hlw8m8ushj1nwojmnbmkklcja` (`PROJECT_ID`),
  CONSTRAINT `FK_hlw8m8ushj1nwojmnbmkklcja` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_rls4or1b482lf2y8dov82psb6` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_overtime
-- ----------------------------
INSERT INTO `infox_project_overtime` VALUES ('107295', '2014-03-31 09:21:37', null, null, null, '0966', '228591', '5', '3', '2', '3', '1', '2');
INSERT INTO `infox_project_overtime` VALUES ('218889', '2014-03-31 10:56:51', null, null, null, '0718', '235100', '44', '44', '44', '11', '11', '11');
INSERT INTO `infox_project_overtime` VALUES ('307409', '2014-03-31 10:56:37', null, null, null, '0866', '235100', '33', '33', '33', '3', '3', '3');
INSERT INTO `infox_project_overtime` VALUES ('322653', '2014-03-31 10:54:07', null, null, null, '1206', '235100', '6', '9', '8', '3', '5', '4');
INSERT INTO `infox_project_overtime` VALUES ('501330', '2014-03-31 10:54:20', null, null, null, '1219', '235100', '33', '11', '22', '8', '4', '7');
INSERT INTO `infox_project_overtime` VALUES ('900918', '2014-03-31 10:52:37', null, null, null, '0351', '228591', '3', '5', '4', '0', '2', '1');

-- ----------------------------
-- Table structure for `infox_project_project`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_project`;
CREATE TABLE `infox_project_project` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createrId` varchar(255) DEFAULT NULL,
  `createrName` varchar(255) DEFAULT NULL,
  `deptname` varchar(255) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `lastmod` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `project_desc` longtext,
  `project_leader` varchar(255) DEFAULT NULL,
  `project_target` longtext,
  `project_type` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `DEPT_PID` varchar(255) DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PROJECT_PID` varchar(255) DEFAULT NULL,
  `projectNum` varchar(255) DEFAULT NULL,
  `taskScope` varchar(255) DEFAULT NULL,
  `project_buglv` longtext,
  `project_manyidu` longtext,
  `project_scx` longtext,
  `contractNum` varchar(255) DEFAULT NULL,
  `project_bjscx` longtext,
  `project_bjzry` longtext,
  `project_clrl` longtext,
  `project_ydscx` longtext,
  `project_yjtrzry` longtext,
  `quot` float DEFAULT NULL,
  `shouzhu` int(11) DEFAULT NULL,
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
INSERT INTO `infox_project_project` VALUES ('228591', '地域包括', '2014-03-14 14:26:50', '9999', '超级管理员', 'JD4-2', '2014-03-31 00:00:00', '2014-03-14 14:26:50', '地域包括ケアＶ２．５対応作業', '', null, '<p>顾客满意度80分以上</p>', '1', '2013-12-02 00:00:00', '1', '老鹰', '244582', '0351', null, 'H002', '', null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('235100', 'ハートフレンド', '2014-03-14 14:12:51', '9999', '超级管理员', 'JD4-2', '2014-04-21 00:00:00', '2014-03-14 14:12:51', 'H26_04ハートフレンド改修対応', '', '馮英', '<p>0BUG</p>', '0', '2014-02-17 00:00:00', '1', '胡人', '244582', '0866', null, '日立001', '', null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('255570', '宛名', '2014-03-10 09:58:47', '9999', '超级管理员', '开发一部', '2014-06-30 00:00:00', '2014-03-10 09:58:47', 'eAD2宛名', '', null, '<p>顾客返回BUG率≤0.15件/KS</p>', '0', '2014-03-10 00:00:00', '1', '猛龙', '705624', '0817', null, 'HYSYS003', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('259872', '福祉', '2014-03-14 15:51:39', '9999', '超级管理员', 'JD1-2', '2014-05-24 00:00:00', '2014-03-14 15:51:39', 'ADWORLD福祉系统开发', '', null, '<p>顾客满意度80分以上</p>', '1', '2014-03-10 00:00:00', '1', '灰熊', '705624', '0520', null, 'H004', '', null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('279349', 'アーバン', '2014-03-14 13:44:55', '9999', '超级管理员', 'JD4-2', '2014-03-21 00:00:00', '2014-03-14 13:44:55', '日立アーバン改修作業', '', null, '<p>0BUG</p>', '0', '2014-02-07 00:00:00', '1', '马刺', '244582', '0856', null, 'H003', '', null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('533574', 'Workspro', '2014-03-07 11:57:46', '9999', '超级管理员', '开发三部', '2014-04-30 00:00:00', '2014-03-07 11:57:46', 'Workspro_よこそう', '', '陳瑞庭', '<p>0BUG</p>', '2', '2014-02-10 00:00:00', '1', '火箭队', '979739', '0684', null, '日立002', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('553171', '営業支援', '2014-03-14 13:40:36', '9999', '超级管理员', 'JD4-2', '2014-03-31 00:00:00', '2014-03-14 13:40:36', '営業支援システム改修', '', null, '<p>0BUG</p>', '0', '2014-01-27 00:00:00', '1', '篮网', '244582', '0850', null, 'H001', '', null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('628063', '住宅', '2014-03-07 11:58:25', '9999', '超级管理员', '开发一部', '2014-05-26 00:00:00', '2014-03-07 11:58:25', 'ADWORLD住宅(2014年7月リリース分)', '', '沈浩', '<p>顾客满意度85分以上</p>', '1', '2014-03-03 00:00:00', '1', '步行者', '705624', '0428', null, '日立003', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('709795', '国民年金', '2014-03-17 08:34:29', '9999', '超级管理员', 'JD1-2', '2014-04-14 00:00:00', '2014-03-17 08:34:29', 'ADWORLD国民年金系统开发', '', '葉暁夢', '<p>0BUG</p>', '1', '2014-02-20 00:00:00', '1', '奇才', '705624', '1084', null, 'HYSYS001', '', null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('757271', '収滞納', '2014-03-11 13:19:05', '9999', '超级管理员', '开发一部', '2014-03-31 00:00:00', '2014-03-11 13:19:05', 'eAD2収滞納', '', null, '<p>顾客返回BUG率≤0.15件/KS</p>', '1', '2014-03-10 00:00:00', '1', '快船', '705624', '0601', null, 'H005', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('830753', '次世代e', '2014-03-12 14:55:18', '9999', '超级管理员', '开发二部', '2014-03-28 00:00:00', '2014-03-12 14:55:18', 'TM＿次世代e-CRBサービス 店舗展開に向けた標準作業確立（6452）', '', null, '<p>顾客满意度80分以上</p>', '0', '2014-02-24 00:00:00', '1', '勇士', '498779', '1046', null, 'BM001', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('833942', '農家台帳', '2014-03-07 11:59:20', '9999', '超级管理员', '开发一部', '2014-05-26 00:00:00', '2014-03-07 11:59:20', 'ADWORLD農家台帳系统开发', '', '肖衛華', '<p>顾客满意度80分以上</p>', '1', '2014-03-03 00:00:00', '1', '热火', '705624', '0993', null, 'HYSYS002', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('846624', '事業計画', '2014-03-11 15:21:41', '9999', '超级管理员', '开发一部', '2014-04-30 00:00:00', '2014-03-11 15:21:41', '事業計画システム追加開発', '', null, '<p>0BUG</p>', '0', '2014-02-17 00:00:00', '1', '开拓者', '705624', '0216', null, 'H006', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('854328', '滋賀銀行', '2014-03-11 14:03:24', '9999', '超级管理员', '开发一部', '2014-06-13 00:00:00', '2014-03-11 14:03:24', '滋賀銀行殿次期為替端末開発', '', null, '<p>顾客满意度80分以上</p>', '0', '2014-03-03 00:00:00', '1', '雷霆', '705624', '0215', null, 'H007', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('945688', '事業計画', '2014-03-11 13:32:02', '9999', '超级管理员', '开发一部', '2014-04-07 00:00:00', '2014-03-11 13:32:02', '事業計画システム追加開発', '', null, '<p>0BUG</p>', '0', '2014-02-17 00:00:00', '5', '开拓者', '705624', '0216', '846624', 'H006', null, null, null, null, null, null, null, null, null, null, '0.5', '0');
INSERT INTO `infox_project_project` VALUES ('975114', 'TEES', '2014-03-12 14:49:11', '9999', '超级管理员', '开发四部', '2014-03-31 00:00:00', '2014-03-12 14:49:11', '住友林業TEES保守', '', null, '<p>0BUG</p>', '1', '2014-01-01 00:00:00', '1', '小牛', '244582', '0627', null, 'H008', null, null, null, null, null, null, null, null, null, null, '0.5', '0');

-- ----------------------------
-- Table structure for `infox_sysmgr_emp`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_emp`;
CREATE TABLE `infox_sysmgr_emp` (
  `id` varchar(255) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `lastmod` datetime DEFAULT NULL,
  `modifyer` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `ORG_PID` varchar(255) DEFAULT NULL,
  `workStatus` int(11) NOT NULL,
  `japanese` varchar(255) DEFAULT NULL,
  `isLeader` varchar(255) DEFAULT NULL,
  `bysj` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `rzsj` date DEFAULT NULL,
  `dbmDate` varchar(255) DEFAULT NULL,
  `dbmType` int(11) DEFAULT NULL,
  `lbmDate` varchar(255) DEFAULT NULL,
  `lbmType` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB2970897D4D9D9F` (`ORG_PID`),
  KEY `FK_opvxa3fodnk27n7px66hed13k` (`ORG_PID`),
  CONSTRAINT `FK_opvxa3fodnk27n7px66hed13k` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emp
-- ----------------------------
INSERT INTO `infox_sysmgr_emp` VALUES ('0150', null, '2014-03-31 09:17:39', null, null, null, '2014-03-31 09:17:39', null, null, 'female', 'Y', null, '徐瀅', '244582', '0', '二级', 'N', null, '职位变更历史[日期：2014-03-31   职位：主管系统工程师]', null, '2014-02-05', '1', '2014-03-07', '1', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0215', null, '2014-03-31 11:03:02', null, null, null, '2014-03-31 11:03:02', null, null, 'male', 'Y', null, '肖俊', '799399', '0', '一级', 'N', null, null, null, '2014-02-04', '1', '2014-03-31', '3', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0216', 'dongpengwu', '2014-03-11 13:29:17', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:29:17', null, '876697', 'male', 'Y', '', '董鵬武', '705624', '1', '二级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0236', 'lizhixian', '2014-03-11 13:11:57', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:11:57', null, '116704', 'male', 'Y', '', '李智贤', '705624', '1', '三级相当', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0348', 'liuting', '2014-03-10 09:46:46', null, null, 'yanghaoquan@whizen.com', '2014-03-10 09:46:46', null, '054174', 'female', 'Y', '', '刘婷', '705624', '1', '二级相当', 'Y', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0351', 'liyuan', '2014-03-10 11:13:23', null, null, 'yanghaoquan@whizen.com', '2014-03-10 11:13:23', null, '946115', 'male', 'Y', '', '李育安', '244582', '1', '二级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0377', 'liuyuan', '2014-03-10 09:47:38', null, null, 'yanghaoquan@whizen.com', '2014-03-10 09:47:38', null, '868827', 'male', 'Y', '', '劉淵', '705624', '1', '二级相当', 'Y', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0428', null, '2014-03-14 14:53:54', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:53:54', null, null, 'male', 'Y', null, '沈浩', '273699', '0', '二级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0453', null, '2014-03-14 14:59:33', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:59:33', null, null, 'male', 'Y', null, '李寧', '799399', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0520', null, '2014-03-14 15:10:35', null, null, 'yanghaoquan@whizen.com', '2014-03-14 15:10:35', null, null, 'female', 'Y', null, '楊輝', '273699', '0', '二级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0579', 'houxiaohui', '2014-03-10 11:32:07', null, null, 'yanghaoquan@whizen.com', '2014-03-10 11:32:07', null, '711975', 'male', 'Y', '', '侯小慧', '705624', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0590', null, '2014-03-14 14:32:27', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:32:27', null, null, 'male', 'Y', null, '楊孟平', '396398', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0601', 'jinyao', '2014-03-11 13:15:23', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:15:23', null, '067247', 'male', 'Y', '', '金瑶', '705624', '1', '三级相当', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0627', 'qinyaqiang', '2014-03-12 14:44:40', null, null, 'yanghaoquan@whizen.com', '2014-03-12 14:44:40', null, '865573', 'male', 'Y', '', '秦亚强', '244582', '1', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0669', 'huangjiakui', '2014-03-10 11:32:44', null, null, 'yanghaoquan@whizen.com', '2014-03-10 11:32:44', null, '078978', 'male', 'Y', '', '黄加魁', '979739', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0671', null, '2014-03-14 14:28:56', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:28:56', null, null, 'female', 'Y', null, '周玉涵', '396398', '0', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0675', null, '2014-03-14 14:33:05', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:33:05', null, null, 'female', 'Y', null, '黄海萍', '396398', '0', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0679', null, '2014-03-07 10:45:17', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:45:17', null, null, 'male', 'Y', '', '黄イ聰', '979739', '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0684', null, '2014-03-07 10:44:08', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:44:08', null, null, 'male', 'Y', '', '陳瑞庭', '979739', '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0718', null, '2014-03-14 14:14:46', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:14:46', null, null, 'female', 'Y', null, '尹莉', '396398', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0741', 'liang', '2014-03-10 09:48:27', null, null, 'yanghaoquan@whizen.com', '2014-03-10 09:48:27', null, '288039', 'male', 'Y', '', '李昂', '705624', '1', '三级相当', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0747', null, '2014-03-25 11:07:09', null, null, null, '2014-03-25 11:07:09', null, null, 'male', 'Y', null, '吴保杰', '498779', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0755', 'zhushaofeng', '2014-03-10 09:50:26', null, null, 'yanghaoquan@whizen.com', '2014-03-10 09:50:26', null, '340871', 'male', 'Y', '', '朱韶峰', '705624', '1', '四级相当', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0817', 'lichao', '2014-03-10 09:45:29', null, null, 'yanghaoquan@whizen.com', '2014-03-10 09:45:29', null, '963059', 'male', 'Y', '', '李超', '705624', '1', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0850', null, '2014-03-14 14:32:39', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:32:39', null, null, 'male', 'Y', null, '潘熙聖', '396398', '0', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0856', 'zhengshuxi', '2014-03-10 11:30:33', null, null, 'yanghaoquan@whizen.com', '2014-03-10 11:30:33', null, '656188', 'male', 'Y', '', '郑曙熹', '244582', '1', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0866', null, '2014-03-14 14:14:31', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:14:31', null, null, 'female', 'Y', null, '馮英', '396398', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0876', null, '2014-03-25 11:07:14', null, null, null, '2014-03-25 11:07:14', null, null, 'male', 'Y', null, '労漢業', '799399', '0', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0936', 'kangfuhua', '2014-03-11 13:56:17', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:56:17', null, '799269', 'male', 'Y', '', '康富华', '705624', '1', '二级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0966', null, '2014-03-25 11:06:51', null, null, null, '2014-03-25 11:06:51', null, null, 'male', 'Y', null, '呉順', '396398', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0993', null, '2014-03-14 14:56:24', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:56:24', null, null, 'male', 'Y', null, '肖衛華', '273699', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1046', 'cenlijian', '2014-03-12 14:53:01', null, null, 'yanghaoquan@whizen.com', '2014-03-12 14:53:01', null, '927520', 'male', 'Y', '', '岑礼健', '498779', '1', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1060', null, '2014-03-14 14:56:51', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:56:51', null, null, 'male', 'Y', null, '張居爽', '273699', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1067', 'chengang', '2014-03-11 13:12:38', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:12:38', null, '821680', 'male', 'Y', '', '陈刚', '705624', '1', '四级相当', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1068', 'zhangyuxiang', '2014-03-11 13:29:48', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:29:48', null, '725496', 'male', 'Y', '', '張玉祥', '705624', '0', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1071', null, '2014-03-14 14:42:01', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:42:01', null, null, 'female', 'Y', null, '劉偉絹', '273699', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1074', null, '2014-03-14 14:37:30', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:37:30', null, null, 'female', 'Y', null, '胡珊瑚', '273699', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1079', 'chenya', '2014-03-11 13:13:14', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:13:14', null, '857333', 'male', 'Y', '', '陈亚', '705624', '1', '四级相当', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1082', null, '2014-03-25 11:07:17', null, null, null, '2014-03-25 11:07:17', null, null, 'male', 'Y', null, '周耀高', '273699', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1084', null, '2014-03-14 14:44:02', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:44:02', null, null, 'female', 'Y', null, '葉暁夢', '273699', '0', '二级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1104', null, '2014-03-07 15:19:41', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:41', null, null, 'male', 'Y', '', '陳剣盛', '979739', '1', '', null, null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1145', null, '2014-03-14 14:42:39', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:42:39', null, null, 'female', 'Y', null, '尹芝蘭', '273699', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1149', null, '2014-03-14 14:59:52', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:59:52', null, null, 'male', 'Y', null, '邹广初', '799399', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1175', null, '2014-03-25 11:06:55', null, null, null, '2014-03-25 11:06:55', null, null, 'female', 'Y', null, '刘文芳', '244582', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1178', 'xianian', '2014-03-11 13:58:47', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:58:47', null, '150072', 'female', 'Y', '', '夏念', '979739', '1', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1192', 'xuxiaoshuang', '2014-03-11 13:57:44', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:57:44', null, '866186', 'male', 'Y', '', '许小双', '979739', '1', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1206', null, '2014-03-14 14:15:01', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:15:01', null, null, 'female', 'Y', null, '陈嘉雯', '396398', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1212', 'chenjialiang', '2014-03-10 11:31:36', null, null, 'yanghaoquan@whizen.com', '2014-03-10 11:31:36', null, '062120', 'male', 'Y', '', '陈嘉亮', '705624', '1', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1219', null, '2014-03-25 11:07:04', null, null, null, '2014-03-25 11:07:04', null, null, 'male', 'Y', null, '向国華', '888535', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1220', 'lvjieqiang', '2014-03-10 09:52:15', null, null, 'yanghaoquan@whizen.com', '2014-03-10 09:52:15', null, '133551', 'male', 'Y', '', '呂傑強', '705624', '1', '四级相当', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1225', null, '2014-03-07 15:19:47', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:47', null, null, 'male', 'Y', '', '黄腾', '979739', '0', '', null, null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1234', null, '2014-03-14 14:41:13', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:41:13', null, null, 'male', 'Y', null, '方敬濤', '273699', '0', '三级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1236', null, '2014-03-14 14:54:15', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:54:15', null, null, 'male', 'Y', null, '唐星星', '273699', '0', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1245', null, '2014-03-14 14:57:21', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:57:21', null, null, 'female', 'Y', null, '彭莉平', '273699', '0', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1250', null, '2014-03-07 10:48:11', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:48:11', null, null, 'male', 'Y', '', '黄熹舟', '979739', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1257', null, '2014-03-07 15:19:53', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:53', null, null, 'male', 'Y', '', '胡璐瑶', '979739', '0', '', null, null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1260', 'luoling', '2014-03-10 09:52:44', null, null, 'yanghaoquan@whizen.com', '2014-03-10 09:52:44', null, '872741', 'female', 'Y', '', '罗玲', '705624', '1', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1264', 'tanguosheng', '2014-03-11 13:13:44', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:13:44', null, '864328', 'male', 'Y', '', '覃国生', '705624', '1', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1265', null, '2014-03-25 11:06:34', null, null, null, '2014-03-25 11:06:34', null, null, 'male', 'Y', null, '何晨翔', '224263', '0', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1269', null, '2014-03-07 15:19:57', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:57', null, null, 'male', 'Y', '', '文兆明', '979739', '0', '', null, null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1274', null, '2014-03-12 08:41:35', null, null, 'yanghaoquan@whizen.com', '2014-03-12 08:41:35', null, null, 'female', 'Y', '', '莫慧玲', '224263', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1276', 'chenxiang', '2014-03-11 13:14:52', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:14:52', null, '584147', 'female', 'Y', '', '陈香', '705624', '1', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1278', 'gaobeichen', '2014-03-10 10:44:51', null, null, 'yanghaoquan@whizen.com', '2014-03-10 10:44:51', null, '659507', 'female', 'Y', '', '高北晨', '224263', '0', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1282', null, '2014-03-25 11:06:59', null, null, null, '2014-03-25 11:06:59', null, null, 'male', 'Y', null, '余翰祥', '979739', '0', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1287', null, '2014-03-14 14:35:45', null, null, 'yanghaoquan@whizen.com', '2014-03-14 14:35:45', null, null, 'male', 'Y', null, '蒋俊強', '273699', '0', '', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1292', 'chenruibao', '2014-03-11 13:14:11', null, null, 'yanghaoquan@whizen.com', '2014-03-11 13:14:11', null, '985343', 'male', 'Y', '', '陈瑞保', '705624', '1', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1296', 'luoshuming', '2014-03-10 10:45:38', null, null, 'yanghaoquan@whizen.com', '2014-03-10 10:45:38', null, '195456', 'male', 'Y', '', '駱樹明', '498779', '1', '四级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1299', null, '2014-03-25 11:07:21', null, null, null, '2014-03-25 11:07:21', null, null, 'male', 'Y', null, '侯延楠', '705624', '0', '一级', 'N', null, null, null, null, null, null, null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('9999', 'admin', null, null, null, 'yanghaoquan@whizen.com', '2014-03-20 09:12:03', null, 'admin123', null, 'Y', null, '超级管理员', null, '9999', null, null, null, null, null, null, null, null, null, null);

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
INSERT INTO `infox_sysmgr_empjob` VALUES ('019638', '2014-03-14 13:30:33', '', '2', '中级质量保证员', '中级SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('066257', '2014-03-07 10:11:11', '', '2', '高级程序员', '高级PG', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('131044', '2014-03-07 10:12:09', '系统工程师', '3', '系统工程师', 'SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('160742', '2014-03-14 13:29:57', '', '1', '质量保证员', 'SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('182894', '2014-03-07 10:14:25', '', '5', '开发部部长', '部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('197258', '2014-03-07 10:13:03', '项目经理', '4', '主管系统工程师', '主管SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('210920', '2014-03-14 13:29:33', '', '0', '质量保证员助理', 'SQA助理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('290529', '2014-03-07 10:20:05', '', '0', '初级PG3', '新人3', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('323017', '2014-03-07 10:13:45', '', '4', '开发部主管', '科长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('382206', '2014-03-14 13:31:57', '', '6', '高级质量保证员', '高级SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('424223', '2014-03-07 10:19:40', '', '0', '初级PG2', '新人2', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('463384', '2014-03-14 13:32:16', '', '6', '品质部部长', '部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('636088', '2014-03-14 13:31:24', '', '4', '品质部主管', '主管', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('686429', '2014-03-07 10:14:09', '', '5', '高级系统工程师', '高级SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('787132', '2014-03-14 13:31:02', '', '4', '主管质量保证员', '主管SQA', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('819243', '2014-03-07 10:19:48', '', '0', '初级PG1', '新人1', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('933778', '2014-03-07 10:11:37', '程序员', '1', '程序员', 'PG', null);

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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0627', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0718', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0747', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0755', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0966', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1067', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1071', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1074', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1079', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1082', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1145', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1234', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1236', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1296', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0453', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0520', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0579', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0590', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0669', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0671', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0679', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0741', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0876', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0993', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1060', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1225', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1299', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0675', '182894');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0817', '182894');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0215', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0216', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0236', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0348', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0351', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0377', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0428', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0601', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0684', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0850', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0856', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0866', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1046', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1084', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1219', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1175', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1245', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1250', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1257', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1260', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1265', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1274', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1276', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1278', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1282', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1287', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0150', '636088');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1264', '819243');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1292', '819243');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0936', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1068', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1104', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1149', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1178', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1192', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1206', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1212', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1220', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1269', '933778');

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
INSERT INTO `infox_sysmgr_menu` VALUES ('435107', null, '2014-03-14 09:33:29', null, 'project/project_main/emp_standby.do', 'icon-standard-award-star-gold-3', '2014-03-14 09:33:29', null, '待机人员', '1', null, null, 'F', '134095', 'Y');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('825118', null, '2014-03-20 08:33:30', null, 'project/project_main/emp_main.do', 'icon-standard-application-view-list', '2014-03-20 08:33:30', null, '人员管理', '1', null, null, 'F', '134095', 'Y');
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
  `pname` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ORG_PID` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `FK_rwpxh5paok3rmx9s6aie9ps3t` (`ORG_PID`),
  CONSTRAINT `FK_rwpxh5paok3rmx9s6aie9ps3t` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_org_dept
-- ----------------------------
INSERT INTO `infox_sysmgr_org_dept` VALUES ('224263', '品质部', '2014-03-14 13:27:52', null, '', '', '', '品质部', null, '2014-03-14 13:27:52', null, '广州华智科技有限公司', '', '', 'D', '983784', '3', '0', '0', '0', '3', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('244582', 'JD4-1', '2014-03-14 09:44:04', null, '', '', '', 'JD4-1', null, '2014-03-14 09:44:04', null, '广州华智科技有限公司', '', '', 'D', '983784', '5', '0', '0', '0', '5', '5', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('273699', 'JD1-2', '2014-03-14 09:41:38', null, '', '', '', 'JD1-2', null, '2014-03-14 09:41:38', null, '广州华智科技有限公司', '', '', 'D', '983784', '13', '0', '0', '0', '13', '13', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('396398', 'JD4-2', '2014-03-14 09:44:18', null, '', '', '', 'JD4-2', null, '2014-03-14 09:44:18', null, '广州华智科技有限公司', '', '', 'D', '983784', '8', '0', '0', '8', '8', '8', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('498779', 'JD2-1', '2014-03-14 09:42:43', null, '开发二部', '', '', 'JD2-1', null, '2014-03-14 09:42:43', null, '广州华智科技有限公司', '', '', 'D', '983784', '3', '0', '0', '3', '3', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('705624', 'JD1-1', '2014-03-14 09:40:59', null, '开发一部', '', '', 'JD1-1', null, '2014-03-14 09:40:59', null, '广州华智科技有限公司', '', '', 'D', '983784', '20', '0', '0', '0', '20', '20', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('799399', 'JD1-3', '2014-03-14 09:42:26', null, '', '', '', 'JD1-3', null, '2014-03-14 09:42:26', null, '广州华智科技有限公司', '', '', 'D', '983784', '4', '0', '0', '0', '4', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('888535', 'JD2-2', '2014-03-14 09:43:09', null, '', '', '', 'JD2-2', null, '2014-03-14 09:43:09', null, '广州华智科技有限公司', '', '', 'D', '983784', '4', '0', '0', '0', '4', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('979739', 'JD3-1', '2014-03-14 09:43:26', null, '开发三部', '', '', 'JD3-1', null, '2014-03-14 09:43:26', null, '广州华智科技有限公司', '', '', 'D', '983784', '11', '0', '0', '0', '11', '11', '0', '0', '0', '0', '0', '0');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('983784', '000231211', '2014-02-26 13:14:10', null, '广州华智科技有限公司', 'whizen', '020654321', '广州华智科技有限公司', null, '2014-02-26 13:14:10', null, '', '华智', '020123456', 'O', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

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
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144af990443000b', '2014-03-11 13:24:04', null, null, '0 30 8 31 3 ? ', '757271:M0', '4028824e44aed5810144af990443000b', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144af990443000c', '2014-03-11 13:24:04', null, null, '0 30 8 28 3 ? ', '757271:M1', '4028824e44aed5810144af990443000c', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144af990443000d', '2014-03-11 13:24:04', null, null, '0 30 8 31 3 ? ', '757271:0', '4028824e44aed5810144af990443000d', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144af990443000e', '2014-03-11 13:24:04', null, null, '0 30 8 28 3 ? ', '757271:1', '4028824e44aed5810144af990443000e', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144afa67e50000f', '2014-03-11 13:38:48', null, null, '0 30 8 4 4 ? ', '846624:M0', '4028824e44aed5810144afa67e50000f', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144afa67e500010', '2014-03-11 13:38:48', null, null, '0 30 8 17 3 ? ', '846624:M1', '4028824e44aed5810144afa67e500010', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144afa67e500011', '2014-03-11 13:38:48', null, null, '0 30 8 7 4 ? ', '846624:M2', '4028824e44aed5810144afa67e500011', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144afa67e500012', '2014-03-11 13:38:48', null, null, '0 30 8 14 3 ? ', '846624:M3', '4028824e44aed5810144afa67e500012', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144afc11fd60017', '2014-03-11 14:07:53', null, null, '0 30 8 13 6 ? ', '854328:0', '4028824e44aed5810144afc11fd60017', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144afc11fd60018', '2014-03-11 14:07:53', null, null, '0 30 8 11 6 ? ', '854328:1', '4028824e44aed5810144afc11fd60018', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b004d6730019', '2014-03-11 15:21:50', null, null, '52 54 9 30 4 ? ', '846624:0', '4028824e44aed5810144b004d6730019', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b004d683001a', '2014-03-11 15:21:50', null, null, '52 54 9 28 4 ? ', '846624:1', '4028824e44aed5810144b004d683001a', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b50e92290025', '2014-03-12 14:50:34', null, null, '0 30 8 31 3 ? ', '975114:M0', '4028824e44aed5810144b50e92290025', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b50e92290026', '2014-03-12 14:50:34', null, null, '0 30 8 28 3 ? ', '975114:M1', '4028824e44aed5810144b50e92290026', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b50e92290027', '2014-03-12 14:50:34', null, null, '0 30 8 31 3 ? ', '975114:0', '4028824e44aed5810144b50e92290027', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b50e92290028', '2014-03-12 14:50:34', null, null, '0 30 8 28 3 ? ', '975114:1', '4028824e44aed5810144b50e92290028', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b513f741002b', '2014-03-12 14:56:28', null, null, '0 30 8 28 3 ? ', '830753:0', '4028824e44aed5810144b513f741002b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44aed5810144b513f741002c', '2014-03-12 14:56:28', null, null, '0 30 8 26 3 ? ', '830753:1', '4028824e44aed5810144b513f741002c', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf4495b70010', '2014-03-14 14:25:46', null, null, '30 35 8 18 4 ? ', '235100:M0', '4028824e44bf24890144bf4495b70010', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf4495b70011', '2014-03-14 14:25:46', null, null, '30 35 8 31 3 ? ', '235100:M1', '4028824e44bf24890144bf4495b70011', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf4495b70012', '2014-03-14 14:25:46', null, null, '30 35 8 29 3 ? ', '235100:M2', '4028824e44bf24890144bf4495b70012', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf4495b70013', '2014-03-14 14:25:46', null, null, '30 35 8 16 4 ? ', '235100:M3', '4028824e44bf24890144bf4495b70013', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf580eac0014', '2014-03-14 14:47:03', null, null, '30 35 8 11 4 ? ', '709795:M0', '4028824e44bf24890144bf580eac0014', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf580eac0015', '2014-03-14 14:47:03', null, null, '30 35 8 15 4 ? ', '709795:M1', '4028824e44bf24890144bf580eac0015', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf5f45f3001a', '2014-03-14 14:54:55', null, null, '30 35 8 26 5 ? ', '628063:M0', '4028824e44bf24890144bf5f45f3001a', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf5f45f3001b', '2014-03-14 14:54:55', null, null, '30 35 8 24 5 ? ', '628063:M1', '4028824e44bf24890144bf5f45f3001b', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf621f50001c', '2014-03-14 14:58:02', null, null, '30 35 8 26 5 ? ', '833942:M0', '4028824e44bf24890144bf621f50001c', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf621f50001d', '2014-03-14 14:58:02', null, null, '30 35 8 24 5 ? ', '833942:M1', '4028824e44bf24890144bf621f50001d', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf6787660020', '2014-03-14 15:03:57', null, null, '30 35 8 13 6 ? ', '854328:M0', '4028824e44bf24890144bf6787660020', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf6787660021', '2014-03-14 15:03:57', null, null, '30 35 8 11 6 ? ', '854328:M1', '4028824e44bf24890144bf6787660021', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf6c8ece0022', '2014-03-14 15:09:26', null, null, '30 35 8 30 6 ? ', '255570:M0', '4028824e44bf24890144bf6c8ece0022', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144bf6c8ece0023', '2014-03-14 15:09:26', null, null, '30 35 8 28 6 ? ', '255570:M1', '4028824e44bf24890144bf6c8ece0023', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144cd7378a60024', '2014-03-17 08:31:40', null, null, '30 35 8 16 5 ? ', '533574:M0', '4028824e44bf24890144cd7378a60024', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144cd7378a60025', '2014-03-17 08:31:40', null, null, '30 35 8 14 5 ? ', '533574:M1', '4028824e44bf24890144cd7378a60025', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce2dca9b0036', '2014-03-17 11:55:11', null, null, '30 35 8 31 3 ? ', '553171:M0', '4028824e44bf24890144ce2dca9b0036', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce2dcaab0037', '2014-03-17 11:55:11', null, null, '30 35 8 2 4 ? ', '553171:M1', '4028824e44bf24890144ce2dcaab0037', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce2dcaab0038', '2014-03-17 11:55:11', null, null, '30 35 8 29 3 ? ', '553171:M2', '4028824e44bf24890144ce2dcaab0038', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce2dcaab0039', '2014-03-17 11:55:11', null, null, '30 35 8 4 4 ? ', '553171:M3', '4028824e44bf24890144ce2dcaab0039', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce2fd54f003c', '2014-03-17 11:57:25', null, null, '30 35 8 31 3 ? ', '228591:M0', '4028824e44bf24890144ce2fd54f003c', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce2fd54f003d', '2014-03-17 11:57:25', null, null, '30 35 8 29 3 ? ', '228591:M1', '4028824e44bf24890144ce2fd54f003d', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce30ce540040', '2014-03-17 11:58:28', null, null, '30 35 8 28 3 ? ', '279349:M0', '4028824e44bf24890144ce30ce540040', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce30ce540041', '2014-03-17 11:58:28', null, null, '30 35 8 26 3 ? ', '279349:M1', '4028824e44bf24890144ce30ce540041', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce31a1250044', '2014-03-17 11:59:22', null, null, '30 35 8 28 3 ? ', '830753:M0', '4028824e44bf24890144ce31a1250044', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e44bf24890144ce31a1340045', '2014-03-17 11:59:22', null, null, '30 35 8 26 3 ? ', '830753:M1', '4028824e44bf24890144ce31a1340045', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9f6530000a', '2014-03-07 11:39:01', null, null, '0 30 8 21 4 ? ', '235100:0', '40288483449a48d101449a9f6530000a', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9f6543000b', '2014-03-07 11:39:01', null, null, '0 30 8 18 4 ? ', '235100:1', '40288483449a48d101449a9f6543000b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9ff8ac000e', '2014-03-07 11:39:39', null, null, '0 30 8 30 4 ? ', '533574:0', '40288483449a48d101449a9ff8ac000e', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9ff8af000f', '2014-03-07 11:39:39', null, null, '0 30 8 28 4 ? ', '533574:1', '40288483449a48d101449a9ff8af000f', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa06bab0012', '2014-03-07 11:40:08', null, null, '0 30 8 26 5 ? ', '628063:0', '40288483449a48d101449aa06bab0012', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa06bac0013', '2014-03-07 11:40:08', null, null, '0 30 8 23 5 ? ', '628063:1', '40288483449a48d101449aa06bac0013', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa0e04c0016', '2014-03-07 11:40:38', null, null, '0 30 8 14 4 ? ', '709795:0', '40288483449a48d101449aa0e04c0016', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa0e0510017', '2014-03-07 11:40:38', null, null, '0 30 8 11 4 ? ', '709795:1', '40288483449a48d101449aa0e0510017', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa12810001a', '2014-03-07 11:40:56', null, null, '0 30 8 26 5 ? ', '833942:0', '40288483449a48d101449aa12810001a', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa12811001b', '2014-03-07 11:40:56', null, null, '0 30 8 23 5 ? ', '833942:1', '40288483449a48d101449aa12811001b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9bebb0144a9ce19f60004', '2014-03-10 10:24:20', null, null, '0 30 8 30 6 ? ', '255570:0', '4028848344a9bebb0144a9ce19f60004', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9bebb0144a9ce19f70005', '2014-03-10 10:24:20', null, null, '0 30 8 27 6 ? ', '255570:1', '4028848344a9bebb0144a9ce19f70005', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9ea590144a9f2f4ff000a', '2014-03-10 11:04:35', null, null, '0 30 8 31 3 ? ', '553171:0', '4028848344a9ea590144a9f2f4ff000a', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9ea590144a9f2f500000b', '2014-03-10 11:04:35', null, null, '0 30 8 28 3 ? ', '553171:1', '4028848344a9ea590144a9f2f500000b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9fe160144aa0900be0006', '2014-03-10 11:28:40', null, null, '0 30 8 31 3 ? ', '228591:0', '4028848344a9fe160144aa0900be0006', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9fe160144aa0900be0007', '2014-03-10 11:28:40', null, null, '0 30 8 28 3 ? ', '228591:1', '4028848344a9fe160144aa0900be0007', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9fe160144aa15d2d5000c', '2014-03-10 11:42:40', null, null, '0 30 8 21 3 ? ', '279349:0', '4028848344a9fe160144aa15d2d5000c', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344a9fe160144aa15d2d6000d', '2014-03-10 11:42:40', null, null, '0 30 8 19 3 ? ', '279349:1', '4028848344a9fe160144aa15d2d6000d', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344ae96540144ae9bf36a0002', '2014-03-11 08:47:39', null, null, '0 30 8 24 5 ? ', '259872:M0', '4028848344ae96540144ae9bf36a0002', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344ae96540144ae9bf36b0003', '2014-03-11 08:47:39', null, null, '0 30 8 22 5 ? ', '259872:M1', '4028848344ae96540144ae9bf36b0003', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344ae96540144ae9bf36c0004', '2014-03-11 08:47:39', null, null, '0 30 8 24 5 ? ', '259872:0', '4028848344ae96540144ae9bf36c0004', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028848344ae96540144ae9bf36d0005', '2014-03-11 08:47:39', null, null, '0 30 8 22 5 ? ', '259872:1', '4028848344ae96540144ae9bf36d0005', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
