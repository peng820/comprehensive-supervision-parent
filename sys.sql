/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : shiro

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 13/11/2023 21:16:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父节点',
  `sort_order` int(11) NULL DEFAULT NULL COMMENT '排序',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '删除标志',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建账号',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新账号',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '测试部门', 0, 1, 1, '0', '2022-05-10 10:11:04', NULL, '2022-05-10 10:11:19', NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `log_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '修改人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remote_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time` bigint(20) NULL DEFAULT NULL COMMENT '执行时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tenant_id` bigint(20) NULL DEFAULT 0 COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`log_type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort_order` int(11) NULL DEFAULT 1 COMMENT '排序值',
  `keep_alive` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1000, '权限管理', NULL, '/admin', -1, 'icon-quanxianguanli', 0, '0', '1', '0', ' ', '2018-09-28 08:29:53', ' ', '2022-01-25 17:24:21', '0', 1);
INSERT INTO `sys_menu` VALUES (1100, '用户管理', NULL, '/admin/user/index', 1000, 'icon-yonghuguanli', 1, '0', '1', '0', ' ', '2017-11-02 22:24:37', ' ', '2022-01-27 11:58:48', '0', 1);
INSERT INTO `sys_menu` VALUES (1101, '用户新增', 'sys_user_add', NULL, 1100, NULL, 1, '0', '1', '1', ' ', '2017-11-08 09:52:09', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1102, '用户修改', 'sys_user_edit', NULL, 1100, NULL, 1, '0', '1', '1', ' ', '2017-11-08 09:52:48', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1103, '用户删除', 'sys_user_del', NULL, 1100, NULL, 1, '0', '1', '1', ' ', '2017-11-08 09:54:01', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1200, '菜单管理', NULL, '/admin/menu/index', 1000, 'icon-caidanguanli', 2, '0', '1', '0', ' ', '2017-11-08 09:57:27', ' ', '2022-01-27 11:58:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1201, '菜单新增', 'sys_menu_add', NULL, 1200, NULL, 1, '0', '1', '1', ' ', '2017-11-08 10:15:53', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1202, '菜单修改', 'sys_menu_edit', NULL, 1200, NULL, 1, '0', '1', '1', ' ', '2017-11-08 10:16:23', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1203, '菜单删除', 'sys_menu_del', NULL, 1200, NULL, 1, '0', '1', '1', ' ', '2017-11-08 10:16:43', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1300, '角色管理', NULL, '/admin/role/index', 1000, 'icon-jiaoseguanli', 3, '0', '1', '0', ' ', '2017-11-08 10:13:37', ' ', '2022-01-27 11:59:01', '0', 1);
INSERT INTO `sys_menu` VALUES (1301, '角色新增', 'sys_role_add', NULL, 1300, NULL, 1, '0', '1', '1', ' ', '2017-11-08 10:14:18', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1302, '角色修改', 'sys_role_edit', NULL, 1300, NULL, 1, '0', '1', '1', ' ', '2017-11-08 10:14:41', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1303, '角色删除', 'sys_role_del', NULL, 1300, NULL, 1, '0', '1', '1', ' ', '2017-11-08 10:14:59', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1304, '分配权限', 'sys_role_perm', NULL, 1300, NULL, 1, '0', '1', '1', ' ', '2018-04-20 07:22:55', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1400, '部门管理', NULL, '/admin/dept/index', 1000, 'icon-web-icon-', 4, '0', '1', '0', ' ', '2018-01-20 13:17:19', ' ', '2022-01-27 11:59:06', '0', 1);
INSERT INTO `sys_menu` VALUES (1401, '部门新增', 'sys_dept_add', NULL, 1400, NULL, 1, '0', '1', '1', ' ', '2018-01-20 14:56:16', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1402, '部门修改', 'sys_dept_edit', NULL, 1400, NULL, 1, '0', '1', '1', ' ', '2018-01-20 14:56:59', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (1403, '部门删除', 'sys_dept_del', NULL, 1400, NULL, 1, '0', '1', '1', ' ', '2018-01-20 14:57:28', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (2000, '系统管理', NULL, '/system', -1, 'icon-xitongpeizhi', 1, '0', '1', '0', ' ', '2017-11-07 20:56:00', ' ', '2022-02-05 16:15:14', '0', 1);
INSERT INTO `sys_menu` VALUES (2100, '日志管理', NULL, '/admin/log/index', 2000, 'icon-rizhi', 5, '0', '1', '0', ' ', '2017-11-20 14:06:22', ' ', '2020-03-24 08:56:56', '0', 1);
INSERT INTO `sys_menu` VALUES (2101, '日志删除', 'sys_log_del', NULL, 2100, NULL, 1, '0', '1', '1', ' ', '2017-11-20 20:37:37', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (2200, '字典管理', NULL, '/admin/dict/index', 2000, 'icon-navicon-zdgl', 6, '0', '1', '0', ' ', '2017-11-29 11:30:52', ' ', '2020-03-24 08:56:58', '0', 1);
INSERT INTO `sys_menu` VALUES (2201, '字典删除', 'sys_dict_del', NULL, 2200, NULL, 1, '0', '1', '1', ' ', '2017-11-29 11:30:11', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (2202, '字典新增', 'sys_dict_add', NULL, 2200, NULL, 1, '0', '1', '1', ' ', '2018-05-11 22:34:55', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (2203, '字典修改', 'sys_dict_edit', NULL, 2200, NULL, 1, '0', '1', '1', ' ', '2018-05-11 22:36:03', ' ', '2021-05-25 03:12:55', '0', 1);
INSERT INTO `sys_menu` VALUES (3000, '系统监控', NULL, '/daemon', -1, 'icon-msnui-supervise', 2, '0', '1', '2', ' ', '2018-07-27 01:13:21', ' ', '2020-03-24 08:57:31', '0', 1);
INSERT INTO `sys_menu` VALUES (3100, '接口文档', NULL, 'http://127.0.0.1:9999/swagger-ui/index.html', 3000, 'icon-wendang', 1, '0', '1', '0', ' ', '2018-06-26 10:50:32', ' ', '2023-05-16 21:08:26', '0', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL,
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ds_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '2',
  `ds_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '修改人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `role_idx1_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'ROLE_ADMIN', '管理员', '0', '2', ' ', ' ', '2017-10-29 15:45:51', '2022-05-09 20:46:55', '0', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1100);
INSERT INTO `sys_role_menu` VALUES (1, 1101);
INSERT INTO `sys_role_menu` VALUES (1, 1102);
INSERT INTO `sys_role_menu` VALUES (1, 1103);
INSERT INTO `sys_role_menu` VALUES (1, 1104);
INSERT INTO `sys_role_menu` VALUES (1, 1200);
INSERT INTO `sys_role_menu` VALUES (1, 1201);
INSERT INTO `sys_role_menu` VALUES (1, 1202);
INSERT INTO `sys_role_menu` VALUES (1, 1203);
INSERT INTO `sys_role_menu` VALUES (1, 1300);
INSERT INTO `sys_role_menu` VALUES (1, 1301);
INSERT INTO `sys_role_menu` VALUES (1, 1302);
INSERT INTO `sys_role_menu` VALUES (1, 1303);
INSERT INTO `sys_role_menu` VALUES (1, 1304);
INSERT INTO `sys_role_menu` VALUES (1, 1400);
INSERT INTO `sys_role_menu` VALUES (1, 1401);
INSERT INTO `sys_role_menu` VALUES (1, 1402);
INSERT INTO `sys_role_menu` VALUES (1, 1403);
INSERT INTO `sys_role_menu` VALUES (1, 1500);
INSERT INTO `sys_role_menu` VALUES (1, 1501);
INSERT INTO `sys_role_menu` VALUES (1, 1502);
INSERT INTO `sys_role_menu` VALUES (1, 1503);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2100);
INSERT INTO `sys_role_menu` VALUES (1, 2101);
INSERT INTO `sys_role_menu` VALUES (1, 2102);
INSERT INTO `sys_role_menu` VALUES (1, 2200);
INSERT INTO `sys_role_menu` VALUES (1, 2201);
INSERT INTO `sys_role_menu` VALUES (1, 2202);
INSERT INTO `sys_role_menu` VALUES (1, 2203);
INSERT INTO `sys_role_menu` VALUES (1, 2210);
INSERT INTO `sys_role_menu` VALUES (1, 2211);
INSERT INTO `sys_role_menu` VALUES (1, 2212);
INSERT INTO `sys_role_menu` VALUES (1, 2213);
INSERT INTO `sys_role_menu` VALUES (1, 2300);
INSERT INTO `sys_role_menu` VALUES (1, 2400);
INSERT INTO `sys_role_menu` VALUES (1, 2401);
INSERT INTO `sys_role_menu` VALUES (1, 2402);
INSERT INTO `sys_role_menu` VALUES (1, 2403);
INSERT INTO `sys_role_menu` VALUES (1, 2500);
INSERT INTO `sys_role_menu` VALUES (1, 2501);
INSERT INTO `sys_role_menu` VALUES (1, 2502);
INSERT INTO `sys_role_menu` VALUES (1, 2503);
INSERT INTO `sys_role_menu` VALUES (1, 2600);
INSERT INTO `sys_role_menu` VALUES (1, 2601);
INSERT INTO `sys_role_menu` VALUES (1, 2700);
INSERT INTO `sys_role_menu` VALUES (1, 2800);
INSERT INTO `sys_role_menu` VALUES (1, 2810);
INSERT INTO `sys_role_menu` VALUES (1, 2820);
INSERT INTO `sys_role_menu` VALUES (1, 2830);
INSERT INTO `sys_role_menu` VALUES (1, 2840);
INSERT INTO `sys_role_menu` VALUES (1, 2850);
INSERT INTO `sys_role_menu` VALUES (1, 2860);
INSERT INTO `sys_role_menu` VALUES (1, 2870);
INSERT INTO `sys_role_menu` VALUES (1, 3000);
INSERT INTO `sys_role_menu` VALUES (1, 3100);
INSERT INTO `sys_role_menu` VALUES (1, 3101);
INSERT INTO `sys_role_menu` VALUES (1, 3110);
INSERT INTO `sys_role_menu` VALUES (1, 3200);
INSERT INTO `sys_role_menu` VALUES (1, 3300);
INSERT INTO `sys_role_menu` VALUES (1, 3400);
INSERT INTO `sys_role_menu` VALUES (1, 3500);
INSERT INTO `sys_role_menu` VALUES (1, 3600);
INSERT INTO `sys_role_menu` VALUES (1, 4000);
INSERT INTO `sys_role_menu` VALUES (1, 4100);
INSERT INTO `sys_role_menu` VALUES (1, 4101);
INSERT INTO `sys_role_menu` VALUES (1, 4200);
INSERT INTO `sys_role_menu` VALUES (1, 4201);
INSERT INTO `sys_role_menu` VALUES (1, 4300);
INSERT INTO `sys_role_menu` VALUES (1, 4301);
INSERT INTO `sys_role_menu` VALUES (1, 4302);
INSERT INTO `sys_role_menu` VALUES (1, 4303);
INSERT INTO `sys_role_menu` VALUES (1, 4400);
INSERT INTO `sys_role_menu` VALUES (1, 4401);
INSERT INTO `sys_role_menu` VALUES (1, 5000);
INSERT INTO `sys_role_menu` VALUES (1, 5100);
INSERT INTO `sys_role_menu` VALUES (1, 5110);
INSERT INTO `sys_role_menu` VALUES (1, 5120);
INSERT INTO `sys_role_menu` VALUES (1, 5130);
INSERT INTO `sys_role_menu` VALUES (1, 5200);
INSERT INTO `sys_role_menu` VALUES (1, 5300);
INSERT INTO `sys_role_menu` VALUES (1, 5310);
INSERT INTO `sys_role_menu` VALUES (1, 5320);
INSERT INTO `sys_role_menu` VALUES (1, 5330);
INSERT INTO `sys_role_menu` VALUES (1, 5400);
INSERT INTO `sys_role_menu` VALUES (1, 5410);
INSERT INTO `sys_role_menu` VALUES (1, 5420);
INSERT INTO `sys_role_menu` VALUES (1, 5430);
INSERT INTO `sys_role_menu` VALUES (1, 5500);
INSERT INTO `sys_role_menu` VALUES (1, 5510);
INSERT INTO `sys_role_menu` VALUES (1, 5520);
INSERT INTO `sys_role_menu` VALUES (1, 5530);
INSERT INTO `sys_role_menu` VALUES (1, 6000);
INSERT INTO `sys_role_menu` VALUES (1, 6100);
INSERT INTO `sys_role_menu` VALUES (1, 6101);
INSERT INTO `sys_role_menu` VALUES (1, 6102);
INSERT INTO `sys_role_menu` VALUES (1, 6103);
INSERT INTO `sys_role_menu` VALUES (1, 6200);
INSERT INTO `sys_role_menu` VALUES (1, 6201);
INSERT INTO `sys_role_menu` VALUES (1, 6202);
INSERT INTO `sys_role_menu` VALUES (1, 6203);
INSERT INTO `sys_role_menu` VALUES (1, 6204);
INSERT INTO `sys_role_menu` VALUES (1, 6300);
INSERT INTO `sys_role_menu` VALUES (1, 6301);
INSERT INTO `sys_role_menu` VALUES (1, 6302);
INSERT INTO `sys_role_menu` VALUES (1, 6303);
INSERT INTO `sys_role_menu` VALUES (1, 6400);
INSERT INTO `sys_role_menu` VALUES (1, 6401);
INSERT INTO `sys_role_menu` VALUES (1, 6402);
INSERT INTO `sys_role_menu` VALUES (1, 6500);
INSERT INTO `sys_role_menu` VALUES (1, 6600);
INSERT INTO `sys_role_menu` VALUES (1, 6601);
INSERT INTO `sys_role_menu` VALUES (1, 6602);
INSERT INTO `sys_role_menu` VALUES (1, 6700);
INSERT INTO `sys_role_menu` VALUES (1, 6701);
INSERT INTO `sys_role_menu` VALUES (1, 6702);
INSERT INTO `sys_role_menu` VALUES (1, 6703);
INSERT INTO `sys_role_menu` VALUES (1, 6800);
INSERT INTO `sys_role_menu` VALUES (1, 6801);
INSERT INTO `sys_role_menu` VALUES (1, 6802);
INSERT INTO `sys_role_menu` VALUES (1, 6803);
INSERT INTO `sys_role_menu` VALUES (1, 6804);
INSERT INTO `sys_role_menu` VALUES (1, 7000);
INSERT INTO `sys_role_menu` VALUES (1, 8000);
INSERT INTO `sys_role_menu` VALUES (1, 8001);
INSERT INTO `sys_role_menu` VALUES (1, 9000);
INSERT INTO `sys_role_menu` VALUES (1, 9001);
INSERT INTO `sys_role_menu` VALUES (1, 9002);
INSERT INTO `sys_role_menu` VALUES (1, 9003);
INSERT INTO `sys_role_menu` VALUES (1, 9004);
INSERT INTO `sys_role_menu` VALUES (1, 9005);
INSERT INTO `sys_role_menu` VALUES (1, 9006);
INSERT INTO `sys_role_menu` VALUES (1, 10000);
INSERT INTO `sys_role_menu` VALUES (1, 1523856257004974081);
INSERT INTO `sys_role_menu` VALUES (1, 1523857974106894337);
INSERT INTO `sys_role_menu` VALUES (1, 1523858058924109826);
INSERT INTO `sys_role_menu` VALUES (1, 1523858124837597186);
INSERT INTO `sys_role_menu` VALUES (1, 1523858176960212994);
INSERT INTO `sys_role_menu` VALUES (1, 1523858258711392257);
INSERT INTO `sys_role_menu` VALUES (1, 1523858595904073730);
INSERT INTO `sys_role_menu` VALUES (1, 1523860116775481345);
INSERT INTO `sys_role_menu` VALUES (1, 1523860264125575169);
INSERT INTO `sys_role_menu` VALUES (1, 1523860594825474050);
INSERT INTO `sys_role_menu` VALUES (1, 1523860685837676545);
INSERT INTO `sys_role_menu` VALUES (1, 1523860776644358145);
INSERT INTO `sys_role_menu` VALUES (1, 1523860857749614594);
INSERT INTO `sys_role_menu` VALUES (1, 1523861026629070850);
INSERT INTO `sys_role_menu` VALUES (1, 1523861104894783490);
INSERT INTO `sys_role_menu` VALUES (1, 1523861156593774593);
INSERT INTO `sys_role_menu` VALUES (1, 1523861250659430402);
INSERT INTO `sys_role_menu` VALUES (1, 1523861365965041665);
INSERT INTO `sys_role_menu` VALUES (1, 1523861420218363905);
INSERT INTO `sys_role_menu` VALUES (1, 1523861469379801089);
INSERT INTO `sys_role_menu` VALUES (1, 1523861550036267009);
INSERT INTO `sys_role_menu` VALUES (1, 1523861616042029057);
INSERT INTO `sys_role_menu` VALUES (1, 1523861661143379969);
INSERT INTO `sys_role_menu` VALUES (1, 1523996240631717889);
INSERT INTO `sys_role_menu` VALUES (1, 1523996526121213953);
INSERT INTO `sys_role_menu` VALUES (1, 1523996636880199681);
INSERT INTO `sys_role_menu` VALUES (1, 1524935269779726338);
INSERT INTO `sys_role_menu` VALUES (1, 1524935400595873794);
INSERT INTO `sys_role_menu` VALUES (1, 1524987317375451138);
INSERT INTO `sys_role_menu` VALUES (1, 1525028488730624001);
INSERT INTO `sys_role_menu` VALUES (1, 1526834931327528962);
INSERT INTO `sys_role_menu` VALUES (1, 1526835011442929665);
INSERT INTO `sys_role_menu` VALUES (1, 1526835258130919426);
INSERT INTO `sys_role_menu` VALUES (1, 1526835401999740929);
INSERT INTO `sys_role_menu` VALUES (1, 1526835450007744513);
INSERT INTO `sys_role_menu` VALUES (1, 1526835512255410178);
INSERT INTO `sys_role_menu` VALUES (1, 1527116612758007810);
INSERT INTO `sys_role_menu` VALUES (1, 1527119608363479041);
INSERT INTO `sys_role_menu` VALUES (1, 1527119649815785474);
INSERT INTO `sys_role_menu` VALUES (1, 1527123892709060609);
INSERT INTO `sys_role_menu` VALUES (1, 1527124077694644225);
INSERT INTO `sys_role_menu` VALUES (1, 1527124140277854209);
INSERT INTO `sys_role_menu` VALUES (1, 1527168543127891969);
INSERT INTO `sys_role_menu` VALUES (1, 1527176968188588034);
INSERT INTO `sys_role_menu` VALUES (1, 1527177010534281217);
INSERT INTO `sys_role_menu` VALUES (1, 1527177133301559298);
INSERT INTO `sys_role_menu` VALUES (1, 1527177552761319426);
INSERT INTO `sys_role_menu` VALUES (1, 1527178190329081858);

-- ----------------------------
-- Table structure for sys_route_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_route_conf`;
CREATE TABLE `sys_route_conf`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `route_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `predicates` json NULL COMMENT '断言',
  `filters` json NULL COMMENT '过滤器',
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort_order` int(11) NULL DEFAULT 0 COMMENT '排序',
  `metadata` json NULL COMMENT '路由元信息',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '修改人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '路由配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_route_conf
-- ----------------------------
INSERT INTO `sys_route_conf` VALUES (1, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (2, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (3, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (4, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (5, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (6, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (7, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (8, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 100, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (9, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (10, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (11, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, NULL, ' ', ' ', '2019-10-16 16:44:41', '2022-05-09 17:12:09', '1');
INSERT INTO `sys_route_conf` VALUES (1523591647324655618, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648138350594, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648230625282, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648272568322, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648280956929, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648289345537, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648297734145, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648331288577, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648377425921, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648390008833, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591648431951874, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-09 17:12:10', '2022-05-09 17:13:28', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976392970242, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976518799362, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976518799363, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976518799364, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976518799365, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976518799366, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976518799367, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976585908226, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976594296833, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976653017090, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523591976661405698, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-09 17:13:28', '2022-05-09 20:24:05', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949718044674, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949860651010, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949860651011, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949927759873, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949936148482, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949952925698, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949961314305, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949969702913, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949969702914, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949978091522, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949982285825, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639949982285826, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-09 20:24:06', '2022-05-09 20:24:07', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956584120322, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956592508930, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956592508931, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423490, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423491, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423492, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423493, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423494, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423495, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423496, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956655423497, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523639956709949442, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-09 20:24:07', '2022-05-09 20:24:51', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141376765953, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141385154561, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141393543169, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141393543170, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141393543171, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141401931778, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141401931779, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141401931780, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141401931781, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141401931782, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141401931783, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523640141401931784, '行政宣传', 'admin-xzxc', '[{\"args\": {\"_genkey_0\": \"/xzxc/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-xzxc', 0, '{}', ' ', ' ', '2022-05-09 20:24:51', '2022-05-10 09:48:12', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317189496833, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297473, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297474, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297475, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297476, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297477, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297478, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297479, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297480, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297481, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297482, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523842317336297483, '行政宣传', 'admin-xc', '[{\"args\": {\"_genkey_0\": \"/xc/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-xc', 0, '{}', ' ', ' ', '2022-05-10 09:48:12', '2022-05-10 11:13:04', '1');
INSERT INTO `sys_route_conf` VALUES (1523863670894473217, '工作流管理模块', 'admin-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861825, '认证中心', 'admin-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://admin-auth', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861826, '代码生成模块', 'admin-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-codegen', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861827, 'elastic-job定时任务模块', 'admin-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-elastic-job', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861828, 'quartz定时任务模块', 'admin-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-daemon-quartz', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861829, '分布式事务模块', 'admin-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-tx-manager', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861830, '通用权限模块', 'admin-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://admin-upms-biz', 0, '{\"response-timeout\": \"30000\"}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861831, '工作流长链接支持', 'admin-oa-platform-ws', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://admin-oa-platform', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861832, '微信公众号管理', 'admin-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-mp-platform', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861833, '支付管理', 'admin-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-pay-platform', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861834, '监控管理', 'admin-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-monitor', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');
INSERT INTO `sys_route_conf` VALUES (1523863670902861835, '行政宣传', 'admin-xc-biz', '[{\"args\": {\"_genkey_0\": \"/xc/**\"}, \"name\": \"Path\"}]', '[]', 'lb://admin-xc-biz', 0, '{}', ' ', ' ', '2022-05-10 11:13:04', NULL, '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '主键ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '修改人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `lock_flag` int(1) NULL DEFAULT 0,
  `del_flag` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_idx1_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', NULL, 1, ' ', ' ', '2018-04-20 07:15:18', '2023-11-13 20:57:54', 0, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
