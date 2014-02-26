/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2014-02-26 13:22:47
*/

SET FOREIGN_KEY_CHECKS=0;

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
