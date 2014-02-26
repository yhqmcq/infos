/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-02-26 13:22:14
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
  `empjonsName` varchar(255) DEFAULT NULL,
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
INSERT INTO `infox_sysmgr_emp` VALUES ('000000', 'admin', '2014-02-26 13:18:39', null, null, 'infos@service.com', '2014-02-26 13:18:39', null, '', 'admin', 'male', 'Y', '020888888', '超级管理员', null, null, null, '', '0');
