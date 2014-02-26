/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-02-26 13:26:17
*/

SET FOREIGN_KEY_CHECKS=0;

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
