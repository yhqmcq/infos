/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50518
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-03-03 09:56:31
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
  CONSTRAINT `FK_h9d10dyrql3fb9e1fac7elilh` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_9ptulgtiebssvu6reqewrspm0` FOREIGN KEY (`PEW_PID`) REFERENCES `infox_project_emp_working` (`id`),
  CONSTRAINT `FK_n6r4r99gnknh70nqmgue1kjt3` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_emp_working
-- ----------------------------

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
INSERT INTO `infox_project_project` VALUES ('383087', 'CMS', '2014-03-03 08:42:58', '000000', '超级管理员', '开发一部', '2014-03-13 00:00:00', '2014-03-03 08:42:58', '内容管理系统CMS', '杨浩泉', '0', '2014-03-03 00:00:00', '0', 'tt_cms', '705624', '1039', null, null, null);

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
INSERT INTO `infox_sysmgr_emp` VALUES ('0000', 'djj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的进进', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000000', 'admin', '2014-02-26 13:18:39', null, null, 'infos@service.com', '2014-02-26 13:18:39', null, '', 'admin', 'male', 'Y', '020888888', '超级管理员', null, '1', '', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('0001', 'wln', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '我里年', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('00010', 'nnq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '年那奇', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000100', 'xjh', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '小今花', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000101', 'jkq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '进口去', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000102', 'jhj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '杰花杰', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000103', 'lxm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '兰行们', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000104', 'wqj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '乌去进', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000105', 'ehk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '哦花克', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000106', 'dzq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的最去', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000107', 'kjl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克今兰', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000108', 'jjl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '进杰里', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000109', 'jje', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '进进哦', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('00011', 'hzk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '花最克', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000110', 'qnw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '去年乌', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000111', 'nks', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '年口洒', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000112', 'mws', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '们乌洒', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000113', 'kjw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '口近我', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000114', 'hhd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '花花的', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000115', 'xsw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '逊洒胃', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000116', 'dse', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的洒哦', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000117', 'exk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '哦小克', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000118', 'mhj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '们花今', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000119', 'ded', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的哦的', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('00012', 'mdk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '们的克', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000120', 'nnx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '年那行', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000121', 'kde', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克的哦', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000122', 'wwq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '胃我去', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000123', 'dzn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的最那', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000124', 'kdd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克的的', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000125', 'zkl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '最克里', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000126', 'ldj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '里的近', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000127', 'sjs', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '洒进洒', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000128', 'jdw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '今的胃', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000129', 'kmj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '口们进', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('00013', 'wkz', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '胃克最', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000130', 'dqd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的去的', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000131', 'djm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的今们', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000132', 'xqk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '行去克', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000133', 'xdj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '小的杰', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000134', 'nsq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '年洒去', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000135', 'jmx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '近们小', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000136', 'kjd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '口进的', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000137', 'ddw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的的乌', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000138', 'qhk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '去花克', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000139', 'xkn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '逊克年', '498779', null, '系统工程师', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('00014', 'jej', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '杰哦今', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000140', 'llj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '里里杰', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000141', 'xhj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '逊花今', '979739', null, '程序员', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('000142', 'dhd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的花的', '705624', null, '项目经理', '1');
INSERT INTO `infox_sysmgr_emp` VALUES ('0251', null, '2014-03-03 09:04:46', null, null, 'yhqmcq@126.com', '2014-03-03 09:04:46', null, '开发二部', null, 'male', 'Y', '', '网吧', '498779', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1038', null, '2014-03-03 09:55:20', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:20', null, '开发三部', null, 'male', 'Y', '', '张三', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1039', null, '2014-03-03 09:55:31', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:31', null, '开发一部', null, 'male', 'Y', '', '杨浩泉', '705624', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('111', null, '2014-03-03 09:55:51', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:51', null, '开发三部', null, 'male', 'Y', '', '老李', '979739', null, '项目经理,系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1254', null, '2014-03-03 09:55:55', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:55', null, '开发一部', null, 'male', 'Y', '', '李四', '705624', null, '系统工程师', '0');

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
