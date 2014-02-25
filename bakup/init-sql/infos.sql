/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-02-26 00:48:42
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `infox_project_project` VALUES ('372272', '123', '2014-02-25 20:07:32', '684340', '超级管理员', '333', '2014-03-05 00:00:00', '2014-02-25 20:07:32', '123', '123', '0', '2014-02-25 00:00:00', '0', '123', '372764', '123', null);

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
  `empjonsName` varchar(255) DEFAULT NULL,
  `empjobsName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB2970897D4D9D9F` (`ORG_PID`),
  KEY `FK_opvxa3fodnk27n7px66hed13k` (`ORG_PID`),
  CONSTRAINT `FK_opvxa3fodnk27n7px66hed13k` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_emp
-- ----------------------------
INSERT INTO `infox_sysmgr_emp` VALUES ('0ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('10ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('11ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('123', null, '2014-02-25 20:06:30', null, null, '', '2014-02-25 20:06:30', null, '333', null, 'male', 'Y', '123', '123', '372764', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('12ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('13ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('14ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('15ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('16ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('17ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('18ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('19ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('1ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('20ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('21ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('22ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('23ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('24ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('25ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('26ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('27ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('28ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('29ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('2ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('3ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('4ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('5ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('684340', 'admin', '2014-02-10 19:04:32', null, null, 'service@infox.com', '2014-02-10 19:04:32', null, '', 'admin', 'male', 'Y', '020-888888', '超级管理员', null, '0', null, null);
INSERT INTO `infox_sysmgr_emp` VALUES ('6ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('7ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('8ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');
INSERT INTO `infox_sysmgr_emp` VALUES ('9ABC', null, '2014-02-25 20:51:50', null, null, '213123', '2014-02-25 20:51:50', null, '222', null, 'male', 'Y', '213', '213', '482825', null, null, '');

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
INSERT INTO `infox_sysmgr_empjob` VALUES ('906869', '2014-02-25 21:22:49', '', '12', '12', '212', null);

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
INSERT INTO `infox_sysmgr_emp_online` VALUES ('402881844468e805014468e8055b0000', 'admin', '684340', '本地', '2014-02-25 19:57:20', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emp_online` VALUES ('402881844468f02f014468f02fa50000', 'admin', '684340', '本地', '2014-02-25 20:06:15', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emp_online` VALUES ('402881844468f763014468f763df0000', 'admin', '684340', '本地', '2014-02-25 20:14:07', '超级管理员', '1');
INSERT INTO `infox_sysmgr_emp_online` VALUES ('402881844468f763014469514b500001', 'admin', '684340', '本地', '2014-02-25 21:52:19', '超级管理员', '0');

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
INSERT INTO `infox_sysmgr_org_dept` VALUES ('372764', '33', '2014-02-25 19:58:20', null, '', '3', '3', '333', null, '2014-02-25 19:58:20', null, '1111', '33', '3', 'D', '833426');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('482825', '222', '2014-02-25 19:58:02', null, '', '22', '', '222', null, '2014-02-25 19:58:02', null, '1111', '222', '', 'D', '833426');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('833426', '111', '2014-02-25 19:57:54', null, '', '111', '11', '1111', null, '2014-02-25 19:57:54', null, '', '11', '11', 'O', null);

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
