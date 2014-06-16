/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-06-16 09:04:27
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
INSERT INTO `infox_project_emp_working` VALUES ('000956', '2014-06-09 15:00:12', '2014-01-17', 'PG', '2014-01-13', '4', '0748', null, '802759');
INSERT INTO `infox_project_emp_working` VALUES ('005023', '2014-06-06 14:01:52', '2014-03-14', 'PG', '2014-02-07', '1', '1296', null, '812153');
INSERT INTO `infox_project_emp_working` VALUES ('005994', '2014-06-09 11:41:02', '2014-02-28', 'PG', '2013-12-11', '4', '1193', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('017916', '2014-06-06 14:00:59', '2014-01-15', 'SE', '2014-01-10', '4', '0850', null, '893834');
INSERT INTO `infox_project_emp_working` VALUES ('018021', '2014-06-03 11:02:32', '2014-02-13', 'PM', '2013-09-22', '4', '0803', null, '259235');
INSERT INTO `infox_project_emp_working` VALUES ('019250', '2014-06-03 10:54:07', '2014-02-26', 'PM', '2013-12-03', '4', '0993', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('029178', '2014-06-03 12:00:38', '2014-12-31', 'BSE', '2011-02-11', '1', '0818', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('041551', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2014-02-11', '1', '1112', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('044592', '2014-06-10 11:18:59', '2014-04-30', 'PG', '2013-12-02', '4', '0966', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('054606', '2014-06-13 15:29:52', '2014-03-13', 'PG', '2013-12-10', '4', '1262', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('056032', '2014-06-09 13:03:06', '2014-01-26', 'PG', '2014-01-01', '4', '1257', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('064560', '2014-05-30 13:49:11', '2014-01-31', 'SE', '2013-03-26', '4', '0990', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('065567', '2014-06-10 13:23:02', '2014-03-28', 'SE', '2013-12-02', '4', '0284', null, '756231');
INSERT INTO `infox_project_emp_working` VALUES ('068220', '2014-06-16 08:53:50', '2014-04-30', 'PM', '2014-04-22', '1', '0190', null, '816385');
INSERT INTO `infox_project_emp_working` VALUES ('069092', '2014-06-13 15:29:52', '2014-01-24', 'PG', '2014-01-20', '4', '0757', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('074813', '2014-06-09 16:57:51', '2013-12-30', 'PG', '2013-12-30', '4', '1109', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('083706', '2014-06-03 14:22:13', '2014-02-25', 'PM', '2014-01-13', '1', '9043', null, '182090');
INSERT INTO `infox_project_emp_working` VALUES ('085830', '2014-06-06 16:39:49', '2014-03-21', 'PG', '2014-02-17', '1', '1068', null, '866112');
INSERT INTO `infox_project_emp_working` VALUES ('086846', '2014-06-03 12:00:38', '2014-12-31', 'BSE', '2013-09-01', '1', '0921', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('089802', '2014-06-06 15:16:53', '2014-03-14', 'PM', '2013-11-29', '1', '0868', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('089873', '2014-06-06 16:33:30', '2014-02-14', 'PG', '2014-01-01', '4', '0216', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('090610', '2014-06-03 12:00:38', '2014-12-31', 'BSE', '2013-09-01', '1', '1294', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('092244', '2014-06-06 15:16:53', '2014-02-21', 'PG', '2014-01-15', '1', '1191', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('093255', '2014-06-03 10:58:46', '2014-01-26', 'SE', '2013-12-10', '4', '0150', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('094544', '2014-06-10 10:58:01', '2014-02-21', 'PG', '2014-01-01', '4', '0666', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('095542', '2014-06-16 08:56:10', '2014-04-22', 'SE', '2014-03-31', '1', '0053', null, '606390');
INSERT INTO `infox_project_emp_working` VALUES ('097254', '2014-06-06 15:59:23', '2014-02-10', 'SE', '2014-02-10', '4', '0866', null, '812153');
INSERT INTO `infox_project_emp_working` VALUES ('097266', '2014-06-10 10:58:01', '2014-03-07', 'PM', '2014-01-01', '4', '0817', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('102879', '2014-06-03 10:57:05', '2014-01-13', 'PG', '2013-12-03', '4', '1179', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('106749', '2014-06-09 15:28:30', '2014-03-31', 'PG', '2014-02-24', '4', '9063', null, '172734');
INSERT INTO `infox_project_emp_working` VALUES ('113253', '2014-06-09 13:03:06', '2014-02-28', 'PG', '2014-01-01', '4', '0694', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('123038', '2014-06-06 15:39:14', '2014-04-15', 'SE', '2014-03-03', '1', '1074', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('123744', '2014-05-30 13:49:11', '2014-01-31', 'PM', '2013-03-12', '4', '0559', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('132572', '2014-06-06 14:01:52', '2014-03-28', 'PG', '2014-01-26', '1', '0590', null, '812153');
INSERT INTO `infox_project_emp_working` VALUES ('135096', '2014-05-30 13:47:55', '2014-01-12', '高级PG', '2013-08-07', '4', '1150', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('148120', '2014-06-10 13:20:14', '2014-01-24', 'PG', '2014-01-20', '4', '0053', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('150920', '2014-06-09 16:03:43', '2013-09-22', 'PG', '2013-09-09', '4', '1212', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('157167', '2014-06-10 10:58:01', '2014-03-07', 'SE', '2014-01-01', '4', '0741', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('161550', '2014-06-09 16:03:43', '2013-09-22', 'PG', '2013-09-09', '4', '0793', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('161951', '2014-06-09 11:17:08', '2014-03-20', 'PG', '2014-02-17', '4', '0669', null, '495651');
INSERT INTO `infox_project_emp_working` VALUES ('165004', '2014-06-09 15:18:56', '2014-03-01', 'BSE', '2013-04-13', '4', '0936', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('165294', '2014-06-06 14:41:27', '2014-04-21', 'PG', '2014-03-10', '1', '1301', null, '724633');
INSERT INTO `infox_project_emp_working` VALUES ('170554', '2014-06-09 14:57:25', '2014-02-06', 'PG', '2014-01-01', '4', '1059', null, '150108');
INSERT INTO `infox_project_emp_working` VALUES ('172345', '2014-06-16 08:56:10', '2014-04-24', 'PM', '2014-04-01', '1', '0803', null, '606390');
INSERT INTO `infox_project_emp_working` VALUES ('172797', '2014-06-06 16:22:36', '2014-04-25', 'PM', '2014-02-11', '1', '0866', null, '963078');
INSERT INTO `infox_project_emp_working` VALUES ('174141', '2014-06-13 15:40:49', '2014-03-24', 'PG', '2014-02-13', '1', '0757', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('175665', '2014-06-10 10:58:01', '2014-03-07', '初级PG1', '2014-02-24', '4', '1260', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('176745', '2014-06-10 09:05:54', '2014-01-30', 'PG', '2014-01-10', '4', '1282', null, '893834');
INSERT INTO `infox_project_emp_working` VALUES ('181255', '2014-05-30 13:49:11', '2014-01-31', 'SE', '2013-03-01', '4', '1215', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('186415', '2014-06-09 15:28:30', '2014-02-21', 'PL', '2013-09-22', '4', '9062', null, '172734');
INSERT INTO `infox_project_emp_working` VALUES ('191330', '2014-06-10 11:35:53', '2014-03-31', 'BSE', '2014-01-13', '1', '0676', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('199401', '2014-06-09 13:03:06', '2014-01-24', 'PG', '2014-01-01', '4', '1015', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('200141', '2014-06-13 15:29:06', '2014-04-18', 'SE', '2014-04-17', '4', '0284', null, '889055');
INSERT INTO `infox_project_emp_working` VALUES ('200709', '2014-06-10 09:05:55', '2014-01-30', 'SE', '2014-01-10', '4', '0679', null, '893834');
INSERT INTO `infox_project_emp_working` VALUES ('202498', '2014-06-06 14:01:52', '2014-03-07', 'SE', '2014-02-10', '1', '0150', null, '812153');
INSERT INTO `infox_project_emp_working` VALUES ('203013', '2014-06-13 15:29:52', '2014-01-20', 'PG', '2014-01-20', '4', '0603', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('203708', '2014-06-03 10:57:05', '2014-02-12', 'SE', '2013-12-03', '4', '1074', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('206959', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2013-12-06', '1', '1186', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('209075', '2014-06-06 16:22:36', '2014-04-23', 'PG', '2014-02-13', '1', '1206', null, '963078');
INSERT INTO `infox_project_emp_working` VALUES ('213408', '2014-06-13 15:29:52', '2014-03-24', 'PG', '2014-01-13', '4', '0985', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('219686', '2014-06-10 11:35:53', '2014-03-14', 'PM', '2014-01-20', '1', '0032', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('222657', '2014-06-10 10:58:01', '2014-03-31', 'PG', '2014-01-01', '4', '1067', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('227555', '2014-06-06 15:39:14', '2014-04-15', 'SE', '2014-02-20', '1', '1234', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('227694', '2014-06-13 11:06:34', '2014-12-31', '', '2014-01-01', '1', '6026', null, '066763');
INSERT INTO `infox_project_emp_working` VALUES ('229491', '2014-06-13 15:28:35', '2014-03-27', 'PM', '2014-02-24', '4', '1046', null, '944178');
INSERT INTO `infox_project_emp_working` VALUES ('229690', '2014-06-03 10:57:05', '2014-02-12', 'PG', '2013-12-03', '4', '1145', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('235780', '2014-06-11 16:11:09', '2013-12-27', 'SE', '2013-12-10', '4', '0624', null, '994809');
INSERT INTO `infox_project_emp_working` VALUES ('248819', '2014-06-03 11:04:42', '2014-01-09', 'SE', '2013-09-11', '4', '0679', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('256771', '2014-06-13 15:29:52', '2013-12-27', 'PG', '2013-12-23', '4', '1028', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('259020', '2014-06-10 10:58:01', '2014-03-31', 'PL', '2014-01-01', '4', '0236', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('260836', '2014-06-16 08:50:04', '2014-04-09', 'PG', '2014-03-25', '1', '1262', null, '959815');
INSERT INTO `infox_project_emp_working` VALUES ('261334', '2014-06-09 14:57:25', '2014-01-10', 'PG', '2014-01-08', '4', '0748', null, '150108');
INSERT INTO `infox_project_emp_working` VALUES ('261594', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2013-12-06', '1', '0453', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('261897', '2014-06-03 10:57:05', '2014-02-12', 'PM', '2013-12-03', '4', '1084', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('262235', '2014-06-13 15:47:19', '2014-04-11', 'SE', '2014-03-28', '4', '1059', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('265918', '2014-06-10 10:58:01', '2014-02-27', 'SE', '2014-02-08', '4', '0658', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('267058', '2014-06-09 11:17:08', '2014-03-28', 'PM', '2014-02-07', '4', '0856', null, '495651');
INSERT INTO `infox_project_emp_working` VALUES ('272842', '2014-06-09 14:57:25', '2014-02-06', 'PG', '2014-01-01', '4', '0603', null, '150108');
INSERT INTO `infox_project_emp_working` VALUES ('279813', '2014-06-10 09:05:55', '2014-01-30', 'PM', '2014-01-10', '4', '1225', null, '893834');
INSERT INTO `infox_project_emp_working` VALUES ('293769', '2014-06-10 11:35:53', '2014-02-28', 'PG', '2014-01-20', '1', '1149', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('296946', '2014-06-13 16:07:56', '2014-04-11', 'PG', '2014-03-28', '1', '0747', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('305412', '2014-06-13 15:47:36', '2014-03-12', 'SE', '2014-02-07', '1', '1059', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('317066', '2014-06-06 14:41:27', '2014-03-31', 'PG', '2014-01-21', '1', '1073', null, '724633');
INSERT INTO `infox_project_emp_working` VALUES ('320394', '2014-06-03 10:41:54', '2014-01-17', 'SE', '2013-12-19', '4', '0032', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('332106', '2014-06-10 11:35:53', '2014-03-14', 'PG', '2014-02-24', '1', '1150', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('332915', '2014-06-03 10:41:54', '2014-01-17', 'PM', '2013-11-16', '4', '1223', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('333029', '2014-06-09 15:00:12', '2014-01-17', 'PG', '2014-01-13', '4', '1296', null, '802759');
INSERT INTO `infox_project_emp_working` VALUES ('338060', '2014-06-03 13:33:56', '2014-04-02', '', '2014-01-01', '1', '9076', null, '919321');
INSERT INTO `infox_project_emp_working` VALUES ('342016', '2014-06-09 11:39:14', '2014-01-28', 'PG', '2014-01-15', '4', '0579', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('345655', '2014-06-10 10:58:01', '2014-03-31', '初級PG1', '2014-01-01', '4', '1292', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('348268', '2014-06-03 12:00:38', '2014-09-17', 'BSE', '2013-09-16', '1', '0853', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('354012', '2014-06-13 15:47:19', '2014-03-03', 'PG', '2014-02-07', '4', '0747', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('358412', '2014-06-03 10:57:05', '2014-02-12', 'SE', '2013-12-03', '4', '1234', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('359825', '2014-06-10 11:35:01', '2014-01-24', '', '2013-07-23', '4', '1156', null, '562037');
INSERT INTO `infox_project_emp_working` VALUES ('361525', '2014-06-13 16:07:45', '2014-03-13', 'PG', '2014-03-10', '4', '0747', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('363450', '2014-06-10 09:05:55', '2014-01-30', 'PG', '2014-01-10', '4', '1250', null, '893834');
INSERT INTO `infox_project_emp_working` VALUES ('364869', '2014-06-13 15:27:29', '2014-03-28', 'PG', '2014-03-26', '4', '1015', null, '490275');
INSERT INTO `infox_project_emp_working` VALUES ('366380', '2014-06-06 15:39:14', '2014-03-24', 'PG', '2014-02-20', '1', '1145', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('371871', '2014-06-10 10:58:01', '2014-03-07', 'PG', '2014-01-01', '4', '0755', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('371888', '2014-06-13 15:29:52', '2014-01-06', 'PG', '2013-12-01', '4', '1268', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('373750', '2014-06-09 15:18:56', '2014-04-01', 'BSE', '2012-09-18', '4', '0314', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('375252', '2014-06-03 10:57:05', '2014-02-12', '初級PG1', '2013-12-10', '4', '1255', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('376547', '2014-05-30 09:29:37', '2014-01-10', 'SE', '2014-01-09', '4', '0624', null, '040856');
INSERT INTO `infox_project_emp_working` VALUES ('376758', '2014-06-13 16:07:33', '2014-03-12', null, '2014-02-17', '3', null, '305412', null);
INSERT INTO `infox_project_emp_working` VALUES ('385601', '2014-06-10 11:35:53', '2014-03-14', 'PG', '2014-01-20', '1', '0748', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('389515', '2014-06-03 10:41:54', '2014-01-19', 'SE', '2013-11-15', '4', '0053', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('390281', '2014-06-11 15:48:10', '2014-06-04', 'BSE', '2009-09-01', '4', '0809', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('402484', '2014-06-09 13:03:06', '2014-01-17', 'PG', '2014-01-01', '4', '0752', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('407976', '2014-06-13 15:29:52', '2014-03-31', 'PM', '2013-12-01', '4', '0564', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('413129', '2014-06-10 09:05:55', '2014-02-28', 'PG', '2014-02-07', '4', '1274', null, '893834');
INSERT INTO `infox_project_emp_working` VALUES ('432063', '2014-06-09 11:39:14', '2014-02-10', 'PG', '2014-01-15', '4', '1184', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('434649', '2014-06-16 08:53:50', '2014-04-30', 'SE', '2014-04-21', '1', '0284', null, '816385');
INSERT INTO `infox_project_emp_working` VALUES ('436783', '2014-06-06 15:16:53', '2014-01-24', 'SE', '2013-12-03', '1', '0215', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('442709', '2014-06-09 16:03:43', '2014-01-28', 'SE', '2013-09-22', '4', '0669', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('443336', '2014-06-03 12:00:38', '2014-09-02', 'BSE', '2013-09-01', '1', '1170', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('443612', '2014-06-06 14:01:52', '2014-02-08', 'SE', '2014-01-26', '1', '0675', null, '812153');
INSERT INTO `infox_project_emp_working` VALUES ('453788', '2014-06-03 11:04:42', '2014-01-09', '初級PG1', '2013-09-11', '4', '1250', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('458128', '2014-06-13 15:47:19', '2014-02-23', 'PM', '2014-02-07', '4', '1046', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('462094', '2014-06-09 16:09:22', '2014-03-27', 'PG', '2014-03-14', '4', '0747', null, '944178');
INSERT INTO `infox_project_emp_working` VALUES ('462378', '2014-06-06 15:16:53', '2014-03-31', 'PG', '2013-12-16', '1', '0931', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('464145', '2014-06-13 11:12:05', '2014-06-30', '', '2014-01-01', '1', '6012', null, '049830');
INSERT INTO `infox_project_emp_working` VALUES ('465144', '2014-06-13 15:27:29', '2014-03-28', 'SE', '2014-03-24', '4', '0053', null, '490275');
INSERT INTO `infox_project_emp_working` VALUES ('466971', '2014-06-09 16:03:43', '2013-12-05', 'PG', '2013-09-09', '4', '1184', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('468387', '2014-06-09 15:18:56', '2014-03-28', 'BSE', '2010-10-01', '4', '0823', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('473157', '2014-06-06 16:39:16', '2014-02-14', 'PG', '2014-01-01', '4', '1068', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('473389', '2014-06-06 15:39:14', '2014-04-14', 'PG', '2014-02-20', '1', '1082', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('484984', '2014-06-10 11:35:53', '2014-03-14', 'SE', '2014-01-20', '1', '0217', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('485741', '2014-06-06 14:47:09', '2013-12-31', 'SE', '2013-11-01', '4', '0621', null, '884747');
INSERT INTO `infox_project_emp_working` VALUES ('488317', '2014-06-10 11:35:53', '2014-01-27', 'PL', '2014-01-20', '1', '1223', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('489384', '2014-06-13 15:29:52', '2014-01-20', 'PG', '2014-01-20', '4', '0681', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('497272', '2014-06-16 08:56:10', '2014-04-18', 'PG', '2014-03-26', '1', '1296', null, '606390');
INSERT INTO `infox_project_emp_working` VALUES ('501349', '2014-06-10 11:35:53', '2014-03-14', 'SE', '2014-01-21', '1', '0452', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('503137', '2014-06-10 10:58:01', '2014-03-31', 'PG', '2014-01-01', '4', '1079', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('505939', '2014-06-06 15:16:53', '2014-03-07', 'SE', '2013-11-29', '1', '0377', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('506024', '2014-06-03 11:57:13', '2014-04-30', '', '2013-09-02', '1', '9061', null, '366845');
INSERT INTO `infox_project_emp_working` VALUES ('508758', '2014-05-30 13:47:55', '2014-01-22', 'PG', '2013-11-04', '4', '1247', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('516309', '2014-06-10 11:35:53', '2014-02-28', 'PG', '2014-01-20', '1', '1211', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('520119', '2014-06-09 16:55:32', '2014-04-12', 'SE', '2014-02-12', '4', '1219', null, '963078');
INSERT INTO `infox_project_emp_working` VALUES ('520893', '2014-06-09 11:17:08', '2014-03-28', 'PG', '2014-02-07', '4', '1212', null, '495651');
INSERT INTO `infox_project_emp_working` VALUES ('526884', '2014-05-30 10:59:38', '2014-02-20', '', '2014-01-25', '1', '9078', null, '922860');
INSERT INTO `infox_project_emp_working` VALUES ('545329', '2014-05-30 13:49:11', '2014-01-31', 'PG', '2013-03-26', '4', '0714', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('551994', '2014-06-13 15:40:49', '2014-03-28', 'PG', '2014-02-07', '1', '0603', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('553057', '2014-06-06 15:39:14', '2014-04-13', '初級PG2', '2014-02-20', '1', '1287', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('553437', '2014-06-10 13:23:02', '2014-03-06', 'SE', '2013-12-02', '4', '0569', null, '756231');
INSERT INTO `infox_project_emp_working` VALUES ('555226', '2014-06-06 15:16:53', '2014-04-04', 'PG', '2014-01-13', '1', '0498', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('559877', '2014-06-03 10:57:05', '2014-02-12', '初級PG1', '2013-12-10', '4', '1287', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('563485', '2014-06-10 11:35:53', '2014-03-14', 'PG', '2014-02-24', '1', '1156', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('564597', '2014-06-04 11:07:29', '2014-03-07', 'SE', '2014-01-01', '4', '0601', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('565916', '2014-06-12 10:18:51', '2014-03-31', 'BSE', '2014-03-06', '4', '0027', null, '994809');
INSERT INTO `infox_project_emp_working` VALUES ('568216', '2014-06-13 15:28:35', '2014-03-09', 'PG', '2014-03-04', '4', '0747', null, '944178');
INSERT INTO `infox_project_emp_working` VALUES ('572686', '2014-05-30 10:30:37', '2014-01-24', '', '2013-07-23', '1', '1178', null, '562037');
INSERT INTO `infox_project_emp_working` VALUES ('573090', '2014-06-13 15:40:49', '2014-03-24', 'PG', '2014-02-20', '1', '1015', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('574512', '2014-06-03 10:43:32', '2014-01-19', 'PM', '2012-09-27', '4', '1219', null, '232261');
INSERT INTO `infox_project_emp_working` VALUES ('574550', '2014-06-10 13:23:02', '2014-03-28', 'PM', '2013-12-02', '4', '0190', null, '756231');
INSERT INTO `infox_project_emp_working` VALUES ('578526', '2014-06-03 10:57:05', '2014-02-12', 'PG', '2013-12-03', '4', '1082', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('583776', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2014-01-15', '1', '1151', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('585304', '2014-06-09 11:48:59', '2014-01-28', '', '2013-11-03', '4', '0583', null, '922860');
INSERT INTO `infox_project_emp_working` VALUES ('592410', '2014-06-09 15:18:56', '2014-03-28', 'BSE', '2013-10-06', '4', '0070', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('593519', '2014-06-03 11:04:42', '2014-02-28', 'SE', '2013-11-21', '4', '6014', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('598150', '2014-06-09 13:03:06', '2014-02-03', 'PG', '2014-01-01', '4', '1240', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('598286', '2014-06-09 16:03:43', '2013-10-23', 'SE', '2013-09-09', '4', '0583', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('603382', '2014-06-10 11:35:53', '2014-03-05', 'SE', '2014-02-10', '1', '0583', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('607292', '2014-06-03 10:58:46', '2014-01-26', 'PG', '2013-12-10', '4', '1237', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('608003', '2014-05-30 13:47:55', '2014-01-12', '高级PG', '2013-08-07', '4', '0985', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('608220', '2014-06-03 10:58:46', '2014-02-21', 'PM', '2013-12-10', '4', '0520', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('619650', '2014-06-06 16:39:49', '2014-05-06', 'PM', '2014-02-17', '1', '0216', null, '866112');
INSERT INTO `infox_project_emp_working` VALUES ('621482', '2014-06-13 15:47:46', '2014-04-11', 'PM', '2014-03-28', '1', '1046', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('622880', '2014-06-03 12:00:38', '2014-06-30', 'BSE', '2013-06-22', '1', '0322', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('633696', '2014-06-09 14:57:25', '2014-02-06', 'PG', '2014-01-01', '4', '0747', null, '150108');
INSERT INTO `infox_project_emp_working` VALUES ('635309', '2014-06-09 11:31:45', '2014-04-12', '', '2013-11-24', '4', '0793', null, '828467');
INSERT INTO `infox_project_emp_working` VALUES ('636633', '2014-06-10 10:58:01', '2014-03-07', 'PL', '2014-01-01', '4', '0348', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('646388', '2014-06-03 11:04:42', '2014-01-30', '初級PG1', '2013-09-11', '4', '1274', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('646569', '2014-06-09 16:03:43', '2013-12-27', 'SE', '2013-09-12', '4', '0579', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('651211', '2014-06-03 10:41:54', '2014-01-17', 'PG', '2013-12-12', '4', '1211', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('652241', '2014-06-11 16:11:56', '2014-02-28', 'PG', '2013-12-10', '4', '1214', null, '994809');
INSERT INTO `infox_project_emp_working` VALUES ('657075', '2014-06-13 15:29:52', '2014-01-17', 'PG', '2013-12-01', '4', '1283', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('664172', '2014-06-04 11:11:49', '2014-02-12', '初級PG1', '2014-01-01', '4', '1260', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('664270', '2014-06-11 16:11:56', '2014-02-28', 'PM', '2013-12-16', '4', '0027', null, '994809');
INSERT INTO `infox_project_emp_working` VALUES ('669164', '2014-05-30 10:59:38', '2014-05-31', '', '2013-11-03', '1', '0994', null, '922860');
INSERT INTO `infox_project_emp_working` VALUES ('673256', '2014-06-09 15:25:15', '2014-03-03', null, '2014-02-24', '3', null, '106749', null);
INSERT INTO `infox_project_emp_working` VALUES ('676091', '2014-06-10 10:58:01', '2014-03-31', '初級PG1', '2014-01-01', '4', '1264', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('678497', '2014-06-13 11:14:36', '2014-07-31', '', '2014-02-18', '1', '6017', null, '425921');
INSERT INTO `infox_project_emp_working` VALUES ('690573', '2014-06-06 15:16:53', '2014-02-28', '初級PG1', '2013-12-06', '1', '1276', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('693342', '2014-06-10 10:58:01', '2014-02-28', '初級PG1', '2014-01-01', '4', '1270', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('695636', '2014-06-13 15:29:52', '2014-03-31', 'SE', '2013-12-01', '4', '0280', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('701591', '2014-06-03 11:04:42', '2014-01-09', 'PG', '2013-10-09', '4', '1282', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('708663', '2014-06-09 16:57:51', '2014-01-12', 'PG', '2013-12-23', '4', '1296', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('711632', '2014-06-06 16:05:31', '2014-02-12', '初級PG2', '2013-12-02', '4', '1206', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('720989', '2014-06-03 12:00:38', '2014-06-30', 'BSE', '2012-03-18', '1', '0887', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('725035', '2014-06-09 15:00:12', '2014-01-27', 'PG', '2013-12-30', '4', '1028', null, '802759');
INSERT INTO `infox_project_emp_working` VALUES ('727413', '2014-06-09 13:55:21', '2014-01-27', null, '2014-01-13', '3', null, '725035', null);
INSERT INTO `infox_project_emp_working` VALUES ('727652', '2014-06-10 11:33:14', '2014-01-10', 'SE', '2013-12-10', '4', '0676', null, '994809');
INSERT INTO `infox_project_emp_working` VALUES ('727771', '2014-06-03 13:31:55', '2014-01-28', '', '2013-12-13', '1', '9069', null, '628551');
INSERT INTO `infox_project_emp_working` VALUES ('729552', '2014-06-03 12:00:38', '2014-12-31', 'BSE', '2013-06-22', '1', '0855', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('731099', '2014-06-03 11:04:42', '2014-01-09', 'PM', '2013-09-02', '4', '1225', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('735063', '2014-06-03 10:57:05', '2014-02-12', 'PG', '2013-12-16', '4', '1220', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('740175', '2014-06-03 14:22:13', '2014-03-21', 'PG', '2014-02-07', '1', '9017', null, '182090');
INSERT INTO `infox_project_emp_working` VALUES ('741161', '2014-06-06 15:16:53', '2014-03-14', 'PG', '2013-12-10', '1', '1004', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('751060', '2014-06-09 15:00:12', '2014-01-14', 'PG', '2014-01-10', '4', '0753', null, '802759');
INSERT INTO `infox_project_emp_working` VALUES ('756988', '2014-06-06 14:49:31', '2014-03-31', '初級PG1', '2014-03-06', '4', '1276', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('757990', '2014-06-16 08:50:04', '2014-04-09', 'PG', '2014-03-25', '1', '0985', null, '959815');
INSERT INTO `infox_project_emp_working` VALUES ('762438', '2014-06-10 11:18:59', '2014-04-30', 'SE', '2013-12-02', '4', '0671', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('768063', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2013-12-09', '1', '0920', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('769857', '2014-06-03 11:04:42', '2014-02-28', 'PM', '2013-10-09', '4', '6001', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('770377', '2014-06-10 10:58:01', '2014-03-31', 'PM', '2014-03-17', '4', '0601', null, '671169');
INSERT INTO `infox_project_emp_working` VALUES ('771651', '2014-06-03 11:04:42', '2014-01-09', 'SE', '2013-09-24', '4', '0850', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('777773', '2014-05-30 13:49:11', '2014-01-31', 'SE', '2013-03-12', '4', '0938', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('781771', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2014-01-15', '1', '0621', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('799726', '2014-06-10 11:18:59', '2014-04-18', 'PM', '2013-12-02', '4', '0351', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('801579', '2014-06-09 16:03:43', '2013-12-05', 'PG', '2013-09-09', '4', '1193', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('802323', '2014-05-30 13:49:11', '2014-01-31', 'PM', '2013-03-12', '4', '0067', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('802579', '2014-06-10 10:56:08', '2014-02-28', 'BSE', '2014-02-17', '4', '1074', null, '169973');
INSERT INTO `infox_project_emp_working` VALUES ('804514', '2014-06-10 11:29:00', '2014-01-06', 'SE', '2014-01-02', '4', '0217', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('806308', '2014-06-09 13:03:06', '2014-01-05', 'PG', '2014-01-01', '4', '1172', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('820133', '2014-06-13 15:40:49', '2014-03-28', 'SE', '2014-02-07', '1', '0681', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('823239', '2014-06-03 10:54:07', '2014-02-26', 'PG', '2013-12-03', '4', '1060', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('823813', '2014-06-03 10:54:07', '2014-01-24', 'PG', '2013-12-03', '4', '1099', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('829607', '2014-06-09 16:03:43', '2013-11-01', 'SE', '2013-09-09', '4', '0670', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('833187', '2014-06-06 15:15:58', '2014-03-20', 'SE', '2014-02-11', '4', '0579', null, '495651');
INSERT INTO `infox_project_emp_working` VALUES ('843094', '2014-06-06 14:41:05', '2014-03-31', 'BSE', '2013-04-21', '4', '0413', null, '217274');
INSERT INTO `infox_project_emp_working` VALUES ('846338', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2013-12-09', '1', '0876', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('851292', '2014-06-03 10:57:05', '2014-02-12', 'PG', '2013-12-03', '4', '1071', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('854560', '2014-06-10 11:35:53', '2014-03-14', '初級PG3', '2014-01-20', '1', '1275', null, '008684');
INSERT INTO `infox_project_emp_working` VALUES ('856367', '2014-06-09 14:57:25', '2014-02-06', 'PG', '2014-01-01', '4', '0681', null, '150108');
INSERT INTO `infox_project_emp_working` VALUES ('868730', '2014-06-13 15:28:01', '2014-04-02', 'SE', '2014-03-14', '4', '0749', null, '352191');
INSERT INTO `infox_project_emp_working` VALUES ('871563', '2014-06-06 16:22:36', '2014-03-10', 'PG', '2014-02-26', '1', '0718', null, '963078');
INSERT INTO `infox_project_emp_working` VALUES ('885758', '2014-06-06 14:41:27', '2014-04-11', 'SE', '2014-02-11', '1', '1237', null, '724633');
INSERT INTO `infox_project_emp_working` VALUES ('887582', '2014-06-13 15:29:52', '2014-01-24', 'PG', '2014-01-20', '4', '1109', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('889173', '2014-06-16 08:50:04', '2014-04-08', '通訳', '2014-04-08', '1', '0856', null, '959815');
INSERT INTO `infox_project_emp_working` VALUES ('889517', '2014-06-06 14:01:52', '2014-03-28', 'PM', '2014-01-16', '1', '0850', null, '812153');
INSERT INTO `infox_project_emp_working` VALUES ('889979', '2014-06-13 15:29:52', '2014-01-24', 'PG', '2014-01-23', '4', '1247', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('894677', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2013-12-12', '1', '0950', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('895290', '2014-06-11 16:18:27', '2014-01-24', '', '2013-07-23', '4', '1104', null, '562037');
INSERT INTO `infox_project_emp_working` VALUES ('902034', '2014-06-06 15:39:14', '2014-04-15', 'PM', '2014-04-01', '1', '0413', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('902998', '2014-06-10 09:05:55', '2014-01-30', 'PG', '2014-01-10', '4', '1269', null, '893834');
INSERT INTO `infox_project_emp_working` VALUES ('918258', '2014-06-09 16:03:43', '2014-02-11', 'PM', '2013-09-03', '4', '0155', null, '402475');
INSERT INTO `infox_project_emp_working` VALUES ('920857', '2014-05-29 15:24:35', '2014-03-31', 'SE', '2013-11-01', '1', '0627', null, '884747');
INSERT INTO `infox_project_emp_working` VALUES ('921219', '2014-06-11 16:11:56', '2014-01-25', 'SE', '2013-12-10', '4', '0590', null, '994809');
INSERT INTO `infox_project_emp_working` VALUES ('924597', '2014-06-13 15:28:01', '2014-03-25', 'PM', '2014-03-14', '4', '0803', null, '352191');
INSERT INTO `infox_project_emp_working` VALUES ('926291', '2014-06-09 16:57:51', '2013-12-05', 'SE', '2013-12-01', '4', '0217', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('933557', '2014-06-10 11:18:59', '2014-02-24', '初級PG2', '2013-12-02', '4', '1175', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('936561', '2014-06-13 15:29:52', '2014-01-26', 'PG', '2014-01-20', '4', '1219', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('936629', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2014-01-15', '1', '1192', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('936689', '2014-06-06 15:38:55', '2014-04-20', 'PG', '2014-04-15', '4', '1082', null, '724633');
INSERT INTO `infox_project_emp_working` VALUES ('936696', '2014-05-30 13:47:55', '2014-01-12', 'SE', '2013-08-07', '4', '0498', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('938975', '2014-06-06 16:05:31', '2014-01-10', 'PG', '2013-12-02', '4', '0718', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('940095', '2014-06-13 15:28:35', '2014-03-27', 'SE', '2014-03-13', '4', '1059', null, '944178');
INSERT INTO `infox_project_emp_working` VALUES ('944170', '2014-06-13 15:27:29', '2014-04-01', 'PM', '2014-03-31', '4', '0190', null, '490275');
INSERT INTO `infox_project_emp_working` VALUES ('949449', '2014-06-03 10:58:46', '2014-01-26', 'PG', '2013-12-16', '4', '1158', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('951018', '2014-06-03 16:58:43', '2014-04-01', 'BSE', '2014-01-01', '1', '0394', null, '227191');
INSERT INTO `infox_project_emp_working` VALUES ('951552', '2014-06-06 15:16:53', '2014-01-28', 'SE', '2013-12-11', '1', '055', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('951585', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2014-01-02', '1', '0883', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('955638', '2014-06-13 15:40:49', '2014-03-06', 'PG', '2014-03-03', '1', '1302', null, '648346');
INSERT INTO `infox_project_emp_working` VALUES ('956541', '2014-06-13 15:29:06', '2014-05-16', 'PM', '2014-02-12', '4', '0155', null, '889055');
INSERT INTO `infox_project_emp_working` VALUES ('956717', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2013-12-06', '1', '0974', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('957112', '2014-06-16 08:56:10', '2014-05-09', 'SE', '2014-03-26', '1', '0669', null, '606390');
INSERT INTO `infox_project_emp_working` VALUES ('959724', '2014-06-06 15:28:36', '2014-04-16', 'SE', '2014-04-16', '4', '0413', null, '724633');
INSERT INTO `infox_project_emp_working` VALUES ('971209', '2014-06-06 15:39:14', '2014-04-13', 'PM', '2014-02-20', '1', '1084', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('973509', '2014-06-06 15:16:53', '2014-03-14', 'SE', '2013-12-09', '1', '0860', null, '100513');
INSERT INTO `infox_project_emp_working` VALUES ('976204', '2014-06-03 10:55:55', '2014-02-14', 'PM', '2013-12-16', '4', '0428', null, '675005');
INSERT INTO `infox_project_emp_working` VALUES ('978083', '2014-06-16 08:50:04', '2014-04-08', '通訳', '2014-04-08', '1', '0280', null, '959815');
INSERT INTO `infox_project_emp_working` VALUES ('982473', '2014-06-06 15:39:14', '2014-04-25', 'PG', '2014-02-20', '1', '1071', null, '005862');
INSERT INTO `infox_project_emp_working` VALUES ('988770', '2014-06-03 10:58:46', '2014-01-26', 'SE', '2013-12-10', '4', '0866', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('989426', '2014-05-30 13:49:11', '2014-01-31', 'PM', '2013-03-01', '4', '0806', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('990515', '2014-05-30 13:47:55', '2014-01-02', 'PG', '2013-11-14', '4', '1263', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('991270', '2014-06-09 14:57:25', '2014-02-06', 'PM', '2014-01-01', '4', '1046', null, '150108');
INSERT INTO `infox_project_emp_working` VALUES ('992792', '2014-06-03 10:55:55', '2014-01-27', 'PG', '2013-12-16', '4', '1236', null, '675005');
INSERT INTO `infox_project_emp_working` VALUES ('992911', '2014-06-13 15:29:52', '2014-01-23', 'PG', '2014-01-20', '4', '1296', null, '524719');
INSERT INTO `infox_project_emp_working` VALUES ('993084', '2014-06-06 15:16:53', '2014-02-28', 'PG', '2014-02-10', '1', '1174', null, '100513');

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
INSERT INTO `infox_project_maillist` VALUES ('002306', '0675', '806257');
INSERT INTO `infox_project_maillist` VALUES ('002546', '1300', '756231');
INSERT INTO `infox_project_maillist` VALUES ('004786', '0100', '816385');
INSERT INTO `infox_project_maillist` VALUES ('004988', '1300', '994809');
INSERT INTO `infox_project_maillist` VALUES ('005798', '0317', '352191');
INSERT INTO `infox_project_maillist` VALUES ('006729', '0050', '264706');
INSERT INTO `infox_project_maillist` VALUES ('017658', '0100', '402475');
INSERT INTO `infox_project_maillist` VALUES ('019135', '1300', '963078');
INSERT INTO `infox_project_maillist` VALUES ('021284', '6000', '425921');
INSERT INTO `infox_project_maillist` VALUES ('036472', '0100', '217274');
INSERT INTO `infox_project_maillist` VALUES ('037820', '0449', '402475');
INSERT INTO `infox_project_maillist` VALUES ('040978', '1000', '252921');
INSERT INTO `infox_project_maillist` VALUES ('042542', '0100', '352191');
INSERT INTO `infox_project_maillist` VALUES ('043725', '1300', '252921');
INSERT INTO `infox_project_maillist` VALUES ('045527', '1300', '100513');
INSERT INTO `infox_project_maillist` VALUES ('047015', '0317', '562037');
INSERT INTO `infox_project_maillist` VALUES ('047357', '0317', '227191');
INSERT INTO `infox_project_maillist` VALUES ('055599', '0675', '994809');
INSERT INTO `infox_project_maillist` VALUES ('056194', '0317', '675005');
INSERT INTO `infox_project_maillist` VALUES ('058859', '6000', '066763');
INSERT INTO `infox_project_maillist` VALUES ('061568', '0817', '217274');
INSERT INTO `infox_project_maillist` VALUES ('067681', '1000', '096831');
INSERT INTO `infox_project_maillist` VALUES ('068186', '0100', '100513');
INSERT INTO `infox_project_maillist` VALUES ('070410', '0449', '005862');
INSERT INTO `infox_project_maillist` VALUES ('075144', '0317', '648346');
INSERT INTO `infox_project_maillist` VALUES ('088619', '0317', '816385');
INSERT INTO `infox_project_maillist` VALUES ('103266', '0100', '844509');
INSERT INTO `infox_project_maillist` VALUES ('105148', '1300', '724633');
INSERT INTO `infox_project_maillist` VALUES ('110434', '0317', '570315');
INSERT INTO `infox_project_maillist` VALUES ('111031', '9010', '172734');
INSERT INTO `infox_project_maillist` VALUES ('111434', '0449', '812153');
INSERT INTO `infox_project_maillist` VALUES ('119099', '0317', '806257');
INSERT INTO `infox_project_maillist` VALUES ('127680', '0449', '495651');
INSERT INTO `infox_project_maillist` VALUES ('128572', '0100', '524719');
INSERT INTO `infox_project_maillist` VALUES ('130105', '0100', '994809');
INSERT INTO `infox_project_maillist` VALUES ('142500', '0100', '812153');
INSERT INTO `infox_project_maillist` VALUES ('145070', '1300', '922860');
INSERT INTO `infox_project_maillist` VALUES ('147958', '0317', '524719');
INSERT INTO `infox_project_maillist` VALUES ('154400', '0449', '724633');
INSERT INTO `infox_project_maillist` VALUES ('155211', '0449', '570315');
INSERT INTO `infox_project_maillist` VALUES ('155852', '0317', '756231');
INSERT INTO `infox_project_maillist` VALUES ('164887', '0559', '562037');
INSERT INTO `infox_project_maillist` VALUES ('166758', '0317', '008684');
INSERT INTO `infox_project_maillist` VALUES ('170980', '0317', '802759');
INSERT INTO `infox_project_maillist` VALUES ('175659', '0190', '816385');
INSERT INTO `infox_project_maillist` VALUES ('177408', '0317', '712974');
INSERT INTO `infox_project_maillist` VALUES ('177787', '0675', '828467');
INSERT INTO `infox_project_maillist` VALUES ('179837', '0032', '217274');
INSERT INTO `infox_project_maillist` VALUES ('180336', '0100', '562037');
INSERT INTO `infox_project_maillist` VALUES ('184509', '0317', '994809');
INSERT INTO `infox_project_maillist` VALUES ('184758', '0449', '008684');
INSERT INTO `infox_project_maillist` VALUES ('188987', '0449', '066763');
INSERT INTO `infox_project_maillist` VALUES ('195511', '0317', '172734');
INSERT INTO `infox_project_maillist` VALUES ('202875', '0050', '893834');
INSERT INTO `infox_project_maillist` VALUES ('203088', '0317', '724633');
INSERT INTO `infox_project_maillist` VALUES ('204213', '1300', '806257');
INSERT INTO `infox_project_maillist` VALUES ('204886', '0449', '671169');
INSERT INTO `infox_project_maillist` VALUES ('209119', '1300', '919321');
INSERT INTO `infox_project_maillist` VALUES ('209609', '0100', '628551');
INSERT INTO `infox_project_maillist` VALUES ('218831', '1300', '352191');
INSERT INTO `infox_project_maillist` VALUES ('218853', '0100', '169973');
INSERT INTO `infox_project_maillist` VALUES ('224137', '0449', '096831');
INSERT INTO `infox_project_maillist` VALUES ('226812', '0449', '425921');
INSERT INTO `infox_project_maillist` VALUES ('229031', '0190', '490275');
INSERT INTO `infox_project_maillist` VALUES ('232135', '1300', '182090');
INSERT INTO `infox_project_maillist` VALUES ('237385', '1300', '490275');
INSERT INTO `infox_project_maillist` VALUES ('239632', '0100', '227191');
INSERT INTO `infox_project_maillist` VALUES ('247598', '0190', '402475');
INSERT INTO `infox_project_maillist` VALUES ('255368', '0317', '866112');
INSERT INTO `infox_project_maillist` VALUES ('255490', '1300', '495651');
INSERT INTO `infox_project_maillist` VALUES ('255669', '1300', '425921');
INSERT INTO `infox_project_maillist` VALUES ('266556', '0317', '671169');
INSERT INTO `infox_project_maillist` VALUES ('275281', '0190', '217274');
INSERT INTO `infox_project_maillist` VALUES ('276618', '1300', '040856');
INSERT INTO `infox_project_maillist` VALUES ('280298', '0449', '884747');
INSERT INTO `infox_project_maillist` VALUES ('286233', '0449', '252921');
INSERT INTO `infox_project_maillist` VALUES ('294082', '0100', '172734');
INSERT INTO `infox_project_maillist` VALUES ('294148', '0817', '100513');
INSERT INTO `infox_project_maillist` VALUES ('295069', '6000', '049830');
INSERT INTO `infox_project_maillist` VALUES ('296593', '0317', '963078');
INSERT INTO `infox_project_maillist` VALUES ('297634', '0449', '352191');
INSERT INTO `infox_project_maillist` VALUES ('301482', '0449', '963078');
INSERT INTO `infox_project_maillist` VALUES ('302320', '1300', '675005');
INSERT INTO `infox_project_maillist` VALUES ('309113', '0100', '005862');
INSERT INTO `infox_project_maillist` VALUES ('316416', '1300', '259235');
INSERT INTO `infox_project_maillist` VALUES ('317357', '1300', '828467');
INSERT INTO `infox_project_maillist` VALUES ('317955', '1300', '800184');
INSERT INTO `infox_project_maillist` VALUES ('318025', '0449', '893834');
INSERT INTO `infox_project_maillist` VALUES ('318136', '9010', '366845');
INSERT INTO `infox_project_maillist` VALUES ('322986', '0817', '866112');
INSERT INTO `infox_project_maillist` VALUES ('324500', '0100', '919321');
INSERT INTO `infox_project_maillist` VALUES ('326866', '1300', '671169');
INSERT INTO `infox_project_maillist` VALUES ('327980', '0100', '866112');
INSERT INTO `infox_project_maillist` VALUES ('331334', '0100', '944178');
INSERT INTO `infox_project_maillist` VALUES ('334193', '049', '217274');
INSERT INTO `infox_project_maillist` VALUES ('348897', '1300', '648346');
INSERT INTO `infox_project_maillist` VALUES ('352638', '0100', '490275');
INSERT INTO `infox_project_maillist` VALUES ('353585', '0317', '264706');
INSERT INTO `infox_project_maillist` VALUES ('359180', '0317', '096831');
INSERT INTO `infox_project_maillist` VALUES ('362099', '1300', '884747');
INSERT INTO `infox_project_maillist` VALUES ('362488', '1300', '866112');
INSERT INTO `infox_project_maillist` VALUES ('363385', '1300', '816385');
INSERT INTO `infox_project_maillist` VALUES ('371903', '1300', '049830');
INSERT INTO `infox_project_maillist` VALUES ('376449', '0100', '963078');
INSERT INTO `infox_project_maillist` VALUES ('377391', '0449', '169973');
INSERT INTO `infox_project_maillist` VALUES ('377574', '0317', '005862');
INSERT INTO `infox_project_maillist` VALUES ('382180', '0100', '959815');
INSERT INTO `infox_project_maillist` VALUES ('383880', '1300', '227191');
INSERT INTO `infox_project_maillist` VALUES ('390912', '0317', '100513');
INSERT INTO `infox_project_maillist` VALUES ('397613', '0449', '828467');
INSERT INTO `infox_project_maillist` VALUES ('397659', '0190', '712974');
INSERT INTO `infox_project_maillist` VALUES ('401217', '0100', '884747');
INSERT INTO `infox_project_maillist` VALUES ('410595', '0449', '562037');
INSERT INTO `infox_project_maillist` VALUES ('410611', '0317', '628551');
INSERT INTO `infox_project_maillist` VALUES ('428012', '0317', '425921');
INSERT INTO `infox_project_maillist` VALUES ('437613', '0100', '724633');
INSERT INTO `infox_project_maillist` VALUES ('443374', '1300', '066763');
INSERT INTO `infox_project_maillist` VALUES ('453699', '0100', '049830');
INSERT INTO `infox_project_maillist` VALUES ('461633', '0190', '150108');
INSERT INTO `infox_project_maillist` VALUES ('473101', '0100', '150108');
INSERT INTO `infox_project_maillist` VALUES ('475271', '0823', '922860');
INSERT INTO `infox_project_maillist` VALUES ('475982', '0317', '828467');
INSERT INTO `infox_project_maillist` VALUES ('478658', '0817', '005862');
INSERT INTO `infox_project_maillist` VALUES ('481456', '0675', '963078');
INSERT INTO `infox_project_maillist` VALUES ('482864', '0317', '844509');
INSERT INTO `infox_project_maillist` VALUES ('486712', '0100', '669576');
INSERT INTO `infox_project_maillist` VALUES ('493780', '0449', '919321');
INSERT INTO `infox_project_maillist` VALUES ('511765', '0317', '049830');
INSERT INTO `infox_project_maillist` VALUES ('519025', '0449', '150108');
INSERT INTO `infox_project_maillist` VALUES ('520059', '0449', '994809');
INSERT INTO `infox_project_maillist` VALUES ('520367', '0449', '844509');
INSERT INTO `infox_project_maillist` VALUES ('522949', '0449', '922860');
INSERT INTO `infox_project_maillist` VALUES ('525716', '1300', '169973');
INSERT INTO `infox_project_maillist` VALUES ('529081', '9010', '182090');
INSERT INTO `infox_project_maillist` VALUES ('532752', '1300', '217274');
INSERT INTO `infox_project_maillist` VALUES ('535913', '0100', '889055');
INSERT INTO `infox_project_maillist` VALUES ('555514', '0100', '425921');
INSERT INTO `infox_project_maillist` VALUES ('559177', '1300', '712974');
INSERT INTO `infox_project_maillist` VALUES ('559355', '0190', '232261');
INSERT INTO `infox_project_maillist` VALUES ('561718', '0190', '259235');
INSERT INTO `infox_project_maillist` VALUES ('565001', '0190', '944178');
INSERT INTO `infox_project_maillist` VALUES ('566188', '1300', '669576');
INSERT INTO `infox_project_maillist` VALUES ('567117', '0675', '922860');
INSERT INTO `infox_project_maillist` VALUES ('567547', '0449', '259235');
INSERT INTO `infox_project_maillist` VALUES ('567963', '0675', '217274');
INSERT INTO `infox_project_maillist` VALUES ('567987', '1300', '844509');
INSERT INTO `infox_project_maillist` VALUES ('569119', '0449', '524719');
INSERT INTO `infox_project_maillist` VALUES ('569439', '0100', '366845');
INSERT INTO `infox_project_maillist` VALUES ('570104', '1300', '264706');
INSERT INTO `infox_project_maillist` VALUES ('580993', '0817', '169973');
INSERT INTO `infox_project_maillist` VALUES ('582675', '0100', '040856');
INSERT INTO `infox_project_maillist` VALUES ('604467', '0317', '252921');
INSERT INTO `infox_project_maillist` VALUES ('605117', '0317', '366845');
INSERT INTO `infox_project_maillist` VALUES ('606765', '0317', '182090');
INSERT INTO `infox_project_maillist` VALUES ('610174', '0449', '264706');
INSERT INTO `infox_project_maillist` VALUES ('616800', '0190', '669576');
INSERT INTO `infox_project_maillist` VALUES ('626371', '0449', '800184');
INSERT INTO `infox_project_maillist` VALUES ('634866', '0449', '816385');
INSERT INTO `infox_project_maillist` VALUES ('635172', '0317', '944178');
INSERT INTO `infox_project_maillist` VALUES ('642360', '0317', '922860');
INSERT INTO `infox_project_maillist` VALUES ('649787', '1300', '959815');
INSERT INTO `infox_project_maillist` VALUES ('653953', '1300', '402475');
INSERT INTO `infox_project_maillist` VALUES ('658563', '0817', '844509');
INSERT INTO `infox_project_maillist` VALUES ('664531', '0190', '959815');
INSERT INTO `infox_project_maillist` VALUES ('666528', '0190', '756231');
INSERT INTO `infox_project_maillist` VALUES ('668122', '0449', '172734');
INSERT INTO `infox_project_maillist` VALUES ('669757', '0449', '217274');
INSERT INTO `infox_project_maillist` VALUES ('674160', '0449', '232261');
INSERT INTO `infox_project_maillist` VALUES ('678797', '0100', '066763');
INSERT INTO `infox_project_maillist` VALUES ('680364', '9010', '919321');
INSERT INTO `infox_project_maillist` VALUES ('682713', '0317', '812153');
INSERT INTO `infox_project_maillist` VALUES ('687984', '1300', '172734');
INSERT INTO `infox_project_maillist` VALUES ('694163', '0317', '495651');
INSERT INTO `infox_project_maillist` VALUES ('698245', '0449', '100513');
INSERT INTO `infox_project_maillist` VALUES ('705655', '0449', '606390');
INSERT INTO `infox_project_maillist` VALUES ('708015', '0675', '628551');
INSERT INTO `infox_project_maillist` VALUES ('709333', '1300', '366845');
INSERT INTO `infox_project_maillist` VALUES ('709607', '0100', '828467');
INSERT INTO `infox_project_maillist` VALUES ('715164', '0100', '802759');
INSERT INTO `infox_project_maillist` VALUES ('717400', '0190', '524719');
INSERT INTO `infox_project_maillist` VALUES ('717933', '0317', '066763');
INSERT INTO `infox_project_maillist` VALUES ('719812', '1300', '944178');
INSERT INTO `infox_project_maillist` VALUES ('722076', '1300', '893834');
INSERT INTO `infox_project_maillist` VALUES ('722709', '0449', '182090');
INSERT INTO `infox_project_maillist` VALUES ('725120', '0317', '259235');
INSERT INTO `infox_project_maillist` VALUES ('729706', '0317', '669576');
INSERT INTO `infox_project_maillist` VALUES ('731709', '1300', '606390');
INSERT INTO `infox_project_maillist` VALUES ('732207', '0317', '150108');
INSERT INTO `infox_project_maillist` VALUES ('735843', '0100', '606390');
INSERT INTO `infox_project_maillist` VALUES ('737638', '0032', '008684');
INSERT INTO `infox_project_maillist` VALUES ('745473', '0817', '724633');
INSERT INTO `infox_project_maillist` VALUES ('745989', '0100', '252921');
INSERT INTO `infox_project_maillist` VALUES ('752015', '0100', '096831');
INSERT INTO `infox_project_maillist` VALUES ('753569', '0823', '217274');
INSERT INTO `infox_project_maillist` VALUES ('755254', '0317', '606390');
INSERT INTO `infox_project_maillist` VALUES ('755827', '9010', '922860');
INSERT INTO `infox_project_maillist` VALUES ('756647', '0449', '712974');
INSERT INTO `infox_project_maillist` VALUES ('758845', '0317', '884747');
INSERT INTO `infox_project_maillist` VALUES ('765011', '0100', '800184');
INSERT INTO `infox_project_maillist` VALUES ('768918', '0100', '232261');
INSERT INTO `infox_project_maillist` VALUES ('773893', '0100', '008684');
INSERT INTO `infox_project_maillist` VALUES ('774524', '0100', '264706');
INSERT INTO `infox_project_maillist` VALUES ('778141', '1300', '005862');
INSERT INTO `infox_project_maillist` VALUES ('780235', '0449', '628551');
INSERT INTO `infox_project_maillist` VALUES ('783942', '1300', '802759');
INSERT INTO `infox_project_maillist` VALUES ('786732', '1300', '008684');
INSERT INTO `infox_project_maillist` VALUES ('787372', '0007', '040856');
INSERT INTO `infox_project_maillist` VALUES ('789153', '1300', '562037');
INSERT INTO `infox_project_maillist` VALUES ('789161', '0449', '756231');
INSERT INTO `infox_project_maillist` VALUES ('800909', '0449', '669576');
INSERT INTO `infox_project_maillist` VALUES ('801410', '0449', '866112');
INSERT INTO `infox_project_maillist` VALUES ('803676', '0675', '495651');
INSERT INTO `infox_project_maillist` VALUES ('806883', '0100', '495651');
INSERT INTO `infox_project_maillist` VALUES ('807363', '0100', '922860');
INSERT INTO `infox_project_maillist` VALUES ('809076', '0449', '802759');
INSERT INTO `infox_project_maillist` VALUES ('811552', '1300', '628551');
INSERT INTO `infox_project_maillist` VALUES ('813992', '0317', '217274');
INSERT INTO `infox_project_maillist` VALUES ('817585', '1300', '812153');
INSERT INTO `infox_project_maillist` VALUES ('818594', '0817', '671169');
INSERT INTO `infox_project_maillist` VALUES ('819615', '0449', '227191');
INSERT INTO `infox_project_maillist` VALUES ('820373', '0317', '959815');
INSERT INTO `infox_project_maillist` VALUES ('823339', '1300', '524719');
INSERT INTO `infox_project_maillist` VALUES ('825892', '0559', '217274');
INSERT INTO `infox_project_maillist` VALUES ('829112', '0317', '893834');
INSERT INTO `infox_project_maillist` VALUES ('832507', '0100', '893834');
INSERT INTO `infox_project_maillist` VALUES ('841526', '0190', '648346');
INSERT INTO `infox_project_maillist` VALUES ('851743', '0317', '919321');
INSERT INTO `infox_project_maillist` VALUES ('865026', '0317', '889055');
INSERT INTO `infox_project_maillist` VALUES ('867541', '0817', '570315');
INSERT INTO `infox_project_maillist` VALUES ('868028', '0100', '756231');
INSERT INTO `infox_project_maillist` VALUES ('873792', '0449', '366845');
INSERT INTO `infox_project_maillist` VALUES ('879022', '0317', '040856');
INSERT INTO `infox_project_maillist` VALUES ('879516', '0100', '259235');
INSERT INTO `infox_project_maillist` VALUES ('882231', '0190', '802759');
INSERT INTO `infox_project_maillist` VALUES ('884926', '1300', '150108');
INSERT INTO `infox_project_maillist` VALUES ('884945', '0449', '806257');
INSERT INTO `infox_project_maillist` VALUES ('885388', '0190', '606390');
INSERT INTO `infox_project_maillist` VALUES ('887894', '0317', '169973');
INSERT INTO `infox_project_maillist` VALUES ('899434', '0449', '889055');
INSERT INTO `infox_project_maillist` VALUES ('907238', '0100', '570315');
INSERT INTO `infox_project_maillist` VALUES ('908059', '0100', '182090');
INSERT INTO `infox_project_maillist` VALUES ('911959', '1300', '232261');
INSERT INTO `infox_project_maillist` VALUES ('913169', '0317', '402475');
INSERT INTO `infox_project_maillist` VALUES ('914309', '0449', '944178');
INSERT INTO `infox_project_maillist` VALUES ('914395', '0449', '040856');
INSERT INTO `infox_project_maillist` VALUES ('914889', '0449', '648346');
INSERT INTO `infox_project_maillist` VALUES ('918816', '1300', '889055');
INSERT INTO `infox_project_maillist` VALUES ('923396', '1000', '889055');
INSERT INTO `infox_project_maillist` VALUES ('924524', '0449', '959815');
INSERT INTO `infox_project_maillist` VALUES ('928277', '0854', '217274');
INSERT INTO `infox_project_maillist` VALUES ('930164', '0317', '232261');
INSERT INTO `infox_project_maillist` VALUES ('932398', '0100', '671169');
INSERT INTO `infox_project_maillist` VALUES ('933458', '0675', '812153');
INSERT INTO `infox_project_maillist` VALUES ('935396', '0100', '648346');
INSERT INTO `infox_project_maillist` VALUES ('937306', '0817', '800184');
INSERT INTO `infox_project_maillist` VALUES ('940514', '0050', '884747');
INSERT INTO `infox_project_maillist` VALUES ('941130', '0817', '675005');
INSERT INTO `infox_project_maillist` VALUES ('941161', '0449', '490275');
INSERT INTO `infox_project_maillist` VALUES ('950942', '0100', '712974');
INSERT INTO `infox_project_maillist` VALUES ('954861', '0317', '490275');
INSERT INTO `infox_project_maillist` VALUES ('957329', '0449', '049830');
INSERT INTO `infox_project_maillist` VALUES ('962740', '0100', '675005');
INSERT INTO `infox_project_maillist` VALUES ('966150', '0317', '800184');
INSERT INTO `infox_project_maillist` VALUES ('974101', '1300', '570315');
INSERT INTO `infox_project_maillist` VALUES ('980105', '1300', '096831');
INSERT INTO `infox_project_maillist` VALUES ('980416', '0449', '675005');
INSERT INTO `infox_project_maillist` VALUES ('987104', '0100', '806257');
INSERT INTO `infox_project_maillist` VALUES ('998533', '0190', '352191');

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
INSERT INTO `infox_project_overtime` VALUES ('010208', '2014-06-10 09:40:02', null, '0', '0', null, '0', '0', null, '7', '7', '1214', '994809');
INSERT INTO `infox_project_overtime` VALUES ('017753', '2014-06-04 13:58:37', null, '0', '0', null, '19', '19', null, '0', '0', '1079', '671169');
INSERT INTO `infox_project_overtime` VALUES ('072451', '2014-06-04 14:00:30', null, '0', '0', null, '2', '2', null, '0', '0', '1264', '671169');
INSERT INTO `infox_project_overtime` VALUES ('072641', '2014-06-10 11:35:24', null, '0', '0', null, '50.5', '50.5', null, '6', '6', '0866', '963078');
INSERT INTO `infox_project_overtime` VALUES ('090144', '2014-05-26 11:23:49', null, '0', '0', null, '8.1', '8.1', null, '14', '14', '1237', '800184');
INSERT INTO `infox_project_overtime` VALUES ('096257', '2014-06-09 16:10:36', null, '0', '0', null, '0', '0', null, '8', '8', '1082', '724633');
INSERT INTO `infox_project_overtime` VALUES ('115788', '2014-06-10 10:53:48', null, '0', '0', null, '24.7', '24.7', null, '22.8', '22.8', '0950', '100513');
INSERT INTO `infox_project_overtime` VALUES ('116235', '2014-06-09 15:51:40', null, '0', '0', null, '19.4', '19.4', null, '16.7', '16.7', '1296', '812153');
INSERT INTO `infox_project_overtime` VALUES ('164330', '2014-06-10 10:38:52', null, '0', '0', null, '74', '74', null, '30.7', '30.7', '0377', '100513');
INSERT INTO `infox_project_overtime` VALUES ('166117', '2014-06-09 11:29:36', null, '0', '0', null, '0', '0', null, '0', '0', '0669', '495651');
INSERT INTO `infox_project_overtime` VALUES ('167926', '2014-05-26 10:14:46', null, '0', '0', null, '101', '101', null, '55', '55', '1074', '844509');
INSERT INTO `infox_project_overtime` VALUES ('171587', '2014-06-09 15:57:17', null, '0', '0', null, '58', '58', null, '20.4', '20.4', '0850', '812153');
INSERT INTO `infox_project_overtime` VALUES ('177433', '2014-06-10 10:12:18', null, '0', '0', null, '0', '0', null, '8', '8', '1112', '100513');
INSERT INTO `infox_project_overtime` VALUES ('208228', '2014-06-09 15:55:57', null, '0', '0', null, '6', '6', null, '12.8', '12.8', '0150', '812153');
INSERT INTO `infox_project_overtime` VALUES ('238444', '2014-05-26 10:19:51', null, '0', '0', null, '54', '54', null, '0', '0', '1234', '844509');
INSERT INTO `infox_project_overtime` VALUES ('240474', '2014-05-30 15:12:29', null, '0', '0', null, '3', '3', null, '32', '32', '0559', '096831');
INSERT INTO `infox_project_overtime` VALUES ('288046', '2014-05-30 15:11:09', null, '0', '0', null, '0', '0', null, '24', '24', '0990', '096831');
INSERT INTO `infox_project_overtime` VALUES ('292136', '2014-06-10 10:51:50', null, '0', '0', null, '36.6', '36.6', null, '35', '35', '0876', '100513');
INSERT INTO `infox_project_overtime` VALUES ('292454', '2014-06-10 10:26:41', null, '0', '0', null, '0', '0', null, '5', '5', '0579', '100513');
INSERT INTO `infox_project_overtime` VALUES ('314063', '2014-06-10 10:33:07', null, '0', '0', null, '22.1', '22.1', null, '13', '13', '0215', '100513');
INSERT INTO `infox_project_overtime` VALUES ('322244', '2014-06-10 10:48:33', null, '0', '0', null, '33.9', '33.9', null, '15.3', '15.3', '0920', '100513');
INSERT INTO `infox_project_overtime` VALUES ('323738', '2014-06-10 10:17:09', null, '0', '0', null, '75.8', '75.8', null, '42.6', '42.6', '0868', '100513');
INSERT INTO `infox_project_overtime` VALUES ('339545', '2014-05-30 15:14:43', null, '0', '0', null, '0', '0', null, '16', '16', '1215', '096831');
INSERT INTO `infox_project_overtime` VALUES ('350664', '2014-05-26 10:59:48', null, '0', '0', null, '20', '20', null, '11', '11', '0428', '675005');
INSERT INTO `infox_project_overtime` VALUES ('356188', '2014-06-11 15:25:00', null, '0', '0', null, '10.5', '10.5', null, '0', '0', '1149', '008684');
INSERT INTO `infox_project_overtime` VALUES ('356947', '2014-05-26 10:21:21', null, '0', '0', null, '24.5', '24.5', null, '9', '9', '1255', '844509');
INSERT INTO `infox_project_overtime` VALUES ('362125', '2014-06-04 13:57:04', null, '0', '0', null, '7.8', '7.8', null, '0', '0', '0755', '671169');
INSERT INTO `infox_project_overtime` VALUES ('412254', '2014-06-10 10:10:06', null, '0', '0', null, '17.2', '17.2', null, '25.6', '25.6', '1193', '100513');
INSERT INTO `infox_project_overtime` VALUES ('417474', '2014-05-30 15:17:26', null, '0', '0', null, '0.5', '0.5', null, '25.5', '25.5', '0067', '096831');
INSERT INTO `infox_project_overtime` VALUES ('427730', '2014-05-26 09:53:30', null, '0', '0', null, '0', '0', null, '24.5', '24.5', '1219', '232261');
INSERT INTO `infox_project_overtime` VALUES ('461306', '2014-05-27 11:20:07', null, '0', '0', null, '45.9', '45.9', null, '34.2', '34.2', '0850', '264706');
INSERT INTO `infox_project_overtime` VALUES ('472095', '2014-06-11 15:23:57', null, '0', '0', null, '22.5', '22.5', null, '0', '0', '0032', '008684');
INSERT INTO `infox_project_overtime` VALUES ('480671', '2014-05-26 11:24:35', null, '0', '0', null, '49.7', '49.7', null, '20', '20', '1158', '800184');
INSERT INTO `infox_project_overtime` VALUES ('508491', '2014-05-30 15:16:55', null, '0', '0', null, '0', '0', null, '26', '26', '0938', '096831');
INSERT INTO `infox_project_overtime` VALUES ('529827', '2014-05-26 10:12:24', null, '0', '0', null, '28', '28', null, '6.5', '6.5', '1179', '844509');
INSERT INTO `infox_project_overtime` VALUES ('542325', '2014-05-26 10:22:12', null, '0', '0', null, '2', '2', null, '18', '18', '1287', '844509');
INSERT INTO `infox_project_overtime` VALUES ('543168', '2014-06-10 11:01:15', null, '0', '0', null, '23.5', '23.5', null, '20.3', '20.3', '0974', '100513');
INSERT INTO `infox_project_overtime` VALUES ('548832', '2014-05-30 15:30:46', null, '0', '0', null, '16', '16', null, '8', '8', '0284', '756231');
INSERT INTO `infox_project_overtime` VALUES ('550771', '2014-06-09 16:08:57', null, '0', '0', null, '19.6', '19.6', null, '29', '29', '1301', '724633');
INSERT INTO `infox_project_overtime` VALUES ('557361', '2014-06-11 15:30:25', null, '0', '0', null, '10.5', '10.5', null, '0', '0', '1275', '008684');
INSERT INTO `infox_project_overtime` VALUES ('561175', '2014-05-26 11:20:07', null, '0', '0', null, '29.9', '29.9', null, '4.7', '4.7', '0866', '800184');
INSERT INTO `infox_project_overtime` VALUES ('561265', '2014-06-10 10:49:47', null, '0', '0', null, '10.8', '10.8', null, '13.9', '13.9', '0621', '100513');
INSERT INTO `infox_project_overtime` VALUES ('569774', '2014-05-30 14:53:06', null, '0', '0', null, '3.2', '3.2', null, '0', '0', '0621', '884747');
INSERT INTO `infox_project_overtime` VALUES ('570688', '2014-05-30 14:52:08', null, '0', '0', null, '3.5', '3.5', null, '0', '0', '0627', '884747');
INSERT INTO `infox_project_overtime` VALUES ('575858', '2014-05-26 10:25:38', null, '0', '0', null, '68.5', '68.5', null, '46.5', '46.5', '1082', '844509');
INSERT INTO `infox_project_overtime` VALUES ('580246', '2014-05-26 11:33:44', null, '0', '0', null, '34.8', '34.8', null, '23', '23', '0993', '570315');
INSERT INTO `infox_project_overtime` VALUES ('591423', '2014-06-10 10:55:40', null, '0', '0', null, '10', '10', null, '12.3', '12.3', '1192', '100513');
INSERT INTO `infox_project_overtime` VALUES ('591939', '2014-05-26 11:00:46', null, '0', '0', null, '1', '1', null, '0', '0', '1236', '675005');
INSERT INTO `infox_project_overtime` VALUES ('604966', '2014-05-30 15:17:51', null, '0', '0', null, '3.5', '3.5', null, '26', '26', '0806', '096831');
INSERT INTO `infox_project_overtime` VALUES ('630488', '2014-06-10 10:29:15', null, '0', '0', null, '0', '0', null, '0', '0', '1184', '100513');
INSERT INTO `infox_project_overtime` VALUES ('638888', '2014-06-10 10:35:39', null, '0', '0', null, '33.9', '33.9', null, '26.6', '26.6', '0931', '100513');
INSERT INTO `infox_project_overtime` VALUES ('655015', '2014-06-10 10:59:43', null, '0', '0', null, '32', '32', null, '31.4', '31.4', '0883', '100513');
INSERT INTO `infox_project_overtime` VALUES ('658025', '2014-05-26 10:26:41', null, '0', '0', null, '86', '86', null, '35', '35', '1220', '844509');
INSERT INTO `infox_project_overtime` VALUES ('662874', '2014-06-10 10:43:10', null, '0', '0', null, '6.3', '6.3', null, '8', '8', '1276', '100513');
INSERT INTO `infox_project_overtime` VALUES ('669017', '2014-06-10 10:40:10', null, '0', '0', null, '0.6', '0.6', null, '13.5', '13.5', '0498', '100513');
INSERT INTO `infox_project_overtime` VALUES ('669083', '2014-06-10 11:36:41', null, '0', '0', null, '44.6', '44.6', null, '15.5', '15.5', '1219', '963078');
INSERT INTO `infox_project_overtime` VALUES ('698239', '2014-06-10 11:35:54', null, '0', '0', null, '27.1', '27.1', null, '0', '0', '1206', '963078');
INSERT INTO `infox_project_overtime` VALUES ('701094', '2014-06-10 10:18:36', null, '0', '0', null, '3.7', '3.7', null, '5.3', '5.3', '1191', '100513');
INSERT INTO `infox_project_overtime` VALUES ('709172', '2014-06-10 10:23:07', null, '0', '0', null, '54', '54', null, '26.2', '26.2', '1186', '100513');
INSERT INTO `infox_project_overtime` VALUES ('729267', '2014-05-27 11:18:40', null, '0', '0', null, '103.9', '103.9', null, '55.2', '55.2', '1225', '264706');
INSERT INTO `infox_project_overtime` VALUES ('733445', '2014-05-26 10:27:16', null, '0', '0', null, '74', '74', null, '0', '0', '1071', '844509');
INSERT INTO `infox_project_overtime` VALUES ('745630', '2014-06-11 15:22:22', null, '0', '0', null, '0', '0', null, '0', '0', '0676', '008684');
INSERT INTO `infox_project_overtime` VALUES ('747235', '2014-05-26 11:18:59', null, '0', '0', null, '0', '0', null, '6.6', '6.6', '0150', '800184');
INSERT INTO `infox_project_overtime` VALUES ('751849', '2014-05-26 11:22:59', null, '0', '0', null, '70.6', '70.6', null, '45.8', '45.8', '0520', '800184');
INSERT INTO `infox_project_overtime` VALUES ('768006', '2014-06-10 09:39:46', null, '0', '0', null, '0', '0', null, '4', '4', '0027', '994809');
INSERT INTO `infox_project_overtime` VALUES ('776528', '2014-06-09 15:54:34', null, '0', '0', null, '13.1', '13.1', null, '13.5', '13.5', '0590', '812153');
INSERT INTO `infox_project_overtime` VALUES ('786413', '2014-05-27 11:03:47', null, '0', '0', null, '17.1', '17.1', null, '8.9', '8.9', '0679', '264706');
INSERT INTO `infox_project_overtime` VALUES ('791672', '2014-06-11 15:26:28', null, '0', '0', null, '12', '12', null, '0', '0', '0748', '008684');
INSERT INTO `infox_project_overtime` VALUES ('796647', '2014-05-26 10:16:40', null, '0', '0', null, '52.5', '52.5', null, '49.5', '49.5', '1145', '844509');
INSERT INTO `infox_project_overtime` VALUES ('806952', '2014-06-10 11:02:24', null, '0', '0', null, '29.3', '29.3', null, '19.5', '19.5', '0860', '100513');
INSERT INTO `infox_project_overtime` VALUES ('830795', '2014-05-26 11:35:44', null, '0', '0', null, '35.2', '35.2', null, '7.9', '7.9', '1099', '570315');
INSERT INTO `infox_project_overtime` VALUES ('848816', '2014-05-27 11:12:16', null, '0', '0', null, '20.7', '20.7', null, '30', '30', '1250', '264706');
INSERT INTO `infox_project_overtime` VALUES ('850624', '2014-06-11 15:28:28', null, '0', '0', null, '6', '6', null, '0', '0', '0452', '008684');
INSERT INTO `infox_project_overtime` VALUES ('853891', '2014-05-30 15:16:25', null, '0', '0', null, '0', '0', null, '25.5', '25.5', '0714', '096831');
INSERT INTO `infox_project_overtime` VALUES ('854737', '2014-06-04 13:59:14', null, '0', '0', null, '18.25', '0', null, '0', '0', '0601', '671169');
INSERT INTO `infox_project_overtime` VALUES ('914095', '2014-05-26 11:34:35', null, '0', '0', null, '29.3', '29.3', null, '29.9', '29.9', '1060', '570315');
INSERT INTO `infox_project_overtime` VALUES ('921620', '2014-05-26 10:18:24', null, '0', '0', null, '139.5', '139.5', null, '17.5', '17.5', '1084', '844509');
INSERT INTO `infox_project_overtime` VALUES ('924734', '2014-06-04 13:58:02', null, '0', '0', null, '12.5', '12.5', null, '0', '0', '1068', '671169');
INSERT INTO `infox_project_overtime` VALUES ('940020', '2014-06-04 13:51:09', null, '0', '0', null, '1', '1', null, '0', '0', '1067', '671169');
INSERT INTO `infox_project_overtime` VALUES ('940269', '2014-06-10 10:41:52', null, '0', '0', null, '15.4', '15.4', null, '13.7', '13.7', '1151', '100513');
INSERT INTO `infox_project_overtime` VALUES ('964270', '2014-06-10 10:25:14', null, '0', '0', null, '59.4', '59.4', null, '28.2', '28.2', '0453', '100513');
INSERT INTO `infox_project_overtime` VALUES ('971941', '2014-05-27 11:13:44', null, '0', '0', null, '16.5', '16.5', null, '21.8', '21.8', '1274', '264706');
INSERT INTO `infox_project_overtime` VALUES ('979770', '2014-06-10 11:42:09', null, '13', '13', null, '27.7', '27.7', null, '6', '6', '0216', '866112');
INSERT INTO `infox_project_overtime` VALUES ('996744', '2014-06-04 13:52:19', null, '0', '0', null, '19.5', '19.5', null, '0', '0', '0236', '671169');

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
  `jiesuan` varchar(255) DEFAULT NULL,
  `xmpjzt` varchar(255) DEFAULT NULL,
  `ydjbHour` varchar(255) DEFAULT NULL,
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
INSERT INTO `infox_project_project` VALUES ('005862', null, '120731-1-17', '2014-06-11 15:34:54', '0317', '黄丽嫦', null, '2014-04-25 00:00:00', '2014-06-11 15:34:54', 'ADWORLD国民年金(2014年5月リリース分)', '120731-1-17', '2.63', '3.8', '0.15', '', '6', null, '9.98', null, null, null, '项目委托', '0.86', '11.6', '1', '1', '2014-02-20 00:00:00', '1', '详细设计~CT', null, '723327', '1084', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('008684', null, '140115-2-1/2/3', '2014-06-11 15:39:01', '0317', '黄丽嫦', null, '2014-03-31 00:00:00', '2014-06-11 15:39:01', '新MERITS', '140115-2', '1.74', '7.65', '0.35', '', '23', null, '13.31', null, null, null, '项目委托/人员派遣', '1.14', '11.7', '1', '1', '2014-01-13 00:00:00', '1', 'PG~UT', null, '398250', '0032', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('040856', null, '140318-2-1', '2014-06-04 15:53:08', '0317', '黄丽嫦', null, '2014-01-10 00:00:00', '2014-06-04 15:53:08', 'ISO27001信息安全体系内部审核', '140318-2-1', '', '', '', '', '', null, '0', null, null, null, '公司内部业务', '', '', '0.5', '0', '2014-01-09 00:00:00', '3', '', null, '647431', '0007', null, '3', '0', '');
INSERT INTO `infox_project_project` VALUES ('049830', null, '130822-1-4', '2014-06-13 11:12:05', null, null, null, '2014-06-30 00:00:00', '2014-06-13 11:12:05', 'bigdata', '130822-1-4', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2014-01-01 00:00:00', '1', null, null, '943553', '6000', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('066763', null, '130813-1-2', '2014-06-13 11:10:56', '0317', '黄丽嫦', null, '2014-12-31 00:00:00', '2014-06-13 11:10:56', '华夏银行测试', '130813-1-2', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '0', '2014-01-01 00:00:00', '1', '', null, '943553', '6000', null, '', '', '');
INSERT INTO `infox_project_project` VALUES ('096831', null, '110512-1-19', '2014-06-03 16:14:27', '0449', '符晓燕', null, '2014-01-31 00:00:00', '2014-06-03 16:14:27', '武汉APAC IFS系统导入', '110512-1-19', '1.97', '61', '', '', '61', null, '120', null, null, null, '项目委托', '1.58', '76', '1', '1', '2013-03-01 00:00:00', '3', '需求分析，系统导入，用户教育，运行支援', null, '461023', '0067', null, '2', '1', '');
INSERT INTO `infox_project_project` VALUES ('100513', null, '131122-1-1', '2014-06-11 14:55:46', '0449', '符晓燕', null, '2014-04-04 00:00:00', '2014-06-11 14:55:46', 'ポストノーツＰＪサブシステム開発', '131122-1-1', '6.59', '34', '', '', '34.9', null, '224', null, null, null, '项目委托', '4.56', '49.1', '1', '1', '2013-11-29 00:00:00', '1', 'FD~UT', null, '723327', '0067', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('150108', null, '111116-1-1', '2014-06-11 14:27:13', '0449', '符晓燕', null, '2014-02-06 00:00:00', '2014-06-11 14:27:13', '次世代开发', '111116-1-1', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '0', '2013-12-13 00:00:00', '3', '', null, '548996', '1046', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('169973', null, '140604-2-1', '2014-06-10 10:13:50', '0449', '符晓燕', null, '2014-02-28 00:00:00', '2014-06-10 10:13:50', 'オンサイト作業', '140604-2-1', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '0', '2014-02-17 00:00:00', '3', '', null, '723327', '1074', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('172734', null, '130812-1-1', '2014-06-09 15:26:52', '0317', '黄丽嫦', null, '2014-03-31 00:00:00', '2014-06-09 15:26:52', 'KSSOL様向け資材＆会計システム開発(2014年部分）', '130812-1-1', '3.14', '47.79', '', '', '-35', null, '150', null, null, null, '项目委托', '2.5', '60', '1', '1', '2013-05-20 00:00:00', '3', '详细设计，制造(Junit测试，UT测试)', null, '634670', '9051', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('182090', null, '140126-1-1', '2014-06-03 17:12:25', '0317', '黄丽嫦', null, '2014-03-21 00:00:00', '2014-06-03 17:12:25', '苏州分公司内部OA系统', '140126-1-1', '', '', '', '', '', null, '0', null, null, null, '社内项目', '', '', '0.5', '0', '2014-01-13 00:00:00', '1', '', null, '634670', '9043', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('217274', null, '140528-1', '2014-06-03 14:23:07', '0449', '符晓燕', null, '2016-12-31 00:00:00', '2014-06-03 14:23:07', '长期外派日本人员', '140528-1', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '0', '2009-01-01 00:00:00', '1', '', null, '203102', '7501', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('227191', null, '131213-1-1', '2014-06-12 15:20:23', '0317', '黄丽嫦', null, '2014-04-01 00:00:00', '2014-06-12 15:20:23', '番号制度対応(eAD2宛名)', '131213-1-1', '0', '2.84', '', '', '31', null, '0', null, null, null, '人员派遣', '0', '2.84', '1', '1', '2014-01-01 00:00:00', '1', 'onsite', null, '723327', '0394', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('232261', null, '120806-1', '2014-05-28 09:14:24', '0449', '符晓燕', null, '2014-01-19 00:00:00', '2014-05-28 09:14:24', 'TOSS DLR配车供需表改善', '120806-1', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2012-07-16 00:00:00', '3', '', null, '548996', '1219', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('252921', null, '110512-1', '2014-06-03 16:16:36', '0449', '符晓燕', null, '2014-01-22 00:00:00', '2014-06-03 16:16:36', 'IFSシステム保守作業 ', '110512-1', '', '', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2011-04-21 00:00:00', '3', 'IFS保守', null, '461023', '0207', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('259235', null, '131104-1-2', '2014-05-28 09:15:13', '0449', '符晓燕', null, '2014-02-13 00:00:00', '2014-05-28 09:15:13', '业务支援', '131104-1-2', '', '1.95', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-09-22 00:00:00', '3', '', null, '548996', '0803', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('264706', null, '130912-1-1', '2014-05-28 09:14:14', '0449', '符晓燕', null, '2014-02-28 00:00:00', '2014-05-28 09:14:14', '中国保险家移动资讯平台圈子功能开发', '130912-1-1', '3', '10', '', '', '-100', null, '30', null, null, null, '公司内部研发项目', '3', '10', '1', '0', '2013-09-06 00:00:00', '3', '需求分析~CT', null, '126300', '1225', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('352191', null, '120806-1-11', '2014-06-11 14:33:10', '0449', '符晓燕', null, '2014-04-02 00:00:00', '2014-06-11 14:33:10', '供需表IE升级对应', '120806-1-11', '', '0.65', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2014-03-14 00:00:00', '3', '', null, '548996', '0803', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('366845', null, '131216-1-1/3/5', '2014-06-03 16:32:18', '0449', '符晓燕', null, '2014-04-30 00:00:00', '2014-06-03 16:32:18', '皇御宠物上海派遣', '131216-1-1/3/5', '', '7', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-09-02 00:00:00', '1', '', null, '634670', '9001', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('402475', null, '130913-1-1/3', '2014-06-11 09:12:05', '0449', '符晓燕', null, '2014-02-11 00:00:00', '2014-06-11 09:12:05', 'i-CROP再構築', '130913-1-1', '0.51', '19.8', '', '', '54', null, '10', null, null, null, '项目委托', '0.43', '23', '1', '1', '2013-09-09 00:00:00', '3', 'PC~TT', null, '548996', '0155', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('425921', null, '130521-1-1', '2014-06-13 11:14:36', null, null, null, '2014-07-31 00:00:00', '2014-06-13 11:14:36', 'IPTV安卓开发', '130521-1-1', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2014-02-18 00:00:00', '1', null, null, '943553', '6000', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('490275', null, '140324-1-1', '2014-06-11 14:48:37', '0449', '符晓燕', null, '2014-04-01 00:00:00', '2014-06-11 14:48:37', 'iCMS系统Win7故障对应', '140324-1-1', '', '0.65', '', '', '84.6', null, '0', null, null, null, '项目委托', '', '0.2', '1', '1', '2014-03-24 00:00:00', '3', '问题调查及代码改修', null, '548996', '0190', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('495651', null, '140210-1-1', '2014-06-11 15:37:09', '0317', '黄丽嫦', null, '2014-03-28 00:00:00', '2014-06-11 15:37:09', '日立アーバン改修作業', '140210-1-1', '1.36', '4.42', '0.25', '', '42.5', null, '6', null, null, null, '项目委托', '1.28', '4.7', '1', '1', '2014-02-07 00:00:00', '3', '', null, '702229', '0856', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('524719', null, '140403-2-1/2', '2014-06-11 15:08:34', '0449', '符晓燕', null, '2014-03-31 00:00:00', '2014-06-11 15:08:34', 'SLIM　GTMCマルチクライアント切替対応（2014年3月分）', '140403-2', '0.01', '17.4', '', '', '61.2', null, '0.1', null, null, null, '项目委托', '0.01', '18', '1', '0', '2013-12-01 00:00:00', '3', '外部设计~系统测试', null, '548996', '0564', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('562037', null, '130723-1-1', '2014-06-03 16:37:42', '0449', '符晓燕', null, '2014-01-24 00:00:00', '2014-06-03 16:37:42', '客户关系管理 (CRM) 系统-上海微创', '130723-1-1', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-07-23 00:00:00', '1', '', null, '634670', '9001', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('570315', null, '091118-1-38/39', '2014-06-04 15:02:32', '0449', '符晓燕', null, '2014-02-26 00:00:00', '2014-06-04 15:02:32', 'ADWORLD農家台帳系统开发', '091118-1-38', '', '5.2', '0.15', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-02 00:00:00', '3', 'DD~CT', null, '723327', '0993', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('606390', null, '140326-1-1', '2014-06-16 08:56:10', null, null, null, '2014-05-16 00:00:00', '2014-06-16 08:56:10', 'i-Dealer广告管理系统', '140326-1-1', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2014-03-26 00:00:00', '0', null, null, '548996', '0803', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('628551', null, '131220-1-1', '2014-06-03 16:20:04', '0449', '符晓燕', null, '2014-01-28 00:00:00', '2014-06-03 16:20:04', '加油站管理系统', '131220-1-1', '', '3.1', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-12-13 00:00:00', '1', '', null, '634670', '9001', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('648346', null, '130402-1-29', '2014-06-13 16:05:34', '0317', '黄丽嫦', null, '2014-04-11 00:00:00', '2014-06-13 16:05:34', '次世代開発', '130402-1-29', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '0', '2014-02-07 00:00:00', '1', '', null, '548996', '1046', null, '', '', '');
INSERT INTO `infox_project_project` VALUES ('669576', null, '131219-1-1', '2014-05-28 09:15:07', '0449', '符晓燕', null, '2014-01-10 00:00:00', '2014-05-28 09:15:07', 'DLR车辆展示系统', '131219-1-1', '', '', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '0', '2013-11-16 00:00:00', '3', '', null, '548996', '1223', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('671169', null, '140214-1-1/2/3/4,140210-3-1', '2014-06-05 14:49:45', '0317', '黄丽嫦', null, '2014-03-31 00:00:00', '2014-06-05 14:49:45', 'eAD2収滞納', '140214-1-1', '2.7', '22.22', '0.15', '', '27.8', null, '60', null, null, null, '项目委托', '1.67', '35.9', '1', '1', '2014-01-01 00:00:00', '3', '项目设计~CT', null, '723327', '0817', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('675005', null, '120611-1-16，091118-1-38', '2014-06-04 15:05:56', '0449', '符晓燕', null, '2014-02-14 00:00:00', '2014-06-04 15:05:56', 'AD機能改善（料金共通）２月', '120611-1-16', '', '3.9', '0.15', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-16 00:00:00', '3', 'DD~CT', null, '723327', '0428', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('712974', null, '090923-1', '2014-06-09 13:02:03', '0317', '黄丽嫦', null, '2014-02-28 00:00:00', '2014-06-09 13:02:03', 'e-CRB系统应用维护', '090923-1', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-01-01 00:00:00', '3', '', null, '548996', '049', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('724633', null, '120611-1-18', '2014-06-11 15:38:35', '0317', '黄丽嫦', null, '2014-04-20 00:00:00', '2014-06-11 15:38:35', 'ADWORLD受益者(2014年３月リリース分)', '120611-1-18', '1.68', '2.8', '0.15', '', '39.1', null, '4.7', null, null, null, '项目委托', '0.85', '5.5', '1', '1', '2014-01-22 00:00:00', '1', '详细设计~CT', null, '723327', '1237', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('756231', null, '090923-2-91/090923-2-92', '2014-06-03 14:08:39', '0449', '符晓燕', null, '2014-03-28 00:00:00', '2014-06-03 14:08:39', '中古車e-ビジネスプラットフォーム改善に基づいてUMS側の改善開発', '090923-2', '0.98', '11.5', '', '', '51.1', null, '11.3', null, null, null, '项目委托', '1.07', '10.6', '1', '1', '2013-12-02 00:00:00', '3', '要件定义~TT', null, '548996', '0190', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('800184', null, '130919-1-2，120611-1-16', '2014-06-04 15:03:20', '0449', '符晓燕', null, '2014-02-21 00:00:00', '2014-06-04 15:03:20', 'ADWORLD福祉系统开发', '130919-1-2', '', '6.74', '0.20', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-10 00:00:00', '3', '詳細設計～ＵＴ', null, '723327', '0520', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('802759', null, '140115-1-1', '2014-06-11 14:45:34', '0449', '符晓燕', null, '2014-01-27 00:00:00', '2014-06-11 14:45:34', 'ADAM機能追加iOS７対応', '140115-1-1', '', '1.62', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-30 00:00:00', '3', '', null, '548996', '1046', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('806257', null, '101111-1-11', '2014-06-05 14:48:38', '0317', '黄丽嫦', null, '2014-04-30 00:00:00', '2014-06-05 14:48:38', '地域包括ケアＶ２．５対応作業', '101111-1-11', '2.55', '14', '0.25', '', '44.9', null, '35.7', null, null, null, '项目委托', '2.38', '15', '1', '1', '2013-12-02 00:00:00', '3', 'PG~UT', null, '702229', '0351', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('812153', null, '140117-1-1/2', '2014-06-11 15:36:42', '0317', '黄丽嫦', null, '2014-03-28 00:00:00', '2014-06-11 15:36:42', '営業支援システム改修', '140117-1-1', '1.47', '6.89', '0.25', '', '39', null, '10.12', null, null, null, '项目委托', '1.37', '7.4', '1', '1', '2014-01-27 00:00:00', '1', 'DD~CT', null, '702229', '0850', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('816385', null, '140418-1-1', '2014-06-16 08:53:50', null, null, null, '2014-04-30 00:00:00', '2014-06-16 08:53:50', '面向销售店管理系统APP的CRPM信息汇总数据接口开发', '140418-1-1', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2014-04-21 00:00:00', '0', null, null, '548996', '0190', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('828467', null, '130723-1-3/5', '2014-06-03 16:16:47', '0449', '符晓燕', null, '2014-04-12 00:00:00', '2014-06-03 16:16:47', '客户关系管理 (CRM) 系统2-上海微创', '130723-1-3/5', '', '4.24', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-11-24 00:00:00', '1', '', null, '634670', '9001', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('844509', null, '120731-1-14/15/16', '2014-06-04 13:52:55', '0449', '符晓燕', null, '2014-02-12 00:00:00', '2014-06-04 13:52:55', 'ADWORLD国民年金系统开发', '120731-1', '', '11.9', '0.15', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-02 00:00:00', '3', 'DD~CT', null, '723327', '1084', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('866112', null, '130307-1-3', '2014-06-11 15:34:35', '0317', '黄丽嫦', null, '2014-05-06 00:00:00', '2014-06-11 15:34:35', '事業計画システム追加開発', '130307-1-3', '3.55', '3.24', '0.2', '', '40', null, '11.51', null, null, null, '项目委托', '2.88', '4', '1', '0', '2014-02-17 00:00:00', '1', '案件调查，PC~CT', null, '723327', '0216', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('884747', null, '090831-1-6', '2014-06-09 16:35:00', '0317', '黄丽嫦', null, '2014-03-31 00:00:00', '2014-06-09 16:35:00', '住友林業開発案件_基本設計作成', '090831-1-6', '', '', '0.2', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-11-01 00:00:00', '1', '', null, '702229', '055', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('889055', null, '130913-1-5', '2014-06-11 14:28:48', '0449', '符晓燕', null, '2014-05-16 00:00:00', '2014-06-11 14:28:48', 'i-crop再构筑号口后对应', '130913-1-5', '2.78', '3.6', '', '', '56.9', null, '10', null, null, null, '项目委托', '3.23', '3.1', '1', '1', '2014-02-12 00:00:00', '3', 'BUG调查和对应', null, '548996', '0155', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('893834', null, '130912-1-2', '2014-06-04 15:52:21', '0317', '黄丽嫦', null, '2014-02-28 00:00:00', '2014-06-04 15:52:21', '移动资讯平台圈子产品化', '130912-1-2', '', '', '', '', '', null, '0', null, null, null, '项目委托', '', '', '0.5', '1', '2014-01-10 00:00:00', '3', '', null, '126300', '1225', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('919321', null, '130723-1-4', '2014-06-04 13:55:35', '0449', '符晓燕', null, '2014-04-02 00:00:00', '2014-06-04 13:55:35', '客户关系管理 (CRM) 系统-上海微创', '130723-1-4', '', '3', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2014-01-01 00:00:00', '1', '', null, '634670', '9001', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('922860', null, '131216-1-4', '2014-06-03 14:27:50', '0449', '符晓燕', null, '2014-05-31 00:00:00', '2014-06-03 14:27:50', '上海NTTData', '131216-1-4', '', '3.9', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-11-03 00:00:00', '1', '', null, '634670', '9001', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('944178', null, '130402-1-28', '2014-06-11 14:49:39', '0449', '符晓燕', null, '2014-03-28 00:00:00', '2014-06-11 14:49:39', '次世代開発_店舗展開', '130402-1-28', '', '0.66', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2014-02-24 00:00:00', '3', '', null, '548996', '1046', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('959815', null, '140324-1-2', '2014-06-16 08:50:04', null, null, null, '2014-04-09 00:00:00', '2014-06-16 08:50:04', 'i-CMS Windows7 VersionUpに伴う影響調査', '140324-1-2', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2014-03-25 00:00:00', '0', null, null, '548996', '0190', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('963078', null, '110727-2-4', '2014-06-11 15:35:40', '0317', '黄丽嫦', null, '2014-04-25 00:00:00', '2014-06-11 15:35:40', 'H26_04ハートフレンド改修対応', '110727-2-4', '2.46', '5.7', '0.35', '', '41.1', null, '14', null, null, null, '项目委托', '2.37', '5.9', '1', '1', '2014-02-11 00:00:00', '1', 'PC~UT', null, '702229', '0866', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('994809', null, '131209-1-1', '2014-06-10 13:29:31', '0449', '符晓燕', null, '2014-02-28 00:00:00', '2014-06-10 13:29:31', '日立粉末冶金様　資材システム開発', '131209-1-1', '1.10', '6.23', '0.25', '', '33.3', null, '6.36', null, null, null, '项目委托', '0.82', '8.3', '1', '1', '2013-12-12 00:00:00', '3', 'DD~CT', null, '702229', '0027', null, '', '1', '');

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
INSERT INTO `infox_sysmgr_emp` VALUES ('0001', 'johan', '1995-03-24', '2014-05-26 10:30:15', null, '', '3', null, 'johan@whizen.com', 'N', '一级', '2014-05-26 10:30:15', '', null, null, '12345678', '', null, '2002-07-21', '男', '0', 'Y', null, '梅傲寒', '0', '300199');
INSERT INTO `infox_sysmgr_emp` VALUES ('0007', 'linchaoquan', '2004-06-01', '2014-05-29 08:31:23', null, '', '3', null, 'linchaoquan@whizen.com', 'Y', '二级', '2014-05-29 08:31:23', '', null, null, '66521896', '', null, '2004-07-15', '男', '0', 'Y', null, '林超权', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0013', '722442822222456', '2004-06-01', '2014-05-15 10:23:21', null, null, '3', null, '722442822222456@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '41714065', null, null, '2004-07-15', '男', '0', 'Y', null, '黄海涛', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0027', 'lijia', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'lijia@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '46001546', null, null, '2005-08-01', '男', '0', 'Y', null, '李甲', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('003', 'wangmin', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'wangmin@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '47045645', null, null, '2005-07-04', '女', '0', 'Y', null, '王敏', '0', '682781');
INSERT INTO `infox_sysmgr_emp` VALUES ('0032', 'suweilai', '2005-06-01', '2014-05-23 09:48:52', null, '', '3', null, 'suweilai@whizen.com', 'Y', '一级', '2014-05-23 09:48:52', '', null, null, '10591663', '', null, '2005-08-01', '男', '0', 'Y', null, '苏炜来', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0050', 'xiaohaobo', '2002-06-01', '2014-05-30 09:39:21', null, '', '3', null, 'xiaohaobo@whizen.com', 'N', '二级', '2014-05-30 09:39:21', '', null, null, '62860458', '', null, '2002-07-21', '男', '0', 'Y', null, '肖浩波', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0052', '736462999397253', '2004-06-01', '2014-05-15 10:23:20', null, null, '3', null, '736462999397253@whizen.com', null, '一级', '2014-05-15 10:23:20', null, null, null, '50218953', null, null, '2004-08-01', '女', '0', 'Y', null, '陈建', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0053', 'christom', '2004-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'christom@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '89381928', null, null, '2004-08-01', '男', '0', 'Y', null, '谭建斌', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0067', 'huangyong', '2004-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huangyong@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '84329728', null, null, '2005-07-04', '男', '0', 'Y', null, '黄勇', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0070', 'jiangsihua', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'jiangsihua@whizen.com', null, '三级', '2014-05-15 10:23:16', null, null, null, '30086439', null, null, '2005-07-25', '男', '0', 'Y', null, '蒋思华', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0086', 'suxiaolan', '2003-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'suxiaolan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '12028423', null, null, '2006-01-24', '女', '0', 'Y', null, '苏肖兰', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0100', 'tanghaiyan', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'tanghaiyan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '44681476', null, null, '2006-03-27', '女', '0', 'Y', null, '唐海艳', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0119', '927493932823494', '2006-06-01', '2014-05-15 10:23:21', null, null, '3', null, '927493932823494@whizen.com', null, '三级', '2014-05-15 10:23:21', null, null, null, '50458580', null, null, '2006-08-01', '女', '0', 'Y', null, '段金余', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0137', 'songlingling', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'songlingling@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '27694070', null, null, '2006-08-01', '女', '0', 'Y', null, '宋玲玲', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0150', 'xuying', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xuying@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '65223027', null, null, '2006-08-01', '女', '0', 'Y', null, '徐滢', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0155', 'zhuweiyong', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zhuweiyong@whizen.com', null, '二级', '2014-06-09 12:14:30', null, null, null, '19820101', null, null, '2006-08-01', '男', '0', 'Y', null, '朱伟勇', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0160', '843852433143873', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, '843852433143873@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '15363435', null, null, '2006-08-01', '女', '0', 'Y', null, '周秀珍', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0183', 'yangchunhua', '2006-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'yangchunhua@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '21904611', null, null, '2006-08-01', '女', '0', 'Y', null, '杨春花', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0190', 'liguanjie', '2006-06-01', '2014-05-23 09:47:47', null, '', '3', null, 'liguanjie@whizen.com', 'Y', '二级', '2014-05-23 09:47:47', '', null, null, '54072800', '', null, '2006-08-01', '男', '0', 'Y', null, '李冠杰', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0197', 'zhushuxin', '2006-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'zhushuxin@whizen.com', null, '四级', '2014-05-26 16:55:42', null, null, null, '!@#$%^&*', null, null, '2006-08-01', '男', '0', 'Y', null, '朱树歆', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0201', 'wangchao', '2004-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'wangchao@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '94458695', null, null, '2006-11-14', '男', '0', 'Y', null, '王超', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('0207', 'liuyong', '2002-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'liuyong@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '85474244', null, null, '2007-04-16', '男', '0', 'Y', null, '刘永', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0215', 'xiaojun', '2006-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'xiaojun@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '04775681', null, null, '2007-05-07', '男', '0', 'Y', null, '肖俊', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0216', 'dongpengwu', '2004-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'dongpengwu@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '34229969', null, null, '2007-05-07', '男', '0', 'Y', null, '董鹏武', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0217', 'wangyang', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wangyang@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '58480699', null, null, '2007-05-07', '男', '0', 'Y', null, '汪扬', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0236', 'lizhixian', '2007-06-01', '2014-05-15 10:23:10', null, null, '3', null, 'lizhixian@whizen.com', null, '二级', '2014-05-29 09:22:13', null, null, null, 't5k9ojz*', null, null, '2007-07-02', '男', '0', 'Y', null, '李智贤', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0262', 'linqunyan', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'linqunyan@whizen.com', null, '二级', '2014-05-26 12:35:39', null, null, null, 'Lqy830617', null, null, '2007-07-02', '女', '0', 'Y', null, '林群艳', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0280', 'zhonghuifeng', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zhonghuifeng@whizen.com', null, '二级', '2014-06-09 08:52:33', null, null, null, 'Zh456123', null, null, '2007-07-02', '女', '0', 'Y', null, '钟惠凤', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0284', 'chenxidong', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'chenxidong@whizen.com', null, '三级', '2014-06-06 16:29:01', null, null, null, 'u-efcl6d', null, null, '2007-07-02', '男', '0', 'Y', null, '陈熙东', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0295', 'huangpengfei', '2007-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huangpengfei@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '76334024', null, null, '2007-07-02', '男', '0', 'Y', null, '黄鹏飞', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0301', 'liumin0301', '2006-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liumin0301@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '43809120', null, null, '2007-07-02', '女', '0', 'Y', null, '刘敏', '0', '400771');
INSERT INTO `infox_sysmgr_emp` VALUES ('0306', '925925812429766', '2007-06-01', '2014-05-15 10:23:26', null, null, '3', null, '925925812429766@whizen.com', null, '二级', '2014-05-15 10:23:26', null, null, null, '55229069', null, null, '2007-08-01', '男', '0', 'Y', null, '游魁良', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('031', 'wanglili', '2005-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'wanglili@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '66939960', null, null, '2005-08-01', '女', '0', 'Y', null, '王莉莉', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0314', 'liuyu', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'liuyu@whizen.com', null, '二级', '2014-05-15 10:23:12', null, null, null, '47724656', null, null, '2007-08-01', '男', '0', 'Y', null, '刘裕', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0317', 'huanglichang', '2012-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huanglichang@whizen.com', null, '三级', '2014-05-15 11:06:19', null, null, null, 'zhujin8970', null, null, '2007-09-10', '女', '0', 'Y', null, '黄丽嫦', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0322', 'zhongjia', '2007-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhongjia@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '14607165', null, null, '2008-01-08', '女', '0', 'Y', null, '钟加', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0339', 'xuhongqi', '2002-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'xuhongqi@whizen.com', null, '一级', '2014-05-26 11:32:36', null, null, null, '200803xhq!', null, null, '2008-03-31', '女', '0', 'Y', null, '徐红齐', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('0342', 'liyan', '2001-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liyan@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '78555125', null, null, '2008-06-02', '女', '0', 'Y', null, '李艳', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('0348', 'liuting', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liuting@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '71723523', null, null, '2008-08-04', '女', '0', 'Y', null, '刘婷', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0351', '110677875073948', '2008-06-01', '2014-06-12 09:09:32', null, '', '3', null, '110677875073948@whizen.com', '', '二级', '2014-06-12 09:09:32', '2014-04-18', '3', null, null, '', null, '2008-08-04', '男', '0', 'Y', null, '李育安', '3', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0377', '808440644119771', '2011-06-30', '2014-05-15 10:23:25', null, null, '3', null, '808440644119771@whizen.com', null, '二级', '2014-05-15 10:23:25', null, null, null, '92167351', null, null, '2008-08-04', '男', '0', 'Y', null, '刘渊', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0394', 'liuwenyu', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liuwenyu@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '00603571', null, null, '2008-08-04', '男', '0', 'Y', null, '刘文育', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0413', 'zhenghui', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'zhenghui@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '96772572', null, null, '2008-08-04', '女', '0', 'Y', null, '郑惠', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0428', 'shenhao', '2007-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'shenhao@whizen.com', null, '三级', '2014-06-04 13:19:27', null, null, null, 'jint.1117', null, null, '2008-08-04', '男', '0', 'Y', null, '沈浩', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0449', 'fuxiaoyan', '2007-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'fuxiaoyan@whizen.com', null, '二级', '2014-05-26 11:12:08', null, null, null, 'whizen001', null, null, '2009-02-13', '女', '0', 'Y', null, '符晓燕', '0', '474835');
INSERT INTO `infox_sysmgr_emp` VALUES ('0452', 'xiayunhuan', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xiayunhuan@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '67795866', null, null, '2009-05-14', '女', '0', 'Y', null, '夏耘寰', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0453', 'lining', '2007-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'lining@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '86473446', null, null, '2009-07-01', '男', '0', 'Y', null, '李宁', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0456', 'zhangyuanying', '1998-06-30', '2014-05-28 16:27:51', null, '', '3', null, 'zhangyuanying@whizen.com', 'YY', '一级', '2014-05-28 16:27:51', '', null, null, '37606145', '', null, '2009-06-01', '女', '0', 'Y', null, '张元颖', '0', '886155');
INSERT INTO `infox_sysmgr_emp` VALUES ('0480', '572095720199521', '2009-06-01', '2014-05-15 10:23:23', null, null, '3', null, '572095720199521@whizen.com', null, '二级', '2014-05-15 10:23:23', null, null, null, '48211935', null, null, '2009-07-13', '男', '0', 'Y', null, '石元春', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('049', 'zhougang', '2004-06-01', '2014-05-23 09:04:36', null, '', '3', null, 'zhougang@whizen.com', 'YY', '一级', '2014-06-11 13:35:59', '', null, null, 'zGZg9796', '', null, '2004-09-15', '男', '0', 'Y', null, '周纲', '0', '917489');
INSERT INTO `infox_sysmgr_emp` VALUES ('0498', 'caojuan', '2009-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'caojuan@whizen.com', null, '三级', '2014-05-15 10:23:16', null, null, null, '35687276', null, null, '2009-07-13', '女', '0', 'Y', null, '曹娟', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('051', 'zhangruolin', '2004-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'zhangruolin@whizen.com', null, '三级', '2014-05-15 10:23:19', null, null, null, '35324521', null, null, '2004-08-01', '男', '0', 'Y', null, '张若林', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0520', 'yanghui', '2009-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'yanghui@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '85443305', null, null, '2009-07-13', '女', '0', 'Y', null, '杨辉', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0546', 'mochengzhang', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'mochengzhang@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '13268442', null, null, '2009-10-13', '男', '0', 'Y', null, '莫承长', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('055', 'luowen', '2003-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'luowen@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '39076491', null, null, '2006-01-01', '男', '0', 'Y', null, '罗文', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0559', 'zhangyuangong', '2006-06-01', '2014-05-29 08:30:23', null, '', '3', null, 'zhangyuangong@whizen.com', 'Y', '一级', '2014-05-29 08:30:23', '', null, null, '83347353', '', null, '2010-01-18', '男', '0', 'Y', null, '张元巩', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0562', 'huangyu', '2009-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huangyu@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '37031038', null, null, '2010-01-21', '男', '0', 'Y', null, '黄宇', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0564', 'hefei', '2003-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'hefei@whizen.com', null, '二级', '2014-05-26 13:42:33', null, null, null, 'abcd@123', null, null, '2010-03-09', '女', '0', 'Y', null, '贺飞', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0569', 'wanghui', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wanghui@whizen.com', null, '三级', '2014-06-06 16:32:15', null, null, null, '123123annA', null, null, '2010-03-22', '女', '0', 'Y', null, '王晖', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0577', '339321392651630', '2004-06-01', '2014-05-15 10:23:22', null, null, '3', null, '339321392651630@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '71629571', null, null, '2010-04-07', '男', '0', 'Y', null, '吴迪', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0579', 'houxiaohui', '2008-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'houxiaohui@whizen.com', null, '三级', '2014-05-15 10:23:12', null, null, null, '60689421', null, null, '2010-04-26', '女', '0', 'Y', null, '侯小慧', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0583', 'chenshunyin', '2005-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'chenshunyin@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '52111701', null, null, '2010-05-06', '男', '0', 'Y', null, '陈舜殷', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0588', 'suyi', '2004-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'suyi@whizen.com', null, '二级', '2014-05-15 10:23:19', null, null, null, '59917324', null, null, '2010-04-07', '男', '0', 'Y', null, '粟毅', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0590', 'yangmengping', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'yangmengping@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '30080725', null, null, '2010-07-02', '女', '0', 'Y', null, '杨孟平', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0601', 'jinyao', '2007-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'jinyao@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '46090411', null, null, '2010-05-14', '男', '0', 'Y', null, '金瑶', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0603', 'zhongzhichao', '2003-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zhongzhichao@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '13543750', null, null, '2010-05-17', '男', '0', 'Y', null, '钟智超', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0621', '582654094947692', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '582654094947692@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '36139071', null, null, '2010-07-05', '男', '0', 'Y', null, '邹志伟', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0624', 'liyue', '2010-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'liyue@whizen.com', null, '三级', '2014-05-26 11:51:40', null, null, null, 'Whizen029', null, null, '2010-07-02', '女', '0', 'Y', null, '李越', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0626', 'shisha', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'shisha@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '20211384', null, null, '2010-07-02', '女', '0', 'Y', null, '石莎', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0627', 'qinyaqiang', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'qinyaqiang@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '21977354', null, null, '2010-07-02', '男', '0', 'Y', null, '秦亚强', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0658', '586427680785499', '2010-06-01', '2014-05-15 10:23:24', null, null, '3', null, '586427680785499@whizen.com', null, '三级', '2014-05-15 10:23:24', null, null, null, '57634200', null, null, '2010-07-02', '女', '0', 'Y', null, '毛秋林', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0666', 'zhangning', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhangning@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '65007772', null, null, '2010-07-02', '男', '0', 'Y', null, '张宁', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0669', 'huangjiakui', '2010-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangjiakui@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '54854706', null, null, '2010-07-02', '男', '0', 'Y', null, '黄加魁', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0670', 'huanglindi', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huanglindi@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '00376935', null, null, '2010-07-02', '女', '0', 'Y', null, '黄林娣', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0671', 'zhouyuhan', '2010-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhouyuhan@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '60636650', null, null, '2010-07-02', '女', '0', 'Y', null, '周玉涵', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0674', 'duandehong', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'duandehong@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '67953903', null, null, '2010-07-02', '女', '0', 'Y', null, '段德红', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0675', 'huanghaiping', '2000-06-01', '2014-05-23 09:49:27', null, '', '3', null, 'huanghaiping@whizen.com', 'Y', '二级', '2014-05-23 09:49:27', '', null, null, '79728252', '', null, '2010-07-01', '女', '0', 'Y', null, '黄海萍', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0676', 'wangweibin', '2006-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'wangweibin@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '42956380', null, null, '2010-07-05', '男', '0', 'Y', null, '王伟滨', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0678', '451560194479268', '2010-06-01', '2014-05-15 10:23:20', null, null, '3', null, '451560194479268@whizen.com', null, '三级', '2014-05-15 10:23:20', null, null, null, '22708952', null, null, '2010-07-07', '男', '0', 'Y', null, '游洪鑫', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0679', 'huangweicong', '2007-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangweicong@whizen.com', null, '二级', '2014-06-13 09:18:55', null, null, null, 'cosmos1231', null, null, '2010-07-12', '男', '0', 'Y', null, '黄炜聪', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0681', 'wangzhiqing', '2007-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wangzhiqing@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '24565031', null, null, '2010-07-13', '女', '0', 'Y', null, '王志青', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0684', 'chenruiting', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'chenruiting@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '37967335', null, null, '2010-07-21', '男', '0', 'Y', null, '陈瑞庭', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0694', 'luweiniu', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'luweiniu@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '27892010', null, null, '2010-10-08', '男', '0', 'Y', null, '卢炜钮', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0696', 'lanyuping', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'lanyuping@whizen.com', null, '一级', '2014-05-15 10:23:19', null, null, null, '46809289', null, null, '2010-10-18', '女', '0', 'Y', null, '蓝宇萍', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0704', '834683666139373', '1999-06-01', '2014-05-15 10:23:22', null, null, '3', null, '834683666139373@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '73404266', null, null, '2010-12-01', '女', '0', 'Y', null, '袁俏', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0714', 'wangchengwen', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'wangchengwen@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '64569818', null, null, '2010-12-23', '男', '0', 'Y', null, '王成文', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0715', 'wangjunjun', '2011-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'wangjunjun@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '01790225', null, null, '2011-07-04', '女', '0', 'Y', null, '王俊俊', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0718', 'yinli', '2009-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'yinli@whizen.com', null, '四级', '2014-06-03 14:07:15', null, null, null, 'yinli1989', null, null, '2010-12-23', '女', '0', 'Y', null, '尹莉', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0721', 'dengliwei', '2008-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'dengliwei@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '36884835', null, null, '2011-01-05', '男', '0', 'Y', null, '邓立伟', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0730', '356947493646265', '2008-06-01', '2014-05-15 10:23:22', null, null, '3', null, '356947493646265@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '95772151', null, null, '2011-03-03', '男', '0', 'Y', null, '宋祖超', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0734', '365737461534190', '2007-06-01', '2014-05-15 10:23:21', null, null, '3', null, '365737461534190@whizen.com', null, '一级', '2014-05-15 10:23:21', null, null, null, '67824773', null, null, '2011-03-14', '男', '0', 'Y', null, '龚朝晖', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0735', '821360403370616', '2011-06-01', '2014-05-15 10:23:24', null, null, '3', null, '821360403370616@whizen.com', null, '三级', '2014-05-15 10:23:24', null, null, null, '84248839', null, null, '2011-07-04', '男', '0', 'Y', null, '杨玉', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0738', 'huangguorong', '1980-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'huangguorong@whizen.com', null, '--', '2014-05-15 10:23:18', null, null, null, '39028680', null, null, '2011-03-28', '男', '0', 'Y', null, '黄国荣', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('0741', 'liang', '2009-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'liang@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '06721551', null, null, '2011-04-01', '男', '0', 'Y', null, '李昂', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0747', 'wubaojie', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'wubaojie@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '04023002', null, null, '2011-04-11', '男', '0', 'Y', null, '吴保杰', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0748', 'chengpeng', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'chengpeng@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '18317417', null, null, '2011-04-11', '男', '0', 'Y', null, '程鹏', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0749', 'zouke', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'zouke@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '79544421', null, null, '2011-04-11', '男', '0', 'Y', null, '邹科', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0752', 'denglixian', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'denglixian@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '06924526', null, null, '2011-05-09', '女', '0', 'Y', null, '邓丽贤', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0753', 'pengyao', '2010-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'pengyao@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '24439415', null, null, '2011-05-24', '男', '0', 'Y', null, '彭尧', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0755', 'zhushaofeng', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'zhushaofeng@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '18685259', null, null, '2011-06-07', '女', '0', 'Y', null, '朱韶峰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0757', 'xuwubin', '2006-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'xuwubin@whizen.com', null, '三级', '2014-05-15 10:23:14', null, null, null, '23381096', null, null, '2011-06-13', '女', '0', 'Y', null, '徐五斌', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0790', '649092515336255', '2011-06-20', '2014-05-15 10:23:21', null, null, '3', null, '649092515336255@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '56722609', null, null, '2011-06-20', '男', '0', 'Y', null, '洪学臣', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0792', 'luzhijun', '2011-06-30', '2014-05-15 10:23:19', null, null, '3', null, 'luzhijun@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '20970906', null, null, '2011-07-04', '男', '0', 'Y', null, '鲁智君', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('0793', 'luoqiyu', '2011-07-01', '2014-05-15 10:23:17', null, null, '3', null, 'luoqiyu@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '83708465', null, null, '2011-07-04', '男', '0', 'Y', null, '罗奇郁', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0795', '060057331833599', '2011-06-20', '2014-05-15 10:23:21', null, null, '3', null, '060057331833599@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '13272910', null, null, '2011-06-20', '男', '0', 'Y', null, '李永栋', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0801', 'lanyan', '2006-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'lanyan@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '37679574', null, null, '2006-08-01', '女', '0', 'Y', null, '蓝艳', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0803', 'yaolihua', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'yaolihua@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '10425174', null, null, '2006-08-01', '女', '0', 'Y', null, '姚利花', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0806', 'duanxiaolin', '2006-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'duanxiaolin@whizen.com', null, '一级', '2014-05-15 10:23:13', null, null, null, '06767818', null, null, '2006-08-01', '男', '0', 'Y', null, '段小林', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0809', 'fangjinzhong', '2006-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'fangjinzhong@whizen.com', null, '一级', '2014-05-15 10:23:11', null, null, null, '06312263', null, null, '2006-08-01', '男', '0', 'Y', null, '方进忠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0811', '547551564084666', '2006-06-01', '2014-05-15 10:23:21', null, null, '3', null, '547551564084666@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '83438756', null, null, '2006-08-01', '男', '0', 'Y', null, '向宁', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0814', '283992502327268', '2006-06-01', '2014-05-15 10:23:22', null, null, '3', null, '283992502327268@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '31999800', null, null, '2006-08-01', '男', '0', 'Y', null, '林青', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0817', 'lichao', '2006-06-01', '2014-05-23 09:49:10', null, '', '3', null, 'lichao@whizen.com', 'Y', '一级', '2014-05-28 08:42:40', '', null, null, 'whizen0817', '', null, '2006-08-01', '男', '0', 'Y', null, '李超', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0818', 'jiangbo', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'jiangbo@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '93602466', null, null, '2006-08-01', '男', '0', 'Y', null, '姜波', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0823', 'pengyun', '2006-06-01', '2014-05-30 09:38:23', null, '', '3', null, 'pengyun@whizen.com', 'Y', '一级', '2014-05-30 09:38:23', '', null, null, '67224653', '', null, '2006-08-01', '男', '0', 'Y', null, '彭昀', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0850', 'panxisheng', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'panxisheng@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '37782105', null, null, '2006-08-01', '男', '0', 'Y', null, '潘熙圣', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0853', 'chendanxi', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'chendanxi@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '69727104', null, null, '2006-08-01', '男', '0', 'Y', null, '陈丹樨', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0854', 'chentengji', '2006-06-01', '2014-05-29 08:30:47', null, '', '3', null, 'chentengji@whizen.com', 'YY', '一级', '2014-06-03 15:07:40', '', null, null, '2002301303', '', null, '2006-08-01', '男', '0', 'Y', null, '陈腾记', '0', '188927');
INSERT INTO `infox_sysmgr_emp` VALUES ('0855', 'xuchongjin', '2006-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'xuchongjin@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '32971098', null, null, '2006-08-01', '男', '0', 'Y', null, '许崇锦', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0856', 'zhengshuxi', '2006-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'zhengshuxi@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '31455809', null, null, '2006-08-01', '男', '0', 'Y', null, '郑曙熹', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0858', '086971762587780', '2006-06-01', '2014-05-15 10:23:22', null, null, '3', null, '086971762587780@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '38547459', null, null, '2006-08-01', '男', '0', 'Y', null, '伍铭思', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0860', 'xiongliuhua', '2006-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'xiongliuhua@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '87456591', null, null, '2006-08-01', '女', '0', 'Y', null, '熊柳华', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0861', 'zhanglin', '2006-07-01', '2014-05-29 10:57:53', null, null, '3', null, 'zhanglin@whizen.com', null, '一级', '2014-05-29 10:57:53', null, null, null, '57972543', null, null, '2013-11-01', '男', '0', 'Y', null, '張林', '0', '203102');
INSERT INTO `infox_sysmgr_emp` VALUES ('0866', 'fengying', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'fengying@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '92902409', null, null, '2007-08-29', '女', '0', 'Y', null, '冯英', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0868', 'huangyong0868', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'huangyong0868@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '92315824', null, null, '2007-08-29', '男', '0', 'Y', null, '黄勇2', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0869', '017711857683321', '2007-06-20', '2014-05-15 10:23:21', null, null, '3', null, '017711857683321@whizen.com', null, '一级', '2014-05-15 10:23:21', null, null, null, '67182170', null, null, '2007-08-29', '男', '0', 'Y', null, '吕军', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0876', 'laohanye', '2007-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'laohanye@whizen.com', null, '一级', '2014-05-15 10:23:12', null, null, null, '50283579', null, null, '2007-08-29', '男', '0', 'Y', null, '劳汉业', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0883', 'heweixin', '2007-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'heweixin@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '50906130', null, null, '2007-08-29', '男', '0', 'Y', null, '何伟新', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0887', 'chenyouxing', '2007-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'chenyouxing@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '62299135', null, null, '2007-08-29', '男', '0', 'Y', null, '陈有兴', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0895', '214133904944328', '2007-06-01', '2014-05-15 10:23:21', null, null, '3', null, '214133904944328@whizen.com', null, '二级', '2014-05-15 10:23:21', null, null, null, '46346346', null, null, '2007-08-29', '男', '0', 'Y', null, '罗振坤', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('0920', 'lukui', '2011-06-20', '2014-05-15 10:23:15', null, null, '3', null, 'lukui@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '44805723', null, null, '2011-07-04', '男', '0', 'Y', null, '陆魁', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0921', 'liuhui0921', '2011-06-22', '2014-05-15 10:23:15', null, null, '3', null, 'liuhui0921@whizen.com', null, '三级', '2014-05-15 10:23:15', null, null, null, '34264545', null, null, '2011-07-04', '男', '0', 'Y', null, '刘辉', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('0931', '628458873399359', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '628458873399359@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '43749646', null, null, '2011-07-04', '女', '0', 'Y', null, '汪丽平', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0936', 'kangfuhua', '2011-06-25', '2014-05-15 10:23:13', null, null, '3', null, 'kangfuhua@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '78048362', null, null, '2011-07-04', '男', '0', 'Y', null, '康富华', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0938', 'xiaoshaohai', '2011-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'xiaoshaohai@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '76706841', null, null, '2011-06-22', '男', '0', 'Y', null, '肖少海', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0950', '101552793868886', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '101552793868886@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '22401995', null, null, '2011-06-22', '女', '0', 'Y', null, '周意', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('0966', 'wushun', '2011-06-22', '2014-05-15 10:23:17', null, null, '3', null, 'wushun@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '54883056', null, null, '2011-07-04', '男', '0', 'Y', null, '吴顺', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('0970', '906830770527898', '2011-06-22', '2014-05-15 10:23:20', null, null, '3', null, '906830770527898@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '96005110', null, null, '2011-07-04', '女', '0', 'Y', null, '李银凤', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0971', '746941880044575', '2011-06-22', '2014-05-15 10:23:21', null, null, '3', null, '746941880044575@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '53058427', null, null, '2011-07-04', '女', '0', 'Y', null, '吴虹莉', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0974', '468951682278813', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '468951682278813@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '07845879', null, null, '2011-07-04', '女', '0', 'Y', null, '杨足霞', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('098', 'liuqinghai', '2001-06-01', '2014-05-15 10:23:10', null, null, '3', null, 'liuqinghai@whizen.com', null, '二级', '2014-06-04 08:56:28', null, null, null, '1qaz1qaz', null, null, '2006-03-02', '男', '0', 'Y', null, '刘青海', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0985', '184349626058927', '2011-06-01', '2014-05-15 10:23:25', null, null, '3', null, '184349626058927@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '91923322', null, null, '2011-07-04', '女', '0', 'Y', null, '谢羽', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('0990', 'lingshouming', '2008-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'lingshouming@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '73877438', null, null, '2011-07-14', '男', '0', 'Y', null, '凌受铭', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('0993', 'xiaoweihua', '2009-06-30', '2014-05-15 10:23:11', null, null, '3', null, 'xiaoweihua@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '41979745', null, null, '2011-07-20', '男', '0', 'Y', null, '肖卫华', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('0994', 'huangshijue', '2005-06-20', '2014-05-15 10:23:15', null, null, '3', null, 'huangshijue@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '03212105', null, null, '2011-07-25', '女', '0', 'Y', null, '黄仕珏', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1000', 'liping', '2009-06-25', '2014-05-15 10:23:18', null, null, '3', null, 'liping@whizen.com', null, '四级', '2014-05-15 10:23:18', null, null, null, '54508431', null, null, '2011-08-22', '女', '0', 'Y', null, '李萍', '0', '853418');
INSERT INTO `infox_sysmgr_emp` VALUES ('1003', '866808676842773', '2009-06-30', '2014-05-15 10:23:22', null, null, '3', null, '866808676842773@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '82475009', null, null, '2011-08-29', '男', '0', 'Y', null, '廖果', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1004', 'lizhiyong', '2007-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'lizhiyong@whizen.com', null, '二级', '2014-05-15 10:23:15', null, null, null, '21699481', null, null, '2011-09-01', '男', '0', 'Y', null, '李智勇', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1015', 'liujiajun', '2011-07-10', '2014-05-15 10:23:14', null, null, '3', null, 'liujiajun@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '94456315', null, null, '2011-10-08', '男', '0', 'Y', null, '刘加俊', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1022', 'lilixia', '2008-07-01', '2014-05-15 10:23:14', null, null, '3', null, 'lilixia@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '96994877', null, null, '2011-10-28', '女', '0', 'Y', null, '李丽霞', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1027', '756572054097161', '2009-06-30', '2014-05-15 10:23:21', null, null, '3', null, '756572054097161@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '03327074', null, null, '2011-11-02', '男', '0', 'Y', null, '张俊林', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1028', 'chenzhenrui', '2008-06-25', '2014-05-15 10:23:14', null, null, '3', null, 'chenzhenrui@whizen.com', null, '四级', '2014-05-15 10:23:14', null, null, null, '65655027', null, null, '2011-11-03', '男', '0', 'Y', null, '陈振锐', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1034', 'wangxitao', '2011-06-30', '2014-05-15 10:23:13', null, null, '3', null, 'wangxitao@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '60754863', null, null, '2011-11-03', '男', '0', 'Y', null, '王细桃', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1039', 'yanghaoquan', null, '2014-05-26 08:58:45', null, '', '3', null, 'yanghaoquan@whizen.com', 'N', '', '2014-05-26 08:58:45', '', null, null, '123456', '', null, '2012-11-18', '男', '0', 'Y', null, '杨浩泉', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1046', 'cenlijian', '2003-07-01', '2014-05-15 10:23:14', null, null, '3', null, 'cenlijian@whizen.com', null, '二级', '2014-05-15 10:23:14', null, null, null, '02565828', null, null, '2011-11-18', '男', '0', 'Y', null, '岑礼健', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1054', '759334536020130', '2005-06-30', '2014-05-15 10:23:22', null, null, '3', null, '759334536020130@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '80481003', null, null, '2011-12-12', '男', '0', 'Y', null, '黄勇钦', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1059', 'ganjiawei', '2010-07-01', '2014-05-15 10:23:16', null, null, '3', null, 'ganjiawei@whizen.com', null, '一级', '2014-05-15 10:23:16', null, null, null, '27624384', null, null, '2011-12-15', '男', '0', 'Y', null, '甘嘉炜', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1060', 'zhangjushuang', '2008-06-30', '2014-05-15 10:23:11', null, null, '3', null, 'zhangjushuang@whizen.com', null, '四级', '2014-05-30 10:02:07', null, null, null, 'zhang_123', null, null, '2011-12-21', '男', '0', 'Y', null, '张居爽', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1061', 'zengshuxiong', '2004-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'zengshuxiong@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '85505886', null, null, '2012-01-04', '男', '0', 'Y', null, '曾树雄', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1063', 'huanghe', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huanghe@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '01830045', null, null, '2012-07-02', '男', '0', 'Y', null, '黄河', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1064', '439651385483875', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '439651385483875@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '82413730', null, null, '2012-07-02', '男', '0', 'Y', null, '黄权盛', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1065', '486020925167589', '2012-06-01', '2014-05-15 10:23:21', null, null, '3', null, '486020925167589@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '51446176', null, null, '2012-07-02', '女', '0', 'Y', null, '邓洁', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1067', 'chengang1067', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'chengang1067@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '08844726', null, null, '2012-07-02', '男', '0', 'Y', null, '陈刚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1068', 'zhangyuxiang', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'zhangyuxiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '32221690', null, null, '2012-07-02', '男', '0', 'Y', null, '张玉祥', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1071', 'liuweijuan', '2012-06-03', '2014-05-15 10:23:12', null, null, '3', null, 'liuweijuan@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '49054861', null, null, '2012-07-02', '女', '0', 'Y', null, '刘伟娟', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1072', '685874772596027', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '685874772596027@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '18564387', null, null, '2012-07-02', '男', '0', 'Y', null, '张智峰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1073', '736381692509911', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '736381692509911@whizen.com', null, '一级', '2014-05-15 10:23:25', null, null, null, '97681909', null, null, '2012-07-02', '女', '0', 'Y', null, '余沁芸', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1074', '619350611951664', '2012-06-01', '2014-05-15 10:23:26', null, null, '3', null, '619350611951664@whizen.com', null, '三级', '2014-05-15 10:23:26', null, null, null, '89879417', null, null, '2012-07-02', '女', '0', 'Y', null, '胡珊珊', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1079', 'chenya', '2012-06-02', '2014-05-15 10:23:12', null, null, '3', null, 'chenya@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '56726137', null, null, '2012-07-02', '男', '0', 'Y', null, '陈亚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1082', 'zhouyaogao', '2012-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'zhouyaogao@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '84583949', null, null, '2012-07-02', '男', '0', 'Y', null, '周耀高', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1084', 'yexiaomeng', '2008-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'yexiaomeng@whizen.com', null, '二级', '2014-05-15 10:23:11', null, null, null, '51072264', null, null, '2012-02-07', '女', '0', 'Y', null, '叶晓梦', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1097', 'wuxiaoming', '2012-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'wuxiaoming@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '07934693', null, null, '2012-07-02', '男', '0', 'Y', null, '吴晓明', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1099', '221805663251279', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '221805663251279@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '09252386', null, null, '2012-07-02', '男', '0', 'Y', null, '叶秦泰', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1101', 'songqiaohong', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'songqiaohong@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '94045783', null, null, '2012-07-02', '女', '0', 'Y', null, '宋巧红', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1104', 'chenjiansheng', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'chenjiansheng@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '71177303', null, null, '2012-07-02', '男', '0', 'Y', null, '陈剑盛', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1108', '844962744819641', '2012-06-01', '2014-05-15 10:23:21', null, null, '3', null, '844962744819641@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '96156563', null, null, '2012-07-02', '男', '0', 'Y', null, '唐亚军', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1109', 'yuguihong', '2009-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'yuguihong@whizen.com', null, '一级', '2014-06-06 16:42:19', null, null, null, '123456789', null, null, '2012-02-21', '女', '0', 'Y', null, '余桂虹', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1110', 'xiongkun', '2010-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xiongkun@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '47449454', null, null, '2012-02-27', '男', '0', 'Y', null, '熊坤', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1112', '510453219237197', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '510453219237197@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '83897191', null, null, '2012-07-02', '男', '0', 'Y', null, '林铿鸿', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1113', '702438683314788', '2010-06-01', '2014-05-15 10:23:22', null, null, '3', null, '702438683314788@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '51336932', null, null, '2012-03-01', '男', '0', 'Y', null, '李林', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1117', 'xiaozhiguang', '2010-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'xiaozhiguang@whizen.com', null, '一级', '2014-05-15 10:23:14', null, null, null, '19255387', null, null, '2012-03-28', '男', '0', 'Y', null, '肖智广', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1121', '465876626090197', '2002-07-01', '2014-05-15 10:23:22', null, null, '3', null, '465876626090197@whizen.com', null, '一级', '2014-05-15 10:23:22', null, null, null, '81514101', null, null, '2012-05-02', '女', '0', 'Y', null, '张新', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1122', '903398759319908', '2009-07-10', '2014-05-15 10:23:21', null, null, '3', null, '903398759319908@whizen.com', null, '三级', '2014-05-15 10:23:21', null, null, null, '73571258', null, null, '2012-05-02', '男', '0', 'Y', null, '熊良华', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1127', '333035092357440', '2006-06-28', '2014-05-15 10:23:22', null, null, '3', null, '333035092357440@whizen.com', null, '三级', '2014-05-15 10:23:22', null, null, null, '50068632', null, null, '2012-06-04', '男', '0', 'Y', null, '余旺盛', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1132', '563895346935199', '2012-06-26', '2014-05-15 10:23:21', null, null, '3', null, '563895346935199@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '69648924', null, null, '2012-07-02', '男', '0', 'Y', null, '李成臣', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1145', 'yinzhilan', '2012-06-02', '2014-05-15 10:23:12', null, null, '3', null, 'yinzhilan@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '89082565', null, null, '2012-07-02', '女', '0', 'Y', null, '尹芝兰', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1149', 'zouguangchu', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'zouguangchu@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '79067487', null, null, '2012-07-02', '男', '0', 'Y', null, '邹广初', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1150', 'wengkaikeng', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'wengkaikeng@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '01380075', null, null, '2012-07-02', '男', '0', 'Y', null, '翁开铿', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1151', '228557429041864', '2010-06-01', '2014-05-15 10:23:24', null, null, '3', null, '228557429041864@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '35734513', null, null, '2012-07-02', '男', '0', 'Y', null, '梁翠龙', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1152', '706643793905698', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '706643793905698@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '07841320', null, null, '2012-07-02', '男', '0', 'Y', null, '唐俊', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1156', 'huangsen', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'huangsen@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '25552207', null, null, '2012-07-02', '男', '0', 'Y', null, '黄森', '1', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1158', '272046674368358', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '272046674368358@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '83007658', null, null, '2012-07-02', '男', '0', 'Y', null, '李正宗', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1159', 'jiangwenping', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'jiangwenping@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '83779774', null, null, '2012-07-02', '女', '0', 'Y', null, '蒋文萍', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1163', '590050039223152', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '590050039223152@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '71002115', null, null, '2012-07-02', '男', '0', 'Y', null, '郑贵庭', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1170', 'zhengshasha', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'zhengshasha@whizen.com', null, '一级', '2014-05-15 10:23:17', null, null, null, '29122112', null, null, '2012-07-02', '女', '0', 'Y', null, '郑沙沙', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1172', 'longjianfeng', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'longjianfeng@whizen.com', null, '四级', '2014-05-15 10:23:17', null, null, null, '52451517', null, null, '2012-07-02', '男', '0', 'Y', null, '龙建锋', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1174', '972607852431780', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '972607852431780@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '64730189', null, null, '2012-07-02', '女', '0', 'Y', null, '刘菊容', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1175', '035614183947184', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '035614183947184@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '22799139', null, null, '2012-07-02', '女', '0', 'Y', null, '刘文芳', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1176', '861588479053442', '2012-06-01', '2014-05-15 10:23:20', null, null, '3', null, '861588479053442@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '80461996', null, null, '2012-07-02', '女', '0', 'Y', null, '汪丽芬', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1178', 'xianian', '2012-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xianian@whizen.com', null, '四级', '2014-05-15 10:23:13', null, null, null, '60524974', null, null, '2012-07-02', '女', '0', 'Y', null, '夏念', '1', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1179', '286066522504066', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '286066522504066@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '91439038', null, null, '2012-07-02', '男', '0', 'Y', null, '周蔚', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1183', '466260175588736', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '466260175588736@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '63787519', null, null, '2012-07-02', '女', '0', 'Y', null, '王丹', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1184', '024768317547003', '2012-06-01', '2014-05-15 10:23:23', null, null, '3', null, '024768317547003@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '72397531', null, null, '2012-07-02', '女', '0', 'Y', null, '袁小利', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1186', '665001596072570', '2012-06-01', '2014-05-15 10:23:25', null, null, '3', null, '665001596072570@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '46190100', null, null, '2012-07-02', '男', '0', 'Y', null, '何云文', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1191', '549311601674713', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '549311601674713@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '79779812', null, null, '2012-07-02', '女', '0', 'Y', null, '刘慧', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1192', 'xuxiaoshuang', '2012-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'xuxiaoshuang@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '62633561', null, null, '2012-07-02', '女', '0', 'Y', null, '许小双', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1193', '526490333174704', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '526490333174704@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '83104028', null, null, '2012-07-02', '女', '0', 'Y', null, '甘佳美', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1195', '429884507556290', '2012-06-01', '2014-05-15 10:23:24', null, null, '3', null, '429884507556290@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '28389815', null, null, '2012-07-02', '男', '0', 'Y', null, '王石峰', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1206', 'chenjiawen', '2012-06-01', '2014-05-15 10:23:17', null, null, '3', null, 'chenjiawen@whizen.com', null, '三级', '2014-05-15 10:23:17', null, null, null, '87154848', null, null, '2012-07-10', '女', '0', 'Y', null, '陈嘉雯', '1', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1207', '362243823823655', '2009-06-01', '2014-05-15 10:23:20', null, null, '3', null, '362243823823655@whizen.com', null, '二级', '2014-05-15 10:23:20', null, null, null, '97275252', null, null, '2012-07-16', '女', '0', 'Y', null, '谢洁', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1208', 'pijingjing', '2009-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'pijingjing@whizen.com', null, '四级', '2014-05-15 10:23:19', null, null, null, '48576764', null, null, '2010-03-29', '男', '0', 'Y', null, '皮晶晶', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1211', '078863833959753', '2009-06-01', '2014-05-15 10:23:26', null, null, '3', null, '078863833959753@whizen.com', null, '四级', '2014-05-15 10:23:26', null, null, null, '21936656', null, null, '2012-08-20', '男', '0', 'Y', null, '谢贝', '1', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1212', 'chenjialiang', '2007-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'chenjialiang@whizen.com', null, '三级', '2014-06-05 09:35:07', null, null, null, 'Heero1985', null, null, '2012-08-27', '男', '0', 'Y', null, '陈嘉亮', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1214', '718949706965960', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '718949706965960@whizen.com', null, '三级', '2014-05-15 10:23:25', null, null, null, '34438170', null, null, '2012-09-03', '男', '0', 'Y', null, '曾志慧', '0', '702229');
INSERT INTO `infox_sysmgr_emp` VALUES ('1215', 'kongheng', '2009-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'kongheng@whizen.com', null, '三级', '2014-05-15 10:23:13', null, null, null, '32821346', null, null, '2012-09-04', '女', '0', 'Y', null, '孔恒', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1219', '423499445534009', '2004-06-01', '2014-05-15 10:23:26', null, null, '3', null, '423499445534009@whizen.com', null, '三级', '2014-05-15 10:23:26', null, null, null, '96626799', null, null, '2012-09-25', '男', '0', 'Y', null, '向国华', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1220', 'lvjieqiang', '2010-06-01', '2014-05-15 10:23:11', null, null, '3', null, 'lvjieqiang@whizen.com', null, '三级', '2014-05-15 10:23:11', null, null, null, '26436819', null, null, '2012-09-30', '男', '0', 'Y', null, '吕杰强', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1223', 'zhangguofu', '2000-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'zhangguofu@whizen.com', null, '一级', '2014-05-15 10:23:15', null, null, null, '25793515', null, null, '2012-10-31', '男', '0', 'Y', null, '张国富', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1225', 'huangteng', '2008-06-01', '2014-05-15 10:23:15', null, null, '3', null, 'huangteng@whizen.com', null, '四级', '2014-05-15 10:23:15', null, null, null, '28278582', null, null, '2012-11-12', '男', '0', 'Y', null, '黄腾', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1233', '299557110714390', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '299557110714390@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '64036684', null, null, '2013-07-01', '女', '0', 'Y', null, '卢巧云', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1234', 'fangjingtao', '2008-06-01', '2014-05-15 10:23:12', null, null, '3', null, 'fangjingtao@whizen.com', null, '三级', '2014-05-15 10:23:12', null, null, null, '84335095', null, null, '2013-04-01', '男', '0', 'Y', null, '方敬涛', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1236', 'tangxingxing', '2012-06-04', '2014-05-15 10:23:12', null, null, '3', null, 'tangxingxing@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '03986121', null, null, '2013-04-22', '男', '0', 'Y', null, '唐星星', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1237', '252542090846230', '2010-06-01', '2014-05-15 10:23:25', null, null, '3', null, '252542090846230@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '48933487', null, null, '2013-05-08', '男', '0', 'Y', null, '明玄宇', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1239', 'huyiwen', '2006-06-01', '2014-05-15 10:23:19', null, null, '3', null, 'huyiwen@whizen.com', null, '二级', '2014-05-15 10:23:19', null, null, null, '57533578', null, null, '2013-07-01', '男', '0', 'Y', null, '胡义文', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1240', 'huoniuyi', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'huoniuyi@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '94952337', null, null, '2013-09-02', '男', '0', 'Y', null, '霍牛义', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1243', '075837812956962', '2013-06-01', '2014-05-15 10:23:25', null, null, '3', null, '075837812956962@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '29161729', null, null, '2013-09-02', '男', '0', 'Y', null, '彭莉平', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1245', '806703464832914', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '806703464832914@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '51162674', null, null, '2013-09-02', '男', '0', 'Y', null, '李俊', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1246', '461172630767311', '2013-06-01', '2014-05-15 10:23:21', null, null, '3', null, '461172630767311@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '87309845', null, null, '2013-09-02', '男', '0', 'Y', null, '原海南', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1247', '611031529642153', '2013-06-01', '2014-05-15 10:23:25', null, null, '3', null, '611031529642153@whizen.com', null, '四级', '2014-05-15 10:23:25', null, null, null, '12185473', null, null, '2013-09-02', '男', '0', 'Y', null, '杨万鹏', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1250', '098689418182626', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '098689418182626@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '05701280', null, null, '2013-09-02', '男', '0', 'Y', null, '黄熹舟', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1255', 'pengjianwei', '2013-06-01', '2014-05-26 08:42:04', null, '', '3', null, 'pengjianwei@whizen.com', 'N', '四级', '2014-05-26 08:42:04', '', null, null, '45600790', '', null, '2013-09-01', '男', '0', 'Y', null, '彭建威', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1257', '092874999728345', '2013-06-01', '2014-05-15 10:23:26', null, null, '3', null, '092874999728345@whizen.com', null, '一级', '2014-05-15 10:23:26', null, null, null, '94694846', null, null, '2013-09-02', '女', '0', 'Y', null, '胡璐瑶', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1260', 'luoling', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'luoling@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '17026594', null, null, '2013-09-02', '女', '0', 'Y', null, '罗玲', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1262', 'liuguanfu', '2013-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'liuguanfu@whizen.com', null, '四级', '2014-05-30 09:13:30', null, null, null, 'Liu102028', null, null, '2013-09-04', '男', '0', 'Y', null, '柳官富', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1263', '947518535580761', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '947518535580761@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '56957615', null, null, '2013-09-02', '男', '0', 'Y', null, '吴柯蓉', '0', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1264', 'qinguosheng', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'qinguosheng@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '40226211', null, null, '2013-09-02', '男', '0', 'Y', null, '覃国生', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1265', 'hechenxiang', '2013-07-01', '2014-05-15 10:23:20', null, null, '3', null, 'hechenxiang@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '81781608', null, null, '2013-09-02', '男', '0', 'Y', null, '何晨翔', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1268', '816179302511532', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '816179302511532@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '62205392', null, null, '2013-09-02', '男', '0', 'Y', null, '李龙德', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1269', 'wenzhaoming', '2013-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'wenzhaoming@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '89020025', null, null, '2013-09-02', '男', '0', 'Y', null, '文兆明', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1270', '840588725416150', '2013-06-01', '2014-05-15 10:23:24', null, null, '3', null, '840588725416150@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '93889232', null, null, '2013-09-02', '男', '0', 'Y', null, '覃信鸿', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1272', 'mohuiling', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'mohuiling@whizen.com', null, '四级', '2014-05-26 12:29:30', null, null, null, 'm,332641', null, null, '2013-09-02', '女', '0', 'Y', null, '莫慧玲', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1274', '291972936625814', '2013-07-01', '2014-05-15 10:23:24', null, null, '3', null, '291972936625814@whizen.com', null, '四级', '2014-05-15 10:23:24', null, null, null, '63824201', null, null, '2013-09-02', '男', '0', 'Y', null, '莫庭伟', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1275', 'xiemeifang', '2013-06-01', '2014-05-15 10:23:13', null, null, '3', null, 'xiemeifang@whizen.com', null, '四级', '2014-06-10 15:51:08', null, null, null, 'xiemeifang', null, null, '2013-09-02', '女', '0', 'Y', null, '谢美芳', '1', '398250');
INSERT INTO `infox_sysmgr_emp` VALUES ('1276', 'chenxiang', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'chenxiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '35314215', null, null, '2013-09-02', '女', '0', 'Y', null, '陈香', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1278', 'gaobeichen', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'gaobeichen@whizen.com', null, '四级', '2014-05-15 10:23:20', null, null, null, '30743920', null, null, '2013-09-02', '女', '0', 'Y', null, '高北晨', '0', '429710');
INSERT INTO `infox_sysmgr_emp` VALUES ('1280', '364780238971736', '2013-06-01', '2014-05-15 10:23:22', null, null, '3', null, '364780238971736@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '75773297', null, null, '2013-09-02', '男', '0', 'Y', null, '方钱', '0', '461023');
INSERT INTO `infox_sysmgr_emp` VALUES ('1282', 'yuhanxiang', '2013-06-01', '2014-05-15 10:23:16', null, null, '3', null, 'yuhanxiang@whizen.com', null, '四级', '2014-05-15 10:23:16', null, null, null, '90664848', null, null, '2013-09-02', '男', '0', 'Y', null, '余翰祥', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1283', '064933094339664', '2013-06-01', '2014-05-15 10:23:23', null, null, '3', null, '064933094339664@whizen.com', null, '四级', '2014-05-15 10:23:23', null, null, null, '10474817', null, null, '2013-09-02', '男', '0', 'Y', null, '贺关勇', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1285', '760084898314002', '2013-06-01', '2014-05-15 10:23:22', null, null, '3', null, '760084898314002@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '17181573', null, null, '2013-09-02', '女', '0', 'Y', null, '郑莹', '0', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1287', 'jiangjunqiang', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'jiangjunqiang@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '83916026', null, null, '2013-09-02', '男', '0', 'Y', null, '蒋俊强', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1292', 'chenruibao', '2013-06-05', '2014-05-15 10:23:12', null, null, '3', null, 'chenruibao@whizen.com', null, '四级', '2014-05-15 10:23:12', null, null, null, '58937486', null, null, '2013-09-02', '男', '0', 'Y', null, '陈瑞保', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1294', 'zhouxian', '2011-06-30', '2014-05-15 10:23:16', null, null, '3', null, 'zhouxian@whizen.com', null, '二级', '2014-05-15 10:23:16', null, null, null, '78227381', null, null, '2013-09-01', '女', '0', 'Y', null, '周娴', '1', '126300');
INSERT INTO `infox_sysmgr_emp` VALUES ('1295', '560681622335090', '2003-06-01', '2014-05-15 10:23:21', null, null, '3', null, '560681622335090@whizen.com', null, '四级', '2014-05-15 10:23:21', null, null, null, '38020130', null, null, '2013-09-16', '男', '0', 'Y', null, '陈润丰', '0', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1296', '802849539207271', '2010-06-01', '2014-05-15 10:23:26', null, null, '3', null, '802849539207271@whizen.com', null, '四级', '2014-05-15 10:23:26', null, null, null, '86320684', null, null, '2013-10-15', '男', '0', 'Y', null, '骆树明', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1297', '804279212020160', '2009-06-01', '2014-05-15 10:23:22', null, null, '3', null, '804279212020160@whizen.com', null, '四级', '2014-05-15 10:23:22', null, null, null, '06895890', null, null, '2013-11-13', '女', '0', 'Y', null, '陈莲妹', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1298', '393890642714090', '2012-06-01', '2014-05-15 10:23:22', null, null, '3', null, '393890642714090@whizen.com', null, '--', '2014-05-15 10:23:22', null, null, null, '13400457', null, null, '2013-12-09', '男', '0', 'Y', null, '段啸', '0', '647431');
INSERT INTO `infox_sysmgr_emp` VALUES ('1299', 'houyannan', '2007-06-01', '2014-05-19 10:50:48', null, '2014-02-10', '1', null, 'houyannan@whizen.com', 'N', '一级', '2014-05-19 10:50:48', '', null, null, '43926540', '', null, '2014-02-10', '男', '0', 'Y', null, '侯延楠', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1300', 'supeiyu', '2013-06-01', '2014-05-15 10:23:20', null, null, '3', null, 'supeiyu@whizen.com', null, '二级', '2014-05-26 16:44:23', null, null, null, 'yoyu1202', null, null, '2014-02-13', '女', '0', 'Y', null, '苏佩钰', '0', '131621');
INSERT INTO `infox_sysmgr_emp` VALUES ('1301', 'panshuijun', '2009-06-30', '2014-05-26 13:39:06', null, '2014-02-24', '6', null, 'panshuijun@whizen.com', 'N', '四级', '2014-05-26 13:39:06', '', null, null, '90831634', '', null, '2014-02-24', '男', '0', 'Y', null, '潘水军', '1', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1302', 'ouguijiao', '2008-06-01', '2014-05-15 10:23:14', null, null, '3', null, 'ouguijiao@whizen.com', null, '四级', '2014-06-13 10:37:25', null, null, null, 'Pass2014', null, null, '2014-02-26', '女', '0', 'Y', null, '欧桂娇', '1', '548996');
INSERT INTO `infox_sysmgr_emp` VALUES ('1303', '679093734316773', '2014-06-01', '2014-05-15 10:23:26', null, null, '3', null, '679093734316773@whizen.com', null, '二级', '2014-05-15 10:23:26', null, null, null, '31935010', null, null, '2014-02-26', '女', '0', 'Y', null, '冯英媛', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1304', 'liguiyang', '2014-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'liguiyang@whizen.com', null, '二级', '2014-05-26 08:48:24', null, null, null, 'Lgy1104.', null, null, '2014-04-29', '女', '0', 'Y', null, '黎桂杨', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('1305', 'jiangzhonghui', '2005-06-01', '2014-05-26 13:42:03', null, '2014-05-04', '6', null, 'jiangzhonghui@whizen.com', 'N', '一级', '2014-05-26 13:42:03', '', null, null, '23931678', '', null, '2014-05-04', '男', '0', 'Y', null, '江中辉', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('1306', 'chenmin', '2011-06-30', '2014-05-26 13:44:42', null, '2014-05-14', '1', null, 'chenmin@whizen.com', 'N', '无', '2014-05-26 13:44:42', '', null, null, '62456533', '', null, '2014-05-14', '女', '0', 'Y', null, '陈敏', '0', '723327');
INSERT INTO `infox_sysmgr_emp` VALUES ('205', 'huangmanjing', '2007-06-01', '2014-05-15 10:23:18', null, null, '3', null, 'huangmanjing@whizen.com', null, '二级', '2014-05-15 10:23:18', null, null, null, '44828898', null, null, '2007-03-31', '女', '0', 'Y', null, '黄蔓菁', '0', '947868');
INSERT INTO `infox_sysmgr_emp` VALUES ('6000', 'chenjianchun', '1998-07-01', '2014-06-16 08:34:26', null, '', '3', null, 'chenjianchun@whizen.com', 'YY', '一级', '2014-06-16 08:34:26', '', null, null, null, '', null, '2010-09-01', '男', '0', 'Y', null, '陈建春', '0', '526169');
INSERT INTO `infox_sysmgr_emp` VALUES ('6001', 'suncheng', '2001-07-01', '2014-05-28 16:12:44', null, null, '3', null, 'suncheng@whizen.com', null, '一级', '2014-05-28 16:12:44', null, null, null, '61906675', null, null, '2010-10-08', '男', '0', 'Y', null, '孙成', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6002', 'tianguomin', '2003-07-01', '2014-05-28 16:12:45', null, null, '3', null, 'tianguomin@whizen.com', null, '二级', '2014-05-28 16:12:45', null, null, null, '54027715', null, null, '2010-10-09', '男', '0', 'Y', null, '田国民', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6007', 'zhaozhen', '2009-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'zhaozhen@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '47847199', null, null, '2010-12-29', '女', '0', 'Y', null, '赵珍', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6008', 'zhanlijie', '2006-07-01', '2014-05-28 16:12:45', null, null, '3', null, 'zhanlijie@whizen.com', null, '无级', '2014-05-28 16:12:45', null, null, null, '81013503', null, null, '2011-01-04', '女', '0', 'Y', null, '詹丽杰', '0', '473615');
INSERT INTO `infox_sysmgr_emp` VALUES ('6012', 'chengjiang', '2008-07-01', '2014-05-28 16:12:45', null, null, '3', null, 'chengjiang@whizen.com', null, '三级', '2014-05-28 16:12:45', null, null, null, '83732502', null, null, '2011-03-28', '男', '0', 'Y', null, '成江', '1', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6014', 'zhangkangle', '2006-07-01', '2014-05-28 16:12:45', null, null, '3', null, 'zhangkangle@whizen.com', null, '二级', '2014-05-28 16:12:45', null, null, null, '53661320', null, null, '2011-08-01', '男', '0', 'Y', null, '张康乐', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6017', 'zhoubo', '2011-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'zhoubo@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '11289820', null, null, '2011-08-11', '男', '0', 'Y', null, '周波', '1', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6019', 'beijiangbo', '2011-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'beijiangbo@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '41998021', null, null, '2011-08-09', '男', '0', 'Y', null, '秘江波', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6020', 'qianghantao', '2011-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'qianghantao@whizen.com', null, '三级', '2014-05-28 16:12:46', null, null, null, '45109946', null, null, '2011-10-14', '男', '0', 'Y', null, '强韩涛', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6023', 'yanlijie', '2012-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'yanlijie@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '37825804', null, null, '2012-07-09', '男', '0', 'Y', null, '闫立捷', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6024', 'zhangyimei', '2011-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'zhangyimei@whizen.com', null, '一级', '2014-05-28 16:12:46', null, null, null, '56969340', null, null, '2012-07-16', '女', '0', 'Y', null, '张伊美', '0', '978275');
INSERT INTO `infox_sysmgr_emp` VALUES ('6025', 'zhaolinan', '2003-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'zhaolinan@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '68865243', null, null, '2012-07-17', '女', '0', 'Y', null, '赵丽楠', '0', '978275');
INSERT INTO `infox_sysmgr_emp` VALUES ('6026', 'guozemin', '2008-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'guozemin@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '69139177', null, null, '2013-07-03', '男', '0', 'Y', null, '郭泽民', '1', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6027', 'zhaohuigang', '2002-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'zhaohuigang@whizen.com', null, '一级', '2014-05-28 16:12:46', null, null, null, '83404503', null, null, '2013-08-07', '男', '0', 'Y', null, '赵惠钢', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6028', 'gaoxiaoduo', '2010-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'gaoxiaoduo@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '04341661', null, null, '2013-08-19', '女', '0', 'Y', null, '高小多', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('6030', 'shangshuai', '2011-07-01', '2014-05-28 16:12:46', null, null, '3', null, 'shangshuai@whizen.com', null, '无级', '2014-05-28 16:12:46', null, null, null, '85355851', null, null, '2013-12-23', '男', '0', 'Y', null, '王帅', '0', '943553');
INSERT INTO `infox_sysmgr_emp` VALUES ('7501', 'zengjialiang', '2010-07-01', '2014-05-30 13:25:22', null, '', '3', null, 'zengjialiang@whizen.com', '', '一级', '2014-05-30 13:25:22', '', null, null, '48133663', '', null, '2010-01-01', '男', '0', 'Y', null, '曾嘉良', '0', '203102');
INSERT INTO `infox_sysmgr_emp` VALUES ('7502', 'xiaodajian', '1999-07-01', '2014-05-29 10:57:52', null, null, '3', null, 'xiaodajian@whizen.com', null, '一级', '2014-05-29 10:57:52', null, null, null, '36081464', null, null, '2009-08-01', '男', '0', 'Y', null, '肖大剣', '0', '203102');
INSERT INTO `infox_sysmgr_emp` VALUES ('7503', 'iwamoto-k', '2003-03-31', '2014-05-29 10:57:53', null, null, '3', null, 'iwamoto-k@whizen.com', null, '一级', '2014-06-03 09:38:53', null, null, null, 'kh091577', null, null, '2012-06-25', '男', '0', 'Y', null, '岩本力彦', '0', '203102');
INSERT INTO `infox_sysmgr_emp` VALUES ('7504', 'yamaguchi-e', '2000-03-31', '2014-05-29 10:57:53', null, null, '3', null, 'yamaguchi-e@whizen.com', null, '一级', '2014-05-29 10:57:53', null, null, null, '01091099', null, null, '2009-04-01', '女', '0', 'Y', null, '山口えり', '0', '203102');
INSERT INTO `infox_sysmgr_emp` VALUES ('7505', 'nashimoto-y', '1995-03-01', '2014-05-29 10:57:53', null, null, '3', null, 'nashimoto-y@whizen.com', null, '一级', '2014-05-29 10:57:53', null, null, null, '45715615', null, null, '2011-08-01', '女', '0', 'Y', null, '梨本優那', '0', '203102');
INSERT INTO `infox_sysmgr_emp` VALUES ('9001', 'xiehe', '1996-07-01', '2014-06-16 08:25:36', null, '', '3', null, 'xiehe@whizen.com', 'YY', '一级', '2014-06-16 08:25:36', '', null, null, '60713739', '', '岗位变更历史[变更前岗位：开发本部总经理    变更后岗位：分公司总经理    实施日期：],', '2012-04-01', '男', '0', 'Y', null, '谢禾', '0', '886155');
INSERT INTO `infox_sysmgr_emp` VALUES ('9005', 'xuqiang', '2007-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'xuqiang@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '65903908', null, null, '2012-06-01', '男', '0', 'Y', null, '许强', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9009', 'qinwei', '2012-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'qinwei@whizen.com', null, '二级', '2014-05-26 14:37:15', null, null, null, '94637363', null, null, '2012-06-25', '女', '0', 'Y', null, '秦维', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9010', 'zhengyongfu', '2008-03-01', '2014-05-30 11:00:33', null, '', '3', null, 'zhengyongfu@whizen.com ', 'Y', '一级', '2014-05-30 11:00:33', '', null, null, null, '', null, '2012-07-02', '男', '0', 'Y', null, '郑永福', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9017', 'wangyongming', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangyongming@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '53357560', null, null, '2013-07-03', '男', '0', 'Y', null, '汪永明', '1', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9019', 'xueben', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'xueben@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '22365038', null, null, '2013-06-03', '男', '0', 'Y', null, '薛奔', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9023', 'luxiaoming', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'luxiaoming@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '21352020', null, null, '2013-07-10', '男', '0', 'Y', null, '陆晓明', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9032', 'chenzaihan', '2011-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'chenzaihan@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '79836386', null, null, '2012-08-01', '女', '0', 'Y', null, '程仔涵', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9040', 'wangguocheng', '2010-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangguocheng@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '04365419', null, null, '2012-08-13', '男', '0', 'Y', null, '王果成', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9043', 'xuhao', '2008-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'xuhao@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '35982933', null, null, '2012-09-10', '男', '0', 'Y', null, '许浩', '1', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9045', 'hanjinling', '2007-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'hanjinling@whizen.com', null, '一级', '2014-05-26 14:37:15', null, null, null, '80646276', null, null, '2012-10-08', '女', '0', 'Y', null, '韩金玲', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9049', 'zhuchaomin', '2012-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhuchaomin@whizen.com ', null, '四级', '2014-05-26 14:37:15', null, null, null, '66453782', null, null, '2013-02-25', '男', '0', 'Y', null, '朱超民', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9050', 'liyanqi', '2006-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'liyanqi@whizen.com ', null, '一级', '2014-05-26 14:37:15', null, null, null, '88170902', null, null, '2013-02-26', '男', '0', 'Y', null, '李彦祺', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9051', 'jiyue', '2000-03-01', '2014-05-26 14:37:15', null, null, '3', null, 'jiyue@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '23448528', null, null, '2013-03-11', '男', '0', 'Y', null, '季玥', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9052', 'guxiaoyan', '2009-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'guxiaoyan@whizen.com', null, '二级', '2014-05-26 14:37:15', null, null, null, '25810439', null, null, '2013-03-18', '女', '0', 'Y', null, '顾晓彦', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9053', 'liuhongtao', '2009-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'liuhongtao@whizen.com', null, '一级', '2014-05-26 14:37:15', null, null, null, '41309060', null, null, '2013-04-01', '男', '0', 'Y', null, '刘洪涛', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9055', 'caixiaohua', '2011-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'caixiaohua@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '15254502', null, null, '2013-04-15', '男', '0', 'Y', null, '蔡晓桦', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9056', 'zhangruixing', '2012-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhangruixing@whizen.com ', null, '三级', '2014-05-26 14:37:15', null, null, null, '56253903', null, null, '2013-06-03', '女', '0', 'Y', null, '张瑞星', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9058', 'caoting', '2012-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'caoting@whizen.com ', null, '四级', '2014-05-26 14:37:15', null, null, null, '14346177', null, null, '2013-06-17', '女', '0', 'Y', null, '曹婷', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9059', 'longxiao', '2004-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'longxiao@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '28638361', null, null, '2013-06-17', '女', '0', 'Y', null, '龙晓', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9061', 'caiqing', '2006-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'caiqing@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '83821804', null, null, '2013-09-02', '男', '0', 'Y', null, '蔡青', '1', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9062', 'zhangxuejin', '2008-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhangxuejin@whizen.com ', null, '三级', '2014-05-26 14:37:15', null, null, null, '07153374', null, null, '2013-09-22', '男', '0', 'Y', null, '张学进', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9063', 'tantaiwushan', '2010-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'tantaiwushan@whizen.com ', null, '一级', '2014-05-26 14:37:15', null, null, null, '43196019', null, null, '2013-09-23', '男', '0', 'Y', null, '澹台武山', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9064', 'jiangbin', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'jiangbin@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '79654944', null, null, '2013-09-16', '男', '0', 'Y', null, '姜斌', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9067', 'hanbaoqiang', '2012-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'hanbaoqiang@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '07264980', null, null, '2013-10-24', '男', '0', 'Y', null, '韩宝强', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9068', 'make', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'make@whizen.com ', null, 'JTEST-E', '2014-05-26 14:37:15', null, null, null, '90201866', null, null, '2013-11-04', '男', '0', 'Y', null, '马可', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9069', 'heyuan', '2011-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'heyuan@whizen.com ', null, '无级', '2014-05-26 14:37:15', null, null, null, '20060789', null, null, '2013-11-04', '女', '0', 'Y', null, '何媛', '1', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9070', 'wangqiongshan', '2006-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangqiongshan@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '98413739', null, null, '2013-11-18', '男', '0', 'Y', null, '王琼善', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9071', 'wangyadong', '2010-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangyadong@whizen.com ', null, '二级', '2014-05-26 14:37:15', null, null, null, '53352778', null, null, '2013-11-18', '男', '0', 'Y', null, '王亚东', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9072', 'zhangjun', '2007-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhangjun@whizen.com ', null, '一级', '2014-05-26 14:37:15', null, null, null, '72438242', null, null, '2013-12-09', '男', '0', 'Y', null, '张俊', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9073', 'yuyi', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'yuyi@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '35585047', null, null, '2013-12-31', '女', '0', 'Y', null, '余意', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9074', 'zhuchun', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'zhuchun@whizen.com', null, '一级', '2014-05-26 14:37:15', null, null, null, '47738105', null, null, '2013-12-31', '女', '0', 'Y', null, '朱纯', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9075', 'linchangxiang', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'linchangxiang@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '70641768', null, null, '2013-12-31', '男', '0', 'Y', null, '林昌翔', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9076', 'wangchao1286', '2013-07-01', '2014-05-26 14:37:15', null, null, '3', null, 'wangchao1286@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '82158189', null, null, '2013-12-31', '男', '0', 'Y', null, '王超', '1', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9077', 'houchang', '2013-06-01', '2014-05-26 14:44:15', null, '2014-01-06', '1', null, 'houchang@whizen.com', 'N', '无级', '2014-05-26 14:44:15', '', null, null, '57559644', '', null, '2014-01-06', '男', '0', 'Y', null, '侯昌', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9078', 'zhaotao', '2007-07-01', '2014-05-30 10:57:44', null, '2014-01-21', '1', null, 'zhaotao@whizen.com', 'N', '一级', '2014-05-30 10:57:44', '', null, null, '12345678', '', null, '2014-01-21', '男', '0', 'Y', null, '赵涛', '1', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9079', 'huangchao', '2013-06-01', '2014-05-26 14:37:15', null, null, '3', null, 'huangchao@whizen.com', null, '无级', '2014-05-26 14:37:15', null, null, null, '87997522', null, null, '2013-07-09', '男', '0', 'Y', null, '黄超', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9080', 'lili', '2006-03-01', '2014-05-26 14:48:46', null, '2014-03-06', '1', null, 'lili@whizen.com', 'N', '一级', '2014-05-26 15:14:41', '', null, null, 'Lee110801', '', null, '2014-03-06', '男', '0', 'Y', null, '李蠡', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9081', 'dingxin', '2012-06-01', '2014-05-26 14:47:42', null, '2014-03-10', '1', null, 'dingxin@whizen.com', 'N', '三级', '2014-05-27 08:26:31', '', null, null, 'Dx123456', '', null, '2014-03-10', '男', '0', 'Y', null, '丁鑫', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9082', 'danchangjiang', '2012-07-01', '2014-05-26 14:52:17', null, '2014-03-20', '1', null, 'danchangjiang@whizen.com', 'N', 'JTEST-E', '2014-05-26 14:52:17', '', null, null, '62862401', '', null, '2014-03-20', '男', '0', 'Y', null, '单长江', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9084', 'lidongdong', '2012-06-01', '2014-05-26 14:58:01', null, '2014-03-21', '1', null, 'lidongdong@whizen.com', 'N', '三级', '2014-05-26 14:58:01', '', null, null, '99509179', '', null, '2014-03-21', '男', '0', 'Y', null, '李冬冬', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9085', 'tiepeng', '2011-06-01', '2014-05-26 14:59:58', null, '2014-04-22', '1', null, 'tiepeng@whizen.com', 'N', '三级', '2014-05-26 14:59:58', '', null, null, '18443938', '', null, '2014-04-22', '男', '0', 'Y', null, '帖鹏', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9086', 'wangcheng', '2011-01-01', '2014-05-26 15:01:51', null, '2014-05-04', '1', null, 'wangcheng@whizen.com', 'N', '二级', '2014-05-26 15:01:51', '', null, null, '70294976', '', null, '2014-05-04', '男', '0', 'Y', null, '王诚', '0', '634670');
INSERT INTO `infox_sysmgr_emp` VALUES ('9087', 'zhoupeilin', '2012-07-01', '2014-05-26 15:03:04', null, '2014-05-14', '1', null, 'zhoupeilin@whizen.com', 'N', '无级', '2014-05-26 15:03:04', '', null, null, '59967317', '', null, '2014-05-12', '男', '0', 'Y', null, '周培林', '0', '634670');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9010', '060923');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6001', '108539');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6027', '108539');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6002', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6014', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9005', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9043', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9045', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9050', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9051', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9059', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9061', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9062', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9070', '222368');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9072', '222368');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6000', '305382');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9001', '305382');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0160', '361960');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0183', '361960');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('031', '361960');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0207', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0377', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0803', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0818', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0823', '364361');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('049', '366186');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9080', '412933');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0861', '436803');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('7501', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('7502', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9032', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9052', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9053', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9055', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9063', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9071', '436803');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9078', '436803');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6012', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6030', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9040', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9049', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9064', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9067', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9068', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9069', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9081', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9082', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9084', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9085', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9086', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9087', '575853');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('7503', '582874');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('7504', '582874');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0696', '588192');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0301', '592397');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6008', '592397');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('7505', '592397');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6025', '704142');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6024', '708172');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1255', '791596');
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
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1306', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6007', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6017', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6019', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6020', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6023', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6026', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('6028', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9009', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9017', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9019', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9023', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9056', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9058', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9073', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9074', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9075', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9076', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9077', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('9079', '791596');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0007', '806025');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0342', '829929');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0339', '880887');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1061', '888332');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('205', '918824');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0001', '938396');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0456', '948486');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0562', '953023');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('1208', '953023');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0137', '998481');
INSERT INTO `infox_sysmgr_emp_job` VALUES ('0895', '998481');

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
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0001');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0001');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0007');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0013');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0027');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '003');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0032');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0032');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0050');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0052');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0053');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0067');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0070');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0086');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('367248', '0100');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0119');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0137');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0150');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0155');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0160');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0183');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0190');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0190');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0197');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0201');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0207');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0215');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0216');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0217');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0236');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0262');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0280');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0284');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0295');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0301');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0306');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '031');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0314');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '0317');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0322');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0339');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0342');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0348');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0351');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0377');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0394');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0413');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0428');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('348694', '0449');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0452');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0453');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0480');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '049');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0498');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '051');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0520');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0546');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '055');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0559');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0559');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0562');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0564');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0569');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0577');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0579');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0583');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0588');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0590');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0601');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0603');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0621');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0624');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0626');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0627');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0658');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0666');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0669');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0670');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0671');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0674');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0675');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0675');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0676');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0678');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0679');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0681');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0684');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0694');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0696');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0704');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0714');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0715');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0718');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0721');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0730');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0734');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0735');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0738');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0741');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0747');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0748');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0749');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0752');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0753');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0755');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0757');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0790');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0792');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0793');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0795');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0801');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0803');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0806');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0809');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0811');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0814');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0817');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0817');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0818');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '0823');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0823');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0850');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0853');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0854');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0855');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0856');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0858');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0860');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0861');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0866');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0868');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0869');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0876');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0883');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0887');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0895');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0920');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0921');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0931');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0936');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0938');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0950');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0966');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0970');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0971');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0974');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '098');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0985');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0990');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0993');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '0994');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('770063', '1000');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1003');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1004');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1015');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1022');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1027');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1028');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1034');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('921908', '1039');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1046');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1054');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1059');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1060');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1061');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1063');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1064');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1065');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1067');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1068');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1071');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1072');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1073');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1074');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1079');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1082');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1084');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1097');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1099');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1101');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1104');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1108');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1109');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1110');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1112');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1113');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1117');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1121');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1122');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1127');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1132');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1145');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1149');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1150');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1151');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1152');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1156');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1158');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1159');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1163');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1170');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1172');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1174');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1175');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1176');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1178');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1179');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1183');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1184');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1186');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1191');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1192');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1193');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1195');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1206');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1207');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1208');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1211');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1212');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1214');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1215');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1219');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1220');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1223');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1225');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1233');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1234');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1236');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1237');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1239');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1240');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1243');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1245');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1246');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1247');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1250');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1257');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1260');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1262');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1263');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1264');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1265');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1268');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1269');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1270');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1272');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1274');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1275');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1276');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1278');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1280');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1282');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1283');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1285');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1287');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1292');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1294');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1295');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1296');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1297');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1298');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1299');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('687798', '1300');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1302');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1303');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '1304');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '205');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '6000');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6000');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6001');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6002');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6007');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6008');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6012');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6014');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6017');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6019');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6020');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6023');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6024');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6025');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6026');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6027');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6028');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '6030');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '7501');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '7502');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '7503');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '7504');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '7505');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('037908', '9001');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9001');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9005');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9009');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9010');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9017');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9019');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9023');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9032');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9040');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9043');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9045');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9049');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9050');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9051');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9052');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9053');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9055');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9056');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9058');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9059');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9061');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9062');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9063');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9064');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9067');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9068');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9069');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9070');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9071');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9072');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9073');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9074');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9075');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9076');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9077');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9079');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9080');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9081');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9082');
INSERT INTO `infox_sysmgr_emp_role` VALUES ('390547', '9084');

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
INSERT INTO `infox_sysmgr_menu` VALUES ('303350', null, '2014-05-26 13:55:09', null, 'sysmgr/employee/import_emp_data.do', '', '2014-05-26 13:55:09', null, '人员信息上传', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('335051', null, '2014-05-23 09:01:09', null, 'sysmgr/employee/get.do', '', '2014-05-23 09:01:09', null, '获取详细信息', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('361454', null, '2014-02-25 19:14:27', null, 'project/project_main/project_main.do', 'icon-standard-application-side-expand', '2014-02-25 19:14:27', null, '项目管理', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('412653', null, '2014-05-19 10:40:28', null, 'sysmgr/org/get.do', 'icon-standard-application-view-tile', '2014-05-19 10:40:28', null, '获取部门信息', '1', null, null, 'O', '229865', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('443543', null, '2014-05-29 08:28:42', null, 'project/project_main/datagrid_MailList.do', '', '2014-05-29 08:28:42', null, '参与人员查询', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('450915', null, '2014-05-23 10:04:46', null, 'sysmgr/menu/treegrid.do', '', '2014-05-23 10:04:46', null, '查询', '1', null, null, 'O', '863930', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('459345', null, '2014-05-23 08:38:57', null, 'project/project_report/employeeTaskTimeReport_leader.do', '', '2014-05-23 08:38:57', null, '稼动率总裁专用', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('502906', null, '2014-03-07 10:40:32', null, 'project/project_report/project_tasktime_main.do', 'icon-standard-chart-pie', '2014-03-07 10:40:32', null, '稼动率管理', '0', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('510303', null, '2014-05-15 11:03:39', null, 'sysmgr/role/getPermission.do', '', '2014-05-15 11:03:39', null, '角色资源关联', '1', null, null, 'O', '878344', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('518167', null, '2014-05-23 10:11:57', null, 'project/project_main/get_ProjectDevList.do', '', '2014-05-23 10:11:57', null, '开发人员详细信息查询内容', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('527852', null, '2014-03-07 15:21:26', null, 'sysmgr/empjob/empjob_main.do', 'icon-standard-user-red', '2014-03-07 15:21:26', null, '公司岗位', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('533865', null, '2014-06-12 09:30:32', null, 'project/jdl/employeeTaskTimeReport_leader.do', '', '2014-06-12 09:30:32', null, '总裁专用（新）', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('547345', null, '2014-02-22 00:50:30', null, 'sysmgr/employee/emp_main.do', 'icon-hamburg-my-account', '2014-02-22 00:50:30', null, '员工管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('559824', null, '2014-06-12 09:41:36', null, 'project/jdl/employeeTaskTimeReport.do', '', '2014-06-12 09:41:36', null, '稼动率查询（新）', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('643077', null, '2014-05-15 11:04:27', null, 'sysmgr/employee/getPermission.do', 'icon-standard-application-view-tile', '2014-05-15 11:04:27', null, '用户角色关联', '1', null, null, 'O', '068671', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('643154', null, '2014-05-29 08:28:16', null, 'project/pwe_emp_working/datagrid.do', '', '2014-05-29 08:28:16', null, '开发人员设置查询', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('668356', null, '2014-05-19 11:15:30', null, 'project/project_main/upload.do', '', '2014-05-19 11:15:30', null, '导入项目信息', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('670332', null, '2014-05-19 11:16:58', null, 'project/project_main/import_project_info.do', '', '2014-05-19 11:16:58', null, '导入Excel', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('675303', null, '2014-02-18 14:50:50', null, 'sysmgr/filemanager/file_main.do', 'icon-standard-folder-database', '2014-02-18 14:50:50', null, '文件管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('685540', null, '2014-06-12 09:29:19', null, 'project/jdl/getMemberInfoListDialog.do', '', '2014-06-12 09:29:19', null, '个人详细稼动率（新）', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('699829', null, '2014-05-23 08:37:18', null, 'project/project_main/datagrid_leader.do', '', '2014-05-23 08:37:18', null, '项目总裁专用', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('707850', null, '2014-05-26 13:54:49', null, 'sysmgr/employee/upload.do', '', '2014-05-26 13:54:49', null, '人员信息上传页面', '1', null, null, 'O', '547345', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('716776', null, '2014-03-24 16:03:50', null, 'project/project_main/addMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('726776', null, '2014-03-24 16:03:50', null, 'project/project_main/deleteMailList.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除邮件列表操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('736776', null, '2014-03-24 16:03:50', null, 'project/overtime/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('746776', null, '2014-03-24 16:03:50', null, 'project/overtime/delete.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '删除加班操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('756776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/add.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '添加开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('766776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/revert.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '移除开发人员操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('776776', null, '2014-03-24 16:03:50', null, 'project/pwe_emp_working/set_workdate.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发人员起止日期操作', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('781776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_detail.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '查询详细', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('782776', null, '2014-03-24 16:03:50', null, 'project/project_main/project_member.do', 'icon-standard-layout-header', '2014-03-24 16:03:50', null, '设置开发团队人员页面', '1', null, null, 'O', '361454', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('783776', null, '2014-05-23 10:10:05', null, 'project/project_main/project_Devdetail.do', 'icon-standard-layout-header', '2014-05-23 10:10:05', null, '开发人员详细列表', '1', null, null, 'O', '361454', 'Y');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('785756', null, '2014-05-23 10:01:50', null, 'sysmgr/menu/get.do', '', '2014-05-23 10:01:50', null, '资源详细信息', '1', null, null, 'O', '863930', 'Y');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('796575', null, '2014-05-23 09:46:23', null, 'project/project_main/get.do', '', '2014-05-23 09:46:23', null, '项目详细信息', '1', null, null, 'O', '361454', 'Y');
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
INSERT INTO `infox_sysmgr_menu` VALUES ('814262', null, '2014-05-23 10:13:23', null, 'project/project_report/getMemberInfoListDialog.do', '', '2014-05-23 10:13:23', null, '稼动率详细页面', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('825118', null, '2014-04-14 08:55:25', null, 'project/project_main/emp_main.do', 'icon-standard-application-view-list', '2014-04-14 08:55:25', null, '人员信息', '1', null, null, 'F', '134095', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('837844', null, '2014-02-13 10:39:12', null, 'druid/druid.do', 'icon-standard-database-link', '2014-02-13 10:39:12', null, 'Druid监控', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('863930', null, '2014-02-13 10:39:16', null, 'sysmgr/menu/menu_main.do', 'icon-standard-application-side-boxes', '2014-02-13 10:39:16', null, '资源管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('876715', null, '2014-02-10 21:28:13', null, '', 'icon-standard-application-xp-terminal', '2014-02-10 21:28:13', null, '系统管理', '1', null, null, 'R', null, 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('878344', null, '2014-02-13 10:39:21', null, 'sysmgr/role/role_main.do', 'icon-standard-award-star-silver-3', '2014-02-13 10:39:21', null, '角色管理', '1', null, null, 'F', '876715', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('896988', null, '2014-05-23 10:14:15', null, 'project/project_report/getMemberInfoList.do', '', '2014-05-23 10:14:15', null, '稼动率详细内容查询', '1', null, null, 'O', '502906', 'Y');
INSERT INTO `infox_sysmgr_menu` VALUES ('981451', null, '2014-05-26 09:02:16', null, 'project/project_main/get_ProjectAllDevMember.do', '', '2014-05-26 09:02:16', null, '项目加班状况查询', '1', null, null, 'O', '361454', 'Y');

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
INSERT INTO `infox_sysmgr_org_dept` VALUES ('126300', null, '2014-05-14 15:52:24', null, '', null, null, '第二开发本部开发二部', null, '2014-05-14 15:52:24', null, '0', '0', '0', '0', '0', '0', '0', '35', '0', '0', '0', '0', 'JD2本部', 'JD2-2', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('131621', null, '2014-05-14 15:54:56', null, '', null, null, '项目管理部', null, '2014-05-14 15:54:56', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '华智', '项目管理部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('188927', null, '2014-05-14 15:51:29', null, '', null, null, '第一开发本部', null, '2014-05-14 15:51:29', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', 'JD1本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('203102', null, '2014-05-29 10:57:04', null, '', null, null, '日本支社', null, '2014-05-29 10:57:04', null, '0', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '广东华智科技有限公司', '日本支社', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('300199', null, '2014-05-26 10:23:44', null, '', null, null, '总裁办', null, '2014-05-26 10:23:44', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '广东华智科技有限公司', '总裁办', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('398250', null, '2014-05-14 15:50:21', null, '', null, null, '第一开发本部开发二部', null, '2014-05-14 15:50:21', null, '0', '0', '0', '0', '0', '0', '0', '31', '0', '0', '0', '0', 'JD1', 'JD1-2', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('400771', null, '2014-04-21 13:11:31', null, '', null, null, '财务部', null, '2014-04-21 13:11:31', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理部', '财务部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('429710', null, '2014-05-15 09:31:53', null, '', null, null, '品质保证部', null, '2014-05-15 09:31:53', null, '0', '0', '0', '0', '0', '0', '0', '12', '0', '0', '0', '0', '华智', '品质保证部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('461023', null, '2014-05-14 15:50:50', null, '', null, null, '第一开发本部开发三部', null, '2014-05-14 15:50:50', null, '0', '0', '0', '0', '0', '0', '0', '18', '0', '0', '0', '0', 'JD1', 'JD1-3', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('473615', null, '2014-05-28 16:09:04', null, '', null, null, '北京管理部', null, '2014-05-28 16:09:04', null, '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0', '北京支社', '北京管理部', null, 'D', '526169');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('474835', null, '2014-04-21 13:11:48', null, '', null, null, '采购部', null, '2014-04-21 13:11:48', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '综合管理部', '采购部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('526169', null, '2014-05-19 10:42:34', null, '', null, null, '北京支社', null, '2014-05-19 10:42:34', null, '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '广东华智科技有限公司', '北京支社', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('548996', null, '2014-05-14 15:52:01', null, '', null, null, '第二开发本部开发一部', null, '2014-05-14 15:52:01', null, '0', '0', '0', '0', '0', '0', '0', '40', '0', '0', '0', '0', 'JD2本部', 'JD2-1', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('634670', null, '2014-05-30 11:02:35', null, '', null, null, '苏州开发部', null, '2014-05-30 11:02:35', null, '0', '0', '0', '0', '0', '0', '0', '0', '44', '0', '0', '0', '苏州支社', '苏州开发部', null, 'D', '886155');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('647431', null, '2014-05-14 15:59:46', null, '', null, null, '系统集成部', null, '2014-05-14 15:59:46', null, '0', '0', '0', '0', '0', '0', '0', '17', '0', '0', '0', '0', '华智', '系统集成部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('682781', null, '2014-05-14 15:58:38', null, '', null, null, '综合管理本部', null, '2014-05-14 15:58:38', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', '综合管理本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('702229', null, '2014-05-14 15:52:53', null, '', null, null, '第二开发本部开发三部', null, '2014-05-14 15:52:53', null, '0', '0', '0', '0', '0', '0', '0', '35', '35', '0', '0', '0', 'JD2本部', 'JD2-3', null, 'D', '917489');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('723327', null, '2014-05-14 15:49:45', null, '', null, null, '第一开发本部开发一部', null, '2014-05-14 15:49:45', null, '0', '0', '0', '0', '0', '0', '0', '55', '0', '0', '0', '0', 'JD1', 'JD1-1', null, 'D', '188927');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('853418', null, '2014-05-14 15:59:28', null, '', null, null, '人力资源部', null, '2014-05-14 15:59:28', null, '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '综合管理本部', '人力资源部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('886155', null, '2014-05-19 10:42:02', null, '', null, null, '苏州支社', null, '2014-05-19 10:42:02', null, '0', '0', '0', '0', '0', '0', '0', '1', '2', '0', '0', '0', '广东华智科技有限公司', '苏州支社', null, 'O', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('917489', null, '2014-05-14 15:51:19', null, '', null, null, '第二开发本部', null, '2014-05-14 15:51:19', null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '华智', 'JD2本部', null, 'D', '973758');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('943553', null, '2014-05-14 15:55:22', null, '', null, null, '北京开发部', null, '2014-05-14 15:55:22', null, '0', '0', '0', '0', '0', '0', '0', '13', '0', '0', '0', '0', '北京分公司', '北京开发部', null, 'D', '526169');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('947868', null, '2014-05-14 15:58:58', null, '', null, null, '总务部', null, '2014-05-14 15:58:58', null, '0', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '综合管理本部', '总务部', null, 'D', '682781');
INSERT INTO `infox_sysmgr_org_dept` VALUES ('973758', null, '2014-04-03 13:18:02', null, '', null, null, '广东华智科技有限公司', null, '2014-04-03 13:18:02', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '华智', null, 'O', null);
INSERT INTO `infox_sysmgr_org_dept` VALUES ('978275', null, '2014-05-28 16:09:23', null, '', null, null, '北京市场部', null, '2014-05-28 16:09:23', null, '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '北京支社', '北京市场部', null, 'D', '526169');

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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '134095');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '136992');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '186776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '190762');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '200025');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '229865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '303350');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '335051');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '335051');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '335051');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '361454');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '412653');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '412653');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '412653');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '412653');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '443543');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '443543');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '443543');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '443543');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '450915');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '459345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '502906');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '510303');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '518167');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '527852');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '533865');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '547345');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '559824');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '643077');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '643154');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '643154');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '643154');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '668356');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '670332');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '675303');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '685540');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '699829');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '699829');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '699829');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '707850');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '716776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '726776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '736776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '746776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '756776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '766776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '776776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '781776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '782776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '783776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '784776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '784776');
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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785735');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785736');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785741');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785742');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785743');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785744');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785745');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785751');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785752');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785753');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785754');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '785754');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785754');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785755');
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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '785771');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785772');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785773');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785774');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '785775');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '785776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '786776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '796575');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '796776');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '796776');
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
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '814262');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '825118');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '837844');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '863930');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('367248', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('770063', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '876715');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '878344');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('390547', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('933556', '896988');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('037908', '981451');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('348694', '981451');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('687798', '981451');
INSERT INTO `infox_sysmgr_role_menu` VALUES ('921908', '981451');

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
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001466fee5fd40019', '2014-06-06 14:47:11', null, null, '30 35 8 31 3 ? ', '884747:M0', '4028824e466fc44001466fee5fd40019', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001466fee5fd4001a', '2014-06-06 14:47:11', null, null, '30 35 8 29 3 ? ', '884747:M1', '4028824e466fc44001466fee5fd4001a', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc4400146701dc3ee004d', '2014-06-06 15:38:57', null, null, '30 35 8 11 4 ? ', '724633:M0', '4028824e466fc4400146701dc3ee004d', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc4400146701dc3ee004e', '2014-06-06 15:38:57', null, null, '30 35 8 9 4 ? ', '724633:M1', '4028824e466fc4400146701dc3ee004e', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc4400146701dc3ee004f', '2014-06-06 15:38:57', null, null, '30 35 8 19 4 ? ', '724633:M2', '4028824e466fc4400146701dc3ee004f', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc4400146701dc3ee0050', '2014-06-06 15:38:57', null, null, '30 35 8 31 3 ? ', '724633:M3', '4028824e466fc4400146701dc3ee0050', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc4400146701dc3ee0051', '2014-06-06 15:38:57', null, null, '30 35 8 29 3 ? ', '724633:M4', '4028824e466fc4400146701dc3ee0051', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc4400146701dc3ee0052', '2014-06-06 15:38:57', null, null, '30 35 8 21 4 ? ', '724633:M5', '4028824e466fc4400146701dc3ee0052', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a1fb005b', '2014-06-06 15:59:33', null, null, '30 35 8 14 3 ? ', '812153:M0', '4028824e466fc44001467030a1fb005b', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a1fb005c', '2014-06-06 15:59:33', null, null, '30 35 8 28 3 ? ', '812153:M1', '4028824e466fc44001467030a1fb005c', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a1fb005d', '2014-06-06 15:59:33', null, null, '30 35 8 12 3 ? ', '812153:M2', '4028824e466fc44001467030a1fb005d', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a20b005e', '2014-06-06 15:59:33', null, null, '30 35 8 6 2 ? ', '812153:M3', '4028824e466fc44001467030a20b005e', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a20b005f', '2014-06-06 15:59:33', null, null, '30 35 8 7 3 ? ', '812153:M4', '4028824e466fc44001467030a20b005f', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a20b0060', '2014-06-06 15:59:33', null, null, '30 35 8 8 2 ? ', '812153:M5', '4028824e466fc44001467030a20b0060', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a20b0061', '2014-06-06 15:59:33', null, null, '30 35 8 5 3 ? ', '812153:M6', '4028824e466fc44001467030a20b0061', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467030a20b0062', '2014-06-06 15:59:33', null, null, '30 35 8 26 3 ? ', '812153:M7', '4028824e466fc44001467030a20b0062', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00aa', '2014-06-09 11:41:02', null, null, '30 35 8 19 2 ? ', '100513:M0', '4028824e466fc44001467eb7087d00aa', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00ab', '2014-06-09 11:41:02', null, null, '30 35 8 24 1 ? ', '100513:M1', '4028824e466fc44001467eb7087d00ab', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00ac', '2014-06-09 11:41:02', null, null, '30 35 8 12 3 ? ', '100513:M2', '4028824e466fc44001467eb7087d00ac', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00ad', '2014-06-09 11:41:02', null, null, '30 35 8 31 3 ? ', '100513:M3', '4028824e466fc44001467eb7087d00ad', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00ae', '2014-06-09 11:41:02', null, null, '30 35 8 22 1 ? ', '100513:M4', '4028824e466fc44001467eb7087d00ae', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00af', '2014-06-09 11:41:02', null, null, '30 35 8 2 4 ? ', '100513:M5', '4028824e466fc44001467eb7087d00af', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b0', '2014-06-09 11:41:02', null, null, '30 35 8 21 2 ? ', '100513:M6', '4028824e466fc44001467eb7087d00b0', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b1', '2014-06-09 11:41:02', null, null, '30 35 8 7 3 ? ', '100513:M7', '4028824e466fc44001467eb7087d00b1', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b2', '2014-06-09 11:41:02', null, null, '30 35 8 5 3 ? ', '100513:M8', '4028824e466fc44001467eb7087d00b2', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b3', '2014-06-09 11:41:02', null, null, '30 35 8 14 3 ? ', '100513:M9', '4028824e466fc44001467eb7087d00b3', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b4', '2014-06-09 11:41:02', null, null, '30 35 8 28 1 ? ', '100513:M10', '4028824e466fc44001467eb7087d00b4', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b5', '2014-06-09 11:41:02', null, null, '30 35 8 26 2 ? ', '100513:M11', '4028824e466fc44001467eb7087d00b5', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b6', '2014-06-09 11:41:02', null, null, '30 35 8 29 3 ? ', '100513:M12', '4028824e466fc44001467eb7087d00b6', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b7', '2014-06-09 11:41:02', null, null, '30 35 8 28 2 ? ', '100513:M13', '4028824e466fc44001467eb7087d00b7', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467eb7087d00b8', '2014-06-09 11:41:02', null, null, '30 35 8 4 4 ? ', '100513:M14', '4028824e466fc44001467eb7087d00b8', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467ebe4e5d00b9', '2014-06-09 11:48:59', null, null, '30 35 8 31 5 ? ', '922860:M0', '4028824e466fc44001467ebe4e5d00b9', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467ebe4e5d00ba', '2014-06-09 11:48:59', null, null, '30 35 8 29 5 ? ', '922860:M1', '4028824e466fc44001467ebe4e5d00ba', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467ebe4e5d00bb', '2014-06-09 11:48:59', null, null, '30 35 8 20 2 ? ', '922860:M2', '4028824e466fc44001467ebe4e5d00bb', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467ebe4e5d00bc', '2014-06-09 11:48:59', null, null, '30 35 8 18 2 ? ', '922860:M3', '4028824e466fc44001467ebe4e5d00bc', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467fd6fc3100dc', '2014-06-09 16:55:34', null, null, '30 35 8 8 3 ? ', '963078:M0', '4028824e466fc44001467fd6fc3100dc', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467fd6fc4100dd', '2014-06-09 16:55:34', null, null, '30 35 8 25 4 ? ', '963078:M1', '4028824e466fc44001467fd6fc4100dd', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467fd6fc4100de', '2014-06-09 16:55:34', null, null, '30 35 8 10 3 ? ', '963078:M2', '4028824e466fc44001467fd6fc4100de', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467fd6fc4100df', '2014-06-09 16:55:34', null, null, '30 35 8 23 4 ? ', '963078:M3', '4028824e466fc44001467fd6fc4100df', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e466fc44001467fd6fc4100e0', '2014-06-09 16:55:34', null, null, '30 35 8 21 4 ? ', '963078:M4', '4028824e466fc44001467fd6fc4100e0', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ed70008', '2014-06-11 15:48:38', null, null, '30 35 8 31 12 ? ', '217274:M0', '4028824e4689e602014689e66ed70008', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ed70009', '2014-06-11 15:48:38', null, null, '30 35 8 17 9 ? ', '217274:M1', '4028824e4689e602014689e66ed70009', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ed7000a', '2014-06-11 15:48:38', null, null, '30 35 8 2 9 ? ', '217274:M2', '4028824e4689e602014689e66ed7000a', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ed7000b', '2014-06-11 15:48:38', null, null, '30 35 8 30 6 ? ', '217274:M3', '4028824e4689e602014689e66ed7000b', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ee6000c', '2014-06-11 15:48:38', null, null, '30 35 8 15 9 ? ', '217274:M4', '4028824e4689e602014689e66ee6000c', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ee6000d', '2014-06-11 15:48:38', null, null, '30 35 8 29 12 ? ', '217274:M5', '4028824e4689e602014689e66ee6000d', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ee6000e', '2014-06-11 15:48:38', null, null, '30 35 8 28 6 ? ', '217274:M6', '4028824e4689e602014689e66ee6000e', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e602014689e66ee6000f', '2014-06-11 15:48:38', null, null, '30 35 8 29 8 ? ', '217274:M7', '4028824e4689e602014689e66ee6000f', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e60201468a01bb580018', '2014-06-11 16:18:27', null, null, '30 35 8 24 1 ? ', '562037:M0', '4028824e4689e60201468a01bb580018', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e4689e60201468a01bb580019', '2014-06-11 16:18:27', null, null, '30 35 8 22 1 ? ', '562037:M1', '4028824e4689e60201468a01bb580019', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae00026', '2014-06-13 16:11:15', null, null, '30 35 8 28 3 ? ', '648346:M0', '4028824e469431f001469447dae00026', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae00027', '2014-06-13 16:11:15', null, null, '30 35 8 4 3 ? ', '648346:M1', '4028824e469431f001469447dae00027', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae00028', '2014-06-13 16:11:15', null, null, '30 35 8 11 4 ? ', '648346:M2', '4028824e469431f001469447dae00028', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae00029', '2014-06-13 16:11:15', null, null, '30 35 8 22 3 ? ', '648346:M3', '4028824e469431f001469447dae00029', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae0002a', '2014-06-13 16:11:15', null, null, '30 35 8 12 3 ? ', '648346:M4', '4028824e469431f001469447dae0002a', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae0002b', '2014-06-13 16:11:15', null, null, '30 35 8 9 4 ? ', '648346:M5', '4028824e469431f001469447dae0002b', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae0002c', '2014-06-13 16:11:15', null, null, '30 35 8 10 3 ? ', '648346:M6', '4028824e469431f001469447dae0002c', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae0002d', '2014-06-13 16:11:15', null, null, '30 35 8 24 3 ? ', '648346:M7', '4028824e469431f001469447dae0002d', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae0002e', '2014-06-13 16:11:15', null, null, '30 35 8 6 3 ? ', '648346:M8', '4028824e469431f001469447dae0002e', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
INSERT INTO `infox_sysmgr_task` VALUES ('4028824e469431f001469447dae0002f', '2014-06-13 16:11:15', null, null, '30 35 8 26 3 ? ', '648346:M9', '4028824e469431f001469447dae0002f', 'Y', 'com.infox.project.job.ProjectMemberWorkSchedulerEmail', '开发人员期满邮件提醒', null, 'system', '开发人员期满邮件提醒');
