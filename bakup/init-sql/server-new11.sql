/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-05-19 09:01:59
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
INSERT INTO `infox_sysmgr_emp` VALUES ('0007', 'linchaoquan', '2004-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'linchaoquan@whizen.com', null, '二级', '2014-05-15 10:23:18', null, null, null, '66521896', null, null, '2004-07-15', '男', '0', 'N', null, '林超权', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0013', '722442822222456', '2004-06-01', '2014-05-15 10:23:21', null, null, '3', null, '722442822222456@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '41714065', null, null, '2004-07-15', '男', '0', 'N', null, '黄海涛', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0027', 'lijia', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'lijia@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '46001546', null, null, '2005-08-01', '男', '0', 'N', null, '李甲', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('003', 'wangmin', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'wangmin@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '47045645', null, null, '2005-07-04', '女', '0', 'N', null, '王敏', '0', '682781');
INSERT INTO `infox_sysmgr_emp` VALUES ('0032', 'suweilai', '2005-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'suweilai@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '10591663', null, null, '2005-08-01', '男', '0', 'N', null, '苏炜来', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0050', 'xiaohaobo', '2002-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'xiaohaobo@whizen.com', null, '二级', '2014-05-15 10:23:14', null, null, null, '62860458', null, null, '2002-07-21', '男', '0', 'N', null, '肖浩波', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0052', '736462999397253', '2004-06-01', '2014-05-15 10:23:20', null, null, '3', null, '736462999397253@whizen.com', null, '一级', '2014-05-15 10:23:20', null, null, null, '50218953', null, null, '2004-08-01', '女', '0', 'N', null, '陈建', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0053', 'christom', '2004-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'christom@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '89381928', null, null, '2004-08-01', '男', '0', 'N', null, '谭建斌', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0067', 'huangyong', '2004-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huangyong@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '84329728', null, null, '2005-07-04', '男', '0', 'N', null, '黄勇', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0070', 'jiangsihua', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'jiangsihua@whizen.com', null, '三级', '2014-05-15 10:23:16', null, null, null, '30086439', null, null, '2005-07-25', '男', '0', 'N', null, '蒋思华', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0086', 'suxiaolan', '2003-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'suxiaolan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '12028423', null, null, '2006-01-24', '女', '0', 'N', null, '苏肖兰', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0100', 'tanghaiyan', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'tanghaiyan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '44681476', null, null, '2006-03-27', '女', '0', 'Y', null, '唐海艳', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0119', '927493932823494', '2006-06-01', '2014-05-15 10:23:21', null, null, '3', null, '927493932823494@whizen.com', null, '三级', '2014-05-15 10:23:21', null, null, null, '50458580', null, null, '2006-08-01', '女', '0', 'N', null, '段金余', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0137', 'songlingling', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'songlingling@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '27694070', null, null, '2006-08-01', '女', '0', 'N', null, '宋玲玲', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0150', 'xuying', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xuying@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '65223027', null, null, '2006-08-01', '女', '0', 'N', null, '徐滢', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0155', 'zhuweiyong', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zhuweiyong@whizen.com', null, '二级', '2014-05-15 10:23:13', null, null, null, '03071398', null, null, '2006-08-01', '男', '0', 'N', null, '朱伟勇', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0160', '843852433143873', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, '843852433143873@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '15363435', null, null, '2006-08-01', '女', '0', 'N', null, '周秀珍', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0183', 'yangchunhua', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'yangchunhua@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '21904611', null, null, '2006-08-01', '女', '0', 'N', null, '杨春花', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0190', 'liguanjie', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'liguanjie@whizen.com', null, '二级', '2014-05-15 10:23:13', null, null, null, '54072800', null, null, '2006-08-01', '男', '0', 'N', null, '李冠杰', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0197', 'zhushuxin', '2006-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'zhushuxin@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '21511568', null, null, '2006-08-01', '男', '0', 'N', null, '朱树歆', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0201', 'wangchao', '2004-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'wangchao@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '94458695', null, null, '2006-11-14', '男', '0', 'N', null, '王超', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('0207', 'liuyong', '2002-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'liuyong@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '85474244', null, null, '2007-04-16', '男', '0', 'N', null, '刘永', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0215', 'xiaojun', '2006-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'xiaojun@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '04775681', null, null, '2007-05-07', '男', '0', 'N', null, '肖俊', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0216', 'dongpengwu', '2004-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'dongpengwu@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '34229969', null, null, '2007-05-07', '男', '0', 'N', null, '董鹏武', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0217', 'wangyang', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wangyang@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '58480699', null, null, '2007-05-07', '男', '0', 'N', null, '汪扬', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0236', 'lizhixian', '2007-06-01', '2014-05-15 10:23:10', null, null, '3', null, 'lizhixian@whizen.com', null, '二级', '2014-05-15 10:23:10', null, null, null, '95083836', null, null, '2007-07-02', '男', '0', 'N', null, '李智贤', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0262', 'linqunyan', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'linqunyan@whizen.com', null, '二级', '2014-05-15 10:23:12', null, null, null, '39781648', null, null, '2007-07-02', '女', '0', 'N', null, '林群艳', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0280', 'zhonghuifeng', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zhonghuifeng@whizen.com', null, '二级', '2014-05-15 10:23:14', null, null, null, '94977490', null, null, '2007-07-02', '女', '0', 'N', null, '钟惠凤', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0284', 'chenxidong', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'chenxidong@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '28826972', null, null, '2007-07-02', '男', '0', 'N', null, '陈熙东', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0295', 'huangpengfei', '2007-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huangpengfei@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '76334024', null, null, '2007-07-02', '男', '0', 'N', null, '黄鹏飞', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0301', 'liumin0301', '2006-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liumin0301@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '43809120', null, null, '2007-07-02', '女', '0', 'N', null, '刘敏', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0306', '925925812429766', '2007-06-01', '2014-05-15 10:23:26', null, null, '3', null, '925925812429766@whizen.com', null, '二级', '2014-05-15 10:23:26', null, null, null, '55229069', null, null, '2007-08-01', '男', '0', 'N', null, '游魁良', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('031', 'wanglili', '2005-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'wanglili@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '66939960', null, null, '2005-08-01', '女', '0', 'N', null, '王莉莉', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0314', 'liuyu', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'liuyu@whizen.com', null, '二级', '2014-05-15 10:23:12', null, null, null, '47724656', null, null, '2007-08-01', '男', '0', 'N', null, '刘裕', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0317', 'huanglichang', '2012-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huanglichang@whizen.com', null, '三级', '2014-05-15 11:06:19', null, null, null, 'zhujin8970', null, null, '2007-09-10', '女', '0', 'Y', null, '黄丽嫦', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0322', 'zhongjia', '2007-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhongjia@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '14607165', null, null, '2008-01-08', '女', '0', 'N', null, '钟加', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0339', 'xuhongqi', '2002-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'xuhongqi@whizen.com', null, '一级', '2014-05-15 10:23:18', null, null, null, '60553552', null, null, '2008-03-31', '女', '0', 'N', null, '徐红齐', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('0342', 'liyan', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liyan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '78555125', null, null, '2008-06-02', '女', '0', 'N', null, '李艳', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('0348', 'liuting', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liuting@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '71723523', null, null, '2008-08-04', '女', '0', 'N', null, '刘婷', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0351', '110677875073948', '2008-06-01', '2014-05-15 10:23:25', null, null, '3', null, '110677875073948@whizen.com', null, '二级', '2014-05-15 10:23:25', null, null, null, '12181902', null, null, '2008-08-04', '男', '0', 'N', null, '李育安', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0377', '808440644119771', '2011-06-30', '2014-05-15 10:23:25', null, null, '3', null, '808440644119771@whizen.com', null, '二级', '2014-05-15 10:23:25', null, null, null, '92167351', null, null, '2008-08-04', '男', '0', 'N', null, '刘渊', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0394', 'liuwenyu', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liuwenyu@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '00603571', null, null, '2008-08-04', '男', '0', 'N', null, '刘文育', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0413', 'zhenghui', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'zhenghui@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '96772572', null, null, '2008-08-04', '女', '0', 'N', null, '郑惠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0428', 'shenhao', '2007-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'shenhao@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '39569635', null, null, '2008-08-04', '男', '0', 'N', null, '沈浩', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0449', 'fuxiaoyan', '2007-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'fuxiaoyan@whizen.com', null, '二级', '2014-05-15 10:23:18', null, null, null, '30770872', null, null, '2009-02-13', '女', '0', 'Y', null, '符晓燕', '0', '474835');
INSERT INTO `infox_sysmgr_emp` VALUES ('0452', 'xiayunhuan', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xiayunhuan@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '67795866', null, null, '2009-05-14', '女', '0', 'N', null, '夏耘寰', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0453', 'lining', '2007-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'lining@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '86473446', null, null, '2009-07-01', '男', '0', 'N', null, '李宁', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0480', '572095720199521', '2009-06-01', '2014-05-15 10:23:23', null, null, '3', null, '572095720199521@whizen.com', null, '二级', '2014-05-15 10:23:23', null, null, null, '48211935', null, null, '2009-07-13', '男', '0', 'N', null, '石元春', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('049', 'zhougang', '2004-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zhougang@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '36530325', null, null, '2004-09-15', '男', '0', 'N', null, '周纲', '0', '917489');
INSERT INTO `infox_sysmgr_emp` VALUES ('0498', 'caojuan', '2009-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'caojuan@whizen.com', null, '三级', '2014-05-15 10:23:16', null, null, null, '35687276', null, null, '2009-07-13', '女', '0', 'N', null, '曹娟', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('051', 'zhangruolin', '2004-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'zhangruolin@whizen.com', null, '三级', '2014-05-15 10:23:19', null, null, null, '35324521', null, null, '2004-08-01', '男', '0', 'N', null, '张若林', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0520', 'yanghui', '2009-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'yanghui@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '85443305', null, null, '2009-07-13', '女', '0', 'N', null, '杨辉', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0546', 'mochengzhang', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'mochengzhang@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '13268442', null, null, '2009-10-13', '男', '0', 'N', null, '莫承长', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('055', 'luowen', '2003-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'luowen@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '39076491', null, null, '2006-01-01', '男', '0', 'N', null, '罗文', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0559', 'zhangyuangong', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zhangyuangong@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '83347353', null, null, '2010-01-18', '男', '0', 'N', null, '张元巩', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0562', 'huangyu', '2009-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huangyu@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '37031038', null, null, '2010-01-21', '男', '0', 'N', null, '黄宇', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0564', 'hefei', '2003-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'hefei@whizen.com', null, '二级', '2014-05-15 10:23:14', null, null, null, '52919118', null, null, '2010-03-09', '女', '0', 'N', null, '贺飞', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0569', 'wanghui', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wanghui@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '92706264', null, null, '2010-03-22', '女', '0', 'N', null, '王晖', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0577', '339321392651630', '2004-06-01', '2014-05-15 10:23:22', null, null, '3', null, '339321392651630@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '71629571', null, null, '2010-04-07', '男', '0', 'N', null, '吴迪', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0579', 'houxiaohui', '2008-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'houxiaohui@whizen.com', null, '三级', '2014-05-15 10:23:12', null, null, null, '60689421', null, null, '2010-04-26', '女', '0', 'N', null, '侯小慧', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0583', 'chenshunyin', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'chenshunyin@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '52111701', null, null, '2010-05-06', '男', '0', 'N', null, '陈舜殷', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0588', 'suyi', '2004-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'suyi@whizen.com', null, '二级', '2014-05-15 10:23:19', null, null, null, '59917324', null, null, '2010-04-07', '男', '0', 'N', null, '粟毅', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0590', 'yangmengping', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'yangmengping@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '30080725', null, null, '2010-07-02', '女', '0', 'N', null, '杨孟平', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0601', 'jinyao', '2007-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'jinyao@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '46090411', null, null, '2010-05-14', '男', '0', 'N', null, '金瑶', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0603', 'zhongzhichao', '2003-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zhongzhichao@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '13543750', null, null, '2010-05-17', '男', '0', 'N', null, '钟智超', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0621', '582654094947692', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '582654094947692@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '36139071', null, null, '2010-07-05', '男', '0', 'N', null, '邹志伟', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0624', 'liyue', '2010-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'liyue@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '52667476', null, null, '2010-07-02', '女', '0', 'N', null, '李越', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0626', 'shisha', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'shisha@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '20211384', null, null, '2010-07-02', '女', '0', 'N', null, '石莎', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0627', 'qinyaqiang', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'qinyaqiang@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '21977354', null, null, '2010-07-02', '男', '0', 'N', null, '秦亚强', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0658', '586427680785499', '2010-06-01', '2014-05-15 10:23:24', null, null, '3', null, '586427680785499@whizen.com', null, '三级', '2014-05-15 10:23:24', null, null, null, '57634200', null, null, '2010-07-02', '女', '0', 'N', null, '毛秋林', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0666', 'zhangning', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhangning@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '65007772', null, null, '2010-07-02', '男', '0', 'N', null, '张宁', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0669', 'huangjiakui', '2010-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangjiakui@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '54854706', null, null, '2010-07-02', '男', '0', 'N', null, '黄加魁', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0670', 'huanglindi', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huanglindi@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '00376935', null, null, '2010-07-02', '女', '0', 'N', null, '黄林娣', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0671', 'zhouyuhan', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhouyuhan@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '60636650', null, null, '2010-07-02', '女', '0', 'N', null, '周玉涵', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0674', 'duandehong', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'duandehong@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '67953903', null, null, '2010-07-02', '女', '0', 'N', null, '段德红', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0675', 'huanghaiping', '2000-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'huanghaiping@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '79728252', null, null, '2010-07-01', '女', '0', 'N', null, '黄海萍', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0676', 'wangweibin', '2006-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'wangweibin@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '42956380', null, null, '2010-07-05', '男', '0', 'N', null, '王伟滨', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0678', '451560194479268', '2010-06-01', '2014-05-15 10:23:20', null, null, '3', null, '451560194479268@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '22708952', null, null, '2010-07-07', '男', '0', 'N', null, '游洪鑫', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0679', 'huangweicong', '2007-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangweicong@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '28885946', null, null, '2010-07-12', '男', '0', 'N', null, '黄炜聪', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0681', 'wangzhiqing', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wangzhiqing@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '24565031', null, null, '2010-07-13', '女', '0', 'N', null, '王志青', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0684', 'chenruiting', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'chenruiting@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '37967335', null, null, '2010-07-21', '男', '0', 'N', null, '陈瑞庭', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0694', 'luweiniu', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'luweiniu@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '27892010', null, null, '2010-10-08', '男', '0', 'N', null, '卢炜钮', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0696', 'lanyuping', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'lanyuping@whizen.com', null, '一级', '2014-05-15 10:23:19', null, null, null, '46809289', null, null, '2010-10-18', '女', '0', 'N', null, '蓝宇萍', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0704', '834683666139373', '1999-06-01', '2014-05-15 10:23:22', null, null, '3', null, '834683666139373@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '73404266', null, null, '2010-12-01', '女', '0', 'N', null, '袁俏', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0714', 'wangchengwen', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'wangchengwen@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '64569818', null, null, '2010-12-23', '男', '0', 'N', null, '王成文', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0715', 'wangjunjun', '2011-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'wangjunjun@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '01790225', null, null, '2011-07-04', '女', '0', 'N', null, '王俊俊', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0718', 'yinli', '2009-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'yinli@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '18260072', null, null, '2010-12-23', '女', '0', 'N', null, '尹莉', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0721', 'dengliwei', '2008-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'dengliwei@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '36884835', null, null, '2011-01-05', '男', '0', 'N', null, '邓立伟', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0729', '404426588271096', '2008-06-01', '2014-05-15 10:23:22', null, null, '3', null, '404426588271096@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '06560307', null, null, '2011-03-01', '女', '0', 'N', null, '欧桂娇', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0730', '356947493646265', '2008-06-01', '2014-05-15 10:23:22', null, null, '3', null, '356947493646265@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '95772151', null, null, '2011-03-03', '男', '0', 'N', null, '宋祖超', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0734', '365737461534190', '2007-06-01', '2014-05-15 10:23:21', null, null, '3', null, '365737461534190@whizen.com', null, '一级', '2014-05-15 10:23:21', null, null, null, '67824773', null, null, '2011-03-14', '男', '0', 'N', null, '龚朝晖', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0735', '821360403370616', '2011-06-01', '2014-05-15 10:23:24', null, null, '3', null, '821360403370616@whizen.com', null, '三级', '2014-05-15 10:23:24', null, null, null, '84248839', null, null, '2011-07-04', '男', '0', 'N', null, '杨玉', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0738', 'huangguorong', '1980-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'huangguorong@whizen.com', null, '--', '2014-05-15 10:23:18', null, null, null, '39028680', null, null, '2011-03-28', '男', '0', 'N', null, '黄国荣', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('0741', 'liang', '2009-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liang@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '06721551', null, null, '2011-04-01', '男', '0', 'N', null, '李昂', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0747', 'wubaojie', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wubaojie@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '04023002', null, null, '2011-04-11', '男', '0', 'N', null, '吴保杰', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0748', 'chengpeng', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'chengpeng@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '18317417', null, null, '2011-04-11', '男', '0', 'N', null, '程鹏', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0749', 'zouke', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zouke@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '79544421', null, null, '2011-04-11', '男', '0', 'N', null, '邹科', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0752', 'denglixian', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'denglixian@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '06924526', null, null, '2011-05-09', '女', '0', 'N', null, '邓丽贤', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0753', 'pengyao', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'pengyao@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '24439415', null, null, '2011-05-24', '男', '0', 'N', null, '彭尧', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0755', 'zhushaofeng', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'zhushaofeng@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '18685259', null, null, '2011-06-07', '女', '0', 'N', null, '朱韶峰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0757', 'xuwubin', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'xuwubin@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '23381096', null, null, '2011-06-13', '女', '0', 'N', null, '徐五斌', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0790', '649092515336255', '2011-06-20', '2014-05-15 10:23:21', null, null, '3', null, '649092515336255@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '56722609', null, null, '2011-06-20', '男', '0', 'N', null, '洪学臣', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0792', 'luzhijun', '2011-06-30', '2014-05-15 10:23:19', null, null, '3', null, 'luzhijun@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '20970906', null, null, '2011-07-04', '男', '0', 'N', null, '鲁智君', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0793', 'luoqiyu', '2011-07-01', '2014-05-15 10:23:17', null, null, '3', null, 'luoqiyu@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '83708465', null, null, '2011-07-04', '男', '0', 'N', null, '罗奇郁', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0795', '060057331833599', '2011-06-20', '2014-05-15 10:23:21', null, null, '3', null, '060057331833599@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '13272910', null, null, '2011-06-20', '男', '0', 'N', null, '李永栋', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0801', 'lanyan', '2006-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'lanyan@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '37679574', null, null, '2006-08-01', '女', '0', 'N', null, '蓝艳', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0803', 'yaolihua', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'yaolihua@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '10425174', null, null, '2006-08-01', '女', '0', 'N', null, '姚利花', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0806', 'duanxiaolin', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'duanxiaolin@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '06767818', null, null, '2006-08-01', '男', '0', 'N', null, '段小林', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0809', 'fangjinzhong', '2006-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'fangjinzhong@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '06312263', null, null, '2006-08-01', '男', '0', 'N', null, '方进忠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0811', '547551564084666', '2006-06-01', '2014-05-15 10:23:21', null, null, '3', null, '547551564084666@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '83438756', null, null, '2006-08-01', '男', '0', 'N', null, '向宁', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0814', '283992502327268', '2006-06-01', '2014-05-15 10:23:22', null, null, '3', null, '283992502327268@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '31999800', null, null, '2006-08-01', '男', '0', 'N', null, '林青', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0817', 'lichao', '2006-06-01', '2014-05-15 10:23:10', null, null, '3', null, 'lichao@whizen.com', null, '一级', '2014-05-15 10:23:10', null, null, null, '88777653', null, null, '2006-08-01', '男', '0', 'N', null, '李超', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0818', 'jiangbo', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'jiangbo@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '93602466', null, null, '2006-08-01', '男', '0', 'N', null, '姜波', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0823', 'pengyun', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'pengyun@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '14271396', null, null, '2006-08-01', '男', '0', 'N', null, '彭昀', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0850', 'panxisheng', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'panxisheng@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '37782105', null, null, '2006-08-01', '男', '0', 'N', null, '潘熙圣', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0853', 'chendanxi', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'chendanxi@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '69727104', null, null, '2006-08-01', '男', '0', 'N', null, '陈丹樨', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0854', 'chentengji', '2006-06-01', '2014-05-15 10:23:08', null, null, '3', null, 'chentengji@whizen.com', null, '一级', '2014-05-15 10:23:08', null, null, null, '34187390', null, null, '2006-08-01', '男', '0', 'N', null, '陈腾记', '0', '188927');
INSERT INTO `infox_sysmgr_emp` VALUES ('0855', 'xuchongjin', '2006-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'xuchongjin@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '32971098', null, null, '2006-08-01', '男', '0', 'N', null, '许崇锦', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0856', 'zhengshuxi', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'zhengshuxi@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '31455809', null, null, '2006-08-01', '男', '0', 'N', null, '郑曙熹', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0858', '086971762587780', '2006-06-01', '2014-05-15 10:23:22', null, null, '3', null, '086971762587780@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '38547459', null, null, '2006-08-01', '男', '0', 'N', null, '伍铭思', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0860', 'xiongliuhua', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'xiongliuhua@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '87456591', null, null, '2006-08-01', '女', '0', 'N', null, '熊柳华', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0866', 'fengying', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'fengying@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '92902409', null, null, '2007-08-29', '女', '0', 'N', null, '冯英', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0868', 'huangyong0868', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'huangyong0868@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '92315824', null, null, '2007-08-29', '男', '0', 'N', null, '黄勇2', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0869', '017711857683321', '2007-06-20', '2014-05-15 10:23:21', null, null, '3', null, '017711857683321@whizen.com', null, '一级', '2014-05-15 10:23:21', null, null, null, '67182170', null, null, '2007-08-29', '男', '0', 'N', null, '吕军', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0876', 'laohanye', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'laohanye@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '50283579', null, null, '2007-08-29', '男', '0', 'N', null, '劳汉业', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0883', 'heweixin', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'heweixin@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '50906130', null, null, '2007-08-29', '男', '0', 'N', null, '何伟新', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0887', 'chenyouxing', '2007-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'chenyouxing@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '62299135', null, null, '2007-08-29', '男', '0', 'N', null, '陈有兴', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0895', '214133904944328', '2007-06-01', '2014-05-15 10:23:21', null, null, '3', null, '214133904944328@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '46346346', null, null, '2007-08-29', '男', '0', 'N', null, '罗振坤', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0920', 'lukui', '2011-06-20', '2014-05-15 10:23:15', null, null, '3', null, 'lukui@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '44805723', null, null, '2011-07-04', '男', '0', 'N', null, '陆魁', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0921', 'liuhui0921', '2011-06-22', '2014-05-15 10:23:15', null, null, '3', null, 'liuhui0921@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '34264545', null, null, '2011-07-04', '男', '0', 'N', null, '刘辉', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0931', '628458873399359', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '628458873399359@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '43749646', null, null, '2011-07-04', '女', '0', 'N', null, '汪丽平', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0936', 'kangfuhua', '2011-06-25', '2014-05-15 10:23:13', null, null, '3', null, 'kangfuhua@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '78048362', null, null, '2011-07-04', '男', '0', 'N', null, '康富华', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0938', 'xiaoshaohai', '2011-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'xiaoshaohai@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '76706841', null, null, '2011-06-22', '男', '0', 'N', null, '肖少海', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0950', '101552793868886', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '101552793868886@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '22401995', null, null, '2011-06-22', '女', '0', 'N', null, '周意', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0966', 'wushun', '2011-06-22', '2014-05-15 10:23:17', null, null, '3', null, 'wushun@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '54883056', null, null, '2011-07-04', '男', '0', 'N', null, '吴顺', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0970', '906830770527898', '2011-06-22', '2014-05-15 10:23:20', null, null, '3', null, '906830770527898@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '96005110', null, null, '2011-07-04', '女', '0', 'N', null, '李银凤', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0971', '746941880044575', '2011-06-22', '2014-05-15 10:23:21', null, null, '3', null, '746941880044575@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '53058427', null, null, '2011-07-04', '女', '0', 'N', null, '吴虹莉', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0974', '468951682278813', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '468951682278813@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '07845879', null, null, '2011-07-04', '女', '0', 'N', null, '杨足霞', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('098', 'liuqinghai', '2001-06-01', '2014-05-15 10:23:10', null, null, '3', null, 'liuqinghai@whizen.com', null, '二级', '2014-05-15 10:23:10', null, null, null, '63849685', null, null, '2006-03-02', '男', '0', 'N', null, '刘青海', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0985', '184349626058927', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '184349626058927@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '91923322', null, null, '2011-07-04', '女', '0', 'N', null, '谢羽', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0990', 'lingshouming', '2008-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'lingshouming@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '73877438', null, null, '2011-07-14', '男', '0', 'N', null, '凌受铭', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0993', 'xiaoweihua', '2009-06-30', '2014-05-15 10:23:11', null, null, '3', null, 'xiaoweihua@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '41979745', null, null, '2011-07-20', '男', '0', 'N', null, '肖卫华', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0994', 'huangshijue', '2005-06-20', '2014-05-15 10:23:15', null, null, '3', null, 'huangshijue@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '03212105', null, null, '2011-07-25', '女', '0', 'N', null, '黄仕珏', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1000', 'liping', '2009-06-25', '2014-05-15 10:23:18', null, null, '3', null, 'liping@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '54508431', null, null, '2011-08-22', '女', '0', 'Y', null, '李萍', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('1003', '866808676842773', '2009-06-30', '2014-05-15 10:23:22', null, null, '3', null, '866808676842773@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '82475009', null, null, '2011-08-29', '男', '0', 'N', null, '廖果', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1004', 'lizhiyong', '2007-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'lizhiyong@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '21699481', null, null, '2011-09-01', '男', '0', 'N', null, '李智勇', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1015', 'liujiajun', '2011-07-10', '2014-05-15 10:23:14', null, null, '3', null, 'liujiajun@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '94456315', null, null, '2011-10-08', '男', '0', 'N', null, '刘加俊', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1022', 'lilixia', '2008-07-01', '2014-05-15 10:23:14', null, null, '3', null, 'lilixia@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '96994877', null, null, '2011-10-28', '女', '0', 'N', null, '李丽霞', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1027', '756572054097161', '2009-06-30', '2014-05-15 10:23:21', null, null, '3', null, '756572054097161@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '03327074', null, null, '2011-11-02', '男', '0', 'N', null, '张俊林', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1028', 'chenzhenrui', '2008-06-25', '2014-05-15 10:23:14', null, null, '3', null, 'chenzhenrui@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '65655027', null, null, '2011-11-03', '男', '0', 'N', null, '陈振锐', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1034', 'wangxitao', '2011-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'wangxitao@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '60754863', null, null, '2011-11-03', '男', '0', 'N', null, '王细桃', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1039', 'yanghaoquan', '2008-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'yanghaoquan@whizen.com', null, '三级', '2014-05-15 11:00:37', null, null, null, 'yhqmcq520+', null, null, '2011-11-07', '男', '0', 'Y', null, '杨浩泉', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1046', 'cenlijian', '2003-07-01', '2014-05-15 10:23:14', null, null, '3', null, 'cenlijian@whizen.com', null, '二级', '2014-05-15 10:23:14', null, null, null, '02565828', null, null, '2011-11-18', '男', '0', 'N', null, '岑礼健', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1054', '759334536020130', '2005-06-30', '2014-05-15 10:23:22', null, null, '3', null, '759334536020130@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '80481003', null, null, '2011-12-12', '男', '0', 'N', null, '黄勇钦', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1059', 'ganjiawei', '2010-07-01', '2014-05-15 10:23:16', null, null, '3', null, 'ganjiawei@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '27624384', null, null, '2011-12-15', '男', '0', 'N', null, '甘嘉炜', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1060', 'zhangjushuang', '2008-06-30', '2014-05-15 10:23:11', null, null, '3', null, 'zhangjushuang@whizen.com', null, '四级', '2014-05-15 10:23:11', null, null, null, '57307612', null, null, '2011-12-21', '男', '0', 'N', null, '张居爽', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1061', 'zengshuxiong', '2004-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'zengshuxiong@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '85505886', null, null, '2012-01-04', '男', '0', 'N', null, '曾树雄', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1063', 'huanghe', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huanghe@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '01830045', null, null, '2012-07-02', '男', '0', 'N', null, '黄河', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1064', '439651385483875', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '439651385483875@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '82413730', null, null, '2012-07-02', '男', '0', 'N', null, '黄权盛', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1065', '486020925167589', '2012-06-01', '2014-05-15 10:23:21', null, null, '3', null, '486020925167589@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '51446176', null, null, '2012-07-02', '女', '0', 'N', null, '邓洁', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1067', 'chengang1067', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'chengang1067@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '08844726', null, null, '2012-07-02', '男', '0', 'N', null, '陈刚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1068', 'zhangyuxiang', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'zhangyuxiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '32221690', null, null, '2012-07-02', '男', '0', 'N', null, '张玉祥', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1071', 'liuweijuan', '2012-06-03', '2014-05-15 10:23:12', null, null, '3', null, 'liuweijuan@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '49054861', null, null, '2012-07-02', '女', '0', 'N', null, '刘伟娟', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1072', '685874772596027', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '685874772596027@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '18564387', null, null, '2012-07-02', '男', '0', 'N', null, '张智峰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1073', '736381692509911', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '736381692509911@whizen.com', null, '一级', '2014-05-15 10:23:25', null, null, null, '97681909', null, null, '2012-07-02', '女', '0', 'N', null, '余沁芸', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1074', '619350611951664', '2012-06-01', '2014-05-15 10:23:26', null, null, '3', null, '619350611951664@whizen.com', null, '三级', '2014-05-15 10:23:26', null, null, null, '89879417', null, null, '2012-07-02', '女', '0', 'N', null, '胡珊珊', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1079', 'chenya', '2012-06-02', '2014-05-15 10:23:12', null, null, '3', null, 'chenya@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '56726137', null, null, '2012-07-02', '男', '0', 'N', null, '陈亚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1082', 'zhouyaogao', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'zhouyaogao@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '84583949', null, null, '2012-07-02', '男', '0', 'N', null, '周耀高', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1084', 'yexiaomeng', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'yexiaomeng@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '51072264', null, null, '2012-02-07', '女', '0', 'N', null, '叶晓梦', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1097', 'wuxiaoming', '2012-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'wuxiaoming@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '07934693', null, null, '2012-07-02', '男', '0', 'N', null, '吴晓明', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1099', '221805663251279', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '221805663251279@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '09252386', null, null, '2012-07-02', '男', '0', 'N', null, '叶秦泰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1101', 'songqiaohong', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'songqiaohong@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '94045783', null, null, '2012-07-02', '女', '0', 'N', null, '宋巧红', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1104', 'chenjiansheng', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'chenjiansheng@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '71177303', null, null, '2012-07-02', '男', '0', 'N', null, '陈剑盛', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1108', '844962744819641', '2012-06-01', '2014-05-15 10:23:21', null, null, '3', null, '844962744819641@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '96156563', null, null, '2012-07-02', '男', '0', 'N', null, '唐亚军', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1109', 'yuguihong', '2009-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'yuguihong@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '73774827', null, null, '2012-02-21', '女', '0', 'N', null, '余桂虹', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1110', 'xiongkun', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xiongkun@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '47449454', null, null, '2012-02-27', '男', '0', 'N', null, '熊坤', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1112', '510453219237197', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '510453219237197@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '83897191', null, null, '2012-07-02', '男', '0', 'N', null, '林铿鸿', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1113', '702438683314788', '2010-06-01', '2014-05-15 10:23:22', null, null, '3', null, '702438683314788@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '51336932', null, null, '2012-03-01', '男', '0', 'N', null, '李林', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1117', 'xiaozhiguang', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'xiaozhiguang@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '19255387', null, null, '2012-03-28', '男', '0', 'N', null, '肖智广', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1121', '465876626090197', '2002-07-01', '2014-05-15 10:23:22', null, null, '3', null, '465876626090197@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '81514101', null, null, '2012-05-02', '女', '0', 'N', null, '张新', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1122', '903398759319908', '2009-07-10', '2014-05-15 10:23:21', null, null, '3', null, '903398759319908@whizen.com', null, '三级', '2014-05-15 10:23:21', null, null, null, '73571258', null, null, '2012-05-02', '男', '0', 'N', null, '熊良华', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1127', '333035092357440', '2006-06-28', '2014-05-15 10:23:22', null, null, '3', null, '333035092357440@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '50068632', null, null, '2012-06-04', '男', '0', 'N', null, '余旺盛', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1132', '563895346935199', '2012-06-26', '2014-05-15 10:23:21', null, null, '3', null, '563895346935199@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '69648924', null, null, '2012-07-02', '男', '0', 'N', null, '李成臣', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1145', 'yinzhilan', '2012-06-02', '2014-05-15 10:23:12', null, null, '3', null, 'yinzhilan@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '89082565', null, null, '2012-07-02', '女', '0', 'N', null, '尹芝兰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1149', 'zouguangchu', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zouguangchu@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '79067487', null, null, '2012-07-02', '男', '0', 'N', null, '邹广初', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1150', 'wengkaikeng', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'wengkaikeng@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '01380075', null, null, '2012-07-02', '男', '0', 'N', null, '翁开铿', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1151', '228557429041864', '2010-06-01', '2014-05-15 10:23:24', null, null, '3', null, '228557429041864@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '35734513', null, null, '2012-07-02', '男', '0', 'N', null, '梁翠龙', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1152', '706643793905698', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '706643793905698@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '07841320', null, null, '2012-07-02', '男', '0', 'N', null, '唐俊', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1156', 'huangsen', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huangsen@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '25552207', null, null, '2012-07-02', '男', '0', 'N', null, '黄森', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1158', '272046674368358', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '272046674368358@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '83007658', null, null, '2012-07-02', '男', '0', 'N', null, '李正宗', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1159', 'jiangwenping', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'jiangwenping@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '83779774', null, null, '2012-07-02', '女', '0', 'N', null, '蒋文萍', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1163', '590050039223152', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '590050039223152@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '71002115', null, null, '2012-07-02', '男', '0', 'N', null, '郑贵庭', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1170', 'zhengshasha', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhengshasha@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '29122112', null, null, '2012-07-02', '女', '0', 'N', null, '郑沙沙', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1172', 'longjianfeng', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'longjianfeng@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '52451517', null, null, '2012-07-02', '男', '0', 'N', null, '龙建锋', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1174', '972607852431780', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '972607852431780@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '64730189', null, null, '2012-07-02', '女', '0', 'N', null, '刘菊容', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1175', '035614183947184', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '035614183947184@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '22799139', null, null, '2012-07-02', '女', '0', 'N', null, '刘文芳', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1176', '861588479053442', '2012-06-01', '2014-05-15 10:23:20', null, null, '3', null, '861588479053442@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '80461996', null, null, '2012-07-02', '女', '0', 'N', null, '汪丽芬', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1178', 'xianian', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xianian@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '60524974', null, null, '2012-07-02', '女', '0', 'N', null, '夏念', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1179', '286066522504066', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '286066522504066@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '91439038', null, null, '2012-07-02', '男', '0', 'N', null, '周蔚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1183', '466260175588736', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '466260175588736@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '63787519', null, null, '2012-07-02', '女', '0', 'N', null, '王丹', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1184', '024768317547003', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '024768317547003@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '72397531', null, null, '2012-07-02', '女', '0', 'N', null, '袁小利', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1186', '665001596072570', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '665001596072570@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '46190100', null, null, '2012-07-02', '男', '0', 'N', null, '何云文', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1191', '549311601674713', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '549311601674713@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '79779812', null, null, '2012-07-02', '女', '0', 'N', null, '刘慧', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1192', 'xuxiaoshuang', '2012-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xuxiaoshuang@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '62633561', null, null, '2012-07-02', '女', '0', 'N', null, '许小双', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1193', '526490333174704', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '526490333174704@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '83104028', null, null, '2012-07-02', '女', '0', 'N', null, '甘佳美', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1195', '429884507556290', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '429884507556290@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '28389815', null, null, '2012-07-02', '男', '0', 'N', null, '王石峰', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1206', 'chenjiawen', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'chenjiawen@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '87154848', null, null, '2012-07-10', '女', '0', 'N', null, '陈嘉雯', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1207', '362243823823655', '2009-06-01', '2014-05-15 10:23:20', null, null, '3', null, '362243823823655@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '97275252', null, null, '2012-07-16', '女', '0', 'N', null, '谢洁', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1208', 'pijingjing', '2009-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'pijingjing@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '48576764', null, null, '2010-03-29', '男', '0', 'N', null, '皮晶晶', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1211', '078863833959753', '2009-06-01', '2014-05-15 10:23:26', null, null, '3', null, '078863833959753@whizen.com', null, '四级', '2014-05-15 10:23:26', null, null, null, '21936656', null, null, '2012-08-20', '男', '0', 'N', null, '谢贝', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1212', 'chenjialiang', '2007-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'chenjialiang@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '23876298', null, null, '2012-08-27', '男', '0', 'N', null, '陈嘉亮', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1214', '718949706965960', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '718949706965960@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '34438170', null, null, '2012-09-03', '男', '0', 'N', null, '曾志慧', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1215', 'kongheng', '2009-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'kongheng@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '32821346', null, null, '2012-09-04', '女', '0', 'N', null, '孔恒', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1219', '423499445534009', '2004-06-01', '2014-05-15 10:23:26', null, null, '3', null, '423499445534009@whizen.com', null, '三级', '2014-05-15 10:23:26', null, null, null, '96626799', null, null, '2012-09-25', '男', '0', 'N', null, '向国华', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1220', 'lvjieqiang', '2010-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'lvjieqiang@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '26436819', null, null, '2012-09-30', '男', '0', 'N', null, '吕杰强', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1223', 'zhangguofu', '2000-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'zhangguofu@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '25793515', null, null, '2012-10-31', '男', '0', 'N', null, '张国富', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1225', 'huangteng', '2008-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangteng@whizen.com', null, '四级', '2014-05-15 10:23:15', null, null, null, '28278582', null, null, '2012-11-12', '男', '0', 'N', null, '黄腾', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1233', '299557110714390', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '299557110714390@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '64036684', null, null, '2013-07-01', '女', '0', 'N', null, '卢巧云', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1234', 'fangjingtao', '2008-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'fangjingtao@whizen.com', null, '三级', '2014-05-15 10:23:12', null, null, null, '84335095', null, null, '2013-04-01', '男', '0', 'N', null, '方敬涛', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1236', 'tangxingxing', '2012-06-04', '2014-05-15 10:23:12', null, null, '3', null, 'tangxingxing@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '03986121', null, null, '2013-04-22', '男', '0', 'N', null, '唐星星', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1237', '252542090846230', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '252542090846230@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '48933487', null, null, '2013-05-08', '男', '0', 'N', null, '明玄宇', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1239', 'huyiwen', '2006-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huyiwen@whizen.com', null, '二级', '2014-05-15 10:23:19', null, null, null, '57533578', null, null, '2013-07-01', '男', '0', 'N', null, '胡义文', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1240', 'huoniuyi', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'huoniuyi@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '94952337', null, null, '2013-09-02', '男', '0', 'N', null, '霍牛义', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1243', '075837812956962', '2013-06-01', '2014-05-15 10:23:25', null, null, '3', null, '075837812956962@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '29161729', null, null, '2013-09-02', '男', '0', 'N', null, '彭莉平', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1245', '806703464832914', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '806703464832914@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '51162674', null, null, '2013-09-02', '男', '0', 'N', null, '李俊', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1246', '461172630767311', '2013-06-01', '2014-05-15 10:23:21', null, null, '3', null, '461172630767311@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '87309845', null, null, '2013-09-02', '男', '0', 'N', null, '原海南', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1247', '611031529642153', '2013-06-01', '2014-05-15 10:23:25', null, null, '3', null, '611031529642153@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '12185473', null, null, '2013-09-02', '男', '0', 'N', null, '杨万鹏', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1250', '098689418182626', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '098689418182626@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '05701280', null, null, '2013-09-02', '男', '0', 'N', null, '黄熹舟', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1252', '093493622495337', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '093493622495337@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '15354665', null, null, '2013-09-02', '男', '0', 'N', null, '彭建威', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1257', '092874999728345', '2013-06-01', '2014-05-15 10:23:26', null, null, '3', null, '092874999728345@whizen.com', null, '一级', '2014-05-15 10:23:26', null, null, null, '94694846', null, null, '2013-09-02', '女', '0', 'N', null, '胡璐瑶', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1260', 'luoling', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'luoling@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '17026594', null, null, '2013-09-02', '女', '0', 'N', null, '罗玲', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1262', 'liuguanfu', '2013-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'liuguanfu@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '08587383', null, null, '2013-09-04', '男', '0', 'N', null, '柳官富', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1263', '947518535580761', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '947518535580761@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '56957615', null, null, '2013-09-02', '男', '0', 'N', null, '吴柯蓉', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1264', 'qinguosheng', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'qinguosheng@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '40226211', null, null, '2013-09-02', '男', '0', 'N', null, '覃国生', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1265', 'hechenxiang', '2013-07-01', '2014-05-15 10:23:20', null, null, '3', null, 'hechenxiang@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '81781608', null, null, '2013-09-02', '男', '0', 'N', null, '何晨翔', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1268', '816179302511532', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '816179302511532@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '62205392', null, null, '2013-09-02', '男', '0', 'N', null, '李龙德', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1269', 'wenzhaoming', '2013-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'wenzhaoming@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '89020025', null, null, '2013-09-02', '男', '0', 'N', null, '文兆明', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1270', '840588725416150', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '840588725416150@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '93889232', null, null, '2013-09-02', '男', '0', 'N', null, '覃信鸿', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1272', 'mohuiling', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'mohuiling@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '85056528', null, null, '2013-09-02', '女', '0', 'N', null, '莫慧玲', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1274', '291972936625814', '2013-07-01', '2014-05-15 10:23:24', null, null, '3', null, '291972936625814@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '63824201', null, null, '2013-09-02', '男', '0', 'N', null, '莫庭伟', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1275', 'xiemeifang', '2013-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xiemeifang@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '53255715', null, null, '2013-09-02', '女', '0', 'N', null, '谢美芳', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1276', 'chenxiang', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'chenxiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '35314215', null, null, '2013-09-02', '女', '0', 'N', null, '陈香', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1278', 'gaobeichen', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'gaobeichen@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '30743920', null, null, '2013-09-02', '女', '0', 'N', null, '高北晨', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1280', '364780238971736', '2013-06-01', '2014-05-15 10:23:22', null, null, '3', null, '364780238971736@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '75773297', null, null, '2013-09-02', '男', '0', 'N', null, '方钱', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1282', 'yuhanxiang', '2013-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'yuhanxiang@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '90664848', null, null, '2013-09-02', '男', '0', 'N', null, '余翰祥', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1283', '064933094339664', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '064933094339664@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '10474817', null, null, '2013-09-02', '男', '0', 'N', null, '贺关勇', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1285', '760084898314002', '2013-06-01', '2014-05-15 10:23:22', null, null, '3', null, '760084898314002@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '17181573', null, null, '2013-09-02', '女', '0', 'N', null, '郑莹', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1287', 'jiangjunqiang', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'jiangjunqiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '83916026', null, null, '2013-09-02', '男', '0', 'N', null, '蒋俊强', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1292', 'chenruibao', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'chenruibao@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '58937486', null, null, '2013-09-02', '男', '0', 'N', null, '陈瑞保', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1294', 'zhouxian', '2011-06-30', '2014-05-15 10:23:16', null, null, '3', null, 'zhouxian@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '78227381', null, null, '2013-09-01', '女', '0', 'N', null, '周娴', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1295', '560681622335090', '2003-06-01', '2014-05-15 10:23:21', null, null, '3', null, '560681622335090@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '38020130', null, null, '2013-09-16', '男', '0', 'N', null, '陈润丰', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1296', '802849539207271', '2010-06-01', '2014-05-15 10:23:26', null, null, '3', null, '802849539207271@whizen.com', null, '四级', '2014-05-15 10:23:26', null, null, null, '86320684', null, null, '2013-10-15', '男', '0', 'N', null, '骆树明', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1297', '804279212020160', '2009-06-01', '2014-05-15 10:23:22', null, null, '3', null, '804279212020160@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '06895890', null, null, '2013-11-13', '女', '0', 'N', null, '陈莲妹', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1298', '393890642714090', '2012-06-01', '2014-05-15 10:23:22', null, null, '3', null, '393890642714090@whizen.com', null, '--', '2014-05-15 10:23:22', null, null, null, '13400457', null, null, '2013-12-09', '男', '0', 'N', null, '段啸', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1299', 'houyannan', '2007-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'houyannan@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '69634717', null, null, '2014-02-10', '男', '0', 'N', null, '侯延楠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1300', 'supeiyu', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'supeiyu@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '86374735', null, null, '2014-02-13', '女', '0', 'Y', null, '苏佩钰', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1301', 'panshuijun', '2009-06-30', '2014-05-15 10:23:12', null, null, '3', null, 'panshuijun@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '24329921', null, null, '2014-02-24', '男', '0', 'N', null, '潘水军', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1302', 'ouguijiao', '2008-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'ouguijiao@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '74271096', null, null, '2014-02-26', '女', '0', 'N', null, '欧桂娇', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1303', '679093734316773', '2014-06-01', '2014-05-15 10:23:26', null, null, '3', null, '679093734316773@whizen.com', null, '二级', '2014-05-15 10:23:26', null, null, null, '31935010', null, null, '2014-02-26', '女', '0', 'N', null, '冯英媛', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1304', 'liguiyang', '2014-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liguiyang@whizen.com', null, '二级', '2014-05-15 10:23:18', null, null, null, '38868346', null, null, '2014-04-29', '女', '0', 'N', null, '黎桂杨', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1305', 'jiangzhonghui', '2005-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'jiangzhonghui@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '64334522', null, null, '2014-05-04', '男', '0', 'N', null, '江中辉', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('205', 'huangmanjing', '2007-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'huangmanjing@whizen.com', null, '二级', '2014-05-15 10:23:18', null, null, null, '44828898', null, null, '2007-03-31', '女', '0', 'N', null, '黄蔓菁', '0', '947868');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0729', '575853');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1252', '791596');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0007', '806025');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0342', '829929');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0339', '880887');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1061', '888332');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('205', '918824');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0562', '953023');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1208', '953023');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0137', '998481');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0895', '998481');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1039', '998481');

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
INSERT INTO `infox_sysmgr_emp_role` VALUES ('348694', '003');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('367248', '0100');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '0317');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('348694', '0449');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('770063', '1000');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '1039');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('687798', '1300');

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
INSERT INTO `infox_sysmgr_menu` VALUES ('361454', null, '2014-02-25 19:14:27', null, 'project/project_main/project_main.do', 'icon-standard-application-side-expand', '2014-02-25 19:14:27', null, '项目管理', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('502906', null, '2014-03-07 10:40:32', null, 'project/project_report/project_tasktime_main.do', 'icon-standard-chart-pie', '2014-03-07 10:40:32', null, '稼动率管理', '0', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('510303', null, '2014-05-15 11:03:39', null, 'sysmgr/role/getPermission.do', '', '2014-05-15 11:03:39', null, '角色资源关联', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('527852', null, '2014-03-07 15:21:26', null, 'sysmgr/empjob/empjob_main.do', 'icon-standard-user-red', '2014-03-07 15:21:26', null, '公司岗位', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('547345', null, '2014-02-22 00:50:30', null, 'sysmgr/employee/emp_main.do', 'icon-hamburg-my-account', '2014-02-22 00:50:30', null, '员工管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('643077', null, '2014-05-15 11:04:27', null, 'sysmgr/employee/getPermission.do', 'icon-standard-application-view-tile', '2014-05-15 11:04:27', null, '用户角色关联', '1', null, null, 'O', '068671', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('675303', null, '2014-02-18 14:50:50', null, 'sysmgr/filemanager/file_main.do', 'icon-standard-folder-database', '2014-02-18 14:50:50', null, '文件管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('716776', null, '2014-03-24 16:03:50', null, 'project/project_main/addMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('726776', null, '2014-03-24 16:03:50', null, 'project/project_main/deleteMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('736776', null, '2014-03-24 16:03:50', null, 'project/overtime/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('746776', null, '2014-03-24 16:03:50', null, 'project/overtime/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('756776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('766776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/revert.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '移除开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('776776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/set_workdate.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发人员起止日期操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('781776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_detail.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询详细', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('782776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_member.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发团队人员页面', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('783776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_Devdetail.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '开发人员详细列表', '1', null, null, 'O', '361454', 'Y');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('785756', null, '2014-03-24 16:03:50', null, 'sysmgr/menu/treegrid.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询', '1', null, null, 'O', '863930', 'Y');
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
INSERT INTO `infox_sysmgr_org_dept` VALUES ('040733', null, '2014-05-15 16:39:29', null, '', null, null, '日本支社', null, '2014-05-15 16:39:29', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '日本支社', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('126300', null, '2014-05-14 15:52:24', null, '', null, null, '第二开发本部开发二部', null, '2014-05-14 15:52:24', null, '0', '0', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', 'JD2本部', 'JD2-2', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('131621', null, '2014-05-14 15:54:56', null, '', null, null, '项目管理部', null, '2014-05-14 15:54:56', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '华智', '项目管理部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('188927', null, '2014-05-14 15:51:29', null, '', null, null, '第一开发本部', null, '2014-05-14 15:51:29', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', 'JD1本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('398250', null, '2014-05-14 15:50:21', null, '', null, null, '第一开发本部开发二部', null, '2014-05-14 15:50:21', null, '0', '0', '0', '0', '0', '0', '0', '31', '0', '0', '0', '0', 'JD1', 'JD1-2', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('400771', null, '2014-04-21 13:11:31', null, '', null, null, '财务部', null, '2014-04-21 13:11:31', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理部', '财务部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('429710', null, '2014-05-15 09:31:53', null, '', null, null, '品质保证部', null, '2014-05-15 09:31:53', null, '0', '0', '0', '0', '0', '0', '0', '12', '0', '0', '0', '0', '华智', '品质保证部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('461023', null, '2014-05-14 15:50:50', null, '', null, null, '第一开发本部开发三部', null, '2014-05-14 15:50:50', null, '0', '0', '0', '0', '0', '0', '0', '18', '0', '0', '0', '0', 'JD1', 'JD1-3', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('474835', null, '2014-04-21 13:11:48', null, '', null, null, '采购部', null, '2014-04-21 13:11:48', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '综合管理部', '采购部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('526169', null, '2014-05-14 15:53:35', null, '', null, null, '北京分公司', null, '2014-05-14 15:53:35', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '华智', '北京分公司', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('548996', null, '2014-05-14 15:52:01', null, '', null, null, '第二开发本部开发一部', null, '2014-05-14 15:52:01', null, '0', '0', '0', '0', '0', '0', '0', '41', '0', '0', '0', '0', 'JD2本部', 'JD2-1', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('634670', null, '2014-05-14 15:53:13', null, '', null, null, '苏州开发部', null, '2014-05-14 15:53:13', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '苏州', '苏州开发部', null, 'D', '886155');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('647431', null, '2014-05-14 15:59:46', null, '', null, null, '系统集成部', null, '2014-05-14 15:59:46', null, '0', '0', '0', '0', '0', '0', '0', '17', '0', '0', '0', '0', '华智', '系统集成部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('682781', null, '2014-05-14 15:58:38', null, '', null, null, '综合管理本部', null, '2014-05-14 15:58:38', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', '综合管理本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('702229', null, '2014-05-14 15:52:53', null, '', null, null, '第二开发本部开发三部', null, '2014-05-14 15:52:53', null, '0', '0', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', 'JD2本部', 'JD2-3', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('723327', null, '2014-05-14 15:49:45', null, '', null, null, '第一开发本部开发一部', null, '2014-05-14 15:49:45', null, '0', '0', '0', '0', '0', '0', '0', '54', '0', '0', '0', '0', 'JD1', 'JD1-1', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('853418', null, '2014-05-14 15:59:28', null, '', null, null, '人力资源部', null, '2014-05-14 15:59:28', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理本部', '人力资源部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('886155', null, '2014-05-14 15:53:46', null, '', null, null, '苏州分公司', null, '2014-05-14 15:53:46', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '华智', '苏州分公司', null, 'O', '973758');
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
INSERT INTO `infox_sysmgr_role` VALUES ('348694', '2014-05-15 10:35:32', null, '采购部专员', 'ext_group', null, '采购部专员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('367248', '2014-05-15 10:38:04', null, '财务部主管', 'ext_group', null, '财务部主管', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('687798', '2014-05-15 10:39:14', null, '项目管理专员', 'ext_group', null, '项目管理专员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('770063', '2014-05-15 10:34:49', null, '人事管理', 'ext_group', null, '人事管理', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('921908', '2014-05-15 10:56:49', null, '品质部超级管理员', 'ext_group', null, '品质部超级管理员', null, null);

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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '136992');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '200025');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '510303');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '643077');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '675303');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '784776');
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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785736');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785754');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785754');
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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '796776');
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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '837844');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '863930');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '878344');

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
