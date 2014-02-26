/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-02-26 13:47:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `infox_project_emp_working`
-- ----------------------------
DROP TABLE IF EXISTS `infox_project_emp_working`;
CREATE TABLE `infox_project_emp_working` (
  `id` varchar(255) NOT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `FK_oc4cyt5xd9fbcqevg6qgleu7u` (`DEPT_PID`),
  KEY `FK_58k8x19mnvcpcr2dbrbenvrnd` (`EMP_ID`),
  KEY `FK_6xotk0sp040j9x9f62gto9jln` (`PROJECT_PID`),
  CONSTRAINT `FK_6xotk0sp040j9x9f62gto9jln` FOREIGN KEY (`PROJECT_PID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_58k8x19mnvcpcr2dbrbenvrnd` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`),
  CONSTRAINT `FK_oc4cyt5xd9fbcqevg6qgleu7u` FOREIGN KEY (`DEPT_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_project
-- ----------------------------
INSERT INTO `infox_project_project` VALUES ('648614', 'whizen-OA', '2014-02-26 13:45:02', '000000', '超级管理员', '开发一部', '2014-03-13 00:00:00', '2014-02-26 13:45:02', '华智OA自动办公管理系统', '小今花', '0', '2014-02-26 00:00:00', '0', 'SQL-OA', '705624', '000100', null);

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
INSERT INTO `infox_sysmgr_emp` VALUES ('0000', 'djj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的进进', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000000', 'admin', '2014-02-26 13:18:39', null, null, 'infos@service.com', '2014-02-26 13:18:39', null, '', 'admin', 'male', 'Y', '020888888', '超级管理员', null, '1', '', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0001', 'wln', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '我里年', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00010', 'nnq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '年那奇', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000100', 'xjh', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '小今花', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000101', 'jkq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '进口去', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000102', 'jhj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '杰花杰', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000103', 'lxm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '兰行们', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000104', 'wqj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '乌去进', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000105', 'ehk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '哦花克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000106', 'dzq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的最去', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000107', 'kjl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克今兰', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000108', 'jjl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '进杰里', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000109', 'jje', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '进进哦', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00011', 'hzk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '花最克', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000110', 'qnw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '去年乌', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000111', 'nks', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '年口洒', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000112', 'mws', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '们乌洒', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000113', 'kjw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '口近我', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000114', 'hhd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '花花的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000115', 'xsw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '逊洒胃', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000116', 'dse', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的洒哦', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000117', 'exk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '哦小克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000118', 'mhj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '们花今', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000119', 'ded', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的哦的', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00012', 'mdk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '们的克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000120', 'nnx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '年那行', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000121', 'kde', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克的哦', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000122', 'wwq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '胃我去', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000123', 'dzn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的最那', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000124', 'kdd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克的的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000125', 'zkl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '最克里', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000126', 'ldj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '里的近', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000127', 'sjs', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '洒进洒', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000128', 'jdw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '今的胃', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000129', 'kmj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '口们进', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00013', 'wkz', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '胃克最', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000130', 'dqd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的去的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000131', 'djm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的今们', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000132', 'xqk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '行去克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000133', 'xdj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '小的杰', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000134', 'nsq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '年洒去', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000135', 'jmx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '近们小', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000136', 'kjd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '口进的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000137', 'ddw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的的乌', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000138', 'qhk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '去花克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000139', 'xkn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '逊克年', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00014', 'jej', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '杰哦今', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000140', 'llj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '里里杰', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000141', 'xhj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '逊花今', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000142', 'dhd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的花的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000143', 'ewm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '哦胃们', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000144', 'xqz', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '行奇最', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000145', 'zsd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '最洒的', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000146', 'nqk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '那奇口', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000147', 'lll', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '兰里里', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000148', 'jdl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '今的里', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000149', 'qnh', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '去年花', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00015', 'jlh', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '近里花', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000150', 'oqx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '偶去行', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000151', 'khm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克花们', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000152', 'sdn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '洒的年', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000153', 'ojk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '偶近口', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000154', 'hjq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '花杰去', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000155', 'wjx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '乌近小', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000156', 'dhj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的花今', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000157', 'dkm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的克们', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000158', 'dll', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的兰兰', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000159', 'qnx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '去那行', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00016', 'wlj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '我兰近', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000160', 'wnk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '胃年克', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000161', 'hjd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '花进的', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000162', 'wwd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '我我的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000163', 'klo', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克兰偶', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000164', 'jxd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '进行的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000165', 'qmd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '奇们的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000166', 'kdj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '口的近', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000167', 'dnk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的那口', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000168', 'dsd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的洒的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000169', 'wkj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '我克进', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00017', 'wxw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '我小乌', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000170', 'snj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '洒那进', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000171', 'jhd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '近花的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000172', 'edw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '哦的胃', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000173', 'kxj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克行进', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000174', 'dll', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的兰里', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000175', 'kke', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '口克哦', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000176', 'kdx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克的小', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000177', 'xjo', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '行杰偶', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000178', 'khx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克花行', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000179', 'qdw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '去的乌', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00018', 'nqw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '那奇胃', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000180', 'nwm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '那我们', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000181', 'hqx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '花去行', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000182', 'jqm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '进去们', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000183', 'jkk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '今克克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000184', 'wsd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '乌洒的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000185', 'kmj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克们今', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000186', 'dkw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的克乌', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000187', 'www', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '胃我乌', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000188', 'qnl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '奇那兰', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000189', 'wxx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '胃小小', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00019', 'mwj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '们我近', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000190', 'sjd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '洒杰的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000191', 'swx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '洒乌行', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000192', 'wxd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '胃小的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000193', 'djd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的杰的', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000194', 'zle', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '最兰哦', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000195', 'zkn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '最克那', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000196', 'sqq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '洒奇奇', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000197', 'zjk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '最杰口', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000198', 'djk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的杰克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('000199', 'khx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克花小', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0002', 'kdx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克的行', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00020', 'jkn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '进克那', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00021', 'dxd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的小的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00022', 'sws', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '洒我洒', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00023', 'jme', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '今们哦', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00024', 'wsd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '我洒的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00025', 'qxo', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '去逊偶', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00026', 'wqk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '乌奇克', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00027', 'xnl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '小年兰', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00028', 'znk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '最那克', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00029', 'exk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '哦行克', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0003', 'qwx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '奇乌行', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00030', 'qne', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '奇年哦', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00031', 'jeq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '今哦去', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00032', 'lmj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '兰们杰', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00033', 'zsl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '最洒里', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00034', 'lml', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '里们里', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00035', 'oqh', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '偶奇花', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00036', 'oll', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '偶里兰', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00037', 'khj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克花近', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00038', 'mqj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '们奇近', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00039', 'mwn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '们胃年', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0004', 'mdl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '们的里', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00040', 'lom', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '兰偶们', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00041', 'wqk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '乌去克', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00042', 'jql', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '进去兰', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00043', 'xxz', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '逊行最', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00044', 'oxj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '偶小今', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00045', 'dwx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的乌行', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00046', 'zwx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '最胃逊', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00047', 'jed', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '近哦的', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00048', 'ojk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '偶进克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00049', 'qok', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '奇偶克', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0005', 'whx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '胃花行', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00050', 'okn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '偶口那', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00051', 'kdk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '克的克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00052', 'ees', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '哦哦洒', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00053', 'kwx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克我行', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00054', 'esx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '哦洒小', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00055', 'lxd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '里小的', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00056', 'nds', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '那的洒', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00057', 'okz', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '偶克最', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00058', 'wlw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '我里胃', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00059', 'ekk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '哦口口', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0006', 'wdl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '我的兰', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00060', 'koj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '口偶近', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00061', 'wwd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '我我的', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00062', 'jlj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '今里近', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00063', 'xko', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '小克偶', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00064', 'ksw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克洒乌', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00065', 'lkj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '里口今', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00066', 'jdk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '进的口', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00067', 'lel', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '里哦兰', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00068', 'xlj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '逊里今', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00069', 'qjd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '奇近的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0007', 'jnw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '今年胃', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00070', 'dnq', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '的年奇', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00071', 'kkj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '克克近', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00072', 'jzj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '近最近', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00073', 'jeh', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '杰哦花', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00074', 'xqx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '行去逊', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00075', 'sqj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '洒去杰', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00076', 'ewj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '哦胃杰', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00077', 'nwj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '年我杰', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00078', 'wdk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '胃的口', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00079', 'kdj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '口的进', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0008', 'lxw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '兰逊乌', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00080', 'mqd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '们奇的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00081', 'xjl', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '小今兰', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00082', 'wsk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '乌洒口', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00083', 'kww', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '口胃我', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00084', 'jsh', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '进洒花', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00085', 'dno', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '的那偶', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00086', 'wxj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '胃小今', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00087', 'dkk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '的克克', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00088', 'wkw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '乌口我', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00089', 'qdn', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '奇的那', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('0009', 'wdo', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '乌的偶', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00090', 'xkw', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '行克胃', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00091', 'xmm', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '小们们', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00092', 'wxj', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '胃逊杰', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00093', 'jkd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '今口的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00094', 'kxd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克行的', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00095', 'wkx', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '我克小', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00096', 'odd', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '偶的的', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00097', 'xok', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发二部', null, 'male', 'Y', '020123456', '小偶克', '498779', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00098', 'kjo', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发一部', null, 'male', 'Y', '020123456', '克近偶', '705624', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('00099', 'ldk', '2014-02-26 13:43:49', null, null, 'yhqmcq@126.com', '2014-02-26 13:43:49', null, '开发三部', null, 'male', 'Y', '020123456', '里的克', '979739', null, '程序员', '0');

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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0001', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000101', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000103', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000107', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000109', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00011', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000113', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000115', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000119', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000121', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000125', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000127', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00013', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000131', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000133', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000137', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000139', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000143', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000145', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000149', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000151', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000155', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000157', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000161', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000163', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000167', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000169', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00017', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000173', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000175', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000179', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000181', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000185', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000187', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00019', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000191', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000193', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000197', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000199', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00023', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00025', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00029', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00031', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00035', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00037', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00041', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00043', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00047', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00049', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0005', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00053', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00055', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00059', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00061', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00065', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00067', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0007', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00071', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00073', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00077', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00079', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00083', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00085', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00089', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00091', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00095', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00097', '131044');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00010', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000100', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000104', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000106', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000110', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000112', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000116', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000118', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000122', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000124', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000128', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000130', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000134', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000136', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00014', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000140', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000142', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000146', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000148', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000152', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000154', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000158', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00016', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000160', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000164', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000166', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000170', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000172', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000176', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000178', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000182', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000184', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000188', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000190', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000194', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000196', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0002', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00020', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00022', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00026', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00028', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00032', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00034', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00038', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0004', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00040', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00044', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00046', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00050', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00052', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00056', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00058', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00062', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00064', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00068', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00070', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00074', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00076', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0008', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00080', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00082', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00086', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00088', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00092', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00094', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00098', '197258');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0000', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000102', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000105', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000108', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000111', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000114', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000117', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00012', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000120', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000123', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000126', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000129', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000132', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000135', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000138', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000141', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000144', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000147', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00015', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000150', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000153', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000156', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000159', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000162', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000165', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000168', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000171', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000174', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000177', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00018', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000180', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000183', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000186', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000189', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000192', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000195', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('000198', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00021', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00024', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00027', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0003', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00030', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00033', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00036', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00039', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00042', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00045', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00048', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00051', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00054', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00057', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0006', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00060', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00063', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00066', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00069', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00072', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00075', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00078', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00081', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00084', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00087', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0009', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00090', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00093', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00096', '933778');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('00099', '933778');

-- ----------------------------
-- Table structure for `infox_sysmgr_emp_online`
-- ----------------------------
DROP TABLE IF EXISTS `infox_sysmgr_emp_online`;
CREATE TABLE `infox_sysmgr_emp_online` (
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
-- Records of infox_sysmgr_emp_online
-- ----------------------------
INSERT INTO `infox_sysmgr_emp_online` VALUES ('40288182446ca69301446ca6936c0000', 'admin', '000000', '本地', '2014-02-26 13:24:19', '超级管理员', '1');

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