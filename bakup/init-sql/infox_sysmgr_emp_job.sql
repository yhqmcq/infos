/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.206
Source Server Version : 50518
Source Host           : 192.168.2.206:3306
Source Database       : infos

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2014-05-30 10:58:08
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
