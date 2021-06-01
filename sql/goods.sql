/*
 Navicat Premium Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : goods

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 03/01/2021 16:04:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_pwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'test', 'test');
INSERT INTO `admin` VALUES (2, 'test1', 'test1');
INSERT INTO `admin` VALUES (3, 'test2', 'test2');
INSERT INTO `admin` VALUES (4, 'test3', 'test3');
INSERT INTO `admin` VALUES (7, 'admin', 'admin');
INSERT INTO `admin` VALUES (8, 'admintest', 'admintest');
INSERT INTO `admin` VALUES (9, '5666', '889999');
INSERT INTO `admin` VALUES (10, 'asfewf', 'ewfwef');
INSERT INTO `admin` VALUES (11, 'huangyubin', '1234');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int(0) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品类型',
  `goods_num` int(0) NULL DEFAULT NULL COMMENT '商品库存',
  `goods_price` int(0) NULL DEFAULT NULL COMMENT '商品售价',
  `goods_bzq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品保质期\r\n',
  `goods_source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品产地',
  `goods_producer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品厂商',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '纯悦矿泉水', '饮料', 82, 2, '1年', '福建厦门市', '可口可乐公司');
INSERT INTO `goods` VALUES (4, '红牛', '饮料', 60, 6, '1年', '北京市怀柔区', '红牛维他命有限公司');
INSERT INTO `goods` VALUES (5, '益达口香糖', '糖果', 44, 10, '1年', '上海松江工业开发区', '玛氏箭牌公司');
INSERT INTO `goods` VALUES (11, '矿泉水', '饮料', 502, 1, '1年', '漳州', '可口可乐');
INSERT INTO `goods` VALUES (12, '苹果', '水果', 650, 2, '15天', '福建宁德', '乌番水果');
INSERT INTO `goods` VALUES (13, '海尔洗衣机', '家电', 19, 4800, '10年', '广东广州', '海尔公司');

-- ----------------------------
-- Table structure for lib
-- ----------------------------
DROP TABLE IF EXISTS `lib`;
CREATE TABLE `lib`  (
  `lib_id` int(0) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_bzq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品保质期\r\n',
  `goods_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品产地',
  `goods_producer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品厂商',
  `goods_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品类型',
  `goods_num` int(0) NULL DEFAULT NULL COMMENT '商品库存',
  `goods_price` int(0) NULL DEFAULT NULL COMMENT '商品售价',
  PRIMARY KEY (`lib_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lib
-- ----------------------------
INSERT INTO `lib` VALUES (1, '纯悦矿泉水', '1年', '福建厦门市', '可口可乐公司', '饮料', 880, 2);
INSERT INTO `lib` VALUES (2, '益达口香糖', '1年', '上海松江工业开发区', '玛氏箭牌公司', '糖果', 550, 10);
INSERT INTO `lib` VALUES (7, '红牛', '1年', '北京市怀柔区', '红牛维他命有限公司', '饮料', 180, 6);
INSERT INTO `lib` VALUES (8, '矿泉水', '1年', '漳州', '可口可乐', '饮料', 502, 1);
INSERT INTO `lib` VALUES (9, '苹果', '15天', '福建宁德', '乌番水果', '水果', 400, 2);
INSERT INTO `lib` VALUES (10, '海尔洗衣机', '10年', '广东广州', '海尔公司', '家电', 80, 4800);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `goods_id` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '顾客id',
  `number` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `total` int(0) NULL DEFAULT NULL COMMENT '总价',
  `state` int(0) NULL DEFAULT 0 COMMENT '交易状态：0.未发货 1.已发货 2.已退货 3.未退货',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (34, 1, 1, 10, 20, 2);
INSERT INTO `order` VALUES (35, 4, 1, 10, 60, 2);
INSERT INTO `order` VALUES (36, 5, 1, 10, 100, 2);
INSERT INTO `order` VALUES (37, 11, 1, 5, 5, 2);
INSERT INTO `order` VALUES (38, 11, 1, 10, 10, 1);
INSERT INTO `order` VALUES (39, 1, 1, 20, 40, 1);
INSERT INTO `order` VALUES (40, 1, 1, 100, 200, 0);
INSERT INTO `order` VALUES (41, 1, 47, 5, 10, 3);
INSERT INTO `order` VALUES (42, 4, 47, 8, 48, 3);
INSERT INTO `order` VALUES (43, 5, 47, 3, 30, 2);
INSERT INTO `order` VALUES (44, 11, 47, 10, 10, 1);
INSERT INTO `order` VALUES (45, 1, 47, 10, 20, 0);
INSERT INTO `order` VALUES (46, 1, 48, 10, 20, 1);
INSERT INTO `order` VALUES (47, 4, 48, 10, 60, 2);
INSERT INTO `order` VALUES (48, 5, 48, 5, 50, 0);
INSERT INTO `order` VALUES (49, 11, 48, 5, 5, 0);
INSERT INTO `order` VALUES (50, 13, 48, 1, 4800, 0);
INSERT INTO `order` VALUES (51, 1, 1, 10, 20, 1);

-- ----------------------------
-- Table structure for return_goods
-- ----------------------------
DROP TABLE IF EXISTS `return_goods`;
CREATE TABLE `return_goods`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order_id` int(0) NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT 0 COMMENT ' 2.已退货 3.未退货',
  `user_id` int(0) NULL DEFAULT NULL,
  `goods_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of return_goods
-- ----------------------------
INSERT INTO `return_goods` VALUES (12, 37, 2, 1, 11);
INSERT INTO `return_goods` VALUES (13, 34, 2, 1, 1);
INSERT INTO `return_goods` VALUES (14, 36, 2, 1, 5);
INSERT INTO `return_goods` VALUES (15, 35, 2, 1, 4);
INSERT INTO `return_goods` VALUES (16, 41, 3, 47, 1);
INSERT INTO `return_goods` VALUES (17, 43, 2, 47, 5);
INSERT INTO `return_goods` VALUES (18, 42, 3, 47, 4);
INSERT INTO `return_goods` VALUES (19, 47, 2, 48, 4);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `type_id` int(0) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '饮料');
INSERT INTO `type` VALUES (2, '糖果');
INSERT INTO `type` VALUES (3, '电子');
INSERT INTO `type` VALUES (4, '面包');
INSERT INTO `type` VALUES (7, '蔬菜');
INSERT INTO `type` VALUES (8, '水果');
INSERT INTO `type` VALUES (11, '家电');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '顾客id',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '顾客账号',
  `user_pwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '顾客密码',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '顾客姓名',
  `user_age` int(0) NULL DEFAULT NULL COMMENT '顾客年龄',
  `user_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '顾客联系方式',
  `user_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '顾客地址',
  `user_surplus` int(0) NULL DEFAULT NULL COMMENT '顾客余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'hys123', '123', '韩艺松', 19, 'QQ:1149869798', '福建漳州', 11856);
INSERT INTO `user` VALUES (18, 'zhangsan', '123', '张三', 18, 'tel:123456', '日本我孙子市', 200);
INSERT INTO `user` VALUES (37, 'qwer', 'qwer', '韩艺松', 14, '123412', 'qwer', 0);
INSERT INTO `user` VALUES (40, 'hystest', '1234', 'admin', 14, '123412', NULL, 0);
INSERT INTO `user` VALUES (41, 'tttt', 'tttt', '韩艺松', 14, '123412', 'sdfas', 0);
INSERT INTO `user` VALUES (42, 'qwerewr', '1231', '阿斯蒂芬', NULL, '', '', 0);
INSERT INTO `user` VALUES (47, 'hyg123', '1234', '韩艺光', 18, 'tel：1008611', '福建漳州', 22);
INSERT INTO `user` VALUES (48, 'huangyubin', '1234', '黄榆滨', 20, 'QQ：979904067', '福建漳州', 5125);
INSERT INTO `user` VALUES (49, 'hys1234', '1234', '韩艺松', 19, '123131', '福建漳州', 0);

SET FOREIGN_KEY_CHECKS = 1;
