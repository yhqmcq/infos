/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-03-04 20:02:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `infox_project_emp_working`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_emp_working`;
CREATE TABLE `infox_project_emp_working` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `status` int(11) NOT NULL,
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
INSERT INTO `infox_project_emp_working` VALUES ('177026', '2014-03-04 10:23:19', '张三', '2014-03-20', '华智DRP', '2014-03-04', '4', '1038', null, '234999');
INSERT INTO `infox_project_emp_working` VALUES ('318767', '2014-03-04 10:24:30', '杨浩泉', '2014-03-20', '华智DRP', '2014-03-04', '1', '1039', null, '234999');
INSERT INTO `infox_project_emp_working` VALUES ('505718', '2014-03-04 10:23:45', '网吧', '2014-03-19', '123', '2014-03-04', '1', '0251', null, '302956');

-- ----------------------------
-- Table structure for `infox_project_maillist`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_maillist`;
CREATE TABLE `infox_project_maillist` (
  `id` varchar(255) NOT NULL,
  `deptid` varchar(255) DEFAULT NULL,
  `deptname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `empid` varchar(255) DEFAULT NULL,
  `empjobid` varchar(255) DEFAULT NULL,
  `empjobname` varchar(255) DEFAULT NULL,
  `empname` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `PROJECT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r87cb1fvctw5uxpo2dtn1kng0` (`PROJECT_ID`),
  CONSTRAINT `FK_r87cb1fvctw5uxpo2dtn1kng0` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_maillist
-- ----------------------------
INSERT INTO `infox_project_maillist` VALUES ('091694', '979739', '开发三部', 'yhqmcq@126.com', '111', '197258', '项目经理', '老李', '内容管理系统CMS', '383087');
INSERT INTO `infox_project_maillist` VALUES ('370369', '498779', '开发二部', 'yhqmcq@126.com', '0251', '197258', '项目经理', '网吧', '华智DRP', '234999');
INSERT INTO `infox_project_maillist` VALUES ('543448', '705624', '开发一部', 'yhqmcq@126.com', '1039', '131044', '系统工程师', '杨浩泉', '华智DRP', '234999');
INSERT INTO `infox_project_maillist` VALUES ('572755', '979739', '开发三部', 'yhqmcq@126.com', '1038', '933778', '程序员', '张三', '华智DRP', '234999');
INSERT INTO `infox_project_maillist` VALUES ('891010', '705624', '开发一部', 'yhqmcq@126.com', '1254', '131044', '系统工程师', '李四', '内容管理系统CMS', '383087');

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
  `project_leader` varchar(255) DEFAULT NULL,
  `project_type` int(11) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `DEPT_PID` varchar(255) DEFAULT NULL,
  `EMP_ID` varchar(255) DEFAULT NULL,
  `PROJECT_PID` varchar(255) DEFAULT NULL,
  `project_desc` longtext,
  `project_target` longtext,
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
INSERT INTO `infox_project_project` VALUES ('054314', 'whizen-drp', '2014-03-04 19:33:45', '9999', '超级管理员', '开发三部', '2014-03-21 00:00:00', '2014-03-04 19:33:45', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('091493', 'mm', '2014-03-04 19:08:27', '9999', '超级管理员', '开发一部', '2014-03-20 00:00:00', '2014-03-04 19:08:27', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '5', '123', '705624', '1039', '123073', '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('096504', 'CMS', '2014-03-03 08:42:58', '000000', '超级管理员', '开发一部', '2014-03-13 00:00:00', '2014-03-03 08:42:58', '内容管理系统CMS', '杨浩泉', '0', '2014-03-03 00:00:00', '5', 'tt_cms', '705624', '1039', '383087', null, null);
INSERT INTO `infox_project_project` VALUES ('123073', 'mm', '2014-03-04 19:16:40', '9999', '超级管理员', '开发一部', '2014-03-12 00:00:00', '2014-03-04 19:16:40', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '0', '123', '705624', '1039', null, '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('125658', 'whizen-drp', '2014-03-04 19:26:06', '9999', '超级管理员', '开发三部', '2014-03-19 00:00:00', '2014-03-04 19:26:06', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('125660', 'whizen-drp', '2014-03-04 19:34:50', '9999', '超级管理员', '开发三部', '2014-03-20 00:00:00', '2014-03-04 19:34:50', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('164324', 'mm', '2014-03-04 18:52:57', '9999', '超级管理员', '开发一部', '2014-03-18 00:00:00', '2014-03-04 18:52:57', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '5', '123', '705624', '1039', '123073', '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('184404', 'mm', '2014-03-04 19:08:05', '9999', '超级管理员', '开发一部', '2014-03-19 00:00:00', '2014-03-04 19:08:05', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '5', '123', '705624', '1039', '123073', '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('208862', 'whizen-drp', '2014-03-04 19:29:12', '9999', '超级管理员', '开发三部', '2014-03-04 00:00:00', '2014-03-04 19:29:12', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('228699', 'whizen-drp', '2014-03-04 19:29:58', '9999', '超级管理员', '开发三部', '2014-03-19 00:00:00', '2014-03-04 19:29:58', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('234999', 'whizen-drp', '2014-03-04 19:55:43', '9999', '超级管理员', '开发三部', '2014-03-19 00:00:00', '2014-03-04 19:55:43', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '2', 'drp-team', '979739', '111', null, '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('240582', 'whizen-drp', '2014-03-04 19:26:31', '9999', '超级管理员', '开发三部', '2014-03-12 00:00:00', '2014-03-04 19:26:31', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('268477', '12', '2014-03-04 16:23:31', '9999', '超级管理员', '开发一部', '2014-03-24 00:00:00', '2014-03-04 16:23:31', '12', '杨浩泉', '0', '2014-03-04 00:00:00', '0', '12', '705624', '1039', null, '', '<p>12<br/></p>');
INSERT INTO `infox_project_project` VALUES ('269026', 'whizen-drp', '2014-03-04 19:40:16', '9999', '超级管理员', '开发三部', '2014-03-25 00:00:00', '2014-03-04 19:40:16', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('302956', '123', '2014-03-03 20:22:51', '9999', '超级管理员', '开发三部', '2014-03-11 00:00:00', '2014-03-03 20:22:51', '123', '杨浩泉', '0', '2014-03-03 00:00:00', '0', '123', '979739', '1039', null, '', '<p>r44<br/></p>');
INSERT INTO `infox_project_project` VALUES ('322492', 'mm', '2014-03-04 19:09:33', '9999', '超级管理员', '开发一部', '2014-03-12 00:00:00', '2014-03-04 19:09:33', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '5', '123', '705624', '1039', '123073', '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('345868', 'whizen-drp', '2014-03-04 19:24:19', '9999', '超级管理员', '开发三部', '2014-03-11 00:00:00', '2014-03-04 19:24:19', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('348681', 'mm', '2014-03-04 16:14:05', '9999', '超级管理员', '开发一部', '2014-03-24 00:00:00', '2014-03-04 16:14:05', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '5', '123', '705624', '1039', '123073', '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('355667', 'vvvv', '2014-03-04 17:51:22', '9999', '超级管理员', '开发一部', '2014-03-11 00:00:00', '2014-03-04 17:51:22', 'vvv', '张三', '0', '2014-03-04 00:00:00', '0', 'dvvdv', '705624', '1038', null, '', '<p>dvsvdsd<br/></p>');
INSERT INTO `infox_project_project` VALUES ('365605', '1', '2014-03-04 15:41:05', '9999', '超级管理员', '开发三部', '2014-03-12 00:00:00', '2014-03-04 15:41:05', '1', '张三', '0', '2014-03-04 00:00:00', '0', '2', '979739', '1038', null, '', '<p>12<br/></p>');
INSERT INTO `infox_project_project` VALUES ('383087', 'CMS', '2014-03-03 12:21:02', '000000', '超级管理员', '开发一部', '2014-03-20 00:00:00', '2014-03-03 12:21:02', '内容管理系统CMS', '1039', '0', '2014-03-03 00:00:00', '3', 'tt_cms', '705624', '1039', null, '', '');
INSERT INTO `infox_project_project` VALUES ('426756', '32423', '2014-03-04 16:24:48', '9999', '超级管理员', '开发三部', '2014-03-30 00:00:00', '2014-03-04 16:24:48', '2343242', '网吧', '0', '2014-03-04 00:00:00', '0', '312312', '979739', '0251', null, '', '<p>213<br/></p>');
INSERT INTO `infox_project_project` VALUES ('434403', 'whizen-drp', '2014-03-04 19:32:41', '9999', '超级管理员', '开发三部', '2014-03-21 00:00:00', '2014-03-04 19:32:41', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('440782', 'mm', '2014-03-04 19:16:06', '9999', '超级管理员', '开发一部', '2014-03-20 00:00:00', '2014-03-04 19:16:06', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '5', '123', '705624', '1039', '123073', '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('457951', 'whizen-drp', '2014-03-04 19:25:17', '9999', '超级管理员', '开发三部', '2014-03-12 00:00:00', '2014-03-04 19:25:17', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('464990', 'whizen-drp', '2014-03-04 19:25:37', '9999', '超级管理员', '开发三部', '2014-03-13 00:00:00', '2014-03-04 19:25:37', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('468737', 'whizen-drp', '2014-03-04 19:21:31', '9999', '超级管理员', '开发三部', '2014-03-12 00:00:00', '2014-03-04 19:21:31', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('602878', 'mm', '2014-03-04 19:14:45', '9999', '超级管理员', '开发一部', '2014-03-11 00:00:00', '2014-03-04 19:14:45', 'mm', '杨浩泉', '0', '2014-03-04 00:00:00', '5', '123', '705624', '1039', '123073', '', '<p>123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('668486', 'whizen-drp', '2014-03-04 19:22:55', '9999', '超级管理员', '开发三部', '2014-03-12 00:00:00', '2014-03-04 19:22:55', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('745045', 'whizen-drp', '2014-03-04 19:33:11', '9999', '超级管理员', '开发三部', '2014-03-14 00:00:00', '2014-03-04 19:33:11', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('771099', 'whizen-drp', '2014-03-04 19:39:40', '9999', '超级管理员', '开发三部', '2014-03-11 00:00:00', '2014-03-04 19:39:40', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('772208', 'whizen-drp', '2014-03-04 19:22:21', '9999', '超级管理员', '开发三部', '2014-03-20 00:00:00', '2014-03-04 19:22:21', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('779095', 'whizen-drp', '2014-03-04 19:41:57', '9999', '超级管理员', '开发三部', '2014-03-14 00:00:00', '2014-03-04 19:41:57', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('833609', 'whizen-drp', '2014-03-04 19:43:58', '9999', '超级管理员', '开发三部', '2014-03-28 00:00:00', '2014-03-04 19:43:58', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');
INSERT INTO `infox_project_project` VALUES ('973551', 'whizen-drp', '2014-03-04 19:40:34', '9999', '超级管理员', '开发三部', '2014-03-19 00:00:00', '2014-03-04 19:40:34', '华智DRP', '老李', '0', '2014-03-03 00:00:00', '5', 'drp-team', '979739', '111', '234999', '<p>不好<br/></p>', '<p>123123<br/></p>');

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
  `orgname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `ORG_PID` varchar(255) DEFAULT NULL,
  `onlineState` varchar(255) DEFAULT NULL,
  `empjobsName` varchar(255) DEFAULT NULL,
  `workStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB2970897D4D9D9F` (`ORG_PID`),
  KEY `FK_opvxa3fodnk27n7px66hed13k` (`ORG_PID`),
  CONSTRAINT `FK_opvxa3fodnk27n7px66hed13k` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emp
-- ----------------------------
INSERT INTO `infox_sysmgr_emp` VALUES ('0251', null, '2014-03-03 09:04:46', null, null, 'yhqmcq@126.com', '2014-03-03 09:04:46', null, '开发二部', null, 'male', 'Y', '', '网吧', '498779', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('1038', null, '2014-03-03 09:55:20', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:20', null, '开发三部', null, 'male', 'Y', '', '张三', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1039', null, '2014-03-03 09:55:31', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:31', null, '开发一部', null, 'male', 'Y', '', '杨浩泉', '705624', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('111', null, '2014-03-03 09:55:51', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:51', null, '开发三部', null, 'male', 'Y', '', '老李', '979739', null, '项目经理,系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1254', null, '2014-03-03 09:55:55', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:55', null, '开发一部', null, 'male', 'Y', '', '李四', '705624', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('9999', 'admin', null, null, null, null, null, null, null, 'admin', null, 'Y', null, '超级管理员', null, '1', null, '9999');

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
INSERT INTO `infox_sysmgr_empjob` VALUES ('131044', '2014-02-26 13:25:39', '系统工程师', 'II', '系统工程师', 'SE', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('197258', '2014-02-26 13:25:20', '项目经理', 'II', '项目经理', 'PM', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('933778', '2014-02-26 13:26:07', '程序员', 'I', '程序员', 'PG', null);

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
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483448561c401448561c4ac0000', 'admin', '000000', '本地', '2014-03-03 08:39:40', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483448567520144856752790000', 'admin', '000000', '本地', '2014-03-03 08:45:44', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emponline` VALUES ('40288483448575ba01448575ba5e0000', 'admin', '000000', '本地', '2014-03-03 09:01:29', '超级管理员', '1');

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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1039', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('111', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1254', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0251', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('111', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1038', '933778');

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
INSERT INTO `infox_sysmgr_menu` VALUES ('229865', null, '2014-02-22 00:50:50', null, 'sysmgr/org/org_main.do', 'icon-standard-chart-organisation', '2014-02-22 00:50:50', null, '机构部门', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('361454', null, '2014-02-25 19:14:27', null, 'project/project_main/project_main.do', 'icon-standard-application-side-expand', '2014-02-25 19:14:27', null, '项目管理', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('527852', null, '2014-02-22 10:20:57', null, 'sysmgr/empjob/empjob_main.do', 'icon-standard-user-red', '2014-02-22 10:20:57', null, '员工角色', '1', null, null, 'F', '876715', 'Y');
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
INSERT INTO `infox_sysmgr_org_dept` VALUES ('498779', 'JD1-2', '2014-02-26 13:15:37', null, '开发二部', 'JD1-2', '', '开发二部', null, '2014-02-26 13:15:37', null, '广州华智科技有限公司', 'JD1-2', '', 'D', '983784');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('705624', 'JD1-1', '2014-02-26 13:16:11', null, '开发一部', 'JD1-1', '', '开发一部', null, '2014-02-26 13:16:11', null, '广州华智科技有限公司', 'JD1-1', '', 'O', '983784');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('979739', 'JD1-3', '2014-02-26 13:16:04', null, '开发三部', 'JD1-3', '', '开发三部', null, '2014-02-26 13:16:04', null, '广州华智科技有限公司', 'JD1-3', '', 'D', '983784');
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
INSERT INTO `infox_sysmgr_task` VALUES ('40288182448cdaa601448ce88b690011', '2014-03-04 19:41:03', null, null, '0 30 8 17 3 ? ', '234999:0', '40288182448cdaa601448ce5a3ca000b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('40288182448cdaa601448ce88b730012', '2014-03-04 19:41:03', null, null, '0 30 8 14 3 ? ', '234999:1', '40288182448cdaa601448ce5a3ca000c', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
