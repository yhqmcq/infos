/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-03-03 16:15:40
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `infox_sysmgr_emp` VALUES ('0251', null, '2014-03-03 09:04:46', null, null, 'yhqmcq@126.com', '2014-03-03 09:04:46', null, '开发二部', null, 'male', 'Y', '', '网吧', '498779', null, '项目经理', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1038', null, '2014-03-03 09:55:20', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:20', null, '开发三部', null, 'male', 'Y', '', '张三', '979739', null, '程序员', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1039', null, '2014-03-03 09:55:31', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:31', null, '开发一部', null, 'male', 'Y', '', '杨浩泉', '705624', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('111', null, '2014-03-03 09:55:51', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:51', null, '开发三部', null, 'male', 'Y', '', '老李', '979739', null, '项目经理,系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('1254', null, '2014-03-03 09:55:55', null, null, 'yhqmcq@126.com', '2014-03-03 09:55:55', null, '开发一部', null, 'male', 'Y', '', '李四', '705624', null, '系统工程师', '0');
INSERT INTO `infox_sysmgr_emp` VALUES ('9999', 'admin', null, null, null, null, null, null, null, 'admin', null, 'Y', null, '超级管理员', null, '1', null, '9999');
