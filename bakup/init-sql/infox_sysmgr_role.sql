/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-05-30 10:57:49
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `infox_sysmgr_role` VALUES ('037908', '2014-05-26 13:22:29', null, '', 'ext_group', null, '部长', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('348694', '2014-05-15 10:35:32', null, '采购部专员', 'ext_group', null, '采购部专员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('367248', '2014-05-15 10:38:04', null, '财务部主管', 'ext_group', null, '财务部主管', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('390547', '2014-05-23 08:41:25', null, '', 'ext_group', null, '个人查询', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('687798', '2014-05-15 10:39:14', null, '项目管理专员', 'ext_group', null, '项目管理专员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('770063', '2014-05-15 10:34:49', null, '人事管理', 'ext_group', null, '人事管理', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('921908', '2014-05-15 10:56:49', null, '品质部超级管理员', 'ext_group', null, '品质部超级管理员', null, null);
INSERT INTO `infox_sysmgr_role` VALUES ('933556', '2014-05-23 08:39:37', null, '', 'ext_group', null, '总裁专用', null, null);
