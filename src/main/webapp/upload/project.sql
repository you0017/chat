/*
 Navicat Premium Data Transfer

 Source Server         : 1234
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 08/06/2024 16:35:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `bookpress` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pressdate` date NULL DEFAULT NULL,
  `bookauthor` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `bookcount` int NULL DEFAULT NULL,
  `bookimage` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'qwewq', 'adda', '2024-02-02', 'qeqwas', 2, 'http://localhost:8082/untitled_war\\images\\1.jpg');
INSERT INTO `books` VALUES (2, '数据库', '清华出版社', '1998-10-30', '周杰伦', 2, './images/数据库.jpg');
INSERT INTO `books` VALUES (3, '徐志摩诗集', '永强出版社', '1995-03-04', '徐志摩', 1, './images/徐志摩诗集.jpg');
INSERT INTO `books` VALUES (4, '高等数学', '晶晶出版社', '2011-07-04', '周传雄', 3, './images/高等数学.jpg');
INSERT INTO `books` VALUES (5, '中国历史', '人民出版社', '2016-06-22', '温家宝', 2, './images/中国历史.jpg');
INSERT INTO `books` VALUES (6, '盗梦空间', '神话出版社', '2014-08-28', 'mary', 1, './images/盗梦空间.jpg');
INSERT INTO `books` VALUES (7, '西游记', '人民出版社', '2001-12-01', '吴承恩', 17, './images/西游记.jpg');
INSERT INTO `books` VALUES (8, '水浒传', '贵州出版社', '1977-04-04', '施耐庵', 5, './images/水浒传.jpg');
INSERT INTO `books` VALUES (9, '红楼梦', '上海出版社', '1966-04-11', '曹雪芹', 8, './images/红楼梦.jpg');
INSERT INTO `books` VALUES (10, '三国演义', '宇宙无敌出版社', '2001-09-09', '罗贯中', 13, './images/三国演义.jpg');
INSERT INTO `books` VALUES (11, '23', '32', '2024-02-02', '32', 123, './images/三国演义.jpg');
INSERT INTO `books` VALUES (15, '企鹅舞', 'eqw', '2002-02-02', 'weq', 2, 'http://localhost:8080/untitled_war\\images\\1.jpg');
INSERT INTO `books` VALUES (16, 'eqw', 'qew', '2002-02-02', 'eqw', 3, 'http://localhost:8080/untitled_war\\images\\cy.png');
INSERT INTO `books` VALUES (17, '为桥', 'ewq', '2002-02-02', 'q', 2, 'http://localhost:8080/untitled_war\\images\\cy.png');
INSERT INTO `books` VALUES (18, 'sdfsd', 'sdfds', '2022-02-02', 'sdf', 1, 'http://localhost:8080/untitled_war\\uploads\\QQ图片20240412172011.jpg');
INSERT INTO `books` VALUES (19, 'tre', 'etr', '2022-02-02', 'er', 1, 'http://localhost:8080/untitled_war\\uploads\\QQ图片20240111225615.png');
INSERT INTO `books` VALUES (20, 'rte', 'ert', '2020-02-02', 'wer', 2, 'http://localhost:8080/untitled_war\\images\\QQ图片20240414084252.jpg');
INSERT INTO `books` VALUES (21, 'gdf', 'dgf', '2022-02-02', 'wqe', 1, 'http://localhost:8080/untitled_war\\images\\QQ图片20240206221101.png');

-- ----------------------------
-- Table structure for testuser
-- ----------------------------
DROP TABLE IF EXISTS `testuser`;
CREATE TABLE `testuser`  (
  `userid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `upwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testuser
-- ----------------------------
INSERT INTO `testuser` VALUES (1, 'a', 'c2f0789e6ad28c3f6f85da1fb9828d79');
INSERT INTO `testuser` VALUES (2, 'b', 'dc0ae7e1387be9b795f5d6299e383759');
INSERT INTO `testuser` VALUES (3, 'c', 'ed108f6919ebadc8e809f8b86ef40b05');
INSERT INTO `testuser` VALUES (4, 'd', '39abe4bca904bca5a11121955a2996bf');
INSERT INTO `testuser` VALUES (5, 'e', 'a94837b18f8f43f29448b40a6e7386ba');
INSERT INTO `testuser` VALUES (6, 'f', '83be264eb452fcf0a1c322f2c7cbf987');
INSERT INTO `testuser` VALUES (7, 'r', '71b0438bf46aa26928c7f5a371d619e1');
INSERT INTO `testuser` VALUES (8, 'q', '66eee9ace7508c154d02022000e1cf86');
INSERT INTO `testuser` VALUES (9, 'w', '66eee9ace7508c154d02022000e1cf86');
INSERT INTO `testuser` VALUES (10, 'dd', '28c8edde3d61a0411511d3b1866f0636');
INSERT INTO `testuser` VALUES (11, '1', '28c8edde3d61a0411511d3b1866f0636');
INSERT INTO `testuser` VALUES (12, 'dd123', '28c8edde3d61a0411511d3b1866f0636');

SET FOREIGN_KEY_CHECKS = 1;
