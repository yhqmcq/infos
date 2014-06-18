/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50518
Source Host           : localhost:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-06-18 09:49:03
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
  `compute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rwpxh5paok3rmx9s6aie9ps3t` (`ORG_PID`),
  CONSTRAINT `FK_rwpxh5paok3rmx9s6aie9ps3t` FOREIGN KEY (`ORG_PID`) REFERENCES `infox_sysmgr_org_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infox_sysmgr_org_dept
-- ----------------------------
INSERT INTO `infox_sysmgr_org_dept` VALUES ('009014', null, '2014-04-17 10:26:58', null, '', null, null, '其它', null, '2014-04-17 10:26:58', null, '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '华智', '其它', null, 'O', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('126300', null, '2014-06-18 09:30:51', null, '', null, null, '第二开发本部开发二部', null, '2014-06-18 09:30:51', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '第二开发本部', 'JD2-2', null, 'D', '917489', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('131621', null, '2014-05-14 15:54:56', null, '', null, null, '项目管理部', null, '2014-05-14 15:54:56', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '华智', '项目管理部', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('188927', null, '2014-06-18 09:39:26', null, '', null, null, '第一开发本部', null, '2014-06-18 09:39:26', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD1本部', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('203102', null, '2014-05-29 10:57:04', null, '', null, null, '日本支社', null, '2014-05-29 10:57:04', null, '0', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '广东华智科技有限公司', '日本支社', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('300199', null, '2014-05-26 10:23:44', null, '', null, null, '总裁办', null, '2014-05-26 10:23:44', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '广东华智科技有限公司', '总裁办', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('398250', null, '2014-06-18 09:30:35', null, '', null, null, '第一开发本部开发二部', null, '2014-06-18 09:30:35', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '第一开发本部', 'JD1-2', null, 'D', '188927', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('400771', null, '2014-04-21 13:11:31', null, '', null, null, '财务部', null, '2014-04-21 13:11:31', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理部', '财务部', null, 'D', '682781', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('429710', null, '2014-05-15 09:31:53', null, '', null, null, '品质保证部', null, '2014-05-15 09:31:53', null, '0', '0', '0', '0', '0', '0', '0', '12', '13', '0', '0', '0', '华智', '品质保证部', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('461023', null, '2014-06-18 09:30:29', null, '', null, null, '第一开发本部开发三部', null, '2014-06-18 09:30:29', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '第一开发本部', 'JD1-3', null, 'D', '188927', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('473615', null, '2014-05-28 16:09:04', null, '', null, null, '北京管理部', null, '2014-05-28 16:09:04', null, '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0', '北京支社', '北京管理部', null, 'D', '526169', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('474835', null, '2014-04-21 13:11:48', null, '', null, null, '采购部', null, '2014-04-21 13:11:48', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '综合管理部', '采购部', null, 'D', '682781', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('526169', null, '2014-06-18 09:39:23', null, '', null, null, '北京支社', null, '2014-06-18 09:39:23', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '北京支社', null, 'O', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('548996', null, '2014-06-18 09:30:55', null, '', null, null, '第二开发本部开发一部', null, '2014-06-18 09:30:55', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '第二开发本部', 'JD2-1', null, 'D', '917489', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('634670', null, '2014-06-18 09:30:01', null, '', null, null, '苏州开发部', null, '2014-06-18 09:30:01', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '苏州支社', '苏州开发部', null, 'D', '886155', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('647431', null, '2014-05-14 15:59:46', null, '', null, null, '系统集成部', null, '2014-05-14 15:59:46', null, '0', '0', '0', '0', '0', '0', '0', '17', '0', '0', '0', '0', '华智', '系统集成部', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('682781', null, '2014-05-14 15:58:38', null, '', null, null, '综合管理本部', null, '2014-05-14 15:58:38', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', '综合管理本部', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('702229', null, '2014-06-18 09:30:46', null, '', null, null, '第二开发本部开发三部', null, '2014-06-18 09:30:46', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '第二开发本部', 'JD2-3', null, 'D', '917489', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('723327', null, '2014-06-18 09:30:42', null, '', null, null, '第一开发本部开发一部', null, '2014-06-18 09:30:42', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '第一开发本部', 'JD1-1', null, 'D', '188927', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('853418', null, '2014-05-14 15:59:28', null, '', null, null, '人力资源部', null, '2014-05-14 15:59:28', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理本部', '人力资源部', null, 'D', '682781', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('886155', null, '2014-06-18 09:39:19', null, '', null, null, '苏州支社', null, '2014-06-18 09:39:19', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', '苏州支社', null, 'O', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('917489', null, '2014-06-18 09:39:14', null, '', null, null, '第二开发本部', null, '2014-06-18 09:39:14', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '广东华智科技有限公司', 'JD2本部', null, 'D', '973758', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('943553', null, '2014-06-18 09:29:39', null, '', null, null, '北京开发部', null, '2014-06-18 09:29:39', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '北京支社', '北京开发部', null, 'D', '526169', 'Y');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('947868', null, '2014-05-14 15:58:58', null, '', null, null, '总务部', null, '2014-05-14 15:58:58', null, '0', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '综合管理本部', '总务部', null, 'D', '682781', 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('973758', null, '2014-04-03 13:18:02', null, '', null, null, '广东华智科技有限公司', null, '2014-04-03 13:18:02', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '华智', null, 'O', null, 'N');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('978275', null, '2014-05-28 16:09:23', null, '', null, null, '北京市场部', null, '2014-05-28 16:09:23', null, '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '北京支社', '北京市场部', null, 'D', '526169', 'N');
