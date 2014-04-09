/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-04-09 08:49:13
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
  CONSTRAINT `FK_h9d10dyrql3fb9e1fac7elilh` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_9ptulgtiebssvu6reqewrspm0` FOREIGN KEY (`PEW_PID`) REFERENCES `infox_project_emp_working` (`id`),
  CONSTRAINT `FK_n6r4r99gnknh70nqmgue1kjt3` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_emp_working
-- ----------------------------
INSERT INTO `infox_project_emp_working` VALUES ('402082', '2014-04-03 13:55:55', '2014-06-13', '4', '2014-03-03', '1', '0936', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('411117', '2014-04-08 16:02:20', '2014-04-08', '6', '2014-01-01', '4', '1175', null, '029833');
INSERT INTO `infox_project_emp_working` VALUES ('437367', '2014-04-03 13:55:55', '2014-06-13', '3', '2014-03-03', '1', '0876', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('523014', '2014-04-03 15:40:50', '2014-05-22', '2', '2014-03-17', '1', '0861', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('523732', '2014-04-08 16:02:20', '2014-04-04', '1', '2014-01-01', '4', '0351', null, '029833');
INSERT INTO `infox_project_emp_working` VALUES ('563678', '2014-04-03 13:55:55', '2014-06-13', '1', '2014-03-03', '1', '0215', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('575402', '2014-04-08 16:02:20', '2014-04-08', '4', '2014-01-01', '4', '0718', null, '029833');
INSERT INTO `infox_project_emp_working` VALUES ('610334', '2014-04-08 16:02:20', '2014-04-08', '3', '2014-01-01', '4', '0671', null, '029833');
INSERT INTO `infox_project_emp_working` VALUES ('712909', '2014-04-03 15:59:12', '2014-05-30', '4', '2014-04-01', '1', '0627', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('724109', '2014-04-03 13:55:55', '2014-04-10', '3', '2014-03-03', '1', '0453', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('779784', '2014-04-03 13:55:55', '2014-04-07', '4', '2014-03-10', '1', '1178', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('812866', '2014-04-03 13:55:55', '2014-06-13', '4', '2014-03-06', '1', '1192', null, '370871');
INSERT INTO `infox_project_emp_working` VALUES ('828833', '2014-04-08 16:02:20', '2014-04-08', '6', '2014-01-01', '4', '1206', null, '029833');
INSERT INTO `infox_project_emp_working` VALUES ('865563', '2014-04-08 16:02:20', '2014-04-08', '4', '2014-01-01', '4', '0966', null, '029833');
INSERT INTO `infox_project_emp_working` VALUES ('966618', '2014-04-03 13:55:55', '2014-04-03', '4', '2014-03-03', '1', '1149', null, '370871');

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
  CONSTRAINT `FK_r87cb1fvctw5uxpo2dtn1kng0` FOREIGN KEY (`PROJECT_ID`) REFERENCES `infox_project_project` (`id`),
  CONSTRAINT `FK_bq2ik7889xo03safp9bwivu15` FOREIGN KEY (`EMP_ID`) REFERENCES `infox_sysmgr_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_project_maillist
