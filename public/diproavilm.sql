/*
 Navicat Premium Dump SQL

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : diproavilm

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 29/08/2024 02:17:30
*/
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `diproavilm`;
CREATE DATABASE IF NOT EXISTS `diproavilm`
  DEFAULT CHARACTER SET = 'utf8mb4' 
  DEFAULT COLLATE 'utf8mb4_spanish_ci'
  CHARACTER SET `utf8mb4`
  COLLATE `utf8mb4_spanish_ci`;


use `diproavilm`;
-- ----------------------------
-- Table structure for atak
-- ----------------------------
DROP TABLE IF EXISTS `atak`;
CREATE TABLE `atak`  (
  `idatak` int NOT NULL AUTO_INCREMENT,
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `useragent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idatak`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of atak
-- ----------------------------
INSERT INTO `atak` VALUES (1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', '2024-08-29 02:09:15');

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit`  (
  `idaudit` int NOT NULL AUTO_INCREMENT,
  `iduser` int NULL DEFAULT NULL,
  `ipaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `action` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idaudit`) USING BTREE,
  INDEX `IDUSER`(`iduser` ASC) USING BTREE,
  CONSTRAINT `IDUSER` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of audit
-- ----------------------------
INSERT INTO `audit` VALUES (1, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'GET', 'users', 'null', '2024-08-12 13:21:47', '2024-08-12 16:15:56', NULL);
INSERT INTO `audit` VALUES (2, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', 'saveBene', '{\"type\":\"A\",\"name\":\"SANTIAGO BORJA ROMERO\",\"comercialname\":\"LOCO\",\"identificationnumber\":\"1712030368\",\"idcountry\":\"50\",\"idprovince\":\"5\",\"idcity\":\"35\",\"address\":\"Espejo y Mexico\",\"parish\":\"Velazco\",\"phone\":\"\",\"email\":\"\",\"web\":\"\",\"creditquota\":\"0\",\"creditdays\":\"0\",\"account\":\"\"}', '2024-08-12 13:26:31', '2024-08-12 16:15:56', NULL);
INSERT INTO `audit` VALUES (3, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', 'saveBene', '{\"type\":\"P\",\"name\":\"SANTIAGO BORJA ROMERO\",\"comercialname\":\"LOCO\",\"identificationnumber\":\"1712030368S\",\"idcountry\":\"50\",\"idprovince\":\"5\",\"idcity\":\"35\",\"address\":\"Espejo y Mexico\",\"parish\":\"Velazco\",\"phone\":\"\",\"email\":\"\",\"web\":\"\",\"creditquota\":\"0\",\"creditdays\":\"0\",\"account\":\"\"}', '2024-08-12 13:31:16', '2024-08-12 16:15:55', NULL);
INSERT INTO `audit` VALUES (4, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"UNO\",\"scope\":\"D\",\"status\":\"0\"}', '2024-08-12 13:57:44', '2024-08-12 16:15:55', NULL);
INSERT INTO `audit` VALUES (5, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=8', '{\"name\":\"UNO\",\"scope\":\"WD\",\"status\":\"0\",\"idrole\":\"8\"}', '2024-08-12 16:10:34', '2024-08-12 16:15:54', NULL);
INSERT INTO `audit` VALUES (6, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-12 16:11:30', '2024-08-12 16:11:30', NULL);
INSERT INTO `audit` VALUES (7, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=2', '{\"fullname\":\"Santiago\",\"idrole\":\"2\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"2\"}', '2024-08-12 16:12:17', '2024-08-12 16:12:17', NULL);
INSERT INTO `audit` VALUES (8, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=recuperarUsuario&id=23', '{\"deleted_at\":null,\"iduser\":\"23\"}', '2024-08-13 00:10:38', '2024-08-13 00:10:38', NULL);
INSERT INTO `audit` VALUES (9, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-13 21:23:04', '2024-08-13 21:23:04', NULL);
INSERT INTO `audit` VALUES (10, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:44:21', '2024-08-13 22:44:21', NULL);
INSERT INTO `audit` VALUES (11, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:45:29', '2024-08-13 22:45:29', NULL);
INSERT INTO `audit` VALUES (12, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-13 22:50:28', '2024-08-13 22:50:28', NULL);
INSERT INTO `audit` VALUES (13, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:53:23', '2024-08-13 22:53:23', NULL);
INSERT INTO `audit` VALUES (14, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:54:26', '2024-08-13 22:54:26', NULL);
INSERT INTO `audit` VALUES (15, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:55:44', '2024-08-13 22:55:44', NULL);
INSERT INTO `audit` VALUES (16, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:56:12', '2024-08-13 22:56:12', NULL);
INSERT INTO `audit` VALUES (17, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:56:39', '2024-08-13 22:56:39', NULL);
INSERT INTO `audit` VALUES (18, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:57:00', '2024-08-13 22:57:00', NULL);
INSERT INTO `audit` VALUES (19, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:57:48', '2024-08-13 22:57:48', NULL);
INSERT INTO `audit` VALUES (20, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:57:59', '2024-08-13 22:57:59', NULL);
INSERT INTO `audit` VALUES (21, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:58:12', '2024-08-13 22:58:12', NULL);
INSERT INTO `audit` VALUES (22, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 22:59:31', '2024-08-13 22:59:31', NULL);
INSERT INTO `audit` VALUES (23, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:00:01', '2024-08-13 23:00:01', NULL);
INSERT INTO `audit` VALUES (24, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:00:37', '2024-08-13 23:00:37', NULL);
INSERT INTO `audit` VALUES (25, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:01:09', '2024-08-13 23:01:09', NULL);
INSERT INTO `audit` VALUES (26, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:01:23', '2024-08-13 23:01:23', NULL);
INSERT INTO `audit` VALUES (27, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:01:52', '2024-08-13 23:01:52', NULL);
INSERT INTO `audit` VALUES (28, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:02:09', '2024-08-13 23:02:09', NULL);
INSERT INTO `audit` VALUES (29, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:02:19', '2024-08-13 23:02:19', NULL);
INSERT INTO `audit` VALUES (30, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-13 23:02:47', '2024-08-13 23:02:47', NULL);
INSERT INTO `audit` VALUES (31, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=8', '{\"name\":\"UNO\",\"scope\":\"WD\",\"status\":\"0\",\"idrole\":\"8\"}', '2024-08-13 23:08:46', '2024-08-13 23:08:46', NULL);
INSERT INTO `audit` VALUES (32, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:09:58', '2024-08-13 23:09:58', NULL);
INSERT INTO `audit` VALUES (33, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:10:04', '2024-08-13 23:10:04', NULL);
INSERT INTO `audit` VALUES (34, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:11:33', '2024-08-13 23:11:33', NULL);
INSERT INTO `audit` VALUES (35, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:11:37', '2024-08-13 23:11:37', NULL);
INSERT INTO `audit` VALUES (36, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:11:52', '2024-08-13 23:11:52', NULL);
INSERT INTO `audit` VALUES (37, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:11:57', '2024-08-13 23:11:57', NULL);
INSERT INTO `audit` VALUES (38, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-13 23:31:11', '2024-08-13 23:31:11', NULL);
INSERT INTO `audit` VALUES (39, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-13 23:31:16', '2024-08-13 23:31:16', NULL);
INSERT INTO `audit` VALUES (40, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=4', '{\"name\":\"Super\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"4\"}', '2024-08-13 23:31:22', '2024-08-13 23:31:22', NULL);
INSERT INTO `audit` VALUES (41, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:32:05', '2024-08-13 23:32:05', NULL);
INSERT INTO `audit` VALUES (42, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=5', '{\"name\":\"UserBot\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"5\"}', '2024-08-13 23:32:13', '2024-08-13 23:32:13', NULL);
INSERT INTO `audit` VALUES (43, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=8', '{\"name\":\"UNO\",\"scope\":\"WD\",\"status\":\"0\",\"idrole\":\"8\"}', '2024-08-13 23:32:20', '2024-08-13 23:32:20', NULL);
INSERT INTO `audit` VALUES (44, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=23', '{\"fullname\":\"asdasd\",\"idrole\":\"3\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"23\"}', '2024-08-13 23:33:01', '2024-08-13 23:33:01', NULL);
INSERT INTO `audit` VALUES (45, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteUser&id=23', '{\"iduser\":\"23\"}', '2024-08-13 23:33:07', '2024-08-13 23:33:07', NULL);
INSERT INTO `audit` VALUES (46, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=3', '{\"fullname\":\"Hugo\",\"idrole\":\"8\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"3\"}', '2024-08-13 23:34:37', '2024-08-13 23:34:37', NULL);
INSERT INTO `audit` VALUES (47, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=3', '{\"fullname\":\"Hugo\",\"idrole\":\"3\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"3\"}', '2024-08-13 23:34:47', '2024-08-13 23:34:47', NULL);
INSERT INTO `audit` VALUES (48, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=3', '{\"fullname\":\"Hugo\",\"idrole\":\"1\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"3\"}', '2024-08-13 23:34:55', '2024-08-13 23:34:55', NULL);
INSERT INTO `audit` VALUES (49, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveProducto&id=-1', '{\"name\":\"AAAAAA\",\"description\":\"Cosa aaaa\",\"productcode\":\"A1\",\"barcode\":\"A2\",\"idpresentation\":\"1\",\"idproductline\":\"2\",\"idproductcategory\":\"undefined\",\"price\":\"1\",\"status\":\"0\",\"accountcost\":\"\",\"accountsales\":\"\",\"accountinv\":\"\"}', '2024-08-14 01:34:07', '2024-08-14 01:34:07', NULL);
INSERT INTO `audit` VALUES (50, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveProducto&id=-1', '{\"name\":\"AAAAAA\",\"description\":\"Cosa aaaa\",\"productcode\":\"A1\",\"barcode\":\"A2\",\"idpresentation\":\"1\",\"idproductline\":\"2\",\"idproductcategory\":\"undefined\",\"price\":\"12\",\"status\":\"0\",\"accountcost\":\"\",\"accountsales\":\"\",\"accountinv\":\"\"}', '2024-08-14 01:34:44', '2024-08-14 01:34:44', NULL);
INSERT INTO `audit` VALUES (51, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveProducto&id=-1', '{\"name\":\"AAAAAA\",\"description\":\"Cosa aaaa\",\"productcode\":\"A1\",\"barcode\":\"A2\",\"idpresentation\":\"1\",\"idproductline\":\"2\",\"idproductcategory\":\"4\",\"price\":\"2\",\"status\":\"0\",\"accountcost\":\"\",\"accountsales\":\"\",\"accountinv\":\"\"}', '2024-08-14 01:38:39', '2024-08-14 01:38:39', NULL);
INSERT INTO `audit` VALUES (52, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveProducto&id=41', '{\"name\":\"AAAAAA\",\"description\":\"Cosa aaaa\",\"productcode\":\"A1\",\"barcode\":\"A2\",\"idpresentation\":\"1\",\"idproductline\":\"2\",\"idproductcategory\":\"4\",\"price\":\"2\",\"status\":\"1\",\"accountcost\":\"\",\"accountsales\":\"\",\"accountinv\":\"\",\"idproduct\":\"41\"}', '2024-08-14 01:40:30', '2024-08-14 01:40:30', NULL);
INSERT INTO `audit` VALUES (53, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteProducto&id=41', '{\"idproduct\":\"41\"}', '2024-08-14 01:43:04', '2024-08-14 01:43:04', NULL);
INSERT INTO `audit` VALUES (54, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=recuperarProducto&id=41', '{\"deleted_at\":null,\"idproduct\":\"41\"}', '2024-08-14 02:07:01', '2024-08-14 02:07:01', NULL);
INSERT INTO `audit` VALUES (55, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteProducto&id=41', '{\"idproduct\":\"41\"}', '2024-08-14 02:09:11', '2024-08-14 02:09:11', NULL);
INSERT INTO `audit` VALUES (56, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=recuperarProducto&id=41', '{\"deleted_at\":null,\"idproduct\":\"41\"}', '2024-08-14 02:09:17', '2024-08-14 02:09:17', NULL);
INSERT INTO `audit` VALUES (57, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteProducto&id=41', '{\"idproduct\":\"41\"}', '2024-08-14 02:09:56', '2024-08-14 02:09:56', NULL);
INSERT INTO `audit` VALUES (58, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=recuperarProducto&id=41', '{\"deleted_at\":null,\"idproduct\":\"41\"}', '2024-08-14 02:10:09', '2024-08-14 02:10:09', NULL);
INSERT INTO `audit` VALUES (59, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteProducto&id=41', '{\"idproduct\":\"41\"}', '2024-08-14 02:10:27', '2024-08-14 02:10:27', NULL);
INSERT INTO `audit` VALUES (60, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=recuperarProducto&id=41', '{\"deleted_at\":null,\"idproduct\":\"41\"}', '2024-08-14 02:10:33', '2024-08-14 02:10:33', NULL);
INSERT INTO `audit` VALUES (61, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteProducto&id=41', '{\"idproduct\":\"41\"}', '2024-08-14 02:10:43', '2024-08-14 02:10:43', NULL);
INSERT INTO `audit` VALUES (62, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveUser&id=-1', '{\"fullname\":\"Rija\",\"idrole\":\"2\",\"lang\":\"es\",\"status\":\"1\",\"username\":\"Rita\",\"password\":\"cambiar\"}', '2024-08-16 18:45:43', '2024-08-16 18:45:43', NULL);
INSERT INTO `audit` VALUES (63, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"Cualquier ROl\",\"scope\":\"RWD\",\"status\":\"1\"}', '2024-08-16 18:46:25', '2024-08-16 18:46:25', NULL);
INSERT INTO `audit` VALUES (64, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=3', '{\"fullname\":\"Hugo\",\"idrole\":\"1\",\"lang\":\"es\",\"status\":\"0\",\"iduser\":\"3\"}', '2024-08-16 18:47:14', '2024-08-16 18:47:14', NULL);
INSERT INTO `audit` VALUES (65, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=resetearclave&id=2', '{\"password\":\"cambiar\",\"iduser\":\"2\"}', '2024-08-16 18:47:29', '2024-08-16 18:47:29', NULL);
INSERT INTO `audit` VALUES (66, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=resetearclave&id=4', '{\"password\":\"cambiar\",\"iduser\":\"4\"}', '2024-08-16 19:27:41', '2024-08-16 19:27:41', NULL);
INSERT INTO `audit` VALUES (67, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=9', '{\"name\":\"Cualquier+ROl\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"9\"}', '2024-08-16 19:27:58', '2024-08-16 19:27:58', NULL);
INSERT INTO `audit` VALUES (68, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=9', '{\"idrole\":\"9\"}', '2024-08-16 19:29:05', '2024-08-16 19:29:05', NULL);
INSERT INTO `audit` VALUES (69, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=8', '{\"idrole\":\"8\"}', '2024-08-16 19:29:27', '2024-08-16 19:29:27', NULL);
INSERT INTO `audit` VALUES (70, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=4', '{\"idrole\":\"4\"}', '2024-08-16 19:29:34', '2024-08-16 19:29:34', NULL);
INSERT INTO `audit` VALUES (71, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"BUEN\",\"scope\":\"RWD\",\"status\":\"1\"}', '2024-08-16 19:32:26', '2024-08-16 19:32:26', NULL);
INSERT INTO `audit` VALUES (72, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', 'null', '2024-08-16 19:38:19', '2024-08-16 19:38:19', NULL);
INSERT INTO `audit` VALUES (73, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdasd\",\"scope\":\"RWD\",\"status\":\"1\"}', '2024-08-16 19:39:35', '2024-08-16 19:39:35', NULL);
INSERT INTO `audit` VALUES (74, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdasdasda\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:48:20', '2024-08-16 19:48:20', NULL);
INSERT INTO `audit` VALUES (75, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdasdas\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:48:36', '2024-08-16 19:48:36', NULL);
INSERT INTO `audit` VALUES (76, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"sfsdfsdfsd\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:49:07', '2024-08-16 19:49:07', NULL);
INSERT INTO `audit` VALUES (77, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"sdfsdfsd\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:49:17', '2024-08-16 19:49:17', NULL);
INSERT INTO `audit` VALUES (78, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"sssssss\",\"scope\":\"\",\"status\":\"1\"}', '2024-08-16 19:51:20', '2024-08-16 19:51:20', NULL);
INSERT INTO `audit` VALUES (79, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"sasa\",\"scope\":\"R\",\"status\":\"0\"}', '2024-08-16 19:52:25', '2024-08-16 19:52:25', NULL);
INSERT INTO `audit` VALUES (80, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdas\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:52:51', '2024-08-16 19:52:51', NULL);
INSERT INTO `audit` VALUES (81, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asas\",\"scope\":\"RW\",\"status\":\"0\"}', '2024-08-16 19:53:13', '2024-08-16 19:53:13', NULL);
INSERT INTO `audit` VALUES (82, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"sss\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:54:08', '2024-08-16 19:54:08', NULL);
INSERT INTO `audit` VALUES (83, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdasdasdasdas\",\"scope\":\"RW\",\"status\":\"1\"}', '2024-08-16 19:54:44', '2024-08-16 19:54:44', NULL);
INSERT INTO `audit` VALUES (84, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"a\",\"scope\":\"R\",\"status\":\"0\"}', '2024-08-16 19:55:44', '2024-08-16 19:55:44', NULL);
INSERT INTO `audit` VALUES (85, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdasdasdasdas\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:56:22', '2024-08-16 19:56:22', NULL);
INSERT INTO `audit` VALUES (86, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdasdas\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:57:36', '2024-08-16 19:57:36', NULL);
INSERT INTO `audit` VALUES (87, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asdasdassssss\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:59:09', '2024-08-16 19:59:09', NULL);
INSERT INTO `audit` VALUES (88, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"s2\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 19:59:22', '2024-08-16 19:59:22', NULL);
INSERT INTO `audit` VALUES (89, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"s3\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 20:00:43', '2024-08-16 20:00:43', NULL);
INSERT INTO `audit` VALUES (90, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=26', '{\"idrole\":\"26\"}', '2024-08-16 20:04:31', '2024-08-16 20:04:31', NULL);
INSERT INTO `audit` VALUES (91, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=25', '{\"idrole\":\"25\"}', '2024-08-16 20:04:42', '2024-08-16 20:04:42', NULL);
INSERT INTO `audit` VALUES (92, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=27', '{\"idrole\":\"27\"}', '2024-08-16 20:04:49', '2024-08-16 20:04:49', NULL);
INSERT INTO `audit` VALUES (93, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=28', '{\"idrole\":\"28\"}', '2024-08-16 20:04:54', '2024-08-16 20:04:54', NULL);
INSERT INTO `audit` VALUES (94, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=29', '{\"idrole\":\"29\"}', '2024-08-16 20:05:01', '2024-08-16 20:05:01', NULL);
INSERT INTO `audit` VALUES (95, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=24', '{\"idrole\":\"24\"}', '2024-08-16 20:05:07', '2024-08-16 20:05:07', NULL);
INSERT INTO `audit` VALUES (96, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=10', '{\"idrole\":\"10\"}', '2024-08-16 20:05:14', '2024-08-16 20:05:14', NULL);
INSERT INTO `audit` VALUES (97, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"Nuevo Rolsasda%2B%2B%2B%2B%2B\",\"scope\":\"RWD\",\"status\":\"0\"}', '2024-08-16 21:44:32', '2024-08-16 21:44:32', NULL);
INSERT INTO `audit` VALUES (98, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=30', '{\"name\":\"Nuevo+Rolsasda%252B%252B%252B%252B%252B\",\"scope\":\"RWD\",\"status\":\"0\",\"idrole\":\"30\"}', '2024-08-16 21:44:58', '2024-08-16 21:44:58', NULL);
INSERT INTO `audit` VALUES (99, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=30', '{\"name\":\"Nuevo%2BRolsasda%25252B%25252B%25252B%25252B%25252B\",\"scope\":\"RWD\",\"status\":\"0\",\"idrole\":\"30\"}', '2024-08-16 21:46:13', '2024-08-16 21:46:13', NULL);
INSERT INTO `audit` VALUES (100, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=30', '{\"name\":\"Nuevo%2BRolsasda%25252B%25252B%25252B%25252B%25252B\",\"scope\":\"RWD\",\"status\":\"0\",\"idrole\":\"30\"}', '2024-08-16 21:46:53', '2024-08-16 21:46:53', NULL);
INSERT INTO `audit` VALUES (101, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveRole&id=-1', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\"}', '2024-08-16 22:36:22', '2024-08-16 22:36:22', NULL);
INSERT INTO `audit` VALUES (102, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=30', '{\"idrole\":\"30\"}', '2024-08-16 22:36:35', '2024-08-16 22:36:35', NULL);
INSERT INTO `audit` VALUES (103, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:38:21', '2024-08-16 22:38:21', NULL);
INSERT INTO `audit` VALUES (104, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:38:39', '2024-08-16 22:38:39', NULL);
INSERT INTO `audit` VALUES (105, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:38:57', '2024-08-16 22:38:57', NULL);
INSERT INTO `audit` VALUES (106, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:39:56', '2024-08-16 22:39:56', NULL);
INSERT INTO `audit` VALUES (107, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:40:11', '2024-08-16 22:40:11', NULL);
INSERT INTO `audit` VALUES (108, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:40:59', '2024-08-16 22:40:59', NULL);
INSERT INTO `audit` VALUES (109, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:41:21', '2024-08-16 22:41:21', NULL);
INSERT INTO `audit` VALUES (110, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:43:20', '2024-08-16 22:43:20', NULL);
INSERT INTO `audit` VALUES (111, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:43:36', '2024-08-16 22:43:36', NULL);
INSERT INTO `audit` VALUES (112, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:43:47', '2024-08-16 22:43:47', NULL);
INSERT INTO `audit` VALUES (113, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:44:22', '2024-08-16 22:44:22', NULL);
INSERT INTO `audit` VALUES (114, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:44:48', '2024-08-16 22:44:48', NULL);
INSERT INTO `audit` VALUES (115, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:47:22', '2024-08-16 22:47:22', NULL);
INSERT INTO `audit` VALUES (116, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:47:33', '2024-08-16 22:47:33', NULL);
INSERT INTO `audit` VALUES (117, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:48:45', '2024-08-16 22:48:45', NULL);
INSERT INTO `audit` VALUES (118, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:49:37', '2024-08-16 22:49:37', NULL);
INSERT INTO `audit` VALUES (119, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:49:43', '2024-08-16 22:49:43', NULL);
INSERT INTO `audit` VALUES (120, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=31', '{\"idrole\":\"31\"}', '2024-08-16 22:50:05', '2024-08-16 22:50:05', NULL);
INSERT INTO `audit` VALUES (121, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=31', '{\"idrole\":\"31\"}', '2024-08-16 22:52:25', '2024-08-16 22:52:25', NULL);
INSERT INTO `audit` VALUES (122, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=31', '{\"idrole\":\"31\"}', '2024-08-16 22:52:25', '2024-08-16 22:52:25', NULL);
INSERT INTO `audit` VALUES (123, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=31', '{\"idrole\":\"31\"}', '2024-08-16 22:52:46', '2024-08-16 22:52:46', NULL);
INSERT INTO `audit` VALUES (124, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=31', '{\"idrole\":\"31\"}', '2024-08-16 22:52:46', '2024-08-16 22:52:46', NULL);
INSERT INTO `audit` VALUES (125, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=31', '{\"name\":\"asd2SSsdasa\",\"scope\":\"\",\"status\":\"0\",\"idrole\":\"31\"}', '2024-08-16 22:53:08', '2024-08-16 22:53:08', NULL);
INSERT INTO `audit` VALUES (126, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=31', '{\"idrole\":\"31\"}', '2024-08-16 22:53:26', '2024-08-16 22:53:26', NULL);
INSERT INTO `audit` VALUES (127, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=31', '{\"idrole\":\"31\"}', '2024-08-16 22:53:26', '2024-08-16 22:53:26', NULL);
INSERT INTO `audit` VALUES (128, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveUser&id=-1', '{\"fullname\":\"Usuario Test\",\"idrole\":\"3\",\"lang\":\"es\",\"status\":\"0\",\"username\":\"UsuarioTest\",\"password\":\"cambiar\"}', '2024-08-16 22:56:36', '2024-08-16 22:56:36', NULL);
INSERT INTO `audit` VALUES (129, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=3', '{\"name\":\"Usuario\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"3\"}', '2024-08-16 22:57:11', '2024-08-16 22:57:11', NULL);
INSERT INTO `audit` VALUES (130, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"03.04\",\"name\":\"Kardex\",\"icon\":\"fas fa-boxes\",\"route\":\"kardex\",\"submenu\":\"0\",\"status\":\"1\"}', '2024-08-16 23:00:38', '2024-08-16 23:00:38', NULL);
INSERT INTO `audit` VALUES (131, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=7', '{\"order\":\"03.04\",\"name\":\"Registro de movimiento\",\"icon\":\"fas fa-truck-loading\",\"route\":\"movimientos\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"7\"}', '2024-08-16 23:01:17', '2024-08-16 23:01:17', NULL);
INSERT INTO `audit` VALUES (132, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-16 23:02:00', '2024-08-16 23:02:00', NULL);
INSERT INTO `audit` VALUES (133, NULL, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=establecerclave', '{\"password\":\"$2y$12$eAar1nNNWJs\\/gv8IllJKIehMXtXpmR1ZimfPJ5BYak2CprW8HV8VS\",\"iduser\":2}', '2024-08-16 23:11:38', '2024-08-16 23:11:38', NULL);
INSERT INTO `audit` VALUES (134, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveProducto&id=-1', '{\"name\":\"BBBBB\",\"description\":\"BBBB\",\"productcode\":\"21343243das\",\"barcode\":\"87954612321321\",\"idpresentation\":\"1\",\"idproductline\":\"1\",\"idproductcategory\":\"1\",\"price\":\"15\",\"status\":\"1\",\"accountcost\":\"5.1.01.01.02\",\"accountsales\":\"4.1.01.02\",\"accountinv\":\"1.1.03.01.02\"}', '2024-08-16 23:19:06', '2024-08-16 23:19:06', NULL);
INSERT INTO `audit` VALUES (135, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteProducto&id=42', '{\"idproduct\":\"42\"}', '2024-08-16 23:19:19', '2024-08-16 23:19:19', NULL);
INSERT INTO `audit` VALUES (136, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=recuperarRol&id=4', '{\"deleted_at\":null,\"idrole\":\"4\"}', '2024-08-16 23:55:17', '2024-08-16 23:55:17', NULL);
INSERT INTO `audit` VALUES (137, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=4', '{\"idrole\":\"4\"}', '2024-08-16 23:55:25', '2024-08-16 23:55:25', NULL);
INSERT INTO `audit` VALUES (138, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteRole&id=4', '{\"idrole\":\"4\"}', '2024-08-16 23:55:25', '2024-08-16 23:55:25', NULL);
INSERT INTO `audit` VALUES (139, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteMenu&id=28', '{\"idmenu\":\"28\"}', '2024-08-16 23:57:23', '2024-08-16 23:57:23', NULL);
INSERT INTO `audit` VALUES (140, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=8', '{\"order\":\"03.05\",\"name\":\"Productos\",\"icon\":\"fas fa-box-open\",\"route\":\"productos\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"8\"}', '2024-08-17 00:08:25', '2024-08-17 00:08:25', NULL);
INSERT INTO `audit` VALUES (141, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=recuperarMenu&id=28', '{\"deleted_at\":null,\"idmenu\":\"28\"}', '2024-08-17 00:10:11', '2024-08-17 00:10:11', NULL);
INSERT INTO `audit` VALUES (142, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=8', '{\"order\":\"03.05\",\"name\":\"Productos\",\"icon\":\"fas fa-box-open\",\"route\":\"productos\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"8\"}', '2024-08-17 00:11:03', '2024-08-17 00:11:03', NULL);
INSERT INTO `audit` VALUES (143, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=28', '{\"order\":\"03.05\",\"name\":\"Kardex\",\"icon\":\"fas fa-boxes\",\"route\":\"kardex\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"28\"}', '2024-08-17 00:11:08', '2024-08-17 00:11:08', NULL);
INSERT INTO `audit` VALUES (144, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"\",\"name\":\"Men%C3%BA de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"4\"}', '2024-08-17 00:13:28', '2024-08-17 00:13:28', NULL);
INSERT INTO `audit` VALUES (145, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men%C3%BA de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"4\"}', '2024-08-17 00:15:30', '2024-08-17 00:15:30', NULL);
INSERT INTO `audit` VALUES (146, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men%C3%BA de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"4\"}', '2024-08-17 00:19:41', '2024-08-17 00:19:41', NULL);
INSERT INTO `audit` VALUES (147, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men%C3%BA de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"4\"}', '2024-08-17 00:25:27', '2024-08-17 00:25:27', NULL);
INSERT INTO `audit` VALUES (148, 2, 'PostmanRuntime/7.41.1', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men\\u00fa de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":0,\"status\":1,\"idmenu\":\"4\"}', '2024-08-17 00:27:16', '2024-08-17 00:27:16', NULL);
INSERT INTO `audit` VALUES (149, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men%C3%BA+de+Opciones\",\"icon\":\"fas+fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"4\"}', '2024-08-17 00:31:05', '2024-08-17 00:31:05', NULL);
INSERT INTO `audit` VALUES (150, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men%C3%BA+de+Opciones\",\"icon\":\"fas%2Bfa-prescription-bottle\",\"route\":\"menu\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"4\"}', '2024-08-17 00:34:37', '2024-08-17 00:34:37', NULL);
INSERT INTO `audit` VALUES (151, 2, 'PostmanRuntime/7.41.1', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men\\u00fa de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":0,\"status\":1,\"idmenu\":\"4\"}', '2024-08-17 00:36:51', '2024-08-17 00:36:51', NULL);
INSERT INTO `audit` VALUES (152, 2, 'PostmanRuntime/7.41.1', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men\\u00fa de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":0,\"status\":1,\"idmenu\":\"4\"}', '2024-08-17 00:37:44', '2024-08-17 00:37:44', NULL);
INSERT INTO `audit` VALUES (153, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=4', '{\"order\":\"02.02\",\"name\":\"Men\\u00fa de Opciones\",\"icon\":\"fas fa-prescription-bottle\",\"route\":\"menu\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"4\"}', '2024-08-17 01:01:44', '2024-08-17 01:01:44', NULL);
INSERT INTO `audit` VALUES (154, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"04.05\",\"name\":\"Listado de productos por numero de movimientos\",\"icon\":\"far fa-file-archive\",\"route\":\"nummovimientos\",\"submenu\":\"0\",\"status\":\"0\"}', '2024-08-17 01:04:49', '2024-08-17 01:04:49', NULL);
INSERT INTO `audit` VALUES (155, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=29', '{\"order\":\"04.05\",\"name\":\"Productos por n\\u00famero de movimientos\",\"icon\":\"far fa-file-archive\",\"route\":\"nummovimientos\",\"submenu\":\"0\",\"status\":\"0\",\"idmenu\":\"29\"}', '2024-08-17 01:05:09', '2024-08-17 01:05:09', NULL);
INSERT INTO `audit` VALUES (156, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=29', '{\"order\":\"04.05\",\"name\":\"Productos por n\\u00famero de movimientos\",\"icon\":\"far fa-file-archive\",\"route\":\"lst_nummovimientos\",\"submenu\":\"0\",\"status\":\"0\",\"idmenu\":\"29\"}', '2024-08-17 01:05:23', '2024-08-17 01:05:23', NULL);
INSERT INTO `audit` VALUES (157, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"04.05\",\"name\":\"Inventario Valorizado\",\"icon\":\"far fa-file-archive\",\"route\":\"lst_invvalorado\",\"submenu\":\"0\",\"status\":\"1\"}', '2024-08-17 01:06:24', '2024-08-17 01:06:24', NULL);
INSERT INTO `audit` VALUES (158, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=29', '{\"order\":\"04.05\",\"name\":\"Productos por n\\u00famero de movimientos\",\"icon\":\"far fa-file-archive\",\"route\":\"lst_nummovimientos\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"29\"}', '2024-08-17 01:06:29', '2024-08-17 01:06:29', NULL);
INSERT INTO `audit` VALUES (159, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-17 01:08:12', '2024-08-17 01:08:12', NULL);
INSERT INTO `audit` VALUES (160, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"02.05\",\"name\":\"admincito\",\"icon\":\"fa fa-cog\",\"route\":\"asdasd\",\"submenu\":\"0\",\"status\":\"0\"}', '2024-08-17 01:15:02', '2024-08-17 01:15:02', NULL);
INSERT INTO `audit` VALUES (161, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"02.05\",\"name\":\"amin2\",\"icon\":\"fa fa-cog\",\"route\":\"sadas\",\"submenu\":\"0\",\"status\":\"0\"}', '2024-08-17 01:15:34', '2024-08-17 01:15:34', NULL);
INSERT INTO `audit` VALUES (162, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"02.07\",\"name\":\"s3sss\",\"icon\":\"fa fa-cog\",\"route\":\"saz2\",\"submenu\":\"0\",\"status\":\"0\"}', '2024-08-17 01:27:39', '2024-08-17 01:27:39', NULL);
INSERT INTO `audit` VALUES (163, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteMenu&id=31', '{\"idmenu\":\"31\"}', '2024-08-17 01:27:56', '2024-08-17 01:27:56', NULL);
INSERT INTO `audit` VALUES (164, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteMenu&id=33', '{\"idmenu\":\"33\"}', '2024-08-17 01:28:01', '2024-08-17 01:28:01', NULL);
INSERT INTO `audit` VALUES (165, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteMenu&id=32', '{\"idmenu\":\"32\"}', '2024-08-17 01:28:05', '2024-08-17 01:28:05', NULL);
INSERT INTO `audit` VALUES (166, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"02.08\",\"name\":\"Santiago Borja\",\"icon\":\"fa fa-cog\",\"route\":\"asdasdasdasdasd\",\"submenu\":\"0\",\"status\":\"0\"}', '2024-08-17 01:28:16', '2024-08-17 01:28:16', NULL);
INSERT INTO `audit` VALUES (167, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"01.02\",\"name\":\"Compras\",\"icon\":\"fas fa-shopping-cart\",\"route\":\"dashcompras\",\"submenu\":\"0\",\"status\":\"1\"}', '2024-08-17 01:38:33', '2024-08-17 01:38:33', NULL);
INSERT INTO `audit` VALUES (168, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=35', '{\"order\":\"01.02\",\"name\":\"Compras\",\"icon\":\"fas fa-chart-bar\",\"route\":\"dashcompras\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"35\"}', '2024-08-17 01:38:54', '2024-08-17 01:38:54', NULL);
INSERT INTO `audit` VALUES (169, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-17 01:42:24', '2024-08-17 01:42:24', NULL);
INSERT INTO `audit` VALUES (170, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=establecerclave', '{\"password\":\"$2y$12$nKDUhRshuMdplcHvok8nVe37Hj.1EAu1vli5QPAig3nO2YuXx8AWe\",\"iduser\":1}', '2024-08-19 09:27:52', '2024-08-19 09:27:52', NULL);
INSERT INTO `audit` VALUES (171, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=login', '{\"token\":\"Q0hlTHR3elRaeFhsSG0vbk55dlloelRYaU5UVTFFeXh3UFEyVEFOenppOHk0OTJHSkUvb2JHUVNjSkFVRkNvMm50aFM5bVBuVWtUSFpVSUhRS3AzL0E9PQ==\",\"operations\":1,\"lastlogged\":\"2024-08-19 09:28:05\",\"iduser\":1}', '2024-08-19 09:28:05', '2024-08-19 09:28:05', NULL);
INSERT INTO `audit` VALUES (172, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"03.05\",\"name\":\"Tipo de Movimientos\",\"icon\":\"fas fa-ticket-alt\",\"route\":\"movtipo\",\"submenu\":\"0\",\"status\":\"1\"}', '2024-08-19 09:33:33', '2024-08-19 09:33:33', NULL);
INSERT INTO `audit` VALUES (173, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-19 09:33:52', '2024-08-19 09:33:52', NULL);
INSERT INTO `audit` VALUES (174, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMenu&id=-1', '{\"order\":\"02.05\",\"name\":\"Configuracion General\",\"icon\":\"fa fa-cog\",\"route\":\"config\",\"submenu\":\"0\",\"status\":\"1\"}', '2024-08-19 11:23:18', '2024-08-19 11:23:18', NULL);
INSERT INTO `audit` VALUES (175, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=2', '{\"name\":\"Administrador\",\"scope\":\"RWD\",\"status\":\"1\",\"idrole\":\"2\"}', '2024-08-19 11:23:32', '2024-08-19 11:23:32', NULL);
INSERT INTO `audit` VALUES (176, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveBene&id=-1', '{\"type\":\"E\",\"name\":\"DIPROAVILM\",\"comercialname\":\"DIPROAVILM\",\"identificationnumber\":\"0000000000001\",\"idcountry\":\"50\",\"idprovince\":\"19\",\"idcity\":\"177\",\"address\":\"\",\"parish\":\"\",\"phone\":\"\",\"email\":\"\",\"web\":\"\",\"creditquota\":\"0\",\"creditdays\":\"0\",\"account\":\"\"}', '2024-08-19 15:29:13', '2024-08-19 15:29:13', NULL);
INSERT INTO `audit` VALUES (177, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"iduser\":null,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20\",\"numberdocument\":\"\",\"subtotal\":\"180000\",\"discount\":\"0\",\"total\":\"180000\",\"reference\":null}', '2024-08-20 12:55:07', '2024-08-20 12:55:07', NULL);
INSERT INTO `audit` VALUES (178, NULL, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":null,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20\",\"numberdocument\":\"\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":null}', '2024-08-20 12:56:27', '2024-08-20 12:56:27', NULL);
INSERT INTO `audit` VALUES (179, NULL, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":null,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20\",\"numberdocument\":\"\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"\"}', '2024-08-20 12:56:48', '2024-08-20 12:56:48', NULL);
INSERT INTO `audit` VALUES (180, NULL, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":null,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20\",\"numberdocument\":\"\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"sssss\"}', '2024-08-20 12:59:16', '2024-08-20 12:59:16', NULL);
INSERT INTO `audit` VALUES (181, NULL, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":null,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"sssss\"}', '2024-08-20 13:00:13', '2024-08-20 13:00:13', NULL);
INSERT INTO `audit` VALUES (182, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"sssss\"}', '2024-08-20 13:28:19', '2024-08-20 13:28:19', NULL);
INSERT INTO `audit` VALUES (183, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"sssss\"}', '2024-08-20 13:28:45', '2024-08-20 13:28:45', NULL);
INSERT INTO `audit` VALUES (184, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:29:07', '2024-08-20 13:29:07', NULL);
INSERT INTO `audit` VALUES (185, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:30:42', '2024-08-20 13:30:42', NULL);
INSERT INTO `audit` VALUES (186, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:31:31', '2024-08-20 13:31:31', NULL);
INSERT INTO `audit` VALUES (187, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:32:05', '2024-08-20 13:32:05', NULL);
INSERT INTO `audit` VALUES (188, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:32:13', '2024-08-20 13:32:13', NULL);
INSERT INTO `audit` VALUES (189, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:32:23', '2024-08-20 13:32:23', NULL);
INSERT INTO `audit` VALUES (190, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:34:05', '2024-08-20 13:34:05', NULL);
INSERT INTO `audit` VALUES (191, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:34:31', '2024-08-20 13:34:31', NULL);
INSERT INTO `audit` VALUES (192, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '[{\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000,\"idtransaction\":68}]', '2024-08-20 13:34:31', '2024-08-20 13:34:31', NULL);
INSERT INTO `audit` VALUES (193, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:35:13', '2024-08-20 13:35:13', NULL);
INSERT INTO `audit` VALUES (194, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:36:05', '2024-08-20 13:36:05', NULL);
INSERT INTO `audit` VALUES (195, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:36:46', '2024-08-20 13:36:46', NULL);
INSERT INTO `audit` VALUES (196, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '[{\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000,\"idtransaction\":71}]', '2024-08-20 13:36:46', '2024-08-20 13:36:46', NULL);
INSERT INTO `audit` VALUES (197, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:37:58', '2024-08-20 13:37:58', NULL);
INSERT INTO `audit` VALUES (198, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '[{\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000,\"idtransaction\":72}]', '2024-08-20 13:37:58', '2024-08-20 13:37:58', NULL);
INSERT INTO `audit` VALUES (199, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:38:33', '2024-08-20 13:38:33', NULL);
INSERT INTO `audit` VALUES (200, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '[{\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000,\"idtransaction\":73}]', '2024-08-20 13:38:33', '2024-08-20 13:38:33', NULL);
INSERT INTO `audit` VALUES (201, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:38:59', '2024-08-20 13:38:59', NULL);
INSERT INTO `audit` VALUES (202, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '[{\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000,\"idtransaction\":74}]', '2024-08-20 13:38:59', '2024-08-20 13:38:59', NULL);
INSERT INTO `audit` VALUES (203, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:39:51', '2024-08-20 13:39:51', NULL);
INSERT INTO `audit` VALUES (204, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '[{\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000,\"idtransaction\":75},{\"idproduct\":\"18\",\"entry\":\"I\",\"qty\":10,\"price\":10,\"total\":100,\"idtransaction\":75}]', '2024-08-20 13:39:51', '2024-08-20 13:39:51', NULL);
INSERT INTO `audit` VALUES (205, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:41:00', '2024-08-20 13:41:00', NULL);
INSERT INTO `audit` VALUES (206, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '[{\"idtransaction\":76,\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000},{\"idtransaction\":76,\"idproduct\":\"18\",\"entry\":\"I\",\"qty\":10,\"price\":10,\"total\":100}]', '2024-08-20 13:41:00', '2024-08-20 13:41:00', NULL);
INSERT INTO `audit` VALUES (207, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:42:02', '2024-08-20 13:42:02', NULL);
INSERT INTO `audit` VALUES (208, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:43:11', '2024-08-20 13:43:11', NULL);
INSERT INTO `audit` VALUES (209, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:43:53', '2024-08-20 13:43:53', NULL);
INSERT INTO `audit` VALUES (210, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:44:06', '2024-08-20 13:44:06', NULL);
INSERT INTO `audit` VALUES (211, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:45:23', '2024-08-20 13:45:23', NULL);
INSERT INTO `audit` VALUES (212, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:45:41', '2024-08-20 13:45:41', NULL);
INSERT INTO `audit` VALUES (213, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:45:43', '2024-08-20 13:45:43', NULL);
INSERT INTO `audit` VALUES (214, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:46:34', '2024-08-20 13:46:34', NULL);
INSERT INTO `audit` VALUES (215, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:46:44', '2024-08-20 13:46:44', NULL);
INSERT INTO `audit` VALUES (216, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:46:53', '2024-08-20 13:46:53', NULL);
INSERT INTO `audit` VALUES (217, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:48:02', '2024-08-20 13:48:02', NULL);
INSERT INTO `audit` VALUES (218, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:48:16', '2024-08-20 13:48:16', NULL);
INSERT INTO `audit` VALUES (219, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:48:33', '2024-08-20 13:48:33', NULL);
INSERT INTO `audit` VALUES (220, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:50:27', '2024-08-20 13:50:27', NULL);
INSERT INTO `audit` VALUES (221, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"iduser\":2,\"idbeneficiary\":\"114\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 12:59:45\",\"numberdocument\":\"003-001-22135643\",\"subtotal\":180000,\"discount\":0,\"total\":180000,\"reference\":\"Tests\"}', '2024-08-20 13:54:41', '2024-08-20 13:54:41', NULL);
INSERT INTO `audit` VALUES (222, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"idtransaction\":91,\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":15000,\"price\":12,\"total\":180000}', '2024-08-20 13:54:41', '2024-08-20 13:54:41', NULL);
INSERT INTO `audit` VALUES (223, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveTransaction', '{\"idtransaction\":91,\"idproduct\":\"18\",\"entry\":\"I\",\"qty\":10,\"price\":10,\"total\":100}', '2024-08-20 13:54:41', '2024-08-20 13:54:41', NULL);
INSERT INTO `audit` VALUES (224, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"iduser\":2,\"idbeneficiary\":\"76\",\"idmovementtype\":\"2\",\"date\":\"2024-08-20 17:46:07\",\"numberdocument\":\"125-012-001589111\",\"subtotal\":\"1500\",\"discount\":\"0\",\"total\":\"1500\",\"reference\":\"\"}', '2024-08-20 17:46:07', '2024-08-20 17:46:07', NULL);
INSERT INTO `audit` VALUES (225, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":92,\"idproduct\":\"17\",\"entry\":\"I\",\"qty\":\"125\",\"price\":\"12\",\"total\":\"1500\"}', '2024-08-20 17:46:07', '2024-08-20 17:46:07', NULL);
INSERT INTO `audit` VALUES (226, NULL, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=establecerclave', '{\"password\":\"$2y$12$JfgZQaHQi\\/yELIpCWyhm9.70LE5A2rAIss8\\/9TyN7NuOWlRvz\\/FOC\",\"iduser\":3}', '2024-08-22 17:55:33', '2024-08-22 17:55:33', NULL);
INSERT INTO `audit` VALUES (227, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=establecerclave', '{\"password\":\"$2y$12$S719rXL1v.ORZC15Yx\\/.1.9y.exKaAfiwHXiL.AktrFAZGJF5iA.y\",\"iduser\":4}', '2024-08-22 17:56:32', '2024-08-22 17:56:32', NULL);
INSERT INTO `audit` VALUES (228, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=login', '{\"token\":\"aE5zSGdtSlQ5Ym9vM2RadEJMSnhvUGxMbHZ0UUxwT1JCYTRTZDBtQWo4ZEVZNlh4N3R2YWRLOUJYbHo2Mm1kbDArVmFwTnpVV2YwaEViM2F5RVczWUE9PQ==\",\"operations\":1,\"lastlogged\":\"2024-08-22 17:56:45\",\"iduser\":4}', '2024-08-22 17:56:45', '2024-08-22 17:56:45', NULL);
INSERT INTO `audit` VALUES (229, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=resetearclave&id=4', '{\"password\":\"cambiar\",\"iduser\":\"4\"}', '2024-08-22 17:57:37', '2024-08-22 17:57:37', NULL);
INSERT INTO `audit` VALUES (230, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:38:43', '2024-08-23 00:38:43', NULL);
INSERT INTO `audit` VALUES (231, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:42:11', '2024-08-23 00:42:11', NULL);
INSERT INTO `audit` VALUES (232, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:43:54', '2024-08-23 00:43:54', NULL);
INSERT INTO `audit` VALUES (233, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:43:57', '2024-08-23 00:43:57', NULL);
INSERT INTO `audit` VALUES (234, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:44:08', '2024-08-23 00:44:08', NULL);
INSERT INTO `audit` VALUES (235, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:46:44', '2024-08-23 00:46:44', NULL);
INSERT INTO `audit` VALUES (236, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:47:28', '2024-08-23 00:47:28', NULL);
INSERT INTO `audit` VALUES (237, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:48:18', '2024-08-23 00:48:18', NULL);
INSERT INTO `audit` VALUES (238, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:48:23', '2024-08-23 00:48:23', NULL);
INSERT INTO `audit` VALUES (239, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:48:25', '2024-08-23 00:48:25', NULL);
INSERT INTO `audit` VALUES (240, 2, 'PostmanRuntime/7.41.1', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"iduser\":2,\"idbeneficiary\":null,\"idmovementtype\":null,\"date\":null,\"numberdocument\":null,\"subtotal\":null,\"discount\":null,\"total\":null,\"reference\":null}', '2024-08-23 00:48:26', '2024-08-23 00:48:26', NULL);
INSERT INTO `audit` VALUES (241, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveMovTipo&id=-1', '{\"acronym\":\"ssss\",\"name\":\"asd2SSsdasa\",\"sequential\":\"0\",\"beneficiarytype\":\"P\",\"entry\":\"I\",\"typevalue\":\"C\"}', '2024-08-23 00:49:18', '2024-08-23 00:49:18', NULL);
INSERT INTO `audit` VALUES (242, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMovTipo&id=9', '{\"acronym\":\"ssss\",\"name\":\"asd2SSsdasa\",\"sequential\":\"0\",\"beneficiarytype\":\"P\",\"entry\":\"I\",\"typevalue\":\"C\",\"idmovementtype\":\"9\"}', '2024-08-23 00:49:30', '2024-08-23 00:49:30', NULL);
INSERT INTO `audit` VALUES (243, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=movtipoDelete&id=8', '{\"idmovementtype\":\"8\"}', '2024-08-23 00:50:08', '2024-08-23 00:50:08', NULL);
INSERT INTO `audit` VALUES (244, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=movtipoRecuperar&id=8', '{\"deleted_at\":null,\"idmovementtype\":\"8\"}', '2024-08-23 00:50:15', '2024-08-23 00:50:15', NULL);
INSERT INTO `audit` VALUES (245, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=movtipoDelete&id=8', '{\"idmovementtype\":\"8\"}', '2024-08-23 00:50:21', '2024-08-23 00:50:21', NULL);
INSERT INTO `audit` VALUES (246, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=movtipoDelete&id=9', '{\"idmovementtype\":\"9\"}', '2024-08-23 00:50:41', '2024-08-23 00:50:41', NULL);
INSERT INTO `audit` VALUES (247, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=movtipoDelete&id=7', '{\"idmovementtype\":\"7\"}', '2024-08-23 00:50:45', '2024-08-23 00:50:45', NULL);
INSERT INTO `audit` VALUES (248, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=movtipoDelete&id=6', '{\"idmovementtype\":\"6\"}', '2024-08-23 00:50:51', '2024-08-23 00:50:51', NULL);
INSERT INTO `audit` VALUES (249, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMovTipo&id=2', '{\"acronym\":\"FC\",\"name\":\"Compra\",\"sequential\":\"0\",\"beneficiarytype\":\"P\",\"entry\":\"I\",\"typevalue\":\"C\",\"idmovementtype\":\"2\"}', '2024-08-23 00:51:03', '2024-08-23 00:51:03', NULL);
INSERT INTO `audit` VALUES (250, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMovTipo&id=1', '{\"acronym\":\"FV\",\"name\":\"Venta\",\"sequential\":\"30\",\"beneficiarytype\":\"C\",\"entry\":\"E\",\"typevalue\":\"P\",\"idmovementtype\":\"1\"}', '2024-08-23 00:51:08', '2024-08-23 00:51:08', NULL);
INSERT INTO `audit` VALUES (251, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'DELETE', '/api6ug8/?ruta=movtipoDelete&id=3', '{\"idmovementtype\":\"3\"}', '2024-08-23 00:51:45', '2024-08-23 00:51:45', NULL);
INSERT INTO `audit` VALUES (252, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=36', '{\"order\":\"03.05\",\"name\":\"Tipo de Comprobantes\",\"icon\":\"fas fa-ticket-alt\",\"route\":\"movtipo\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"36\"}', '2024-08-23 01:07:40', '2024-08-23 01:07:40', NULL);
INSERT INTO `audit` VALUES (253, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveMenu&id=7', '{\"order\":\"03.03\",\"name\":\"Registro de movimientos\",\"icon\":\"fas fa-truck-loading\",\"route\":\"movimientos\",\"submenu\":\"0\",\"status\":\"1\",\"idmenu\":\"7\"}', '2024-08-23 01:07:48', '2024-08-23 01:07:48', NULL);
INSERT INTO `audit` VALUES (254, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-23 01:29:21', '2024-08-23 01:29:21', NULL);
INSERT INTO `audit` VALUES (255, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=1', '{\"name\":\"Reporteador\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"1\"}', '2024-08-23 01:29:27', '2024-08-23 01:29:27', NULL);
INSERT INTO `audit` VALUES (256, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=saveUser&id=-1', '{\"fullname\":\"Reporteador\",\"idrole\":\"1\",\"lang\":\"es\",\"status\":\"1\",\"username\":\"reporter\",\"password\":\"cambiar\"}', '2024-08-23 01:41:04', '2024-08-23 01:41:04', NULL);
INSERT INTO `audit` VALUES (257, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=establecerclave', '{\"password\":\"$2y$12$lgUAMApbNWrQoRICp9KFzemhFyBEedFSNNSuhDmVeT4t1uRMsbxvy\",\"iduser\":26}', '2024-08-23 01:44:57', '2024-08-23 01:44:57', NULL);
INSERT INTO `audit` VALUES (258, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=login', '{\"token\":\"UUNuSmxWbzRWV1poUHExd3J5Tjg4TjN5cWFrcDl0ajR2OWVERVFZSmZkUG5nN3NtYWFkODNJWE5YSHl6RFpTVHhON2tHeG5VY0p0UjdaSjg4SU1XT1E9PQ==\",\"operations\":1,\"lastlogged\":\"2024-08-23 01:45:07\",\"iduser\":26}', '2024-08-23 01:45:07', '2024-08-23 01:45:07', NULL);
INSERT INTO `audit` VALUES (259, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=3', '{\"fullname\":\"Hugo\",\"idrole\":\"3\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"3\"}', '2024-08-23 01:45:43', '2024-08-23 01:45:43', NULL);
INSERT INTO `audit` VALUES (260, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveRole&id=3', '{\"name\":\"Usuario\",\"scope\":\"R\",\"status\":\"1\",\"idrole\":\"3\"}', '2024-08-23 01:45:59', '2024-08-23 01:45:59', NULL);
INSERT INTO `audit` VALUES (261, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=3', '{\"fullname\":\"Hugo\",\"idrole\":\"2\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"3\"}', '2024-08-23 01:47:54', '2024-08-23 01:47:54', NULL);
INSERT INTO `audit` VALUES (262, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=24', '{\"fullname\":\"Ing.%20Rita\",\"idrole\":\"3\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"24\"}', '2024-08-23 01:48:10', '2024-08-23 01:48:10', NULL);
INSERT INTO `audit` VALUES (263, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'PUT', '/api6ug8/?ruta=saveUser&id=24', '{\"fullname\":\"Ing. Rita\",\"idrole\":\"3\",\"lang\":\"es\",\"status\":\"1\",\"iduser\":\"24\"}', '2024-08-23 01:49:07', '2024-08-23 01:49:07', NULL);
INSERT INTO `audit` VALUES (264, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=resetearclave&id=25', '{\"password\":\"cambiar\",\"iduser\":\"25\"}', '2024-08-23 01:49:26', '2024-08-23 01:49:26', NULL);
INSERT INTO `audit` VALUES (265, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'POST', '/api6ug8/?ruta=resetearclave&id=24', '{\"password\":\"cambiar\",\"iduser\":\"24\"}', '2024-08-23 01:50:34', '2024-08-23 01:50:34', NULL);
INSERT INTO `audit` VALUES (266, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"iduser\":2,\"idbeneficiary\":\"78\",\"idmovementtype\":\"2\",\"date\":\"2024-08-23 18:22:33\",\"numberdocument\":\"002-125-0002569\",\"subtotal\":\"1121.6\",\"discount\":\"0\",\"total\":\"1121.6\",\"reference\":\"\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (267, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":93,\"idproduct\":\"10\",\"entry\":\"I\",\"qty\":\"15\",\"price\":\"2\",\"total\":\"30\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (268, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":93,\"idproduct\":\"9\",\"entry\":\"I\",\"qty\":\"20\",\"price\":\"2\",\"total\":\"40\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (269, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":93,\"idproduct\":\"7\",\"entry\":\"I\",\"qty\":\"15\",\"price\":\"2\",\"total\":\"30\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (270, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":93,\"idproduct\":\"22\",\"entry\":\"I\",\"qty\":\"75\",\"price\":\"2\",\"total\":\"150\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (271, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":93,\"idproduct\":\"27\",\"entry\":\"I\",\"qty\":\"20\",\"price\":\"9\",\"total\":\"180\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (272, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":93,\"idproduct\":\"30\",\"entry\":\"I\",\"qty\":\"500\",\"price\":\"0.3832\",\"total\":\"191.6\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (273, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=saveTransaction&id=-1', '{\"idtransaction\":93,\"idproduct\":\"1\",\"entry\":\"I\",\"qty\":\"100\",\"price\":\"5\",\"total\":\"500\"}', '2024-08-23 18:22:33', '2024-08-23 18:22:33', NULL);
INSERT INTO `audit` VALUES (274, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=saveBene&id=852', '{\"type\":\"A\",\"name\":\"DIPROAVILM\",\"comercialname\":\"DIPROAVILM\",\"ididentificationtype\":\"1\",\"identificationnumber\":\"1792677610001\",\"idcountry\":\"50\",\"idprovince\":\"19\",\"idcity\":\"177\",\"address\":\"\",\"parish\":\"\",\"phone\":\"\",\"email\":\"\",\"web\":\"\",\"creditquota\":\"0\",\"creditdays\":\"0\",\"account\":\"\",\"idbeneficiary\":\"852\"}', '2024-08-24 00:33:02', '2024-08-24 00:33:02', NULL);
INSERT INTO `audit` VALUES (275, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=saveBene&id=852', '{\"type\":\"E\",\"name\":\"DIPROAVILM\",\"comercialname\":\"DIPROAVILM\",\"ididentificationtype\":\"1\",\"identificationnumber\":\"1792677610001\",\"idcountry\":\"50\",\"idprovince\":\"19\",\"idcity\":\"177\",\"address\":\"\",\"parish\":\"\",\"phone\":\"\",\"email\":\"\",\"web\":\"\",\"creditquota\":\"0\",\"creditdays\":\"0\",\"account\":\"\",\"idbeneficiary\":\"852\"}', '2024-08-24 00:33:11', '2024-08-24 00:33:11', NULL);
INSERT INTO `audit` VALUES (276, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=saveconfig&id=9', '{\"order\":\"1\",\"label\":\"RUC\",\"variable\":\"empresa_ruc\",\"vvalue\":\"1792677610001\",\"idconfig\":\"9\"}', '2024-08-26 00:48:45', '2024-08-26 00:48:45', NULL);
INSERT INTO `audit` VALUES (277, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=saveconfig&id=15', '{\"order\":\"89\",\"label\":\"Rol default de BOT\",\"variable\":\"rol_bot\",\"vvalue\":\"5\",\"idconfig\":\"15\"}', '2024-08-26 00:49:10', '2024-08-26 00:49:10', NULL);
INSERT INTO `audit` VALUES (278, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=saveconfig&id=11', '{\"order\":\"3\",\"label\":\"Tel\\u00e9fono\",\"variable\":\"empresa_telefono\",\"vvalue\":\"0990000001\",\"idconfig\":\"11\"}', '2024-08-26 02:41:13', '2024-08-26 02:41:13', NULL);
INSERT INTO `audit` VALUES (279, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=deleteMenu&id=17', '{\"idmenu\":\"17\"}', '2024-08-26 19:16:47', '2024-08-26 19:16:47', NULL);
INSERT INTO `audit` VALUES (280, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=botcapasSave&id=-1', '{\"wordfind\":\"casa\",\"menurun\":\"10\",\"confirmed\":\"0\"}', '2024-08-26 20:53:30', '2024-08-26 20:53:30', NULL);
INSERT INTO `audit` VALUES (281, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=botcapasSave&id=161', '{\"wordfind\":\"casas\",\"menurun\":\"menu\",\"confirmed\":\"0\",\"idbotspelling\":\"161\"}', '2024-08-26 21:04:45', '2024-08-26 21:04:45', NULL);
INSERT INTO `audit` VALUES (282, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=botcapasSave&id=161', '{\"wordfind\":\"casasasd asd asd\",\"menurun\":\"saludo\",\"confirmed\":\"0\",\"idbotspelling\":\"161\"}', '2024-08-26 21:04:52', '2024-08-26 21:04:52', NULL);
INSERT INTO `audit` VALUES (283, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=botcapasSave&id=160', '{\"wordfind\":\"informe de usuarios\",\"menurun\":\"lista_usuarios\",\"confirmed\":\"1\",\"idbotspelling\":\"160\"}', '2024-08-26 23:01:22', '2024-08-26 23:01:22', NULL);
INSERT INTO `audit` VALUES (284, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botcapasDelete&id=161', '{\"idbotspelling\":\"161\"}', '2024-08-27 01:19:22', '2024-08-27 01:19:22', NULL);
INSERT INTO `audit` VALUES (285, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=botcapasSave&id=159', '{\"wordfind\":\"quiero el reporte de usuarios\",\"menurun\":\"lista_usuarios\",\"confirmed\":\"1\",\"idbotspelling\":\"159\"}', '2024-08-27 01:21:25', '2024-08-27 01:21:25', NULL);
INSERT INTO `audit` VALUES (286, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botcapasDelete&id=45', '{\"idbotspelling\":\"45\"}', '2024-08-28 23:26:37', '2024-08-28 23:26:37', NULL);
INSERT INTO `audit` VALUES (287, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botcapasDelete&id=46', '{\"idbotspelling\":\"46\"}', '2024-08-28 23:26:44', '2024-08-28 23:26:44', NULL);
INSERT INTO `audit` VALUES (288, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botcapasDelete&id=47', '{\"idbotspelling\":\"47\"}', '2024-08-28 23:26:50', '2024-08-28 23:26:50', NULL);
INSERT INTO `audit` VALUES (289, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botcapasDelete&id=48', '{\"idbotspelling\":\"48\"}', '2024-08-28 23:26:56', '2024-08-28 23:26:56', NULL);
INSERT INTO `audit` VALUES (290, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botcapasDelete&id=49', '{\"idbotspelling\":\"49\"}', '2024-08-28 23:27:01', '2024-08-28 23:27:01', NULL);
INSERT INTO `audit` VALUES (291, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=botdicSave&id=-1', '{\"menu\":\"ccc\",\"description\":\"ascasc\",\"ismenu\":\"0\",\"action\":\"T\",\"txt\":\"ascascascasc\\nasc\\nasc\\nas\\ncas\\nc\\nasc\\nasc\"}', '2024-08-29 00:52:48', '2024-08-29 00:52:48', NULL);
INSERT INTO `audit` VALUES (292, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=botdicSave&id=26', '{\"menu\":\"ccc\",\"description\":\"ascasc\",\"ismenu\":\"0\",\"action\":\"Q\",\"txt\":\"ascascascasc\\nasc\\nasc\\nas\\ncas\\nc\\nasc\\nasc\",\"idbotdic\":\"26\"}', '2024-08-29 00:52:59', '2024-08-29 00:52:59', NULL);
INSERT INTO `audit` VALUES (293, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=botdicSave&id=26', '{\"menu\":\"ccc\",\"description\":\"asd asd asd asd asd\",\"ismenu\":\"1\",\"action\":\"M\",\"txt\":\"ascascascasc\\nasc\\nasc\\nas\\ncasas dasd asd \\nc\\nasc\\nasc\",\"idbotdic\":\"26\"}', '2024-08-29 00:53:20', '2024-08-29 00:53:20', NULL);
INSERT INTO `audit` VALUES (294, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botdicsDelete&id=26', '{\"idbotdic\":\"26\"}', '2024-08-29 00:53:27', '2024-08-29 00:53:27', NULL);
INSERT INTO `audit` VALUES (295, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'POST', '/api6ug8/?ruta=botdicSave&id=-1', '{\"menu\":\"Calro\",\"description\":\"askdjlaskjda\",\"ismenu\":\"0\",\"action\":\"T\",\"txt\":\"<nombre><tiempo><fecha>\"}', '2024-08-29 01:15:30', '2024-08-29 01:15:30', NULL);
INSERT INTO `audit` VALUES (296, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'DELETE', '/api6ug8/?ruta=botdicsDelete&id=27', '{\"idbotdic\":\"27\"}', '2024-08-29 01:15:36', '2024-08-29 01:15:36', NULL);
INSERT INTO `audit` VALUES (297, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'PUT', '/api6ug8/?ruta=botdicSave&id=1', '{\"menu\":\"menu\",\"description\":\"Men\\u00fa de Opciones\",\"ismenu\":\"1\",\"action\":\"M\",\"txt\":\"SELECT \\n    CONCAT(\\\"\\/\\\", menu) as `menu`,\\n    `description`\\nFROM \\n    bot_dictionary \\nWHERE \\n    ismenu = 1 \\n    AND deleted_at IS NULL \\nORDER BY \\n    menu\",\"idbotdic\":\"1\"}', '2024-08-29 02:10:31', '2024-08-29 02:10:31', NULL);

-- ----------------------------
-- Table structure for beneficiary
-- ----------------------------
DROP TABLE IF EXISTS `beneficiary`;
CREATE TABLE `beneficiary`  (
  `idbeneficiary` int NOT NULL AUTO_INCREMENT,
  `type` enum('C','P','A','E') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'C' COMMENT 'C-Cliente P-Proveedor A-Ambos',
  `ididentificationtype` int NOT NULL DEFAULT 1 COMMENT 'Tipo de identificacion Cedula, Ruc, Pasaporte',
  `identificationnumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '' COMMENT 'Numero de cedula, ruc, pasaporte, o tax number en caso de ser internacionales',
  `idcountry` int NOT NULL DEFAULT 0,
  `idprovince` int NOT NULL DEFAULT 0,
  `idcity` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `comercialname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `parish` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '' COMMENT 'Parroquia',
  `creditquota` double(20, 2) NOT NULL DEFAULT 0.00 COMMENT 'Cupo credito',
  `creditdays` int NULL DEFAULT 0 COMMENT 'Dias de credito',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '' COMMENT 'Cuenta contable',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idbeneficiary`) USING BTREE,
  INDEX `IDXCity`(`idcity` ASC) USING BTREE,
  INDEX `IDXCountry`(`idcountry` ASC) USING BTREE,
  INDEX `IDXProvince`(`idprovince` ASC) USING BTREE,
  INDEX `ididentificationtype`(`ididentificationtype` ASC) USING BTREE,
  CONSTRAINT `beneficiary_ibfk_1` FOREIGN KEY (`ididentificationtype`) REFERENCES `identificationtype` (`ididentificationtype`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXCity` FOREIGN KEY (`idcity`) REFERENCES `city` (`idcity`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXCountry` FOREIGN KEY (`idcountry`) REFERENCES `country` (`idcountry`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXProvince` FOREIGN KEY (`idprovince`) REFERENCES `province` (`idprovince`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 853 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of beneficiary
-- ----------------------------
INSERT INTO `beneficiary` VALUES (1, 'C', 4, '9999999999', 50, 19, 177, 'CONSUMIDOR FINAL', 'CONSUMIDOR FINAL', 'CONSUMIDOR FINAL', ' ', '', '', '10 DE AGOSTO', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:04:29', NULL);
INSERT INTO `beneficiary` VALUES (2, 'C', 2, '1205448580', 50, 19, 177, 'DIAZ BAQUE RUDDY ELIANA', 'R.D. SERVICES', 'ROCA E6-09 y JUAN LEON MERA', ' ', '', '', 'MARISCAL SUCRE', 1000.00, 30, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (3, 'C', 1, '1713163622001', 50, 19, 177, 'PABON ALBUJA ALEXIS MAURICIO', 'A.P. CONSULTOR', 'JUAN MARQUEZ 0E1-115 y PEDRO DE ALFARO', '0998531307 0', 'mpabonni@gmail.com', '', 'CALDERÓN (CARAPUNGO) ', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (4, 'C', 1, '1792677610001', 50, 19, 177, 'DISTRIBUIDORA DE PRODUCTOS AVICOLAS LOPEZ MARTINEZ DIPROAVILM CIA.LTDA.', '', 'VIRGEN DE MONSERRATE 23 Y RAFAEL CALVACHE', '0996213701 ', 'jlopez@diporavilm.com', '', 'QUITO DISTRITO METROPOLITANO', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (5, 'C', 1, '1792133203001', 50, 19, 177, 'ALIMENTOS BALANCEADOS AVIFORTE CIA. LTDA.', 'AVIFORTE CIA. LTDA.', 'San Jose Oe 8252 y San Camilo', '025005511 0', 'lizardo.andrade@aliforte.com.ec', '', 'QUITO DISTRITO METROPOLITANO', 200000.00, 30, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (6, 'C', 1, '0791790700001', 50, 7, 54, 'COORPORACION AVICOLA EL GUAYACAN AVIGUAY S A', '', 'Pichincha S/N', ' ', 'corpoguayacan@gmail.com', '', 'BALSAS', 100000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (7, 'C', 1, '0992418664001', 50, 10, 75, 'OBRECONSTRU S A', 'OBRECONSTRU S A', 'AV MARCEL LANIADO Y CIRCUNVALACION NORTE', ' ', 'departamentocontable_2017@hotmail.com obreconstru@hotmail.com', '', 'CALDERÓN (CARAPUNGO) ', 5000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (8, 'C', 1, '1791306961001', 50, 19, 177, 'AVICOLA VITALOA S.A. AVITALSA', '', 'OSWALDO GUAYASAMIN OE4-100 y RODRIGO NUÑEZ', '2372-740 022372736', 'gmiranda@avitalsa.com secretaria_presidencia@avitalsa.com', '', 'QUITO DISTRITO METROPOLITANO', 240000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (9, 'C', 1, '1790319857001', 50, 21, 188, 'PROCESADORA NACIONAL DE ALIMENTOS C.A.PRONACA', 'PRONACA', 'LOS NARANJOS 44-15 LOS GRANADOS', '099822714 095651212', 'facturacionelectronica@pronaca.com; wgguillenn@pronaca.com;conselec@yahoo.es; facturacionelectronica@pronaca.com; wgguillenn@pronaca.com; controltributario@avesca.com.ec', '', 'SANTO DOMINGO DE LOS COLORADOS', 40000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (10, 'C', 1, '1313006957001', 50, 19, 177, 'MACIAS LOOR MELANY XIOMARA', '', 'MANABI / PORTOVIEJO / ANDRÉS DE VERA', ' ', 'danilo0923@hotmail.com', '', 'CALDERÓN (CARAPUNGO) ', 50000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (11, 'C', 1, '1791294505001', 50, 21, 188, 'REPROIMAV S.A. REPRESENTACION DE PRODUCTOS E IMPLEMENTOS AVICOLAS', 'REPROIMAV S.A.', 'LOTIZACION BUENOS AIRES', '0999838896 ', 'ventasreproimavmaster@gmail.com', '', 'SANTO DOMINGO DE LOS COLORADOS', 20000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (12, 'C', 1, '0591761161001', 50, 6, 48, 'ECUAPOLLO', 'ECUAPOLLO SALCEDO', 'SALCEDO/ SAN MIGUEL', ' ', 'ecuapollosalcedo21@gmail.com', '', 'SAN MIGUEL', 10000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (13, 'C', 1, '1792003571001', 50, 19, 177, 'L.P. MARCELO PACHECO CIA. LTDA.', 'POLLOS LA PRADERA', 'VIA INTEROCEANICA S/N', '2380388 ', 'lpacheco@avicolalapradera.com.ec', '', 'QUITO DISTRITO METROPOLITANO', 100000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (14, 'C', 1, '0401312707001', 50, 4, 30, 'GUERRA GUERRA OSCAR SANTIAGO', 'GRANJITA MARKET', 'PANM NORTE PUNTALES BAJO S/N y SN', ' ', '', '', 'BOLÍVAR', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (15, 'C', 1, '0705368934001', 50, 7, 54, 'FLORES ESPINOZA DIEGO VICENTE', '', ' S/N', ' ', '', '', 'BALSAS', 10000.00, 14, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (16, 'C', 2, '0503909012', 50, 19, 177, 'CASTRO ALOMOTO ERNESTO', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (17, 'C', 1, '0591755366001', 50, 6, 48, 'SIERRAFERTTIL CIA LTDA', 'SIERRAFERTIL', 'SALCEDO SALACHE RUMIPAMBA S/N Y PANAMERICANA E35', ' 0997627018', 'recepcion@sierrafertil.com.ec', '', 'SALANGO', 100000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (18, 'C', 1, '0601680317001', 50, 5, 35, 'CURILLO SAIGUA ROSA MARIA', 'EL CAMPO DISTRIBUIDOR', 'ESPEJO 31-27 y NUEVA YORK', ' ', '', '', 'VELASCO', 10000.00, 1, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (19, 'C', 2, '0503598385', 50, 6, 47, 'ACHOTE CHICAIZA SONIA ABIGAIL', '', 'PUJILÍ', ' ', '', '', 'PUJILÍ', 10000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (20, 'C', 2, '0200678225', 50, 19, 177, 'VASCONEZ CAICEDO MARTHA SUSANA', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 8, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (21, 'C', 2, '1721159414', 50, 19, 177, 'GUANOTAXI GREFA HENRY BOLIVAR', '', 'Quito/ Barrio Atucucho /calle Carlota Jaramillo y transversal H', '0987391391 ', '', '', 'QUITO DISTRITO METROPOLITANO', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (22, 'C', 2, '0503323495', 50, 6, 44, 'TOAPANTA TOAPANTA LUIS ALEXIS', '', 'CARIGUAYRAZO S/N y AV ATAHUALPA', ' ', '', '', 'IGNACIO FLORES (PARQUE FLORES) ', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (23, 'C', 2, '0704568716', 50, 7, 62, 'AYALA CHOCANO VERONICA JAKELINE', '', 'VOLTAIRE PALADINES S/N y CUENCA', ' ', '', '', 'SANTA ROSA', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (24, 'C', 2, '1717092520', 50, 19, 177, 'GOMEZ HUILCA GABRIELA', '', 'N48B OE8-50', ' ', '', '', 'COCHAPAMBA', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (25, 'C', 2, '0604993840', 50, 5, 41, 'LEMA CUSQUILLO GEOVANNY EFRAIN', '', 'Barrio Libertad la Doloroza', ' ', 'Geobanylema@gmail.com', '', 'LA MATRIZ', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (26, 'C', 1, '0703524983001', 50, 13, 121, 'MORAN AGUILAR TELMO DAVID', '', 'EL ORO', ' ', '', '', 'PATRICIA PILAR', 10000.00, 30, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (27, 'C', 2, '1726370198', 50, 19, 177, 'OBANDO GUAJAN FAUSTO MARTIN', '', 'QUITO', ' ', '', '', 'QUITO DISTRITO METROPOLITANO', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (28, 'C', 2, '1500015472', 50, 19, 177, 'GORDILLO SALCEDO VICTOR HUGO', '', ' ', ' ', '', '', 'KENNEDY', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (29, 'C', 2, '0503802951', 50, 19, 177, 'TOAPANTA LOGRO JORGE ANIBAL', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (30, 'C', 2, '1104015217', 50, 12, 106, 'VINTIMILLA GUALAN ANDREA KATHERINE', '', 'CATACOCHA 14-45 y BOLIVAR', ' ', '', '', 'SAN SEBASTIÁN', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (31, 'C', 2, '0104362264', 50, 3, 22, 'ANGAMARCA MEDINA ANDREA PAOLA', 'CIRCULO AMERICANO DEL LIBRO', 'BOLIVAR 12-06 y GENERAL ENRIQUEZ', ' ', '', '', 'AZOGUES', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (32, 'C', 2, '1102698337', 50, 12, 106, 'CAÑAR PACHAR EDUARDO BLADIMIRO', '', 'MANZANOS A-11 y ROMERILLOS', ' ', '', '', 'SAN SEBASTIÁN', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (33, 'C', 2, '1715001234', 50, 19, 177, 'CASTRO URQUIZO VERONICA JACQUELINE', '', 'Quito', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (34, 'C', 2, '2100882402', 50, 22, 191, 'GAVILANES CHOCON JIMENA ELIZABETH', '', 'VIA QUITO S/N', ' ', '', '', 'SANTA ROSA DE SUCUMBÍOS', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (35, 'C', 2, '0603297698', 50, 5, 35, 'URQUIZO CHAVEZ NELSON OSWALDO', 'AVICOLA CHIMBORAZO', 'PANAMERICANA SUR ', ' ', '', '', 'LICÁN', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (36, 'C', 2, '1101638680', 50, 19, 177, 'CASTILLO MILTON LEONARDO', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (37, 'C', 2, '0704907864', 50, 19, 177, 'QUEVEDO ORDO?EZ VALERIA CECIBEL', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (38, 'C', 2, '1711259794', 50, 6, 45, 'MUZO CONCHAMBAY GERMAN RIGOBERTO', '', 'QUITO', ' ', '', '', 'EL TRIUNFO', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (39, 'C', 2, '1600347585', 50, 18, 164, 'AGUIRRE MONTERO PATRICIA ELIZABETH', '', 'PRINCIPAL ', ' ', '', '', 'PUYO', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (40, 'C', 1, '1793192220001', 50, 19, 177, 'CENTRO AGROPECUARIO Y SALUD ANIMAL CRUZ CASA CRUZ S C C', '', 'LA ELOISA N69J E11-190', '022425203 0999415227', 'compras@casacruz.com.ec', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-19 15:31:12', NULL);
INSERT INTO `beneficiary` VALUES (41, 'C', 1, '0992787503001', 50, 19, 177, 'TRANSPORTES CASTRO  HIJOS  S A', '', 'GUAYAQUIL', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (42, 'C', 2, '1714483730', 50, 19, 177, 'SIMBAÑA CASAS WILMER ARTURO', '', 'ANTONIO GROSS 3-B y AV. GEOVANNY CALLES', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (43, 'C', 2, '1709264822', 50, 19, 177, 'PINTO TAXIGUANO EDGAR RODRIGO', 'PINTO TAXIGUANO EDGAR RODRIGO', 'QUITO', ' 0998104606', 'edgar.rodrigo1966@hotmail.com', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (44, 'C', 2, '0400949756', 50, 19, 177, 'TALABERA ZULETA JACQUELINE ELIZABETH', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (45, 'C', 2, '1308015161', 50, 14, 141, 'PACHAY GARCIA MARIA ESTHER', '', 'CHIMBORAZO S/N y CALLE 23 DE OCTUBRE', ' ', '', '', 'MONTECRISTI', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (46, 'C', 2, '0401013222', 50, 4, 31, 'CUAICAL MORILLO SEGUNDO GERMANICO', '', 'BOLIVAR 5-60 y QUIROGA', ' ', '', '', 'EL ÁNGEL', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (47, 'C', 1, '1716944614001', 50, 19, 177, 'SOLIS TAPIA CRISTINA ELIZABETH', 'IMPSERVIC ASESORIA TRIBUTARIA', 'EL MANANTIAL N65-73 y AGUA CLARA', ' ', '', '', 'CARCELÉN', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (48, 'C', 2, '1711013720', 50, 19, 179, 'GUANO CHIGUANO MANUEL MARIA', '', 'ATAHUALPA SN y CRISTOBAL COLON', ' ', '', '', 'MACHACHI ', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (49, 'C', 2, '0503902785', 50, 6, 44, 'CHICAIZA CAIZA CARMEN ALEXANDRA', '', 'PRINCIPAL S/N', ' ', '', '', 'TANICUCHÍ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (50, 'C', 2, '0701912750', 50, 19, 177, 'SAMANIEGO CORREA DALILA DE LOURDES', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (51, 'C', 2, '0301322780', 50, 19, 177, 'CUESTA REINOSO BLANCA INES', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (52, 'C', 2, '0201306305', 50, 19, 177, 'SAGNAI CABEZAS BETY ELVIRA', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (53, 'C', 2, '0703196287', 50, 19, 177, 'LOPEZ NARANJO MIGUEL ALEXANDER', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (54, 'C', 2, '0101162048', 50, 1, 1, 'PADILLA VASQUEZ CARLOS MIGUEL', '', 'DEL RETORNO S-N y BENJAMIN FRANKLYN', ' ', '', '', 'BELLAVISTA', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (55, 'C', 2, '1707912851', 50, 19, 177, 'ULCUANGO ALCOSER RINA MERCEDES', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (56, 'C', 2, '1500459423', 50, 19, 177, 'ANDY LOPEZ LEONARDO MESIAS AGROS', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (57, 'C', 1, '0602576407001', 50, 5, 41, 'PADILLA SAMANIEGO WILTER KLEVER', '', 'GUANO.LANGOS CHICO', ' ', '', '', 'EL ROSARIO', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (58, 'C', 2, '0602923856', 50, 5, 35, 'ALCOCER VENLASAGA ANGEL BOLIVAR', '', 'COLOMBIA 2021 y TARQUI', ' ', '', '', 'VELOZ', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (59, 'C', 2, '0401016704', 50, 19, 177, 'MARTINEZ MOLINA WILLAM ORLANDO', '', 'QUITO', ' ', '', '', 'QUITO DISTRITO METROPOLITANO', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (60, 'C', 2, '0501891006', 50, 6, 44, 'QUINGATUNA UNAPANTA JAKELINE DEL PILAR', '', '10 DE AGOSTO SN y PASAJE COLOMBIA', ' ', '', '', 'ELOY ALFARO (SAN FELIPE) ', 3000000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (61, 'C', 2, '1101160032', 50, 19, 177, 'BETANCOURT JIMENEZ CONSTANTE FLORENTINO', '', 'T 54 y PASAJE SIN NOMBRE', ' ', '', '', 'CONOCOTO', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (62, 'C', 2, '0401068010', 50, 22, 194, 'QUILUMBA PASTAZ MARCO ANTONIO', '', 'LIBERTAD S/N', ' ', '', '', 'NUEVA LOJA', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (63, 'C', 2, '1718875840', 50, 19, 177, 'CATOTA YEPEZ CESAR AUGUSTO', '', 'QUITO', ' ', '', '', 'QUITO DISTRITO METROPOLITANO', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (64, 'C', 2, '1704468014', 50, 19, 177, 'PILLAJO MUZO LUIS ALFREDO', '', 'PASAJE N52M E16-25 y LOS ALCES', ' ', '', '', 'KENNEDY', 10000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (65, 'C', 1, '0502306566001', 50, 6, 44, 'QUINGATUÑA UNAPANTA MAYRA ELIZABETH', '', 'LATACUNGA', ' ', '', '', 'LATACUNGA', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (66, 'C', 2, '0101218089', 50, 15, 156, 'SAMANIEGO AVILA LAURO MIGUEL', '', '24 DE MAYO S/N y GABINO RIVADENEIRA', ' ', '', '', 'MACAS', 200000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (67, 'C', 2, '1708802804', 50, 19, 181, 'ANASI CAJAMARCA LUIS BLADIMIR', 'AUTO SPA EXPRESS', 'AV MARIANA DE JESUS 300 y ROSA ZARATAE', ' ', '', '', 'SANGOLQUÍ', 200000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (68, 'C', 2, '0301322921', 50, 19, 177, 'LUNA LUCERO PABLO MAURICIO', '', 'QUITO', ' ', '', '', 'QUITO DISTRITO METROPOLITANO', 200000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (69, 'C', 2, '0401080767', 50, 19, 177, 'MARTINEZ BRACHO LENIN OMAR', '', 'QUITO', ' ', '', '', 'CALDERÓN (CARAPUNGO) ', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (70, 'C', 1, '0502060957001', 50, 6, 44, 'VELOZ MALAVE HUGO VINICIO', '', 'SAN ISIDRO LABRADOR S/N y COLONDRIZ', ' ', '', '', 'JUAN MONTALVO (SAN SEBASTIÁN)', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (71, 'C', 2, '0401158894', 50, 19, 177, 'LOPEZ ROMO JORGE LUIS', '', 'PASAJE SIETE S26-98 y AV. PRINCIPAL', ' ', '', '', 'LA MAGDALENA', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (72, 'C', 2, '0103927497', 50, 1, 1, 'ZUÑIGA PACHECO DANNY ROBERTO', '', 'BROMELIAS S/N y AV ORDOÑEZ LASSO', ' ', '', '', 'SAN SEBASTIÁN', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (73, 'C', 1, '0992849010001', 50, 10, 75, 'TRANSPORTE LOGISTICO PESADO TRANSFREMEC S.A.', '', '19C SOLAR 2', '0969250112 045065387', 'vicentemendoza198101@gmail.com', '', 'TARQUI', 100000.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (74, 'C', 1, '0491529466001', 50, 19, 177, 'RECFRONTRUKS S.A', '', 'MOJANDA N49 Y ATACAZO', '062224467 0', 'byron-r@hotmail.com', '', 'CALDERÓN (CARAPUNGO) ', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (75, 'C', 1, '0993374568001', 50, 10, 75, 'TRANSPORTE LOGISTICO PESADO TRANSGUAYAQUIL SA', 'TRANSGUAYAQUIL SA', 'Coop Pajaro Azul, Mz 1652 SL 22, Tarqui', '0969250112 ', 'transfremec@outlook.es', '', 'TARQUI', 0.00, 0, '1.1.02.05.01', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (76, 'P', 1, '0602898942001', 50, 19, 177, 'ABARCA VINTIMILLA FERNANDO SANTIAGO', 'SANTIAGO DOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (77, 'P', 1, '0603480344001', 50, 19, 177, 'ABARCA VINTIMILLA SUSANA BELEN', 'FLASH MARKET RIO', '', '2510689', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (78, 'P', 1, '1792458935001', 50, 19, 177, 'ADECAMOR CIA LTDA.', 'ADECAMOR CIA LTDA.', '', '032620262', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (79, 'P', 1, '0992797193001', 50, 19, 177, 'ADMINISTRACION Y NEGOCIOS ADNE C. LTDA.', 'ADMINISTRACION Y NEGOCIOS ADNE C. LTDA.', '', '042396479', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (80, 'P', 1, '1790601501001', 50, 19, 177, 'AFABA', 'AFABA', '', '255459/2566662', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (81, 'P', 1, '0190401782001', 50, 19, 177, 'AFERGRAN CIA. LTDA.', 'AFERGRAN CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (82, 'P', 1, '0990006687001', 50, 19, 177, 'AGRIPAC S.A.', 'AGRIIPAC S.A.', '', '(04) 281 1616', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (83, 'P', 1, '0703685560001', 50, 19, 177, 'AGUILAR MONCADA ERIK ALBERTO', 'AGUILAR MONCADA ERIK ALBERTO', '', '0987239847', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (84, 'P', 1, '0705105021001', 50, 19, 177, 'AGUILAR SANCHEZ JEFFERSON ANDRES', '', '', '0992645061', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (85, 'P', 1, '2100656608001', 50, 19, 177, 'AGUILAR VIVANCO QUELI MARCELA', 'AGUILAR VIVANCO QUELI MARCELA', '', '0990673107', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (86, 'P', 1, '1104332893001', 50, 19, 177, 'AGUIRRE ENCARNACION  ALEXANDER ERNESTO', '', '', '0979120486', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (87, 'P', 1, '0791818931001', 50, 19, 177, 'AICRUX C.L.', 'AICRUX C.L.', '', '0993656613', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (88, 'P', 1, '1790475247001', 50, 19, 177, 'AIG METROPOLITANA CIA. DE SEGUROS Y REASEGUROS S.A.', 'AIG METROPOLITANA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (89, 'P', 1, '0190403807001', 50, 19, 177, 'ALIMENTOS ALIBALGRAN CIA. LTDA.', '', '', '2853845', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (90, 'P', 1, '1792133203001', 50, 19, 177, 'ALIMENTOS BALANCEADOS AVIFORTE CIA. LTDA.', 'AVIFORTE CIA. LTDA.', '', '2447553', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (91, 'P', 1, '1890141508001', 50, 19, 177, 'ALOBAMBA CIA. LTDA. FACTURAELECTRONICAECUADOR.COM', 'ALOBAMBA CIA. LTDA. FACTURAELECTRONICAECUADOR.COM', '', '032456156', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (92, 'P', 1, '1708453954001', 50, 19, 177, 'ALVARADO SEVILLA MARCOS BENITO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (93, 'P', 1, '0601315229001', 50, 19, 177, 'ALVEAR HARO NICOLAS MANUEL', 'GASOLINERA EL DORADO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (94, 'P', 1, '1791830679001', 50, 19, 177, 'AMERICANTRUCK S.C.C.', 'AMERICANTRUCK', '', '022908540', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (95, 'P', 1, '0701398695001', 50, 19, 177, 'APOLO ROMERO MIGUEL ANTONIO', 'APOLO ROMERO MIGUEL ANTONIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (96, 'P', 1, '1150276499001', 50, 19, 177, 'ARMIJOS ENCARNACION JORGE EMMANUEL', '', '', '0994619930', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (97, 'P', 1, '1104968852001', 50, 19, 177, 'ARMIJOS MOROCHO JOE ESTALIN', 'ALIMENTOS BALANCEADOS JOE', '', '0968734113', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (98, 'P', 1, '1101818423001', 50, 19, 177, 'ARMIJOS RAMON JAIME WILFRIDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (99, 'P', 1, '0704208867001', 50, 19, 177, 'ASANZA RAMIREZ JOSE LUIS', 'ASANZA RAMIREZ JOSE LUIS', '', '25176661', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (100, 'P', 1, '0190123626001', 50, 19, 177, 'ASEGURADORA DEL SUR', 'ASEGURADORA DEL SUR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (101, 'P', 1, '0791748631001', 50, 19, 177, 'ASOCIACION DE PRODUCTORES PECUARIOS EL ORO', 'ASOCIACION DE PRODUCTORES PECUARIOS EL ORO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (102, 'P', 1, '0991331859001', 50, 19, 177, 'ATIMASA S.A.', 'ATIMASA S.A.', '', '222222222', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (103, 'P', 1, '1891710808001', 50, 19, 177, 'AVIPAZ CIA. LTDA.', 'AVIPAZ CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (104, 'P', 1, '1707273189001', 50, 19, 177, 'AYORA PALACIO JOSE CARLOS', 'AYORA PALACIO JOSE CARLOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (105, 'P', 1, '0791792967001', 50, 19, 177, 'BA&Q  CIA.LTDA.', '', '', '999999999', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (106, 'P', 1, '0790002350001', 50, 19, 177, 'BANCO DE MACHALA S. A.', 'BANCO DE MACHALA S. A.', '', '2583129 583130', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (107, 'P', 1, '0990005737001', 50, 19, 177, 'BANCO DEL PACIFICO S. A.', 'BANCO DEL PACIFICO S. A.', '', '04373 1500 : 4', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (108, 'P', 1, '0990049459001', 50, 19, 177, 'BANCO GUAYAQUIL S.A.', 'BANCO DE GUAYAQUIL', '', '043730100', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (109, 'P', 1, '1703791093001', 50, 19, 177, 'BARBA DELGADO JOSE EDUARDO', 'ESTACION DE SERVICIOS VIRGEN DEL CISNE 2', '', '0999388362', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (110, 'P', 1, '0400878468001', 50, 19, 177, 'BASTIDAS HERNANDEZ FAUSTO GERMAN', 'VIVERES BASTIDAS', '', '07245781', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (111, 'P', 1, '0700004195001', 50, 19, 177, 'BELTRAN COBOS CARLOS ALEJANDRO', 'BELTRAN COBOS CARLOS ALEJANDRO', '', '0989505835', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (112, 'P', 1, '0992275960001', 50, 19, 177, 'BELUMA S.A.', 'DULCERIA DOLUPA', '', '042100373', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (113, 'P', 1, '0993243558001', 50, 19, 177, 'BIMIVET SA', '', '', '042103725', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (114, 'P', 1, '0704172188001', 50, 19, 177, 'BLACIO MORENO YUDI LIZETH', 'BLACIO MORENO YUDI LIZETH', '', '072968300', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (115, 'P', 1, '0706759735001', 50, 19, 177, 'BLACIO SUAREZ BETSY ALEJANDRA', 'BLACIO SUAREZ BETSY ALEJANDRA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (116, 'P', 1, '1714219407001', 50, 19, 177, 'BLACIO TITUANA ERASMO HERNAN', 'BLACIO TITUANA ERASMO HERNAN', '', '0986064157', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (117, 'P', 1, '0601802325001', 50, 19, 177, 'BONIFAZ BALLAGAN LILIAN GRACIELA', 'ESTACION DE SERVICIOS LA VICTORIA', '', '0998202228', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (118, 'P', 1, '1800384826001', 50, 19, 177, 'BONILLA ORTIZ VICTORIA EVELINA', 'GASOLINERA VALLE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (119, 'P', 1, '0705177251001', 50, 19, 177, 'BRAVO PALMA  GISELLE LISBETH', '', '', '072517711', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (120, 'P', 1, '0991322833001', 50, 19, 177, 'BRUCOSA S.A.', 'GREEN HOUSE', '', '0993473812', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (121, 'P', 1, '0702371402001', 50, 19, 177, 'BURNEO JIMENEZ RICHARD EDUARDO', 'R B J TRUCK PARTS', '', '2922268-0987967', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (122, 'P', 1, '0600583652001', 50, 19, 177, 'CABRERA BRITO VIOLETA GERMANIA', 'ESTACION DE SERVICIO LA GIRALDA', '', '032916277', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (123, 'P', 1, '0910397090001', 50, 19, 177, 'CALLE ANGUMBA NELSON EDUARDO', 'EQUIPESAS', '', '042754608', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (124, 'P', 1, '0706335817001', 50, 19, 177, 'CAMPOVERDE SALAZAR EVELYN YESENIA', '', '', '0997627166', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (125, 'P', 1, '1791711564001', 50, 19, 177, 'CARINTERNATIONAL S.A.', 'CARINTERNATIONAL S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (126, 'P', 1, '0992447508001', 50, 19, 177, 'CARLOS ESPINOZA APOLO', 'BODEGA CENTRAL COMDERE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (127, 'P', 1, '1756512768001', 50, 19, 177, 'CARTAGENA POSSO CAMEN DELIA', 'CARTAGENA POSSO CAMEN DELIA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (128, 'P', 1, '1803931946001', 50, 19, 177, 'CARVAJAL MONCAYO ANGEL FERNANDO', 'CARVAJAL MONCAYO ANGEL FERNANDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (129, 'P', 1, '0300439627001', 50, 19, 177, 'CASTANIER GONZALEZ DIEGO GASTON', 'CASTANIER GONZALEZ DIEGO GASTON', '', '099999999', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (130, 'P', 1, '1203464340001', 50, 19, 177, 'CASTILLO CASTILLO  CARLOS ROBERTO', 'ESTACION DE SERVICIOS VENTANAS', '', '0997163972', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (131, 'P', 1, '0993093866001', 50, 19, 177, 'CASTILLO GONZALES PETER ANDRES', 'CASTILLO GONZALES PETER ANDRES', '', '042436487', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (132, 'P', 1, '1102285556001', 50, 19, 177, 'CASTILLO JIMENEZ JOSE FAUSTO', 'GASOLINERA EL CASTILLO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (133, 'P', 1, '1206421339001', 50, 19, 177, 'CASTILLO LOPEZ MELANIE GEORDANA', 'CASTILLO LOPEZ MELANIE GEORDANA', '', 'N', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (134, 'P', 1, '1708596364001', 50, 19, 177, 'CASTILLO PEREZ JOHN WILLIAM', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (135, 'P', 1, '0702519018001', 50, 19, 177, 'CASTILLO ROMERO DORIS DEL CARMEN', 'CASTILLO ROMERO DORIS DEL CARMEN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (136, 'P', 1, '1900105188001', 50, 19, 177, 'CASTRO AMAYA WILMAN ENRIQUE', 'CASTRO AMAYA WILMAN ENRIQUE ESTACION DE SERVICIOS CASTRO', '', '0994138822', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (137, 'P', 1, '1308393634001', 50, 19, 177, 'CATUTO PINOARGOTE EDDY FERNANDO', 'CATUTO PINOARGOTE EDDY FERNANDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (138, 'P', 1, '0703362277001', 50, 19, 177, 'CHAMBA HIDALGO ELSA YOLANDA', 'CHAMBA HIDALGO ELSA YOLANDA', '', '072975940', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (139, 'P', 1, '1751125871001', 50, 19, 177, 'CHAVEZ CALVACHE LUIS CARLOS', 'AIR FRENOS CHAVEZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (140, 'P', 1, '0703221127001', 50, 19, 177, 'CHAVEZ SOLIS CARLOS ALBERTO', 'CARLOS ALBERTO CHAVEZ SOLIS', '', '0992762034', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (141, 'P', 1, '1801798990001', 50, 19, 177, 'CHAVEZ ZUÑIGA SALOMON IVAN', 'CHAVEZ ZUÑIGA SALOMON IVAN', '', '032855600', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (142, 'P', 1, '1722736996001', 50, 19, 177, 'CHICAIZA PILLAJO LUIS ERNESTO', 'CHICAIZA PILLAJO LUIS ERNESTO', '', '0984569186', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (143, 'P', 1, '1703126894001', 50, 19, 177, 'COBA CHAMORRO GRETA MARIA DEL PILAR', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (144, 'P', 1, '1708765183001', 50, 19, 177, 'COBO BERNAL JOSELITO AGUSTIN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (145, 'P', 1, '1791290933001', 50, 19, 177, 'COMBUSTIBLES DEL ECUADOR S.A. COMDECSA', 'ESTACION DE SERVICIO PETROLMAX30/04/20047', '', '02-2986873', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (146, 'P', 1, '1790041220001', 50, 19, 177, 'COMERCIAL KYWI S.A.', 'COMERCIAL KYWI S.A.', '', '2907014', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (147, 'P', 1, '1191741907001', 50, 19, 177, 'COMERCIALIZADORA AVICOLA DEL SUR COMAVISUR CIA. LTDA.', 'COMERCIALIZADORA AVICOLA DEL SUR COMAVISUR CIA. LTDA.', '', '072517567', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (148, 'P', 1, '0993105937001', 50, 19, 177, 'COMERCOPRE S.A.', 'FLORI CACAO LIDIA KATERINE', '', '045100398', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (149, 'P', 1, '1791280792001', 50, 19, 177, 'COMPAÑIA DE COMERCIO INDUSTRIAS Y SERVICIOS PETROLEROS PETROWORLD S.A.', 'ESTACION DE SERVICIO EL CARMEN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (150, 'P', 1, '1792297699001', 50, 19, 177, 'COMPAÑIA DE TRANSPORTE PANTOJA GUZMAN ELOHIM S.A.', 'ELOHIM S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (151, 'P', 1, '0991503102001', 50, 19, 177, 'CONCESIONARIA DEL GUAYAS CONCEGUA S.A.', 'CONCESIONARIA DEL GUAYAS CONCEGUA S.A.', '', '0422390778', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (152, 'P', 1, '0991503331001', 50, 19, 177, 'CONCESIONARIA NORTE CONORTE S.A.', 'CONCESIONARIA NORTE CONORTE S.A.', '', '042158282', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (153, 'P', 1, '1793040012001', 50, 19, 177, 'CONCESIONARIA SANTO DOMINGO CRSD SA', '', '', '999999999', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (154, 'P', 1, '1792690781001', 50, 19, 177, 'CONSUR R7H S.A.', 'CONSUR R7H S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (155, 'P', 1, '0991419799001', 50, 19, 177, 'CONVET S.A.', 'E/S VIRGEN DEL CISNE 1', '', '042751384', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (156, 'P', 1, '0790082001001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE DE PASAJEROS PIÑAS INTERPROVINCIAL', 'COOPERATIVA DE TRANSPORTE DE PASAJEROS PIÑAS INTERPROVINCIAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (157, 'P', 1, '1790106063001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE ECUADOR', 'COOPERATIVA DE TRANSPORTE ECUADOR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (158, 'P', 1, '0991435972001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE URBANO DE PASAJEROS EN BUSES CIUDAD DE MILAGRO', 'COOPERATIVA DE TRANSPORTE URBANO CIUDAD DE MILAGRO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (159, 'P', 1, '1190006820001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTES  LOJA', 'COOPERATIVA DE TRANSPORTES LOJA INTERNACIONAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (160, 'P', 1, '1790167720001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTES OCCIDENTALES', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (161, 'P', 1, '0990004196001', 50, 19, 177, 'CORPORACION EL ROSADO MONTOYA CARVAJAL NELSON ANTONIO', 'CORPORACION EL ROSADO MONTOYA CARVAJAL NELSON ANTONIO', '', '043702400215', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (162, 'P', 1, '1790016919001', 50, 19, 177, 'CORPORACION FAVORITA C.A.            .', 'CORPORACION FAVORITA C.A.           .', '', '99999999999999', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (163, 'P', 1, '1768152560001', 50, 19, 177, 'CORPORACION NACIONAL DE TELECOMUNICACIONES CNT EP', 'CORPORACION NACIONAL DE TELECOMUNICACIONES CNT EP', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (164, 'P', 1, '0101041309001', 50, 19, 177, 'CORREA ANDRADE VICTOR HUGO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (165, 'P', 1, '2490031882001', 50, 19, 177, 'CORREDOR VIAL DE LA COSTA CVIALCO S.A.', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (166, 'P', 1, '1707552624001', 50, 19, 177, 'CRESPO JARAMILLO DUNIA SORAYA', 'CREDI CRESPO', '', '0', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (167, 'P', 1, '0914802723001', 50, 19, 177, 'CUMBA GAVIDIA MARIA LOURDES', 'CUMBA GAVIDIA MARIA LOURDES', '', '071913883', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (168, 'P', 1, '0791781671001', 50, 19, 177, 'DCOM CIA. LTDA', 'DCOM CIA. LTDA', '', '0999491930', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (169, 'P', 1, '0902050707001', 50, 19, 177, 'DIAZ GRANADOS CABEZAS JOSE LUIS', 'JOSE LUIS DIAZ GRANADOS CABEZAS', '', '0999607250', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (170, 'P', 1, '0591723448001', 50, 19, 177, 'DISTRIBUIDORA DE COMBUSTIBLE DISGASCOTOPAXI CIA.LTDA.', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (171, 'P', 1, '1890152658001', 50, 19, 177, 'DISTRIBUIDORA DE COMBUSTIBLES VIGUESAM CIA. LTDA.', 'DISTRIBUIDORA DE COMBUSTIBLES VIGUESAM CIA. LTDA.', '', '032434441', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (172, 'P', 1, '0791829631001', 50, 19, 177, 'DISTRIBUIDORA ESPINOZA LARGO DISTESLA CL', '', '', '0998429371', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (173, 'P', 1, '1091707752001', 50, 19, 177, 'DISTRIBUIDORA MERCANTIL ESPINOZA DISME CIA. LTDA.', 'DISME CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (174, 'P', 1, '0791761042001', 50, 19, 177, 'DISTRIBUIDORA MINERDIESEL S A', 'DISTRIBUIDORA MINERDIESEL S A', '', '075003-970', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (175, 'P', 1, '0190348016001', 50, 19, 177, 'DISTRIBUIDORA VASQUEZ ORDOÑEZ DISTRIVASOR CIA. LTDA.', 'DISTRIBUIDORA VASQUEZ ORDONEZ  DISTRIVASOR CIA LTDA', '', '2271100', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (176, 'P', 1, '0401385679001', 50, 19, 177, 'MARTINEZ BRACHO JULIA TAMARA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (177, 'P', 1, '0102810264001', 50, 19, 177, 'DR  ADRIAN EDUARDO TENORIO ALTAMIRANO', 'DR. ADRIAN EDUARDO TENORIO ALTAMIRANO', '', '2967165', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (178, 'P', 1, '0400985149001', 50, 19, 177, 'DRA ANA JULIA SOLIS NOTARIA 11', 'DRA ANA JULIA SOLIS NOTARIA 11', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (179, 'P', 1, '0992167785001', 50, 19, 177, 'DUNLEA S.A.', 'GASOLINERA PUERTO INCA', '', '043130045', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (180, 'P', 1, '1792476615001', 50, 19, 177, 'E/S GRUPO LLANO GRANDE', 'EP PETROECUADOR LLANO GRANDE', '', '022422646', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (181, 'P', 1, '1791715772001', 50, 19, 177, 'ECONOFARM S.A.', 'SANASANA PIÑAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (182, 'P', 1, '1791291468001', 50, 19, 177, 'ECUASISTENCIA COMPANIA DE ASISTENCIA DEL ECUADOR', 'ECUASISTENCIA S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (183, 'P', 1, '1757550908001', 50, 19, 177, 'EDITH CARVAJAL GARCIA', 'AUTO REPUESTOS CARVAJAL', '', '11', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (184, 'P', 1, '0703372243001', 50, 19, 177, 'ELIZALDE MENDOZA AGUSTIN JOSE', 'VULCANIZADORA DIVINO NIÑO', '', '0990253526', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (185, 'P', 1, '1792813328001', 50, 19, 177, 'ELPALAFRI CIA.LTDA.', 'ELPALAFRI CIA.LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (186, 'P', 1, '1790053881001', 50, 19, 177, 'EMPRESA ELÉCTRICA QUITO S.A.E.E.Q.', 'EMPRESA ELÉCTRICA QUITO S.A.E.E.Q.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (187, 'P', 1, '1768154260001', 50, 19, 177, 'EMPRESA METROPOLITANA DE AGUA POTABLE Y SANEAMIENTO', 'EPMAPS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (188, 'P', 1, '1768153530001', 50, 19, 177, 'EMPRESA PUBLICA DE  HIDROCARBUROS DEL ECUADOREL EP PETROECUADOR', 'EMPRESA PUBLICA DE  HIDROCARBUROS DEL ECUADOREL EP PETROECUADOR', '', '073803000', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (189, 'P', 1, '0702269812001', 50, 19, 177, 'ENCALADA SALINAS JACINTA VICTORIA', 'ENCALADA SALINAS VICTORIA JACINTA', '', '072961468', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (190, 'P', 1, '1791997891001', 50, 19, 177, 'ENMARSI CIA. LTDA.', 'ENMARSI CIA. LTDA.', '', '023932999', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (191, 'P', 1, '1792842379001', 50, 19, 177, 'ESLASUIZA CIA. LTDA.', 'LA SUIZA CIA. LTDA', '', 'SN', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (192, 'P', 1, '0701570624001', 50, 19, 177, 'ESPINOSA AGUILAR GUILBRON MANUEL', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (193, 'P', 1, '1791818008001', 50, 19, 177, 'ESTACION DE SERVICIO ALOAG CIA. LTDA.', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (194, 'P', 1, '0190331342001', 50, 19, 177, 'ESTACION DE SERVICIO CATAVIÑA CIA. LTDA.', 'ESTACION DE SERVICIO CATAVIÑA CIA LTDA', '', '072262216', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (195, 'P', 1, '1191720993001', 50, 19, 177, 'ESTACION DE SERVICIO GASOSILVA CATAMAYO', 'ESTACION DE SERVICIO GASOSILVA CATAMAYO', '', '0997528383', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (196, 'P', 1, '0790067223001', 50, 19, 177, 'ESTACION DE SERVICIO MAROD CIA. LTDA.', 'ESTACION DE SERVICIO MAROD CIA. LTDA.', '', '0993775599', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (197, 'P', 1, '0190168107001', 50, 19, 177, 'ESTACION DE SERVICIO NARANCAY C. LTDA.', 'ESTACION DE SERVICIO NARANCAY C. LTDA.', '', '072386038', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (198, 'P', 1, '0992739401001', 50, 19, 177, 'ESTACION DE SERVICIOS ALPASO S.A.', 'ESTACION DE SERVICIOS ALPASO', '', '3712360', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (199, 'P', 1, '1101980082001', 50, 19, 177, 'ESTACION DE SERVICIOS CHURUTE', 'ESTACION DE SERVICIOS CHURUTE', '', '2838 - 645', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (200, 'P', 1, '0992205547001', 50, 19, 177, 'ESTACION DE SERVICIOS EL PIBE S A EL PIBE', 'ESTACION DE SERVICIOS EL PIBE S A EL PIBE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (201, 'P', 1, '0902219484001', 50, 19, 177, 'ESTACION DE SERVICIOS SAN JOSE', 'ESTACION DE SERVICIOS SAN JOSE', '', '046039622', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (202, 'P', 1, '0190326071001', 50, 19, 177, 'ESTACION DE SERVICIOS VISTA LINDA', 'ESTACION DE SERVICIO VISTA LINDA', '', '072813003', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (203, 'P', 1, '1103584981001', 50, 19, 177, 'ESTRELLA MOGROVEJO PAUL EDUARDO', '', '', '0985080968', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (204, 'P', 1, '0993243655001', 50, 19, 177, 'EXPROVET CIA.LTDA.', 'EXPROVET CIA.LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (205, 'P', 1, '1191751422001', 50, 19, 177, 'FARMACIAS CUXIBAMBA FARMACUX CIA LTDA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (206, 'P', 1, '1790710319001', 50, 19, 177, 'FARMACIAS Y COMISARIATOS DE MEDICINAS S.A. FARCOMED', 'FARMACIAS Y COMISARIATOS DE MEDICINAS S.A. FARCOMED      FYBECA PIAZZA MACHALA', '', '1700392322', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (207, 'P', 1, '1791984722001', 50, 19, 177, 'FARMAENLAFARMAENLACE CIA. LTDA', 'FARMAENLACE CIA LTDA.  ROOSEVELTH SMITH SALCEDO ERAZO', '', '0222993100', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (208, 'P', 1, '0791740150001', 50, 19, 177, 'FARMAM IA CIA. LTDA.', 'FARMAMIA CIA. LTDA.', '', '2 983477-299604', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (209, 'P', 1, '0991063269001', 50, 19, 177, 'FARMAVET FARMACOS VETERINARIOS SA', 'FARMAVET FARMACOS VETERINARIOS SA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (210, 'P', 1, '0992241438001', 50, 19, 177, 'FARMAYAH CIA LTDA', 'FARMAYAH CIA LTDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (211, 'P', 1, '1101995130001', 50, 19, 177, 'FEIJOO FAJARDO CARLOS MIGUEL', 'FEIJOO FAJARDO CARLOS MIGUEL', '', '297 6032', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (212, 'P', 1, '0704726165001', 50, 19, 177, 'FEIJOO LEON BYRON VINICIO', 'FEIJOO LEON BYRON VINICIO', '', '072517764', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (213, 'P', 1, '0702634668001', 50, 19, 177, 'FEIJOO OLLAGUE WELLINGTON ALEX', 'FEIJOO PORRAS WELLINTONG ALEX', '', '0993236694-0991', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (214, 'P', 1, '1791275101001', 50, 19, 177, 'FIDEVAL ADMINISTRADORA DE FONDOS Y FIDEICOMISOS SA', 'FIDEVAL SA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (215, 'P', 1, '0702872789001', 50, 19, 177, 'GANAZHAPA JIMENEZ DENNIS BYRON', 'GANAZHAPA JIMENEZ DENNIS BYRON', '', '0968306435', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (216, 'P', 1, '1207516541001', 50, 19, 177, 'GARCIA PEÑA JEFFERSON GUILLERMO', 'GARCIA PEÑA JEFFERSON GUILLERMO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (217, 'P', 1, '1304104621001', 50, 19, 177, 'GARCIA VERA ANGEL RAFAEL', 'FUMIGACIONES DEL PACIFICO', '', '292003', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (218, 'P', 1, '0928784966001', 50, 19, 177, 'GARCIA YEPEZ LINDA IVETTE', 'BAZAR Y FERRETERIA MECHITA', '', '043131003', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (219, 'P', 1, '1705987244001', 50, 19, 177, 'GARZON MOLINA JOSE MARIA', 'ESTACION DE SERVICIO CUMANDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (220, 'P', 1, '1790783278001', 50, 19, 177, 'GASOLINERA SINDICATO DE CHOFERES CAYAMBE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (221, 'P', 1, '0190330389001', 50, 19, 177, 'GASOPOSTO  CIA LTDA', 'ESTACION DE SERVICIO EL VALLE', '', '074098433', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (222, 'P', 1, '1700584384001', 50, 19, 177, 'GAYBOR SECAIRA RAUL ARMANDO FACTURAELECTRONICAECUADOR.COM', 'ESTACION DE SERVICIO RANCHO ILA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (223, 'P', 1, '0702277153001', 50, 19, 177, 'GOBER UFREDO TORRES ROMAN', 'GOBER UFREDO TORRES ROMAN', '', '0984 976 162', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (224, 'P', 1, '1760003330001', 50, 19, 177, 'GOBIERNO AUTONOMO DESCENTRALIZADO DE LA PROVINCIA DE PICHINCHA', 'GOBIERNO AUTONOMO DESCENTRALIZADO DE LA PROVINCIA DE PICHINCHA', '', '0', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (225, 'P', 1, '0760001310001', 50, 19, 177, 'GOBIERNO AUTONOMO DESCENTRALIZADO MUNICIPAL DE BALSAS', 'GAD MUNICIPAL DE BALSAS', '', '0702517092', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (226, 'P', 1, '1768139620001', 50, 19, 177, 'GOBIERNO AUTONOMO DESCENTRALIZADO PROVINCIAL DE SANTO DOMINGO DE LOS TSACHILAS', 'GOBIERNO AUTONOMO DESCENTRALIZADO PROVINCIAL DE SANTO DOMINGO DE LOS TSACHILAS', '', '.0993469458', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (227, 'P', 1, '0704033638001', 50, 19, 177, 'GONZAGA TOLEDO NELSON MANUEL', 'GONZAGA TOLEDO NELSON MANUEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (228, 'P', 1, '0992311762001', 50, 19, 177, 'GONZAL S.A.', 'ESTACION DE SERVICIO J.D. JHONSON GONZAL S.A.', '', '0994745022', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (229, 'P', 1, '0791751543001', 50, 19, 177, 'GRAN HOGAR S A GRAHOGSA', 'GRAN HOGAR S.A.', '', '0989911139', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (230, 'P', 1, '0703273177001', 50, 19, 177, 'GRANDA CORDOVA OCALIO WUALTER', 'FERRE CONST MARIA DEL CISNE', '', '072941281', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (231, 'P', 1, '0992734973001', 50, 19, 177, 'GUERRERO INCUBADORA S.A.', 'GUERINSA', '', '072420919', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (232, 'P', 1, '0704856673001', 50, 19, 177, 'HERRERA ESPINOZA YADIRA LESMERI', 'HERRERA ESPINOZA YADIRA LESMERI', '', '0997394905', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (233, 'P', 1, '0501355531001', 50, 19, 177, 'HERRERA MOLINA REINALDO MANUEL', 'HERRERA MOLINA REINALDO MANUEL', '', '2675561', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (234, 'P', 1, '0500949888001', 50, 19, 177, 'HERRERA MOLINA SEGUNDO ERNESTO', 'AUTOREPUESTOS HERRERA', '', '2672752', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (235, 'P', 1, '1713366399001', 50, 19, 177, 'HIDALGO CHAMBA ROBERT ANTONIO', 'MANI PAMELITA', '', '072517686', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (236, 'P', 1, '1792758270001', 50, 19, 177, 'HOSPITAL VOZ ANDES', 'HOSPITAL VOZ ANDES', '', '3971000', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (237, 'P', 1, '0791758831001', 50, 19, 177, 'INCUBADORA DEL SUR CIA LTDA', 'INCUBASUR CIA LTDA', '', '0993191964', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (238, 'P', 1, '1391834713001', 50, 19, 177, 'INCUBADORA EL DORADO', 'INCUGEND S.A', '', '0995167529', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (239, 'P', 1, '1792129745001', 50, 19, 177, 'INDUSTRIA PROCESADORA DE ALIMENTOS NACIONALES MONTENEGRO MENA S.A.', 'IPANMM S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (240, 'P', 1, '0190335275001', 50, 19, 177, 'INDUSTRIAS DE MINERALES LA COLINA INDUCOLINA CIA. LTDA.', 'INDUCOLINA CIA  LTDA', '', '072889069', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (241, 'P', 1, '0702417940001', 50, 19, 177, 'INFANTE SARANGO EMMA MARINA', '', '', '072913964', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (242, 'P', 1, '0791745713001', 50, 19, 177, 'INSUMOS AGRICOLAS Y PECUARIOS INSPA CIA. LTDA.', 'INSUMOS AGRICOLAS Y PECUARIOS INSPA CIA LTDA', '', '2921714-2968730', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (243, 'P', 1, '1716673155001', 50, 19, 177, 'INTRIAGO VELEZ FERNANDO VINICIO', 'AGRO VETERINARIA SAN FERNANDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (244, 'P', 1, '1709337255001', 50, 19, 177, 'IZA SALAZAR NELLY PATRICIA', 'EL MUNDO DEL CAUCHO', '', '2684897', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (245, 'P', 1, '0105382188001', 50, 19, 177, 'JACHERO ROLDAN PAOLA MARISELA', 'JACHERO ROLDAN PAOLA MARISELA', '', '4177426', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (246, 'P', 1, '0925256570001', 50, 19, 177, 'JAIRON RONALD PLAZA LEON', '', '', '0967255572', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (247, 'P', 1, '1203539661001', 50, 19, 177, 'JIMENEZ CARRERA EDWIN GERMAN', 'JIMENEZ CARRERA EDWIN GERMAN', '', '0967934975', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (248, 'P', 1, '0701504953001', 50, 19, 177, 'JIMENEZ CASTILLO VICTOR ANTONIO', 'JIMENEZ CASTILLO VICTOR ANTONIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (249, 'P', 1, '0601019532001', 50, 19, 177, 'JOSE LUCAS PAUCAR CASTILLO', 'NOMBRE COMERCIAL COMPANIA O MENSAJE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (250, 'P', 1, '0705240448001', 50, 19, 177, 'JUMBO SANCHEZ JAHNETH PRISCILA', 'JUMBO SANCHEZ JAHNETH PRISCILA', '', '0714253625', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (251, 'P', 1, '1792190851001', 50, 19, 177, 'KINDRED ASOCIADOS OVERSEA S.A.', 'KINDRED ASOCIADOS OVERSEA S.A.', '', '2252-505', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (252, 'P', 1, '1791847148001', 50, 19, 177, 'LABORATORIO CLINICO ECUA AMERICAN LAB.E.A. CIA. LTDA.', 'LABORATORIO CLINICO ECUA AMERICAN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (253, 'P', 1, '0100103654001', 50, 19, 177, 'LARRIVA ALVARADO VICENTE KLEBER', 'LARRIVA ALVARADO VICENTE KLEVER', '', '2853374', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (254, 'P', 1, '0791749069001', 50, 19, 177, 'LAVAPALM S.A', 'LAVAPALM S.A', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (255, 'P', 1, '0703708990001', 50, 19, 177, 'LEON FEIJOO NELVIO FERNANDO', 'LEON FEIJOO NELVIO FERNANDO', '', '072-515052', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (256, 'P', 1, '1790027864001', 50, 19, 177, 'LEVAPAN DEL ECUADOR S.A.', 'LEVAPAN DEL ECUADOR S.A.', '', '022677010', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (257, 'P', 1, '0700415599001', 50, 19, 177, 'LOAYZA CARRION ZOILA MARINA', 'AUTOMOTRIZ EL ORO', '', '072634810', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (258, 'P', 1, '0704034032001', 50, 19, 177, 'LOAYZA HIDALGO HERMAN PATRICIO', 'SERMAMAQ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (259, 'P', 1, '0700766926001', 50, 19, 177, 'LOAYZA ROMERO LUCIO BOLIVAR', 'AVICOLA LAS ORQUIDEAS', '', '2976881-2977072', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (260, 'P', 1, '1001732344001', 50, 19, 177, 'LOPEZ MORAN FRAYBER TARQUINO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (261, 'P', 1, '0401177878001', 50, 19, 177, 'LOPEZ ROMO JUAN CARLOS', 'LOPEZ ROMO JUAN CARLOS', '', '0984977850', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (262, 'P', 1, '1103053292001', 50, 19, 177, 'LUDEÑA GAONA OSCAR EFREN', 'LUDEÑA GAONA OSCAR EFREN', '', '(07) 2797 018', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (263, 'P', 1, '1105035347001', 50, 19, 177, 'LUDEÑA IÑIGUEZ NOHELIA ALEJANDRA', 'LUDEÑA IÑIGUEZ NOHELIA ALEJANDRA', '', '2967242', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (264, 'P', 1, '0791708192001', 50, 19, 177, 'M Y E MORENO Y ESPINOZA CIA. LTDA.', 'M Y E MORENO Y ESPINOZA CIA. LTDA.', '', '072-928255', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (265, 'P', 1, '0700989841001', 50, 19, 177, 'MALDONADO GALARZA MELVA MARIA', 'MALDONADO GALARZA MELVA MARIA', '', '0993594256', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (266, 'P', 1, '0705110427001', 50, 19, 177, 'MALDONADO QUEZADA OSWALDO XAVIER', 'AUTOMOTRIZ XAVIER', '', '0981950389', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (267, 'P', 1, '0919768903001', 50, 19, 177, 'MALDONADO TORRES JOSE RODRIGO', '', '', '0997395097', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (268, 'P', 1, '0703057661001', 50, 19, 177, 'MALLA TORRES DALI JOSE', 'MALLA TORRES DALI JOSE', '', '072517355', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (269, 'P', 1, '0705898443001', 50, 19, 177, 'MATUTE GALVEZ ANDRES ROBERTO', 'MATUTE GALVEZ ANDRES ROBERTO', '', '0987830042', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (270, 'P', 1, '1792060346001', 50, 19, 177, 'MEGA SANTAMARIA S.A.', 'SUPERMERCADO SANTA MARIA', '', '022-260045', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (271, 'P', 1, '0691733009001', 50, 19, 177, 'MERINO MONTOYA E HIJOS CIA LTDA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (272, 'P', 1, '0102831575001', 50, 19, 177, 'MOGROVEJO MAXI CARLOS PATRICIO', 'TALLER ELECTROMECANICO INSTELE', '', '2888880', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (273, 'P', 1, '1791869559001', 50, 19, 177, 'MOLDECUA S.A', 'MOLDECUA S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (274, 'P', 1, '0990026408001', 50, 19, 177, 'MOLINOS CHAMPION S.A. MOCHASA', 'MOLINOS CHAMPION S.A.', '', '046002840', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (275, 'P', 1, '1714119110001', 50, 19, 177, 'MONCAYO SANCHEZ BERONICA', 'VIDA NATURAL', '', '0991461798', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (276, 'P', 1, '1203033582001', 50, 19, 177, 'MONTENEGRO PALIZ VICTOR EMILIO', 'MONTENEGRO PALIZ VICTOR EMILIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (277, 'P', 1, '0201413770001', 50, 19, 177, 'MORA VACA WASHINGTON FERNANDO', 'ESTACION DE SERVICIO DE COMBUSTIBLES \"LOS ARRAYANES\"', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (278, 'P', 1, '0703524983001', 50, 19, 177, 'MORAN AGUILAR TELMO DAVID', 'MORAN AGUILAR TELMO DAVID', '', '0993734083', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (279, 'P', 1, '0702527607001', 50, 19, 177, 'MORAN PIEDRA MERCEDES PILAR', 'NEGOCIO MORRIS', '', '0989493732', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (280, 'P', 1, '1791405501001', 50, 19, 177, 'MOTORCLASS IMPORTADORES S.A.', 'MOTORCLASS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (281, 'P', 1, '0201598398001', 50, 19, 177, 'NARANJO NARANJO JENNY CARMITA', '', '', '0958873315', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (282, 'P', 1, '0350198925001', 50, 19, 177, 'NARDO NIVELO CORONEL JOSUE', 'NARDO NIVELO CORONEL JOSUE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (283, 'P', 1, '0705115293001', 50, 19, 177, 'NARRAVO RAMIREZ ROYER MILLER', 'NARRAVO RAMIREZ ROYER', '', '0969580744', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (284, 'P', 1, '1711518496001', 50, 19, 177, 'NARVAEZ MEJIA MYRIAM MARLENE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (285, 'P', 1, '1705797676001', 50, 19, 177, 'NAVIA MURGUEITIO CLARA MARIA', 'MARKET', '', '0997234690', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (286, 'P', 1, '1710907237001', 50, 19, 177, 'NOGALES GUILLEN LISANDRO ESTEBAN', 'ESTACION DE SERVICIOS LA ESPAÑOLA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (287, 'P', 1, '1705333647001', 50, 19, 177, 'NOROÑA CALVACHI CARLOS ENRIQUE', 'TALLERES NOROÑA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (288, 'P', 1, '0991306498001', 50, 19, 177, 'NUEVAS OPERACIONES COMERCIALES  NUCOPSA S.A.', 'NUEVAS OPERACIONES COMERCIALES NUCOPSA S.A.', '', '042 634220', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (289, 'P', 1, '1890148537001', 50, 19, 177, 'NUTRICION, SALES Y MINERALES NUTRISALMIN S.A.', 'NUTRISALMINSA S.A.', '', '032434095', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (290, 'P', 1, '0990270988001', 50, 19, 177, 'NUTRIL SA', 'NUTRIL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (291, 'P', 1, '0700497480001', 50, 19, 177, 'OCAMPO ALVAREZ DULIA MARIELA', 'OCAMPO ALVAREZ DULIA MARIELA', '', '072-932-253', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (292, 'P', 1, '0702531385001', 50, 19, 177, 'ORDOÑEZ CRESPO ANGEL EDISON', 'ORDOÑEZ CRESPO ANGEL EDISON', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (293, 'P', 1, '0603625906001', 50, 19, 177, 'ORELLANA ROSERO FERNANDO PATRICIO', 'MODERMUEBLE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (294, 'P', 1, '0106031156001', 50, 19, 177, 'ORTEGA SANMARTIN FLOR MARIA', 'ORTEGA SANMARTIN FLOR MARIA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (295, 'P', 1, '0702206871001', 50, 19, 177, 'ORTIZ GONZALEZ ROSA MARBELLA', 'ORTIZ GONZALEZ ROSA MARBELLA', '', '0999279699', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (296, 'P', 1, '0991401512001', 50, 19, 177, 'OSAKACORP S.A.', 'GASOLINERA LA AURORA', '', '042894196', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (297, 'P', 1, '0705062933001', 50, 19, 177, 'OVIEDO GONZALEZ STALIN RIGOBERTO', '', '', '0968133531', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (298, 'P', 1, '0500446083001', 50, 19, 177, 'PALACIOS PUCO ABEL FAUSTO', 'FERRETERIA PALACIOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (299, 'P', 1, '1791317025001', 50, 19, 177, 'PANAMERICANA VIAL S.A. PANAVIAL', 'PANAMERICANA VIAL S.A. PANAVIAL', '', '023982500', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (300, 'P', 1, '0400357695001', 50, 19, 177, 'PANTOJA MUÑOZ NELSON GUSTAVO', '', '', '0983362053', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (301, 'P', 1, '0908141831001', 50, 19, 177, 'PARRAGA JESUS ANTONIO', 'PARRAGA JESUS ANTONIO, ESTACION DE SERVICIOS LA UNIVERSAL # 4', '', '2709319', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (302, 'P', 1, '0701838203001', 50, 19, 177, 'PEÑARRETA APOLO GOBERTH RAMIRO', 'GOBERTH RAMIRO PEÑARRETA APOLO', '', '072517152', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (303, 'P', 1, '0702281957001', 50, 19, 177, 'PEÑARRETA GALLARDO RUPTY MARIA', '', '', '0968769856', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (304, 'P', 1, '0705035988001', 50, 19, 177, 'PEREIRA GONZAGA LUIS ANGEL', 'COMPAÑIA DE TRANSPORTE PESADO BACIVER S. A.', '', '0991873890', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (305, 'P', 1, '0702874744001', 50, 19, 177, 'PEREIRA UCHUARI EDGAR MANUEL', 'PEREIRA UCHUARI EDGAR MANUEL', '', '099 932 7257', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (306, 'P', 1, '0101518660001', 50, 19, 177, 'PESANTEZ CORDERO PEDRITO RAFAEL', 'ESTACION DE SERVICIO SAMBORONDON', '', 'SN', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (307, 'P', 1, '0991372784001', 50, 19, 177, 'PHARMACY & NUTRITION PHARNUTRI S.A.', 'PHARMACY & NUTRITION PHARNUTRI S.A.', '', '0980731536', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (308, 'P', 1, '1790753913001', 50, 19, 177, 'PICHINCHA SISTEMAS ACOVI C.A.', 'PICHINCHA SISTEMAS ACOVI C.A.', '', '042980980', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (309, 'P', 1, '0703267294001', 50, 19, 177, 'PINTO RAMIREZ CLEBER FRANCO', 'PINTO RAMIREZ CLEBER FRANCO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (310, 'P', 1, '0992301759001', 50, 19, 177, 'PISONI S.A.', 'PISONI', '', '0991920173', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (311, 'P', 1, '1705921078001', 50, 19, 177, 'POZO GUERRERO ANGEL RODRIGO', 'DIAF/REPRESENTACIONES', '', '3076374', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (312, 'P', 1, '1791282523001', 50, 19, 177, 'PROCESOS INDUSTRIALES DEL ECUADOR PROINDE CIA. LTDA.', 'PROINDE POINT COMPUTER', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (313, 'P', 1, '0703789149001', 50, 19, 177, 'RAMIREZ ASANZA CARLOS JULIO', 'RAMIREZ ASANZA CARLOS JULIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (314, 'P', 1, '0703779637001', 50, 19, 177, 'RAMIREZ PALMA FRANKLIN VICENTE', 'RAMIREZ PALMA FRANKLIN VICENTE', '', '0993009993', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (315, 'P', 1, '1768160580001', 50, 19, 177, 'REGISTRO MERCANTIL DEL CANTÓN QUITO', 'REGISTRO MERCANTIL DEL CANTÓN QUITO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (316, 'P', 1, '1791294505001', 50, 19, 177, 'REPROIMAV S.A', 'REPROIMAV S.A', '', '0997405669', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (317, 'P', 1, '1713008884001', 50, 19, 177, 'ROBLES ERAZO BOLIVAR ARMANDO', 'MICROMERCADO ROBLES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (318, 'P', 1, '1307590016001', 50, 19, 177, 'RODRIGUEZ VERA LUIS ALFONSO', 'RODRIGUEZ VERA LUIS ALFONSO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (319, 'P', 1, '0704236348001', 50, 19, 177, 'ROJAS ATIENCIE JULIANA LILIBETH', 'ROJAS ATIENCIE JULIANA LILIBETH', '', '0725717824', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (320, 'P', 1, '0190097781001', 50, 19, 177, 'ROLANDO RIOS COMPAÑIA LIMITADA', 'ROLANDO RIOS COMPAÑIA LIMITADA', '', '020320180', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (321, 'P', 1, '0701005514001', 50, 19, 177, 'ROMERO APOLO LUIS HILDER', 'AVICOLA LUISIN', '', '072-517103', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (322, 'P', 1, '0703174417001', 50, 19, 177, 'ROMERO CHAMBA SARA DEL CARMEN', 'TIENDA', '', '0989468485', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (323, 'P', 1, '0101275329001', 50, 19, 177, 'ROMERO CRESPO ROMULO RENE', 'MECANICA INDUSTRIAL ROMERO', '', '2920009', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (324, 'P', 1, '0705774990001', 50, 19, 177, 'ROMERO FEIJOO LUIS STEFANO', 'ROMERO FEIJOO LUIS STEFANO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (325, 'P', 1, '1711255206001', 50, 19, 177, 'ROMULO JOSELITO PALLO QUISILEMA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (326, 'P', 1, '0931921670001', 50, 19, 177, 'SACTA ANDRADE KLEBER ALEXIS', 'SACTA ANDRADE KLEBER ALEXIS', '', '042-744231', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (327, 'P', 1, '0704197755001', 50, 19, 177, 'SANCHEZ MURILLO IRENE KAROLINA', 'SANCHEZ MURILLO IRENE KAROLINA', '', '072 517 615', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (328, 'P', 1, '1704038155001', 50, 19, 177, 'SANCHEZ OCHOA ANDRES EDUARDO', 'ANDRES EDUARDO SANCHEZ OCHOA', '', '032904159', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (329, 'P', 1, '0200270478001', 50, 19, 177, 'SANCHEZ VASCONEZ SALOMON GENARO', 'AGRICOSA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (330, 'P', 1, '0791805902001', 50, 19, 177, 'SANDIEGO NEUMATICOS Y SERVICIOS CIA LTDA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (331, 'P', 1, '0702830589001', 50, 19, 177, 'SARAGURO RAMIREZ WILSON BOLIVAR', 'SARAGURO RAMIREZ WILSON BOLIVAR', '', '072924-930', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (332, 'P', 1, '1101662094001', 50, 19, 177, 'SARANGO JUMBO LUIS ROMAN', '', '', '0980932807', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (333, 'P', 1, '1002175121001', 50, 19, 177, 'SARMIENTO ORTIZ EDISON FABRICIO', 'CENTRO FERRETERO SAN JOSE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (334, 'P', 1, '1792261848001', 50, 19, 177, 'SECURITY DATA SEGURIDAD EN DATOS Y FIRMA DIGITAL S.A.', 'SECURITY DATA', '', '1800347627', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (335, 'P', 1, '1791289927001', 50, 19, 177, 'SEGUROS DEL PICHINCHA S.A. COMPAÑIA DE SEGUROS Y REASEGUROS', 'SEGUROS DEL PICHINCHA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (336, 'P', 1, '0991285679001', 50, 19, 177, 'SERVIENTREGA DEL ECUADOR S.A.', 'SERVIENTREGA DEL ECUADOR S.A.', '', '3732000 7309', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (337, 'P', 1, '0702054594001', 50, 19, 177, 'SILVA APOLO HERMEL MANRIQUE', 'COOPERATIVA DE TRANSPORTES RUTAS BALSEÑAS', '', '2517274', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (338, 'P', 1, '1792110491001', 50, 19, 177, 'SIMEUSFQ SISTEMAS MEDICOS DE LA UNIVERSIDAD SAN FRANCISCO DE QUITO S.A.', 'SISTEMAS MEDICOS DE LA USFQ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (339, 'P', 1, '0790051580001', 50, 19, 177, 'SIND CANTONAL DE CHOF PROFESIONAL DE PINAS', 'EDS SIND. CHOF.  DE PINAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (340, 'P', 1, '0790046439001', 50, 19, 177, 'SINDICATO CANTONAL DE CHOFERES PROFESIONALES DEL CANTON PASAJE', 'ESTACION DE SERVICIO DEL SINDICATO CANTONAL DE CHOFERES PROFESIONALES DE PASAJE', '', '0989655011', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (341, 'P', 1, '1490000700001', 50, 19, 177, 'SINDICATO DE CHOFERES PROFESIONALES DEL CANTON SUCUA', 'ESTACION DE SERVICIOS DEL SINDICATO CHOFERES DE SUCUA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (342, 'P', 1, '0791717671001', 50, 19, 177, 'SOCIEDAD INMOBILIARIA HERMANOS CHAVEZ VALAREZO Y COMPAÑIA', 'ESTACION DE SERVICIO LA VICTORIA', '', '073092108', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (343, 'P', 1, '0400646584001', 50, 19, 177, 'SUAREZ POZO ALBA LUCIA', 'LUBRICADORA SAN GABRIEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (344, 'P', 1, '2390031575001', 50, 19, 177, 'SUCESION INDIVISA GUEVARA SANCHEZ MARIA REGINA FACTURAELECTRONICAECUADOR.COM', 'SUCESION INDIVISA GUEVARA SANCHEZ MARIA REGINA FACTURAELECTRONICAECUADOR.COM', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (345, 'P', 1, '0705494128001', 50, 19, 177, 'SUIN LASCANO VILMA ELIZABETH', 'SUIN LASCANO VILMA ELIZABETH', '', '2918000', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (346, 'P', 1, '0991517723001', 50, 19, 177, 'SUPERCINES S.A.', 'SUPERCINES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (347, 'P', 1, '1791413237001', 50, 19, 177, 'SUPERDEPORTE S.A.', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (348, 'P', 1, '0190365239001', 50, 19, 177, 'T A R Q U I G A S    CIA LTDA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (349, 'P', 1, '1890087252001', 50, 19, 177, 'TADEC TECNICOS AGROPECUARIOS DEL ECUADOR CIA  LTDA', 'TADEC TECNICOS AGROPECUARIOS DEL ECUADOR CIA  LTDA', '', '0994870016', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (350, 'P', 1, '1203020092001', 50, 19, 177, 'TAMAYO JIMENEZ LAUTARO MANUEL', '', '', '0997767160', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (351, 'P', 1, '1891792014001', 50, 19, 177, 'TEJABCOMGAS CIA.LTDA.', 'ESTACION DE SERVICIO TEJABCOM', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (352, 'P', 1, '0990017514001', 50, 19, 177, 'TIENDAS INDUSTRIALES ASOCIADOS  (TIA )S.A.', 'TIENDAS INDUSTRIALES ASOCIADOS  (TIA )S.A.', '', '(4) 2322000', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (353, 'P', 1, '1714305263001', 50, 19, 177, 'TINAJERO CISNEROS MARIO ENRIQUE', 'ESTACIÓN DE SERVICIO EL RIFLE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (354, 'P', 1, '0701297079001', 50, 19, 177, 'TINOCO LUZURIAGA JUAN ENRIQUE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (355, 'P', 1, '0904813664001', 50, 19, 177, 'TORAL FEIJOO EDILMA ELIZA', 'ESTACION DE SERVICIO DELPACIFICO TORAL FEIJOO EDILMA', '', '2724322', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (356, 'P', 1, '0701062572001', 50, 19, 177, 'TORO CELI SERVIO AUGUSTO', 'VULCANIZADORA ORQUIDEA DE LOS ANDES', '', '2977347', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (357, 'P', 1, '0991388419001', 50, 19, 177, 'TRISACORP S.A.', 'ESTACION DE SERVICIO SAN AGUSTIN', '', '042748105', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (358, 'P', 1, '0903840817001', 50, 19, 177, 'TRIVIÑO GILBERTO ERNESTO', 'LA CASA DEL FILTRO', '', '0981610798', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (359, 'P', 1, '0704611136001', 50, 19, 177, 'TROYA CHUNGATA BRYAN FERNANDO', 'TROYA CHUNGATA BRYAN FERNANDO', '', '2936689 - 29349', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (360, 'P', 1, '0101903177001', 50, 19, 177, 'ULLAGUARI DOTA SEGUNDO GERMAN', 'ULLAGUARI DOTA SEGUNDO GERMAN', '', '1234567890', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (361, 'P', 1, '0702599150001', 50, 19, 177, 'ULLAURI NOBLECILLA ANA PRISCILA', 'ULLAURI NOBLECILLA ANA PRISCILA', '', '9999999999', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (362, 'P', 1, '1792730635001', 50, 19, 177, 'URDESMAR RESTAURANTES CIA. LTDA.', 'URDESMAR RESTAURANTES CIA. LTDA.', '', '022480445', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (363, 'P', 1, '0602118499001', 50, 19, 177, 'UVIDIA VILLA MANUEL CRISTOBAL', 'ESTACION DE SERVICIO EL TABLON', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (364, 'P', 1, '0601389992001', 50, 19, 177, 'VACA GAVILANEZ MANUEL ARZUBE', 'COMPANIA DE TRAILEROS CHIMBORAZO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (365, 'P', 1, '1102654967001', 50, 19, 177, 'VALAREZO GUERRERO OSCAR VINICIO', 'NUTRE 3A', '', '072546319', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (366, 'P', 1, '0400635561001', 50, 19, 177, 'VALENZUELA PUETATE LUIS ORLANDO', 'VALENZUELA PUETATE LUIS ORLANDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (367, 'P', 1, '1205803305001', 50, 19, 177, 'VALERO PULUA ANDY PATRICIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (368, 'P', 1, '1202620777001', 50, 19, 177, 'VALERO SANCHEZ MARIO PATRICIO', 'COMERCIAL AGRIVALPUL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (369, 'P', 1, '0990023859001', 50, 19, 177, 'VALLEJO ARAUJO S. A.', 'VALLEJO ARAUJO S. A.', '', '023 959059', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (370, 'P', 1, '0701012668001', 50, 19, 177, 'VEINTEMILLA LOZANO RICARDO ALFONSO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (371, 'P', 1, '1800112227001', 50, 19, 177, 'VELARDE NARANJO MARCO EDUARDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (372, 'P', 1, '0961690591001', 50, 19, 177, 'VELASQUEZ QUESADA MOISES ALBERTO', '', '', '0987550314', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (373, 'P', 1, '1706574421001', 50, 19, 177, 'VILLACRES ZAPATA LUIS FERNANDO', 'VILLACRES ZAPATA LUIS FERNANDO', '', '052971409', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (374, 'P', 1, '1190051435001', 50, 19, 177, 'ABENDAÑO BRICEÑO CIA. LTDA', 'ESTACION DE SERVICIOS SUR ORIENTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (375, 'P', 1, '1103453294001', 50, 19, 177, 'ABENDAÑO OCAMPO AURITA ROCIO', 'RESTAURANTE ESQUINA DEL SABOR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (376, 'P', 1, '0704965250001', 50, 19, 177, 'ACARO QUEZADA DORIS PATRICIA', 'PARRILLADAS DE JOHAN', '', '072164102', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (377, 'P', 1, '1900455336001', 50, 19, 177, 'AGREDA GAONA MARCO ENRIQUE', 'CASA GRILL ASADEROS RESTAURANTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (378, 'P', 1, '1792017610001', 50, 19, 177, 'AGROAL CIA. LTDA.', 'AGROAL', '', '2044780', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (379, 'P', 1, '1768105720001', 50, 19, 177, 'AGROCALIDAD', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (380, 'P', 1, '1792898420001', 50, 19, 177, 'AGROEDITORIAL SCC,', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (381, 'P', 1, '1900285360001', 50, 19, 177, 'AGUILAR ESPINOZA CARLOS AUGUSTO', 'AGUILAR ESPINOZA CARLOS AUGUSTO', '', '2607822', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (382, 'P', 1, '0704336536001', 50, 19, 177, 'AGUILAR SANCHEZ YULIZA PILAR', 'AGUILAR SANCHEZ YULIZA PILAR', '', '0989-601-143', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (383, 'P', 1, '0706336427001', 50, 19, 177, 'AGUILAR SUIN CELINDA GABRIELA', 'PREVENT FIRE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (384, 'P', 1, '0703757351001', 50, 19, 177, 'AGUIRRE VEINTIMILLA KARLO WILLMAR', 'SISTEMAS HIDRAULICOS VEINTEMILLA', '', '072961548', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (385, 'P', 1, '0702920448001', 50, 19, 177, 'ALBA LORENA ZAMBRANO VELEZ', 'ALBA LORENA ZAMBRANO VELEZ', '', '0998309674', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (386, 'P', 1, '0700261209001', 50, 19, 177, 'ALBERCA VACA MARIA ZOBEIDA', 'HOTEL BAR RESTAURATE MINI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (387, 'P', 1, '0991363262001', 50, 19, 177, 'ALLTECH CIA. LTDA.', 'ALLTECH ECUADOR CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (388, 'P', 1, '1792703387001', 50, 19, 177, 'ALTVET ALTERNATIVAS VETERINARIAS S  A', 'ALTVET', '', '224-1622', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (389, 'P', 1, '0703529040001', 50, 19, 177, 'ALVARADO MEDINA YADIRA DEL CARMEN', 'RESTAURANT LA CARPA', '', '072943136', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (390, 'P', 1, '2100421375001', 50, 19, 177, 'ALVAREZ CORDERO KERLY DAYANI', 'GASOLINERA SIGLO XXI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (391, 'P', 1, '1101100913001', 50, 19, 177, 'AMBULUDI REINERIO ESTEBAN', 'AMBULUDI REINERIO ESTEBAN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (392, 'P', 1, '1791287010001', 50, 19, 177, 'AMEVEA', 'STUPENDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (393, 'P', 1, '1791878868001', 50, 19, 177, 'AMMR VETERINARIAS', '', '', '2829069', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (394, 'P', 1, '1792570956001', 50, 19, 177, 'ANDINA EMPRESARIAL CIA LTDA', 'ANDINAEMPRESARIAL CIA LTDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (395, 'P', 1, '1104561996001', 50, 19, 177, 'ANGAMARCA PUCHAICELA SOLEDAD DEL ROCIO', 'ANGAMARCA PUCHAICELA SOLEDAD DEL ROCIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (396, 'P', 1, '1201365010001', 50, 19, 177, 'AÑI OLVERA LUIS FERNANDO', 'AÑI OLVERA LUIS FERNANDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (397, 'P', 1, '0701473381001', 50, 19, 177, 'APOLO LOAYZA MARIA KENMITA', 'APOLO LOAYZA MARIA KENMITA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (398, 'P', 1, '0700505100001', 50, 19, 177, 'APOLO RAMIREZ FELIX MANUEL', 'APOLO RAMIREZ FELIX MANUEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (399, 'P', 1, '0703439612001', 50, 19, 177, 'APONTE GONZALEZ YESENIA ERCILIA', 'APONTE GONZALEZ YESENIA ERCILIA', '', '0994689631', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (400, 'P', 1, '1900203991001', 50, 19, 177, 'ARANDA ANGULO LILIA CARMITA', 'RESIDENCIAL SAN LUIS', '', '2308017', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (401, 'P', 1, '0300720752001', 50, 19, 177, 'ARCENTALES FAJARDO JORGE RAUL', 'ARCENTALES FAJARDO JORGE RAUL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (402, 'P', 1, '1102924410001', 50, 19, 177, 'ARIAS ARIAS FANNY AUXILIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (403, 'P', 1, '0704969153001', 50, 19, 177, 'ARMADO JAVIER MATEO ALONSO', 'CENTRO DE LUBRICACION JOSAMI', '', '2962670', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (404, 'P', 1, '0703031633001', 50, 19, 177, 'ARMIJOS CEDILLO MARIA ELENA', 'CEVICHERIA MARY', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (405, 'P', 2, '1104645328', 50, 19, 177, 'ARMIJOS JOSE VINICIO', 'ARMIJOS JOSE VINICIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (406, 'P', 1, '1900381672001', 50, 19, 177, 'ARMIJOS VEINTIMILLA MARIA MARISOL', 'COMEDOR MAJITO', '', '2606864', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (407, 'P', 1, '0703788109001', 50, 19, 177, 'ASANZA PINTO VICENTE BENITO', 'ALUBAL', '', '2517945', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (408, 'P', 1, '1191756599001', 50, 19, 177, 'ASOCIACION DE PROFECIONALES AGROPECUARIOS DE LOJA ASOPAL', 'ASOCIACION DE PROFECIONALES AGROPECUARIOS DE LOJA ASOPAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (409, 'P', 1, '1712970340001', 50, 19, 177, 'ASTUDILLO ANDRADE CARLOS MANUEL', 'MAYA PIONEER', '', '2977209', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (410, 'P', 1, '0791790077001', 50, 19, 177, 'ATECELECTRIC CIA LTDA', '', '', '2985004', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (411, 'P', 1, '1104861545001', 50, 19, 177, 'AYALA LUNA DIEGO FERNANDO', 'AHITANAS', '', '2664709', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (412, 'P', 1, '1103220420001', 50, 19, 177, 'AZANZA ORTIZ PAILINA DEL CARMEN', 'POLLOS SANDI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (413, 'P', 1, '0703026682001', 50, 19, 177, 'AZOGUE NUGSHI MANUEL DE LA CRUZ', 'AZOGUE NUGSHI MANUEL DE LA CRUZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (414, 'P', 1, '1002336814001', 50, 19, 177, 'BALDEON PROAÑO FERNANDA ELIZABETH', 'BALDEON PROAÑO FERNANDA ELIZABETH', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (415, 'P', 1, '1801791086001', 50, 19, 177, 'BALLADARES JACOME NESTOR  RAMIRO', 'VERSAILLES HOTEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (416, 'P', 1, '1750331371001', 50, 19, 177, 'BARBATO HINESTROSA NORBERTO JOSE', 'BARBATO HINESTROSA NORBERTO JOSE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (417, 'P', 1, '1800033068001', 50, 19, 177, 'BENALCAZARI NSUASTI MARIA LEONOR', 'GASOLINERA GRANJA PALLATANGA', '', '2324033', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (418, 'P', 1, '1104076193001', 50, 19, 177, 'BENITEZ IÑIGUEZ JOHANA CECIBEL', 'AGACHADITOS DON ROJITAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (419, 'P', 1, '1305903864001', 50, 19, 177, 'BERMUDEZ GARCIA ROXANA JACQUELINE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (420, 'P', 1, '1803167582001', 50, 19, 177, 'BERMUDEZ MIRANDA ESTHELA ELIZABETH', 'BERMUDEZ MIRANDA ESTHELA ELIZABETH', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (421, 'P', 1, '1104241433001', 50, 19, 177, 'BETANCUR CORDOVA FERNANDA MARIBEL', 'BETANCUR CORDOVA FERNANDA MARIBEL', '', '072582021', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (422, 'P', 1, '0702425919001', 50, 19, 177, 'BETTY JANINA HEREDIA CARRANZA', 'PICANTERIA PIGUARI', '', '2921753', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (423, 'P', 1, '0991417575001', 50, 19, 177, 'BLUECORP S.A.', 'ESTACION DE SERVICIO MELISSA', '', '0988507731', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (424, 'P', 1, '0704957463001', 50, 19, 177, 'BONETE RIVERA RAUL HIDALGO', 'ELABORACION DE OTROS PRODUCTOS ALIMENTICIOS', '', '0989896756', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (425, 'P', 1, '0704757194001', 50, 19, 177, 'BRAVO BRAVO JACQUELIN ALEXANDRA', 'BRAVO BRAVO JACQUELIN ALEXANDRA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (426, 'P', 1, '0702109679001', 50, 19, 177, 'BRAVO CAMPOVERDE HERMAN FULVIO', 'BRAVO CAMPOVERDE HERMAN FULVIO', '', '0991290566', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (427, 'P', 1, '1100546470001', 50, 19, 177, 'BRAVO CUCHIMARCA ALBA VIOLETA', 'BRAVO CUCHIMARCA ALBA VIOLETA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (428, 'P', 1, '0925757866001', 50, 19, 177, 'BRAVO PALMA YANDRY MAURICIO', '', '', '0982516613', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (429, 'P', 1, '1104051758001', 50, 19, 177, 'BRAVO VEGA DIANA MARISOL', 'PICANTERIA SABOR LATINO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (430, 'P', 1, '0992524200001', 50, 19, 177, 'BRAYMING S A', 'SOLULEGAL', '', '042515047', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (431, 'P', 1, '0700719784001', 50, 19, 177, 'BUELE CAMPOS FRANCISCO', 'LIBRERIA Y PAPELERIA DON PANCHO', '', '297 6904', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (432, 'P', 1, '0704918770001', 50, 19, 177, 'BUENO CARDENAS JORGE ARMANDO', 'BAR RESTAURATE SHAINA', '', '2975789', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (433, 'P', 1, '1900218999001', 50, 19, 177, 'BUITRON SANCHEZ SERGIO RENE', 'BUITRON SANCHEZ SERGIO RENE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (434, 'P', 1, '1716142045001', 50, 19, 177, 'BUSTE RIVAS FRANCISCO JAVIER', 'SERVICIOS TECNICOS DE PINTURA', '', '2966318', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (435, 'P', 1, '0704925122001', 50, 19, 177, 'CABRERA TINOCO VANESSA CAROLINA', 'ACTIVIDADES RELACIONADAS CON LA CONTABILIDAD', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (436, 'P', 1, '1102429055001', 50, 19, 177, 'CAMBIZACA CUEVA ALMITA PIEDAD', 'PICANTERIA T RADICIONAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (437, 'P', 1, '0703683565001', 50, 19, 177, 'CAÑAR ROMERO TANIA DEL ROCIO', 'ASADERO LA ESQUINA DE ALES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (438, 'P', 1, '1792101425001', 50, 19, 177, 'CARAPUNGO SANDRY', 'CARPUNTO CIA. LTDA', '', '0224223260', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (439, 'P', 1, '0701874505001', 50, 19, 177, 'CARCHIPULLA GRANDA WILLIAM ALFREDO', 'CARCHIPULLA GRANDA WILLIAM ALFREDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (440, 'P', 1, '1103230965001', 50, 19, 177, 'CARPIO LEON SANDRA LORENA', 'RESTAURANTE CARIBE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (441, 'P', 1, '0502241409001', 50, 19, 177, 'CARRERA CEPEDA DORIS MARLENE', 'CARRERA CEPEDA DORIS MARLENE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (442, 'P', 1, '1103305825001', 50, 19, 177, 'CARRERA ENCALADA EDUARDO DANILO', 'CARRERA ENCALADA EDUARDO DANILO', '', '2600113', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (443, 'P', 1, '1103075436001', 50, 19, 177, 'CARRION ARMIJOS EDITA YOLANDA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (444, 'P', 1, '1102875117001', 50, 19, 177, 'CARRION JIMENEZ LEONARDO VICENTE', 'D.EVENTOS RWSTUARANT Y CAFETERIA', '', '2688412', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (445, 'P', 1, '0991259546001', 50, 19, 177, 'CARRO SEGURO CARSEG S A', 'CARRO SEGURO CARSEG S.A', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (446, 'P', 1, '0991400427001', 50, 19, 177, 'CARTIMEX', 'CARTIMEX', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (447, 'P', 1, '0703466938001', 50, 19, 177, 'CASTILLO PEÑA JOSE EDILBERTO', 'ASADERO  D JOSE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (448, 'P', 1, '0703148270001', 50, 19, 177, 'CASTILLO TACURI MARCIA ZORAIDA', 'COMEDOR NAYMAR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (449, 'P', 1, '1705471033001', 50, 19, 177, 'CEDILLO GONZALEZ EMILIA ALBERTINA', 'ESTACION DE SERVICIOS VIRGEN DEL CISNE II', '', '042386514', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (450, 'P', 1, '1791804902001', 50, 19, 177, 'CENTRO COMERCIAL LA MANZANA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (451, 'P', 1, '0703215079001', 50, 19, 177, 'CEVALLOS ROMERO PATRICIA MARGOTH', 'RESTAURANTE DON PEPE PRIMERO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (452, 'P', 1, '1716750789001', 50, 19, 177, 'CHACON PAEZ VALERIA PATRICIA', 'CHACON PAEZ VALERIA PATRICIA', '', '2508112', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (453, 'P', 1, '1102487699001', 50, 19, 177, 'CHALAN MALDONADO SEGUNDO ALBERTO', 'CHALAN MALDONADO SEGUNDO ALBERTO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (454, 'P', 1, '0702051921001', 50, 19, 177, 'CHAMBA GALLARDO HELMER MARIA', 'CHAMBA GALLARDO HELMER MARIA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (455, 'P', 1, '1900398908001', 50, 19, 177, 'CHAMBA GUAMAN MARIANA ELENA', 'RESTAURANT MARIANITA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (456, 'P', 1, '0991244085001', 50, 19, 177, 'CHEM - TECH S.A.', 'CHEM - TECH S.A.', '', '042925659', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (457, 'P', 1, '0991291040001', 50, 19, 177, 'CHEMICAL PHARM DEL ECUADOR C. LTDA', 'CHEMICAL PHARM DEL ECUADOR C. LTDA', '', '09918691765', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (458, 'P', 1, '0930485206001', 50, 19, 177, 'CHEN RONGRUI', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (459, 'P', 1, '1712893856001', 50, 19, 177, 'CHICAIZA PACA LAURA MARIA', 'PICANTERIA REINA DEL CISNE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (460, 'P', 1, '1103458848001', 50, 19, 177, 'CHIMBO ORTEGA CARMEN ALEXANDRA', 'RESTAURANT BRACAMOROS', '', '073105623', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (461, 'P', 1, '1105605503001', 50, 19, 177, 'CHIMBO ORTEGA CRISTOPHER JOEL', 'BRACAMOROS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (462, 'P', 1, '0401572219001', 50, 19, 177, 'CHIRAN TARAPUEZ  WILSON EMILIO', 'MI DULCE CAPULI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (463, 'P', 1, '1790516008001', 50, 19, 177, 'CHUBB SEGUROS ECUADOR', 'CHUBB SEGUROS ECUADOR', '', '59343731810', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (464, 'P', 1, '0705627321001', 50, 19, 177, 'CHUNI ZAPATA MARIA DEL CISNE', 'RESTAURANTE MARIA DEL CISNE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (465, 'P', 1, '1103361315001', 50, 19, 177, 'COLLAGUAZO LOPEZ YENNY OLIVIA', 'SAFARI BURGUER', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (466, 'P', 1, '0702409822001', 50, 19, 177, 'COLLAGUAZO UNUZUNGO MELANIA ISABEL', 'VENTA EN COMIDAS Y BEBIDAS EN PICANTERIAS PARA SU CONSUMO INMEDIATO', '', '0980211537', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (467, 'P', 1, '1091747819001', 50, 19, 177, 'COMBUSOLIVOS CIA. LTDA.', 'COMBUSOLIVOS CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (468, 'P', 1, '1792901014001', 50, 19, 177, 'COMBUSTIBLES Y SERVICIOS TOBAR SERCOMTOBAR S.A.', 'COMBUSTIBLES Y SERVICIOS TOBAR SERCOMTOBAR S.A.', '', 'SN', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (469, 'P', 1, '1792627753001', 50, 19, 177, 'COMERCIALIZADORA SNAPSI CIA.LTDA', 'COMERCIALIZADORA SNAPSI CIA.LTDA', '', '023483532', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (470, 'P', 1, '1391723563001', 50, 19, 177, 'COMPANIA DE RESPONSABILIDAD LIMITADA LOS BIZARROS', 'COMPANIA DE RESPONSABILIDAD LIMITADA LOS BIZARROS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (471, 'P', 1, '0990022453001', 50, 19, 177, 'COMPAÑIA DE SEGUROS ECUATORIANOS SUIZA S A', 'COMPAÑIA DE SEGUROS ECUATORIANOS SUIZA S.A', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (472, 'P', 1, '0992636955001', 50, 19, 177, 'COMPAÑIA DE TRANSPORTE DE CARGA C A R  UNION PALTENSE C A  TRANSUPALTENSE', 'COMPAÑIA DE TRANSPORTE DE CARGA C.A.R. UNION PALTENSE C.A. TRANSUPALTENSE', '', '2262507', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (473, 'P', 1, '0791790743001', 50, 19, 177, 'COMPAÑIA DE TRANSPORTE PESADO Y RESCATE SOBRE RUEDAS GRUAS SR', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (474, 'P', 1, '1791251237001', 50, 19, 177, 'CONSORCIO ECUATORIANO DE TELECOMUNICACIONES S. A. CONECEL', 'CONSORCIO ECUATORIANO DE TELECOMUNICACIONES S. A. CONECEL', '', '59345004040', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (475, 'P', 1, '0791735491001', 50, 19, 177, 'CONSTRUSUR DEL ECUADOR S A', 'TERPEL MACHALA 1', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (476, 'P', 1, '0790042557001', 50, 19, 177, 'COOP. DE TRANSP  T.A.C.', 'COOP. INTERPROVINCIAL DE TRANSPORTES ASOCIADOS CANTONALES T.A.C.', '', '72724984', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (477, 'P', 1, '0490008578001', 50, 19, 177, 'COOPERAATIVA DE TRASNPORTES SAN CRISTOBAL', 'COOPERAATIVA DE TRASNPORTES SAN CRISTOBAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (478, 'P', 1, '0990568022001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE DE PASAJEROS EN BUSES SANTA LUCIA LTDA', 'COOPERATIVA DE TRANSPORTE DE PASAJEROS EN BUSES SANTA LUCIA LTDA.', '', '3013541', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (479, 'P', 1, '0990296820001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE DE PASAJEROS VILLAMIL', 'ESTACION DE SERVICIOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (480, 'P', 1, '1790414973001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE FLOR DEL VALLE CAYAMBE', 'COOPERATIVA DE TRANSPORTE FLOR DEL VALLE CAYAMBE', '', '2111024', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (481, 'P', 1, '0790053419001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE INTERNACINAL RUTAS ORENSES', 'COOPERATIVA DE TRANSPORTE INTERNACINAL RUTAS ORENSES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (482, 'P', 1, '1190024365001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE SUR ORIENTE', 'COOPERATIVA DE TRANSPORTE SUR ORIENTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (483, 'P', 1, '1190081474001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE UNION CARIAMANGA', 'COOPERATIVA DE TRANSPORTE \"UNION CARIAMANGA\"', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (484, 'P', 1, '1990010427001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTE UNION YANZATZA', 'COOPERATIVA DE TRANSPORTE UNION YANZATZA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (485, 'P', 1, '1090008273001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTES 28 DE SEPTIEMBRE', 'ESTACION DE SERVICIO 28 DE SEPTIEMBRE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (486, 'P', 1, '1790042944001', 50, 19, 177, 'COOPERATIVA DE TRANSPORTES PANAMERICANA INTERNACIONAL', 'COOPERATIVA DE TRASNPORTES PANAMERICANA INTERNACIONAL', '', '022501585', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (487, 'P', 1, '1102593207001', 50, 19, 177, 'CORDOVA AGUIRRE DIEGO GUILLERMO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (488, 'P', 1, '1104175300001', 50, 19, 177, 'CORDOVA CUEVA ROBER ANTONIO', 'CORDOVA CUEVA ROBER ANTONIO', '', '072542388', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (489, 'P', 1, '1103452015001', 50, 19, 177, 'CORONEL VILLAVICENCIO AYDA JANETH', 'LA CASANA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (490, 'P', 1, '0501233498001', 50, 19, 177, 'CORRALES CARRERA MILTON HERNAN', 'REPUESTOS Y LUBRICANTES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (491, 'P', 1, '0701181166001', 50, 19, 177, 'CORTEZ ORELLANA JIMMY FORTUNATO', 'RESTAURANTE NUEVO EDEN', '', '0988020662', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (492, 'P', 1, '0704670892001', 50, 19, 177, 'CORTEZ VERA JIMMY FABIAN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (493, 'P', 1, '1100574688001', 50, 19, 177, 'CRIOLLO CASTILLO GRACIELA MARIA', 'CRIOLLO CASTILLO GRACIELA MARIA', '', '2546129', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (494, 'P', 1, '1725926065001', 50, 19, 177, 'CUJILEMA QUISHPI GINA ELIZABETH', 'RESTAURANT Y PARRILLADA LA SAZON DE GINA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (495, 'P', 1, '1711783421001', 50, 19, 177, 'DAVIS MOREIRA STEPHEN DANIEL', 'DAVIS MOREIRA STEPHEN DANIEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (496, 'P', 1, '0702127887001', 50, 19, 177, 'DELGADO AGUAYO VIVIANA DEL PILAR', 'EL POLLO QUE ARDE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (497, 'P', 1, '1792690994001', 50, 19, 177, 'DESPEGAR ECUADOR S.A.', 'DESPEGAR ECUADOR DESPEGARECUADOR S.A.', '', '2441624', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (498, 'P', 1, '0992921404001', 50, 19, 177, 'DIDESPROPE S.A.', 'DISTRIBUIDORA DE DERIVADOS Y PRODUCTOS PETROLEROS DIDESPROPE S.A.', '', '043712360', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (499, 'P', 1, '1768049390001', 50, 19, 177, 'DIRECCION GENERAL DE REGISTRO CIVIL INDENTIFICACION Y CEDULACION', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (500, 'P', 1, '0992311134001', 50, 19, 177, 'DIRVAL S A', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (501, 'P', 1, '1792222796001', 50, 19, 177, 'DISTRIFUEL CIA  TLDA', 'DISTRIFUEL CIA. TLDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (502, 'P', 1, '1791848608001', 50, 19, 177, 'E/S LA ESPERANZA', 'EMINENS CIA. LTDA.', '', '022469556', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (503, 'P', 1, '1791972244001', 50, 19, 177, 'ECUABARE S.A.', 'ECUABARE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (504, 'P', 1, '0990018707001', 50, 19, 177, 'ECUAQUIMICA C.A.', 'ECUAQUIMICA ECUATORIANA DE PRODUCTOS QUIMICOS C.A.', '', '042807897 EXT 4', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (505, 'P', 1, '1792645352001', 50, 19, 177, 'EL PINAR SC', 'EL PINAR SC', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (506, 'P', 1, '0705461697001', 50, 19, 177, 'ELIZALDE ALVARADO JOSE DOMINGO', 'REST. LOS MELLIZOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (507, 'P', 1, '1291714605001', 50, 19, 177, 'EMFLUSA EMPRESARIOS FLUMINENSES S A', 'ESTACION DE SERVICIOS GABELA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (508, 'P', 1, '1060041100001', 50, 19, 177, 'EMPRESA PUBLICA DE MOVILIDAD DEL NORTE', 'EMPRESA PUBLICA DE MOVILIDAD DEL NORTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (509, 'P', 1, '1768154690001', 50, 19, 177, 'EMPRESA PUBLICA METROPOLITANA DE MOVILIDAD Y OBRAS PUBLICAS', 'EMPRESA PUBLICA METROPOLITANA DE MOVILIDAD Y OBRAS PUBLICAS', '', '2525023', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (510, 'P', 1, '0992614420001', 50, 19, 177, 'ENCALEGA S A', 'ENCALEGA S.A', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (511, 'P', 1, '1102043658001', 50, 19, 177, 'ENID DOLORES PALADINES ESPINOZA', 'KOMIDITAS RESTAURAT', '', '2944270', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (512, 'P', 1, '1715247779001', 50, 19, 177, 'ESPINOSA MALDONADO PATRICIO XAVIER', 'CAFETERIA RESTAURANT KATY', '', '2110822', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (513, 'P', 1, '1103549760001', 50, 19, 177, 'ESPINOZA ALVAREZ JUAN ANDRES', 'LA CASA DEL TAMAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (514, 'P', 1, '1001033594001', 50, 19, 177, 'ESPINOZA GOMEZ MAURA SULEMA', 'EL CALLEJON', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (515, 'P', 1, '1103462402001', 50, 19, 177, 'ESPINOZA LOAIZA NIDIA LUCILA', 'ESPINOZA LOAIZA NIDIA LUCILA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (516, 'P', 1, '0702184060001', 50, 19, 177, 'ESPINOZA MACASA ZOILA MACRINA', 'ESPINOZA MACASA ZOILA MACRINA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (517, 'P', 1, '0704568278001', 50, 19, 177, 'ESPINOZA QUEZADA DIANA ISABEL', 'ACCESORIOS Y REPUESTOS VEHICULARES ESPINOZA QUEZADA', '', '0991156763', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (518, 'P', 1, '0301255931001', 50, 19, 177, 'ESTACION  DE SERVICIO MALACATOS', 'ESTACION  DE SERVICIO MALACATOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (519, 'P', 1, '0992106085001', 50, 19, 177, 'ESTACION DE SERVCIO CASCOL ACTENSIVA', 'ESTACION DE SERVCIO CASCOL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (520, 'P', 1, '0791774802001', 50, 19, 177, 'ESTACION DE SERVICIO LARRIVA LARRIVA GASOLINERA GASOLACO COMPAÑIA DE RESPONSABILIDAD LIMITADA', 'ESTACION DE SERVICIO LARRIVA LARRIVA GASOLINERA GASOLACO COMPAÑIA DE RESPONSABILIDAD LIMITADA', '', '0991790420', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (521, 'P', 1, '0101900330001', 50, 19, 177, 'ESTACION DE SERVICIO MARIA UXILIADORA', 'ESTACION DE SERVICIO MARIA UXILIADORA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (522, 'P', 1, '1792124379001', 50, 19, 177, 'ESTACION DE SERVICIO PEAJE NORTE', 'ESTACION DE SERVICIO PETROCOMERCIAL PEAJE NORTE', '', '022839014', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (523, 'P', 1, '1792585694001', 50, 19, 177, 'ESTACION DE SERVICIO PUENGASI G A-MCJ CIA. LTDA.', 'ESTACION DE SERVICIO PUENGASI G A-MCJ CIA. LTDA.', '', '023194171', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (524, 'P', 1, '0992531355001', 50, 19, 177, 'ESTACION DE SERVICIO SAN NICOLAS', 'ESTACION DE SERVICIO SAN NICOLAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (525, 'P', 1, '1792449367001', 50, 19, 177, 'ESTACION DE SERVICIOS COOPTRACAL S.A.', 'ESTACION DE SERVICIOS COOPTRACAL S.A.', '', '2425059', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (526, 'P', 1, '0991443312001', 50, 19, 177, 'ESTACION DE SERVICIOS JARAMILLO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (527, 'P', 1, '1391785100001', 50, 19, 177, 'ESTACION DE SERVICIOS LA PILA', 'NEGOCIOS LA PILA CIA. LTDA. PILNEGCIA', '', '2315171', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (528, 'P', 1, '0919882001001', 50, 19, 177, 'ESTACION DE SERVICIOS LA UNIVERSAL', 'ESTACION DE SERVICIOS LA UNIVERSAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (529, 'P', 1, '1801338912001', 50, 19, 177, 'ESTACION DE SERVICIOS LOPEZ SANTANA', 'ESTACION DE SERVICIOS LOPEZ SANTANA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (530, 'P', 1, '0992327162001', 50, 19, 177, 'ESTACION DE SERVICIOS MACHALA DOS', 'ESTACION DE SERVICIOS MACHALA DOS', '', '072982-558', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (531, 'P', 1, '0993005916001', 50, 19, 177, 'ESTACION DE SERVICIOS PASCUALES', 'ESTACION DE SERVICIOS PASCUALES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (532, 'P', 1, '0993002917001', 50, 19, 177, 'ESTACION DE SERVICIOS SAN VICENTE', 'ESTACION DE SERVICIOS SAN VICENTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (533, 'P', 1, '1103606677001', 50, 19, 177, 'ESTACION DE SERVICIOS SARAGURO', 'ESTACION DE SERVICIOS SARAGURO', '', '2200005', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (534, 'P', 1, '1191735931001', 50, 19, 177, 'ESTACION DE SEVICIOS ORTEGA FRELMAC CIA LTDA', 'FRELMAC', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (535, 'P', 1, '0991519246001', 50, 19, 177, 'ESTACION PEDRO CARBO ELIPOL', 'ESTACION PEDRO CARBO ELIPOL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (536, 'P', 1, '1102850433001', 50, 19, 177, 'FABIAN ERASMO ALEJANDRO MARIN', 'FABIAN ERASMO ALEJANDRO MARIN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (537, 'P', 1, '0602081549001', 50, 19, 177, 'FALCONI CARDONA ROMULO RENAN', 'NUTRION', '', '032300306', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (538, 'P', 1, '0702084153001', 50, 19, 177, 'FEIJOO ENCALADA ORFLINA DEL CARMEN', 'ALBAHACA RESTAURANT', '', '2936162', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (539, 'P', 1, '0705385201001', 50, 19, 177, 'FEIJOO LOAYZA GABRIELA FERNANDA', 'FERRETERIA SAN VICENTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (540, 'P', 1, '0925295578001', 50, 19, 177, 'FENG LIGUANG', 'CHIFA FELICIDAD', '', '2338625', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (541, 'P', 1, '0705216455001', 50, 19, 177, 'FERNANDEZ ARCE PATRICIO MIGUEL', 'FERNANDEZ ARCE PATRICIO MIGUEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (542, 'P', 1, '0705261709001', 50, 19, 177, 'FERNANDEZ ROMERO CARMEN ELIZABETH', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (543, 'P', 1, '0702759325001', 50, 19, 177, 'FRANCO CORREA MARCO DE LOS ANGELES', 'RESTAURANT REGALO DE DIOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (544, 'P', 1, '0919309005001', 50, 19, 177, 'FREIRE PAZAMIÑO ROXANA DOLORES', 'RESTAURANTE PICUN PICUN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (545, 'P', 1, '0703415463001', 50, 19, 177, 'FREIRE PONTON PATRICIO HIGINIO', 'CENTRO DE SERVICIO AUTOMOTRIZ SOBRE RUEDAS', '', '2974371', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (546, 'P', 1, '1803762069001', 50, 19, 177, 'FREIRE RENDON KLEVER HERNAN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (547, 'P', 1, '0992236574001', 50, 19, 177, 'FUNDACION TERMINAL TERRESTRE', 'FUNDACION TERMINAL TERRESTRE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (548, 'P', 1, '0702627134001', 50, 19, 177, 'GALLARDO ALVARADO KATTY SORAYA', 'NOTARIA PUBLICA DE BALSAS', '', '072517244', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (549, 'P', 1, '0701093957001', 50, 19, 177, 'GALLEGOS SUAREZ NOEMI GERARDINA', 'GALLEGOS SUAREZ NOEMI GERARDINA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (550, 'P', 1, '1104149768001', 50, 19, 177, 'GALLEGOS TANDAZO JENNY YOBELI', 'ACTIVIDADES DE HOTELES Y RESTAURANTES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (551, 'P', 1, '1900173244001', 50, 19, 177, 'GAONA CUEVA ROSA GEORGINA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (552, 'P', 1, '0703278176001', 50, 19, 177, 'GAONA GARCIA JUANA ELIZABETH', 'VENTA DE COMIDA Y BEBIDAS EN RESTAURANT', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (553, 'P', 1, '1707251003001', 50, 19, 177, 'GARCIA  GARCIA FAUSTO GABRIELL', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (554, 'P', 1, '1900323351001', 50, 19, 177, 'GARCIA SAMANIEGO SOLEDAD DE FATIMA', 'EL RINCON DEL SABOR CHARAPANO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (555, 'P', 1, '0701997595001', 50, 19, 177, 'GARNICA VAZQUEZ LUIS ANCELMO', 'SELLOS GARNICA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (556, 'P', 1, '0902340108001', 50, 19, 177, 'GARZOTA INN', 'GARZOTA INN', '', '2655107', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (557, 'P', 1, '0991428577001', 50, 19, 177, 'GASGRUP S A', 'GASGRUP S.A', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (558, 'P', 1, '0390029101001', 50, 19, 177, 'GASOLINERA   E L    R E C R E O', 'GASOLINERA   E L    R E C R E O', '', '072242639', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (559, 'P', 1, '0591723197001', 50, 19, 177, 'GASOLINERA SILVA DOS CIA. LTDA.', 'GASOLINERA SILVA DOS CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (560, 'P', 1, '0790100883001', 50, 19, 177, 'GASOLINERA Y LUBRICANTES DEL SUR GASUR S A', 'GASOLINERA Y LUBRICANTES DEL SUR GASUR S A', '', '072937157', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (561, 'P', 1, '0992968435001', 50, 19, 177, 'GASOVIP S A', 'GASOVIP S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (562, 'P', 1, '1708639487001', 50, 19, 177, 'GAVILANEZ LLANOS ELVIA GALUTH', 'RESTAURANTE EL BUEN SABOR JJDR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (563, 'P', 1, '1791891325001', 50, 19, 177, 'GEREST CIA  LTDA', 'GEREST CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (564, 'P', 1, '0992822252001', 50, 19, 177, 'GESURYMACA S  A', 'GESURYMACA S. A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (565, 'P', 1, '2390032180001', 50, 19, 177, 'GOLDEN VISTA', 'GOLDEN VISTA', '', '02746250', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (566, 'P', 1, '1103300669001', 50, 19, 177, 'GONZALES BENITES CARLOS MARIA', 'GONZALES BENITES CARLOS MARIA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (567, 'P', 1, '0300988011001', 50, 19, 177, 'GONZALES BUSTAMANTE LEONEL PATRICIO', 'GONZALES BUSTAMANTE LEONEL PATRICIO', '', '2677286', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (568, 'P', 1, '1103642748001', 50, 19, 177, 'GONZALEZ CHUNCHO MARIA EMPERATRIZ', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (569, 'P', 1, '1105947053001', 50, 19, 177, 'GUALAN LOZANO INES SUSANA', 'LA LEÑA RESTAURANTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (570, 'P', 1, '1004288583001', 50, 19, 177, 'GUAMAN QUISPE PAMELA ESTEFANIA', 'HOTEL SUEÑO REAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (571, 'P', 1, '0101467165001', 50, 19, 177, 'GUERRA ARGUDO MARCO PATRICIO', 'AVIVETAG', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (572, 'P', 1, '1102069729001', 50, 19, 177, 'GUILLERMO SIXTO SALINAS PACHECO', 'GRAN HOSTAL SALINAS', '', '072664287', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (573, 'P', 1, '1001973070001', 50, 19, 177, 'HERNANDEZ LOPEZ JOSE ANTONIO', 'HERNANDEZ LOPEZ JOSE ANTONIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (574, 'P', 1, '1708549728001', 50, 19, 177, 'HERRERA HERRERA ROMEL ISIDRO', 'LA VIÑA', '', '2300094', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (575, 'P', 1, '1710966142001', 50, 19, 177, 'HIDALGO CUENCA EDGAR OSWALDO', 'HIDALGO CUENCA EDGAR OSWALDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (576, 'P', 1, '1102114897001', 50, 19, 177, 'HIDALGO HERRERA JOSE BELISARIO', 'NARANATHA RESTAURANT', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (577, 'P', 1, '2100356159001', 50, 19, 177, 'HUANCA VARGAS RODI PAUL', '', '', '0981997739', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (578, 'P', 1, '0925140204001', 50, 19, 177, 'HUANCA YAGUACHI DIANA DEL CARMEN', 'ASADERO ELVIAJERO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (579, 'P', 2, '0701720773', 50, 19, 177, 'HURTADO PEDRO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (580, 'P', 1, '1792054672001', 50, 19, 177, 'IGLESIAS TAPIA CIA. LTDA.', 'ESTACION DE SERVICIO ANDES GAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (581, 'P', 1, '1090003085001', 50, 19, 177, 'IMBABURA TURISTICA C.A. IMBATURIS', 'HOTEL AJAVI', '', '06 2955555', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (582, 'P', 1, '0190003701001', 50, 19, 177, 'IMPORTADORA TOMEBAMBA', 'IMPORTADORA TOMEBAMBA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (583, 'P', 1, '1890098106001', 50, 19, 177, 'IMVAB CIA. LTDA.', 'IMVAB CIA. LTDA.', '', '0992630893', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (584, 'P', 1, '1790552195001', 50, 19, 177, 'INDUFAR', 'INDUFAR', '', '2424191', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (585, 'P', 1, '0990681708001', 50, 19, 177, 'INDUSUR INDUSTRIAL DEL SUR S.A.', 'INDUSUR INDUSTRIAL DEL SUR S.A.', '', '072574111 0986419540', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (586, 'P', 1, '1900753623001', 50, 19, 177, 'IÑIGUEZ JARAMILLO ANA PATRICIA', 'RESTAURANTE LAS GEMELITAS', '', '2606275', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (587, 'P', 1, '1103583736001', 50, 19, 177, 'IÑIGUEZ VALVERDE MARIA ALEXANDRA', 'IÑIGUEZ VALVERDE MARIA ALEXANDRA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (588, 'P', 1, '1791415132001', 50, 19, 177, 'INT FOOD SERVICES CORP', 'INT FOOD SERVICES CORP', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (589, 'P', 1, '0704096940001', 50, 19, 177, 'INTRIAGO VELEZ FRANCISCA ANTONIA', 'VENTA DE COMIDAS Y BEBIDAS EN RESTAURANTES', '', '2787219', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (590, 'P', 1, '1103927537001', 50, 19, 177, 'JARAMILLO AÑASCO CARLOS PAUL', 'HOSTAL CARLOS JARAMILLO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (591, 'P', 1, '1105570558001', 50, 19, 177, 'JARAMILLO CANGO ANDREINA MARIELA', 'SUPER POLLO', '', '2301862', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (592, 'P', 1, '0701956849001', 50, 19, 177, 'JARAMILLO GUERRERO PATRICIO XAVIER', 'JARAMILLO GUERRERO PATRICIO XAVIER', '', '0999851167', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (593, 'P', 1, '1102294806001', 50, 19, 177, 'JARAMILLO HILL MARCELO', 'JARAMILLO HILL MARCELO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (594, 'P', 1, '1101982856001', 50, 19, 177, 'JARAMILLO LOZANO VICENTE RODRIGO', 'JARAMILLO LOZANO VICENTE RODRIGO', '', '0990818408', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (595, 'P', 1, '1102834445001', 50, 19, 177, 'JARAMILLO VALAREZO MARIA ENIDT', 'JARAMILLO VALAREZO MARIA ENIDT', '', '0991290788', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (596, 'P', 1, '1101973400001', 50, 19, 177, 'JARAMILLO VIVANCO WILMER STALIN', 'JARAMILLO VIVANCO WILMER STALIN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (597, 'P', 1, '0924879158001', 50, 19, 177, 'JINGMIN LIAO', 'CHIFA HUANG GUAN CHINA', '', '5036256', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (598, 'P', 1, '0700015548001', 50, 19, 177, 'JORGE GONZALO JIMENEZ SALAZAR', 'HOSTAL GALAPAGOS', '', '2301897', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (599, 'P', 1, '1002615076001', 50, 19, 177, 'JURADO GODOY JOHANNA PATRICIA', 'LOS CEBICHES DE LA RUMIÑAHUI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (600, 'P', 1, '1101063830001', 50, 19, 177, 'JUVENTINA CASTILLO CASTILLO', 'RESTAURANTE LOS PANCHOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (601, 'P', 1, '1791952359001', 50, 19, 177, 'LA TABLITA GROUP CIA. LTDA.', 'LA TABLITA GROUP CIA. LTDA.', '', '042 541-832', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (602, 'P', 1, '1791141210001', 50, 19, 177, 'LABITECH CIA. LTDA', 'LABITECH', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (603, 'P', 1, '1101079679001', 50, 19, 177, 'LEDESMA JARAMILLO ANGEL SALVADOR', 'HOTEL EL BOSQUE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (604, 'P', 1, '0703452177001', 50, 19, 177, 'LEON GONZAGA ROSA ALEXANDRA', 'RESTAURANT ROMERIA', '', '2973617', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (605, 'P', 1, '1791986997001', 50, 19, 177, 'LEXVALOR ASESORIA LEGAL SA', 'LEXVALOR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (606, 'P', 1, '1757182959001', 50, 19, 177, 'LI SHIXIN', 'CHIFA CHINA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (607, 'P', 1, '0907200265001', 50, 19, 177, 'LINO CORONEL CHERLY CLARA', 'RINCON DE JUANITO', '', '2502318', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (608, 'P', 1, '0700971773001', 50, 19, 177, 'LOAIZA TORO MANUEL DE JESUS', 'LOAIZA TORO MANUEL DE JESUS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (609, 'P', 1, '0703385914001', 50, 19, 177, 'LOAYZA AGUILAR  MARIA MAGDALENA', 'LOAYZA AGUILAR  MARIA MAGDALENA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (610, 'P', 1, '0702802422001', 50, 19, 177, 'LOAYZA VALAREZO JOSE ANTONIO', 'AUTOMOTRIZ LOAYZA', '', '072976382', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (611, 'P', 1, '1311000333001', 50, 19, 177, 'LOOR ZAMBRANO RAMON ANTONIO', 'POLLOS A LA BRASA LA ESKINA', '', '042438302', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (612, 'P', 1, '0700166713001', 50, 19, 177, 'LOYOLA OCHOA NILO ALBERTO', 'ESTACION DE SERVICIOS LOYOLA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (613, 'P', 1, '1104895873001', 50, 19, 177, 'LOZANO PAUCAR LILIANA DEL CARMEN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (614, 'P', 1, '1792132231001', 50, 19, 177, 'LUBRICANTES Y COMBUSTIBLES LUBRIGOD S.A.', 'ESTACION INTERNACIONAL YAHUARCOCHA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (615, 'P', 1, '0921233557001', 50, 19, 177, 'LUCERO QUITUIZACA FREDY RENE', 'BAR RESTAURANTE ALESSIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (616, 'P', 1, '1803626975001', 50, 19, 177, 'DOMINGUEZ MOYA MARLENE GIOCONDA', 'DOMINGUEZ MOYA MARLENE GIOCONDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (617, 'P', 1, '1711246817001', 50, 19, 177, 'PALACIOS BEJARANO RAUL', 'PALACIOS BEJARANO RAUL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (618, 'P', 1, '0909823262001', 50, 19, 177, 'VILLALTA VEGA MANUEL EDUARDO', 'MOTO REPUESTOS YAMAHA', '', '0988281814', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (619, 'P', 1, '1721774295001', 50, 19, 177, 'VILLAMARIN NOGALES KLEVER DARIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (620, 'P', 1, '0706460102001', 50, 19, 177, 'YANAYACO RAMIREZ JEFFERSON RICARDO', 'YANAYACO RAMIREZ JEFFERSON RICARDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (621, 'P', 1, '0992575026001', 50, 19, 177, 'Z&R CORP S.A.', '', '', '042130377', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (622, 'P', 1, '1712801883001', 50, 19, 177, 'ZAMBRANO ARAY JULIO BOLIVAR', 'CABINAS TELEFONICAS Y BAZAR ZAMUD', '', '0999445150', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (623, 'P', 1, '0703673806001', 50, 19, 177, 'ZAMBRANO HIDALGO FLOR ANGELICA', 'ZAMBRANO HIDALGO FLOR ANGELICA', '', '072-517674', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (624, 'P', 1, '0703096065001', 50, 19, 177, 'ZAMORA VALDIVIESO CESAR SILVIO', '', '', '0993698975', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (625, 'P', 2, '1713163622', 50, 19, 177, 'PABON ALBUJA ALEXIS MAURICIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (626, 'P', 1, '1191794857001', 50, 19, 177, 'ASOCIACION DE PRODUCCION AGROPECUARIA TRABAJANDO JUNTOS LA ESPERANCITA ASOPROATRAJUNES', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (627, 'P', 1, '0503394116001', 50, 19, 177, 'SINCHIGUANO CHICAIZA GUIDO MARCELO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (628, 'P', 1, '1792272807001', 50, 19, 177, 'VERIFICADORA DE CALIDAD CALIVERIF CIA LTDA', 'CALIVERIF CIA LTDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (629, 'P', 1, '1790093808001', 50, 19, 177, 'LIBERTY SEGUROS S.A.', 'LIBERTY SEGUROS S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (630, 'P', 1, '0790103122001', 50, 19, 177, 'ORO DIESEL C.LTDA.', 'ORO DIESEL C.LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (631, 'P', 1, '1790010937001', 50, 19, 177, 'BANCO PICHINCHA CA', 'BANCO PICHINCHA CA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (632, 'P', 1, '1800992511001', 50, 19, 177, 'JEREZ AGUILAR LUIS JOAQUIN', 'ESTACION DE SERVICIO JENA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (633, 'P', 1, '1204386963001', 50, 19, 177, 'SUAREZ GARCIA JOFFRE HERNAN', 'SUAREZ GARCIA JOFFRE HERNAN', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (634, 'P', 1, '0704453091001', 50, 19, 177, 'CHAMBA GRANDA JOBETH GANDHI', 'PROSERSUR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (635, 'P', 1, '0100242361001', 50, 19, 177, 'MALLA ZHUNIO ANGEL SAUL', 'AVICOLA MZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (636, 'P', 1, '1722558242001', 50, 19, 177, 'HERRERA CHUMO REINALDO ANDRES', 'HERRERA CHUMO REINALDO ANDRES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (637, 'P', 1, '0992770708001', 50, 19, 177, 'SUPERBRIXEC S.A.', 'ESTACION DE SERVICIO SANTANA OIL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (638, 'P', 1, '1791755243001', 50, 19, 177, 'MILENIO SC', 'MILENIO SC', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (639, 'P', 1, '1792737508001', 50, 19, 177, 'MEGABYCACE CENTROS FERRETEROS S.A.', 'MEGABYCACE CENTROS FERRETEROS S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (640, 'P', 1, '1790019454001', 50, 19, 177, 'TRANSPORTES Y LOGISTICA DEL AREA ANDINA', 'TRANDINA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (641, 'P', 1, '1724545403001', 50, 19, 177, 'MICHAEL NICOLALDE', 'LA CASA DE LAS MENESTRAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (642, 'P', 1, '1792049504001', 50, 19, 177, 'SHEMLON SA', 'MENESTRAS DEL NEGRO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (643, 'P', 1, '1793066070001', 50, 19, 177, 'CASTENI CIA LTDA', 'CASTENI CIA LTDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (644, 'P', 1, '1709825226001', 50, 19, 177, 'TEODORO WENCESLAO GUAYASAMIN CHAVEZ', 'LUBRISERVICIOS EL MAESTRO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (645, 'P', 1, '1391734379001', 50, 19, 177, 'PARCOR S.A.', 'PETROFLAVIO 2', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (646, 'P', 1, '1791995392001', 50, 19, 177, 'HARO GORDILLO LOPEZ CIA. LTDA.', 'ESTACIÓN DE SERVICIO GAS HARO LOPEZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (647, 'P', 1, '1790819515001', 50, 19, 177, 'DISTRIBUIDORA DE LIBROS Y PAPELERIA,DILIPA C.LTDA.', 'DILIPA CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (648, 'P', 1, '1712987054001', 50, 19, 177, 'VERONICA GABRIELA CRUZ YEPEZ', 'BALCON MARINERO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (649, 'P', 1, '1718021627001', 50, 19, 177, 'VALENZUELA IZQUIERDO CHRISTIAN ARMANDO', 'CHEESECAKE PLANET', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (650, 'P', 1, '0102593811001', 50, 19, 177, 'CHACHA DURAN GEOVANNY MAURICIO', 'CHACHA DURAN GEOVANNY MAURICIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (651, 'P', 1, '1792200296001', 50, 19, 177, 'TDM IMPORTACIONES CIA LTDA', 'TDM IMPORTACIONES CIA LTDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (652, 'P', 1, '1715919070001', 50, 19, 177, 'OBACO GONZALEZ KARINA DEL PILAR', '', '', '', 'ruygonzalomoncayo@gmail.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (653, 'P', 1, '1391730780001', 50, 19, 177, 'SOCIEDAD CIVIL DE HECHO DENOMINADO GRUPO USCOCOVICH', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (654, 'P', 1, '0502203987001', 50, 19, 177, 'PALMA SALAZAR BYRON JAVIER', 'PALMA SALAZAR BYRON JAVIER', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (655, 'P', 1, '1793009247001', 50, 19, 177, 'IMPORTADORA TECNO TRAILERS SYR', 'IMPORTADORA TECNO TRAILERS SYR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (656, 'P', 1, '1706843529001', 50, 19, 177, 'VALVERDE BENAVIDES CELINDA DEL CARMEN', 'AUTOCENTRO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (657, 'P', 1, '0908232226001', 50, 19, 177, 'FREDY VIDAL JIMENEZ BONE', 'FREDY VIDAL JIMENEZ BONE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (658, 'P', 1, '0401502265001', 50, 19, 177, 'LIGIA SUSANA ARCINIEGA GARCIA', 'LA PARRILLA DEL TIO JESSY', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (659, 'P', 1, '0990022011001', 50, 19, 177, 'MAQUINARIAS Y VEHÍCULOS S.A. MAVESA', 'MAQUINARIAS Y VEHÍCULOS S.A. MAVESA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (660, 'P', 1, '1792193931001', 50, 19, 177, 'NAFTAECUADOR CIA. LTDA', 'E/S PETRONORTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (661, 'P', 1, '1791885651001', 50, 19, 177, 'MKM IMPORTACIONES', 'MKM IMPORTACIONES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (662, 'P', 1, '1792605504001', 50, 19, 177, 'ADESGAE CIA. LTDA', ' ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (663, 'P', 1, '1792689864001', 50, 19, 177, 'QUALISABOR S.A.', 'HAMBURGUESAS EL CORRAL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (664, 'P', 1, '0590031984001', 50, 19, 177, 'CALZACUERO C.A.', 'BATA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (665, 'P', 1, '0502039738001', 50, 19, 177, 'PALMA SALAZAR AMPARITO DEL ROCIO', 'PALMA SALAZAR AMPARITO DEL ROCIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (666, 'P', 1, '1768188830001', 50, 19, 177, 'AGENCIA DE REGULACIÓN Y CONTROL FITO Y ZOOSANITARIO', 'AGENCIA DE REGULACIÓN Y CONTROL FITO Y ZOOSANITARIO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (667, 'P', 1, '0601632474001', 50, 19, 177, 'ZAMORA PEÑAFIEL IVAN REMIGIO     ', 'ESTACION DE SERVICIO PARADA SANTO DOMINGO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (668, 'P', 1, '1715036206001', 50, 19, 177, 'PEREZ PILLAJO MARGARITA JANNETH', 'PEREZ PILLAJO MARGARITA JANNETH', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (669, 'P', 1, '0791827655001', 50, 19, 177, 'BA&QV CIA.LTDA.', 'BA&QV 2', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (670, 'P', 1, '1705056362001', 50, 19, 177, 'PADILLA BADILLO PABLO WASHINGTON', 'VISION 2006', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (671, 'P', 1, '0992106891001', 50, 19, 177, 'DULCAFE S A', 'SWEET & COFFEE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (672, 'P', 1, '1002503314001', 50, 19, 177, 'CADENA VASQUEZ LUIS ALBERTO', 'FRITADAS AMAZONAS ATUNTAQUI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (673, 'P', 1, '0401297916001', 50, 19, 177, 'CALAN POZO LUIS FERNANDO', 'CALAN POZO LF', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (674, 'P', 1, '1091731203001', 50, 19, 177, 'S.C.C. ESTACION DE SERVICIOS CASTRO HERMANOS', 'ESTACION DE SERVICIOS CASTRO HERMANOS SCC', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (675, 'P', 1, '1793103294001', 50, 19, 177, 'CLINICA DE ESPECIALIDADES ST. THOMAS STTHOMAS S.A.', 'CLINICA ST. THOMAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (676, 'P', 1, '1391747977001', 50, 19, 177, 'GENETICA NACIONAL SA GENETSA ', 'GENETICA NACIONAL SA GENETSA ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (677, 'P', 1, '1720029295001', 50, 19, 177, 'TAMAYO ERAZO DIEGO ROLANDO', 'TAMAYO ERAZO DIEGO ROLANDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (678, 'P', 1, '1720751526001', 50, 19, 177, 'ESPINOZA ERAZO ESTEBAN RAFAEL', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (679, 'P', 2, '1722592068', 50, 19, 177, 'MOROCHO BURBANO CRISTINA GUADALUPE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (680, 'P', 1, '1792190940001', 50, 19, 177, 'SELLFER CIA. LTDA.', 'COMERCIAL FERRETERO FERREVARGAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (681, 'P', 1, '1709785446001', 50, 19, 177, 'ZOILA PIEDAD FLORES RODRIGUEZ', 'ZOILA PIEDAD FLORES RODRIGUEZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (682, 'P', 2, '0600658124', 50, 19, 177, 'VALDIVIEZO BADILLO FAUSTO ANTONINO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (683, 'P', 2, '1724581200', 50, 19, 177, 'BENAVIDES PAEZ JOSELYN MARCELA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (684, 'P', 2, '1719395111', 50, 19, 177, 'NAVARRETE IBANEZ DOLORES YADIRA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (685, 'P', 1, '1891774180001', 50, 19, 177, 'MOLPACK ECUADOR ECUAMOLPACK S.A.', 'MOLPACK ECUADOR', '', '0986388779', 'josue.carvajal@molpack.net;cristian.borja@molpack.net;facturas@diaeventos.com.ec;gladys.tenorio@molpack.net', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (686, 'P', 1, '0603136045001', 50, 19, 177, 'CARRILLO CACERES EDWIN GERMAN', 'VITAAM', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (687, 'P', 1, '1801415199001', 50, 19, 177, 'CARDENAS PARRA ELICIO ALEJANDRO   ', 'BIO-RED CONTRIBUYENTE RÉGIMEN RIMPE AGENTE DE RETENCIÓN RESOLUCIÓN NRO. NAC-DNCRASC20-00000001 ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (688, 'P', 2, '0401158894', 50, 19, 177, 'LOPEZ ROMO JORGE LUIS', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (689, 'P', 1, '1700700642001', 50, 19, 177, 'AVILES TORRES EMMA JOSEFINA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (690, 'P', 1, '1792603137001', 50, 19, 177, 'COMERCIAL PADILLA S C C', 'COMERCIAL PADILLA S C C', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (691, 'P', 1, '1500405582001', 50, 19, 177, 'SANCHEZ TORRES SILVIA ENITH', 'ESTACION DE SERVICIOS EL CHOTA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (692, 'P', 1, '1391932475001', 50, 19, 177, 'HOTEL CEIBO DORADO SAS', 'HOTEL CEIBO DORADO SAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (693, 'P', 1, '1791166914001', 50, 19, 177, 'PETROLEOS DE LOS RIOS PETROLRIOS C.A.', 'PETROLEOS DE LOS RIOS PETROLRIOS C.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (694, 'P', 1, '1708237720001', 50, 19, 177, 'ZANAFRIA CUELLER BYRON GONZALO', 'IMPORTADORA SERACON', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (695, 'P', 1, '1707180137001', 50, 19, 177, 'SERRANO RODRIGUEZ ZOILA MARIA AUXILIADORA', 'SERRANO RODRIGUEZ COMERCIO EXTERIOR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (696, 'P', 1, '0992943882001', 50, 19, 177, 'ESTACION DE SERVICIO BPCE S.A.', 'ESTACION DE SERVICIO SENOR DE LOS MILAGROS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (697, 'P', 1, '1791398262001', 50, 19, 177, 'FABRICA DE BATERIAS FABRIBAT CIA. LTDA.', 'BATERIAS ECUADOR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (698, 'P', 1, '1791841514001', 50, 19, 177, 'AGROPECUARIA INTERANDINA CIA LTDA 2022', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (699, 'P', 1, '1791247671001', 50, 19, 177, 'TEXCOMERCIAL S A', 'TEXCOMERCIAL S A', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (700, 'P', 1, '1703540169001', 50, 19, 177, 'CHIRIBOGA MOLINA YOLANDA PIEDAD IMPLEQU', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (701, 'P', 1, '20303063413', 50, 19, 177, 'ANITA FOOD S.A.', 'ANITA', '', '+5116186565', 'ventas@anita.pe', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (702, 'P', 1, '1804458998001', 50, 19, 177, 'ONATE GARCES JUAN EDUARDO', 'ONATE GARCES JUAN EDUARDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (703, 'P', 1, '1001227808001', 50, 19, 177, 'ROSERO LOPEZ IVO JAVIER', 'ESTACION DE SERVICIOS VALLE DE LAGO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (704, 'P', 1, '0991320776001', 50, 19, 177, 'SIANO SA', 'ESTACION DE SERVICIO SIANO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (705, 'P', 1, '0992426802001', 50, 19, 177, 'COMERCIAL FON FAY S A COMERFON', 'COMERCIAL FON FAY S A COMERFON', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (706, 'P', 1, '0993101141001', 50, 19, 177, 'LABORATORIOS CALIER DEL ECUADOR LABCALIER S.A.', 'LABORATORIOS CALIER DEL ECUADOR LABCALIER S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (707, 'P', 1, '1714665153001', 50, 19, 177, 'VILLALBA OÑA JEANNETH ALEXANDRA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (708, 'P', 1, '1705667804001', 50, 19, 177, 'VISCARRA ESPINOZA FERNANDO RAMIRO', 'VISCARRA ESPINOZA FERNANDO RAMIRO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (709, 'P', 1, '1311407868001', 50, 19, 177, 'MOREIRA PEREZ JANETH ELIZABETH', 'MOREIRA PEREZ JANETH ELIZABETH', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (710, 'P', 1, '1802535425001', 50, 19, 177, 'PAREDES URQUIZO MAIDA IVETH', 'MAIDA IVETH PAREDES URQUIZO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (711, 'P', 1, '1704271251001', 50, 19, 177, 'DUQUE SILVA CARLOS ARTURO', 'VENTA DE COMBUSTIBLE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (712, 'P', 1, '1791762940001', 50, 19, 177, 'COMPANIA CIVIL GASOLINERAS CARRETAS', 'ESTACION DE SERVICIO SAN FRANCISCO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (713, 'P', 1, '1791287541001', 50, 19, 177, 'MEGADATOS SA', 'MEGADATOS SA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (714, 'P', 1, '0918614611001', 50, 19, 177, 'HIDALGO ALTAMIRANO CIRO EDUARDO', 'HIDALGO ALTAMIRANO CIRO EDUARDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (715, 'P', 1, '1720623022001', 50, 19, 177, 'BENAVIDES MORALES MAURICIO FERNANDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (716, 'P', 1, '1713534806001', 50, 19, 177, 'CAO SU PACO BEITAO', 'GRAN COMIDA CHINA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (717, 'P', 1, '1712315074001', 50, 19, 177, 'CARRILLO CADENA MARCO ANTONIO', 'ESTACION DE SERVICIO PANTERA DOS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (718, 'P', 1, '1713271631001', 50, 19, 177, 'AGUILAR CHIRIBOGA JORGE EDUARDO', 'AGUILAR CHIRIBOGA JORGE EDUARDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (719, 'P', 1, '1792540917001', 50, 19, 177, 'AUTOSERVICIO LA PAMPA AUTOSERVIPAMPA CIA. LTDA.', 'AUTOSERVIPAMPA CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (720, 'P', 1, '0992594675001', 50, 19, 177, 'JARABA S.A.', 'HOTEL PUERTO PACIFICO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (721, 'P', 1, '0300564044001', 50, 19, 177, 'FERNANDEZ BARAHONA INES MARINA', 'ESTACION DE SERVICIO ISIDRO AYORA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (722, 'P', 1, '1801681089001', 50, 19, 177, 'GRANJA BENALCAZAR FAUSTO BENIGNO FACTURAELECTRONICAECUADOR.COM', 'GASOLINERA GRANJA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (723, 'P', 1, '1706985957001', 50, 19, 177, 'ZAMORA BALLADARES TERESA DE JESUS', 'VENTA DE COMBUSTIBLE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (724, 'P', 1, '1791769732001', 50, 19, 177, 'PANIFICADORA AMBATO PANAMBATO CIA. LTDA.', 'PANIFICADORA AMBATO PANAMBATO CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (725, 'P', 1, '1790945545001', 50, 19, 177, 'DIPO AUTO CIA. LTDA.', 'DIPO AUTO CIA. LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (726, 'P', 1, '0791817870001', 50, 19, 177, 'SIVISAPA ROMERO SIVI&ROME CIA LTDA', 'ESTACION DE SERVICIO \"EL TREBOL\"', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (727, 'P', 2, '0401080767', 50, 19, 177, 'MARTINEZ BRACHO LENIN OMAR', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (728, 'P', 2, '0401016704', 50, 19, 177, 'MARTINEZ MOLINA WILLAM ORLANDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (729, 'P', 1, '0993256560001', 50, 19, 177, 'GASOCORP S.A', 'ESTACION DE SERVICIO LEDERLUZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (730, 'P', 1, '1791821033001', 50, 19, 177, 'ASOCIACIÓN DE EMPRESAS DE NUTRICIÓN Y SALUD ANIMAL - AENSA', 'ASOCIACIÓN DE EMPRESAS DE NUTRICIÓN Y SALUD ANIMAL - AENSA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (731, 'P', 1, '1790040275001', 50, 19, 177, 'PA-CO COMERCIAL E INDUSTRIAL S.A.', 'PA-CO COMERCIAL E INDUSTRIAL S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (732, 'P', 1, '0992683457001', 50, 19, 177, 'FIALLOS Y GALLEGOS IMPORTADORA S.A. FIGAIMSA', 'FIALLOS Y GALLEGOS IMPORTADORA S.A. FIGAIMSA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (733, 'P', 1, '1793086772001', 50, 19, 177, 'CONCESIONARIA INTEGRAL - INTERVIAS - S.A.', 'INTERVIAS - E/P JAIME ROLDOS AGUILERA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (734, 'P', 1, '0501054753001', 50, 19, 177, 'HUILCAMAIGUA DIAZ LUZ AURORA', 'ESTACION DE SERVICIO EL MIRADOR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (735, 'P', 1, '0703492405001', 50, 19, 177, 'VERA CALDERON CARLOS IVAN', 'HOTEL VEUXOR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (736, 'P', 1, '0922875703001', 50, 19, 177, 'GONZALES PAREDES LUIS ALFONSO', 'GASOLINERA EL OSO AGENTE DE RETENCION NAC-DNCRASC20-00000001 ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (737, 'P', 1, '2390039045001', 50, 19, 177, 'ESTACION DE SERVICIO LA AMERICANA MATNOG CIA.LTDA.', 'ESTACION DE SERVICIO LA AMERICANA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (738, 'P', 1, '0500466883001', 50, 19, 177, 'PALMA HERRERA CESAR AUGUSTO', 'ESTACION DE SERVICIO PANAMERICANA CENTRO NORTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (739, 'P', 1, '0301579199001', 50, 19, 177, 'ZUNA ARGUDO EDWIN EDUARDO', 'ZUNA ARGUDO EDWIN EDUARDO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (740, 'P', 1, '1707847792001', 50, 19, 177, 'EGAS ESCOBAR PATRICIO MANUEL', '1707847792001', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (741, 'P', 2, '0705368934', 50, 19, 177, 'FLORES ESPINOZA DIEGO VICENTE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (742, 'P', 1, '1600234072001', 50, 19, 177, 'PROANO ACOSTA JORGE LUIS', 'PRIMAX PATRICIA PILAR', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (743, 'P', 1, '0791830389001', 50, 19, 177, 'CORDOES CIA. LTDA.', 'ESTACION DE SERVICIO \"RIO BONITO\"', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (744, 'P', 1, '1792757827001', 50, 19, 177, 'MONOBOLON CIA.LTDA.', 'MONOBOLON', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (745, 'P', 1, '2300137912001', 50, 19, 177, 'LOOR MUÑOZ THALIA STELA', 'VULCANIZADORA Y ENGRASADORA MATIAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (746, 'P', 1, '0603857657001', 50, 19, 177, 'AUTO ACCESORIOS JUNIOR', '', '', '0997243944 NARANJAL', 'importproa-facturacion@outlook.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (747, 'P', 2, '1002095519', 50, 19, 177, 'REVELO PUETATE MARCO JAVIER', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (748, 'P', 1, '1805009477001', 50, 19, 177, 'CHICAIZA MOSQUERA JORGE LUIS', 'LA SANTISIMA CRUZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (749, 'P', 2, '1804190385', 50, 19, 177, 'CHAVEZ MARTINEZ ANDRES PATRICIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (750, 'P', 2, '1725505406', 50, 19, 177, 'CACHIPUENDO ALBAMOCHO LUIS FERNANDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (751, 'P', 2, '1705654364', 50, 19, 177, 'LEON SERRANO GONZALO CAYETANO CAMILO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (752, 'P', 1, '0909740987001', 50, 19, 177, 'PEÑA QUINTO FRANCISCO', 'EL BIGOTE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (753, 'P', 1, '0930708177001', 50, 19, 177, 'LLANGARI CACOANGO BENJAMIN WASHINGTON', 'ESTACION DE SERVICIO DON OLE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (754, 'P', 1, '0601773864001', 50, 19, 177, 'MEDINA SANCHEZ WASHINGTON CRISTOBAL', 'AUTOLUBRICANTES DE LA SIERRA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (755, 'P', 1, '0591733095001', 50, 19, 177, 'SERVICIOS Y SOLUCIONES DE GESTION EMPRESARIAL CSGE CIA. LTDA.', 'SAGA LATAM', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (756, 'P', 2, '1700700600', 50, 19, 177, 'ROSERO ARIZZO GUILLERMO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (757, 'P', 1, '1791817680001', 50, 19, 177, 'SOCIEDAD DE  LUCHA CONTRA EL CANCER', 'SOLCA', '', '276 1828 276 0053', 'solcaqui@ec.net.ec', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (758, 'P', 1, '1722431903001', 50, 19, 177, 'CHAMORRO LARA ROBERT ALEJANDRO', '', '', '0998029921', 'robert.chamorro1996@gmail.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (759, 'P', 1, '1708759590001', 50, 19, 177, 'YUGSI GUANIN SEGUNDO OSWALDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (760, 'P', 1, '1707809909001', 50, 19, 177, 'GALARRAGA SANTAMARIA HECTOR EDUARDO', 'MULTIESTACION DE SERVICIOS LA JOYA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (761, 'P', 1, '1753983103001', 50, 19, 177, 'ENRIQUEZ PAREDES JONATHAN ERICK', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (762, 'P', 2, '1706867056', 50, 19, 177, 'SANCHEZ CALERO NELSON EDUARDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (763, 'P', 1, '0501092704001', 50, 19, 177, 'TORO VASCO GREGORIO PATRICIO', 'ESTACIÓN DE SERVICIO LA ARGENTINA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (764, 'P', 1, '1206374322001', 50, 19, 177, 'CASTILLO LOPEZ KARLA MAYTE', 'ESTACION DE SERVICIO VENTANAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (765, 'P', 1, '1704004660001', 50, 19, 177, 'GUAÑA CEVALLOS LIDA GRIMANESA', 'ESTACIÓN DE SERVICIO ASCÃZUBI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (766, 'P', 1, '1700161183001', 50, 19, 177, 'JEREZ PAREDES LUIS ANIBAL', 'JR DISTRIBUCIONES', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (767, 'P', 2, '1500956329', 50, 19, 177, 'MARTINEZ HERMIDA JOHANNA LISSBETH', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (768, 'P', 1, '1723270383001', 50, 19, 177, 'RISUEÑO ZAMBRANO LEONARDO FABIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (769, 'P', 1, '0791819091001', 50, 19, 177, 'PROSERSUR AGROMERCANTIL SA', 'PROSERSUR AGROMERCANTIL SA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (770, 'P', 2, '1701456673', 50, 19, 177, 'ALBUJA GUA?A MARIA INES', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (771, 'P', 2, '0605689892', 50, 19, 177, 'AILLON NUGSHI JOSE VIRGILIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (772, 'P', 1, '1719398040001', 50, 19, 177, 'COLLAGUAZO RODRIGUEZ ALEX JUAN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (773, 'P', 1, '1710784347001', 50, 19, 177, 'ORBEA DONOSO LIGIA XIMENA', 'ORBEA DONOSO LIGIA XIMENA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (774, 'P', 1, '0601420409001', 50, 19, 177, 'GUAINA QUISHPI MIGUEL', 'ALMACEN LA HERRAMIENTA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (775, 'P', 1, '1800312736001', 50, 19, 177, 'VALVERDE GUEVARA LUCILA ELOINA', 'GASOLINERA AVELINO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (776, 'P', 1, '0993356689001', 50, 19, 177, 'DTA - MUZAS S A S ', 'DTA - MUZAS S A S ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (777, 'P', 1, '1718117540001', 50, 19, 177, 'TENESACA CARDENAS XAVIER EDUARDO', '', '', '2837446 0984141598', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (778, 'P', 1, '1792677610001', 50, 19, 177, 'DISTRIBUIDORA DE PRODUCTOS AVICOLAS LOPEZ MARTINEZ DIPROAVILM CIA.LTDA.', '', '', '0996213701', 'jlopez@diporavilm.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (779, 'P', 2, '0400935516', 50, 19, 177, 'HERNANDEZ CUPACAN MILTON JAVIER', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (780, 'P', 1, '1713337226001', 50, 19, 177, 'EGAS GONZALES ANGELICA MARIA', 'PAPELERIA EL CONOCIMIENTO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (781, 'P', 2, '0941695082', 50, 19, 177, 'LEMACHE ZHUMI HENRY DAVID', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (782, 'P', 2, '1718304965', 50, 19, 177, 'RISUENO ZAPATA EVELYN GABRIELA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (783, 'P', 1, '0400089132001', 50, 19, 177, 'GAVILANES PADILLA LUZ MARIA', 'LUBRITYRE MATTFEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (784, 'P', 1, '0601598196001', 50, 19, 177, 'VERA VALLADARES KLEVER HERNAN', '.COMERCIAL VERA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (785, 'P', 1, '0601789407001', 50, 19, 177, 'ZABALA ARELLANO EDGAR GERMAN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (786, 'P', 2, '0400344586', 50, 19, 177, 'ROMO JIMENEZ BERTHA ALICIA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (787, 'P', 2, '0914543806', 50, 19, 177, 'NARANJO ESCOBAR MARIANA DE JESUS', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (788, 'P', 1, '1002286357001', 50, 19, 177, 'LUNA ACOSTA MIRNA MARIANNELA', 'ESTACION DE SERVICIO LA FLORIDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (789, 'P', 2, '0200678225', 50, 19, 177, 'VASCONEZ CAICEDO MARTHA SUSANA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (790, 'P', 1, '1718371097001', 50, 19, 177, 'BERTHA LUCIA TINAJERO CISNEROS', 'EDS SENSACION', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (791, 'P', 2, '0704036482', 50, 19, 177, 'LOAYZA MACAS PATRICK EFREN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (792, 'P', 1, '0991280472001', 50, 19, 177, 'COOPERATIVA TRANSPORTES BRISAS DE SANTAY PANORAMA', 'ESTACION DE SERVICIO PANORAMA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (793, 'P', 1, '1001705399001', 50, 19, 177, 'SANTIAGO FEDERICO GUERRON AYALA', 'SANTIAGO FEDERICO GUERRON AYALA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (794, 'P', 1, '1791436156001', 50, 19, 177, 'EPSTEIN CIA. LTDA.', 'EPSTEIN DIGIDOC', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (795, 'P', 1, '0992663235001', 50, 19, 177, 'REPRESENTACIONES ORDONEZ Y NEGRETE S.A. REPORNE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (796, 'P', 1, '1720993060001', 50, 19, 177, 'PIZARA VACA ESTELA ROSARIO', 'INNOVALAB - SAN GABRIEL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (797, 'P', 1, '1703606002001', 50, 19, 177, 'ACOSTA RODRIGUEZ MARIO ANIBAL', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (798, 'P', 1, '1792072018001', 50, 19, 177, 'DELI INTERNACIONAL S.A.', 'TROPI BURGER                           ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (799, 'P', 1, '1713849220001', 50, 19, 177, 'QUINCHIGUANGO PEREZ SEGUNDO MESIAS', 'DISMACERO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (800, 'P', 1, '0502060957001', 50, 19, 177, 'VELOZ MALAVE HUGO VINICIO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (801, 'P', 1, '1792019761001', 50, 19, 177, 'AUTOELEVACION CIA LTDA', 'AUTOELEVACION CIA LTDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (802, 'P', 1, '1792541743001', 50, 19, 177, 'AUTOPARTES Y AUTOGRUAS FCN S.A.', 'AUTOPARTES Y AUTOGRUAS FCN S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (803, 'P', 1, '1792573009001', 50, 19, 177, 'TACONAZO RESTAURANTES Y BEBIDAS VILLAGRANMOLINEROS S.A', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (804, 'P', 1, '0190381633001', 50, 19, 177, 'NOVACREDIT S.A.', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (805, 'P', 1, '1725601494001', 50, 19, 177, 'DE LA CRUZ CEDE?O GENESIS JOANA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (806, 'P', 1, '1760004650001', 50, 19, 177, 'INSTITUTO ECUATORIANO DE SEGURIDAD SOCIAL IESS', '', '', '3730800', 'patjuddpg@iess.gob.ecmaria.burgos@iess.gob.ec', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (807, 'P', 1, '1719884502001', 50, 19, 177, 'PADILLA VELEPUCHA ROSA MARIA', '', '', '0984141598', 'zonacar2022@hotmail.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (808, 'P', 1, '1723014179001', 50, 19, 177, 'MUÑOZ GARCIA BRYAN XAVIER', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (809, 'P', 2, '1724072135', 50, 19, 177, 'SABANDO MOREIRA LEONELA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (810, 'P', 1, '1091796549001', 50, 19, 177, 'FRITADASAMAZONAS S.A.S.', 'FRITADAS AMAZONAS', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (811, 'P', 1, '1792413303001', 50, 19, 177, 'AEROQUITOSERV S.A', 'ESTACION DE SERVICIO AEROPUERTO MARISCAL SUCRE', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (812, 'P', 2, '1713803870', 50, 19, 177, 'PABON SIMBAÑA MANUEL MESIAS', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (813, 'P', 1, '0501577829001', 50, 19, 177, 'CHANGOLUISA DEFAZ ANA MARIA', 'CHANGOLUISA DEFAZ ANA MARIA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (814, 'P', 1, '1792221676001', 50, 19, 177, 'COMBUSTIBLES Y AFINES BARBA Y VIZCARRA SA', 'E/S PINSAQUI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (815, 'P', 1, '1310017791001', 50, 19, 177, 'ZAMBRANO VELIZ NILSON RAMON', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (816, 'P', 1, '0500920061001', 50, 19, 177, 'PORRAS GARZON FRANCISCO HUMBERTO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (817, 'P', 2, '0450209267', 50, 19, 177, 'CORAL ESCOBAR KEVIN ALBEIRO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (818, 'P', 2, '0957506876', 50, 19, 177, 'NOHELY DENNISSE ARELLANO SOLEDISPA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (819, 'P', 2, '0923997027', 50, 19, 177, 'QUIU00D1ONEZ GUAMAN GUILLERMO ANDRES', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (820, 'P', 1, '1716416910001', 50, 19, 177, 'NOROÑA CALVACHI HENRY PAUL', 'NOROÑA CALVACHI HENRY PAUL', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (821, 'P', 1, '1793170099001', 50, 19, 177, 'REMOLQUESNORONA CIA LTDA', 'REMOLQUES NOROÑA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (822, 'P', 1, '1002181202001', 50, 19, 177, 'ALDAS ILES AIDA LUCINDA', 'EL PERNO.COM FERRETERIA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (823, 'P', 1, '1792680123001', 50, 19, 177, 'SOCIEDAD ECUATORIANA DE PETREOS S.C.C ECUAPET', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (824, 'P', 1, '2300541493001', 50, 19, 177, 'AGUILAR NAJERA ANTHONY  EDUARDO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (825, 'P', 2, '1712481090', 50, 19, 177, 'CRESPO ARIAS DIEGO VINICIO', '', '', '0993450844 0', 'diegocrespoarias@psdiegocrespo.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (826, 'P', 1, '1792107423001', 50, 19, 177, 'SWEADEN COMPANIA DE SEGUROS S.A.', 'SWEADEN COMPANIA DE SEGUROS S.A.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (827, 'P', 1, '2390626854001', 50, 19, 177, 'PALZAM CIA.LTDA.', 'PALZAM CIA.LTDA.', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (828, 'P', 2, '1722200282', 50, 19, 177, 'TARAPUES GUERRERO KATTY FERNANDA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (829, 'P', 2, '1720016201', 50, 19, 177, 'YUGSI ZAMBRANO BYRON FABIAN', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (830, 'P', 1, '1792118085001', 50, 19, 177, 'RUEDA GARANTIZADA RUEDAGAR CIA LTDA', 'RUEDA GARANTIZADA RUEDAGAR CIA LTDA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (831, 'P', 2, '1714537501', 50, 19, 177, 'CUSHICONDOR CASAMEN LIGIA ELENA', '', '', '0992614324', 'alannys-cc2012@hotmail.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (832, 'P', 2, '1714226840', 50, 19, 177, 'BRAVO BRAVO YANET GUADALUPE', 'MINIMARKET M&M', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (833, 'P', 2, '1707250161', 50, 19, 177, 'COM Y LUBRI', '', '', '2383-306 PINTAG', 'importproa-facturacion@outlook.com', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (834, 'P', 1, '1717387698001', 50, 19, 177, 'QUILUMBA ZAMORA LUIS EDUARDO', 'VULCANIZADORA CHIGUILPE', '', '0', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (835, 'P', 1, '1792969107001', 50, 19, 177, 'SOCIEDAD CIVIL Y MERCANTIL AUTOSERVICIO POMASQUI', 'AUTOSERVICIO POMASQUI', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (836, 'P', 1, '1717621054001', 50, 19, 177, 'BUNGACHO SANDOVAL XIMENA MARIELA', 'CT.HYDRAULIC', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (837, 'P', 2, '0400081691', 50, 19, 177, 'BRACHO GUZMAN ROSA AIDA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (838, 'P', 1, '1702832658001', 50, 19, 177, 'PAVON VINUEZA NESTOR EUCLIDES', 'IMPORFRENO', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (839, 'P', 1, '1001965019001', 50, 19, 177, 'FUELTALA POZO NELBA ESPERANZA', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (840, 'P', 1, '0591712969001', 50, 19, 177, 'TRUCKDIESEL IMPORTADORES S.A.', '', '', '032801998 0998701856', 'conta_sto@truckdiesel.com.ec;edison@truckdiesel.com.ec', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (841, 'P', 1, '1711192656001', 50, 19, 177, 'HUERTAS CADENA ADRIANA DE LAS MERCEDES', 'ADRIANITA MISHELL LUBRICADORA', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (842, 'P', 1, '1707539340001', 50, 19, 177, 'GUAMAN LOPEZ GLADYS MARLENE', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (843, 'P', 2, '1723437354', 50, 19, 177, 'SANCHEZ FIERRO MARCO VINICIO                      ', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (844, 'P', 2, '1711364826', 50, 19, 177, 'PAEZ CARRERA LUIS ANTONIO', 'AUTOMOTOREZ PAEZ', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (845, 'P', 2, '1708065097', 50, 19, 177, 'PONCE JARRIN FREDY ALBERTO', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (846, 'P', 2, '1725094591', 50, 19, 177, 'CACUANGO CATUCUAMBA LUIS DANIEL                   ', '', '', '', '', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (847, 'P', 1, '0992745762001', 50, 19, 177, 'MOTORES Y TRACTORES MOTRAC S.A.', '', '', '022427410', 'pruilova@motrac.ec', '', '', 0.00, 0, '', '2024-08-10 01:44:56', '2024-08-10 01:44:56', NULL);
INSERT INTO `beneficiary` VALUES (848, 'C', 2, '1712030368', 50, 5, 35, 'SANTIAGO BORJA ROMERO', 'LOCO', 'Espejo y Mexico', '099598412', 'san@bo.com', 'tuweb.com', 'Velazco', 1000.00, 100, '1.1.1.01.001', '2024-08-10 03:32:02', '2024-08-23 21:02:44', '2024-08-10 04:00:39');
INSERT INTO `beneficiary` VALUES (849, 'C', 1, '1712030368001', 50, 5, 35, 'SANTIAGO BORJA', '6UG8', 'Especjo', '', '', '', 'VIll', 0.00, 0, '', '2024-08-10 03:42:33', '2024-08-10 04:00:45', '2024-08-10 04:00:45');
INSERT INTO `beneficiary` VALUES (850, 'A', 2, '1712030368', 50, 5, 35, 'SANTIAGO BORJA ROMERO', 'LOCO', 'Espejo y Mexico', '', '', '', 'Velazco', 0.00, 0, '', '2024-08-12 13:26:31', '2024-08-23 21:02:44', NULL);
INSERT INTO `beneficiary` VALUES (851, 'P', 1, '1712030368S', 50, 5, 35, 'SANTIAGO BORJA ROMERO', 'LOCO', 'Espejo y Mexico', '', '', '', 'Velazco', 0.00, 0, '', '2024-08-12 13:31:16', '2024-08-12 13:31:16', NULL);
INSERT INTO `beneficiary` VALUES (852, 'E', 1, '1792677610001', 50, 19, 177, 'DIPROAVILM', 'DIPROAVILM', '', '', '', '', '', 0.00, 0, '', '2024-08-19 15:29:13', '2024-08-24 00:33:11', NULL);

-- ----------------------------
-- Table structure for bot_audit
-- ----------------------------
DROP TABLE IF EXISTS `bot_audit`;
CREATE TABLE `bot_audit`  (
  `idbotaudit` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL DEFAULT 0,
  `textentered` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `keyresult` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idbotaudit`) USING BTREE,
  INDEX `FkUser`(`iduser` ASC) USING BTREE,
  CONSTRAINT `FkUser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bot_audit
-- ----------------------------
INSERT INTO `bot_audit` VALUES (77, 6, 'menu', 'menu', NULL, '2024-07-05 11:15:00');
INSERT INTO `bot_audit` VALUES (80, 6, 'menu', 'menu', NULL, '2024-07-05 11:27:07');
INSERT INTO `bot_audit` VALUES (81, 6, 'reportes', 'reportes', NULL, '2024-07-05 11:32:28');
INSERT INTO `bot_audit` VALUES (83, 6, 'ayuda', 'ayuda', NULL, '2024-07-05 11:39:30');
INSERT INTO `bot_audit` VALUES (84, 6, 'menu', 'menu', NULL, '2024-07-05 11:39:34');
INSERT INTO `bot_audit` VALUES (85, 6, 'reportes', 'reportes', NULL, '2024-07-05 11:39:36');
INSERT INTO `bot_audit` VALUES (86, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-05 11:39:38');
INSERT INTO `bot_audit` VALUES (87, 6, 'lista_stock', 'lista_existencias', NULL, '2024-07-05 11:39:41');
INSERT INTO `bot_audit` VALUES (88, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 11:39:44');
INSERT INTO `bot_audit` VALUES (89, 6, 'buenos dias', 'saludo', NULL, '2024-07-05 11:42:43');
INSERT INTO `bot_audit` VALUES (90, 6, 'buenas tardes', 'saludo', NULL, '2024-07-05 11:42:54');
INSERT INTO `bot_audit` VALUES (91, 6, 'menu', 'menu', NULL, '2024-07-05 11:43:00');
INSERT INTO `bot_audit` VALUES (93, 6, 'reportes', 'reportes', NULL, '2024-07-05 11:47:41');
INSERT INTO `bot_audit` VALUES (94, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-05 11:47:44');
INSERT INTO `bot_audit` VALUES (95, 6, 'hello', 'saludo', NULL, '2024-07-05 12:06:25');
INSERT INTO `bot_audit` VALUES (99, 6, 'menu', 'menu', NULL, '2024-07-05 12:22:33');
INSERT INTO `bot_audit` VALUES (100, 6, 'reportes', 'reportes', NULL, '2024-07-05 12:22:36');
INSERT INTO `bot_audit` VALUES (101, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:22:38');
INSERT INTO `bot_audit` VALUES (102, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:25:08');
INSERT INTO `bot_audit` VALUES (103, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:25:42');
INSERT INTO `bot_audit` VALUES (104, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:25:59');
INSERT INTO `bot_audit` VALUES (105, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:30:33');
INSERT INTO `bot_audit` VALUES (106, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:32:44');
INSERT INTO `bot_audit` VALUES (107, 6, 'reportes', 'reportes', NULL, '2024-07-05 12:34:06');
INSERT INTO `bot_audit` VALUES (108, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:35:24');
INSERT INTO `bot_audit` VALUES (109, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:37:52');
INSERT INTO `bot_audit` VALUES (110, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:38:08');
INSERT INTO `bot_audit` VALUES (111, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 12:38:54');
INSERT INTO `bot_audit` VALUES (117, 6, 'hello', 'saludo', NULL, '2024-07-05 14:40:16');
INSERT INTO `bot_audit` VALUES (118, 6, 'hello', 'saludo', NULL, '2024-07-05 14:40:35');
INSERT INTO `bot_audit` VALUES (119, 6, 'hols', 'saludo', NULL, '2024-07-12 17:07:21');
INSERT INTO `bot_audit` VALUES (120, 6, 'como estas', 'saludo', NULL, '2024-07-12 17:07:21');
INSERT INTO `bot_audit` VALUES (121, 6, 'buenos dias', 'saludo', NULL, '2024-07-05 14:41:55');
INSERT INTO `bot_audit` VALUES (122, 6, 'menu', 'menu', NULL, '2024-07-05 14:42:06');
INSERT INTO `bot_audit` VALUES (123, 6, 'reportes', 'reportes', NULL, '2024-07-05 14:42:07');
INSERT INTO `bot_audit` VALUES (124, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-05 14:42:12');
INSERT INTO `bot_audit` VALUES (127, 6, 'hola', 'saludo', NULL, '2024-07-05 14:43:43');
INSERT INTO `bot_audit` VALUES (128, 6, 'menu', 'menu', NULL, '2024-07-05 21:31:41');
INSERT INTO `bot_audit` VALUES (129, 6, 'reportes', 'reportes', NULL, '2024-07-05 21:32:04');
INSERT INTO `bot_audit` VALUES (130, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-05 21:32:07');
INSERT INTO `bot_audit` VALUES (131, 6, 'menu', 'menu', NULL, '2024-07-05 21:32:10');
INSERT INTO `bot_audit` VALUES (132, 6, 'ayuda', 'ayuda', NULL, '2024-07-05 21:32:12');
INSERT INTO `bot_audit` VALUES (133, 6, 'menu', 'menu', NULL, '2024-07-05 21:32:14');
INSERT INTO `bot_audit` VALUES (134, 6, 'reportes', 'reportes', NULL, '2024-07-05 21:32:19');
INSERT INTO `bot_audit` VALUES (135, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-05 21:32:21');
INSERT INTO `bot_audit` VALUES (136, 6, 'menu', 'menu', NULL, '2024-07-05 21:32:29');
INSERT INTO `bot_audit` VALUES (137, 6, 'ayuda', 'ayuda', NULL, '2024-07-05 21:32:31');
INSERT INTO `bot_audit` VALUES (138, 6, 'hello', 'saludo', NULL, '2024-07-09 18:40:14');
INSERT INTO `bot_audit` VALUES (139, 6, 'hello', 'saludo', NULL, '2024-07-09 20:26:53');
INSERT INTO `bot_audit` VALUES (140, 6, 'hola como estas', 'saludo', NULL, '2024-07-09 20:26:57');
INSERT INTO `bot_audit` VALUES (141, 6, 'hola como estas', 'saludo', NULL, '2024-07-09 21:19:13');
INSERT INTO `bot_audit` VALUES (142, 6, 'menu', 'menu', NULL, '2024-07-09 21:19:20');
INSERT INTO `bot_audit` VALUES (143, 6, 'necesito ayuda', 'ayuda', NULL, '2024-07-09 21:19:43');
INSERT INTO `bot_audit` VALUES (144, 6, 'help', 'ayuda', NULL, '2024-07-09 21:19:49');
INSERT INTO `bot_audit` VALUES (145, 6, 'menu', 'menu', NULL, '2024-07-09 21:19:57');
INSERT INTO `bot_audit` VALUES (146, 6, 'listado de productos', 'lista_productos', NULL, '2024-07-09 21:20:06');
INSERT INTO `bot_audit` VALUES (147, 6, 'reportes', 'reportes', NULL, '2024-07-09 21:20:19');
INSERT INTO `bot_audit` VALUES (148, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-09 21:20:22');
INSERT INTO `bot_audit` VALUES (149, 6, 'listado de usuarios', 'lista_usuarios', NULL, '2024-07-09 21:20:36');
INSERT INTO `bot_audit` VALUES (150, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-09 21:20:41');
INSERT INTO `bot_audit` VALUES (151, 6, 'hola', 'saludo', NULL, '2024-07-09 21:34:05');
INSERT INTO `bot_audit` VALUES (152, 6, 'menu', 'menu', NULL, '2024-07-09 21:34:11');
INSERT INTO `bot_audit` VALUES (153, 6, 'reportes', 'reportes', NULL, '2024-07-09 21:34:15');
INSERT INTO `bot_audit` VALUES (154, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-09 21:34:17');
INSERT INTO `bot_audit` VALUES (155, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-09 21:34:21');
INSERT INTO `bot_audit` VALUES (156, 6, 'lista de productos', 'lista_productos', NULL, '2024-07-09 21:34:26');
INSERT INTO `bot_audit` VALUES (157, 6, 'menu', 'menu', NULL, '2024-07-09 21:36:28');
INSERT INTO `bot_audit` VALUES (158, 6, 'ayuda', 'ayuda', NULL, '2024-07-09 21:36:31');
INSERT INTO `bot_audit` VALUES (159, 6, 'menu', 'menu', NULL, '2024-07-09 21:39:54');
INSERT INTO `bot_audit` VALUES (160, 6, 'reportes', 'reportes', NULL, '2024-07-09 21:42:31');
INSERT INTO `bot_audit` VALUES (161, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-09 21:42:35');
INSERT INTO `bot_audit` VALUES (162, 6, 'help', 'ayuda', NULL, '2024-07-09 21:43:39');
INSERT INTO `bot_audit` VALUES (163, 6, 'menu', 'menu', NULL, '2024-07-09 21:43:50');
INSERT INTO `bot_audit` VALUES (164, 6, 'ayuda', 'ayuda', NULL, '2024-07-09 21:45:15');
INSERT INTO `bot_audit` VALUES (165, 6, 'saludo', 'saludo', NULL, '2024-07-09 21:45:22');
INSERT INTO `bot_audit` VALUES (166, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-09 21:45:39');
INSERT INTO `bot_audit` VALUES (167, 6, 'como esta hoy te envio un saludo', 'saludo', NULL, '2024-07-09 21:46:16');
INSERT INTO `bot_audit` VALUES (168, 6, 'lista de productos', 'lista_productos', NULL, '2024-07-09 21:47:02');
INSERT INTO `bot_audit` VALUES (169, 6, 'lista de productos', 'lista_productos', NULL, '2024-07-09 21:47:25');
INSERT INTO `bot_audit` VALUES (170, 6, 'usuarios', 'lista_usuarios', NULL, '2024-07-09 21:47:32');
INSERT INTO `bot_audit` VALUES (174, 7, 'buenos dias', 'saludo', NULL, '2024-07-09 21:50:49');
INSERT INTO `bot_audit` VALUES (175, 7, 'menu', 'menu', NULL, '2024-07-09 21:51:59');
INSERT INTO `bot_audit` VALUES (176, 7, 'ayuda', 'ayuda', NULL, '2024-07-09 21:52:03');
INSERT INTO `bot_audit` VALUES (177, 7, 'menu', 'menu', NULL, '2024-07-09 21:52:13');
INSERT INTO `bot_audit` VALUES (178, 7, 'reportes', 'reportes', NULL, '2024-07-09 21:52:19');
INSERT INTO `bot_audit` VALUES (179, 7, 'lista_productos', 'lista_productos', NULL, '2024-07-09 21:53:03');
INSERT INTO `bot_audit` VALUES (180, 6, 'saludo como estas', 'saludo', NULL, '2024-07-09 21:53:27');
INSERT INTO `bot_audit` VALUES (181, 6, 'hola', 'saludo', NULL, '2024-07-09 21:53:46');
INSERT INTO `bot_audit` VALUES (182, 6, 'hola', 'saludo', NULL, '2024-07-09 21:53:49');
INSERT INTO `bot_audit` VALUES (183, 6, 'hi', 'saludo', NULL, '2024-07-09 21:53:51');
INSERT INTO `bot_audit` VALUES (184, 6, 'hello', 'saludo', NULL, '2024-07-09 21:53:53');
INSERT INTO `bot_audit` VALUES (185, 6, 'hola', 'saludo', NULL, '2024-07-09 21:54:25');
INSERT INTO `bot_audit` VALUES (186, 8, 'help', 'ayuda', NULL, '2024-07-09 21:57:28');
INSERT INTO `bot_audit` VALUES (187, 8, 'menu', 'menu', NULL, '2024-07-09 21:57:38');
INSERT INTO `bot_audit` VALUES (188, 8, 'reportes', 'reportes', NULL, '2024-07-09 21:57:47');
INSERT INTO `bot_audit` VALUES (189, 8, 'hola', 'saludo', NULL, '2024-07-09 21:58:07');
INSERT INTO `bot_audit` VALUES (190, 6, 'saludos', 'saludo', NULL, '2024-07-10 01:11:07');
INSERT INTO `bot_audit` VALUES (191, 6, 'menu', 'menu', NULL, '2024-07-10 02:15:07');
INSERT INTO `bot_audit` VALUES (192, 6, 'ayuda', 'ayuda', NULL, '2024-07-10 02:15:14');
INSERT INTO `bot_audit` VALUES (193, 6, 'menu', 'menu', NULL, '2024-07-10 02:15:18');
INSERT INTO `bot_audit` VALUES (194, 6, 'reportes', 'reportes', NULL, '2024-07-10 02:15:20');
INSERT INTO `bot_audit` VALUES (195, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 02:15:22');
INSERT INTO `bot_audit` VALUES (196, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-10 02:15:25');
INSERT INTO `bot_audit` VALUES (197, 6, 'saludos cordiales', 'saludo', NULL, '2024-07-10 02:21:26');
INSERT INTO `bot_audit` VALUES (198, 6, 'menu', 'menu', NULL, '2024-07-10 02:22:37');
INSERT INTO `bot_audit` VALUES (199, 6, 'reportes', 'reportes', NULL, '2024-07-10 02:25:47');
INSERT INTO `bot_audit` VALUES (200, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 02:26:50');
INSERT INTO `bot_audit` VALUES (201, 6, 'menu', 'menu', NULL, '2024-07-10 02:27:51');
INSERT INTO `bot_audit` VALUES (202, 6, 'ayuda', 'ayuda', NULL, '2024-07-10 02:30:20');
INSERT INTO `bot_audit` VALUES (203, 6, 'ayuda', 'ayuda', NULL, '2024-07-10 02:32:49');
INSERT INTO `bot_audit` VALUES (204, 6, 'menu', 'menu', NULL, '2024-07-10 02:33:15');
INSERT INTO `bot_audit` VALUES (205, 6, 'ayuda', 'ayuda', NULL, '2024-07-10 02:33:53');
INSERT INTO `bot_audit` VALUES (206, 6, 'menu', 'menu', NULL, '2024-07-10 02:34:03');
INSERT INTO `bot_audit` VALUES (207, 6, 'reportes', 'reportes', NULL, '2024-07-10 02:34:10');
INSERT INTO `bot_audit` VALUES (208, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 02:34:56');
INSERT INTO `bot_audit` VALUES (209, 6, 'menu', 'menu', NULL, '2024-07-10 02:35:14');
INSERT INTO `bot_audit` VALUES (210, 6, 'ayuda', 'ayuda', NULL, '2024-07-10 02:35:45');
INSERT INTO `bot_audit` VALUES (211, 6, 'menu', 'menu', NULL, '2024-07-10 02:36:18');
INSERT INTO `bot_audit` VALUES (212, 6, 'ayuda', 'ayuda', NULL, '2024-07-10 02:36:20');
INSERT INTO `bot_audit` VALUES (213, 6, 'menu', 'menu', NULL, '2024-07-10 02:36:23');
INSERT INTO `bot_audit` VALUES (214, 6, 'reportes', 'reportes', NULL, '2024-07-10 02:36:24');
INSERT INTO `bot_audit` VALUES (215, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 02:36:26');
INSERT INTO `bot_audit` VALUES (216, 6, 'lista_usuarios', 'lista_usuarios', NULL, '2024-07-10 02:36:29');
INSERT INTO `bot_audit` VALUES (217, 6, 'quisiera saber la lista de productos que tiene disponible', 'lista_productos', NULL, '2024-07-10 02:37:06');
INSERT INTO `bot_audit` VALUES (220, 6, 'menu', 'menu', NULL, '2024-07-10 02:39:53');
INSERT INTO `bot_audit` VALUES (221, 6, 'reportes', 'reportes', NULL, '2024-07-10 02:40:07');
INSERT INTO `bot_audit` VALUES (222, 6, 'lista_stock', 'lista_existencias', NULL, '2024-07-10 02:43:02');
INSERT INTO `bot_audit` VALUES (223, 6, 'lista de stockl', 'lista_productos', NULL, '2024-07-10 02:43:24');
INSERT INTO `bot_audit` VALUES (224, 6, 'menu', 'menu', NULL, '2024-07-10 03:04:28');
INSERT INTO `bot_audit` VALUES (225, 6, 'reportes', 'reportes', NULL, '2024-07-10 03:05:36');
INSERT INTO `bot_audit` VALUES (226, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 03:06:15');
INSERT INTO `bot_audit` VALUES (227, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 03:06:47');
INSERT INTO `bot_audit` VALUES (228, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 03:07:07');
INSERT INTO `bot_audit` VALUES (229, 6, 'lista_productos', 'lista_productos', NULL, '2024-07-10 03:10:05');
INSERT INTO `bot_audit` VALUES (230, 6, 'hey que tal', 'saludo', NULL, '2024-07-12 12:18:35');
INSERT INTO `bot_audit` VALUES (231, 6, 'hey como estas', 'saludo', '{\"message_id\": 114, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720805021, \"text\": \"hey como estas\"}', '2024-07-12 12:23:40');
INSERT INTO `bot_audit` VALUES (232, 6, 'hey como estas', 'saludo', '{\"message_id\": 115, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720805361, \"text\": \"hey como estas\"}', '2024-07-12 12:29:21');
INSERT INTO `bot_audit` VALUES (233, 6, 'hey como estas', 'saludo', '{\"message_id\": 116, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720805455, \"text\": \"hey como estas\"}', '2024-07-12 12:30:54');
INSERT INTO `bot_audit` VALUES (234, 6, 'hola', 'saludo', '{\"message_id\": 118, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720805802, \"text\": \"hola\"}', '2024-07-12 12:36:41');
INSERT INTO `bot_audit` VALUES (235, 6, 'saludos como estas', 'saludo', '{\"message_id\": 133, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720808896, \"text\": \"saludos como estas\"}', '2024-07-12 13:28:16');
INSERT INTO `bot_audit` VALUES (236, 6, 'menu', 'saludo', '{\"message_id\": 136, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720809189, \"text\": \"/menu\", \"entities\": [{\"offset\": 0, \"length\": 5, \"type\": \"bot_command\"}]}', '2024-07-12 13:33:09');
INSERT INTO `bot_audit` VALUES (237, 6, 'reportes de productos', 'lista_productos', '{\"message_id\": 139, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720813504, \"text\": \"reportes de productos\"}', '2024-07-12 14:45:04');
INSERT INTO `bot_audit` VALUES (238, 6, 'lista de productos', 'lista_productos', '{\"message_id\": 141, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720813572, \"text\": \"lista de productos\"}', '2024-07-12 14:46:11');
INSERT INTO `bot_audit` VALUES (239, 6, 'lista de productos', 'lista_productos', '{\"message_id\": 143, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720813629, \"text\": \"lista de productos\"}', '2024-07-12 14:47:08');
INSERT INTO `bot_audit` VALUES (240, 6, 'reporte de productos', 'lista_productos', '{\"message_id\": 145, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720813722, \"text\": \"reporte de productos\"}', '2024-07-12 14:48:42');
INSERT INTO `bot_audit` VALUES (241, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 147, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720814242, \"text\": \"listado de productos\"}', '2024-07-12 14:57:22');
INSERT INTO `bot_audit` VALUES (242, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 149, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720814281, \"text\": \"listado de productos\"}', '2024-07-12 14:58:01');
INSERT INTO `bot_audit` VALUES (243, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 152, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720814511, \"text\": \"listado de productos\"}', '2024-07-12 15:01:51');
INSERT INTO `bot_audit` VALUES (244, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 155, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720814953, \"text\": \"listado de productos\"}', '2024-07-12 15:14:36');
INSERT INTO `bot_audit` VALUES (245, 6, 'listado productos', 'lista_productos', '{\"message_id\": 156, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815231, \"text\": \"listado productos\"}', '2024-07-12 15:14:37');
INSERT INTO `bot_audit` VALUES (246, 6, 'gracias', 'saludo', '{\"message_id\": 163, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815446, \"text\": \"gracias\"}', '2024-07-12 15:17:26');
INSERT INTO `bot_audit` VALUES (247, 6, 'menu', 'saludo', '{\"message_id\": 166, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815513, \"text\": \"/menu\", \"entities\": [{\"offset\": 0, \"length\": 5, \"type\": \"bot_command\"}]}', '2024-07-12 15:18:33');
INSERT INTO `bot_audit` VALUES (248, 6, 'menu', 'saludo', '{\"message_id\": 169, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815519, \"text\": \"menu\"}', '2024-07-12 15:18:39');
INSERT INTO `bot_audit` VALUES (249, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 172, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815711, \"text\": \"listado de usuarios\"}', '2024-07-12 15:21:50');
INSERT INTO `bot_audit` VALUES (250, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 175, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815722, \"text\": \"listado de productos\"}', '2024-07-12 15:22:02');
INSERT INTO `bot_audit` VALUES (251, 6, 'menu', 'saludo', '{\"message_id\": 179, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815841, \"text\": \"/menu\", \"entities\": [{\"offset\": 0, \"length\": 5, \"type\": \"bot_command\"}]}', '2024-07-12 15:24:01');
INSERT INTO `bot_audit` VALUES (252, 6, 'ayuda', 'ayuda', '{\"message_id\": 182, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815848, \"text\": \"/ayuda\", \"entities\": [{\"offset\": 0, \"length\": 6, \"type\": \"bot_command\"}]}', '2024-07-12 15:24:07');
INSERT INTO `bot_audit` VALUES (253, 6, 'menu', 'saludo', '{\"message_id\": 185, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815856, \"text\": \"/menu\", \"entities\": [{\"offset\": 0, \"length\": 5, \"type\": \"bot_command\"}]}', '2024-07-12 15:24:16');
INSERT INTO `bot_audit` VALUES (254, 6, 'gracias', 'saludo', '{\"message_id\": 188, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815861, \"text\": \"gracias\"}', '2024-07-12 15:24:21');
INSERT INTO `bot_audit` VALUES (255, 6, 'muy gentil', 'saludo', '{\"message_id\": 191, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720815869, \"text\": \"muy gentil\"}', '2024-07-12 15:24:28');
INSERT INTO `bot_audit` VALUES (256, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 194, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720816160, \"text\": \"listado de productos\"}', '2024-07-12 15:29:20');
INSERT INTO `bot_audit` VALUES (257, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 198, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720816281, \"text\": \"listado de usuarios\"}', '2024-07-12 15:31:21');
INSERT INTO `bot_audit` VALUES (258, 6, 'lista_usuarios', 'lista_usuarios', '{\"message_id\": 201, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720816353, \"text\": \"lista_usuarios\"}', '2024-07-12 15:32:33');
INSERT INTO `bot_audit` VALUES (259, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 204, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720816423, \"text\": \"listado de usuarios\"}', '2024-07-12 15:33:43');
INSERT INTO `bot_audit` VALUES (260, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 207, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720816452, \"text\": \"listado de usuarios\"}', '2024-07-12 15:34:11');
INSERT INTO `bot_audit` VALUES (261, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 210, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720816520, \"text\": \"listado de usuarios\"}', '2024-07-12 15:35:20');
INSERT INTO `bot_audit` VALUES (262, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 214, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720816599, \"text\": \"listado de usuarios\"}', '2024-07-12 15:36:38');
INSERT INTO `bot_audit` VALUES (263, 6, 'chao', 'saludo', '{\"message_id\": 218, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817014, \"text\": \"chao\"}', '2024-07-12 15:43:34');
INSERT INTO `bot_audit` VALUES (264, 6, 'chao', 'saludo', '{\"message_id\": 221, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817036, \"text\": \"chao\"}', '2024-07-12 15:43:56');
INSERT INTO `bot_audit` VALUES (265, 6, 'me despido', 'saludo', '{\"message_id\": 224, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817043, \"text\": \"me despido\"}', '2024-07-12 15:44:03');
INSERT INTO `bot_audit` VALUES (266, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 227, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817054, \"text\": \"lista de usuarios\"}', '2024-07-12 15:44:14');
INSERT INTO `bot_audit` VALUES (267, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 231, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817070, \"text\": \"listado de usuarios\"}', '2024-07-12 15:44:30');
INSERT INTO `bot_audit` VALUES (268, 6, 'listado de productows', 'saludo', '{\"message_id\": 235, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817336, \"text\": \"listado de productows\"}', '2024-07-12 15:48:55');
INSERT INTO `bot_audit` VALUES (269, 6, 'listado de producto', 'saludo', '{\"message_id\": 235, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817336, \"edit_date\": 1720817340, \"text\": \"listado de producto\"}', '2024-07-12 15:48:59');
INSERT INTO `bot_audit` VALUES (270, 6, 'listado de productos', 'saludo', '{\"message_id\": 240, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817346, \"text\": \"listado de productos\"}', '2024-07-12 15:49:06');
INSERT INTO `bot_audit` VALUES (271, 6, 'lista de proditos', 'saludo', '{\"message_id\": 243, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817353, \"text\": \"lista de proditos\"}', '2024-07-12 15:49:13');
INSERT INTO `bot_audit` VALUES (272, 6, 'productos', 'saludo', '{\"message_id\": 246, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817357, \"text\": \"productos\"}', '2024-07-12 15:49:17');
INSERT INTO `bot_audit` VALUES (273, 6, 'usuarios', 'lista_usuarios', '{\"message_id\": 249, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817361, \"text\": \"usuarios\"}', '2024-07-12 15:49:21');
INSERT INTO `bot_audit` VALUES (274, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 253, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817395, \"text\": \"listado de usuarios\"}', '2024-07-12 15:49:55');
INSERT INTO `bot_audit` VALUES (275, 6, 'lista de productos', 'lista_productos', '{\"message_id\": 257, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817477, \"text\": \"lista de productos\"}', '2024-07-12 15:51:17');
INSERT INTO `bot_audit` VALUES (276, 6, 'menu', 'menu', '{\"message_id\": 261, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817597, \"text\": \"/menu\", \"entities\": [{\"offset\": 0, \"length\": 5, \"type\": \"bot_command\"}]}', '2024-07-12 15:53:16');
INSERT INTO `bot_audit` VALUES (277, 6, 'reportes', 'reportes', '{\"message_id\": 264, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817688, \"text\": \"/reportes\", \"entities\": [{\"offset\": 0, \"length\": 9, \"type\": \"bot_command\"}]}', '2024-07-12 15:54:47');
INSERT INTO `bot_audit` VALUES (278, 6, 'lista_productos afrecho', 'lista_productos', '{\"message_id\": 267, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817713, \"text\": \"lista_productos afrecho\"}', '2024-07-12 15:55:12');
INSERT INTO `bot_audit` VALUES (279, 6, 'me gustaria tener reportes de preductos', 'lista_productos', '{\"message_id\": 271, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817876, \"text\": \"me gustaria tener reportes de preductos\"}', '2024-07-12 17:05:07');
INSERT INTO `bot_audit` VALUES (280, 6, 'reporte de productos', 'saludo', '{\"message_id\": 274, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817889, \"text\": \"reporte de productos\"}', '2024-07-12 15:58:09');
INSERT INTO `bot_audit` VALUES (281, 6, 'menu', 'saludo', '{\"message_id\": 277, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720817990, \"text\": \"/menu\", \"entities\": [{\"offset\": 0, \"length\": 5, \"type\": \"bot_command\"}]}', '2024-07-12 15:59:50');
INSERT INTO `bot_audit` VALUES (282, 6, 'menu', 'saludo', '{\"message_id\": 280, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720818025, \"text\": \"/menu\", \"entities\": [{\"offset\": 0, \"length\": 5, \"type\": \"bot_command\"}]}', '2024-07-12 16:00:25');
INSERT INTO `bot_audit` VALUES (283, 6, 'dame ayuda', 'ayuda', '{\"message_id\": 302, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720818391, \"text\": \"dame ayuda\"}', '2024-07-12 16:06:31');
INSERT INTO `bot_audit` VALUES (284, 6, 'necesito una ayuda pro favor', 'ayuda', '{\"message_id\": 305, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720818399, \"text\": \"necesito una ayuda pro favor\"}', '2024-07-12 16:06:39');
INSERT INTO `bot_audit` VALUES (285, 6, 'lista de productos', 'lista_productos', '{\"message_id\": 308, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720818425, \"text\": \"lista de productos\"}', '2024-07-12 17:04:53');
INSERT INTO `bot_audit` VALUES (286, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 311, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720818430, \"text\": \"listado de productos\"}', '2024-07-12 17:04:54');
INSERT INTO `bot_audit` VALUES (287, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 314, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720818441, \"text\": \"listado de productos\"}', '2024-07-12 17:04:55');
INSERT INTO `bot_audit` VALUES (288, 6, 'productos', 'lista_productos', '{\"message_id\": 317, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720818445, \"text\": \"productos\"}', '2024-07-12 17:04:56');
INSERT INTO `bot_audit` VALUES (289, 6, 'hola', 'saludo', '{\"message_id\": 336, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720819476, \"text\": \"Hola\"}', '2024-07-12 16:24:36');
INSERT INTO `bot_audit` VALUES (290, 6, 'as dasd as ads', '', '{\"message_id\": 376, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720821166, \"text\": \"as dasd as ads\"}', '2024-07-12 17:12:50');
INSERT INTO `bot_audit` VALUES (291, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 379, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720821378, \"text\": \"listado de productos\"}', '2024-07-12 17:04:50');
INSERT INTO `bot_audit` VALUES (292, 6, 'lista de productos', 'lista_productos', '{\"message_id\": 382, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720821383, \"text\": \"lista de productos\"}', '2024-07-12 17:04:51');
INSERT INTO `bot_audit` VALUES (293, 6, 'menu', 'saludo', '{\"message_id\": 385, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720821386, \"text\": \"menu\"}', '2024-07-12 16:56:25');
INSERT INTO `bot_audit` VALUES (294, 6, 'lista de productos', 'lista_productos', '{\"message_id\": 402, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720821738, \"text\": \"lista de productos\"}', '2024-07-12 17:04:47');
INSERT INTO `bot_audit` VALUES (295, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 405, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720821745, \"text\": \"listado de productos\"}', '2024-07-12 17:04:45');
INSERT INTO `bot_audit` VALUES (296, 6, 'listado de usuarios', 'lista_usuarios', '{\"message_id\": 408, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720821751, \"text\": \"listado de usuarios\"}', '2024-07-12 17:02:31');
INSERT INTO `bot_audit` VALUES (297, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 417, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720822518, \"text\": \"listado de productos\"}', '2024-07-12 17:15:18');
INSERT INTO `bot_audit` VALUES (299, 6, 'quiero este momento el listado de usuarios', 'lista_productos', '{\"message_id\": 425, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720822991, \"text\": \"quiero este momento el listado de usuarios\"}', '2024-07-12 17:23:11');
INSERT INTO `bot_audit` VALUES (300, 6, 'quiero nuevamente el listado de usuarios', 'lista_productos', '{\"message_id\": 429, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720823045, \"text\": \"quiero nuevamente el listado de usuarios\"}', '2024-07-12 17:24:04');
INSERT INTO `bot_audit` VALUES (301, 6, 'cuando digo usuario es usuarios', 'lista_usuarios', '{\"message_id\": 433, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720823072, \"text\": \"cuando digo usuario es usuarios\"}', '2024-07-12 17:24:32');
INSERT INTO `bot_audit` VALUES (302, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 437, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720823098, \"text\": \"listado de productos\"}', '2024-07-12 17:24:57');
INSERT INTO `bot_audit` VALUES (303, 6, 'como nos encontramos', 'saludo', '{\"message_id\": 441, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720823880, \"text\": \"como nos encontramos\"}', '2024-07-12 17:37:59');
INSERT INTO `bot_audit` VALUES (304, 6, 'dame tus productos', 'lista_productos', '{\"message_id\": 444, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720823887, \"text\": \"dame tus productos\"}', '2024-07-12 17:38:07');
INSERT INTO `bot_audit` VALUES (306, 6, 'necesito las existencias de los productos', 'lista_productos', '{\"message_id\": 452, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720824188, \"text\": \"necesito las existencias de los productos\"}', '2024-07-12 17:43:08');
INSERT INTO `bot_audit` VALUES (307, 6, 'alguna cosa mas', 'saludo', '{\"message_id\": 456, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720824304, \"text\": \"alguna cosa mas\"}', '2024-07-12 17:45:04');
INSERT INTO `bot_audit` VALUES (308, 6, 'chao', 'saludo', '{\"message_id\": 459, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720824308, \"text\": \"chao\"}', '2024-07-12 17:45:08');
INSERT INTO `bot_audit` VALUES (309, 6, 'hola', 'saludo', '{\"message_id\": 475, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720855188, \"text\": \"hola\"}', '2024-07-13 02:19:47');
INSERT INTO `bot_audit` VALUES (310, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 478, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720855196, \"text\": \"listado de productos\"}', '2024-07-13 02:19:55');
INSERT INTO `bot_audit` VALUES (311, 6, 'gracias', 'saludo', '{\"message_id\": 482, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720855204, \"text\": \"gracias\"}', '2024-07-13 02:20:03');
INSERT INTO `bot_audit` VALUES (312, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 495, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720855506, \"text\": \"listado de productos\"}', '2024-07-13 02:25:05');
INSERT INTO `bot_audit` VALUES (313, 6, 'hola', 'saludo', '{\"message_id\": 499, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1720889611, \"text\": \"Hola\"}', '2024-07-13 11:55:25');
INSERT INTO `bot_audit` VALUES (314, 10, 'necesito productos', 'lista_productos', '{\"message_id\": 519, \"from\": {\"id\": 7054851197, \"is_bot\": false, \"first_name\": \"Aly\", \"last_name\": \"Borja\", \"language_code\": \"es\"}, \"chat\": {\"id\": 7054851197, \"first_name\": \"Aly\", \"last_name\": \"Borja\", \"type\": \"private\"}, \"date\": 1720924698, \"text\": \"Necesito productos\"}', '2024-07-13 21:38:18');
INSERT INTO `bot_audit` VALUES (315, 6, 'hola necesito saber de productos', 'lista_productos', '{\"message_id\": 529, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721006407, \"text\": \"hola necesito saber de productos\"}', '2024-07-14 20:20:07');
INSERT INTO `bot_audit` VALUES (316, 6, 'necesito informe de productos', 'lista_productos', '{\"message_id\": 533, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721006446, \"text\": \"necesito informe de productos\"}', '2024-07-14 20:20:47');
INSERT INTO `bot_audit` VALUES (317, 6, 'quiero saber la lista de usuarios', 'lista_productos', '{\"message_id\": 547, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721006564, \"text\": \"quiero saber la lista de usuarios\"}', '2024-07-14 20:22:45');
INSERT INTO `bot_audit` VALUES (318, 6, 'reporte de clientes', 'lista_productos', '{\"message_id\": 551, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721006732, \"text\": \"reporte de clientes\"}', '2024-07-14 20:25:33');
INSERT INTO `bot_audit` VALUES (319, 6, 'quiero la lista de clientes', 'lista_productos', '{\"message_id\": 555, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721006785, \"text\": \"quiero la lista de clientes\"}', '2024-07-14 20:26:25');
INSERT INTO `bot_audit` VALUES (320, 6, 'una lista de clientes por favor', 'lista_productos', '{\"message_id\": 559, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721006819, \"text\": \"una lista de clientes por favor\"}', '2024-07-14 20:26:59');
INSERT INTO `bot_audit` VALUES (321, 6, 'hola', 'saludo', '{\"message_id\": 563, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721007007, \"text\": \"hola\"}', '2024-07-14 20:30:07');
INSERT INTO `bot_audit` VALUES (322, 6, 'listado de usuarios', 'lista_productos', '{\"message_id\": 566, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721007054, \"text\": \"listado de usuarios\"}', '2024-07-14 20:30:55');
INSERT INTO `bot_audit` VALUES (323, 6, 'listado de clientes', 'lista_productos', '{\"message_id\": 589, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721008808, \"text\": \"listado de clientes\"}', '2024-07-14 21:00:09');
INSERT INTO `bot_audit` VALUES (324, 6, 'lista de clientes', 'lista_productos', '{\"message_id\": 593, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721008845, \"text\": \"lista de clientes\"}', '2024-07-14 21:00:45');
INSERT INTO `bot_audit` VALUES (325, 6, 'clientes', 'lista_clientes', '{\"message_id\": 597, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721008850, \"text\": \"clientes\"}', '2024-07-14 21:00:51');
INSERT INTO `bot_audit` VALUES (326, 10, 'hola saludos', 'saludo', '{\"message_id\": 601, \"from\": {\"id\": 7054851197, \"is_bot\": false, \"first_name\": \"Aly\", \"last_name\": \"Borja\", \"username\": \"AlyJoBorja\", \"language_code\": \"es\"}, \"chat\": {\"id\": 7054851197, \"first_name\": \"Aly\", \"last_name\": \"Borja\", \"username\": \"AlyJoBorja\", \"type\": \"private\"}, \"date\": 1721021560, \"text\": \"Hola saludos\"}', '2024-07-15 00:32:40');
INSERT INTO `bot_audit` VALUES (327, 10, 'saludos', 'saludo', '{\"message_id\": 604, \"from\": {\"id\": 7054851197, \"is_bot\": false, \"first_name\": \"Aly\", \"last_name\": \"Borja\", \"username\": \"AlyJoBorja\", \"language_code\": \"es\"}, \"chat\": {\"id\": 7054851197, \"first_name\": \"Aly\", \"last_name\": \"Borja\", \"username\": \"AlyJoBorja\", \"type\": \"private\"}, \"date\": 1721021685, \"text\": \"Saludos\"}', '2024-07-15 00:34:46');
INSERT INTO `bot_audit` VALUES (328, 6, 'hola buenos dias', 'saludo', '{\"message_id\": 607, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721053669, \"text\": \"Hola buenos dias\"}', '2024-07-15 09:27:49');
INSERT INTO `bot_audit` VALUES (329, 6, 'entregame el listado de productos', 'lista_productos', '{\"message_id\": 610, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721054636, \"text\": \"entregame el listado de productos\"}', '2024-07-15 09:43:55');
INSERT INTO `bot_audit` VALUES (330, 6, 'se gentil y proporciname la lista de usuarios', 'lista_productos', '{\"message_id\": 617, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721058862, \"text\": \"se gentil y proporci\\u00f3name la lista de usuarios\"}', '2024-07-15 10:54:22');
INSERT INTO `bot_audit` VALUES (331, 6, 'se gentil y proporciname la lista de clientes', 'lista_clientes', '{\"message_id\": 621, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721058886, \"text\": \"se gentil y proporci\\u00f3name la lista de clientes\"}', '2024-07-15 10:54:45');
INSERT INTO `bot_audit` VALUES (332, 6, 'se gentil y proporcioname la lista de usuarios', 'lista_usuarios', '{\"message_id\": 625, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721060366, \"text\": \"se gentil y proporcioname la lista de usuarios\"}', '2024-07-15 11:19:26');
INSERT INTO `bot_audit` VALUES (333, 6, 'se gentil y proporcioname la lista de usuarios', 'lista_usuarios', '{\"message_id\": 629, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721062855, \"text\": \"se gentil y proporcioname la lista de usuarios\"}', '2024-07-15 12:00:54');
INSERT INTO `bot_audit` VALUES (334, 6, 'lista de movimientos', 'lista_productos', '{\"message_id\": 633, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721103800, \"text\": \"lista de movimientos\"}', '2024-07-15 23:23:19');
INSERT INTO `bot_audit` VALUES (335, 6, 'reporte de movimientos', 'lista_productos', '{\"message_id\": 637, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721103827, \"text\": \"reporte de movimientos\"}', '2024-07-15 23:23:46');
INSERT INTO `bot_audit` VALUES (336, 6, 'lista de movimientos', 'lista_productos', '{\"message_id\": 641, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721103846, \"text\": \"lista de movimientos\"}', '2024-07-15 23:24:05');
INSERT INTO `bot_audit` VALUES (337, 6, 'listado de movimientos', 'lista_productos', '{\"message_id\": 658, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721104441, \"text\": \"listado de movimientos\"}', '2024-07-15 23:34:00');
INSERT INTO `bot_audit` VALUES (338, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 662, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721104578, \"text\": \"lista de usuarios\"}', '2024-07-15 23:36:17');
INSERT INTO `bot_audit` VALUES (339, 6, 'listado de usuarios', 'lista_productos', '{\"message_id\": 666, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721104624, \"text\": \"listado de usuarios\"}', '2024-07-15 23:37:03');
INSERT INTO `bot_audit` VALUES (340, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 670, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721104760, \"text\": \"listado de productos\"}', '2024-07-15 23:39:19');
INSERT INTO `bot_audit` VALUES (341, 6, 'buenos dias', 'saludo', '{\"message_id\": 674, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721172259, \"text\": \"Buenos dias\"}', '2024-07-16 18:25:46');
INSERT INTO `bot_audit` VALUES (342, 6, 'dame el resumen de usuarios', 'lista_productos', '{\"message_id\": 677, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721176384, \"text\": \"dame el resumen de usuarios\"}', '2024-07-16 19:33:04');
INSERT INTO `bot_audit` VALUES (343, 6, 'dame el resumen de usuarios', 'lista_usuarios', '{\"message_id\": 681, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721176434, \"text\": \"dame el resumen de usuarios\"}', '2024-07-16 19:33:53');
INSERT INTO `bot_audit` VALUES (344, 6, 'dame alguna cosa de productos', 'lista_productos', '{\"message_id\": 688, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721176975, \"text\": \"dame alguna cosa de productos\"}', '2024-07-16 19:42:55');
INSERT INTO `bot_audit` VALUES (345, 6, 'quiero algo de stock', 'stock', '{\"message_id\": 692, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721177233, \"text\": \"quiero algo de stock\"}', '2024-07-16 19:47:12');
INSERT INTO `bot_audit` VALUES (346, 6, 'quiero algo de stock', 'stock', '{\"message_id\": 695, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721177283, \"text\": \"quiero algo de stock\"}', '2024-07-16 19:48:02');
INSERT INTO `bot_audit` VALUES (347, 6, 'quiero algo de stock', 'lista_productos', '{\"message_id\": 698, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721177299, \"text\": \"quiero algo de stock\"}', '2024-07-16 19:48:18');
INSERT INTO `bot_audit` VALUES (348, 6, 'listados de productos por cliente', 'lista_productos', '{\"message_id\": 701, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721177517, \"text\": \"listados de productos por cliente\"}', '2024-07-16 19:51:56');
INSERT INTO `bot_audit` VALUES (349, 6, 'buenos dias', 'saludo', '{\"message_id\": 708, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721178149, \"text\": \"buenos dias\"}', '2024-07-16 20:02:28');
INSERT INTO `bot_audit` VALUES (350, 6, 'buenas tardes', 'saludo', '{\"message_id\": 711, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721178165, \"text\": \"buenas tardes\"}', '2024-07-16 20:02:44');
INSERT INTO `bot_audit` VALUES (351, 6, 'al susto', 'saludo', '{\"message_id\": 728, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721178433, \"text\": \"al susto\"}', '2024-07-16 20:07:12');
INSERT INTO `bot_audit` VALUES (352, 6, 'al susto', 'despedida', '{\"message_id\": 731, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721178471, \"text\": \"al susto\"}', '2024-07-16 20:07:51');
INSERT INTO `bot_audit` VALUES (353, 6, 'al susto', 'despedida', '{\"message_id\": 734, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721178498, \"text\": \"al susto\"}', '2024-07-16 20:08:17');
INSERT INTO `bot_audit` VALUES (354, 6, 'necesito un listado de productos ahora', 'lista_productos', '{\"message_id\": 737, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1721181703, \"text\": \"necesito un listado de productos ahora\"}', '2024-07-16 21:01:43');
INSERT INTO `bot_audit` VALUES (355, 6, 'hola', 'saludo', '{\"message_id\": 779, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723882945, \"text\": \"Hola\"}', '2024-08-17 03:22:24');
INSERT INTO `bot_audit` VALUES (356, 6, 'hola', 'saludo', '{\"message_id\": 807, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723883880, \"text\": \"Hola\"}', '2024-08-17 03:37:59');
INSERT INTO `bot_audit` VALUES (357, 6, 'hola', 'saludo', '{\"message_id\": 809, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723883967, \"text\": \"Hola\"}', '2024-08-17 03:39:26');
INSERT INTO `bot_audit` VALUES (358, 6, 'hola', 'saludo', '{\"message_id\": 811, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723883985, \"text\": \"Hola\"}', '2024-08-17 03:39:44');
INSERT INTO `bot_audit` VALUES (359, 6, 'hola', 'saludo', '{\"message_id\": 813, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884008, \"text\": \"Hola\"}', '2024-08-17 03:40:07');
INSERT INTO `bot_audit` VALUES (360, 6, 'hola', 'saludo', '{\"message_id\": 815, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884044, \"text\": \"Hola\"}', '2024-08-17 03:40:43');
INSERT INTO `bot_audit` VALUES (361, 6, 'hola', 'saludo', '{\"message_id\": 817, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884219, \"text\": \"Hola\"}', '2024-08-17 03:43:38');
INSERT INTO `bot_audit` VALUES (362, 6, 'hola', 'saludo', '{\"message_id\": 819, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884312, \"text\": \"Hola\"}', '2024-08-17 03:45:11');
INSERT INTO `bot_audit` VALUES (363, 6, 'hola', 'saludo', '{\"message_id\": 821, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884400, \"text\": \"Hola\"}', '2024-08-17 03:46:39');
INSERT INTO `bot_audit` VALUES (364, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 824, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884670, \"text\": \"lista de usuarios\"}', '2024-08-17 03:51:09');
INSERT INTO `bot_audit` VALUES (365, 6, 'hola', 'saludo', '{\"message_id\": 826, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884730, \"text\": \"hola\"}', '2024-08-17 03:52:08');
INSERT INTO `bot_audit` VALUES (366, 6, 'hola', 'saludo', '{\"message_id\": 828, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884778, \"text\": \"hola\"}', '2024-08-17 03:52:57');
INSERT INTO `bot_audit` VALUES (367, 6, 'hola', 'saludo', '{\"message_id\": 830, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723884846, \"text\": \"Hola\"}', '2024-08-17 03:54:05');
INSERT INTO `bot_audit` VALUES (368, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 833, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885116, \"text\": \"lista de usuarios\"}', '2024-08-17 03:58:35');
INSERT INTO `bot_audit` VALUES (369, 6, 'hola', 'saludo', '{\"message_id\": 836, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885313, \"text\": \"Hola\"}', '2024-08-17 04:02:31');
INSERT INTO `bot_audit` VALUES (370, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 839, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885367, \"text\": \"lista de usuarios\"}', '2024-08-17 04:02:46');
INSERT INTO `bot_audit` VALUES (371, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 842, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885480, \"text\": \"lista de usuarios\"}', '2024-08-17 04:04:39');
INSERT INTO `bot_audit` VALUES (372, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 845, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885530, \"text\": \"lista de usuarios\"}', '2024-08-17 04:05:39');
INSERT INTO `bot_audit` VALUES (373, 6, 'lista e usuarios', 'lista_productos', '{\"message_id\": 849, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885657, \"text\": \"lista e usuarios\"}', '2024-08-17 04:07:36');
INSERT INTO `bot_audit` VALUES (374, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 851, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885754, \"text\": \"lista de usuarios\"}', '2024-08-17 04:09:21');
INSERT INTO `bot_audit` VALUES (375, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 853, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885833, \"text\": \"lista de usuarios\"}', '2024-08-17 04:10:32');
INSERT INTO `bot_audit` VALUES (376, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 855, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885952, \"text\": \"lista de usuarios\"}', '2024-08-17 04:12:31');
INSERT INTO `bot_audit` VALUES (377, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 857, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723885972, \"text\": \"lista de usuarios\"}', '2024-08-17 04:12:51');
INSERT INTO `bot_audit` VALUES (378, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 859, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886147, \"text\": \"lista de usuarios\"}', '2024-08-17 04:15:46');
INSERT INTO `bot_audit` VALUES (379, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 861, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886164, \"text\": \"lista de usuarios\"}', '2024-08-17 04:16:03');
INSERT INTO `bot_audit` VALUES (380, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 863, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886219, \"text\": \"lista de usuarios\"}', '2024-08-17 04:16:58');
INSERT INTO `bot_audit` VALUES (381, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 865, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886327, \"text\": \"lista de usuarios\"}', '2024-08-17 04:18:46');
INSERT INTO `bot_audit` VALUES (382, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 867, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886383, \"text\": \"lista de usuarios\"}', '2024-08-17 04:19:42');
INSERT INTO `bot_audit` VALUES (383, 6, 'lista de users', 'lista_productos', '{\"message_id\": 871, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886530, \"text\": \"lista de users\"}', '2024-08-17 04:22:09');
INSERT INTO `bot_audit` VALUES (384, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 875, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886588, \"text\": \"Lista de usuarios\"}', '2024-08-17 04:23:07');
INSERT INTO `bot_audit` VALUES (385, 6, 'lista de usuarios', 'lista_productos', '{\"message_id\": 886, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886706, \"text\": \"lista de usuarios\"}', '2024-08-17 04:25:05');
INSERT INTO `bot_audit` VALUES (386, 6, 'quiero el reporte de usuarios', 'lista_productos', '{\"message_id\": 890, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886732, \"text\": \"quiero el reporte de usuarios\"}', '2024-08-17 04:25:31');
INSERT INTO `bot_audit` VALUES (387, 6, 'informe de usuarios', 'lista_productos', '{\"message_id\": 894, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886744, \"text\": \"informe de usuarios\"}', '2024-08-17 04:25:43');
INSERT INTO `bot_audit` VALUES (388, 6, 'listado de productos', 'lista_productos', '{\"message_id\": 898, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886755, \"text\": \"listado de productos\"}', '2024-08-17 04:25:54');
INSERT INTO `bot_audit` VALUES (389, 6, 'movimientos', 'movimientos', '{\"message_id\": 902, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886762, \"text\": \"movimientos\"}', '2024-08-17 04:26:01');
INSERT INTO `bot_audit` VALUES (390, 6, 'movimientos', 'movimientos', '{\"message_id\": 904, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886865, \"text\": \"movimientos\"}', '2024-08-17 04:27:44');
INSERT INTO `bot_audit` VALUES (391, 6, 'movimientos', 'movimientos', '{\"message_id\": 906, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723886904, \"text\": \"movimientos\"}', '2024-08-17 04:28:24');
INSERT INTO `bot_audit` VALUES (392, 6, 'movimientos', 'movimientos', '{\"message_id\": 908, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723887134, \"text\": \"movimientos\"}', '2024-08-17 04:32:13');
INSERT INTO `bot_audit` VALUES (393, 6, 'movimientos', 'movimientos', '{\"message_id\": 910, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723887233, \"text\": \"movimientos\"}', '2024-08-17 04:33:51');
INSERT INTO `bot_audit` VALUES (394, 6, 'movimientos', 'movimientos', '{\"message_id\": 912, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723887280, \"text\": \"movimientos\"}', '2024-08-17 04:34:39');
INSERT INTO `bot_audit` VALUES (395, 6, 'movimientos', 'movimientos', '{\"message_id\": 914, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723887316, \"text\": \"movimientos\"}', '2024-08-17 04:35:15');
INSERT INTO `bot_audit` VALUES (396, 6, 'movimientos', 'movimientos', '{\"message_id\": 916, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723887326, \"text\": \"movimientos\"}', '2024-08-17 04:35:25');
INSERT INTO `bot_audit` VALUES (397, 6, 'movimientos', 'movimientos', '{\"message_id\": 918, \"from\": {\"id\": 1427181793, \"is_bot\": false, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"language_code\": \"es\"}, \"chat\": {\"id\": 1427181793, \"first_name\": \"Santiago\", \"last_name\": \"Borja\", \"username\": \"SantiagoDieum\", \"type\": \"private\"}, \"date\": 1723887399, \"text\": \"movimientos\"}', '2024-08-17 04:36:38');

-- ----------------------------
-- Table structure for bot_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `bot_dictionary`;
CREATE TABLE `bot_dictionary`  (
  `idbotdic` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `ismenu` int NOT NULL DEFAULT 0 COMMENT 'Si es menu para que se despliegue en el bot',
  `action` enum('T','Q','F','M') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'T' COMMENT 'T-Text, Q-Query, F-Open Filem M-Menu',
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `field_search` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idbotdic`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bot_dictionary
-- ----------------------------
INSERT INTO `bot_dictionary` VALUES (1, 'menu', 'Menú de Opciones', 1, 'M', 'SELECT \n    CONCAT(\"/\", menu) as `menu`,\n    `description`\nFROM \n    bot_dictionary \nWHERE \n    ismenu = 1 \n    AND deleted_at IS NULL \nORDER BY \n    menu', '', '2024-08-28 20:51:48', '2024-08-29 02:10:31', NULL);
INSERT INTO `bot_dictionary` VALUES (2, 'reportes', 'Listado de reportes', 0, 'T', 'Menu de Reportes\r\n\r\n/lista_productos - Listado de productos.\r\n/lista_usuarios - Listado de usuarios.\r\n/lista_stock - Listado de stock por producto.\r\n/movimientos - Movimientos de productos\r\n\r\n/menu - Puedes regresar al menu principal.\r\n\r\n', '', '2024-08-28 20:51:48', '2024-08-28 23:29:53', NULL);
INSERT INTO `bot_dictionary` VALUES (3, 'lista_usuarios', 'Lista los usuarios del sistema', 1, 'Q', 'SELECT \r\n    CAST(iduser as CHAR) as id, \r\n    fullname as nombre, \r\n    rolename as rol \r\nFROM \r\n    view_get_users \r\nWHERE \r\n    status = 1 AND deleted_at IS NULL', 'fullname', '2024-08-28 20:51:48', '2024-08-28 23:29:56', NULL);
INSERT INTO `bot_dictionary` VALUES (4, 'lista_productos', 'Lista los productos', 1, 'Q', 'SELECT \r\n  presentation as presentacion,\r\n  line as linea,\r\n  category as categoria,\r\n  productcode as codigo,\r\n  name as nombre,\r\n  CAST(cost AS CHAR) AS costo, \r\n  CAST(stock as CHAR) AS stock,\r\n  CAST(price as CHAR) AS precio,\r\n  CAST(stock_min as CHAR) AS stock_min,\r\n  CAST(stock_max as CHAR) AS stock_max\r\nFROM \r\n  view_products\r\nWHERE \r\n   status = 1', 'name', '2024-08-28 20:51:48', '2024-08-28 23:29:57', NULL);
INSERT INTO `bot_dictionary` VALUES (9, 'saludo', 'Texto para saludo', 0, 'T', 'Hola <nombre>, <tiempo>\r\n\r\nSoy 6UG8 bot, un asistente inteligente de la empresa DIPROAVILM,\r\ncomo te puedo ayudar el día de hoy.\r\n\r\n/menu - Para desplegar el listado de opciones del menú\r\n/ayuda - Para saber mas de como puedes ingresar tus requerimientos.\r\n\r\n\r\n\r\n\r\n', '', '2024-08-28 20:51:48', '2024-08-28 23:36:17', NULL);
INSERT INTO `bot_dictionary` VALUES (10, 'ayuda', 'Text de ayuda', 1, 'T', 'Opcion de Ayuda\r\n\r\nSoy /6UG8 bot, un asistente inteligente de la empresa DIPROAVILM.\r\n\r\n- Puedes ingresar las opciones del menu con un / o sin nada, Ej: /ayuda o ayuda.\r\n- Puedes separar las opciones con una coma ( , ), asi indicaras que necesitas que se filtre la información con ese texto que acabas de indicar Ej: listado_usuarios,Carmen\r\n- En cualquier momento puedes ingresar la opcion que mas prefieras.\r\n- Todos los resultados saldran en formato CSV, a fin de que puedas copiarlos y abrirlos en una hoja de calculo.\r\n\r\n/menu - Despliega las opciones del menú.\r\n\r\nUn saludo, \r\n6UG8 bot\r\n\r\n', '', '2024-08-28 20:51:48', '2024-08-28 23:30:00', NULL);
INSERT INTO `bot_dictionary` VALUES (11, '6UG8', 'Quien Soy', 1, 'T', 'Soy 6UG8 bot, un asistente inteligente de la empresa DIPROAVILM.\r\n\r\n- Mis creadores son:\r\n     Hugo Alfredo Herrera Villalva\r\n     Jaime Santiago Borja Romero\r\n     Joel Darío Brito Parra\r\n     Jorge Luis López Romo\r\n     Ricardo Vaca Miño   \r\n\r\nDel 6 semestre de la carrera de Software de la Universidad UNIANDES.\r\n\r\n- Las herramientas usadas para mi creación son:\r\n    Python\r\n    Entorno virtual python\r\n    MySql\r\n    Telegram Plugins\r\n\r\n\r\n/menu - Despliega las opciones del menú.\r\n\r\nUn saludo, \r\n6UG8 bot', '', '2024-08-28 20:51:48', '2024-08-28 23:35:31', NULL);
INSERT INTO `bot_dictionary` VALUES (12, 'lista_existencias', 'Listado de existencias', 1, 'T', 'Aun en desarrollo\r\n\r\n\r\n\r\n\r\n\r\n/menu - Puedes regresar al menu principal.\r\n\r\n ', '', '2024-08-28 20:51:48', '2024-08-28 23:30:02', NULL);
INSERT INTO `bot_dictionary` VALUES (13, 'hora', 'Hora actual', 0, 'T', 'La hora actual es <time>\r\n\r\n', '', '2024-08-28 20:51:48', '2024-08-28 23:21:50', NULL);
INSERT INTO `bot_dictionary` VALUES (14, 'fecha', 'Fecha actual', 0, 'T', 'La fecha actual es <fecha>', '', '2024-08-28 20:51:48', '2024-08-28 23:21:57', NULL);
INSERT INTO `bot_dictionary` VALUES (18, 'congusto', 'Pregunta', 0, 'T', 'Puedo ayudarte el algo mas?', '', '2024-08-28 20:51:48', '2024-08-28 23:22:06', NULL);
INSERT INTO `bot_dictionary` VALUES (19, 'despedida', 'texto de despedida', 0, 'T', 'Un gusto ayudarte <nombre>, <tiempo>. chao.', '', '2024-08-28 20:51:48', '2024-08-28 23:22:19', NULL);
INSERT INTO `bot_dictionary` VALUES (20, 'start', 'Inicio', 0, 'T', 'Hola <nombre>, <tiempo>\r\nBienvenid@\r\n\r\nSoy 6UG8 bot, un asistente de informes de la empresa DIPROAVILM,\r\ncomo te puedo ayudar el día de hoy.\r\n\r\n/menu - Para desplegar el listado de opciones del menú\r\n/ayuda - Para saber mas de como puedes ingresar tus requerimientos.\r\n\r\n\r\n\r\n\r\n', '', '2024-08-28 20:51:48', '2024-08-28 23:22:22', NULL);
INSERT INTO `bot_dictionary` VALUES (21, 'lista_clientes', 'Listado de Clientes', 1, 'Q', 'SELECT * FROM view_clients', '', '2024-08-28 20:51:48', '2024-08-28 23:30:05', NULL);
INSERT INTO `bot_dictionary` VALUES (22, 'movimientos', 'Listado de Movimientos del dia', 1, 'Q', 'SELECT * FROM view_movements', '', '2024-08-28 20:51:48', '2024-08-28 23:30:07', NULL);
INSERT INTO `bot_dictionary` VALUES (26, 'ccc', 'asd asd asd asd asd', 1, 'M', 'ascascascasc\nasc\nasc\nas\ncasas dasd asd \nc\nasc\nasc', '', '2024-08-29 00:52:48', '2024-08-29 00:53:27', '2024-08-29 00:53:27');
INSERT INTO `bot_dictionary` VALUES (27, 'Calro', 'askdjlaskjda', 0, 'T', '<nombre><tiempo><fecha>', '', '2024-08-29 01:15:30', '2024-08-29 01:15:36', '2024-08-29 01:15:36');

-- ----------------------------
-- Table structure for bot_spelling
-- ----------------------------
DROP TABLE IF EXISTS `bot_spelling`;
CREATE TABLE `bot_spelling`  (
  `idbotspelling` int NOT NULL AUTO_INCREMENT,
  `wordfind` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  `menurun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT 'menu',
  `confirmed` int NOT NULL DEFAULT 0 COMMENT 'Si se encuentra confirmado o no para que sea parete de la capa de entrada',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idbotspelling`) USING BTREE,
  INDEX `IDXword`(`wordfind` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bot_spelling
-- ----------------------------
INSERT INTO `bot_spelling` VALUES (1, 'hola', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (2, 'hi', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (3, 'hello', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (4, 'start', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (5, 'ayuda', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (6, 'help', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (7, 'reportes', 'reportes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (8, 'reports', 'reportes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (9, 'stock', 'stock', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (10, 'existencias', 'stock', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (11, 'ingreso', 'ingreso', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (12, 'egreso', 'egreso', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (13, 'lista_productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (14, 'products', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (16, 'lista_usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (17, 'user', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (18, 'users', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (20, 'lista_stock', 'lista_existencias', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (21, 'lista_existencias', 'lista_existencias', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (22, 'saludos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (24, 'ayudes', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (25, 'ayudita', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (26, 'ayudas', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (27, 'mano', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (29, 'usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (30, 'productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (31, 'usuario', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (32, 'menu', 'menu', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (33, 'opciones', 'menu', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (34, 'saludo', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (36, 'time', 'hora', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (37, 'tiempo', 'hora', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (38, 'hora', 'hora', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (39, 'date', 'fecha', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (40, 'fecha', 'fecha', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (41, 'dias', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (42, 'tardes', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (43, 'noches', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (44, 'listas_productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (45, 'cambiar_formato', 'cambiar_formato', 1, '2024-08-26 19:53:05', '2024-08-28 23:26:37', '2024-08-28 23:26:37');
INSERT INTO `bot_spelling` VALUES (46, 'cambia_formato', 'cambiar_formato', 1, '2024-08-26 19:53:05', '2024-08-28 23:26:44', '2024-08-28 23:26:44');
INSERT INTO `bot_spelling` VALUES (47, 'cambio_formato', 'cambiar_formato', 1, '2024-08-26 19:53:05', '2024-08-28 23:26:50', '2024-08-28 23:26:50');
INSERT INTO `bot_spelling` VALUES (48, 'format_csv', 'format_csv', 1, '2024-08-26 19:53:05', '2024-08-28 23:26:56', '2024-08-28 23:26:56');
INSERT INTO `bot_spelling` VALUES (49, 'format_tabspace', 'format_tabspace', 1, '2024-08-26 19:53:05', '2024-08-28 23:27:01', '2024-08-28 23:27:01');
INSERT INTO `bot_spelling` VALUES (50, 'gracias', 'congusto', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (51, 'opcion ', 'menu', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (52, 'chao', 'despedida', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (53, 'despedida', 'despedida', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (54, 'despido', 'despedida', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (55, 'bye', 'despedida', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (56, 'opciones', 'menu', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (57, 'amable', 'congusto', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (58, 'agradecido', 'congusto', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (59, 'muy gentil', 'congusto', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (60, 'listas_usuario', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (61, 'quiero este momento el listado de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (62, 'quiero nuevamente el listado de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (63, 'cuando digo usuario es usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (64, 'listado de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (65, 'menu', 'menu', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (66, 'reportes', 'reportes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (67, 'ayuda', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (68, 'lista_usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (69, 'lista_stock', 'lista_existencias', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (70, 'lista_productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (71, 'buenos dias', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (72, 'buenas tardes', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (73, 'hello', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (74, 'hols', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (75, 'como estas', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (76, 'hola', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (77, 'hola como estas', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (78, 'necesito ayuda', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (79, 'help', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (80, 'listado de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (81, 'listado de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (82, 'lista de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (83, 'saludo', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (84, 'como esta hoy te envio un saludo', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (85, 'usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (86, 'saludo como estas', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (87, 'hi', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (88, 'saludos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (89, 'saludos cordiales', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (90, 'quisiera saber la lista de productos que tiene disponible', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (91, 'lista de stockl', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (92, 'hey que tal', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (93, 'hey como estas', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (94, 'saludos como estas', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (95, 'menu', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (96, 'reportes de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (97, 'reporte de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (98, 'listado productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (99, 'gracias', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (100, 'muy gentil', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (101, 'chao', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (102, 'me despido', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (103, 'lista de usuarios', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (104, 'listado de productows', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (105, 'listado de producto', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (106, 'listado de productos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (107, 'lista de proditos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (108, 'productos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (109, 'lista_productos afrecho', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (110, 'me gustaria tener reportes de preductos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (111, 'reporte de productos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (112, 'dame ayuda', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (113, 'necesito una ayuda pro favor', 'ayuda', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (114, 'productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (115, 'quiero este momento el listado de usuarios', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (116, 'quiero nuevamente el listado de usuarios', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (117, 'cuando digo usuario es usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (118, 'como nos encontramos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (119, 'dame tus productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (120, 'necesito las existencias de los productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (121, 'alguna cosa mas', 'despedida', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (122, 'necesito productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (123, 'hola necesito saber de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (124, 'necesito informe de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (125, 'quiero saber la lista de usuarios', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (126, 'reporte de clientes', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (127, 'quiero la lista de clientes', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (128, 'una lista de clientes por favor', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (129, 'listado de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (130, 'clientes', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (131, 'lista_clientes', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (132, 'listado de clientes', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (133, 'lista de clientes', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (134, 'hola saludos', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (135, 'hola buenos dias', 'saludo', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (136, 'entregame el listado de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (137, 'se gentil y proporciname la lista de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (138, 'se gentil y proporciname la lista de clientes', 'lista_clientes', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (139, 'se gentil y proporcioname la lista de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (140, 'movimientos', 'movimientos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (141, 'lista de movimientos', 'movimientos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (142, 'reporte de movimientos', 'movimientos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (143, 'lista de movimientos', 'movimientos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (144, 'mov', 'movimientos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (145, 'listado de movimientos', 'movimientos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (146, 'listado de usuarios', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (147, 'dame el resumen de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (148, 'dame alguna cosa de productos', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (149, 'quiero algo de stock', 'stock', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (154, 'al susto', 'despedida', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (155, 'necesito un listado de productos ahora', 'lista_productos', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (157, 'lista e usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (158, 'lista de users', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 19:53:05', NULL);
INSERT INTO `bot_spelling` VALUES (159, 'quiero el reporte de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-27 01:21:25', NULL);
INSERT INTO `bot_spelling` VALUES (160, 'informe de usuarios', 'lista_usuarios', 1, '2024-08-26 19:53:05', '2024-08-26 23:01:22', NULL);
INSERT INTO `bot_spelling` VALUES (161, 'casasasd asd asd', 'saludo', 0, '2024-08-26 20:53:30', '2024-08-27 01:19:22', '2024-08-27 01:19:22');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `idcity` int NOT NULL AUTO_INCREMENT,
  `idprovince` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idcity`) USING BTREE,
  INDEX `idprovince`(`idprovince` ASC) USING BTREE,
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`idprovince`) REFERENCES `province` (`idprovince`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 1, 'Cuenca');
INSERT INTO `city` VALUES (2, 1, 'Girón');
INSERT INTO `city` VALUES (3, 1, 'Gualaceo');
INSERT INTO `city` VALUES (4, 1, 'Nabón');
INSERT INTO `city` VALUES (5, 1, 'Paute');
INSERT INTO `city` VALUES (6, 1, 'Pucará');
INSERT INTO `city` VALUES (7, 1, 'San Fernando');
INSERT INTO `city` VALUES (8, 1, 'Santa Isabel');
INSERT INTO `city` VALUES (9, 1, 'Sevilla de Oro');
INSERT INTO `city` VALUES (10, 1, 'Sigsig');
INSERT INTO `city` VALUES (11, 1, 'Oña');
INSERT INTO `city` VALUES (12, 1, 'Chordeleg');
INSERT INTO `city` VALUES (13, 1, 'El Pan');
INSERT INTO `city` VALUES (14, 1, 'Ponce Enríquez');
INSERT INTO `city` VALUES (15, 2, 'Guaranda');
INSERT INTO `city` VALUES (16, 2, 'Chillanes');
INSERT INTO `city` VALUES (17, 2, 'Chimbo');
INSERT INTO `city` VALUES (18, 2, 'Echeandía');
INSERT INTO `city` VALUES (19, 2, 'San Miguel');
INSERT INTO `city` VALUES (20, 2, 'Caluma');
INSERT INTO `city` VALUES (21, 2, 'Las Naves');
INSERT INTO `city` VALUES (22, 3, 'Azogues');
INSERT INTO `city` VALUES (23, 3, 'Biblián');
INSERT INTO `city` VALUES (24, 3, 'Cañar');
INSERT INTO `city` VALUES (25, 3, 'Déleg');
INSERT INTO `city` VALUES (26, 3, 'La Troncal');
INSERT INTO `city` VALUES (27, 3, 'El Tambo');
INSERT INTO `city` VALUES (28, 3, 'Suscal');
INSERT INTO `city` VALUES (29, 4, 'Tulcán');
INSERT INTO `city` VALUES (30, 4, 'Bolívar');
INSERT INTO `city` VALUES (31, 4, 'Espejo');
INSERT INTO `city` VALUES (32, 4, 'Mira');
INSERT INTO `city` VALUES (33, 4, 'Montúfar');
INSERT INTO `city` VALUES (34, 4, 'San Pedro de Huaca');
INSERT INTO `city` VALUES (35, 5, 'Riobamba');
INSERT INTO `city` VALUES (36, 5, 'Alausí');
INSERT INTO `city` VALUES (37, 5, 'Colta');
INSERT INTO `city` VALUES (38, 5, 'Chambo');
INSERT INTO `city` VALUES (39, 5, 'Chunchi');
INSERT INTO `city` VALUES (40, 5, 'Guamote');
INSERT INTO `city` VALUES (41, 5, 'Guano');
INSERT INTO `city` VALUES (42, 5, 'Pallatanga');
INSERT INTO `city` VALUES (43, 5, 'Penipe');
INSERT INTO `city` VALUES (44, 6, 'Latacunga');
INSERT INTO `city` VALUES (45, 6, 'La Maná');
INSERT INTO `city` VALUES (46, 6, 'Pangua');
INSERT INTO `city` VALUES (47, 6, 'Pujilí');
INSERT INTO `city` VALUES (48, 6, 'Salcedo');
INSERT INTO `city` VALUES (49, 6, 'Saquisilí');
INSERT INTO `city` VALUES (50, 6, 'Sigchos');
INSERT INTO `city` VALUES (51, 7, 'Machala');
INSERT INTO `city` VALUES (52, 7, 'Arenillas');
INSERT INTO `city` VALUES (53, 7, 'Atahualpa');
INSERT INTO `city` VALUES (54, 7, 'Balsas');
INSERT INTO `city` VALUES (55, 7, 'Chilla');
INSERT INTO `city` VALUES (56, 7, 'El Guabo');
INSERT INTO `city` VALUES (57, 7, 'Huaquillas');
INSERT INTO `city` VALUES (58, 7, 'Marcabelí');
INSERT INTO `city` VALUES (59, 7, 'Pasaje');
INSERT INTO `city` VALUES (60, 7, 'Piñas');
INSERT INTO `city` VALUES (61, 7, 'Portovelo');
INSERT INTO `city` VALUES (62, 7, 'Santa Rosa');
INSERT INTO `city` VALUES (63, 7, 'Zaruma');
INSERT INTO `city` VALUES (64, 7, 'Las Lajas');
INSERT INTO `city` VALUES (65, 8, 'Esmeraldas');
INSERT INTO `city` VALUES (66, 8, 'Eloy Alfaro');
INSERT INTO `city` VALUES (67, 8, 'Muisne');
INSERT INTO `city` VALUES (68, 8, 'Quinindé');
INSERT INTO `city` VALUES (69, 8, 'San Lorenzo');
INSERT INTO `city` VALUES (70, 8, 'Atacames');
INSERT INTO `city` VALUES (71, 8, 'Rioverde');
INSERT INTO `city` VALUES (72, 9, 'San Cristóbal');
INSERT INTO `city` VALUES (73, 9, 'Isabela');
INSERT INTO `city` VALUES (74, 9, 'Santa Cruz');
INSERT INTO `city` VALUES (75, 10, 'Guayaquil');
INSERT INTO `city` VALUES (76, 10, 'Alfredo Baquerizo Moreno');
INSERT INTO `city` VALUES (77, 10, 'Balao');
INSERT INTO `city` VALUES (78, 10, 'Balzar');
INSERT INTO `city` VALUES (79, 10, 'Colimes');
INSERT INTO `city` VALUES (80, 10, 'Daule');
INSERT INTO `city` VALUES (81, 10, 'Durán');
INSERT INTO `city` VALUES (82, 10, 'El Empalme');
INSERT INTO `city` VALUES (83, 10, 'El Triunfo');
INSERT INTO `city` VALUES (84, 10, 'Milagro');
INSERT INTO `city` VALUES (85, 10, 'Naranjal');
INSERT INTO `city` VALUES (86, 10, 'Naranjito');
INSERT INTO `city` VALUES (87, 10, 'Palestina');
INSERT INTO `city` VALUES (88, 10, 'Pedro Carbo');
INSERT INTO `city` VALUES (89, 10, 'Samborondón');
INSERT INTO `city` VALUES (90, 10, 'Santa Lucía');
INSERT INTO `city` VALUES (91, 10, 'Salitre');
INSERT INTO `city` VALUES (92, 10, 'San Jacinto de Yaguachi');
INSERT INTO `city` VALUES (93, 10, 'Playas');
INSERT INTO `city` VALUES (94, 10, 'Simón Bolívar');
INSERT INTO `city` VALUES (95, 10, 'Coronel Marcelino Maridueña');
INSERT INTO `city` VALUES (96, 10, 'Lomas de Sargentillo');
INSERT INTO `city` VALUES (97, 10, 'Nobol');
INSERT INTO `city` VALUES (98, 10, 'General Antonio Elizalde');
INSERT INTO `city` VALUES (99, 10, 'Isidro Ayora');
INSERT INTO `city` VALUES (100, 11, 'Ibarra');
INSERT INTO `city` VALUES (101, 11, 'Antonio Ante');
INSERT INTO `city` VALUES (102, 11, 'Cotacachi');
INSERT INTO `city` VALUES (103, 11, 'Otavalo');
INSERT INTO `city` VALUES (104, 11, 'Pimampiro');
INSERT INTO `city` VALUES (105, 11, 'San Miguel de Urcuquí');
INSERT INTO `city` VALUES (106, 12, 'Loja');
INSERT INTO `city` VALUES (107, 12, 'Calvas');
INSERT INTO `city` VALUES (108, 12, 'Catamayo');
INSERT INTO `city` VALUES (109, 12, 'Celica');
INSERT INTO `city` VALUES (110, 12, 'Chaguarpamba');
INSERT INTO `city` VALUES (111, 12, 'Espíndola');
INSERT INTO `city` VALUES (112, 12, 'Gonzanamá');
INSERT INTO `city` VALUES (113, 12, 'Macará');
INSERT INTO `city` VALUES (114, 12, 'Paltas');
INSERT INTO `city` VALUES (115, 12, 'Puyango');
INSERT INTO `city` VALUES (116, 12, 'Saraguro');
INSERT INTO `city` VALUES (117, 12, 'Sozoranga');
INSERT INTO `city` VALUES (118, 12, 'Zapotillo');
INSERT INTO `city` VALUES (119, 13, 'Babahoyo');
INSERT INTO `city` VALUES (120, 13, 'Baba');
INSERT INTO `city` VALUES (121, 13, 'Buena Fe');
INSERT INTO `city` VALUES (122, 13, 'Mocache');
INSERT INTO `city` VALUES (123, 13, 'Montalvo');
INSERT INTO `city` VALUES (124, 13, 'Palenque');
INSERT INTO `city` VALUES (125, 13, 'Quevedo');
INSERT INTO `city` VALUES (126, 13, 'Quinsaloma');
INSERT INTO `city` VALUES (127, 13, 'Urdaneta');
INSERT INTO `city` VALUES (128, 13, 'Valencia');
INSERT INTO `city` VALUES (129, 13, 'Ventanas');
INSERT INTO `city` VALUES (130, 13, 'Vinces');
INSERT INTO `city` VALUES (131, 14, 'Portoviejo');
INSERT INTO `city` VALUES (132, 14, 'Bolívar');
INSERT INTO `city` VALUES (133, 14, 'Chone');
INSERT INTO `city` VALUES (134, 14, 'El Carmen');
INSERT INTO `city` VALUES (135, 14, 'Flavio Alfaro');
INSERT INTO `city` VALUES (136, 14, 'Jama');
INSERT INTO `city` VALUES (137, 14, 'Jaramijó');
INSERT INTO `city` VALUES (138, 14, 'Jipijapa');
INSERT INTO `city` VALUES (139, 14, 'Junín');
INSERT INTO `city` VALUES (140, 14, 'Manta');
INSERT INTO `city` VALUES (141, 14, 'Montecristi');
INSERT INTO `city` VALUES (142, 14, 'Olmedo');
INSERT INTO `city` VALUES (143, 14, 'Paján');
INSERT INTO `city` VALUES (144, 14, 'Pedernales');
INSERT INTO `city` VALUES (145, 14, 'Pichincha');
INSERT INTO `city` VALUES (146, 14, 'Puerto López');
INSERT INTO `city` VALUES (147, 14, 'Rocafuerte');
INSERT INTO `city` VALUES (148, 14, 'San Vicente');
INSERT INTO `city` VALUES (149, 14, 'Santa Ana');
INSERT INTO `city` VALUES (150, 14, 'Sucre');
INSERT INTO `city` VALUES (151, 14, 'Tosagua');
INSERT INTO `city` VALUES (152, 15, 'Macas');
INSERT INTO `city` VALUES (153, 15, 'Gualaquiza');
INSERT INTO `city` VALUES (154, 15, 'Limón Indanza');
INSERT INTO `city` VALUES (155, 15, 'Logroño');
INSERT INTO `city` VALUES (156, 15, 'Morona');
INSERT INTO `city` VALUES (157, 15, 'Pablo Sexto');
INSERT INTO `city` VALUES (158, 15, 'Palora');
INSERT INTO `city` VALUES (159, 15, 'San Juan Bosco');
INSERT INTO `city` VALUES (160, 15, 'Santiago');
INSERT INTO `city` VALUES (161, 15, 'Sucúa');
INSERT INTO `city` VALUES (162, 15, 'Taisha');
INSERT INTO `city` VALUES (163, 15, 'Tiwintza');
INSERT INTO `city` VALUES (164, 16, 'Tena');
INSERT INTO `city` VALUES (165, 16, 'Archidona');
INSERT INTO `city` VALUES (166, 16, 'Carlos Julio Arosemena Tola');
INSERT INTO `city` VALUES (167, 16, 'El Chaco');
INSERT INTO `city` VALUES (168, 16, 'Quijos');
INSERT INTO `city` VALUES (169, 17, 'Francisco de Orellana');
INSERT INTO `city` VALUES (170, 17, 'Aguarico');
INSERT INTO `city` VALUES (171, 17, 'La Joya de los Sachas');
INSERT INTO `city` VALUES (172, 17, 'Loreto');
INSERT INTO `city` VALUES (173, 18, 'Puyo');
INSERT INTO `city` VALUES (174, 18, 'Arajuno');
INSERT INTO `city` VALUES (175, 18, 'Mera');
INSERT INTO `city` VALUES (176, 18, 'Santa Clara');
INSERT INTO `city` VALUES (177, 19, 'Quito');
INSERT INTO `city` VALUES (178, 19, 'Cayambe');
INSERT INTO `city` VALUES (179, 19, 'Mejía');
INSERT INTO `city` VALUES (180, 19, 'Pedro Moncayo');
INSERT INTO `city` VALUES (181, 19, 'Rumiñahui');
INSERT INTO `city` VALUES (182, 19, 'San Miguel de los Bancos');
INSERT INTO `city` VALUES (183, 19, 'Pedro Vicente Maldonado');
INSERT INTO `city` VALUES (184, 19, 'Puerto Quito');
INSERT INTO `city` VALUES (185, 20, 'Santa Elena');
INSERT INTO `city` VALUES (186, 20, 'La Libertad');
INSERT INTO `city` VALUES (187, 20, 'Salinas');
INSERT INTO `city` VALUES (188, 21, 'Santo Domingo');
INSERT INTO `city` VALUES (189, 21, 'La Concordia');
INSERT INTO `city` VALUES (190, 22, 'Nueva Loja');
INSERT INTO `city` VALUES (191, 22, 'Cascales');
INSERT INTO `city` VALUES (192, 22, 'Cuyabeno');
INSERT INTO `city` VALUES (193, 22, 'Gonzalo Pizarro');
INSERT INTO `city` VALUES (194, 22, 'Lago Agrio');
INSERT INTO `city` VALUES (195, 22, 'Putumayo');
INSERT INTO `city` VALUES (196, 22, 'Shushufindi');
INSERT INTO `city` VALUES (197, 22, 'Sucumbíos');
INSERT INTO `city` VALUES (198, 23, 'Ambato');
INSERT INTO `city` VALUES (199, 23, 'Baños de Agua Santa');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `idconfig` int NOT NULL AUTO_INCREMENT,
  `order` int NULL DEFAULT 0,
  `variable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `vvalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idconfig`) USING BTREE,
  INDEX `variable`(`variable` ASC) USING BTREE,
  INDEX `order`(`order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (5, 88, 'switch_ia_bot', 'Bot Switch', 'redneuronal');
INSERT INTO `config` VALUES (8, 0, 'empresa_nombre', 'Nombre Empresa', 'DIPROAVILM Cia. Ltda.');
INSERT INTO `config` VALUES (9, 1, 'empresa_ruc', 'RUC', '1792677610001');
INSERT INTO `config` VALUES (10, 2, 'empresa_direccion', 'Dirección', 'Quito');
INSERT INTO `config` VALUES (11, 3, 'empresa_telefono', 'Teléfono', '0990000001');
INSERT INTO `config` VALUES (12, 4, 'empresa_establecimiento', 'No. Establecimiento', '001');
INSERT INTO `config` VALUES (13, 5, 'empresa_pto_venta', 'No. Punto de Venta', '003');
INSERT INTO `config` VALUES (15, 89, 'rol_bot', 'Rol default de BOT', '5');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `idcountry` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `code` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idcountry`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'Afghanistan', 'AF');
INSERT INTO `country` VALUES (2, 'Albania', 'AL');
INSERT INTO `country` VALUES (3, 'Algeria', 'DZ');
INSERT INTO `country` VALUES (4, 'Andorra', 'AD');
INSERT INTO `country` VALUES (5, 'Angola', 'AO');
INSERT INTO `country` VALUES (6, 'Antigua and Barbuda', 'AG');
INSERT INTO `country` VALUES (7, 'Argentina', 'AR');
INSERT INTO `country` VALUES (8, 'Armenia', 'AM');
INSERT INTO `country` VALUES (9, 'Australia', 'AU');
INSERT INTO `country` VALUES (10, 'Austria', 'AT');
INSERT INTO `country` VALUES (11, 'Azerbaijan', 'AZ');
INSERT INTO `country` VALUES (12, 'Bahamas', 'BS');
INSERT INTO `country` VALUES (13, 'Bahrain', 'BH');
INSERT INTO `country` VALUES (14, 'Bangladesh', 'BD');
INSERT INTO `country` VALUES (15, 'Barbados', 'BB');
INSERT INTO `country` VALUES (16, 'Belarus', 'BY');
INSERT INTO `country` VALUES (17, 'Belgium', 'BE');
INSERT INTO `country` VALUES (18, 'Belize', 'BZ');
INSERT INTO `country` VALUES (19, 'Benin', 'BJ');
INSERT INTO `country` VALUES (20, 'Bhutan', 'BT');
INSERT INTO `country` VALUES (21, 'Bolivia', 'BO');
INSERT INTO `country` VALUES (22, 'Bosnia and Herzegovina', 'BA');
INSERT INTO `country` VALUES (23, 'Botswana', 'BW');
INSERT INTO `country` VALUES (24, 'Brazil', 'BR');
INSERT INTO `country` VALUES (25, 'Brunei', 'BN');
INSERT INTO `country` VALUES (26, 'Bulgaria', 'BG');
INSERT INTO `country` VALUES (27, 'Burkina Faso', 'BF');
INSERT INTO `country` VALUES (28, 'Burundi', 'BI');
INSERT INTO `country` VALUES (29, 'Cabo Verde', 'CV');
INSERT INTO `country` VALUES (30, 'Cambodia', 'KH');
INSERT INTO `country` VALUES (31, 'Cameroon', 'CM');
INSERT INTO `country` VALUES (32, 'Canada', 'CA');
INSERT INTO `country` VALUES (33, 'Central African Republic', 'CF');
INSERT INTO `country` VALUES (34, 'Chad', 'TD');
INSERT INTO `country` VALUES (35, 'Chile', 'CL');
INSERT INTO `country` VALUES (36, 'China', 'CN');
INSERT INTO `country` VALUES (37, 'Colombia', 'CO');
INSERT INTO `country` VALUES (38, 'Comoros', 'KM');
INSERT INTO `country` VALUES (39, 'Congo, Democratic Republic of the', 'CD');
INSERT INTO `country` VALUES (40, 'Congo, Republic of the', 'CG');
INSERT INTO `country` VALUES (41, 'Costa Rica', 'CR');
INSERT INTO `country` VALUES (42, 'Croatia', 'HR');
INSERT INTO `country` VALUES (43, 'Cuba', 'CU');
INSERT INTO `country` VALUES (44, 'Cyprus', 'CY');
INSERT INTO `country` VALUES (45, 'Czech Republic', 'CZ');
INSERT INTO `country` VALUES (46, 'Denmark', 'DK');
INSERT INTO `country` VALUES (47, 'Djibouti', 'DJ');
INSERT INTO `country` VALUES (48, 'Dominica', 'DM');
INSERT INTO `country` VALUES (49, 'Dominican Republic', 'DO');
INSERT INTO `country` VALUES (50, 'Ecuador', 'EC');
INSERT INTO `country` VALUES (51, 'Egypt', 'EG');
INSERT INTO `country` VALUES (52, 'El Salvador', 'SV');
INSERT INTO `country` VALUES (53, 'Equatorial Guinea', 'GQ');
INSERT INTO `country` VALUES (54, 'Eritrea', 'ER');
INSERT INTO `country` VALUES (55, 'Estonia', 'EE');
INSERT INTO `country` VALUES (56, 'Eswatini', 'SZ');
INSERT INTO `country` VALUES (57, 'Ethiopia', 'ET');
INSERT INTO `country` VALUES (58, 'Fiji', 'FJ');
INSERT INTO `country` VALUES (59, 'Finland', 'FI');
INSERT INTO `country` VALUES (60, 'France', 'FR');
INSERT INTO `country` VALUES (61, 'Gabon', 'GA');
INSERT INTO `country` VALUES (62, 'Gambia', 'GM');
INSERT INTO `country` VALUES (63, 'Georgia', 'GE');
INSERT INTO `country` VALUES (64, 'Germany', 'DE');
INSERT INTO `country` VALUES (65, 'Ghana', 'GH');
INSERT INTO `country` VALUES (66, 'Greece', 'GR');
INSERT INTO `country` VALUES (67, 'Grenada', 'GD');
INSERT INTO `country` VALUES (68, 'Guatemala', 'GT');
INSERT INTO `country` VALUES (69, 'Guinea', 'GN');
INSERT INTO `country` VALUES (70, 'Guinea-Bissau', 'GW');
INSERT INTO `country` VALUES (71, 'Guyana', 'GY');
INSERT INTO `country` VALUES (72, 'Haiti', 'HT');
INSERT INTO `country` VALUES (73, 'Honduras', 'HN');
INSERT INTO `country` VALUES (74, 'Hungary', 'HU');
INSERT INTO `country` VALUES (75, 'Iceland', 'IS');
INSERT INTO `country` VALUES (76, 'India', 'IN');
INSERT INTO `country` VALUES (77, 'Indonesia', 'ID');
INSERT INTO `country` VALUES (78, 'Iran', 'IR');
INSERT INTO `country` VALUES (79, 'Iraq', 'IQ');
INSERT INTO `country` VALUES (80, 'Ireland', 'IE');
INSERT INTO `country` VALUES (81, 'Israel', 'IL');
INSERT INTO `country` VALUES (82, 'Italy', 'IT');
INSERT INTO `country` VALUES (83, 'Jamaica', 'JM');
INSERT INTO `country` VALUES (84, 'Japan', 'JP');
INSERT INTO `country` VALUES (85, 'Jordan', 'JO');
INSERT INTO `country` VALUES (86, 'Kazakhstan', 'KZ');
INSERT INTO `country` VALUES (87, 'Kenya', 'KE');
INSERT INTO `country` VALUES (88, 'Kiribati', 'KI');
INSERT INTO `country` VALUES (89, 'Korea, North', 'KP');
INSERT INTO `country` VALUES (90, 'Korea, South', 'KR');
INSERT INTO `country` VALUES (91, 'Kuwait', 'KW');
INSERT INTO `country` VALUES (92, 'Kyrgyzstan', 'KG');
INSERT INTO `country` VALUES (93, 'Laos', 'LA');
INSERT INTO `country` VALUES (94, 'Latvia', 'LV');
INSERT INTO `country` VALUES (95, 'Lebanon', 'LB');
INSERT INTO `country` VALUES (96, 'Lesotho', 'LS');
INSERT INTO `country` VALUES (97, 'Liberia', 'LR');
INSERT INTO `country` VALUES (98, 'Libya', 'LY');
INSERT INTO `country` VALUES (99, 'Liechtenstein', 'LI');
INSERT INTO `country` VALUES (100, 'Lithuania', 'LT');
INSERT INTO `country` VALUES (101, 'Luxembourg', 'LU');
INSERT INTO `country` VALUES (102, 'Madagascar', 'MG');
INSERT INTO `country` VALUES (103, 'Malawi', 'MW');
INSERT INTO `country` VALUES (104, 'Malaysia', 'MY');
INSERT INTO `country` VALUES (105, 'Maldives', 'MV');
INSERT INTO `country` VALUES (106, 'Mali', 'ML');
INSERT INTO `country` VALUES (107, 'Malta', 'MT');
INSERT INTO `country` VALUES (108, 'Marshall Islands', 'MH');
INSERT INTO `country` VALUES (109, 'Mauritania', 'MR');
INSERT INTO `country` VALUES (110, 'Mauritius', 'MU');
INSERT INTO `country` VALUES (111, 'Mexico', 'MX');
INSERT INTO `country` VALUES (112, 'Micronesia', 'FM');
INSERT INTO `country` VALUES (113, 'Moldova', 'MD');
INSERT INTO `country` VALUES (114, 'Monaco', 'MC');
INSERT INTO `country` VALUES (115, 'Mongolia', 'MN');
INSERT INTO `country` VALUES (116, 'Montenegro', 'ME');
INSERT INTO `country` VALUES (117, 'Morocco', 'MA');
INSERT INTO `country` VALUES (118, 'Mozambique', 'MZ');
INSERT INTO `country` VALUES (119, 'Myanmar (Burma)', 'MM');
INSERT INTO `country` VALUES (120, 'Namibia', 'NA');
INSERT INTO `country` VALUES (121, 'Nauru', 'NR');
INSERT INTO `country` VALUES (122, 'Nepal', 'NP');
INSERT INTO `country` VALUES (123, 'Netherlands', 'NL');
INSERT INTO `country` VALUES (124, 'New Zealand', 'NZ');
INSERT INTO `country` VALUES (125, 'Nicaragua', 'NI');
INSERT INTO `country` VALUES (126, 'Niger', 'NE');
INSERT INTO `country` VALUES (127, 'Nigeria', 'NG');
INSERT INTO `country` VALUES (128, 'North Macedonia', 'MK');
INSERT INTO `country` VALUES (129, 'Norway', 'NO');
INSERT INTO `country` VALUES (130, 'Oman', 'OM');
INSERT INTO `country` VALUES (131, 'Pakistan', 'PK');
INSERT INTO `country` VALUES (132, 'Palau', 'PW');
INSERT INTO `country` VALUES (133, 'Palestine', 'PS');
INSERT INTO `country` VALUES (134, 'Panama', 'PA');
INSERT INTO `country` VALUES (135, 'Papua New Guinea', 'PG');
INSERT INTO `country` VALUES (136, 'Paraguay', 'PY');
INSERT INTO `country` VALUES (137, 'Peru', 'PE');
INSERT INTO `country` VALUES (138, 'Philippines', 'PH');
INSERT INTO `country` VALUES (139, 'Poland', 'PL');
INSERT INTO `country` VALUES (140, 'Portugal', 'PT');
INSERT INTO `country` VALUES (141, 'Qatar', 'QA');
INSERT INTO `country` VALUES (142, 'Romania', 'RO');
INSERT INTO `country` VALUES (143, 'Russia', 'RU');
INSERT INTO `country` VALUES (144, 'Rwanda', 'RW');
INSERT INTO `country` VALUES (145, 'Saint Kitts and Nevis', 'KN');
INSERT INTO `country` VALUES (146, 'Saint Lucia', 'LC');
INSERT INTO `country` VALUES (147, 'Saint Vincent and the Grenadines', 'VC');
INSERT INTO `country` VALUES (148, 'Samoa', 'WS');
INSERT INTO `country` VALUES (149, 'San Marino', 'SM');
INSERT INTO `country` VALUES (150, 'Sao Tome and Principe', 'ST');
INSERT INTO `country` VALUES (151, 'Saudi Arabia', 'SA');
INSERT INTO `country` VALUES (152, 'Senegal', 'SN');
INSERT INTO `country` VALUES (153, 'Serbia', 'RS');
INSERT INTO `country` VALUES (154, 'Seychelles', 'SC');
INSERT INTO `country` VALUES (155, 'Sierra Leone', 'SL');
INSERT INTO `country` VALUES (156, 'Singapore', 'SG');
INSERT INTO `country` VALUES (157, 'Slovakia', 'SK');
INSERT INTO `country` VALUES (158, 'Slovenia', 'SI');
INSERT INTO `country` VALUES (159, 'Solomon Islands', 'SB');
INSERT INTO `country` VALUES (160, 'Somalia', 'SO');
INSERT INTO `country` VALUES (161, 'South Africa', 'ZA');
INSERT INTO `country` VALUES (162, 'Spain', 'ES');
INSERT INTO `country` VALUES (163, 'Sri Lanka', 'LK');
INSERT INTO `country` VALUES (164, 'Sudan', 'SD');
INSERT INTO `country` VALUES (165, 'Suriname', 'SR');
INSERT INTO `country` VALUES (166, 'Sweden', 'SE');
INSERT INTO `country` VALUES (167, 'Switzerland', 'CH');
INSERT INTO `country` VALUES (168, 'Syria', 'SY');
INSERT INTO `country` VALUES (169, 'Taiwan', 'TW');
INSERT INTO `country` VALUES (170, 'Tajikistan', 'TJ');
INSERT INTO `country` VALUES (171, 'Tanzania', 'TZ');
INSERT INTO `country` VALUES (172, 'Thailand', 'TH');
INSERT INTO `country` VALUES (173, 'Timor-Leste', 'TL');
INSERT INTO `country` VALUES (174, 'Togo', 'TG');
INSERT INTO `country` VALUES (175, 'Tonga', 'TO');
INSERT INTO `country` VALUES (176, 'Trinidad and Tobago', 'TT');
INSERT INTO `country` VALUES (177, 'Tunisia', 'TN');
INSERT INTO `country` VALUES (178, 'Turkey', 'TR');
INSERT INTO `country` VALUES (179, 'Turkmenistan', 'TM');
INSERT INTO `country` VALUES (180, 'Tuvalu', 'TV');
INSERT INTO `country` VALUES (181, 'Uganda', 'UG');
INSERT INTO `country` VALUES (182, 'Ukraine', 'UA');
INSERT INTO `country` VALUES (183, 'United Arab Emirates', 'AE');
INSERT INTO `country` VALUES (184, 'United Kingdom', 'GB');
INSERT INTO `country` VALUES (185, 'United States', 'US');
INSERT INTO `country` VALUES (186, 'Uruguay', 'UY');
INSERT INTO `country` VALUES (187, 'Uzbekistan', 'UZ');
INSERT INTO `country` VALUES (188, 'Vanuatu', 'VU');
INSERT INTO `country` VALUES (189, 'Vatican City', 'VA');
INSERT INTO `country` VALUES (190, 'Venezuela', 'VE');
INSERT INTO `country` VALUES (191, 'Vietnam', 'VN');
INSERT INTO `country` VALUES (192, 'Yemen', 'YE');
INSERT INTO `country` VALUES (193, 'Zambia', 'ZM');
INSERT INTO `country` VALUES (194, 'Zimbabwe', 'ZW');

-- ----------------------------
-- Table structure for identificationtype
-- ----------------------------
DROP TABLE IF EXISTS `identificationtype`;
CREATE TABLE `identificationtype`  (
  `ididentificationtype` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  PRIMARY KEY (`ididentificationtype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of identificationtype
-- ----------------------------
INSERT INTO `identificationtype` VALUES (1, 'RUC');
INSERT INTO `identificationtype` VALUES (2, 'CEDULA');
INSERT INTO `identificationtype` VALUES (3, 'PASAPORTE');
INSERT INTO `identificationtype` VALUES (4, 'CONSUMIDOR FINAL');
INSERT INTO `identificationtype` VALUES (5, 'IDENTIFICACION DEL EXTERIOR');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `idmenu` int NOT NULL AUTO_INCREMENT,
  `order` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '' COMMENT '01 o 0101',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '' COMMENT '/',
  `submenu` int NULL DEFAULT 0 COMMENT '1-Si es submenu 0-No es submenu',
  `status` int NULL DEFAULT 1 COMMENT '1-Active   0-Inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idmenu`) USING BTREE,
  INDEX `order`(`order` ASC) USING BTREE,
  INDEX `route`(`route` ASC) USING BTREE,
  INDEX `submenu`(`submenu` ASC) USING BTREE,
  INDEX `status`(`status` ASC) USING BTREE,
  INDEX `deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '02', 'Administación', 'fa fa-cog', NULL, 1, 1, '2024-06-21 15:00:39', '2024-08-09 10:27:27', NULL);
INSERT INTO `menu` VALUES (2, '02.01', 'Usuarios', 'fas fa-user', 'users', 0, 1, '2024-06-21 15:00:50', '2024-08-09 10:27:32', NULL);
INSERT INTO `menu` VALUES (3, '02.03', 'Roles', 'fas fa-shield-alt', 'roles', 0, 1, '2024-06-21 15:01:00', '2024-08-13 12:31:28', NULL);
INSERT INTO `menu` VALUES (4, '02.02', 'Menú de Opciones', 'fas fa-prescription-bottle', 'menu', 0, 1, '2024-06-21 15:01:10', '2024-08-17 00:36:51', NULL);
INSERT INTO `menu` VALUES (5, '03.01', 'Beneficiarios', 'fas fa-briefcase', 'beneficiarios', 0, 1, '2024-06-21 15:01:45', '2024-08-17 00:11:30', NULL);
INSERT INTO `menu` VALUES (6, '03', 'Almacén', 'fas fa-box-open', NULL, 1, 1, '2024-06-21 15:09:14', '2024-08-09 10:27:55', NULL);
INSERT INTO `menu` VALUES (7, '03.03', 'Registro de movimientos', 'fas fa-truck-loading', 'movimientos', 0, 1, '2024-06-21 15:09:17', '2024-08-23 01:07:48', NULL);
INSERT INTO `menu` VALUES (8, '03.02', 'Productos', 'fas fa-box-open', 'productos', 0, 1, '2024-06-21 15:09:43', '2024-08-17 00:11:48', NULL);
INSERT INTO `menu` VALUES (9, '01', 'Dashboards', 'fas fa-chart-bar', NULL, 1, 1, '2024-06-21 15:09:59', '2024-08-09 10:27:23', NULL);
INSERT INTO `menu` VALUES (10, '04', 'Informes', 'far fa-file-archive', NULL, 1, 1, '2024-06-21 15:49:08', '2024-08-09 10:28:06', NULL);
INSERT INTO `menu` VALUES (11, '04.01', 'Listado de Usuarios', 'far fa-file-archive', 'lst_usuarios', 0, 1, '2024-06-21 15:49:22', '2024-08-09 10:28:09', NULL);
INSERT INTO `menu` VALUES (12, '04.02', 'LIstado de Productos', 'far fa-file-archive', 'lst_productos', 0, 1, '2024-06-21 15:49:27', '2024-08-09 10:28:10', NULL);
INSERT INTO `menu` VALUES (13, '04.03', 'Listado de Beneficiarios', 'far fa-file-archive', 'lst_beneficiarios', 0, 1, '2024-06-21 15:49:35', '2024-08-09 10:28:12', NULL);
INSERT INTO `menu` VALUES (14, '04.04', 'Kardex por producto', 'far fa-file-archive', 'lst_kardex', 0, 1, '2024-06-21 15:49:40', '2024-08-09 10:28:15', NULL);
INSERT INTO `menu` VALUES (15, '01.01', 'Ventas', 'fas fa-chart-bar', 'dashventas', 0, 1, '2024-07-25 21:23:01', '2024-08-09 10:27:25', NULL);
INSERT INTO `menu` VALUES (16, '05', 'Integración Bot', 'fas fa-robot', '', 1, 1, '2024-07-25 21:49:52', '2024-08-09 10:28:22', NULL);
INSERT INTO `menu` VALUES (17, '05.01', 'Configuración', 'fa fa-cog', 'bot_config', 0, 1, '2024-07-25 21:50:16', '2024-08-26 19:16:47', '2024-08-26 19:16:47');
INSERT INTO `menu` VALUES (18, '05.02', 'Capas Entrada y Salida', 'fas fa-layer-group', 'bot_capas', 0, 1, '2024-07-25 21:50:58', '2024-08-09 10:28:28', NULL);
INSERT INTO `menu` VALUES (19, '05.03', 'Diccionario de Acciones', 'fas fa-shoe-prints', 'bot_dict', 0, 1, '2024-07-25 21:51:08', '2024-08-09 10:28:31', NULL);
INSERT INTO `menu` VALUES (20, '05.05', 'Auditoría', 'fas fa-user-secret', 'bot_audit', 0, 1, '2024-07-25 21:51:17', '2024-08-09 10:28:39', NULL);
INSERT INTO `menu` VALUES (21, '02.04', 'Auditoría', 'fas fa-user-secret', 'audit', 0, 1, '2024-07-25 21:51:27', '2024-08-13 12:31:39', NULL);
INSERT INTO `menu` VALUES (22, '05.04', 'Usuarios Registrados', 'fab fa-telegram-plane', 'bot_users', 0, 1, '2024-07-25 21:51:48', '2024-08-09 10:28:36', NULL);
INSERT INTO `menu` VALUES (28, '03.04', 'Kardex', 'fas fa-boxes', 'kardex', 0, 1, '2024-08-16 23:00:38', '2024-08-17 00:11:42', NULL);
INSERT INTO `menu` VALUES (29, '04.05', 'Productos por número de movimientos', 'far fa-file-archive', 'lst_nummovimientos', 0, 1, '2024-08-17 01:04:49', '2024-08-17 01:06:29', NULL);
INSERT INTO `menu` VALUES (30, '04.06', 'Inventario Valorizado', 'far fa-file-archive', 'lst_invvalorado', 0, 1, '2024-08-17 01:06:24', '2024-08-17 01:06:49', NULL);
INSERT INTO `menu` VALUES (35, '01.02', 'Compras', 'fas fa-chart-bar', 'dashcompras', 0, 1, '2024-08-17 01:38:33', '2024-08-17 01:38:54', NULL);
INSERT INTO `menu` VALUES (36, '03.05', 'Tipo de Comprobantes', 'fas fa-ticket-alt', 'movtipo', 0, 1, '2024-08-19 09:33:33', '2024-08-23 01:07:40', NULL);
INSERT INTO `menu` VALUES (37, '02.05', 'Configuracion General', 'fa fa-cog', 'config', 0, 1, '2024-08-19 11:23:18', '2024-08-19 11:23:18', NULL);

-- ----------------------------
-- Table structure for movementtype
-- ----------------------------
DROP TABLE IF EXISTS `movementtype`;
CREATE TABLE `movementtype`  (
  `idmovementtype` int NOT NULL AUTO_INCREMENT,
  `acronym` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `sequential` bigint NOT NULL DEFAULT 0,
  `beneficiarytype` enum('P','C','A','E') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'P' COMMENT 'P-Proveedores   C-Clientes',
  `entry` enum('I','E','A') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'I' COMMENT 'I-Ingreso E-Egreso A-Ambos asientos pueden coexistir',
  `typevalue` enum('C','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'C' COMMENT 'C-Costo P-PVP',
  `calculatenumdoc` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0' COMMENT '1-Si 0-No',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idmovementtype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movementtype
-- ----------------------------
INSERT INTO `movementtype` VALUES (1, 'FV', 'Venta', 30, 'C', 'E', 'P', '1', '2024-08-22 23:33:21', '2024-08-23 00:51:08', NULL);
INSERT INTO `movementtype` VALUES (2, 'FC', 'Compra', 0, 'P', 'I', 'C', '0', '2024-08-22 23:33:21', '2024-08-23 00:51:03', NULL);
INSERT INTO `movementtype` VALUES (4, 'AI', 'Ajuste de Inventario ', 4, 'E', 'A', 'C', '1', '2024-08-22 23:33:21', '2024-08-22 23:33:21', NULL);
INSERT INTO `movementtype` VALUES (5, 'DE', 'Descarga de Inventario', 0, 'E', 'E', 'C', '1', '2024-08-22 23:33:21', '2024-08-22 23:33:21', NULL);
INSERT INTO `movementtype` VALUES (9, 'ssss', 'asd2SSsdasa', 0, 'P', 'I', 'C', '0', '2024-08-23 00:49:18', '2024-08-23 00:50:41', '2024-08-23 00:50:41');

-- ----------------------------
-- Table structure for presentation
-- ----------------------------
DROP TABLE IF EXISTS `presentation`;
CREATE TABLE `presentation`  (
  `idpresentation` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  `acronym` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  PRIMARY KEY (`idpresentation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of presentation
-- ----------------------------
INSERT INTO `presentation` VALUES (1, 'UNIDAD', 'U');
INSERT INTO `presentation` VALUES (2, 'GALON', 'GL');
INSERT INTO `presentation` VALUES (3, 'LITRO', 'LT');
INSERT INTO `presentation` VALUES (4, 'CANECA', 'CN');
INSERT INTO `presentation` VALUES (5, 'METRO', 'MTR');
INSERT INTO `presentation` VALUES (6, 'LIBRA', 'LBR');
INSERT INTO `presentation` VALUES (7, 'KILOGRAMO', 'KG');
INSERT INTO `presentation` VALUES (8, 'ROLLO', 'ROL');
INSERT INTO `presentation` VALUES (9, 'METRO CUADRADO', 'M2');
INSERT INTO `presentation` VALUES (10, 'METRO CUBICO', 'M3');
INSERT INTO `presentation` VALUES (11, 'QUINTAL', 'qq');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `idpresentation` int NOT NULL,
  `idproductline` int NOT NULL,
  `idproductcategory` int NOT NULL,
  `productcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `cost` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `stock` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `price` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `stock_min` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `stock_max` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  `status` int NULL DEFAULT 1 COMMENT '1-Active    0-Inactive',
  `accountcost` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  `accountsales` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  `accountinv` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `udated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idproduct`) USING BTREE,
  INDEX `IDXPre`(`idpresentation` ASC) USING BTREE,
  INDEX `IDXLine`(`idproductline` ASC) USING BTREE,
  INDEX `IDXCategory`(`idproductcategory` ASC) USING BTREE,
  CONSTRAINT `IDXCategory` FOREIGN KEY (`idproductcategory`) REFERENCES `productcategory` (`idproductcategory`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXLine` FOREIGN KEY (`idproductline`) REFERENCES `productline` (`idproductline`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXPre` FOREIGN KEY (`idpresentation`) REFERENCES `presentation` (`idpresentation`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 7, 1, 1, 'P000000012', '1281320086946', 'AFRECHO DE TRIGO', 'AFRECHO DE TRIGO', 5.0000, 173.0000, 7.50, 1.0000, 45.1000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-26 19:14:58', NULL);
INSERT INTO `product` VALUES (2, 1, 2, 2, 'BC001', '2201909185029', 'BAL. CUNIFORTE C1 CRECIMIENTO 40KG', 'BAL. CUNIFORTE C1 CRECIMIENTO 40KG', 2.0000, 39.0000, 3.00, 1.0000, 2.2000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (3, 1, 2, 2, 'BC002', '2201909186637', 'BAL. CUNIFORTE C2 ENGORDE 40KG', 'BAL. CUNIFORTE C2 ENGORDE 40KG', 2.0000, 69.0000, 3.00, 1.0000, 60.5000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (4, 1, 2, 2, 'BC003', '2201909186712', 'BAL. CUNIFORTE C3 REPRODUCTORES 40KG', 'BAL. CUNIFORTE C3 REPRODUCTORES 40KG', 2.0000, 79.0000, 3.00, 1.0000, 60.5000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (5, 1, 3, 3, 'P000000048', '1311719106792', 'BAL. MED APE1  PREINICIAL PELLET BR. 40 KG', 'BAL. MED APE1  PREINICIAL PELLET BR. 40 KG', 3.0000, 67.0000, 4.50, 1.0000, 7.7000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (6, 1, 2, 2, 'BP001', '2201909183148', 'BAL. PORCIFORTE P1 INICIAL PELLET 40 KG', 'BAL. PORCIFORTE P1 INICIAL PELLET 40 KG', 2.0000, 31.0000, 3.00, 1.0000, 78.1000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (7, 1, 2, 2, 'BP002', '2201909183254', 'BAL. PORCIFORTE P2 CRECIMIENTO PELLET 40 KG', 'BAL. PORCIFORTE P2 CRECIMIENTO PELLET 40 KG', 2.0000, 33.0000, 3.00, 1.0000, 47.3000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:22:33', NULL);
INSERT INTO `product` VALUES (8, 1, 2, 2, 'BP003', '2201909183315', 'BAL. PORCIFORTE P3 ENGORDE PELLET 40 KG', 'BAL. PORCIFORTE P3 ENGORDE PELLET 40 KG', 2.0000, 82.0000, 3.00, 1.0000, 108.9000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (9, 1, 2, 2, 'BP004', '2201909183377', 'BAL. PORCIFORTE P4 GESTACION PELLET 40 KG', 'BAL. PORCIFORTE P4 GESTACION PELLET 40 KG', 2.0000, 28.0000, 3.00, 1.0000, 73.7000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:22:33', NULL);
INSERT INTO `product` VALUES (10, 1, 2, 2, 'BP005', '2201909184961', 'BAL. PORCIFORTE P5 LACTANCIA PELLET 40 KG', 'BAL. PORCIFORTE P5 LACTANCIA PELLET 40 KG', 2.0000, 26.0000, 3.00, 1.0000, 34.1000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:22:33', NULL);
INSERT INTO `product` VALUES (11, 1, 3, 3, 'P000000038', '9271759134488', 'BAL. PREINICIAL PELLET BR. 40 KG', 'BAL. PREINICIAL PELLET BR. 40 KG', 2.0000, 68.0000, 3.00, 1.0000, 22.0000, '', 1, '5.1.01.01.01', '4.1.01.01', '1.1.03.01.01', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (12, 1, 2, 2, 'BAI', '2201909186774', 'BALVIT  INICIAL PELLET BR. 40 KG CAL', 'BALVIT  INICIAL PELLET BR. 40 KG CAL', 2.0000, 72.0000, 3.00, 1.0000, 6.6000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (13, 1, 2, 2, 'BCC', '2201909191891', 'BALVIT CERDOS CRECIMIENTO PELLET 40 KG CAL', 'BALVIT CERDOS CRECIMIENTO PELLET 40 KG CAL', 2.0000, 33.0000, 3.00, 1.0000, 28.6000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (14, 1, 2, 2, 'BCE', '2201909191983', 'BALVIT CERDOS ENGORDE PELLET 40 KG CAL', 'BALVIT CERDOS ENGORDE PELLET 40 KG CAL', 2.0000, 67.0000, 3.00, 1.0000, 139.7000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (15, 1, 2, 2, 'BAF', '2201909186828', 'BALVIT FINALIZADOR PELLET BR. 40 KG CAL', 'BALVIT FINALIZADOR PELLET BR. 40 KG CAL', 2.0000, 49.0000, 3.00, 1.0000, 38.5000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (16, 1, 3, 3, 'P000000031', '9132052567598', 'BANDEJA CP-100 COMEDERO (PACA)', 'BANDEJA CP-100 COMEDERO (PACA)', 2.0000, 80.0000, 3.00, 1.0000, 1.1000, '', 1, '5.1.01.01.01', '4.1.01.01', '1.1.03.01.01', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (17, 1, 2, 3, 'P000000040', '1111753189153', 'CALIER PROACID 20 KG', 'CALIER PROACID 20 KG', 11.0675, 163.0000, 12.00, 1.0000, 139.7000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (18, 1, 2, 3, 'P000000041', '1111841491823', 'CALIERMUTIN 100 PREMIX X 25 KG', 'CALIERMUTIN 100 PREMIX X 25 KG', 1.0000, 67.0000, 1.50, 1.0000, 4.4000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (19, 10, 1, 2, 'P000000005', '1071747301964', 'CHASQUI', 'CHASQUI', 1.0000, 71.0000, 1.50, 1.0000, 89.1000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (20, 1, 2, 3, 'P000000043', '9271818561866', 'DESINFECTANTE TH4 5 LT', 'DESINFECTANTE TH4 5 LT', 8.0000, 44.0000, 12.00, 1.0000, 11.0000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (21, 1, 2, 3, 'P000000044', '1111900267789', 'DESINFECTANTE TH4 X 1 LITRO', 'DESINFECTANTE TH4 X 1 LITRO', 1.0000, 66.0000, 1.50, 1.0000, 8.8000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (22, 1, 2, 3, 'P000000045', '1111901040657', 'DESINFECTANTE TH4 X 25 LITROS', 'DESINFECTANTE TH4 X 25 LITROS', 2.0000, -25.0000, 3.00, 1.0000, 2.2000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:22:33', NULL);
INSERT INTO `product` VALUES (23, 1, 3, 3, '00022', '1300945551049', 'DESPADAC X 25 L', 'DESPADAC X 25 L', 1.0000, 11.0000, 1.50, 1.0000, 2.2000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (24, 1, 2, 3, 'P000000046', '1111901366429', 'DETERSTORM X 25 KG', 'DETERSTORM X 25 KG', 1.0000, 55.0000, 1.50, 1.0000, 34.1000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (25, 1, 3, 3, '00090', '1271302276465', 'HEPATOLAY 5 L', 'HEPATOLAY 5 L', 4.0000, 31.0000, 6.00, 1.0000, 30.8000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (26, 1, 3, 3, 'P000000034', '9132119151296', 'HIPRAGUMBORO CH/80 * 5000 DS', 'HIPRAGUMBORO CH/80 * 5000 DS', 1.0000, 55.0000, 1.50, 1.0000, 20.9000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.03.01', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (27, 1, 3, 3, 'P000000035', '9132119151425', 'HIPRAVIAR S/H120 2500 DS (NEW.BRONQ.)', 'HIPRAVIAR S/H120 2500 DS (NEW.BRONQ.)', 9.0000, 50.0000, 13.50, 1.0000, 29.7000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.03.01', '2024-07-11 00:46:36', '2024-08-23 18:22:33', NULL);
INSERT INTO `product` VALUES (28, 1, 3, 3, '00031', '1300950349907', 'INMUNAIR-17.5 X 500 CC', 'INMUNAIR-17.5 X 500 CC', 4.0000, 42.0000, 6.00, 1.0000, 3.3000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (29, 11, 1, 1, 'P000000003', '1061540376221', 'MAIZ AMARILLO', 'MAIZ AMARILLO', 1.0000, 75.0000, 1.50, 1.0000, 1.1000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (30, 1, 4, 4, 'P000000024', '8311002014981', 'POLLO BB', 'POLLO BB', 0.3832, -424.0000, 1.28, 1.0000, 15.4000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:22:33', NULL);
INSERT INTO `product` VALUES (31, 1, 2, 4, 'P000000025', '9080043093741', 'POLLO CRIOLLO', 'POLLO CRIOLLO', 0.2036, 54.0000, 0.50, 1.0000, 22.0000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (32, 6, 4, 4, 'P000000021', '1081729085065', 'POLLO VIVO', 'POLLO VIVO', 0.7358, 31.0000, 1.32, 1.0000, 17.6000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (33, 1, 2, 3, 'P000000042', '1111848444723', 'PROMOTOR L X GL', 'PROMOTOR L X GL', 5.0000, 114.0000, 7.50, 1.0000, 20.9000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (34, 1, 3, 3, '00088', '1300948596887', 'TILMICOSIN', 'TILMICOSIN', 6.0000, 59.0000, 9.00, 1.0000, 26.4000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (35, 1, 2, 3, 'P000000047', '1131527422941', 'ZOOBIOTIC GLOBULIT  25 kg', 'ZOOBIOTIC GLOBULIT  25 kg', 3.0000, 28.0000, 4.50, 1.0000, 26.4000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (36, 1, 2, 2, '00036', '1091643233541', 'ZURITOL  2.5  1 L', 'ZURITOL  2.5  1 L', 5.0000, 54.0000, 7.50, 1.0000, 42.9000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-07-11 00:46:36', '2024-08-23 18:19:20', NULL);
INSERT INTO `product` VALUES (41, 1, 2, 4, 'A1', 'A2', 'AAAAAA', 'Cosa aaaa', 0.0000, 0.0000, 2.00, 0.0000, 0.0000, '', 1, '', '', '', '2024-08-14 01:38:39', '2024-08-14 02:10:43', '2024-08-14 02:10:43');
INSERT INTO `product` VALUES (42, 1, 1, 1, '21343243das', '87954612321321', 'BBBBB', 'BBBB', 0.0000, 0.0000, 15.00, 0.0000, 0.0000, '', 1, '5.1.01.01.02', '4.1.01.02', '1.1.03.01.02', '2024-08-16 23:19:06', '2024-08-16 23:19:19', '2024-08-16 23:19:19');

-- ----------------------------
-- Table structure for productcategory
-- ----------------------------
DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory`  (
  `idproductcategory` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idproductcategory`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productcategory
-- ----------------------------
INSERT INTO `productcategory` VALUES (1, 'CEREALES');
INSERT INTO `productcategory` VALUES (2, 'MATERIAL PETREO');
INSERT INTO `productcategory` VALUES (3, 'SUMINISTROS Y MATERIALES');
INSERT INTO `productcategory` VALUES (4, 'ANIMALES EN PIE');
INSERT INTO `productcategory` VALUES (5, 'Tracto Camión Shacman');

-- ----------------------------
-- Table structure for productline
-- ----------------------------
DROP TABLE IF EXISTS `productline`;
CREATE TABLE `productline`  (
  `idproductline` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idproductline`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productline
-- ----------------------------
INSERT INTO `productline` VALUES (1, 'PRODUCTOS ESTADO NATURAL');
INSERT INTO `productline` VALUES (2, 'GENERAL');
INSERT INTO `productline` VALUES (3, 'SUMINISTROS Y MATERIALES');
INSERT INTO `productline` VALUES (4, 'ANIMALES');
INSERT INTO `productline` VALUES (5, 'VEHICULOS PESADOS');

-- ----------------------------
-- Table structure for productmovement
-- ----------------------------
DROP TABLE IF EXISTS `productmovement`;
CREATE TABLE `productmovement`  (
  `idmovmentproduct` int NOT NULL AUTO_INCREMENT,
  `idtransaction` int NOT NULL,
  `idproduct` int NOT NULL,
  `qty` double(20, 4) NOT NULL DEFAULT 0.0000,
  `entry` enum('I','E') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'I' COMMENT 'I-Ingreso  E-Egreso',
  `price` double(20, 4) NOT NULL DEFAULT 0.0000,
  `total` double(20, 4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`idmovmentproduct`) USING BTREE,
  INDEX `IDXPRO`(`idproduct` ASC) USING BTREE,
  INDEX `IDXTRAS`(`idtransaction` ASC) USING BTREE,
  CONSTRAINT `IDXPRO` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXTRAS` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1794 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productmovement
-- ----------------------------
INSERT INTO `productmovement` VALUES (1, 1, 36, 54.0000, 'I', 5.0000, 270.0000);
INSERT INTO `productmovement` VALUES (2, 1, 1, 97.0000, 'I', 5.0000, 485.0000);
INSERT INTO `productmovement` VALUES (3, 1, 2, 70.0000, 'I', 2.0000, 140.0000);
INSERT INTO `productmovement` VALUES (4, 1, 3, 92.0000, 'I', 2.0000, 184.0000);
INSERT INTO `productmovement` VALUES (5, 1, 4, 25.0000, 'I', 2.0000, 50.0000);
INSERT INTO `productmovement` VALUES (6, 1, 5, 95.0000, 'I', 3.0000, 285.0000);
INSERT INTO `productmovement` VALUES (7, 1, 6, 53.0000, 'I', 2.0000, 106.0000);
INSERT INTO `productmovement` VALUES (8, 1, 7, 20.0000, 'I', 2.0000, 40.0000);
INSERT INTO `productmovement` VALUES (9, 2, 35, 56.0000, 'I', 3.0000, 168.0000);
INSERT INTO `productmovement` VALUES (10, 2, 8, 86.0000, 'I', 2.0000, 172.0000);
INSERT INTO `productmovement` VALUES (11, 2, 9, 60.0000, 'I', 2.0000, 120.0000);
INSERT INTO `productmovement` VALUES (12, 2, 10, 72.0000, 'I', 2.0000, 144.0000);
INSERT INTO `productmovement` VALUES (13, 2, 11, 37.0000, 'I', 2.0000, 74.0000);
INSERT INTO `productmovement` VALUES (14, 2, 12, 98.0000, 'I', 2.0000, 196.0000);
INSERT INTO `productmovement` VALUES (15, 2, 13, 53.0000, 'I', 2.0000, 106.0000);
INSERT INTO `productmovement` VALUES (16, 2, 14, 96.0000, 'I', 2.0000, 192.0000);
INSERT INTO `productmovement` VALUES (17, 2, 15, 58.0000, 'I', 2.0000, 116.0000);
INSERT INTO `productmovement` VALUES (18, 2, 16, 29.0000, 'I', 2.0000, 58.0000);
INSERT INTO `productmovement` VALUES (19, 2, 17, 55.0000, 'I', 8.0000, 440.0000);
INSERT INTO `productmovement` VALUES (20, 2, 18, 100.0000, 'I', 1.0000, 100.0000);
INSERT INTO `productmovement` VALUES (21, 2, 19, 98.0000, 'I', 1.0000, 98.0000);
INSERT INTO `productmovement` VALUES (22, 2, 20, 66.0000, 'I', 8.0000, 528.0000);
INSERT INTO `productmovement` VALUES (23, 2, 21, 89.0000, 'I', 1.0000, 89.0000);
INSERT INTO `productmovement` VALUES (24, 2, 22, 57.0000, 'I', 2.0000, 114.0000);
INSERT INTO `productmovement` VALUES (25, 2, 23, 45.0000, 'I', 1.0000, 45.0000);
INSERT INTO `productmovement` VALUES (26, 2, 24, 78.0000, 'I', 1.0000, 78.0000);
INSERT INTO `productmovement` VALUES (27, 2, 25, 24.0000, 'I', 4.0000, 96.0000);
INSERT INTO `productmovement` VALUES (28, 3, 35, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (29, 3, 2, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (30, 3, 20, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (31, 3, 5, 5.0000, 'I', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (32, 3, 14, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (33, 3, 16, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (34, 3, 23, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (35, 3, 1, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (36, 3, 25, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (37, 3, 17, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (38, 3, 34, 1.0000, 'I', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (39, 3, 28, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (40, 3, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (41, 3, 19, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (42, 3, 22, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (43, 3, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (44, 3, 24, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (45, 3, 8, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (46, 3, 18, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (47, 3, 10, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (48, 3, 6, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (49, 3, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (50, 3, 31, 3.0000, 'I', 0.3300, 0.9900);
INSERT INTO `productmovement` VALUES (51, 3, 11, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (52, 3, 32, 3.0000, 'I', 0.8800, 2.6400);
INSERT INTO `productmovement` VALUES (53, 3, 3, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (54, 3, 15, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (55, 3, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (56, 3, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (57, 3, 29, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (58, 3, 21, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (59, 3, 12, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (60, 3, 27, 2.0000, 'I', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (61, 3, 9, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (62, 3, 13, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (63, 4, 25, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (64, 4, 29, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (65, 4, 6, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (66, 4, 21, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (67, 4, 2, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (68, 4, 28, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (69, 4, 4, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (70, 4, 8, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (71, 4, 5, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (72, 4, 20, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (73, 4, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (74, 4, 23, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (75, 4, 26, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (76, 4, 34, 3.0000, 'I', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (77, 4, 12, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (78, 4, 32, 1.0000, 'I', 0.8800, 0.8800);
INSERT INTO `productmovement` VALUES (79, 4, 19, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (80, 4, 33, 2.0000, 'I', 5.0000, 10.0000);
INSERT INTO `productmovement` VALUES (81, 4, 18, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (82, 4, 22, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (83, 4, 31, 4.0000, 'I', 0.3300, 1.3200);
INSERT INTO `productmovement` VALUES (84, 4, 35, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (85, 4, 7, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (86, 4, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (87, 4, 24, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (88, 4, 10, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (89, 4, 15, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (90, 4, 1, 2.0000, 'I', 5.0000, 10.0000);
INSERT INTO `productmovement` VALUES (91, 4, 11, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (92, 4, 17, 3.0000, 'I', 8.0000, 24.0000);
INSERT INTO `productmovement` VALUES (93, 4, 9, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (94, 4, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (95, 4, 13, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (96, 4, 27, 3.0000, 'I', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (97, 4, 14, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (98, 5, 18, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (99, 5, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (100, 5, 32, 3.0000, 'E', 1.3200, 3.9600);
INSERT INTO `productmovement` VALUES (101, 5, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (102, 5, 7, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (103, 5, 14, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (104, 5, 25, 3.0000, 'E', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (105, 5, 24, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (106, 5, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (107, 5, 26, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (108, 5, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (109, 5, 27, 5.0000, 'E', 13.5000, 67.5000);
INSERT INTO `productmovement` VALUES (110, 5, 15, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (111, 5, 5, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (112, 5, 21, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (113, 5, 6, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (114, 5, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (115, 5, 16, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (116, 5, 28, 5.0000, 'E', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (117, 5, 17, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (118, 5, 4, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (119, 5, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (120, 5, 12, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (121, 5, 30, 1.0000, 'E', 1.2800, 1.2800);
INSERT INTO `productmovement` VALUES (122, 5, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (123, 5, 8, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (124, 5, 19, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (125, 5, 13, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (126, 5, 31, 3.0000, 'E', 0.5000, 1.5000);
INSERT INTO `productmovement` VALUES (127, 5, 11, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (128, 5, 23, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (129, 5, 10, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (130, 5, 35, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (131, 5, 2, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (132, 5, 33, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (133, 6, 27, 1.0000, 'I', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (134, 6, 6, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (135, 6, 21, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (136, 6, 12, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (137, 6, 29, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (138, 6, 20, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (139, 6, 15, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (140, 6, 14, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (141, 6, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (142, 6, 5, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (143, 6, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (144, 6, 19, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (145, 6, 18, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (146, 6, 25, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (147, 6, 31, 5.0000, 'I', 0.3300, 1.6500);
INSERT INTO `productmovement` VALUES (148, 6, 28, 2.0000, 'I', 4.0000, 8.0000);
INSERT INTO `productmovement` VALUES (149, 6, 11, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (150, 6, 17, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (151, 6, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (152, 6, 24, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (153, 6, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (154, 6, 22, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (155, 6, 34, 4.0000, 'I', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (156, 6, 8, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (157, 6, 13, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (158, 6, 35, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (159, 6, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (160, 6, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (161, 6, 4, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (162, 6, 10, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (163, 6, 2, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (164, 6, 9, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (165, 6, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (166, 6, 23, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (167, 6, 1, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (168, 7, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (169, 7, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (170, 7, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (171, 7, 13, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (172, 7, 29, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (173, 7, 33, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (174, 7, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (175, 7, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (176, 7, 24, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (177, 7, 5, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (178, 7, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (179, 7, 32, 5.0000, 'E', 1.3200, 6.6000);
INSERT INTO `productmovement` VALUES (180, 7, 26, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (181, 7, 16, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (182, 7, 2, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (183, 7, 17, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (184, 7, 23, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (185, 7, 28, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (186, 7, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (187, 7, 22, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (188, 7, 25, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (189, 7, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (190, 7, 18, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (191, 7, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (192, 7, 4, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (193, 7, 7, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (194, 7, 21, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (195, 7, 35, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (196, 7, 8, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (197, 7, 12, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (198, 7, 19, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (199, 7, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (200, 7, 14, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (201, 7, 30, 3.0000, 'E', 1.2800, 3.8400);
INSERT INTO `productmovement` VALUES (202, 8, 30, 3.0000, 'I', 0.8500, 2.5500);
INSERT INTO `productmovement` VALUES (203, 8, 25, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (204, 8, 14, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (205, 8, 17, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (206, 8, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (207, 8, 10, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (208, 8, 9, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (209, 8, 18, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (210, 8, 33, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (211, 8, 5, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (212, 8, 15, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (213, 8, 24, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (214, 8, 23, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (215, 8, 1, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (216, 8, 6, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (217, 8, 26, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (218, 8, 20, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (219, 8, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (220, 8, 3, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (221, 8, 35, 5.0000, 'I', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (222, 8, 34, 1.0000, 'I', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (223, 8, 28, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (224, 8, 31, 1.0000, 'I', 0.3300, 0.3300);
INSERT INTO `productmovement` VALUES (225, 8, 29, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (226, 8, 7, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (227, 8, 4, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (228, 8, 32, 5.0000, 'I', 0.8800, 4.4000);
INSERT INTO `productmovement` VALUES (229, 8, 13, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (230, 8, 27, 5.0000, 'I', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (231, 8, 11, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (232, 8, 19, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (233, 8, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (234, 8, 21, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (235, 8, 22, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (236, 8, 16, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (237, 9, 12, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (238, 9, 33, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (239, 9, 18, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (240, 9, 15, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (241, 9, 4, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (242, 9, 2, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (243, 9, 11, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (244, 9, 25, 5.0000, 'E', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (245, 9, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (246, 9, 23, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (247, 9, 27, 3.0000, 'E', 13.5000, 40.5000);
INSERT INTO `productmovement` VALUES (248, 9, 16, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (249, 9, 21, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (250, 9, 32, 4.0000, 'E', 1.3200, 5.2800);
INSERT INTO `productmovement` VALUES (251, 9, 5, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (252, 9, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (253, 9, 8, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (254, 9, 10, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (255, 9, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (256, 9, 9, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (257, 9, 34, 4.0000, 'E', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (258, 9, 13, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (259, 9, 26, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (260, 9, 19, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (261, 9, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (262, 9, 14, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (263, 9, 31, 5.0000, 'E', 0.5000, 2.5000);
INSERT INTO `productmovement` VALUES (264, 9, 35, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (265, 9, 7, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (266, 9, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (267, 9, 24, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (268, 9, 3, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (269, 9, 30, 1.0000, 'E', 1.2800, 1.2800);
INSERT INTO `productmovement` VALUES (270, 9, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (271, 9, 6, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (272, 10, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (273, 10, 32, 3.0000, 'E', 1.3200, 3.9600);
INSERT INTO `productmovement` VALUES (274, 10, 16, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (275, 10, 26, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (276, 10, 14, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (277, 10, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (278, 10, 19, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (279, 10, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (280, 10, 5, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (281, 10, 3, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (282, 10, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (283, 10, 20, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (284, 10, 15, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (285, 10, 27, 2.0000, 'E', 13.5000, 27.0000);
INSERT INTO `productmovement` VALUES (286, 10, 8, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (287, 10, 24, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (288, 10, 4, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (289, 10, 31, 5.0000, 'E', 0.5000, 2.5000);
INSERT INTO `productmovement` VALUES (290, 10, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (291, 10, 29, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (292, 10, 10, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (293, 10, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (294, 10, 34, 1.0000, 'E', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (295, 10, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (296, 10, 21, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (297, 10, 7, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (298, 10, 23, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (299, 10, 18, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (300, 10, 2, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (301, 10, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (302, 10, 22, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (303, 10, 6, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (304, 10, 33, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (305, 10, 12, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (306, 11, 18, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (307, 11, 29, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (308, 11, 4, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (309, 11, 25, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (310, 11, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (311, 11, 20, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (312, 11, 31, 5.0000, 'I', 0.3300, 1.6500);
INSERT INTO `productmovement` VALUES (313, 11, 28, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (314, 11, 23, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (315, 11, 34, 3.0000, 'I', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (316, 11, 12, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (317, 11, 24, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (318, 11, 22, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (319, 11, 33, 2.0000, 'I', 5.0000, 10.0000);
INSERT INTO `productmovement` VALUES (320, 11, 14, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (321, 11, 6, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (322, 11, 26, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (323, 11, 27, 2.0000, 'I', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (324, 11, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (325, 11, 19, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (326, 11, 10, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (327, 11, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (328, 11, 35, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (329, 11, 17, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (330, 11, 8, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (331, 11, 11, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (332, 11, 13, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (333, 11, 1, 2.0000, 'I', 5.0000, 10.0000);
INSERT INTO `productmovement` VALUES (334, 11, 15, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (335, 11, 5, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (336, 11, 7, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (337, 11, 16, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (338, 11, 30, 3.0000, 'I', 0.8500, 2.5500);
INSERT INTO `productmovement` VALUES (339, 11, 21, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (340, 11, 9, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (341, 12, 33, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (342, 12, 21, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (343, 12, 10, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (344, 12, 18, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (345, 12, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (346, 12, 14, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (347, 12, 24, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (348, 12, 19, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (349, 12, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (350, 12, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (351, 12, 15, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (352, 12, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (353, 12, 17, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (354, 12, 31, 3.0000, 'E', 0.5000, 1.5000);
INSERT INTO `productmovement` VALUES (355, 12, 27, 1.0000, 'E', 13.5000, 13.5000);
INSERT INTO `productmovement` VALUES (356, 12, 32, 2.0000, 'E', 1.3200, 2.6400);
INSERT INTO `productmovement` VALUES (357, 12, 4, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (358, 12, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (359, 12, 29, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (360, 12, 12, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (361, 12, 2, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (362, 12, 8, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (363, 12, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (364, 12, 13, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (365, 12, 7, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (366, 12, 5, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (367, 12, 35, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (368, 12, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (369, 12, 26, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (370, 12, 9, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (371, 12, 11, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (372, 12, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (373, 12, 23, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (374, 12, 30, 3.0000, 'E', 1.2800, 3.8400);
INSERT INTO `productmovement` VALUES (375, 12, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (376, 13, 9, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (377, 13, 19, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (378, 13, 28, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (379, 13, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (380, 13, 20, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (381, 13, 7, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (382, 13, 10, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (383, 13, 33, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (384, 13, 2, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (385, 13, 13, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (386, 13, 27, 1.0000, 'E', 13.5000, 13.5000);
INSERT INTO `productmovement` VALUES (387, 13, 18, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (388, 13, 14, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (389, 13, 16, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (390, 13, 15, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (391, 13, 8, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (392, 13, 29, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (393, 13, 32, 2.0000, 'E', 1.3200, 2.6400);
INSERT INTO `productmovement` VALUES (394, 13, 17, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (395, 13, 34, 2.0000, 'E', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (396, 13, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (397, 13, 21, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (398, 13, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (399, 13, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (400, 13, 4, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (401, 13, 35, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (402, 13, 26, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (403, 13, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (404, 13, 25, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (405, 13, 5, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (406, 13, 1, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (407, 13, 24, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (408, 13, 12, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (409, 14, 22, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (410, 14, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (411, 14, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (412, 14, 10, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (413, 14, 26, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (414, 14, 15, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (415, 14, 8, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (416, 14, 20, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (417, 14, 34, 2.0000, 'E', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (418, 14, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (419, 14, 5, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (420, 14, 32, 3.0000, 'E', 1.3200, 3.9600);
INSERT INTO `productmovement` VALUES (421, 14, 33, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (422, 14, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (423, 14, 21, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (424, 14, 14, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (425, 14, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (426, 14, 2, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (427, 14, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (428, 14, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (429, 14, 24, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (430, 14, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (431, 14, 19, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (432, 14, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (433, 14, 16, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (434, 14, 4, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (435, 14, 7, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (436, 14, 11, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (437, 14, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (438, 14, 12, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (439, 14, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (440, 14, 29, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (441, 15, 31, 3.0000, 'I', 0.3300, 0.9900);
INSERT INTO `productmovement` VALUES (442, 15, 25, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (443, 15, 9, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (444, 15, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (445, 15, 20, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (446, 15, 21, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (447, 15, 22, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (448, 15, 18, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (449, 15, 6, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (450, 15, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (451, 15, 30, 2.0000, 'I', 0.8500, 1.7000);
INSERT INTO `productmovement` VALUES (452, 15, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (453, 15, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (454, 15, 1, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (455, 15, 7, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (456, 15, 35, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (457, 15, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (458, 15, 5, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (459, 15, 34, 3.0000, 'I', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (460, 15, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (461, 15, 13, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (462, 15, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (463, 15, 11, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (464, 15, 12, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (465, 15, 27, 5.0000, 'I', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (466, 15, 28, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (467, 15, 29, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (468, 15, 23, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (469, 15, 15, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (470, 15, 24, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (471, 15, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (472, 15, 17, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (473, 15, 10, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (474, 15, 19, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (475, 15, 14, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (476, 16, 28, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (477, 16, 4, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (478, 16, 32, 5.0000, 'I', 0.8800, 4.4000);
INSERT INTO `productmovement` VALUES (479, 16, 18, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (480, 16, 11, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (481, 16, 6, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (482, 16, 29, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (483, 16, 23, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (484, 16, 5, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (485, 16, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (486, 16, 19, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (487, 16, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (488, 16, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (489, 16, 14, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (490, 16, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (491, 16, 35, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (492, 16, 30, 4.0000, 'I', 0.8500, 3.4000);
INSERT INTO `productmovement` VALUES (493, 16, 17, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (494, 16, 8, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (495, 16, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (496, 16, 34, 5.0000, 'I', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (497, 16, 10, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (498, 16, 20, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (499, 16, 13, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (500, 16, 21, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (501, 16, 22, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (502, 16, 25, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (503, 16, 24, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (504, 16, 15, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (505, 16, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (506, 16, 31, 3.0000, 'I', 0.3300, 0.9900);
INSERT INTO `productmovement` VALUES (507, 16, 1, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (508, 16, 9, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (509, 16, 27, 1.0000, 'I', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (510, 16, 26, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (511, 17, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (512, 17, 11, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (513, 17, 31, 2.0000, 'I', 0.3300, 0.6600);
INSERT INTO `productmovement` VALUES (514, 17, 9, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (515, 17, 23, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (516, 17, 20, 3.0000, 'I', 8.0000, 24.0000);
INSERT INTO `productmovement` VALUES (517, 17, 6, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (518, 17, 29, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (519, 17, 28, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (520, 17, 22, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (521, 17, 5, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (522, 17, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (523, 17, 2, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (524, 17, 21, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (525, 17, 13, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (526, 17, 33, 4.0000, 'I', 5.0000, 20.0000);
INSERT INTO `productmovement` VALUES (527, 17, 26, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (528, 17, 14, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (529, 17, 3, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (530, 17, 17, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (531, 17, 35, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (532, 17, 19, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (533, 17, 24, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (534, 17, 25, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (535, 17, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (536, 17, 34, 3.0000, 'I', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (537, 17, 4, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (538, 17, 15, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (539, 17, 1, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (540, 17, 27, 1.0000, 'I', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (541, 17, 18, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (542, 17, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (543, 17, 7, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (544, 17, 30, 3.0000, 'I', 0.8500, 2.5500);
INSERT INTO `productmovement` VALUES (545, 17, 10, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (546, 18, 1, 4.0000, 'I', 5.0000, 20.0000);
INSERT INTO `productmovement` VALUES (547, 18, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (548, 18, 17, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (549, 18, 23, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (550, 18, 3, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (551, 18, 22, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (552, 18, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (553, 18, 8, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (554, 18, 33, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (555, 18, 28, 2.0000, 'I', 4.0000, 8.0000);
INSERT INTO `productmovement` VALUES (556, 18, 20, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (557, 18, 15, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (558, 18, 12, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (559, 18, 14, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (560, 18, 19, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (561, 18, 29, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (562, 18, 6, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (563, 18, 7, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (564, 18, 27, 1.0000, 'I', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (565, 18, 34, 1.0000, 'I', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (566, 18, 26, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (567, 18, 10, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (568, 18, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (569, 18, 13, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (570, 18, 24, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (571, 18, 21, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (572, 18, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (573, 18, 35, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (574, 18, 18, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (575, 18, 11, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (576, 18, 31, 1.0000, 'I', 0.3300, 0.3300);
INSERT INTO `productmovement` VALUES (577, 18, 4, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (578, 18, 9, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (579, 18, 25, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (580, 18, 5, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (581, 19, 1, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (582, 19, 15, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (583, 19, 13, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (584, 19, 30, 1.0000, 'E', 1.2800, 1.2800);
INSERT INTO `productmovement` VALUES (585, 19, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (586, 19, 29, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (587, 19, 21, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (588, 19, 17, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (589, 19, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (590, 19, 26, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (591, 19, 5, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (592, 19, 3, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (593, 19, 34, 1.0000, 'E', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (594, 19, 32, 1.0000, 'E', 1.3200, 1.3200);
INSERT INTO `productmovement` VALUES (595, 19, 9, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (596, 19, 22, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (597, 19, 24, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (598, 19, 4, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (599, 19, 18, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (600, 19, 31, 2.0000, 'E', 0.5000, 1.0000);
INSERT INTO `productmovement` VALUES (601, 19, 28, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (602, 19, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (603, 19, 2, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (604, 19, 12, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (605, 19, 27, 4.0000, 'E', 13.5000, 54.0000);
INSERT INTO `productmovement` VALUES (606, 19, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (607, 19, 7, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (608, 19, 25, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (609, 19, 14, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (610, 19, 19, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (611, 19, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (612, 19, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (613, 19, 35, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (614, 19, 33, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (615, 19, 8, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (616, 20, 29, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (617, 20, 30, 4.0000, 'E', 1.2800, 5.1200);
INSERT INTO `productmovement` VALUES (618, 20, 5, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (619, 20, 6, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (620, 20, 8, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (621, 20, 31, 4.0000, 'E', 0.5000, 2.0000);
INSERT INTO `productmovement` VALUES (622, 20, 35, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (623, 20, 14, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (624, 20, 4, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (625, 20, 20, 4.0000, 'E', 12.0000, 48.0000);
INSERT INTO `productmovement` VALUES (626, 20, 28, 5.0000, 'E', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (627, 20, 13, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (628, 20, 19, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (629, 20, 12, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (630, 20, 10, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (631, 20, 24, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (632, 20, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (633, 20, 16, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (634, 20, 33, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (635, 20, 9, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (636, 20, 2, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (637, 20, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (638, 20, 7, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (639, 20, 26, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (640, 20, 1, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (641, 20, 27, 3.0000, 'E', 13.5000, 40.5000);
INSERT INTO `productmovement` VALUES (642, 20, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (643, 20, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (644, 20, 3, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (645, 20, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (646, 20, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (647, 20, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (648, 20, 17, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (649, 20, 21, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (650, 21, 9, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (651, 21, 2, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (652, 21, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (653, 21, 26, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (654, 21, 8, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (655, 21, 15, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (656, 21, 14, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (657, 21, 23, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (658, 21, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (659, 21, 22, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (660, 21, 11, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (661, 21, 21, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (662, 21, 5, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (663, 21, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (664, 21, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (665, 21, 33, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (666, 21, 31, 4.0000, 'E', 0.5000, 2.0000);
INSERT INTO `productmovement` VALUES (667, 21, 27, 4.0000, 'E', 13.5000, 54.0000);
INSERT INTO `productmovement` VALUES (668, 21, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (669, 21, 19, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (670, 21, 17, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (671, 21, 16, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (672, 21, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (673, 21, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (674, 21, 18, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (675, 21, 24, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (676, 21, 10, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (677, 21, 35, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (678, 21, 7, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (679, 21, 30, 4.0000, 'E', 1.2800, 5.1200);
INSERT INTO `productmovement` VALUES (680, 21, 4, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (681, 21, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (682, 21, 12, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (683, 21, 25, 5.0000, 'E', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (684, 22, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (685, 22, 1, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (686, 22, 25, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (687, 22, 15, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (688, 22, 24, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (689, 22, 9, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (690, 22, 34, 1.0000, 'I', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (691, 22, 20, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (692, 22, 12, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (693, 22, 13, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (694, 22, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (695, 22, 5, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (696, 22, 16, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (697, 22, 23, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (698, 22, 35, 5.0000, 'I', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (699, 22, 2, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (700, 22, 10, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (701, 22, 8, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (702, 22, 27, 3.0000, 'I', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (703, 22, 32, 3.0000, 'I', 0.8800, 2.6400);
INSERT INTO `productmovement` VALUES (704, 22, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (705, 22, 3, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (706, 22, 6, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (707, 22, 18, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (708, 22, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (709, 22, 7, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (710, 22, 11, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (711, 22, 29, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (712, 22, 31, 2.0000, 'I', 0.3300, 0.6600);
INSERT INTO `productmovement` VALUES (713, 22, 14, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (714, 22, 21, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (715, 22, 28, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (716, 22, 22, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (717, 22, 17, 3.0000, 'I', 8.0000, 24.0000);
INSERT INTO `productmovement` VALUES (718, 22, 19, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (719, 23, 8, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (720, 23, 4, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (721, 23, 23, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (722, 23, 26, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (723, 23, 21, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (724, 23, 25, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (725, 23, 15, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (726, 23, 28, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (727, 23, 22, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (728, 23, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (729, 23, 34, 4.0000, 'E', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (730, 23, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (731, 23, 19, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (732, 23, 32, 5.0000, 'E', 1.3200, 6.6000);
INSERT INTO `productmovement` VALUES (733, 23, 16, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (734, 23, 24, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (735, 23, 13, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (736, 23, 20, 4.0000, 'E', 12.0000, 48.0000);
INSERT INTO `productmovement` VALUES (737, 23, 30, 4.0000, 'E', 1.2800, 5.1200);
INSERT INTO `productmovement` VALUES (738, 23, 11, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (739, 23, 29, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (740, 23, 2, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (741, 23, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (742, 23, 6, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (743, 23, 14, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (744, 23, 10, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (745, 23, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (746, 23, 33, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (747, 23, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (748, 23, 18, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (749, 23, 1, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (750, 23, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (751, 23, 5, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (752, 23, 7, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (753, 24, 9, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (754, 24, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (755, 24, 1, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (756, 24, 14, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (757, 24, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (758, 24, 15, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (759, 24, 29, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (760, 24, 28, 2.0000, 'I', 4.0000, 8.0000);
INSERT INTO `productmovement` VALUES (761, 24, 26, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (762, 24, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (763, 24, 25, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (764, 24, 20, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (765, 24, 17, 3.0000, 'I', 8.0000, 24.0000);
INSERT INTO `productmovement` VALUES (766, 24, 31, 1.0000, 'I', 0.3300, 0.3300);
INSERT INTO `productmovement` VALUES (767, 24, 34, 2.0000, 'I', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (768, 24, 21, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (769, 24, 19, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (770, 24, 18, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (771, 24, 13, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (772, 24, 4, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (773, 24, 5, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (774, 24, 6, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (775, 24, 10, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (776, 24, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (777, 24, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (778, 24, 24, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (779, 24, 11, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (780, 24, 22, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (781, 24, 7, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (782, 24, 35, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (783, 24, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (784, 24, 23, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (785, 24, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (786, 24, 27, 3.0000, 'I', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (787, 24, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (788, 25, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (789, 25, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (790, 25, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (791, 25, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (792, 25, 4, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (793, 25, 27, 3.0000, 'E', 13.5000, 40.5000);
INSERT INTO `productmovement` VALUES (794, 25, 6, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (795, 25, 2, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (796, 25, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (797, 25, 23, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (798, 25, 19, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (799, 25, 9, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (800, 25, 16, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (801, 25, 13, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (802, 25, 33, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (803, 25, 31, 3.0000, 'E', 0.5000, 1.5000);
INSERT INTO `productmovement` VALUES (804, 25, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (805, 25, 14, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (806, 25, 30, 5.0000, 'E', 1.2800, 6.4000);
INSERT INTO `productmovement` VALUES (807, 25, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (808, 25, 7, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (809, 25, 8, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (810, 25, 21, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (811, 25, 5, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (812, 25, 25, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (813, 25, 26, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (814, 25, 17, 4.0000, 'E', 12.0000, 48.0000);
INSERT INTO `productmovement` VALUES (815, 25, 24, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (816, 25, 12, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (817, 25, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (818, 25, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (819, 25, 3, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (820, 25, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (821, 25, 29, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (822, 26, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (823, 26, 13, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (824, 26, 12, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (825, 26, 20, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (826, 26, 9, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (827, 26, 15, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (828, 26, 35, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (829, 26, 21, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (830, 26, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (831, 26, 16, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (832, 26, 19, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (833, 26, 30, 5.0000, 'E', 1.2800, 6.4000);
INSERT INTO `productmovement` VALUES (834, 26, 28, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (835, 26, 31, 4.0000, 'E', 0.5000, 2.0000);
INSERT INTO `productmovement` VALUES (836, 26, 23, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (837, 26, 7, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (838, 26, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (839, 26, 26, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (840, 26, 8, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (841, 26, 24, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (842, 26, 3, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (843, 26, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (844, 26, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (845, 26, 14, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (846, 26, 4, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (847, 26, 17, 4.0000, 'E', 12.0000, 48.0000);
INSERT INTO `productmovement` VALUES (848, 26, 22, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (849, 26, 33, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (850, 26, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (851, 26, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (852, 26, 2, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (853, 26, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (854, 26, 5, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (855, 27, 35, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (856, 27, 9, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (857, 27, 4, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (858, 27, 33, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (859, 27, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (860, 27, 23, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (861, 27, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (862, 27, 34, 3.0000, 'E', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (863, 27, 14, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (864, 27, 30, 1.0000, 'E', 1.2800, 1.2800);
INSERT INTO `productmovement` VALUES (865, 27, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (866, 27, 15, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (867, 27, 5, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (868, 27, 22, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (869, 27, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (870, 27, 7, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (871, 27, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (872, 27, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (873, 27, 31, 5.0000, 'E', 0.5000, 2.5000);
INSERT INTO `productmovement` VALUES (874, 27, 8, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (875, 27, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (876, 27, 26, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (877, 27, 19, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (878, 27, 6, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (879, 27, 2, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (880, 27, 21, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (881, 27, 16, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (882, 27, 18, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (883, 27, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (884, 27, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (885, 27, 24, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (886, 27, 25, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (887, 27, 17, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (888, 28, 24, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (889, 28, 12, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (890, 28, 7, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (891, 28, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (892, 28, 33, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (893, 28, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (894, 28, 23, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (895, 28, 19, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (896, 28, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (897, 28, 15, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (898, 28, 5, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (899, 28, 31, 4.0000, 'E', 0.5000, 2.0000);
INSERT INTO `productmovement` VALUES (900, 28, 21, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (901, 28, 25, 5.0000, 'E', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (902, 28, 35, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (903, 28, 22, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (904, 28, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (905, 28, 2, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (906, 28, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (907, 28, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (908, 28, 29, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (909, 28, 10, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (910, 28, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (911, 28, 3, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (912, 28, 30, 3.0000, 'E', 1.2800, 3.8400);
INSERT INTO `productmovement` VALUES (913, 28, 4, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (914, 28, 11, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (915, 28, 6, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (916, 28, 8, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (917, 28, 14, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (918, 28, 26, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (919, 28, 13, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (920, 29, 26, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (921, 29, 19, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (922, 29, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (923, 29, 21, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (924, 29, 2, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (925, 29, 16, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (926, 29, 15, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (927, 29, 12, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (928, 29, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (929, 29, 17, 4.0000, 'E', 12.0000, 48.0000);
INSERT INTO `productmovement` VALUES (930, 29, 3, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (931, 29, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (932, 29, 24, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (933, 29, 8, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (934, 29, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (935, 29, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (936, 29, 31, 4.0000, 'E', 0.5000, 2.0000);
INSERT INTO `productmovement` VALUES (937, 29, 9, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (938, 29, 10, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (939, 29, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (940, 29, 34, 1.0000, 'E', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (941, 29, 4, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (942, 29, 33, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (943, 29, 18, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (944, 29, 29, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (945, 29, 20, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (946, 29, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (947, 29, 7, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (948, 29, 30, 2.0000, 'E', 1.2800, 2.5600);
INSERT INTO `productmovement` VALUES (949, 29, 6, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (950, 29, 5, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (951, 29, 14, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (952, 30, 33, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (953, 30, 19, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (954, 30, 1, 4.0000, 'I', 5.0000, 20.0000);
INSERT INTO `productmovement` VALUES (955, 30, 8, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (956, 30, 34, 3.0000, 'I', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (957, 30, 7, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (958, 30, 5, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (959, 30, 3, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (960, 30, 26, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (961, 30, 27, 2.0000, 'I', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (962, 30, 17, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (963, 30, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (964, 30, 28, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (965, 30, 6, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (966, 30, 10, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (967, 30, 16, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (968, 30, 23, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (969, 30, 35, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (970, 30, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (971, 30, 31, 2.0000, 'I', 0.3300, 0.6600);
INSERT INTO `productmovement` VALUES (972, 30, 15, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (973, 30, 21, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (974, 30, 14, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (975, 30, 29, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (976, 30, 22, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (977, 30, 24, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (978, 30, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (979, 30, 18, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (980, 30, 11, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (981, 30, 9, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (982, 30, 30, 3.0000, 'I', 0.8500, 2.5500);
INSERT INTO `productmovement` VALUES (983, 30, 20, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (984, 30, 4, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (985, 30, 25, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (986, 30, 13, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (987, 31, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (988, 31, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (989, 31, 35, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (990, 31, 34, 3.0000, 'E', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (991, 31, 1, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (992, 31, 13, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (993, 31, 33, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (994, 31, 19, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (995, 31, 3, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (996, 31, 31, 3.0000, 'E', 0.5000, 1.5000);
INSERT INTO `productmovement` VALUES (997, 31, 29, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (998, 31, 4, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (999, 31, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1000, 31, 6, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1001, 31, 21, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1002, 31, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1003, 31, 9, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1004, 31, 5, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (1005, 31, 18, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1006, 31, 22, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1007, 31, 2, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1008, 31, 28, 3.0000, 'E', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (1009, 31, 8, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1010, 31, 12, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1011, 31, 15, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1012, 31, 7, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1013, 31, 14, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1014, 31, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1015, 31, 32, 1.0000, 'E', 1.3200, 1.3200);
INSERT INTO `productmovement` VALUES (1016, 31, 24, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1017, 31, 27, 3.0000, 'E', 13.5000, 40.5000);
INSERT INTO `productmovement` VALUES (1018, 31, 17, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1019, 31, 30, 1.0000, 'E', 1.2800, 1.2800);
INSERT INTO `productmovement` VALUES (1020, 31, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1021, 32, 2, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1022, 32, 23, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1023, 32, 32, 2.0000, 'E', 1.3200, 2.6400);
INSERT INTO `productmovement` VALUES (1024, 32, 19, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1025, 32, 30, 3.0000, 'E', 1.2800, 3.8400);
INSERT INTO `productmovement` VALUES (1026, 32, 4, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1027, 32, 7, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1028, 32, 21, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1029, 32, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1030, 32, 33, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1031, 32, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1032, 32, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (1033, 32, 27, 2.0000, 'E', 13.5000, 27.0000);
INSERT INTO `productmovement` VALUES (1034, 32, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1035, 32, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1036, 32, 35, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1037, 32, 12, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1038, 32, 31, 5.0000, 'E', 0.5000, 2.5000);
INSERT INTO `productmovement` VALUES (1039, 32, 14, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1040, 32, 6, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1041, 32, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1042, 32, 34, 4.0000, 'E', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1043, 32, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1044, 32, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1045, 32, 24, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1046, 32, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1047, 32, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1048, 32, 8, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1049, 32, 5, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1050, 32, 22, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1051, 32, 28, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1052, 32, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1053, 32, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1054, 32, 17, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (1055, 33, 10, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1056, 33, 24, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1057, 33, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1058, 33, 15, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1059, 33, 5, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1060, 33, 29, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1061, 33, 21, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1062, 33, 14, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1063, 33, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1064, 33, 18, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1065, 33, 35, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1066, 33, 2, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1067, 33, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1068, 33, 19, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1069, 33, 17, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (1070, 33, 31, 5.0000, 'I', 0.3300, 1.6500);
INSERT INTO `productmovement` VALUES (1071, 33, 1, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1072, 33, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1073, 33, 7, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1074, 33, 22, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1075, 33, 9, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1076, 33, 26, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1077, 33, 6, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1078, 33, 34, 2.0000, 'I', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1079, 33, 20, 3.0000, 'I', 8.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1080, 33, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (1081, 33, 11, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1082, 33, 3, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1083, 33, 32, 4.0000, 'I', 0.8800, 3.5200);
INSERT INTO `productmovement` VALUES (1084, 33, 13, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1085, 33, 27, 3.0000, 'I', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (1086, 33, 28, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1087, 33, 25, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1088, 33, 23, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1089, 33, 30, 2.0000, 'I', 0.8500, 1.7000);
INSERT INTO `productmovement` VALUES (1090, 34, 27, 3.0000, 'I', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (1091, 34, 20, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1092, 34, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1093, 34, 5, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1094, 34, 10, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1095, 34, 24, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1096, 34, 29, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1097, 34, 34, 2.0000, 'I', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1098, 34, 33, 2.0000, 'I', 5.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1099, 34, 12, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1100, 34, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1101, 34, 13, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1102, 34, 11, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1103, 34, 19, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1104, 34, 18, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1105, 34, 2, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1106, 34, 28, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1107, 34, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1108, 34, 6, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1109, 34, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1110, 34, 3, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1111, 34, 32, 1.0000, 'I', 0.8800, 0.8800);
INSERT INTO `productmovement` VALUES (1112, 34, 35, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1113, 34, 31, 3.0000, 'I', 0.3300, 0.9900);
INSERT INTO `productmovement` VALUES (1114, 34, 1, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (1115, 34, 8, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1116, 34, 17, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1117, 34, 14, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1118, 34, 21, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1119, 34, 30, 5.0000, 'I', 0.8500, 4.2500);
INSERT INTO `productmovement` VALUES (1120, 34, 25, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1121, 34, 9, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1122, 34, 22, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1123, 34, 15, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1124, 34, 23, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1125, 35, 20, 3.0000, 'I', 8.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1126, 35, 6, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1127, 35, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1128, 35, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (1129, 35, 27, 4.0000, 'I', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1130, 35, 8, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1131, 35, 33, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1132, 35, 9, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1133, 35, 16, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1134, 35, 35, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1135, 35, 24, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1136, 35, 31, 4.0000, 'I', 0.3300, 1.3200);
INSERT INTO `productmovement` VALUES (1137, 35, 29, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1138, 35, 22, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1139, 35, 11, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1140, 35, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1141, 35, 10, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1142, 35, 13, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1143, 35, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (1144, 35, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1145, 35, 19, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1146, 35, 1, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (1147, 35, 28, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1148, 35, 5, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1149, 35, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1150, 35, 15, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1151, 35, 14, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1152, 35, 21, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1153, 35, 34, 5.0000, 'I', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1154, 35, 25, 2.0000, 'I', 4.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1155, 35, 18, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1156, 35, 17, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1157, 35, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1158, 35, 2, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1159, 35, 23, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1160, 36, 35, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1161, 36, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1162, 36, 15, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1163, 36, 24, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1164, 36, 23, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1165, 36, 25, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1166, 36, 16, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1167, 36, 31, 2.0000, 'I', 0.3300, 0.6600);
INSERT INTO `productmovement` VALUES (1168, 36, 6, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1169, 36, 2, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1170, 36, 5, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1171, 36, 21, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1172, 36, 29, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1173, 36, 14, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1174, 36, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1175, 36, 28, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1176, 36, 22, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1177, 36, 12, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1178, 36, 17, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (1179, 36, 30, 5.0000, 'I', 0.8500, 4.2500);
INSERT INTO `productmovement` VALUES (1180, 36, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1181, 36, 1, 4.0000, 'I', 5.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1182, 36, 34, 4.0000, 'I', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1183, 36, 32, 4.0000, 'I', 0.8800, 3.5200);
INSERT INTO `productmovement` VALUES (1184, 36, 20, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (1185, 36, 27, 4.0000, 'I', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1186, 36, 11, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1187, 36, 13, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1188, 36, 33, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1189, 36, 9, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1190, 36, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1191, 36, 10, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1192, 36, 19, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1193, 36, 8, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1194, 36, 18, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1195, 37, 1, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1196, 37, 8, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1197, 37, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1198, 37, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1199, 37, 21, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1200, 37, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1201, 37, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1202, 37, 27, 4.0000, 'E', 13.5000, 54.0000);
INSERT INTO `productmovement` VALUES (1203, 37, 5, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (1204, 37, 2, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1205, 37, 33, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (1206, 37, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1207, 37, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1208, 37, 22, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1209, 37, 4, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1210, 37, 25, 3.0000, 'E', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (1211, 37, 32, 5.0000, 'E', 1.3200, 6.6000);
INSERT INTO `productmovement` VALUES (1212, 37, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (1213, 37, 13, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1214, 37, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1215, 37, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1216, 37, 26, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1217, 37, 14, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1218, 37, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1219, 37, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1220, 37, 24, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1221, 37, 9, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1222, 37, 7, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1223, 37, 28, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1224, 37, 19, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1225, 37, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1226, 37, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (1227, 37, 34, 3.0000, 'E', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (1228, 37, 30, 1.0000, 'E', 1.2800, 1.2800);
INSERT INTO `productmovement` VALUES (1229, 37, 10, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1230, 38, 33, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1231, 38, 21, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1232, 38, 20, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1233, 38, 32, 3.0000, 'E', 1.3200, 3.9600);
INSERT INTO `productmovement` VALUES (1234, 38, 5, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (1235, 38, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1236, 38, 7, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1237, 38, 30, 5.0000, 'E', 1.2800, 6.4000);
INSERT INTO `productmovement` VALUES (1238, 38, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1239, 38, 16, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1240, 38, 26, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1241, 38, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (1242, 38, 19, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1243, 38, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1244, 38, 2, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1245, 38, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1246, 38, 35, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1247, 38, 23, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1248, 38, 27, 4.0000, 'E', 13.5000, 54.0000);
INSERT INTO `productmovement` VALUES (1249, 38, 24, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1250, 38, 14, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1251, 38, 15, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1252, 38, 25, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1253, 38, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1254, 38, 9, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1255, 38, 4, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1256, 38, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1257, 38, 1, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1258, 38, 10, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1259, 38, 17, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1260, 38, 8, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1261, 38, 11, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1262, 38, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (1263, 38, 13, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1264, 38, 29, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1265, 39, 15, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1266, 39, 33, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1267, 39, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1268, 39, 34, 3.0000, 'E', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (1269, 39, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (1270, 39, 5, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (1271, 39, 17, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (1272, 39, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1273, 39, 35, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (1274, 39, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1275, 39, 26, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1276, 39, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1277, 39, 12, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1278, 39, 4, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1279, 39, 16, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1280, 39, 22, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1281, 39, 10, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1282, 39, 24, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1283, 39, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1284, 39, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1285, 39, 20, 4.0000, 'E', 12.0000, 48.0000);
INSERT INTO `productmovement` VALUES (1286, 39, 8, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1287, 39, 27, 2.0000, 'E', 13.5000, 27.0000);
INSERT INTO `productmovement` VALUES (1288, 39, 14, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1289, 39, 9, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1290, 39, 32, 4.0000, 'E', 1.3200, 5.2800);
INSERT INTO `productmovement` VALUES (1291, 39, 11, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1292, 39, 19, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1293, 39, 7, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1294, 39, 13, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1295, 39, 28, 3.0000, 'E', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (1296, 39, 30, 2.0000, 'E', 1.2800, 2.5600);
INSERT INTO `productmovement` VALUES (1297, 39, 29, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1298, 39, 21, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1299, 39, 2, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1300, 40, 21, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1301, 40, 26, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1302, 40, 9, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1303, 40, 11, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1304, 40, 2, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1305, 40, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (1306, 40, 1, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (1307, 40, 18, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1308, 40, 14, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1309, 40, 30, 5.0000, 'E', 1.2800, 6.4000);
INSERT INTO `productmovement` VALUES (1310, 40, 8, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1311, 40, 29, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1312, 40, 23, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1313, 40, 24, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1314, 40, 13, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1315, 40, 33, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (1316, 40, 31, 3.0000, 'E', 0.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1317, 40, 7, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1318, 40, 10, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1319, 40, 16, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1320, 40, 32, 5.0000, 'E', 1.3200, 6.6000);
INSERT INTO `productmovement` VALUES (1321, 40, 19, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1322, 40, 34, 3.0000, 'E', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (1323, 40, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1324, 40, 5, 2.0000, 'E', 4.5000, 9.0000);
INSERT INTO `productmovement` VALUES (1325, 40, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1326, 40, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (1327, 40, 22, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1328, 40, 27, 2.0000, 'E', 13.5000, 27.0000);
INSERT INTO `productmovement` VALUES (1329, 40, 17, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (1330, 40, 15, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1331, 40, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1332, 40, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1333, 40, 4, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1334, 40, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1335, 41, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1336, 41, 31, 2.0000, 'E', 0.5000, 1.0000);
INSERT INTO `productmovement` VALUES (1337, 41, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1338, 41, 18, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1339, 41, 27, 4.0000, 'E', 13.5000, 54.0000);
INSERT INTO `productmovement` VALUES (1340, 41, 5, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1341, 41, 30, 4.0000, 'E', 1.2800, 5.1200);
INSERT INTO `productmovement` VALUES (1342, 41, 10, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1343, 41, 4, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1344, 41, 16, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1345, 41, 28, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1346, 41, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1347, 41, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1348, 41, 1, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (1349, 41, 35, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1350, 41, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (1351, 41, 32, 4.0000, 'E', 1.3200, 5.2800);
INSERT INTO `productmovement` VALUES (1352, 41, 7, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1353, 41, 15, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1354, 41, 17, 4.0000, 'E', 12.0000, 48.0000);
INSERT INTO `productmovement` VALUES (1355, 41, 8, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1356, 41, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1357, 41, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1358, 41, 9, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1359, 41, 24, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1360, 41, 11, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1361, 41, 14, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1362, 41, 12, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1363, 41, 21, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1364, 41, 34, 2.0000, 'E', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (1365, 41, 2, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1366, 41, 23, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1367, 41, 26, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1368, 41, 19, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1369, 41, 33, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1370, 42, 17, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1371, 42, 18, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1372, 42, 32, 3.0000, 'I', 0.8800, 2.6400);
INSERT INTO `productmovement` VALUES (1373, 42, 10, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1374, 42, 24, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1375, 42, 14, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1376, 42, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1377, 42, 28, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1378, 42, 23, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1379, 42, 29, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1380, 42, 26, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1381, 42, 21, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1382, 42, 25, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1383, 42, 5, 1.0000, 'I', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1384, 42, 34, 5.0000, 'I', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1385, 42, 33, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1386, 42, 20, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (1387, 42, 7, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1388, 42, 27, 1.0000, 'I', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1389, 42, 31, 3.0000, 'I', 0.3300, 0.9900);
INSERT INTO `productmovement` VALUES (1390, 42, 22, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1391, 42, 2, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1392, 42, 1, 2.0000, 'I', 5.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1393, 42, 9, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1394, 42, 6, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1395, 42, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1396, 42, 15, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1397, 42, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1398, 42, 4, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1399, 42, 13, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1400, 42, 11, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1401, 42, 35, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1402, 42, 19, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1403, 42, 30, 3.0000, 'I', 0.8500, 2.5500);
INSERT INTO `productmovement` VALUES (1404, 42, 16, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1405, 43, 16, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1406, 43, 21, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1407, 43, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (1408, 43, 3, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1409, 43, 17, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1410, 43, 5, 4.0000, 'I', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1411, 43, 35, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1412, 43, 13, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1413, 43, 7, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1414, 43, 22, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1415, 43, 20, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (1416, 43, 11, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1417, 43, 8, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1418, 43, 18, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1419, 43, 19, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1420, 43, 29, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1421, 43, 24, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1422, 43, 25, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1423, 43, 15, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1424, 43, 28, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1425, 43, 1, 2.0000, 'I', 5.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1426, 43, 14, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1427, 43, 10, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1428, 43, 23, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1429, 43, 26, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1430, 43, 6, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1431, 43, 31, 2.0000, 'I', 0.3300, 0.6600);
INSERT INTO `productmovement` VALUES (1432, 43, 9, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1433, 43, 4, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1434, 43, 30, 4.0000, 'I', 0.8500, 3.4000);
INSERT INTO `productmovement` VALUES (1435, 43, 33, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1436, 43, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1437, 43, 34, 5.0000, 'I', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1438, 43, 27, 1.0000, 'I', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1439, 43, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1440, 44, 9, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1441, 44, 26, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1442, 44, 5, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1443, 44, 18, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1444, 44, 24, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1445, 44, 33, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (1446, 44, 1, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1447, 44, 35, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1448, 44, 27, 4.0000, 'I', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1449, 44, 12, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1450, 44, 16, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1451, 44, 30, 5.0000, 'I', 0.8500, 4.2500);
INSERT INTO `productmovement` VALUES (1452, 44, 6, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1453, 44, 21, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1454, 44, 15, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1455, 44, 13, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1456, 44, 34, 1.0000, 'I', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1457, 44, 11, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1458, 44, 14, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1459, 44, 8, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1460, 44, 17, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1461, 44, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1462, 44, 25, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1463, 44, 22, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1464, 44, 10, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1465, 44, 19, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1466, 44, 4, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1467, 44, 23, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1468, 44, 3, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1469, 44, 20, 2.0000, 'I', 8.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1470, 44, 7, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1471, 44, 28, 1.0000, 'I', 4.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1472, 44, 29, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1473, 44, 32, 4.0000, 'I', 0.8800, 3.5200);
INSERT INTO `productmovement` VALUES (1474, 44, 31, 1.0000, 'I', 0.3300, 0.3300);
INSERT INTO `productmovement` VALUES (1475, 45, 29, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1476, 45, 9, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1477, 45, 35, 5.0000, 'I', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1478, 45, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1479, 45, 33, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1480, 45, 15, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1481, 45, 19, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1482, 45, 1, 4.0000, 'I', 5.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1483, 45, 4, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1484, 45, 27, 4.0000, 'I', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1485, 45, 2, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1486, 45, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (1487, 45, 10, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1488, 45, 20, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1489, 45, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1490, 45, 28, 2.0000, 'I', 4.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1491, 45, 17, 1.0000, 'I', 8.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1492, 45, 22, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1493, 45, 6, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1494, 45, 5, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1495, 45, 24, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1496, 45, 34, 5.0000, 'I', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1497, 45, 23, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1498, 45, 13, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1499, 45, 31, 2.0000, 'I', 0.3300, 0.6600);
INSERT INTO `productmovement` VALUES (1500, 45, 26, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1501, 45, 25, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1502, 45, 32, 4.0000, 'I', 0.8800, 3.5200);
INSERT INTO `productmovement` VALUES (1503, 45, 18, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1504, 45, 21, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1505, 45, 11, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1506, 45, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1507, 45, 3, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1508, 45, 14, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1509, 45, 16, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1510, 46, 24, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1511, 46, 8, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1512, 46, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1513, 46, 21, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1514, 46, 20, 5.0000, 'E', 12.0000, 60.0000);
INSERT INTO `productmovement` VALUES (1515, 46, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (1516, 46, 18, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1517, 46, 4, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1518, 46, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1519, 46, 14, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1520, 46, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1521, 46, 17, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1522, 46, 2, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1523, 46, 34, 2.0000, 'E', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (1524, 46, 32, 1.0000, 'E', 1.3200, 1.3200);
INSERT INTO `productmovement` VALUES (1525, 46, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1526, 46, 19, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1527, 46, 25, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1528, 46, 26, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1529, 46, 30, 1.0000, 'E', 1.2800, 1.2800);
INSERT INTO `productmovement` VALUES (1530, 46, 27, 1.0000, 'E', 13.5000, 13.5000);
INSERT INTO `productmovement` VALUES (1531, 46, 23, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1532, 46, 3, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1533, 46, 5, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1534, 46, 1, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (1535, 46, 22, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1536, 46, 9, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1537, 46, 35, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1538, 46, 13, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1539, 46, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1540, 46, 10, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1541, 46, 28, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1542, 46, 6, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1543, 47, 2, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1544, 47, 5, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1545, 47, 4, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1546, 47, 24, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1547, 47, 8, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1548, 47, 25, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1549, 47, 19, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1550, 47, 21, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1551, 47, 1, 2.0000, 'E', 7.5000, 15.0000);
INSERT INTO `productmovement` VALUES (1552, 47, 14, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1553, 47, 32, 3.0000, 'E', 1.3200, 3.9600);
INSERT INTO `productmovement` VALUES (1554, 47, 9, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1555, 47, 30, 3.0000, 'E', 1.2800, 3.8400);
INSERT INTO `productmovement` VALUES (1556, 47, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1557, 47, 3, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1558, 47, 16, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1559, 47, 10, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1560, 47, 18, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1561, 47, 28, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1562, 47, 11, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1563, 47, 35, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (1564, 47, 17, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1565, 47, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (1566, 47, 31, 2.0000, 'E', 0.5000, 1.0000);
INSERT INTO `productmovement` VALUES (1567, 47, 27, 3.0000, 'E', 13.5000, 40.5000);
INSERT INTO `productmovement` VALUES (1568, 47, 26, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1569, 47, 20, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1570, 47, 12, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1571, 47, 15, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1572, 47, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1573, 47, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1574, 47, 23, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1575, 47, 22, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1576, 48, 19, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1577, 48, 33, 3.0000, 'I', 5.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1578, 48, 22, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1579, 48, 32, 2.0000, 'I', 0.8800, 1.7600);
INSERT INTO `productmovement` VALUES (1580, 48, 16, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1581, 48, 1, 5.0000, 'I', 5.0000, 25.0000);
INSERT INTO `productmovement` VALUES (1582, 48, 23, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1583, 48, 29, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1584, 48, 11, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1585, 48, 2, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1586, 48, 15, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1587, 48, 6, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1588, 48, 5, 5.0000, 'I', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1589, 48, 18, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1590, 48, 17, 5.0000, 'I', 8.0000, 40.0000);
INSERT INTO `productmovement` VALUES (1591, 48, 24, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1592, 48, 4, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1593, 48, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1594, 48, 21, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1595, 48, 20, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (1596, 48, 14, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1597, 48, 13, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1598, 48, 34, 3.0000, 'I', 6.0000, 18.0000);
INSERT INTO `productmovement` VALUES (1599, 48, 30, 4.0000, 'I', 0.8500, 3.4000);
INSERT INTO `productmovement` VALUES (1600, 48, 28, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1601, 48, 31, 5.0000, 'I', 0.3300, 1.6500);
INSERT INTO `productmovement` VALUES (1602, 48, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1603, 48, 8, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1604, 48, 9, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1605, 48, 35, 3.0000, 'I', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1606, 48, 10, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1607, 48, 3, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1608, 48, 27, 4.0000, 'I', 9.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1609, 48, 26, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1610, 48, 25, 4.0000, 'I', 4.0000, 16.0000);
INSERT INTO `productmovement` VALUES (1611, 49, 28, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1612, 49, 24, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1613, 49, 8, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1614, 49, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1615, 49, 18, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1616, 49, 5, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (1617, 49, 15, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1618, 49, 12, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1619, 49, 16, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1620, 49, 27, 5.0000, 'E', 13.5000, 67.5000);
INSERT INTO `productmovement` VALUES (1621, 49, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1622, 49, 9, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1623, 49, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1624, 49, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1625, 49, 1, 5.0000, 'E', 7.5000, 37.5000);
INSERT INTO `productmovement` VALUES (1626, 49, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1627, 49, 30, 5.0000, 'E', 1.2800, 6.4000);
INSERT INTO `productmovement` VALUES (1628, 49, 6, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1629, 49, 21, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1630, 49, 26, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1631, 49, 4, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1632, 49, 14, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1633, 49, 25, 2.0000, 'E', 6.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1634, 49, 19, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1635, 49, 7, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1636, 49, 35, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (1637, 49, 29, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1638, 49, 2, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1639, 49, 10, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1640, 49, 23, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1641, 49, 33, 3.0000, 'E', 7.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1642, 49, 34, 1.0000, 'E', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1643, 49, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (1644, 49, 3, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1645, 50, 5, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1646, 50, 20, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1647, 50, 8, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1648, 50, 34, 5.0000, 'E', 9.0000, 45.0000);
INSERT INTO `productmovement` VALUES (1649, 50, 3, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1650, 50, 1, 1.0000, 'E', 7.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1651, 50, 23, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1652, 50, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1653, 50, 16, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1654, 50, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1655, 50, 11, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1656, 50, 9, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1657, 50, 25, 5.0000, 'E', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1658, 50, 26, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1659, 50, 22, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1660, 50, 12, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1661, 50, 14, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1662, 50, 30, 5.0000, 'E', 1.2800, 6.4000);
INSERT INTO `productmovement` VALUES (1663, 50, 19, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1664, 50, 2, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1665, 50, 29, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1666, 50, 21, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1667, 50, 17, 1.0000, 'E', 12.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1668, 50, 6, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1669, 50, 13, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1670, 50, 31, 4.0000, 'E', 0.5000, 2.0000);
INSERT INTO `productmovement` VALUES (1671, 50, 10, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1672, 50, 35, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (1673, 50, 24, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1674, 50, 18, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1675, 51, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1676, 51, 14, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1677, 51, 9, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1678, 51, 18, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1679, 51, 1, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (1680, 51, 35, 4.0000, 'E', 4.5000, 18.0000);
INSERT INTO `productmovement` VALUES (1681, 51, 3, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1682, 51, 30, 2.0000, 'E', 1.2800, 2.5600);
INSERT INTO `productmovement` VALUES (1683, 51, 22, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1684, 51, 31, 5.0000, 'E', 0.5000, 2.5000);
INSERT INTO `productmovement` VALUES (1685, 51, 8, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1686, 51, 10, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1687, 51, 29, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1688, 51, 24, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1689, 51, 20, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1690, 51, 2, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1691, 51, 34, 2.0000, 'E', 9.0000, 18.0000);
INSERT INTO `productmovement` VALUES (1692, 51, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1693, 51, 21, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1694, 51, 25, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1695, 51, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1696, 51, 5, 5.0000, 'E', 4.5000, 22.5000);
INSERT INTO `productmovement` VALUES (1697, 51, 11, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1698, 51, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1699, 51, 28, 1.0000, 'E', 6.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1700, 51, 16, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1701, 51, 23, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1702, 51, 19, 2.0000, 'E', 1.5000, 3.0000);
INSERT INTO `productmovement` VALUES (1703, 51, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1704, 52, 16, 1.0000, 'E', 3.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1705, 52, 22, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1706, 52, 12, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1707, 52, 25, 5.0000, 'E', 6.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1708, 52, 18, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1709, 52, 20, 3.0000, 'E', 12.0000, 36.0000);
INSERT INTO `productmovement` VALUES (1710, 52, 34, 1.0000, 'E', 9.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1711, 52, 19, 1.0000, 'E', 1.5000, 1.5000);
INSERT INTO `productmovement` VALUES (1712, 52, 13, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1713, 52, 3, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1714, 52, 29, 4.0000, 'E', 1.5000, 6.0000);
INSERT INTO `productmovement` VALUES (1715, 52, 10, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1716, 52, 35, 1.0000, 'E', 4.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1717, 52, 24, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1718, 52, 8, 4.0000, 'E', 3.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1719, 52, 23, 3.0000, 'E', 1.5000, 4.5000);
INSERT INTO `productmovement` VALUES (1720, 52, 2, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1721, 52, 9, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1722, 52, 21, 5.0000, 'E', 1.5000, 7.5000);
INSERT INTO `productmovement` VALUES (1723, 52, 28, 4.0000, 'E', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1724, 52, 30, 2.0000, 'E', 1.2800, 2.5600);
INSERT INTO `productmovement` VALUES (1725, 52, 15, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1726, 52, 14, 2.0000, 'E', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1727, 52, 1, 4.0000, 'E', 7.5000, 30.0000);
INSERT INTO `productmovement` VALUES (1728, 52, 6, 3.0000, 'E', 3.0000, 9.0000);
INSERT INTO `productmovement` VALUES (1729, 52, 5, 3.0000, 'E', 4.5000, 13.5000);
INSERT INTO `productmovement` VALUES (1730, 52, 17, 2.0000, 'E', 12.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1731, 52, 31, 1.0000, 'E', 0.5000, 0.5000);
INSERT INTO `productmovement` VALUES (1732, 52, 11, 5.0000, 'E', 3.0000, 15.0000);
INSERT INTO `productmovement` VALUES (1733, 53, 6, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1734, 53, 22, 4.0000, 'I', 2.0000, 8.0000);
INSERT INTO `productmovement` VALUES (1735, 53, 7, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1736, 53, 19, 4.0000, 'I', 1.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1737, 53, 8, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1738, 53, 14, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1739, 53, 31, 3.0000, 'I', 0.3300, 0.9900);
INSERT INTO `productmovement` VALUES (1740, 53, 9, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1741, 53, 26, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1742, 53, 2, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1743, 53, 23, 1.0000, 'I', 1.0000, 1.0000);
INSERT INTO `productmovement` VALUES (1744, 53, 30, 1.0000, 'I', 0.8500, 0.8500);
INSERT INTO `productmovement` VALUES (1745, 53, 32, 1.0000, 'I', 0.8800, 0.8800);
INSERT INTO `productmovement` VALUES (1746, 53, 4, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1747, 53, 1, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1748, 53, 29, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1749, 53, 28, 5.0000, 'I', 4.0000, 20.0000);
INSERT INTO `productmovement` VALUES (1750, 53, 27, 3.0000, 'I', 9.0000, 27.0000);
INSERT INTO `productmovement` VALUES (1751, 53, 15, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1752, 53, 20, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (1753, 53, 3, 3.0000, 'I', 2.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1754, 53, 21, 3.0000, 'I', 1.0000, 3.0000);
INSERT INTO `productmovement` VALUES (1755, 53, 25, 3.0000, 'I', 4.0000, 12.0000);
INSERT INTO `productmovement` VALUES (1756, 53, 12, 2.0000, 'I', 2.0000, 4.0000);
INSERT INTO `productmovement` VALUES (1757, 53, 10, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1758, 53, 18, 5.0000, 'I', 1.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1759, 53, 24, 2.0000, 'I', 1.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1760, 53, 33, 1.0000, 'I', 5.0000, 5.0000);
INSERT INTO `productmovement` VALUES (1761, 53, 13, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1762, 53, 35, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1763, 53, 16, 1.0000, 'I', 2.0000, 2.0000);
INSERT INTO `productmovement` VALUES (1764, 53, 34, 4.0000, 'I', 6.0000, 24.0000);
INSERT INTO `productmovement` VALUES (1765, 53, 17, 4.0000, 'I', 8.0000, 32.0000);
INSERT INTO `productmovement` VALUES (1766, 53, 11, 5.0000, 'I', 2.0000, 10.0000);
INSERT INTO `productmovement` VALUES (1767, 53, 5, 2.0000, 'I', 3.0000, 6.0000);
INSERT INTO `productmovement` VALUES (1768, 54, 34, 90.0000, 'I', 6.0000, 540.0000);
INSERT INTO `productmovement` VALUES (1769, 54, 29, 33.0000, 'I', 1.0000, 33.0000);
INSERT INTO `productmovement` VALUES (1770, 54, 30, 24.0000, 'I', 0.0000, 0.0000);
INSERT INTO `productmovement` VALUES (1771, 54, 31, 70.0000, 'I', 0.0000, 0.0000);
INSERT INTO `productmovement` VALUES (1772, 55, 33, 58.0000, 'I', 5.0000, 290.0000);
INSERT INTO `productmovement` VALUES (1773, 55, 4, 76.0000, 'I', 2.0000, 152.0000);
INSERT INTO `productmovement` VALUES (1774, 55, 7, 44.0000, 'I', 2.0000, 88.0000);
INSERT INTO `productmovement` VALUES (1775, 55, 11, 58.0000, 'I', 2.0000, 116.0000);
INSERT INTO `productmovement` VALUES (1776, 55, 16, 74.0000, 'I', 2.0000, 148.0000);
INSERT INTO `productmovement` VALUES (1777, 55, 26, 49.0000, 'I', 1.0000, 49.0000);
INSERT INTO `productmovement` VALUES (1778, 55, 27, 66.0000, 'I', 9.0000, 594.0000);
INSERT INTO `productmovement` VALUES (1779, 55, 28, 38.0000, 'I', 4.0000, 152.0000);
INSERT INTO `productmovement` VALUES (1780, 55, 29, 69.0000, 'I', 1.0000, 69.0000);
INSERT INTO `productmovement` VALUES (1781, 55, 30, 73.0000, 'I', 0.0000, 0.0000);
INSERT INTO `productmovement` VALUES (1782, 55, 32, 29.0000, 'I', 0.0000, 0.0000);
INSERT INTO `productmovement` VALUES (1783, 55, 33, 54.0000, 'I', 5.0000, 270.0000);
INSERT INTO `productmovement` VALUES (1786, 92, 17, 125.0000, 'I', 12.0000, 1500.0000);
INSERT INTO `productmovement` VALUES (1787, 93, 10, 15.0000, 'I', 2.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1788, 93, 9, 20.0000, 'I', 2.0000, 40.0000);
INSERT INTO `productmovement` VALUES (1789, 93, 7, 15.0000, 'I', 2.0000, 30.0000);
INSERT INTO `productmovement` VALUES (1790, 93, 22, 75.0000, 'I', 2.0000, 150.0000);
INSERT INTO `productmovement` VALUES (1791, 93, 27, 20.0000, 'I', 9.0000, 180.0000);
INSERT INTO `productmovement` VALUES (1792, 93, 30, 500.0000, 'I', 0.3832, 191.6000);
INSERT INTO `productmovement` VALUES (1793, 93, 1, 100.0000, 'I', 5.0000, 500.0000);

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `idprovince` int NOT NULL AUTO_INCREMENT,
  `idcountry` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '',
  PRIMARY KEY (`idprovince`) USING BTREE,
  INDEX `IDCCountry`(`idcountry` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, 50, 'Azuay', '01');
INSERT INTO `province` VALUES (2, 50, 'Bolívar', '02');
INSERT INTO `province` VALUES (3, 50, 'Cañar', '03');
INSERT INTO `province` VALUES (4, 50, 'Carchi', '04');
INSERT INTO `province` VALUES (5, 50, 'Chimborazo', '06');
INSERT INTO `province` VALUES (6, 50, 'Cotopaxi', '05');
INSERT INTO `province` VALUES (7, 50, 'El Oro', '07');
INSERT INTO `province` VALUES (8, 50, 'Esmeraldas', '08');
INSERT INTO `province` VALUES (9, 50, 'Galápagos', '20');
INSERT INTO `province` VALUES (10, 50, 'Guayas', '09');
INSERT INTO `province` VALUES (11, 50, 'Imbabura', '10');
INSERT INTO `province` VALUES (12, 50, 'Loja', '11');
INSERT INTO `province` VALUES (13, 50, 'Los Ríos', '12');
INSERT INTO `province` VALUES (14, 50, 'Manabí', '13');
INSERT INTO `province` VALUES (15, 50, 'Morona Santiago', '14');
INSERT INTO `province` VALUES (16, 50, 'Napo', '15');
INSERT INTO `province` VALUES (17, 50, 'Orellana', '22');
INSERT INTO `province` VALUES (18, 50, 'Pastaza', '16');
INSERT INTO `province` VALUES (19, 50, 'Pichincha', '17');
INSERT INTO `province` VALUES (20, 50, 'Santa Elena', '24');
INSERT INTO `province` VALUES (21, 50, 'Santo Domingo de los Tsáchilas', '23');
INSERT INTO `province` VALUES (22, 50, 'Sucumbíos', '21');
INSERT INTO `province` VALUES (23, 50, 'Tungurahua', '18');
INSERT INTO `province` VALUES (24, 50, 'Zamora Chinchipe', '19');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `idrole` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL,
  `scope` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT '' COMMENT 'R|W|D',
  `status` int NULL DEFAULT 1 COMMENT '1-Active 0-Inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idrole`) USING BTREE,
  INDEX `IDXROLE`(`idrole` ASC) USING BTREE,
  INDEX `IDXSTATUSROLE`(`idrole` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Reporteador', 'R', 1, '2024-06-21 15:17:20', '2024-08-26 00:55:07', NULL);
INSERT INTO `role` VALUES (2, 'Administrador', 'RWD', 1, '2024-06-21 15:17:44', '2024-08-26 01:19:31', NULL);
INSERT INTO `role` VALUES (3, 'Usuario', 'R', 1, '2024-06-21 15:18:01', '2024-08-23 01:45:59', NULL);
INSERT INTO `role` VALUES (4, 'Super', 'RWD', 1, '2024-06-21 15:18:44', '2024-08-16 23:55:25', '2024-08-16 23:55:25');
INSERT INTO `role` VALUES (5, 'UserBot', '', 0, '2024-07-04 12:49:39', '2024-07-04 12:49:44', NULL);

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu`  (
  `idrolemenu` int NOT NULL AUTO_INCREMENT,
  `idrole` int NOT NULL,
  `idmenu` int NOT NULL,
  PRIMARY KEY (`idrolemenu`) USING BTREE,
  INDEX `IDXROL`(`idrole` ASC) USING BTREE,
  INDEX `IDME`(`idmenu` ASC) USING BTREE,
  CONSTRAINT `IDME` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXROL` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 410 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES (341, 2, 9);
INSERT INTO `rolemenu` VALUES (342, 2, 15);
INSERT INTO `rolemenu` VALUES (343, 2, 35);
INSERT INTO `rolemenu` VALUES (344, 2, 1);
INSERT INTO `rolemenu` VALUES (345, 2, 2);
INSERT INTO `rolemenu` VALUES (346, 2, 4);
INSERT INTO `rolemenu` VALUES (347, 2, 3);
INSERT INTO `rolemenu` VALUES (348, 2, 21);
INSERT INTO `rolemenu` VALUES (349, 2, 37);
INSERT INTO `rolemenu` VALUES (350, 2, 6);
INSERT INTO `rolemenu` VALUES (351, 2, 5);
INSERT INTO `rolemenu` VALUES (352, 2, 8);
INSERT INTO `rolemenu` VALUES (353, 2, 7);
INSERT INTO `rolemenu` VALUES (354, 2, 28);
INSERT INTO `rolemenu` VALUES (355, 2, 36);
INSERT INTO `rolemenu` VALUES (356, 2, 10);
INSERT INTO `rolemenu` VALUES (357, 2, 11);
INSERT INTO `rolemenu` VALUES (358, 2, 12);
INSERT INTO `rolemenu` VALUES (359, 2, 13);
INSERT INTO `rolemenu` VALUES (360, 2, 14);
INSERT INTO `rolemenu` VALUES (361, 2, 29);
INSERT INTO `rolemenu` VALUES (362, 2, 30);
INSERT INTO `rolemenu` VALUES (363, 2, 16);
INSERT INTO `rolemenu` VALUES (364, 2, 17);
INSERT INTO `rolemenu` VALUES (365, 2, 18);
INSERT INTO `rolemenu` VALUES (366, 2, 19);
INSERT INTO `rolemenu` VALUES (367, 2, 22);
INSERT INTO `rolemenu` VALUES (368, 2, 20);
INSERT INTO `rolemenu` VALUES (375, 1, 10);
INSERT INTO `rolemenu` VALUES (376, 1, 11);
INSERT INTO `rolemenu` VALUES (377, 1, 12);
INSERT INTO `rolemenu` VALUES (378, 1, 13);
INSERT INTO `rolemenu` VALUES (379, 1, 14);
INSERT INTO `rolemenu` VALUES (380, 1, 29);
INSERT INTO `rolemenu` VALUES (381, 1, 30);
INSERT INTO `rolemenu` VALUES (382, 3, 9);
INSERT INTO `rolemenu` VALUES (383, 3, 15);
INSERT INTO `rolemenu` VALUES (384, 3, 35);
INSERT INTO `rolemenu` VALUES (385, 3, 1);
INSERT INTO `rolemenu` VALUES (386, 3, 2);
INSERT INTO `rolemenu` VALUES (387, 3, 4);
INSERT INTO `rolemenu` VALUES (388, 3, 3);
INSERT INTO `rolemenu` VALUES (389, 3, 21);
INSERT INTO `rolemenu` VALUES (390, 3, 37);
INSERT INTO `rolemenu` VALUES (391, 3, 6);
INSERT INTO `rolemenu` VALUES (392, 3, 5);
INSERT INTO `rolemenu` VALUES (393, 3, 8);
INSERT INTO `rolemenu` VALUES (394, 3, 7);
INSERT INTO `rolemenu` VALUES (395, 3, 28);
INSERT INTO `rolemenu` VALUES (396, 3, 36);
INSERT INTO `rolemenu` VALUES (397, 3, 10);
INSERT INTO `rolemenu` VALUES (398, 3, 11);
INSERT INTO `rolemenu` VALUES (399, 3, 12);
INSERT INTO `rolemenu` VALUES (400, 3, 13);
INSERT INTO `rolemenu` VALUES (401, 3, 14);
INSERT INTO `rolemenu` VALUES (402, 3, 29);
INSERT INTO `rolemenu` VALUES (403, 3, 30);
INSERT INTO `rolemenu` VALUES (404, 3, 16);
INSERT INTO `rolemenu` VALUES (405, 3, 17);
INSERT INTO `rolemenu` VALUES (406, 3, 18);
INSERT INTO `rolemenu` VALUES (407, 3, 19);
INSERT INTO `rolemenu` VALUES (408, 3, 22);
INSERT INTO `rolemenu` VALUES (409, 3, 20);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `idtransaction` int NOT NULL AUTO_INCREMENT,
  `iduser` int NULL DEFAULT NULL,
  `idbeneficiary` int NULL DEFAULT NULL,
  `idmovementtype` int NULL DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numberdocument` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `subtotal` double(20, 2) NOT NULL DEFAULT 0.00,
  `discount` double(20, 2) NOT NULL DEFAULT 0.00,
  `total` double(20, 2) NOT NULL DEFAULT 0.00,
  `reference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idtransaction`) USING BTREE,
  INDEX `IDXM`(`idmovementtype` ASC) USING BTREE,
  INDEX `IDXB`(`idbeneficiary` ASC) USING BTREE,
  INDEX `IDUSS`(`iduser` ASC) USING BTREE,
  CONSTRAINT `IDUSS` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXB` FOREIGN KEY (`idbeneficiary`) REFERENCES `beneficiary` (`idbeneficiary`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXM` FOREIGN KEY (`idmovementtype`) REFERENCES `movementtype` (`idmovementtype`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES (1, 1, 591, 4, '2024-01-01 06:05:44', '001-003-000000001', 1560.00, 0.00, 1560.00, '');
INSERT INTO `transaction` VALUES (2, 1, 262, 4, '2024-01-01 06:06:33', '001-003-000000002', 2934.00, 0.00, 2934.00, '');
INSERT INTO `transaction` VALUES (3, 1, 615, 2, '2024-01-22 11:17:16', '002-028-000460218', 318.48, 0.00, 318.48, '');
INSERT INTO `transaction` VALUES (4, 1, 629, 2, '2024-01-06 17:44:28', '001-006-000383132', 273.05, 0.00, 273.05, '');
INSERT INTO `transaction` VALUES (5, 1, 13, 1, '2024-01-28 19:36:00', '001-003-000000001', 498.74, 0.00, 498.74, '');
INSERT INTO `transaction` VALUES (6, 1, 414, 2, '2024-01-12 20:01:17', '017-035-000421647', 237.26, 0.00, 237.26, '');
INSERT INTO `transaction` VALUES (7, 1, 4, 1, '2024-01-25 09:46:08', '001-003-000000002', 400.94, 0.00, 400.94, '');
INSERT INTO `transaction` VALUES (8, 1, 498, 2, '2024-01-06 12:54:47', '033-017-000421768', 313.28, 0.00, 313.28, '');
INSERT INTO `transaction` VALUES (9, 1, 47, 1, '2024-01-29 20:54:26', '001-003-000000003', 417.06, 0.00, 417.06, '');
INSERT INTO `transaction` VALUES (10, 1, 42, 1, '2024-01-07 10:06:49', '001-003-000000004', 321.46, 0.00, 321.46, '');
INSERT INTO `transaction` VALUES (11, 1, 358, 2, '2024-01-24 10:56:52', '016-038-000452670', 259.96, 0.00, 259.96, '');
INSERT INTO `transaction` VALUES (12, 1, 6, 1, '2024-01-08 18:55:23', '001-003-000000005', 436.98, 0.00, 436.98, '');
INSERT INTO `transaction` VALUES (13, 1, 35, 1, '2024-02-24 09:31:27', '001-003-000000006', 319.14, 0.00, 319.14, '');
INSERT INTO `transaction` VALUES (14, 1, 68, 1, '2024-02-22 09:02:38', '001-003-000000007', 317.46, 0.00, 317.46, '');
INSERT INTO `transaction` VALUES (15, 1, 105, 2, '2024-02-17 11:12:39', '040-023-000735611', 331.45, 0.00, 331.45, '');
INSERT INTO `transaction` VALUES (16, 1, 571, 2, '2024-02-15 15:57:01', '045-020-000249783', 283.79, 0.00, 283.79, '');
INSERT INTO `transaction` VALUES (17, 1, 153, 2, '2024-02-03 16:59:13', '006-027-000978561', 285.97, 0.00, 285.97, '');
INSERT INTO `transaction` VALUES (18, 1, 251, 2, '2024-02-17 12:16:54', '027-043-000024513', 250.94, 0.00, 250.94, '');
INSERT INTO `transaction` VALUES (19, 1, 66, 1, '2024-02-12 18:41:15', '001-003-000000009', 422.10, 0.00, 422.10, '');
INSERT INTO `transaction` VALUES (20, 1, 55, 1, '2024-02-10 16:52:40', '001-003-000000010', 439.12, 0.00, 439.12, '');
INSERT INTO `transaction` VALUES (21, 1, 56, 1, '2024-03-19 20:03:55', '001-003-000000011', 493.12, 0.00, 493.12, '');
INSERT INTO `transaction` VALUES (22, 1, 537, 2, '2024-03-08 09:12:24', '024-048-000499933', 269.15, 0.00, 269.15, '');
INSERT INTO `transaction` VALUES (23, 1, 55, 1, '2024-03-12 15:12:13', '001-003-000000012', 418.72, 0.00, 418.72, '');
INSERT INTO `transaction` VALUES (24, 1, 615, 2, '2024-03-09 10:23:31', '022-024-000721960', 247.94, 0.00, 247.94, '');
INSERT INTO `transaction` VALUES (25, 1, 52, 1, '2024-03-27 18:42:26', '001-003-000000013', 403.90, 0.00, 403.90, '');
INSERT INTO `transaction` VALUES (26, 1, 9, 1, '2024-03-19 16:06:38', '001-003-000000014', 359.40, 0.00, 359.40, '');
INSERT INTO `transaction` VALUES (27, 1, 1, 1, '2024-03-23 18:07:54', '001-003-000000015', 413.28, 0.00, 413.28, '');
INSERT INTO `transaction` VALUES (28, 1, 14, 1, '2024-04-05 10:16:55', '001-003-000000016', 430.34, 0.00, 430.34, '');
INSERT INTO `transaction` VALUES (29, 1, 53, 1, '2024-04-01 09:20:06', '001-003-000000017', 339.06, 0.00, 339.06, '');
INSERT INTO `transaction` VALUES (30, 1, 656, 2, '2024-04-28 18:56:18', '037-042-000974956', 239.97, 0.00, 239.97, '');
INSERT INTO `transaction` VALUES (31, 1, 48, 1, '2024-04-13 11:25:19', '001-003-000000018', 382.10, 0.00, 382.10, '');
INSERT INTO `transaction` VALUES (32, 1, 11, 1, '2024-04-11 08:52:38', '001-003-000000019', 440.98, 0.00, 440.98, '');
INSERT INTO `transaction` VALUES (33, 1, 539, 2, '2024-04-05 08:13:14', '029-027-000984779', 299.87, 0.00, 299.87, '');
INSERT INTO `transaction` VALUES (34, 1, 187, 2, '2024-04-15 09:26:08', '048-017-000647293', 262.12, 0.00, 262.12, '');
INSERT INTO `transaction` VALUES (35, 1, 81, 2, '2024-04-03 11:01:15', '006-017-000087927', 274.93, 0.00, 274.93, '');
INSERT INTO `transaction` VALUES (36, 1, 212, 2, '2024-04-23 17:28:38', '014-004-000457367', 313.43, 0.00, 313.43, '');
INSERT INTO `transaction` VALUES (37, 1, 44, 1, '2024-05-19 17:37:30', '001-003-000000020', 405.88, 0.00, 405.88, '');
INSERT INTO `transaction` VALUES (38, 1, 31, 1, '2024-05-22 19:13:53', '001-003-000000021', 369.36, 0.00, 369.36, '');
INSERT INTO `transaction` VALUES (39, 1, 69, 1, '2024-05-04 16:33:45', '001-003-000000022', 438.84, 0.00, 438.84, '');
INSERT INTO `transaction` VALUES (40, 1, 41, 1, '2024-05-17 19:06:43', '001-003-000000023', 445.00, 0.00, 445.00, '');
INSERT INTO `transaction` VALUES (41, 1, 19, 1, '2024-05-29 15:08:44', '001-003-000000024', 461.40, 0.00, 461.40, '');
INSERT INTO `transaction` VALUES (42, 1, 749, 2, '2024-05-10 09:03:21', '027-047-000218236', 270.18, 0.00, 270.18, '');
INSERT INTO `transaction` VALUES (43, 1, 360, 2, '2024-05-30 19:34:53', '033-031-000306736', 284.82, 0.00, 284.82, '');
INSERT INTO `transaction` VALUES (44, 1, 634, 2, '2024-05-11 12:35:00', '033-002-000800383', 256.10, 0.00, 256.10, '');
INSERT INTO `transaction` VALUES (45, 1, 169, 2, '2024-06-14 08:19:33', '004-002-000673799', 260.03, 0.00, 260.03, '');
INSERT INTO `transaction` VALUES (46, 1, 57, 1, '2024-06-10 08:55:25', '001-003-000000025', 343.60, 0.00, 343.60, '');
INSERT INTO `transaction` VALUES (47, 1, 10, 1, '2024-06-01 18:58:46', '001-003-000000026', 433.30, 0.00, 433.30, '');
INSERT INTO `transaction` VALUES (48, 1, 314, 2, '2024-06-11 17:07:11', '033-028-000916790', 349.81, 0.00, 349.81, '');
INSERT INTO `transaction` VALUES (49, 1, 28, 1, '2024-06-11 13:54:00', '001-003-000000027', 413.40, 0.00, 413.40, '');
INSERT INTO `transaction` VALUES (50, 1, 41, 1, '2024-06-29 08:02:57', '001-003-000000028', 341.40, 0.00, 341.40, '');
INSERT INTO `transaction` VALUES (51, 1, 64, 1, '2024-06-12 14:43:41', '001-003-000000029', 257.06, 0.00, 257.06, '');
INSERT INTO `transaction` VALUES (52, 1, 37, 1, '2024-06-13 19:37:51', '001-003-000000030', 307.56, 0.00, 307.56, '');
INSERT INTO `transaction` VALUES (53, 1, 372, 2, '2024-06-11 10:29:32', '036-024-000780112', 281.72, 0.00, 281.72, '');
INSERT INTO `transaction` VALUES (54, 1, 798, 4, '2024-01-01 06:10:10', '001-003-000000003', 573.00, 0.00, 573.00, '');
INSERT INTO `transaction` VALUES (55, 1, 215, 4, '2024-01-01 06:32:20', '001-003-000000004', 1928.00, 0.00, 1928.00, '');
INSERT INTO `transaction` VALUES (92, 2, 76, 2, '2024-08-20 17:46:07', '125-012-001589111', 1500.00, 0.00, 1500.00, '');
INSERT INTO `transaction` VALUES (93, 2, 78, 2, '2024-08-23 18:22:33', '002-125-0002569', 1121.60, 0.00, 1121.60, '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `idrole` int NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT 1 COMMENT '1-Active 0-Inactive',
  `idbot` bigint NOT NULL DEFAULT 0 COMMENT 'Si es diferente de 0 es que es usuario chatbot',
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'es',
  `operations` bigint NOT NULL DEFAULT 0 COMMENT 'Numero de operacion que ha realizado en el sistema',
  `lastlogged` datetime NULL DEFAULT NULL COMMENT 'Ultimo dia que se logueo o inicio sesion',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`iduser`) USING BTREE,
  INDEX `IDXROLE`(`idrole` ASC) USING BTREE,
  CONSTRAINT `IDXROLE` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 2, 'jorge', '$2y$12$nKDUhRshuMdplcHvok8nVe37Hj.1EAu1vli5QPAig3nO2YuXx8AWe', 'Jorge', 1, 0, 'es', 1, '2024-08-19 09:28:05', 'Q0hlTHR3elRaeFhsSG0vbk55dlloelRYaU5UVTFFeXh3UFEyVEFOenppOHk0OTJHSkUvb2JHUVNjSkFVRkNvMm50aFM5bVBuVWtUSFpVSUhRS3AzL0E9PQ==', '2024-06-21 15:30:34', '2024-08-19 09:28:05', NULL);
INSERT INTO `user` VALUES (2, 2, 'santiago', '$2y$12$eAar1nNNWJs/gv8IllJKIehMXtXpmR1ZimfPJ5BYak2CprW8HV8VS', 'Santiago', 1, 0, 'es', 15, '2024-08-03 01:46:43', 'ZG5RTTVkU1FJZmZsaG5FeVVGd3ZHUHhWWE82TFVaa1hxYzlWZ2E2YWtVZWt3STU5Z0pZVkZ6VGlCKzlQL2lxY1k1N0p3SmNrWHlDMEorYnZrV1NubWc9PQ==', '2024-06-21 15:30:47', '2024-08-16 23:11:38', NULL);
INSERT INTO `user` VALUES (3, 2, 'hugo', '$2y$12$JfgZQaHQi/yELIpCWyhm9.70LE5A2rAIss8/9TyN7NuOWlRvz/FOC', 'Hugo', 1, 0, 'es', 1, '2024-08-05 22:15:52', 'ZG5RTTVkU1FJZmZsaG5FeVVGd3ZHUHhWWE82TFVaa1hxYzlWZ2E2YWtVZWt3STU5Z0pZVkZ6VGlCKzlQL2lxY1k1N0p3SmNrWHlDMEorYnZrV1NubWc9PQ==', '2024-06-21 15:31:03', '2024-08-23 01:47:54', NULL);
INSERT INTO `user` VALUES (4, 2, 'joel', 'cambiar', 'Joel', 1, 0, 'es', 1, '2024-08-22 17:56:45', 'aE5zSGdtSlQ5Ym9vM2RadEJMSnhvUGxMbHZ0UUxwT1JCYTRTZDBtQWo4ZEVZNlh4N3R2YWRLOUJYbHo2Mm1kbDArVmFwTnpVV2YwaEViM2F5RVczWUE9PQ==', '2024-06-21 15:31:15', '2024-08-22 17:57:37', NULL);
INSERT INTO `user` VALUES (5, 2, 'rick', 'cambiar', 'Ricardo', 1, 0, 'es', 0, NULL, NULL, '2024-06-21 15:31:31', '2024-08-22 17:47:49', NULL);
INSERT INTO `user` VALUES (6, 5, 'SantiagoDieum', '', 'Santiago Borja', 0, 1427181793, 'es', 337, NULL, NULL, '2024-07-04 13:14:09', '2024-08-17 04:36:38', NULL);
INSERT INTO `user` VALUES (7, 5, 'therichard369', '', 'Ricardo V', 0, 1211357100, 'es', 6, NULL, NULL, '2024-07-09 21:49:54', '2024-07-09 21:53:03', NULL);
INSERT INTO `user` VALUES (8, 5, 'Hugueins_hv', '', 'Hugueins AHV', 0, 106245323, 'es', 4, NULL, NULL, '2024-07-09 21:57:11', '2024-07-09 21:58:07', NULL);
INSERT INTO `user` VALUES (9, 5, 'bot', '', '', 0, 0, 'es', 0, NULL, NULL, '2024-07-12 01:19:59', '2024-07-12 15:32:08', NULL);
INSERT INTO `user` VALUES (10, 5, 'AlyJoBorja', '', 'Aly Borja', 0, 7054851197, 'es', 3, NULL, NULL, '2024-07-13 21:35:18', '2024-07-15 00:34:46', NULL);
INSERT INTO `user` VALUES (23, 3, 'asdas', 'cambiar', 'asdasd', 0, 0, 'es', 0, NULL, NULL, '2024-08-07 17:35:44', '2024-08-13 23:33:07', '2024-08-13 23:33:07');
INSERT INTO `user` VALUES (24, 3, 'Rita', 'cambiar', 'Ing. Rita', 1, 0, 'es', 0, NULL, NULL, '2024-08-16 18:45:43', '2024-08-23 01:49:07', NULL);
INSERT INTO `user` VALUES (25, 3, 'UsuarioTest', 'cambiar', 'Usuario Test', 0, 0, 'es', 0, NULL, NULL, '2024-08-16 22:56:36', '2024-08-16 22:56:36', NULL);
INSERT INTO `user` VALUES (26, 1, 'reporter', '$2y$12$lgUAMApbNWrQoRICp9KFzemhFyBEedFSNNSuhDmVeT4t1uRMsbxvy', 'Reporteador', 1, 0, 'es', 1, '2024-08-23 01:45:07', 'UUNuSmxWbzRWV1poUHExd3J5Tjg4TjN5cWFrcDl0ajR2OWVERVFZSmZkUG5nN3NtYWFkODNJWE5YSHl6RFpTVHhON2tHeG5VY0p0UjdaSjg4SU1XT1E9PQ==', '2024-08-23 01:41:04', '2024-08-23 01:45:07', NULL);

-- ----------------------------
-- View structure for view_audit
-- ----------------------------
DROP VIEW IF EXISTS `view_audit`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_audit` AS select `a`.`idaudit` AS `idaudit`,`a`.`iduser` AS `iduser`,`u`.`fullname` AS `fullname`,`a`.`created_at` AS `date`,`a`.`ipaddr` AS `ipaddr`,`a`.`action` AS `method`,`a`.`route` AS `route`,`a`.`json` AS `json` from (`audit` `a` left join `user` `u` on((`a`.`iduser` = `u`.`iduser`)));

-- ----------------------------
-- View structure for view_beneficiary
-- ----------------------------
DROP VIEW IF EXISTS `view_beneficiary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_beneficiary` AS select distinct `b`.`idbeneficiary` AS `idbeneficiary`,`b`.`type` AS `type`,`b`.`ididentificationtype` AS `ididentificationtype`,`it`.`description` AS `identificationtype`,`b`.`identificationnumber` AS `identification`,`b`.`name` AS `nombre`,`b`.`comercialname` AS `nombrecomercial`,`b`.`address` AS `direccion`,`b`.`phone` AS `telefono`,`b`.`email` AS `email`,`b`.`web` AS `web`,`c`.`name` AS `pais`,`p`.`name` AS `provincia`,`cc`.`name` AS `ciudad`,`b`.`parish` AS `parroquia`,`b`.`deleted_at` AS `deleted_at`,`b`.`idcountry` AS `idcountry`,`b`.`idprovince` AS `idprovince`,`b`.`idcity` AS `idcity`,`b`.`creditquota` AS `creditquota`,`b`.`creditdays` AS `creditdays`,`b`.`account` AS `account` from ((((`beneficiary` `b` join `country` `c` on((`b`.`idcountry` = `c`.`idcountry`))) join `province` `p` on((`p`.`idprovince` = `b`.`idprovince`))) join `city` `cc` on((`cc`.`idcity` = `b`.`idcity`))) join `identificationtype` `it` on((`it`.`ididentificationtype` = `b`.`ididentificationtype`)));

-- ----------------------------
-- View structure for view_city
-- ----------------------------
DROP VIEW IF EXISTS `view_city`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_city` AS select `c`.`name` AS `country`,`p`.`name` AS `province`,`p`.`code` AS `code`,`ct`.`name` AS `city` from ((`country` `c` join `province` `p` on((`p`.`idcountry` = `c`.`idcountry`))) join `city` `ct` on((`ct`.`idprovince` = `p`.`idprovince`)));

-- ----------------------------
-- View structure for view_clients
-- ----------------------------
DROP VIEW IF EXISTS `view_clients`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_clients` AS select distinct cast(`b`.`idbeneficiary` as char charset utf8mb4) AS `idbeneficiary`,`b`.`identificationnumber` AS `identifiacion`,`b`.`name` AS `nombre`,`b`.`comercialname` AS `nombrecomercial`,`b`.`address` AS `direccion`,`b`.`phone` AS `telefono`,`b`.`email` AS `email`,`b`.`web` AS `web`,`c`.`name` AS `pais`,`p`.`name` AS `provincia`,`cc`.`name` AS `ciudad`,`b`.`parish` AS `parroquia` from (((`beneficiary` `b` join `country` `c` on((`b`.`idcountry` = `c`.`idcountry`))) join `province` `p` on((`p`.`idprovince` = `b`.`idprovince`))) join `city` `cc` on((`cc`.`idcity` = `b`.`idcity`))) where (`b`.`type` = 'C');

-- ----------------------------
-- View structure for view_get_menu
-- ----------------------------
DROP VIEW IF EXISTS `view_get_menu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_get_menu` AS select `role`.`idrole` AS `idrole`,`menu`.`idmenu` AS `idmenu`,`menu`.`order` AS `order`,`menu`.`name` AS `name`,`menu`.`icon` AS `icon`,`menu`.`route` AS `route`,`menu`.`submenu` AS `submenu`,`menu`.`deleted_at` AS `deleted_at` from ((`role` join `rolemenu` on((`role`.`idrole` = `rolemenu`.`idrole`))) join `menu` on((`rolemenu`.`idmenu` = `menu`.`idmenu`))) where (`menu`.`status` = 1) order by `menu`.`order`;

-- ----------------------------
-- View structure for view_get_users
-- ----------------------------
DROP VIEW IF EXISTS `view_get_users`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_get_users` AS select `u`.`iduser` AS `iduser`,`u`.`idrole` AS `idrole`,`r`.`name` AS `rolename`,`r`.`scope` AS `scope`,`u`.`username` AS `username`,`u`.`fullname` AS `fullname`,`u`.`status` AS `status`,`u`.`created_at` AS `created_at`,`u`.`udated_at` AS `udated_at`,`u`.`deleted_at` AS `deleted_at` from (`user` `u` join `role` `r` on((`u`.`idrole` = `r`.`idrole`)));

-- ----------------------------
-- View structure for view_movements
-- ----------------------------
DROP VIEW IF EXISTS `view_movements`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_movements` AS select cast(`p`.`idproduct` as char charset utf8mb4) AS `idproducto`,`p`.`productcode` AS `codigo`,`p`.`barcode` AS `codigobarras`,`p`.`name` AS `nombre`,`pl`.`description` AS `linea`,`pc`.`description` AS `categoria`,cast(`pm`.`qty` as char charset utf8mb4) AS `cantidad`,cast(`pm`.`price` as char charset utf8mb4) AS `precio`,cast(`pm`.`total` as char charset utf8mb4) AS `total`,`pm`.`entry` AS `asiento`,cast(`mt`.`idmovementtype` as char charset utf8mb4) AS `idmovementtype`,`mt`.`acronym` AS `coddoc`,`mt`.`name` AS `movimiento`,cast(`t`.`numberdocument` as char charset utf8mb4) AS `numdoc`,cast(`t`.`date` as datetime) AS `fecha`,cast(year(cast(`t`.`date` as date)) as char charset utf8mb4) AS `anio`,cast(month(cast(`t`.`date` as date)) as char charset utf8mb4) AS `mes`,cast(dayofmonth(cast(`t`.`date` as date)) as char charset utf8mb4) AS `dia`,cast(quarter(cast(`t`.`date` as date)) as char charset utf8mb4) AS `trimestre`,cast(week(cast(`t`.`date` as date),0) as char charset utf8mb4) AS `semana`,`b`.`name` AS `beneficiario`,cast(`b`.`type` as char charset utf8mb4) AS `tipo`,cast(`b`.`idcountry` as char charset utf8mb4) AS `pais_id`,`co`.`name` AS `pais`,`co`.`code` AS `pais_codigo`,cast(`b`.`idprovince` as char charset utf8mb4) AS `provincia_id`,`pr`.`name` AS `provincia`,`pr`.`code` AS `provincia_codigo`,cast(`b`.`idcity` as char charset utf8mb4) AS `cod_ciudad`,`ciu`.`name` AS `ciudad` from (((((((((`productmovement` `pm` join `transaction` `t` on((`t`.`idtransaction` = `pm`.`idtransaction`))) join `product` `p` on((`p`.`idproduct` = `pm`.`idproduct`))) join `movementtype` `mt` on((`mt`.`idmovementtype` = `t`.`idmovementtype`))) join `productline` `pl` on((`pl`.`idproductline` = `p`.`idproductline`))) join `productcategory` `pc` on((`pc`.`idproductcategory` = `p`.`idproductcategory`))) join `beneficiary` `b` on((`b`.`idbeneficiary` = `t`.`idbeneficiary`))) join `country` `co` on((`co`.`idcountry` = `b`.`idcountry`))) join `province` `pr` on((`pr`.`idprovince` = `b`.`idprovince`))) join `city` `ciu` on((`ciu`.`idcity` = `b`.`idcity`)));

-- ----------------------------
-- View structure for view_products
-- ----------------------------
DROP VIEW IF EXISTS `view_products`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_products` AS select `pr`.`name` AS `presentation`,`pl`.`description` AS `line`,`pc`.`description` AS `category`,`p`.`idproduct` AS `idproduct`,`p`.`idpresentation` AS `idpresentation`,`p`.`idproductline` AS `idproductline`,`p`.`idproductcategory` AS `idproductcategory`,`p`.`productcode` AS `productcode`,`p`.`barcode` AS `barcode`,`p`.`name` AS `name`,`p`.`description` AS `description`,`p`.`cost` AS `cost`,`p`.`stock` AS `stock`,`p`.`price` AS `price`,`p`.`stock_min` AS `stock_min`,`p`.`stock_max` AS `stock_max`,`p`.`image` AS `image`,`p`.`status` AS `status`,`p`.`accountcost` AS `accountcost`,`p`.`accountsales` AS `accountsales`,`p`.`accountinv` AS `accountinv`,`p`.`created_at` AS `created_at`,`p`.`udated_at` AS `udated_at`,`p`.`deleted_at` AS `deleted_at` from (((`product` `p` join `presentation` `pr` on((`pr`.`idpresentation` = `p`.`idpresentation`))) join `productline` `pl` on((`pl`.`idproductline` = `p`.`idproductline`))) join `productcategory` `pc` on((`pc`.`idproductcategory` = `p`.`idproductcategory`)));

-- ----------------------------
-- View structure for view_roles_by_nusers
-- ----------------------------
DROP VIEW IF EXISTS `view_roles_by_nusers`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_roles_by_nusers` AS select `r`.`idrole` AS `idrole`,`r`.`name` AS `name`,`r`.`scope` AS `scope`,`r`.`status` AS `status`,`r`.`created_at` AS `created_at`,`r`.`updated_at` AS `updated_at`,`r`.`deleted_at` AS `deleted_at`,(select count(`u`.`iduser`) from `user` `u` where (`u`.`idrole` = `r`.`idrole`)) AS `nusuarios`,(select count(`rm`.`idmenu`) from `rolemenu` `rm` where (`r`.`idrole` = `rm`.`idrole`)) AS `nmenus` from `role` `r`;

-- ----------------------------
-- View structure for view_transaction
-- ----------------------------
DROP VIEW IF EXISTS `view_transaction`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_transaction` AS select `t`.`idtransaction` AS `idtransaction`,`t`.`date` AS `date`,`t`.`idbeneficiary` AS `idbeneficiary`,`b`.`name` AS `beneficiary_name`,`t`.`idmovementtype` AS `idmovementtype`,`mt`.`name` AS `type`,`t`.`numberdocument` AS `numberdocument`,`t`.`reference` AS `reference`,`t`.`subtotal` AS `subtotal`,`t`.`total` AS `total`,`t`.`iduser` AS `iduser`,`u`.`fullname` AS `fullname`,(select count(0) from `productmovement` `pm` where (`pm`.`idtransaction` = `t`.`idtransaction`)) AS `nitems` from (((`transaction` `t` join `movementtype` `mt` on((`mt`.`idmovementtype` = `t`.`idmovementtype`))) join `beneficiary` `b` on((`b`.`idbeneficiary` = `t`.`idbeneficiary`))) join `user` `u` on((`u`.`iduser` = `t`.`iduser`)));

-- ----------------------------
-- View structure for view_users
-- ----------------------------
DROP VIEW IF EXISTS `view_users`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_users` AS select cast(`u`.`iduser` as char charset utf8mb4) AS `iduser`,`u`.`idrole` AS `idrole`,`r`.`name` AS `rolename`,`r`.`scope` AS `scope`,`u`.`username` AS `username`,`u`.`fullname` AS `fullname`,`u`.`status` AS `status`,`u`.`lang` AS `lang`,`u`.`created_at` AS `created_at`,`u`.`udated_at` AS `udated_at`,`u`.`deleted_at` AS `deleted_at` from (`user` `u` join `role` `r` on((`u`.`idrole` = `r`.`idrole`))) where (`u`.`idrole` <> 5);

-- ----------------------------
-- Procedure structure for check_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `check_password`;
delimiter ;;
CREATE PROCEDURE `check_password`(IN toID int)
BEGIN
  DECLARE loERROR INTEGER DEFAULT(0);
  DECLARE loNUSER INTEGER DEFAULT(0);
  DECLARE sndRESPONSE VARCHAR(255) DEFAULT("");
  DECLARE loPASS VARCHAR(255) DEFAULT("");
   
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
 	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;
  
  SELECT count(*) INTO loNUSER FROM `user` WHERE idbot = toID;
  
  IF loNUSER > 0 THEN
    
    SELECT `password` INTO loPASS FROM `user` WHERE idbot = toID;
    
    SET sndRESPONSE = CONCAT("SHOW|",loPASS);

  ELSE
    SET sndRESPONSE = "ERROR|USUARIO NO ENCONTRADO";
  END IF;

  SELECT sndRESPONSE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getNumberSequential
-- ----------------------------
DROP PROCEDURE IF EXISTS `getNumberSequential`;
delimiter ;;
CREATE PROCEDURE `getNumberSequential`(IN toTMOV varchar(10))
BEGIN
  
  START TRANSACTION;
    UPDATE movementtype SET sequential = sequential + 1 WHERE acronym = toTMOV;
  COMMIT;
   
  SELECT sequential FROM movementtype WHERE acronym = toTMOV;
  
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_password`;
delimiter ;;
CREATE PROCEDURE `set_password`(IN toID int, IN toNEWPASS varchar(255))
BEGIN
  DECLARE loERROR INTEGER DEFAULT(0);
  DECLARE loNUSER INTEGER DEFAULT(0);
  DECLARE sndRESPONSE VARCHAR(255) DEFAULT("");
   
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
 	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;
  
  SELECT count(*) INTO loNUSER FROM `user` WHERE idbot = toID;
  
  IF loNUSER > 0 THEN
    
    START TRANSACTION;
    
    SET @loSQL = CONCAT("UPDATE user SET password='",toNEWPASS,"' WHERE idbot = ", toID);
    -- select @loSQL;
    
		PREPARE STMT FROM @loSQL;
		EXECUTE STMT;
    
    -- CALL store_bot_messages(toID, "", "", "", "UPDATE PASSWORD", "menu");
    
    COMMIT; 
    
    SET sndRESPONSE = "EXEC|menu";

  ELSE
    SET sndRESPONSE = "ERROR|USUARIO NO ENCONTRADO";
  END IF;

  SELECT sndRESPONSE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_kardex
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_kardex`;
delimiter ;;
CREATE PROCEDURE `sp_kardex`(IN `toDATO` BIGINT,IN `toSHOW` INT)
BEGIN


DECLARE loERROR 		INTEGER DEFAULT 0;
DECLARE loPRODID 		BIGINT DEFAULT 0;
DECLARE loDOCKXID 	BIGINT DEFAULT 0;
DECLARE loID 			BIGINT DEFAULT 0;
DECLARE loNEWID 			BIGINT DEFAULT 0;
DECLARE loNOMBRE		VARCHAR(500) DEFAULT '';
DECLARE loTIPODOC	 	VARCHAR(50) DEFAULT '';
DECLARE loFECHA	 	VARCHAR(50) DEFAULT '';
DECLARE loNUMDOC		VARCHAR(50) DEFAULT '';
DECLARE loBENE			VARCHAR(500) DEFAULT '';
DECLARE loASIENTO		VARCHAR(1) DEFAULT '';
DECLARE loBODEGAID	BIGINT DEFAULT 0;
DECLARE loDATO2		BIGINT DEFAULT 0;
DECLARE loBODEGA		VARCHAR(200) DEFAULT '';
DECLARE loING_CANT	DOUBLE(20,4) DEFAULT 0;
DECLARE loING_COSTO	DOUBLE(20,4) DEFAULT 0;
DECLARE loING_TOTAL	DOUBLE(20,4) DEFAULT 0;
DECLARE loEGR_CANT	DOUBLE(20,4) DEFAULT 0;
DECLARE loEGR_COSTO	DOUBLE(20,4) DEFAULT 0;
DECLARE loEGR_TOTAL	DOUBLE(20,4) DEFAULT 0;
DECLARE loSAL_CANT	DOUBLE(20,4) DEFAULT 0;
DECLARE loSAL_COSTO	DOUBLE(20,4) DEFAULT 0;
DECLARE loSAL_TOTAL	DOUBLE(20,4) DEFAULT 0;
DECLARE loPVP			DOUBLE(20,4) DEFAULT 0;
DECLARE loPACK			VARCHAR(1) DEFAULT '';
DECLARE loCLASE		VARCHAR(1) DEFAULT '';
DECLARE loTIPO 		VARCHAR(5) DEFAULT '';

DECLARE loSALCOST			DOUBLE(20,4) DEFAULT 0;
DECLARE loSALSTOCK		DOUBLE(20,4) DEFAULT 0;
 
DECLARE faux CURSOR for 
		SELECT 
      v.idproducto, 
      v.nombre,
      v.asiento,
      v.coddoc,
      v.numdoc,
      v.beneficiario,
      v.fecha, 
      IF(v.asiento = 'I', v.cantidad, 0) AS ing_cant,
      IF(v.asiento = 'I', v.precio, 0) AS ing_costo,
      IF(v.asiento = 'I', v.total, 0) AS ing_total,
      IF(v.asiento = 'E', v.cantidad, 0) AS egr_cant
    FROM 
      view_movements v 
    WHERE
      idproducto = toDATO
    ORDER BY 
      v.nombre, v.fecha;
		
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;

DROP TABLE IF EXISTS tmp_kardex;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_kardex (
	 id						      BIGINT(20) NOT NULL AUTO_INCREMENT,
	 idproducto			    BIGINT(20) DEFAULT 0,
	 idproducto_nombre	VARCHAR(500) DEFAULT '',
	 tipo_comprobante		VARCHAR(50) DEFAULT '',
	 fecha					    date ,
	 numero_documento		VARCHAR(100) DEFAULT '',
	 beneficiario			  VARCHAR(500) DEFAULT '',
	 asiento					  VARCHAR(1) DEFAULT '',
	 ing_cant			  	  DOUBLE(20,4) DEFAULT 0,
	 ing_costo   			  DOUBLE(20,4) DEFAULT 0,
	 ing_total				  DOUBLE(20,4) DEFAULT 0,
	 egr_cant				    DOUBLE(20,4) DEFAULT 0,
	 egr_costo				  DOUBLE(20,4) DEFAULT 0,
	 egr_total				  DOUBLE(20,4) DEFAULT 0,
	 sal_cant				    DOUBLE(20,4) DEFAULT 0,
	 sal_costo 		      DOUBLE(20,4) DEFAULT 0,
	 sal_total				  DOUBLE(20,4) DEFAULT 0,
	 PRIMARY KEY(id),
	 UNIQUE KEY id (id)	
	 )ENGINE = MEMORY;
	 
   
   
SET loSAL_CANT = 0;
SET loSAL_COSTO = 0;
SET loSAL_TOTAL = 0;
SET @newSAL_CANT = 0;
SET @newSAL_COSTO = 0;
SET @newSAL_TOTAL = 0;

START TRANSACTION;
	OPEN faux;
		FETCH NEXT FROM faux INTO loID,loNOMBRE,loASIENTO,loTIPODOC,loNUMDOC,loBENE,loFECHA,loING_CANT,loING_COSTO,loING_TOTAL,loEGR_CANT;
		WHILE loERROR = 0 DO
    
      INSERT INTO tmp_kardex (
          idproducto,
          idproducto_nombre,
          tipo_comprobante,
          fecha,
          numero_documento,
          beneficiario,
          asiento,
          ing_cant,
          ing_costo,
          ing_total,
          egr_cant,
          egr_costo,
          egr_total,
          sal_cant,
          sal_costo,
          sal_total
       ) VALUES (
          loID,
          loNOMBRE,
          loTIPODOC,
          loFECHA,
          loNUMDOC,
          loBENE,
          loASIENTO,
          loING_CANT,
          loING_COSTO,
          loING_TOTAL,
          loEGR_CANT,
          0,
          0,
          0,
          0,
          0
       );
       
      SELECT LAST_INSERT_ID() INTO loNEWID;
			
			IF loASIENTO="I" THEN
				SET loSAL_CANT = loSAL_CANT + loING_CANT;
				SET loSAL_TOTAL = loSAL_TOTAL + loING_TOTAL;
				IF loSAL_CANT>0 THEN
					SET loSAL_COSTO = loSAL_TOTAL / loSAL_CANT;
				ELSE
					SET loSAL_COSTO = loSAL_TOTAL / ABS(loSAL_CANT);
				END IF;
			ELSEIF loASIENTO="E" THEN
				SET loSAL_CANT = loSAL_CANT - loEGR_CANT;
				SET loSAL_TOTAL = loSAL_CANT * loSAL_COSTO;
				SET loEGR_COSTO = loSAL_COSTO;
				SET loEGR_TOTAL = loEGR_COSTO * loEGR_CANT;
			END IF ;

			IF (ISNULL(loSAL_CANT)=1) THEN 
				SET loSAL_CANT = 0;
			END IF ;

			IF (ISNULL(loSAL_COSTO)=1) THEN 
				SET loSAL_COSTO = 0;
			END IF ;

			IF (ISNULL(loSAL_TOTAL)=1) THEN 
				SET loSAL_TOTAL = 0;
			END IF ;
			
			IF loASIENTO="I" THEN
				UPDATE tmp_kardex t
					SET 
						t.sal_cant = COALESCE(loSAL_CANT,0),
						t.sal_costo = COALESCE(loSAL_COSTO,0),
						t.sal_total = COALESCE(loSAL_TOTAL,0)
					WHERE 
						t.id = loNEWID;
			ELSE
				UPDATE tmp_kardex t
					SET 
						t.egr_costo = COALESCE(loEGR_COSTO,0),
						t.egr_total = COALESCE(loEGR_TOTAL,0),
						t.sal_cant = COALESCE(loSAL_CANT,0),
						t.sal_costo = COALESCE(loSAL_COSTO,0),
						t.sal_total = COALESCE(loSAL_TOTAL,0)
					WHERE 
						t.id = loNEWID;
			END IF;
      
      
			SET loERROR=0;
			FETCH NEXT FROM faux INTO loID,loNOMBRE,loASIENTO,loTIPODOC,loNUMDOC,loBENE,loFECHA,loING_CANT,loING_COSTO,loING_TOTAL,loEGR_CANT;
		END WHILE;

	CLOSE faux;
  
  
  SELECT sal_cant,sal_costo INTO loSALSTOCK, loSALCOST FROM tmp_kardex ORDER BY id DESC LIMIT 1;
  
  UPDATE product SET stock = loSALSTOCK, cost=loSALCOST WHERE idproduct = toDATO;


COMMIT ;

IF toSHOW = 1 THEN
  SELECT * FROM tmp_kardex order by fecha;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_recalculo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_recalculo`;
delimiter ;;
CREATE PROCEDURE `sp_recalculo`()
BEGIN
	DECLARE loERROR 		INTEGER DEFAULT 0;
	DECLARE loBODPRODID 	BIGINT DEFAULT 0;
	DECLARE loPRODID 		BIGINT DEFAULT 0;


	DECLARE faux CURSOR FOR
		SELECT
			idproduct
		FROM 
			product
		WHERE
			status = 1;
			
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;
	-- DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 'Ocurrio Error';

	/* LECTURA DE TODOS LOS ITEMS EN KARDEX */
	SET loERROR=0;
	SET @loSQL="";

	/* ENCERADO DE STOCK EN BODEGAS */

	UPDATE product p
		SET
			p.cost = 0,
			p.stock = 0;

START TRANSACTION;
	OPEN faux;
		FETCH NEXT FROM faux INTO loPRODID;
		WHILE loERROR = 0 DO

		CALL sp_kardex(loPRODID,0);

		SET loERROR = 0;
	 	FETCH NEXT FROM faux INTO loPRODID;
	 	END WHILE;
	CLOSE faux;
COMMIT ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for store_bot_messages
-- ----------------------------
DROP PROCEDURE IF EXISTS `store_bot_messages`;
delimiter ;;
CREATE PROCEDURE `store_bot_messages`(IN toID bigint(11), IN toAuthor varchar(255), IN toLang varchar(255), IN toUsername varchar(255), IN toTextentered text, IN toKeyresult varchar(255), IN toData TEXT)
BEGIN
  DECLARE loERROR INTEGER DEFAULT(0);
  DECLARE loNUSER INTEGER DEFAULT(0);
  DECLARE loNREC INTEGER DEFAULT(0);
  DECLARE loIDUSER BIGINT DEFAULT(0);
  DECLARE loPASS VARCHAR(255) DEFAULT("");
  DECLARE loLASTLOGGED VARCHAR(255) DEFAULT("");
  DECLARE loIDROLE BIGINT DEFAULT(5);
  DECLARE sndRESPONSE VARCHAR(255) DEFAULT("");
 
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
 	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;
  
  START TRANSACTION;
  
    SELECT count(*) INTO loNUSER FROM `user` WHERE idbot = toID;
    
    IF loNUSER = 0 THEN
      INSERT INTO user (username,password,fullname,status,idbot,lang, idrole) VALUES (toUsername, '', toAuthor, 0, toID, toLang, loIDROLE);
      
      -- SET sndRESPONSE = "NEW|PASSWOOD";
      SET sndRESPONSE = "OK|";
    ELSE
      SELECT iduser, `password`, COALESCE(lastlogged,"") INTO loIDUSER, loPASS, loLASTLOGGED FROM user WHERE idbot = toID LIMIT 1;
      
      UPDATE user SET operations = operations + 1 WHERE iduser = loIDUSER;
      
      IF toUsername != "" THEN
        UPDATE user SET username = toUsername, lang = toLang WHERE iduser = loIDUSER;
      END IF;
        
      INSERT INTO bot_audit (iduser, textentered, keyresult, data) VALUES (loIDUSER, toTextentered, toKeyresult, toData);
      
      IF  (toKeyresult != "") THEN
        SELECT count(*) INTO loNREC FROM bot_spelling WHERE wordfind = toTextentered and menurun = toKeyresult;
        
        IF loNREC = 0 THEN
          INSERT INTO bot_spelling (wordfind, menurun) VALUES (toTextentered, toKeyresult);
        END IF;
      END IF;
      
      SET sndRESPONSE = "OK|";
      
      /*IF loPASS = "" THEN
        SET sndRESPONSE = "SET|PASSWOOD";
      ELSE
        UPDATE user SET operations = operations + 1 WHERE iduser = loIDUSER;
        
        INSERT INTO bot_audit (iduser, textentered, keyresult) VALUES (loIDUSER, toTextentered, toKeyresult);
        
        SET sndRESPONSE = "OK|";
        
        IF loLASTLOGGED = "" THEN
          SET sndRESPONSE = "LOGIN|";
        END IF;
        
        IF loLASTLOGGED != DATE(NOW()) THEN
          SET sndRESPONSE = "LOGIN|";
        END IF;
        
        
      END IF;
      */
    END IF;
    
  COMMIT;

  SELECT sndRESPONSE;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productmovement
-- ----------------------------
DROP TRIGGER IF EXISTS `WhenInsert`;
delimiter ;;
CREATE TRIGGER `WhenInsert` AFTER INSERT ON `productmovement` FOR EACH ROW IF NEW.entry = 'I' THEN
  UPDATE product SET stock = stock - NEW.qty WHERE idproduct = NEW.idproduct;
ELSE
  UPDATE product SET stock = stock + NEW.qty WHERE idproduct = NEW.idproduct;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productmovement
-- ----------------------------
DROP TRIGGER IF EXISTS `WhenUpdate`;
delimiter ;;
CREATE TRIGGER `WhenUpdate` AFTER UPDATE ON `productmovement` FOR EACH ROW IF NEW.entry = 'I' THEN
  UPDATE product SET stock = stock - OLD.qty WHERE idproduct = NEW.idproduct;
  UPDATE product SET stock = stock + NEW.qty WHERE idproduct = NEW.idproduct;
ELSE
  UPDATE product SET stock = stock + OLD.qty WHERE idproduct = NEW.idproduct;
  UPDATE product SET stock = stock - NEW.qty WHERE idproduct = NEW.idproduct;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productmovement
-- ----------------------------
DROP TRIGGER IF EXISTS `WhenDelete`;
delimiter ;;
CREATE TRIGGER `WhenDelete` AFTER DELETE ON `productmovement` FOR EACH ROW IF OLD.entry = 'I' THEN
  UPDATE product SET stock = stock - OLD.qty WHERE idproduct = OLD.idproduct;
ELSE
  UPDATE product SET stock = stock + OLD.qty WHERE idproduct = OLD.idproduct;
END IF
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
