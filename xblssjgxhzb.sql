/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 07/04/2019 23:20:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xblssjgxhzb
-- ----------------------------
DROP TABLE IF EXISTS `xblssjgxhzb`;
CREATE TABLE `xblssjgxhzb`  (
  `GBBH` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '光棒编号-订单号',
  `GXBH` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '光纤编号',
  `GXPH` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '光纤小盘盘号',
  `XBBH` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '芯棒编号-方案中',
  `GBGC` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '光棒工厂',
  `GBFX` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '光棒方向',
  `XBXH` int(10) DEFAULT NULL COMMENT '芯棒在方案中序号',
  `XBCD` int(10) DEFAULT NULL COMMENT '芯棒长度',
  `XBGC` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '芯棒工厂',
  `CPLB` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品类别',
  `XBKSWZ` int(10) DEFAULT NULL COMMENT '芯棒开始位置',
  `XBJSWZ` int(10) DEFAULT NULL COMMENT '芯棒介绍位置',
  `CJXH` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '芯棒沉积设备',
  `SJXH` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '芯棒烧结设备',
  `LSRQ` datetime DEFAULT NULL COMMENT '拉丝日期',
  `LSXH` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '拉丝设备',
  `DPJCRQ` datetime DEFAULT NULL COMMENT '大盘检验日期',
  `DQCLKSRQ` datetime DEFAULT NULL COMMENT '氘气处理开始时间',
  `DQCLJSRQ` datetime DEFAULT NULL COMMENT '氘气处理结束时间',
  `XPJCRQ` datetime DEFAULT NULL COMMENT '小盘检验日期',
  `XDGBKSWZ` int(10) DEFAULT NULL COMMENT '相对光棒开始位置',
  `XDGBJSWZ` int(10) DEFAULT NULL COMMENT '相对光棒结束位置',
  `JB` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '光纤级别',
  `SJJB` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '光纤衰减级别',
  `GXCD` float(10, 5) DEFAULT NULL COMMENT '小盘光纤长度',
  `XP1310` float(10, 5) DEFAULT NULL COMMENT '小盘1310',
  `XP1383` float(10, 5) DEFAULT NULL COMMENT '小盘1383',
  `XP1550` float(10, 5) DEFAULT NULL COMMENT '小盘1550',
  `XZJ` float(10, 5) DEFAULT NULL COMMENT '小盘芯层直径',
  `XBYD` float(10, 5) DEFAULT NULL COMMENT '芯棒圆度',
  `XP_BCZJ` float(10, 5) DEFAULT NULL COMMENT '包层直径',
  `BCBYD` float(10, 5) DEFAULT NULL COMMENT '包层不圆度',
  `BTXDWC` float(10, 5) DEFAULT NULL COMMENT '芯/包同心度误差|(um)',
  `JZBC` float(10, 5) DEFAULT NULL COMMENT '2m截止波长|nm',
  `MFD1310` float(10, 5) DEFAULT NULL COMMENT '1310MFD|(um)',
  `MFD1550` float(10, 5) DEFAULT NULL COMMENT '1550MFD|(um)',
  `PMDps1550` float(10, 5) DEFAULT NULL COMMENT '1550PMD|ps/(km)0.5',
  `LSSBC` float(10, 5) DEFAULT NULL COMMENT '零色散波长|(nm)',
  `SSXS1550` float(40, 5) DEFAULT NULL COMMENT '1550色散系数|(ps/nm2)',
  `SS1625` float(40, 5) DEFAULT NULL COMMENT '1625色散|(ps/nm2.km)',
  `SJ1625nm` float(40, 5) DEFAULT NULL COMMENT '1625nm衰减|db',
  `QQD` float(10, 5) DEFAULT NULL COMMENT '翘曲度',
  `DPJCCD` float(10, 5) DEFAULT NULL COMMENT '大盘长度',
  `DP1310` float(10, 5) DEFAULT NULL COMMENT '大盘1310',
  `DP1383` float(10, 5) DEFAULT NULL COMMENT '大盘1383',
  `DP1550` float(10, 5) DEFAULT NULL COMMENT '大盘1550',
  `XCZJ` float(10, 5) DEFAULT NULL COMMENT '芯层直径',
  `XCBYD` float(10, 5) DEFAULT NULL COMMENT '芯层不圆度',
  `DP_BCZJ` float(10, 5) DEFAULT NULL COMMENT '包层直径',
  `DP_BCBYD` float(10, 5) DEFAULT NULL COMMENT '包层不圆度',
  `TXD` float(10, 5) DEFAULT NULL COMMENT '同心度',
  `MCZJ1310` float(10, 5) DEFAULT NULL COMMENT '模场直径1310',
  `MCZJ1550` float(10, 5) DEFAULT NULL COMMENT '模场直径1550',
  `DP_JZBC` float(10, 5) DEFAULT NULL COMMENT '截止波长',
  `DXPCZ1310` float(10, 5) DEFAULT NULL COMMENT '小盘1310-大盘1310',
  `DXPCZ1383` float(10, 5) DEFAULT NULL COMMENT '小盘1383-大盘1383',
  `DXPCZ1550` float(10, 5) DEFAULT NULL COMMENT '小盘1550-大盘1550',
  `SFYB` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否异变',
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`GXPH`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