-- ----------------------------
INSERT INTO `infox_project_maillist` VALUES ('081870', '0215', '370871');
INSERT INTO `infox_project_maillist` VALUES ('263061', '1265', '029833');

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
INSERT INTO `infox_project_overtime` VALUES ('028183', '2014-04-08 16:07:17', null, '0', '0', null, '20', '30', null, '0', '0', '0966', '029833');
INSERT INTO `infox_project_overtime` VALUES ('048010', '2014-04-03 14:00:54', null, '0', '0', null, '18', '8', null, '4', '4', '0936', '370871');
INSERT INTO `infox_project_overtime` VALUES ('080048', '2014-04-03 14:01:22', null, '0', '0', null, '20', '20', null, '0', '0', '1178', '370871');
INSERT INTO `infox_project_overtime` VALUES ('257007', '2014-04-03 14:01:18', null, '0', '0', null, '2', '2', null, '0', '0', '0453', '370871');
INSERT INTO `infox_project_overtime` VALUES ('312941', '2014-04-08 16:07:11', null, '0', '0', null, '45', '50', null, '0', '0', '1206', '029833');
INSERT INTO `infox_project_overtime` VALUES ('366453', '2014-04-08 16:06:28', null, '0', '0', null, '25', '20', null, '6', '6', '0351', '029833');
INSERT INTO `infox_project_overtime` VALUES ('400134', '2014-04-08 16:06:20', null, '0', '0', null, '20', '18', null, '5', '5', '1175', '029833');
INSERT INTO `infox_project_overtime` VALUES ('448218', '2014-04-03 14:01:34', null, '0', '0', null, '25', '20', null, '0', '0', '1149', '370871');
INSERT INTO `infox_project_overtime` VALUES ('507858', '2014-04-08 16:07:05', null, '0', '0', null, '25', '25', null, '0', '0', '0671', '029833');
INSERT INTO `infox_project_overtime` VALUES ('526771', '2014-04-03 14:01:08', null, '0', '0', null, '20', '15', null, '0', '0', '0215', '370871');
INSERT INTO `infox_project_overtime` VALUES ('627149', '2014-04-08 16:06:54', null, '0', '0', null, '30', '28', null, '6', '6', '0718', '029833');
INSERT INTO `infox_project_overtime` VALUES ('641526', '2014-04-03 14:01:29', null, '0', '0', null, '30', '25', null, '0', '0', '1192', '370871');
INSERT INTO `infox_project_overtime` VALUES ('979703', '2014-04-03 14:01:01', null, '0', '0', null, '15', '10', null, '0', '0', '0876', '370871');

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
INSERT INTO `infox_project_project` VALUES ('029833', null, '101111-1-11', '2014-04-08 15:39:07', '9999', '超级管理员', null, '2014-03-31 00:00:00', '2014-04-08 15:39:07', '地域包括ケアＶ２．５対応作業', 'G14HY001-1', '2.5', '12', '0.25', '30', null, '20', null, null, null, '对日长期保守', '2.5', '12', '0.5', '1', '2013-12-02 00:00:00', '3', 'PG-UT', null, '108486', '0351', null);
INSERT INTO `infox_project_project` VALUES ('370871', null, '140210-2-2', '2014-04-08 15:39:42', '9999', '超级管理员', null, '2014-05-22 00:00:00', '2014-04-08 15:39:42', '滋賀銀行殿次期為替端末開発', 'G14HY001', '2', '23', '0.3', '30', null, '35', null, null, null, '对日短期保守项目', '1', '25', '0.5', '0', '2014-03-03 00:00:00', '1', 'PG-UT', null, '615802', '0215', null);
INSERT INTO `infox_project_project` VALUES ('842556', null, '140210-2-2', '2014-04-03 13:53:00', '9999', '超级管理员', null, '2014-06-13 00:00:00', '2014-04-03 13:53:00', '滋賀銀行殿次期為替端末開発', 'G14HY001', '2', '23', '0.3', '1', null, '35', null, null, null, '对日短期保守项目', '30', '25', '0.5', '1', '2014-03-03 00:00:00', '5', 'PG-UT', null, '615802', '0215', '370871');

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
INSERT INTO `infox_sysmgr_emp` VALUES ('0215', 'xiaojun', '2010-06-11', '2014-04-03 13:42:12', null, '', '3', null, 'huanglichang@whizen.com', 'N', '一级', '2014-04-03 13:42:12', '', null, null, '78836624', '', null, '2010-08-06', 'male', '0', 'N', null, '肖俊', '1', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0351', null, '2008-06-06', '2014-04-08 16:12:26', null, '', '3', null, 'huanglichang@whizen.com', 'N', '二级', '2014-04-08 16:12:26', '2014-04-04', '3', null, null, '', null, '2008-08-01', 'male', '0', 'N', null, '李育安', '0', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('0453', null, '2011-07-13', '2014-04-03 14:57:06', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-03 14:57:06', '2014-04-10', '3', null, null, '', null, '2011-09-09', 'male', '0', 'N', null, '李寧', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0627', 'qinyaqiang', '2012-07-05', '2014-04-03 15:58:47', null, '2014-03-17', '2', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-03 15:58:47', '', null, null, '89575787', '', null, '2012-09-07', 'male', '0', 'N', null, '秦亚强', '1', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('0671', null, '2010-07-09', '2014-04-08 16:12:09', null, '', '3', null, 'huanglichang@whizen.com', 'N', '一级', '2014-04-08 16:12:09', '2014-03-10', '2', null, null, '', null, '2010-08-06', 'female', '0', 'N', null, '周玉涵', '0', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('0718', null, '2011-07-01', '2014-04-08 16:15:29', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-08 16:15:29', '2014-03-21', '1', null, null, '', null, '2011-08-05', 'female', '0', 'N', null, '尹莉', '0', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('0861', null, '2008-08-08', '2014-04-03 15:43:33', null, '2014-03-10', '1', null, 'huanglichang@whizen.com', 'N', '一级', '2014-04-03 15:43:33', '', null, null, null, '', null, '2014-03-10', 'male', '0', 'N', null, '张林', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0876', null, '2010-06-11', '2014-04-03 14:06:25', null, '', '3', null, 'huanglichang@whizen.com', 'N', '一级', '2014-04-03 14:06:25', '', null, null, null, '2014-01-01', '岗位变更历史[变更前岗位：系统工程师    变更后岗位：主管系统工程师    实施日期：2014-01-01],', '2010-08-06', 'male', '0', 'N', null, '労漢業', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0936', null, '2011-07-06', '2014-04-03 15:31:03', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-03 15:31:03', '2014-04-03', '1', null, null, '', null, '2011-09-01', 'male', '0', 'N', null, '康富华', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('0966', '', '2011-08-12', '2014-04-08 15:31:28', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-08 15:31:28', '', null, null, '03274396', '', null, '2011-09-01', 'male', '0', 'N', null, '呉順', '0', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('1149', null, '2012-06-08', '2014-04-03 15:31:44', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-03 15:31:44', '2014-04-03', '2', null, null, '', null, '2012-08-10', 'male', '0', 'N', null, '邹广初', '0', '615802');
INSERT INTO `infox_sysmgr_emp` VALUES ('1175', 'liuwenfang', '2013-07-05', '2014-04-08 15:34:31', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-08 15:34:31', '', null, null, '77156129', '', null, '2013-09-03', 'female', '0', 'N', null, '刘文芳', '0', '923158');
INSERT INTO `infox_sysmgr_emp` VALUES ('1178', null, '2013-08-09', '2014-04-08 08:38:24', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-08 08:38:24', '2014-04-07', '2', null, null, '', null, '2013-09-06', 'female', '0', 'N', null, '夏念', '0', '166101');
INSERT INTO `infox_sysmgr_emp` VALUES ('1192', 'xuxiaoshuang', '2013-07-10', '2014-04-03 13:47:23', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-03 13:47:23', '', null, null, '64737884', '', null, '2013-08-09', 'male', '0', 'N', null, '许小双', '1', '166101');
INSERT INTO `infox_sysmgr_emp` VALUES ('1206', 'chenjiawen', '2013-07-05', '2014-04-08 15:33:42', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-08 15:33:42', '', null, null, '34598183', '', null, '2013-09-02', 'female', '0', 'N', null, '陈嘉雯', '0', '108486');
INSERT INTO `infox_sysmgr_emp` VALUES ('1265', 'hechenxiang', '2013-08-01', '2014-04-08 15:35:23', null, '', '3', null, 'huanglichang@whizen.com', 'N', '三级', '2014-04-08 15:35:23', '', null, null, '67632044', '', null, '2013-09-03', 'male', '0', 'N', null, '何晨翔', '0', '429710');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1265', '084650');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0215', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0351', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0861', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0876', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0453', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0671', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0627', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0718', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0966', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0936', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1149', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1175', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1178', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1192', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1206', '791596');

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
INSERT INTO `infox_sysmgr_org_dept` VALUES ('097175', null, '2014-04-03 13:20:08', null, '', null, null, 'JD2-2', null, '2014-04-03 13:20:08', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('108486', null, '2014-04-03 13:20:45', null, '', null, null, 'JD4-2', null, '2014-04-03 13:20:45', null, '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('166101', null, '2014-04-03 13:20:21', null, '', null, null, 'JD3-1', null, '2014-04-03 13:20:21', null, '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('400771', null, '2014-04-03 13:21:48', null, '', null, null, '财务部', null, '2014-04-03 13:21:48', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '综合管理部', '', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('429710', null, '2014-04-03 13:20:58', null, '', null, null, '品质部', null, '2014-04-03 13:20:58', null, '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('474835', null, '2014-04-03 13:21:38', null, '', null, null, '采购部', null, '2014-04-03 13:21:38', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '综合管理部', '', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('526169', null, '2014-04-03 13:30:54', null, '', null, null, '北京分公司', null, '2014-04-03 13:30:54', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('528026', null, '2014-04-03 13:19:20', null, '', null, null, 'JD1-2', null, '2014-04-03 13:19:20', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('604742', null, '2014-04-03 13:19:59', null, '', null, null, 'JD2-1', null, '2014-04-03 13:19:59', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('615802', null, '2014-04-03 13:18:44', null, '', null, null, 'JD1-3', null, '2014-04-03 13:18:44', null, '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('634670', null, '2014-04-03 13:30:37', null, '', null, null, '苏州开发部', null, '2014-04-03 13:30:37', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '苏州分公司', '', null, 'D', '886155');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('649496', null, '2014-04-03 13:19:08', null, '', null, null, 'JD1-1', null, '2014-04-03 13:19:08', null, '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('682781', null, '2014-04-03 13:21:27', null, '', null, null, '综合管理部', null, '2014-04-03 13:21:27', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('853418', null, '2014-04-03 13:21:58', null, '', null, null, '人事部', null, '2014-04-03 13:21:58', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '综合管理部', '', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('886155', null, '2014-04-03 13:30:23', null, '', null, null, '苏州分公司', null, '2014-04-03 13:30:23', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('923158', null, '2014-04-03 13:20:35', null, '', null, null, 'JD4-1', null, '2014-04-03 13:20:35', null, '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '广东华智科技有限公司', '', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('943553', null, '2014-04-03 13:31:04', null, '', null, null, '北京开发部', null, '2014-04-03 13:31:04', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '北京分公司', '', null, 'D', '526169');
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
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145268e53c0000a', '2014-04-03 15:47:12', null, null, '30 35 8 22 5 ? ', '370871:0', '4028824e45262b310145268e53c0000a', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145268e53df000b', '2014-04-03 15:47:12', null, null, '30 35 8 19 5 ? ', '370871:1', '4028824e45262b310145268e53df000b', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad295000c', '2014-04-03 16:00:51', null, null, '30 35 8 1 4 ? ', '370871:M0', '4028824e45262b310145269ad295000c', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad295000d', '2014-04-03 16:00:51', null, null, '30 35 8 13 6 ? ', '370871:M1', '4028824e45262b310145269ad295000d', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad295000e', '2014-04-03 16:00:51', null, null, '30 35 8 10 4 ? ', '370871:M2', '4028824e45262b310145269ad295000e', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad295000f', '2014-04-03 16:00:51', null, null, '30 35 8 30 5 ? ', '370871:M3', '4028824e45262b310145269ad295000f', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad2a50010', '2014-04-03 16:00:51', null, null, '30 35 8 28 5 ? ', '370871:M4', '4028824e45262b310145269ad2a50010', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad2a50011', '2014-04-03 16:00:51', null, null, '30 35 8 22 5 ? ', '370871:M5', '4028824e45262b310145269ad2a50011', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad2b40012', '2014-04-03 16:00:51', null, null, '30 35 8 3 4 ? ', '370871:M6', '4028824e45262b310145269ad2b40012', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad2b40013', '2014-04-03 16:00:51', null, null, '30 35 8 11 6 ? ', '370871:M7', '4028824e45262b310145269ad2b40013', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad2b40014', '2014-04-03 16:00:51', null, null, '30 35 8 8 4 ? ', '370871:M8', '4028824e45262b310145269ad2b40014', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45262b310145269ad2b40015', '2014-04-03 16:00:51', null, null, '30 35 8 20 5 ? ', '370871:M9', '4028824e45262b310145269ad2b40015', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45405b110145405b118b0008', '2014-04-08 16:01:21', null, null, '0 35 8 31 3 ? ', '029833:0', '4028824e45405b110145405b118b0008', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e45405b110145405b118b0009', '2014-04-08 16:01:21', null, null, '0 35 8 27 3 ? ', '029833:1', '4028824e45405b110145405b118b0009', 'Y', 'com.infox.project.job.ProjectSchedulerEmail', '项目结束日期提醒', null, 'system', '项目结束定时邮件');
