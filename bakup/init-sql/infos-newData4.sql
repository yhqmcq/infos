/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-03-09 17:18:51
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
INSERT INTO `infox_project_emp_working` VALUES ('046875', '2014-03-07 11:25:48', '2014-05-26', '2014-03-03', '1', '0993', null, '833942');
INSERT INTO `infox_project_emp_working` VALUES ('081139', '2014-03-07 11:22:55', '2014-05-26', '2014-03-03', '1', '1236', null, '628063');
INSERT INTO `infox_project_emp_working` VALUES ('181912', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1082', null, '709795');
INSERT INTO `infox_project_emp_working` VALUES ('193501', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1084', null, '709795');
INSERT INTO `infox_project_emp_working` VALUES ('201903', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1074', null, '709795');
INSERT INTO `infox_project_emp_working` VALUES ('235521', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1071', null, '709795');
INSERT INTO `infox_project_emp_working` VALUES ('264589', '2014-03-07 11:15:33', '2014-04-18', '2014-02-17', '1', '1206', null, '235100');
INSERT INTO `infox_project_emp_working` VALUES ('313191', '2014-03-07 23:13:27', '2014-03-07', '2014-02-10', '4', '0679', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('380208', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1269', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('381706', '2014-03-07 11:04:35', '2014-05-16', '2014-02-07', '1', '0684', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('407423', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1225', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('496628', '2014-03-07 11:04:42', '2014-05-16', '2014-02-10', '1', '1274', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('542191', '2014-03-07 11:22:55', '2014-05-26', '2014-03-03', '1', '0428', null, '628063');
INSERT INTO `infox_project_emp_working` VALUES ('550721', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1250', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('561137', '2014-03-07 11:16:08', '2014-04-21', '2014-03-31', '1', '1219', null, '235100');
INSERT INTO `infox_project_emp_working` VALUES ('566470', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1234', null, '709795');
INSERT INTO `infox_project_emp_working` VALUES ('751518', '2014-03-07 11:25:48', '2014-05-26', '2014-03-03', '1', '1245', null, '833942');
INSERT INTO `infox_project_emp_working` VALUES ('840269', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1145', null, '709795');
INSERT INTO `infox_project_emp_working` VALUES ('842123', '2014-03-07 11:25:48', '2014-05-26', '2014-03-03', '1', '1060', null, '833942');
INSERT INTO `infox_project_emp_working` VALUES ('896882', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1104', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('921296', '2014-03-07 11:30:34', '2014-04-15', '2014-02-20', '1', '1287', null, '709795');
INSERT INTO `infox_project_emp_working` VALUES ('954184', '2014-03-07 11:15:33', '2014-04-21', '2014-02-11', '1', '0866', null, '235100');
INSERT INTO `infox_project_emp_working` VALUES ('970636', '2014-03-07 11:04:35', '2014-05-16', '2014-02-10', '1', '1257', null, '533574');
INSERT INTO `infox_project_emp_working` VALUES ('982940', '2014-03-07 11:15:33', '2014-04-21', '2014-02-25', '1', '0718', null, '235100');
INSERT INTO `infox_project_emp_working` VALUES ('990064', '2014-03-07 23:14:09', '2014-03-26', '2014-03-07', '1', '0679', null, '533574');

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
INSERT INTO `infox_project_maillist` VALUES ('160600', '533574', '1282');
INSERT INTO `infox_project_maillist` VALUES ('287756', '709795', '1084');
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
INSERT INTO `infox_project_maillist` VALUES ('957181', '235100', '0718');

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
INSERT INTO `infox_project_project` VALUES ('235100', 'ハートフレンド', '2014-03-07 11:57:18', '9999', '超级管理员', '开发四部', '2014-04-21 00:00:00', '2014-03-07 11:57:18', 'H26_04ハートフレンド改修対応', '', '馮英', '<p>0BUG</p>', '0', '2014-02-17 00:00:00', '1', '胡人', '244582', '0866', null, '日立001');
INSERT INTO `infox_project_project` VALUES ('533574', 'Workspro', '2014-03-07 11:57:46', '9999', '超级管理员', '开发三部', '2014-04-30 00:00:00', '2014-03-07 11:57:46', 'Workspro_よこそう', '', '陳瑞庭', '<p>0BUG</p>', '2', '2014-02-10 00:00:00', '1', '火箭队', '979739', '0684', null, '日立002');
INSERT INTO `infox_project_project` VALUES ('628063', '住宅', '2014-03-07 11:58:25', '9999', '超级管理员', '开发一部', '2014-05-26 00:00:00', '2014-03-07 11:58:25', 'ADWORLD住宅(2014年7月リリース分)', '', '沈浩', '<p>顾客满意度85分以上</p>', '1', '2014-03-03 00:00:00', '1', '步行者', '705624', '0428', null, '日立003');
INSERT INTO `infox_project_project` VALUES ('709795', '国民年金', '2014-03-07 12:00:32', '9999', '超级管理员', '开发一部', '2014-04-14 00:00:00', '2014-03-07 12:00:32', 'ADWORLD国民年金系统开发', '', '葉暁夢', '<p>0BUG</p>', '1', '2014-02-20 00:00:00', '1', '奇才', '705624', '1084', null, 'HYSYS001');
INSERT INTO `infox_project_project` VALUES ('833942', '農家台帳', '2014-03-07 11:59:20', '9999', '超级管理员', '开发一部', '2014-05-26 00:00:00', '2014-03-07 11:59:20', 'ADWORLD農家台帳系统开发', '', '肖衛華', '<p>顾客满意度80分以上</p>', '1', '2014-03-03 00:00:00', '1', '热火', '705624', '0993', null, 'HYSYS002');

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
  `onlineState` varchar(255) DEFAULT NULL,
  `workStatus` int(11) NOT NULL,
  `japanese` varchar(255) DEFAULT NULL,
  `isLeader` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB2970897D4D9D9F` (`ORG_PID`),
  KEY `FK_opvxa3fodnk27n7px66hed13k` (`ORG_PID`),
  CONSTRAINT `FK_opvxa3fodnk27n7px66hed13k` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emp
-- ----------------------------
INSERT INTO `infox_sysmgr_emp` VALUES ('0428', null, '2014-03-07 10:26:09', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:26:09', null, null, 'male', 'Y', '', '沈浩', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0679', null, '2014-03-07 10:45:17', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:45:17', null, null, 'male', 'Y', '', '黄イ聰', '979739', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0684', null, '2014-03-07 10:44:08', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:44:08', null, null, 'male', 'Y', '', '陳瑞庭', '979739', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0718', null, '2014-03-07 10:42:45', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:42:45', null, null, 'female', 'Y', '', '尹莉', '244582', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0866', null, '2014-03-07 10:37:00', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:37:00', null, null, 'female', 'Y', '', '馮英', '244582', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('0993', null, '2014-03-07 10:16:59', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:16:59', null, null, 'male', 'Y', '', '肖衛華', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1060', null, '2014-03-07 10:17:40', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:17:40', null, null, 'male', 'Y', '', '張居爽', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1071', null, '2014-03-09 09:24:34', null, null, 'yanghaoquan@whizen.com', '2014-03-09 09:24:34', null, null, 'female', 'Y', '', '劉偉絹', '705624', null, '0', '', 'N');
INSERT INTO `infox_sysmgr_emp` VALUES ('1074', null, '2014-03-07 10:37:30', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:37:30', null, null, 'female', 'Y', '', '胡珊瑚', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1082', null, '2014-03-07 10:31:58', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:31:58', null, null, 'male', 'Y', '', '周耀高', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1084', null, '2014-03-07 10:37:10', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:37:10', null, null, 'female', 'Y', '', '葉暁夢', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1104', null, '2014-03-07 15:19:41', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:41', null, null, 'male', 'Y', '', '陳剣盛', '979739', null, '0', '', null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1145', null, '2014-03-07 10:37:39', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:37:39', null, null, 'female', 'Y', '', '尹芝蘭', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1206', null, '2014-03-07 10:43:03', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:43:03', null, null, 'female', 'Y', '', '陈嘉雯', '244582', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1219', null, '2014-03-07 10:38:47', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:38:47', null, null, 'male', 'Y', '', '向国華', '498779', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1225', null, '2014-03-07 15:19:47', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:47', null, null, 'male', 'Y', '', '黄腾', '979739', null, '0', '', null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1234', null, '2014-03-07 10:31:23', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:31:23', null, null, 'male', 'Y', '', '方敬濤', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1236', null, '2014-03-07 10:26:43', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:26:43', null, null, 'male', 'Y', '', '唐星星', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1245', null, '2014-03-07 10:20:23', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:20:23', null, null, 'male', 'Y', '', '彭莉平', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1250', null, '2014-03-07 10:48:11', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:48:11', null, null, 'male', 'Y', '', '黄熹舟', '979739', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1257', null, '2014-03-07 15:19:53', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:53', null, null, 'male', 'Y', '', '胡璐瑶', '979739', null, '0', '', null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1265', null, '2014-03-07 10:41:55', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:41:55', null, null, 'male', 'Y', '', '何晨翔', '224263', null, '0', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1269', null, '2014-03-07 15:19:57', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:19:57', null, null, 'male', 'Y', '', '文兆明', '979739', null, '0', '', null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1274', null, '2014-03-07 10:48:37', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:48:37', null, null, 'male', 'Y', '', '莫慧玲', '224263', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1282', null, '2014-03-07 15:20:01', null, null, 'yanghaoquan@whizen.com', '2014-03-07 15:20:01', null, null, 'male', 'Y', '', '余翰祥', '979739', null, '0', '', null);
INSERT INTO `infox_sysmgr_emp` VALUES ('1287', null, '2014-03-07 10:33:17', null, null, 'yanghaoquan@whizen.com', '2014-03-07 10:33:17', null, null, 'male', 'Y', '', '蒋俊強', '705624', null, '1', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('9999', 'admin', null, null, null, null, null, null, 'admin', null, 'Y', null, '超级管理员', null, '1', '9999', null, null);

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
INSERT INTO `infox_sysmgr_empjob` VALUES ('066257', '2014-03-07 10:11:11', '', '2', '高级程序员', '高级PG', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('131044', '2014-03-07 10:12:09', '系统工程师', '3', '系统工程师', 'SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('182894', '2014-03-07 10:14:25', '', '5', '开发部部长', '部长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('197258', '2014-03-07 10:13:03', '项目经理', '4', '主管系统工程师', '主管SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('290529', '2014-03-07 10:20:05', '', '0', '初级PG3', '新人3', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('323017', '2014-03-07 10:13:45', '', '4', '开发部主管', '科长', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('424223', '2014-03-07 10:19:40', '', '0', '初级PG2', '新人2', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('686429', '2014-03-07 10:14:09', '', '5', '高级系统工程师', '高级SE', null);
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0718', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1074', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1236', '066257');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0679', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0993', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1060', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1225', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1234', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0428', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0684', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0866', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1084', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1219', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1245', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1250', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1257', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1265', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1274', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1282', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1287', '424223');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1071', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1082', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1104', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1145', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1206', '933778');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('200025', null, '2014-02-13 10:31:53', null, 'sysmgr/task/task_main.do', 'icon-standard-clock-red', '2014-02-13 10:31:53', null, '定时作业', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('229865', null, '2014-03-07 15:21:36', null, 'sysmgr/org/org_main.do', 'icon-standard-chart-organisation', '2014-03-07 15:21:36', null, '公司部门', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('361454', null, '2014-02-25 19:14:27', null, 'project/project_main/project_main.do', 'icon-standard-application-side-expand', '2014-02-25 19:14:27', null, '项目管理', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('502906', null, '2014-03-07 10:40:32', null, 'project/project_report/project_tasktime_main.do', 'icon-standard-chart-pie', '2014-03-07 10:40:32', null, '稼动率管理', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('527852', null, '2014-03-07 15:21:26', null, 'sysmgr/empjob/empjob_main.do', 'icon-standard-user-red', '2014-03-07 15:21:26', null, '公司岗位', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('547345', null, '2014-02-22 00:50:30', null, 'sysmgr/employee/emp_main.do', 'icon-hamburg-my-account', '2014-02-22 00:50:30', null, '员工管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('675303', null, '2014-02-18 14:50:50', null, 'sysmgr/filemanager/file_main.do', 'icon-standard-folder-database', '2014-02-18 14:50:50', null, '文件管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('784026', null, '2014-02-17 23:13:29', null, 'sysmgr/emponline/online_main.do', 'icon-standard-star', '2014-02-17 23:13:29', null, '登陆历史', '1', null, null, 'F', '876715', 'Y');
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
  PRIMARY KEY (`id`),
  KEY `FK_rwpxh5paok3rmx9s6aie9ps3t` (`ORG_PID`),
  CONSTRAINT `FK_rwpxh5paok3rmx9s6aie9ps3t` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_org_dept
-- ----------------------------
INSERT INTO `infox_sysmgr_org_dept` VALUES ('224263', '品质部', '2014-03-07 15:22:33', null, '', '', '', '品质保证部', null, '2014-03-07 15:22:33', null, '广州华智科技有限公司', '', '', 'D', '983784');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('244582', 'JD4', '2014-03-07 15:22:27', null, '', '', '', '开发四部', null, '2014-03-07 15:22:27', null, '广州华智科技有限公司', '', '', 'D', '983784');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('498779', 'JD2', '2014-03-09 16:35:47', null, '开发二部', '', '', '开发二部', null, '2014-03-09 16:35:47', null, '广州华智科技有限公司', '', '', 'D', '983784');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('705624', 'JD1', '2014-03-09 16:36:01', null, '开发一部', '', '', '开发一部', null, '2014-03-09 16:36:01', null, '广州华智科技有限公司', '', '', 'D', '983784');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('979739', 'JD3', '2014-03-09 16:35:55', null, '开发三部', '', '', '开发三部', null, '2014-03-09 16:35:55', null, '广州华智科技有限公司', '', '', 'D', '983784');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('983784', '000231211', '2014-02-26 13:14:10', null, '广州华智科技有限公司', 'whizen', '020654321', '广州华智科技有限公司', null, '2014-02-26 13:14:10', null, '', '华智', '020123456', 'O', null);

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
INSERT INTO `infox_sysmgr_task` VALUES ('40288185449cfcdc01449d1bf2b30003', '2014-03-07 23:14:18', null, null, '31 13 13 14 5 ? ', '533574:M0', '40288185449cfcdc01449d1bf2b30003', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288185449cfcdc01449d1bf2b50004', '2014-03-07 23:14:18', null, null, '31 13 13 26 3 ? ', '533574:M1', '40288185449cfcdc01449d1bf2b50004', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288185449cfcdc01449d1bf2b70005', '2014-03-07 23:14:18', null, null, '31 13 13 16 5 ? ', '533574:M2', '40288185449cfcdc01449d1bf2b70005', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288185449cfcdc01449d1bf2ba0006', '2014-03-07 23:14:18', null, null, '31 13 13 24 3 ? ', '533574:M3', '40288185449cfcdc01449d1bf2ba0006', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9f63fd0007', '2014-03-07 11:39:00', null, null, '0 30 8 21 4 ? ', '235100:M0', '40288483449a48d101449a9f63fd0007', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9f652d0008', '2014-03-07 11:39:01', null, null, '0 30 8 16 4 ? ', '235100:M1', '40288483449a48d101449a9f652d0008', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9f652f0009', '2014-03-07 11:39:01', null, null, '0 30 8 18 4 ? ', '235100:M2', '40288483449a48d101449a9f652f0009', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9f6530000a', '2014-03-07 11:39:01', null, null, '0 30 8 21 4 ? ', '235100:0', '40288483449a48d101449a9f6530000a', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9f6543000b', '2014-03-07 11:39:01', null, null, '0 30 8 18 4 ? ', '235100:1', '40288483449a48d101449a9f6543000b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9ff8ac000e', '2014-03-07 11:39:39', null, null, '0 30 8 30 4 ? ', '533574:0', '40288483449a48d101449a9ff8ac000e', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449a9ff8af000f', '2014-03-07 11:39:39', null, null, '0 30 8 28 4 ? ', '533574:1', '40288483449a48d101449a9ff8af000f', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa06ba90010', '2014-03-07 11:40:08', null, null, '0 30 8 26 5 ? ', '628063:M0', '40288483449a48d101449aa06ba90010', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa06baa0011', '2014-03-07 11:40:08', null, null, '0 30 8 23 5 ? ', '628063:M1', '40288483449a48d101449aa06baa0011', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa06bab0012', '2014-03-07 11:40:08', null, null, '0 30 8 26 5 ? ', '628063:0', '40288483449a48d101449aa06bab0012', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa06bac0013', '2014-03-07 11:40:08', null, null, '0 30 8 23 5 ? ', '628063:1', '40288483449a48d101449aa06bac0013', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa0e04a0014', '2014-03-07 11:40:38', null, null, '0 30 8 11 4 ? ', '709795:M0', '40288483449a48d101449aa0e04a0014', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa0e04b0015', '2014-03-07 11:40:38', null, null, '0 30 8 15 4 ? ', '709795:M1', '40288483449a48d101449aa0e04b0015', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa0e04c0016', '2014-03-07 11:40:38', null, null, '0 30 8 14 4 ? ', '709795:0', '40288483449a48d101449aa0e04c0016', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa0e0510017', '2014-03-07 11:40:38', null, null, '0 30 8 11 4 ? ', '709795:1', '40288483449a48d101449aa0e0510017', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa128090018', '2014-03-07 11:40:56', null, null, '0 30 8 26 5 ? ', '833942:M0', '40288483449a48d101449aa128090018', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa1280f0019', '2014-03-07 11:40:56', null, null, '0 30 8 23 5 ? ', '833942:M1', '40288483449a48d101449aa1280f0019', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '项目开发人员起止日期提醒', null, 'system', '项目开发人员起止日期提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa12810001a', '2014-03-07 11:40:56', null, null, '0 30 8 26 5 ? ', '833942:0', '40288483449a48d101449aa12810001a', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288483449a48d101449aa12811001b', '2014-03-07 11:40:56', null, null, '0 30 8 23 5 ? ', '833942:1', '40288483449a48d101449aa12811001b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
