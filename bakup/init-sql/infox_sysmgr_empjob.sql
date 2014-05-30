/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-05-30 10:58:18
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `infox_sysmgr_empjob` VALUES ('305382', '2014-05-28 16:07:00', '', '', '分公司总经理', '分公司总经理', null);
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
INSERT INTO `infox_sysmgr_empjob` VALUES ('582874', '2014-05-29 10:57:34', '', '', '营业', '营业', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('588192', '2014-05-15 08:22:14', '', '', '系统集成部部门助理', 'SI部门助理', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('592397', '2014-05-15 08:13:48', '', '', '会计', '会计', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('704142', '2014-05-28 16:07:48', '', '', '销售', '销售', null);
INSERT INTO `infox_sysmgr_empjob` VALUES ('708172', '2014-05-28 16:07:36', '', '', '市场助理', '市场助理', null);
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
