/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-05-30 10:58:29
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
INSERT INTO `infox_project_emp_working` VALUES ('018021', '2014-05-23 13:16:24', '2014-02-13', 'PM', '2013-09-22', '1', '0803', null, '259235');
INSERT INTO `infox_project_emp_working` VALUES ('019250', '2014-05-23 10:33:44', '2014-02-26', 'PM', '2013-12-03', '1', '0993', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('044592', '2014-05-29 15:39:33', '2014-04-30', 'PG', '2013-12-02', '1', '0966', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('056032', '2014-05-29 16:25:21', '2014-01-26', 'PG', '2014-01-01', '1', '1257', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('064560', '2014-05-29 08:29:27', '2014-01-31', 'SE', '2013-03-26', '1', '0990', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('065567', '2014-05-29 15:18:22', '2014-03-28', 'SE', '2013-12-02', '1', '0284', null, '756231');
INSERT INTO `infox_project_emp_working` VALUES ('093255', '2014-05-23 11:08:34', '2014-01-26', 'SE', '2013-12-10', '1', '0150', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('102879', '2014-05-26 09:10:15', '2014-01-13', 'PG', '2013-12-03', '1', '1179', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('106749', '2014-05-29 15:29:03', '2014-03-03', 'PG', '2014-02-24', '1', '9063', null, '172734');
INSERT INTO `infox_project_emp_working` VALUES ('113253', '2014-05-29 16:25:22', '2014-02-28', 'PG', '2014-01-01', '1', '0694', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('123744', '2014-05-29 08:29:27', '2014-01-31', 'PM', '2013-03-12', '1', '0559', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('135096', '2014-05-29 08:29:41', '2014-01-12', '高级PG', '2013-08-07', '1', '1150', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('181255', '2014-05-29 08:29:27', '2014-01-31', 'SE', '2013-03-01', '1', '1215', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('186415', '2014-05-29 15:29:03', '2014-02-21', 'PL', '2013-09-22', '1', '9062', null, '172734');
INSERT INTO `infox_project_emp_working` VALUES ('189126', '2014-05-23 13:25:45', '2014-02-28', 'PG', '2013-12-10', '1', '1214', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('199401', '2014-05-29 16:25:22', '2014-01-24', 'PG', '2014-01-01', '1', '1015', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('203708', '2014-05-26 09:10:15', '2014-02-12', 'SE', '2013-12-03', '1', '1074', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('229690', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-03', '1', '1145', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('231532', '2014-05-30 09:33:37', '2014-02-22', 'BSE', '2014-01-15', '1', '0624', null, '967405');
INSERT INTO `infox_project_emp_working` VALUES ('248819', '2014-05-23 13:22:02', '2014-01-09', 'SE', '2013-09-11', '1', '0679', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('261897', '2014-05-26 09:10:15', '2014-02-12', 'PM', '2013-12-03', '1', '1084', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('320394', '2014-05-23 09:44:27', '2014-01-17', 'SE', '2013-12-19', '1', '0032', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('332915', '2014-05-23 09:44:27', '2014-01-17', 'PM', '2013-11-16', '1', '1223', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('358412', '2014-05-26 09:10:15', '2014-02-12', 'SE', '2013-12-03', '1', '1234', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('359825', '2014-05-30 10:30:37', '2014-01-24', '', '2013-07-23', '1', '1156', null, '562037');
INSERT INTO `infox_project_emp_working` VALUES ('375252', '2014-05-26 09:10:15', '2014-02-12', '初級PG1', '2013-12-10', '1', '1255', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('376547', '2014-05-30 09:29:37', '2014-01-10', 'SE', '2014-01-09', '4', '0624', null, '040856');
INSERT INTO `infox_project_emp_working` VALUES ('389515', '2014-05-23 09:44:27', '2014-01-19', 'SE', '2013-11-15', '1', '0053', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('402484', '2014-05-29 16:25:22', '2014-01-17', 'PG', '2014-01-01', '1', '0752', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('406888', '2014-05-23 09:44:56', '2014-01-17', 'PG', '2014-01-13', '1', '0748', null, '930788');
INSERT INTO `infox_project_emp_working` VALUES ('453788', '2014-05-23 13:22:02', '2014-01-09', '初級PG1', '2013-09-11', '1', '1250', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('485741', '2014-05-29 15:24:35', '2013-12-31', 'SE', '2013-11-01', '1', '0621', null, '884747');
INSERT INTO `infox_project_emp_working` VALUES ('508758', '2014-05-29 08:29:41', '2014-01-22', 'PG', '2013-11-04', '1', '1247', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('513811', '2014-05-30 09:33:37', '2014-03-22', 'BSE', '2014-01-15', '1', '0670', null, '967405');
INSERT INTO `infox_project_emp_working` VALUES ('526536', '2014-05-30 09:33:37', '2014-03-22', 'BSE', '2014-02-23', '1', '0666', null, '967405');
INSERT INTO `infox_project_emp_working` VALUES ('540549', '2014-05-23 09:44:56', '2014-01-27', 'PG', '2014-01-13', '1', '1028', null, '930788');
INSERT INTO `infox_project_emp_working` VALUES ('545329', '2014-05-29 08:29:27', '2014-01-31', 'PG', '2013-03-26', '1', '0714', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('553437', '2014-05-29 15:18:22', '2014-03-06', 'SE', '2013-12-02', '1', '0569', null, '756231');
INSERT INTO `infox_project_emp_working` VALUES ('559877', '2014-05-26 09:10:15', '2014-02-12', '初級PG1', '2013-12-10', '1', '1287', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('572686', '2014-05-30 10:30:37', '2014-01-24', '', '2013-07-23', '1', '1178', null, '562037');
INSERT INTO `infox_project_emp_working` VALUES ('574512', '2014-05-23 09:43:15', '2014-01-19', 'PM', '2012-09-27', '1', '1219', null, '232261');
INSERT INTO `infox_project_emp_working` VALUES ('574550', '2014-05-29 15:18:22', '2014-03-28', 'PM', '2013-12-02', '1', '0190', null, '756231');
INSERT INTO `infox_project_emp_working` VALUES ('578526', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-03', '1', '1082', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('593519', '2014-05-29 08:42:57', '2014-02-28', 'SE', '2013-11-21', '1', '6014', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('598150', '2014-05-29 16:25:22', '2014-02-03', 'PG', '2014-01-01', '1', '1240', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('607292', '2014-05-23 11:08:34', '2014-01-26', 'PG', '2013-12-10', '1', '1237', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('608003', '2014-05-29 08:29:41', '2014-01-12', '高级PG', '2013-08-07', '1', '0985', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('608220', '2014-05-23 11:08:34', '2014-02-21', 'PM', '2013-12-10', '1', '0520', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('608630', '2014-05-23 13:25:45', '2014-02-28', 'PM', '2013-12-16', '1', '0027', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('629758', '2014-05-23 13:19:47', '2014-01-28', 'SE', '2013-09-22', '1', '0669', null, '484656');
INSERT INTO `infox_project_emp_working` VALUES ('646388', '2014-05-23 13:22:02', '2014-01-30', '初級PG1', '2013-09-11', '1', '1274', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('651211', '2014-05-23 09:44:27', '2014-01-17', 'PG', '2013-12-12', '1', '1211', null, '669576');
INSERT INTO `infox_project_emp_working` VALUES ('663626', '2014-05-23 13:25:45', '2014-01-25', 'SE', '2013-12-10', '1', '0590', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('668902', '2014-05-23 09:44:56', '2014-01-14', 'PG', '2014-01-10', '1', '0753', null, '930788');
INSERT INTO `infox_project_emp_working` VALUES ('685162', '2014-05-23 13:25:45', '2014-01-10', 'SE', '2013-12-10', '1', '0676', null, '903080');
INSERT INTO `infox_project_emp_working` VALUES ('701591', '2014-05-23 13:22:02', '2014-01-09', 'PG', '2013-10-09', '1', '1282', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('702665', '2014-05-23 13:19:47', '2014-02-11', 'PM', '2013-09-03', '1', '0155', null, '484656');
INSERT INTO `infox_project_emp_working` VALUES ('711632', '2014-05-29 15:39:33', '2014-02-12', '初級PG2', '2013-12-02', '1', '1206', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('731099', '2014-05-23 13:22:02', '2014-01-09', 'PM', '2013-09-02', '1', '1225', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('735063', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-16', '1', '1220', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('762438', '2014-05-29 15:39:33', '2014-04-30', 'SE', '2013-12-02', '1', '0671', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('769857', '2014-05-29 08:42:46', '2014-02-28', 'PM', '2013-10-09', '1', '6001', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('771651', '2014-05-23 13:22:02', '2014-01-09', 'SE', '2013-09-24', '1', '0850', null, '264706');
INSERT INTO `infox_project_emp_working` VALUES ('777773', '2014-05-29 08:29:27', '2014-01-31', 'SE', '2013-03-12', '1', '0938', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('782840', '2014-05-30 09:17:06', '2014-03-28', 'BSE', '2013-10-06', '1', '0070', null, '360952');
INSERT INTO `infox_project_emp_working` VALUES ('799726', '2014-05-29 15:39:33', '2014-04-18', 'PM', '2013-12-02', '1', '0351', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('802323', '2014-05-29 08:29:27', '2014-01-31', 'PM', '2013-03-12', '1', '0067', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('806308', '2014-05-29 16:25:21', '2014-01-05', 'PG', '2014-01-01', '1', '1172', null, '712974');
INSERT INTO `infox_project_emp_working` VALUES ('823239', '2014-05-23 10:33:44', '2014-02-26', 'PG', '2013-12-03', '1', '1060', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('823813', '2014-05-23 10:33:44', '2014-01-24', 'PG', '2013-12-03', '1', '1099', null, '570315');
INSERT INTO `infox_project_emp_working` VALUES ('851292', '2014-05-26 09:10:15', '2014-02-12', 'PG', '2013-12-03', '1', '1071', null, '844509');
INSERT INTO `infox_project_emp_working` VALUES ('895290', '2014-05-30 10:30:37', '2014-01-24', '', '2013-07-23', '1', '1104', null, '562037');
INSERT INTO `infox_project_emp_working` VALUES ('920857', '2014-05-29 15:24:35', '2014-03-31', 'SE', '2013-11-01', '1', '0627', null, '884747');
INSERT INTO `infox_project_emp_working` VALUES ('933557', '2014-05-29 15:39:33', '2014-02-24', '初級PG2', '2013-12-02', '1', '1175', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('936696', '2014-05-29 08:29:41', '2014-01-12', 'SE', '2013-08-07', '1', '0498', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('938975', '2014-05-29 15:39:33', '2014-01-10', 'PG', '2013-12-02', '1', '0718', null, '806257');
INSERT INTO `infox_project_emp_working` VALUES ('949449', '2014-05-23 11:08:34', '2014-01-26', 'PG', '2013-12-16', '1', '1158', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('976204', '2014-05-23 10:34:36', '2014-02-14', 'PM', '2013-12-16', '1', '0428', null, '675005');
INSERT INTO `infox_project_emp_working` VALUES ('988770', '2014-05-23 11:08:34', '2014-01-26', 'SE', '2013-12-10', '1', '0866', null, '800184');
INSERT INTO `infox_project_emp_working` VALUES ('989426', '2014-05-29 08:29:27', '2014-01-31', 'PM', '2013-03-01', '1', '0806', null, '096831');
INSERT INTO `infox_project_emp_working` VALUES ('990515', '2014-05-29 08:29:41', '2014-01-02', 'PG', '2013-11-14', '1', '1263', null, '252921');
INSERT INTO `infox_project_emp_working` VALUES ('992792', '2014-05-23 10:34:36', '2014-01-27', 'PG', '2013-12-16', '1', '1236', null, '675005');
INSERT INTO `infox_project_emp_working` VALUES ('996693', '2014-05-23 09:44:56', '2014-01-17', 'PG', '2014-01-13', '1', '1296', null, '930788');

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
INSERT INTO `infox_project_maillist` VALUES ('006729', '0050', '264706');
INSERT INTO `infox_project_maillist` VALUES ('037547', '0100', '930788');
INSERT INTO `infox_project_maillist` VALUES ('040978', '1000', '252921');
INSERT INTO `infox_project_maillist` VALUES ('043725', '1300', '252921');
INSERT INTO `infox_project_maillist` VALUES ('047015', '0317', '562037');
INSERT INTO `infox_project_maillist` VALUES ('056194', '0317', '675005');
INSERT INTO `infox_project_maillist` VALUES ('067681', '1000', '096831');
INSERT INTO `infox_project_maillist` VALUES ('088647', '0317', '930788');
INSERT INTO `infox_project_maillist` VALUES ('103266', '0100', '844509');
INSERT INTO `infox_project_maillist` VALUES ('110434', '0317', '570315');
INSERT INTO `infox_project_maillist` VALUES ('111031', '9010', '172734');
INSERT INTO `infox_project_maillist` VALUES ('119099', '0317', '806257');
INSERT INTO `infox_project_maillist` VALUES ('155211', '0449', '570315');
INSERT INTO `infox_project_maillist` VALUES ('155852', '0317', '756231');
INSERT INTO `infox_project_maillist` VALUES ('164887', '0559', '562037');
INSERT INTO `infox_project_maillist` VALUES ('177408', '0317', '712974');
INSERT INTO `infox_project_maillist` VALUES ('180336', '0100', '562037');
INSERT INTO `infox_project_maillist` VALUES ('195511', '0317', '172734');
INSERT INTO `infox_project_maillist` VALUES ('204213', '1300', '806257');
INSERT INTO `infox_project_maillist` VALUES ('224137', '0449', '096831');
INSERT INTO `infox_project_maillist` VALUES ('228069', '0190', '484656');
INSERT INTO `infox_project_maillist` VALUES ('276618', '1300', '040856');
INSERT INTO `infox_project_maillist` VALUES ('280298', '0449', '884747');
INSERT INTO `infox_project_maillist` VALUES ('286233', '0449', '252921');
INSERT INTO `infox_project_maillist` VALUES ('294082', '0100', '172734');
INSERT INTO `infox_project_maillist` VALUES ('299322', '0449', '930788');
INSERT INTO `infox_project_maillist` VALUES ('302320', '1300', '675005');
INSERT INTO `infox_project_maillist` VALUES ('316416', '1300', '259235');
INSERT INTO `infox_project_maillist` VALUES ('317955', '1300', '800184');
INSERT INTO `infox_project_maillist` VALUES ('353585', '0317', '264706');
INSERT INTO `infox_project_maillist` VALUES ('359180', '0317', '096831');
INSERT INTO `infox_project_maillist` VALUES ('362099', '1300', '884747');
INSERT INTO `infox_project_maillist` VALUES ('375402', '0100', '484656');
INSERT INTO `infox_project_maillist` VALUES ('397659', '0190', '712974');
INSERT INTO `infox_project_maillist` VALUES ('398791', '1300', '967405');
INSERT INTO `infox_project_maillist` VALUES ('400162', '0675', '903080');
INSERT INTO `infox_project_maillist` VALUES ('401217', '0100', '884747');
INSERT INTO `infox_project_maillist` VALUES ('410595', '0449', '562037');
INSERT INTO `infox_project_maillist` VALUES ('418608', '1300', '903080');
INSERT INTO `infox_project_maillist` VALUES ('464515', '0317', '360952');
INSERT INTO `infox_project_maillist` VALUES ('480407', '0317', '484656');
INSERT INTO `infox_project_maillist` VALUES ('482864', '0317', '844509');
INSERT INTO `infox_project_maillist` VALUES ('486712', '0100', '669576');
INSERT INTO `infox_project_maillist` VALUES ('520367', '0449', '844509');
INSERT INTO `infox_project_maillist` VALUES ('534940', '0190', '930788');
INSERT INTO `infox_project_maillist` VALUES ('559177', '1300', '712974');
INSERT INTO `infox_project_maillist` VALUES ('559355', '0190', '232261');
INSERT INTO `infox_project_maillist` VALUES ('561718', '0190', '259235');
INSERT INTO `infox_project_maillist` VALUES ('566188', '1300', '669576');
INSERT INTO `infox_project_maillist` VALUES ('567547', '0449', '259235');
INSERT INTO `infox_project_maillist` VALUES ('567987', '1300', '844509');
INSERT INTO `infox_project_maillist` VALUES ('570104', '1300', '264706');
INSERT INTO `infox_project_maillist` VALUES ('582675', '0100', '040856');
INSERT INTO `infox_project_maillist` VALUES ('604467', '0317', '252921');
INSERT INTO `infox_project_maillist` VALUES ('610174', '0449', '264706');
INSERT INTO `infox_project_maillist` VALUES ('616800', '0190', '669576');
INSERT INTO `infox_project_maillist` VALUES ('617865', '0449', '360952');
INSERT INTO `infox_project_maillist` VALUES ('626371', '0449', '800184');
INSERT INTO `infox_project_maillist` VALUES ('626398', '0449', '484656');
INSERT INTO `infox_project_maillist` VALUES ('645199', '0449', '903080');
INSERT INTO `infox_project_maillist` VALUES ('658563', '0817', '844509');
INSERT INTO `infox_project_maillist` VALUES ('666528', '0190', '756231');
INSERT INTO `infox_project_maillist` VALUES ('668122', '0449', '172734');
INSERT INTO `infox_project_maillist` VALUES ('674160', '0449', '232261');
INSERT INTO `infox_project_maillist` VALUES ('674703', '1300', '930788');
INSERT INTO `infox_project_maillist` VALUES ('687984', '1300', '172734');
INSERT INTO `infox_project_maillist` VALUES ('689891', '0675', '360952');
INSERT INTO `infox_project_maillist` VALUES ('725120', '0317', '259235');
INSERT INTO `infox_project_maillist` VALUES ('729706', '0317', '669576');
INSERT INTO `infox_project_maillist` VALUES ('745989', '0100', '252921');
INSERT INTO `infox_project_maillist` VALUES ('748359', '0100', '967405');
INSERT INTO `infox_project_maillist` VALUES ('752015', '0100', '096831');
INSERT INTO `infox_project_maillist` VALUES ('756647', '0449', '712974');
INSERT INTO `infox_project_maillist` VALUES ('758845', '0317', '884747');
INSERT INTO `infox_project_maillist` VALUES ('765011', '0100', '800184');
INSERT INTO `infox_project_maillist` VALUES ('768918', '0100', '232261');
INSERT INTO `infox_project_maillist` VALUES ('774524', '0100', '264706');
INSERT INTO `infox_project_maillist` VALUES ('787372', '0007', '040856');
INSERT INTO `infox_project_maillist` VALUES ('789153', '1300', '562037');
INSERT INTO `infox_project_maillist` VALUES ('789161', '0449', '756231');
INSERT INTO `infox_project_maillist` VALUES ('796675', '1300', '360952');
INSERT INTO `infox_project_maillist` VALUES ('797515', '0100', '360952');
INSERT INTO `infox_project_maillist` VALUES ('800909', '0449', '669576');
INSERT INTO `infox_project_maillist` VALUES ('867541', '0817', '570315');
INSERT INTO `infox_project_maillist` VALUES ('868028', '0100', '756231');
INSERT INTO `infox_project_maillist` VALUES ('878677', '0317', '967405');
INSERT INTO `infox_project_maillist` VALUES ('879022', '0317', '040856');
INSERT INTO `infox_project_maillist` VALUES ('879516', '0100', '259235');
INSERT INTO `infox_project_maillist` VALUES ('880921', '1300', '484656');
INSERT INTO `infox_project_maillist` VALUES ('884945', '0449', '806257');
INSERT INTO `infox_project_maillist` VALUES ('892719', '0675', '967405');
INSERT INTO `infox_project_maillist` VALUES ('907238', '0100', '570315');
INSERT INTO `infox_project_maillist` VALUES ('911959', '1300', '232261');
INSERT INTO `infox_project_maillist` VALUES ('914395', '0449', '040856');
INSERT INTO `infox_project_maillist` VALUES ('930164', '0317', '232261');
INSERT INTO `infox_project_maillist` VALUES ('937306', '0817', '800184');
INSERT INTO `infox_project_maillist` VALUES ('939926', '0823', '967405');
INSERT INTO `infox_project_maillist` VALUES ('940514', '0050', '884747');
INSERT INTO `infox_project_maillist` VALUES ('941130', '0817', '675005');
INSERT INTO `infox_project_maillist` VALUES ('950942', '0100', '712974');
INSERT INTO `infox_project_maillist` VALUES ('962740', '0100', '675005');
INSERT INTO `infox_project_maillist` VALUES ('966150', '0317', '800184');
INSERT INTO `infox_project_maillist` VALUES ('974101', '1300', '570315');
INSERT INTO `infox_project_maillist` VALUES ('975322', '0100', '903080');
INSERT INTO `infox_project_maillist` VALUES ('977959', '0449', '967405');
INSERT INTO `infox_project_maillist` VALUES ('980105', '1300', '096831');
INSERT INTO `infox_project_maillist` VALUES ('980416', '0449', '675005');
INSERT INTO `infox_project_maillist` VALUES ('987104', '0100', '806257');
INSERT INTO `infox_project_maillist` VALUES ('989439', '0317', '903080');

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
INSERT INTO `infox_project_overtime` VALUES ('090144', '2014-05-26 11:23:49', null, '0', '0', null, '8.1', '8.1', null, '14', '14', '1237', '800184');
INSERT INTO `infox_project_overtime` VALUES ('167926', '2014-05-26 10:14:46', null, '0', '0', null, '101', '101', null, '55', '55', '1074', '844509');
INSERT INTO `infox_project_overtime` VALUES ('238444', '2014-05-26 10:19:51', null, '0', '0', null, '54', '54', null, '0', '0', '1234', '844509');
INSERT INTO `infox_project_overtime` VALUES ('350664', '2014-05-26 10:59:48', null, '0', '0', null, '20', '20', null, '11', '11', '0428', '675005');
INSERT INTO `infox_project_overtime` VALUES ('356947', '2014-05-26 10:21:21', null, '0', '0', null, '24.5', '24.5', null, '9', '9', '1255', '844509');
INSERT INTO `infox_project_overtime` VALUES ('427730', '2014-05-26 09:53:30', null, '0', '0', null, '0', '0', null, '24.5', '24.5', '1219', '232261');
INSERT INTO `infox_project_overtime` VALUES ('461306', '2014-05-27 11:20:07', null, '0', '0', null, '45.9', '45.9', null, '34.2', '34.2', '0850', '264706');
INSERT INTO `infox_project_overtime` VALUES ('480671', '2014-05-26 11:24:35', null, '0', '0', null, '49.7', '49.7', null, '20', '20', '1158', '800184');
INSERT INTO `infox_project_overtime` VALUES ('529827', '2014-05-26 10:12:24', null, '0', '0', null, '28', '28', null, '6.5', '6.5', '1179', '844509');
INSERT INTO `infox_project_overtime` VALUES ('542325', '2014-05-26 10:22:12', null, '0', '0', null, '2', '2', null, '18', '18', '1287', '844509');
INSERT INTO `infox_project_overtime` VALUES ('561175', '2014-05-26 11:20:07', null, '0', '0', null, '29.9', '29.9', null, '4.7', '4.7', '0866', '800184');
INSERT INTO `infox_project_overtime` VALUES ('575858', '2014-05-26 10:25:38', null, '0', '0', null, '68.5', '68.5', null, '46.5', '46.5', '1082', '844509');
INSERT INTO `infox_project_overtime` VALUES ('580246', '2014-05-26 11:33:44', null, '0', '0', null, '34.8', '34.8', null, '23', '23', '0993', '570315');
INSERT INTO `infox_project_overtime` VALUES ('591939', '2014-05-26 11:00:46', null, '0', '0', null, '1', '1', null, '0', '0', '1236', '675005');
INSERT INTO `infox_project_overtime` VALUES ('658025', '2014-05-26 10:26:41', null, '0', '0', null, '86', '86', null, '35', '35', '1220', '844509');
INSERT INTO `infox_project_overtime` VALUES ('729267', '2014-05-27 11:18:40', null, '0', '0', null, '103.9', '103.9', null, '55.2', '55.2', '1225', '264706');
INSERT INTO `infox_project_overtime` VALUES ('733445', '2014-05-26 10:27:16', null, '0', '0', null, '74', '74', null, '0', '0', '1071', '844509');
INSERT INTO `infox_project_overtime` VALUES ('747235', '2014-05-26 11:18:59', null, '0', '0', null, '0', '0', null, '6.6', '6.6', '0150', '800184');
INSERT INTO `infox_project_overtime` VALUES ('751849', '2014-05-26 11:22:59', null, '0', '0', null, '70.6', '70.6', null, '45.8', '45.8', '0520', '800184');
INSERT INTO `infox_project_overtime` VALUES ('777042', '2014-05-26 10:47:46', null, '0', '0', null, '0', '0', null, '8', '8', '0027', '903080');
INSERT INTO `infox_project_overtime` VALUES ('786413', '2014-05-27 11:03:47', null, '0', '0', null, '17.1', '17.1', null, '8.9', '8.9', '0679', '264706');
INSERT INTO `infox_project_overtime` VALUES ('796647', '2014-05-26 10:16:40', null, '0', '0', null, '52.5', '52.5', null, '49.5', '49.5', '1145', '844509');
INSERT INTO `infox_project_overtime` VALUES ('830795', '2014-05-26 11:35:44', null, '0', '0', null, '35.2', '35.2', null, '7.9', '7.9', '1099', '570315');
INSERT INTO `infox_project_overtime` VALUES ('848816', '2014-05-27 11:12:16', null, '0', '0', null, '20.7', '20.7', null, '30', '30', '1250', '264706');
INSERT INTO `infox_project_overtime` VALUES ('914095', '2014-05-26 11:34:35', null, '0', '0', null, '29.3', '29.3', null, '29.9', '29.9', '1060', '570315');
INSERT INTO `infox_project_overtime` VALUES ('921620', '2014-05-26 10:18:24', null, '0', '0', null, '139.5', '139.5', null, '17.5', '17.5', '1084', '844509');
INSERT INTO `infox_project_overtime` VALUES ('930316', '2014-05-26 10:49:02', null, '0', '0', null, '0', '0', null, '7', '7', '1214', '903080');
INSERT INTO `infox_project_overtime` VALUES ('971941', '2014-05-27 11:13:44', null, '0', '0', null, '16.5', '16.5', null, '21.8', '21.8', '1274', '264706');

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
INSERT INTO `infox_project_project` VALUES ('040856', null, '140318-2-1', '2014-05-29 16:37:41', '0317', '黄丽嫦', null, '2014-01-10 00:00:00', '2014-05-29 16:37:41', 'ISO27001信息安全体系内部审核', '140318-2-1', '', '', '', '', '', null, '0', null, null, null, '公司内部业务', '', '', '1', '0', '2014-01-09 00:00:00', '3', '', null, '647431', '0007', null, '3', '', '');
INSERT INTO `infox_project_project` VALUES ('096831', null, '110512-1-19', '2014-05-29 08:32:37', '0317', '黄丽嫦', null, '2014-01-31 00:00:00', '2014-05-29 08:32:37', '武汉APAC IFS系统导入', '110512-1-19', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '0', '2013-03-01 00:00:00', '1', '', null, '461023', '0067', null, '2', '', '');
INSERT INTO `infox_project_project` VALUES ('172734', null, '130812-1-1', '2014-05-29 15:29:03', null, null, null, '2014-03-31 00:00:00', '2014-05-29 15:29:03', 'KSSOL様向け資材＆会計システム開発', '130812-1-1', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-05-20 00:00:00', '1', null, null, '886155', '9051', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('232261', null, '120806-1', '2014-05-28 09:14:24', '0449', '符晓燕', null, '2014-01-19 00:00:00', '2014-05-28 09:14:24', 'TOSS DLR配车供需表改善', '120806-1', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2012-07-16 00:00:00', '1', '', null, '548996', '1219', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('252921', null, '110512-1', '2014-05-29 08:31:38', '0317', '黄丽嫦', null, '2014-01-22 00:00:00', '2014-05-29 08:31:38', 'IFSシステム保守作業 ', '110512-1', '', '', '', '', '', null, '0', null, null, null, '', '', '', '1', '0', '2011-04-21 00:00:00', '1', '', null, '461023', '0207', null, '2', '', '');
INSERT INTO `infox_project_project` VALUES ('259235', null, '131104-1-2', '2014-05-28 09:15:13', '0449', '符晓燕', null, '2014-02-13 00:00:00', '2014-05-28 09:15:13', '业务支援', '131104-1-2', '', '1.95', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '1', '2013-09-22 00:00:00', '1', '', null, '548996', '0803', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('264706', null, '130912-1-1', '2014-05-28 09:14:14', '0449', '符晓燕', null, '2014-02-28 00:00:00', '2014-05-28 09:14:14', '中国保险家移动资讯平台圈子功能开发', '130912-1-1', '3', '10', '', '', '-100', null, '30', null, null, null, '公司内部研发项目', '3', '10', '1', '0', '2013-09-06 00:00:00', '1', '需求分析~CT', null, '126300', '1225', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('360952', null, '121228-10/11', '2014-05-30 09:18:24', '0317', '黄丽嫦', null, '2014-03-28 00:00:00', '2014-05-30 09:18:24', '松原市国保導入作業', '121228-10/11', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '0', '2013-10-06 00:00:00', '1', '', null, '702229', '0070', null, '', '', '');
INSERT INTO `infox_project_project` VALUES ('484656', null, '130913-1-1', '2014-05-28 09:15:35', '0449', '符晓燕', null, '2014-02-11 00:00:00', '2014-05-28 09:15:35', 'i-CROP再構築', '130913-1-1', '', '18.23', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-09-09 00:00:00', '1', '', null, '548996', '0155', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('562037', null, '130723-1-1', '2014-05-30 10:30:37', null, null, null, '2014-01-24 00:00:00', '2014-05-30 10:30:37', '客户关系管理 (CRM) 系统-上海微创', '130723-1-1', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-07-23 00:00:00', '0', null, null, '886155', '9001', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('570315', null, '091118-1-38', '2014-05-28 09:14:57', '0449', '符晓燕', null, '2014-02-26 00:00:00', '2014-05-28 09:14:57', 'ADWORLD農家台帳系统开发', '091118-1-38', '', '4.4', '0.15', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-02 00:00:00', '1', 'DD~CT', null, '723327', '0993', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('669576', null, '131219-1-1', '2014-05-28 09:15:07', '0449', '符晓燕', null, '2014-01-10 00:00:00', '2014-05-28 09:15:07', 'DLR车辆展示系统', '131219-1-1', '', '', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '0', '2013-11-16 00:00:00', '1', '', null, '548996', '1223', null, '2', '0', '');
INSERT INTO `infox_project_project` VALUES ('675005', null, '120611-1-16', '2014-05-28 09:15:28', '0449', '符晓燕', null, '2014-02-14 00:00:00', '2014-05-28 09:15:28', 'AD機能改善（料金共通）２月', '120611-1-16', '', '4.5', '0.15', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-16 00:00:00', '1', 'DD~CT', null, '723327', '0428', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('712974', null, '090923-1', '2014-05-29 16:25:21', null, null, null, '2014-02-28 00:00:00', '2014-05-29 16:25:21', 'e-CRB系统应用维护', '090923-1', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-01-01 00:00:00', '1', null, null, '548996', '049', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('756231', null, '090923-2', '2014-05-29 15:18:22', null, null, null, '2014-03-28 00:00:00', '2014-05-29 15:18:22', '中古車e-ビジネスプラットフォーム改善に基づいてUMS側の改善開発', '090923-2', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-12-02 00:00:00', '1', null, null, '548996', '0190', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('800184', null, '130919-1-2', '2014-05-28 09:14:41', '0449', '符晓燕', null, '2014-02-21 00:00:00', '2014-05-28 09:14:41', 'ADWORLD福祉系统开发', '130919-1-2', '', '4.3', '0.20', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-10 00:00:00', '1', '詳細設計～ＵＴ', null, '723327', '0520', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('806257', null, '101111-1-11', '2014-05-29 15:39:33', null, null, null, '2014-04-30 00:00:00', '2014-05-29 15:39:33', '地域包括ケアＶ２．５対応作業', '101111-1-11', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-12-02 00:00:00', '1', null, null, '702229', '0351', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('844509', null, '120731-1-14', '2014-05-28 09:15:45', '0449', '符晓燕', null, '2014-02-12 00:00:00', '2014-05-28 09:15:45', 'ADWORLD国民年金系统开发', '120731-1-14', '', '0.8', '0.15', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2013-12-02 00:00:00', '1', 'DD~CT', null, '723327', '1084', null, '', '0', '');
INSERT INTO `infox_project_project` VALUES ('884747', null, '090831-1-6', '2014-05-29 15:24:35', null, null, null, '2014-03-31 00:00:00', '2014-05-29 15:24:35', '住友林業開発案件_基本設計作成', '090831-1-6', null, null, null, null, null, null, '0', null, null, null, null, null, null, '1', '0', '2013-11-01 00:00:00', '1', null, null, '126300', '055', null, null, null, null);
INSERT INTO `infox_project_project` VALUES ('903080', null, '131209-1-1', '2014-05-28 09:14:51', '0449', '符晓燕', null, '2014-02-28 00:00:00', '2014-05-28 09:14:51', '日立粉末冶金様　資材システム開発', '131209-1-1', '1.10', '5.77', '0.25', '', '33.3%', null, '6.36', null, null, null, '项目委托', '0.82', '7.77', '1', '1', '2013-12-12 00:00:00', '1', 'DD~CT', null, '702229', '0027', null, '', '1', '');
INSERT INTO `infox_project_project` VALUES ('930788', null, '140110-1-1', '2014-05-28 09:15:53', '0449', '符晓燕', null, '2014-01-27 00:00:00', '2014-05-28 09:15:53', 'ADAM機能追加iOS７対応', '140110-1-1', '', '1.62', '', '', '', null, '0', null, null, null, '项目委托', '', '', '1', '1', '2014-01-13 00:00:00', '1', '', null, '548996', '1046', null, '0', '0', '');
INSERT INTO `infox_project_project` VALUES ('967405', null, '131213-3 ', '2014-05-30 09:35:26', '0317', '黄丽嫦', null, '2014-03-22 00:00:00', '2014-05-30 09:35:26', 'WorksPRO消費税対応（オンサイト作業）', '131213-3 ', '', '', '', '', '', null, '0', null, null, null, '人员派遣', '', '', '1', '0', '2014-01-15 00:00:00', '1', '', null, '702229', '0675', null, '', '', '');
