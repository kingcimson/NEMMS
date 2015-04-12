/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : nemms

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2015-01-05 17:40:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志标识',
  `source` varchar(100) NOT NULL COMMENT '日志来源',
  `user_id` int(11) NOT NULL COMMENT '操作用户id',
  `account` varchar(50) NOT NULL COMMENT '操作用户账号',
  `level` varchar(10) NOT NULL COMMENT '日志级别',
  `message` text NOT NULL COMMENT '日志信息',
  `url` varchar(255) NOT NULL COMMENT 'url',
  `create_time` datetime NOT NULL COMMENT '日志发生的时间',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

-- ----------------------------
-- Records of event
-- ----------------------------

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统模块标识',
  `parent_id` int(11) NOT NULL COMMENT '系统模块父标识',
  `name` varchar(50) NOT NULL COMMENT '系统模块父标识',
  `code` varchar(50) NOT NULL COMMENT '系统模块代号',
  `icon` varchar(100) NOT NULL COMMENT '系统模块显示图标',
  `url` varchar(100) NOT NULL COMMENT '系统模块对应的页面地址',
  `path` varchar(200) NOT NULL COMMENT '从根模块到当前子模块的id路径，id之间用逗号分隔',
  `has_child` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否存在子模块,0否,1 是',
  `link_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'URL链接类型(0表示系统内部，1表示外部链接，默认 0)',
  `target` varchar(20) NOT NULL COMMENT 'URL链接的target(_blank,_top等)',
  `params` varchar(200) NOT NULL COMMENT 'URL链接参数',
  `sequence` int(11) NOT NULL COMMENT '系统模块在当前父模块下的排序顺序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '系统模块的状态,1表示启用,0表示禁用,默认为1,其他保留',
  `comment` varchar(50) NOT NULL COMMENT '系统模块备注',
  `create_time` datetime NOT NULL COMMENT '系统模块记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统模块记录更新时间戳',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `uk_module_parent_id_name` (`parent_id`,`name`),
  UNIQUE KEY `uk_module_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('2', '0', '仪表盘', 'dashboard', 'fa fa-lg fa-fw fa-compass', 'dashboard/index', '2', '\0', '0', '', '', '1', '1', '仪表盘', '2014-10-30 14:41:01', '2014-10-30 14:40:03');
INSERT INTO `module` VALUES ('6', '0', '报表管理', 'reporting', 'fa fa-lg fa-fw fa-bar-chart-o', 'report/designer', '6', '', '0', '', '', '5', '1', '报表管理', '2014-10-30 14:44:09', '2014-10-30 14:43:11');
INSERT INTO `module` VALUES ('7', '0', '用户权限', 'memberships', 'fa fa-lg fa-fw fa-user', 'membership/user', '7', '', '0', '', '', '6', '1', '用户权限', '2014-10-30 14:45:47', '2014-10-30 14:44:50');
INSERT INTO `module` VALUES ('21', '6', '报表设计器', 'reporting.designer', '', 'report/designer', '6,21', '\0', '0', '', '', '1', '1', '报表设计器', '2014-10-30 15:37:12', '2014-10-30 15:36:15');
INSERT INTO `module` VALUES ('22', '6', '报表配置', 'reporting.config', '', 'report/config', '6,22', '\0', '0', '', '', '3', '1', '报表配置', '2014-10-30 15:37:57', '2014-10-30 15:37:00');
INSERT INTO `module` VALUES ('23', '7', '用户管理', 'membership.user', '', 'membership/user', '7,23', '\0', '0', '', '', '1', '1', '用户管理', '2014-10-30 15:38:22', '2014-10-30 15:37:24');
INSERT INTO `module` VALUES ('24', '7', '角色管理', 'memberships.role', '', 'membership/role', '7,24', '\0', '0', '', '', '2', '1', '角色管理', '2014-10-30 15:38:44', '2014-10-30 15:37:46');
INSERT INTO `module` VALUES ('25', '7', '操作管理', 'memberships.opt', '', 'membership/operation', '7,25', '\0', '0', '', '', '3', '1', '操作管理', '2014-10-30 15:39:03', '2014-10-30 15:38:05');
INSERT INTO `module` VALUES ('26', '7', '用户日志', 'memberships.event', '', 'membership/event', '7,26', '\0', '0', '', '', '5', '1', '用户日志', '2014-10-30 15:41:06', '2014-10-30 15:40:08');
INSERT INTO `module` VALUES ('28', '6', '数据源管理', 'reporting.ds', '', 'report/ds', '6,28', '\0', '0', '', '', '2', '1', '数据源管理', '2014-10-30 15:45:19', '2014-10-30 15:44:22');
INSERT INTO `module` VALUES ('31', '7', '模块管理', 'memberships.module', '', 'membership/module', '7,31', '\0', '0', '', '', '4', '1', '模块管理', '2014-10-31 10:21:46', '2014-10-31 10:20:49');
INSERT INTO `module` VALUES ('32', '0', '系统管理', 'system', 'fa fa-lg fa-fw fa-cog', 'system/config', '32', '', '0', '', '', '7', '1', '系统管理', '2014-11-12 12:20:57', '2014-11-12 12:20:57');
INSERT INTO `module` VALUES ('38', '32', '配置管理', 'system.config', 'fa fa-lg fa-fw fa-cog', 'system/config', '32,38', '\0', '0', '', '', '1', '1', '配置管理', '2014-11-27 15:27:51', '2014-11-27 15:27:51');
INSERT INTO `module` VALUES ('41', '32', '国家字典', 'system.country', 'fa fa-lg fa-fw fa-cog', 'system/country', '32,41', '\0', '0', '', '', '4', '1', '国家字典', '2014-11-28 17:20:06', '2014-11-28 17:20:06');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `operation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统操作标识',
  `module_id` int(11) NOT NULL COMMENT '系统模块标识',
  `name` varchar(50) NOT NULL COMMENT '系统操作名称',
  `code` varchar(50) NOT NULL COMMENT '系统操作唯一代号',
  `sequence` int(11) NOT NULL COMMENT '系统操作的排序顺序',
  `comment` varchar(50) NOT NULL COMMENT '系统操作备注',
  `create_time` datetime NOT NULL COMMENT '系统操作记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统操作记录更新时间戳',
  PRIMARY KEY (`operation_id`),
  UNIQUE KEY `uk_operation_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='系统操作表';

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('2', '23', '删除用户', 'memberships.user:delete', '2', '删除', '2014-10-30 16:25:52', '2014-10-30 16:24:54');
INSERT INTO `operation` VALUES ('4', '23', '编辑用户', 'memberships.user:update', '3', '编辑', '2014-10-30 21:02:37', '2014-10-30 21:01:39');
INSERT INTO `operation` VALUES ('5', '23', '查看用户', 'memberships.user:view', '4', '查看', '2014-10-30 21:08:23', '2014-10-30 21:07:25');
INSERT INTO `operation` VALUES ('6', '24', '添加角色', 'memberships.role:create', '5', '添加', '2014-10-31 10:13:48', '2014-10-31 10:12:52');
INSERT INTO `operation` VALUES ('7', '24', '删除角色', 'memberships.role:delete', '4', '删除', '2014-10-31 10:15:43', '2014-10-31 10:14:47');
INSERT INTO `operation` VALUES ('8', '24', '编辑角色', 'memberships.role:update', '3', '编辑', '2014-10-31 10:16:07', '2014-10-31 10:15:10');
INSERT INTO `operation` VALUES ('9', '24', '查看角色', 'memberships.role:view', '2', '查看', '2014-10-31 10:16:21', '2014-10-31 10:15:25');
INSERT INTO `operation` VALUES ('10', '25', '管理', 'memberships.opt:*', '1', '管理操作管理', '2014-10-31 10:24:04', '2014-10-31 10:23:08');
INSERT INTO `operation` VALUES ('14', '31', '管理', 'memberships.module:*', '1', '管理系统模块', '2014-10-31 10:28:43', '2014-10-31 10:27:46');
INSERT INTO `operation` VALUES ('15', '31', '编辑模块', 'memberships.module.edit', '2', '编辑', '2014-10-31 10:29:17', '2014-10-31 10:28:20');
INSERT INTO `operation` VALUES ('16', '31', '删除模块', 'memberships.module.remove', '3', '删除', '2014-10-31 10:29:38', '2014-10-31 10:28:42');
INSERT INTO `operation` VALUES ('18', '26', '查看日志', 'memberships.event:view', '1', '查看', '2014-10-31 10:31:08', '2014-10-31 10:30:11');
INSERT INTO `operation` VALUES ('20', '23', '添加用户', 'memberships.user:create', '1', '添加', '2014-10-31 18:29:22', '2014-10-31 18:28:26');
INSERT INTO `operation` VALUES ('21', '2', '查看', 'dashboard:view', '1', '查看仪表盘图表', '2014-11-12 11:01:11', '2014-11-12 11:01:11');
INSERT INTO `operation` VALUES ('22', '8', '查询', 'userAnalyz.tag:query', '1', '查询人群标签验证', '2014-11-12 11:05:25', '2014-11-12 11:05:25');
INSERT INTO `operation` VALUES ('23', '9', '查询', 'userAnalyz.click:query', '1', '查询用户点击行为分析', '2014-11-12 11:06:11', '2014-11-12 11:06:11');
INSERT INTO `operation` VALUES ('24', '10', '查询', 'userAnalyz.query:query', '1', '查询批量查询用户', '2014-11-12 11:07:11', '2014-11-12 11:07:11');
INSERT INTO `operation` VALUES ('25', '10', '导出', 'userAnalyz.query:export', '1', '导出批量查询结果', '2014-11-12 11:08:11', '2014-11-12 11:08:11');
INSERT INTO `operation` VALUES ('26', '11', '查看', 'userAnalyz.gpTag:view', '1', '查看GP标签平均值报表', '2014-11-12 11:09:04', '2014-11-12 11:09:04');
INSERT INTO `operation` VALUES ('27', '11', '查询', 'userAnalyz.gpTag:query', '2', '查询GP标签平均值报表', '2014-11-12 11:11:52', '2014-11-12 11:11:52');
INSERT INTO `operation` VALUES ('28', '16', '查询', 'predictMaster.predict:query', '1', '查询预估大师', '2014-11-12 11:14:16', '2014-11-12 11:14:16');
INSERT INTO `operation` VALUES ('29', '17', '查询', 'predictMaster.expert:query', '1', '查询预估大师专业版报表', '2014-11-12 11:14:53', '2014-11-12 11:14:53');
INSERT INTO `operation` VALUES ('30', '17', '查看', 'predictMaster.expert:view', '2', '查看预估大师专业版报表', '2014-11-12 11:15:08', '2014-11-12 11:15:08');
INSERT INTO `operation` VALUES ('31', '18', '管理', 'predictMaster.app:*', '1', '管理预估App', '2014-11-12 11:16:34', '2014-11-12 11:16:34');
INSERT INTO `operation` VALUES ('32', '20', '查看', 'predictMaster.expData:view', '1', '查看实验数据报表', '2014-11-12 11:17:08', '2014-11-12 11:17:08');
INSERT INTO `operation` VALUES ('33', '20', '查询', 'predictMaster.expData:query', '2', '查询实验数据报表', '2014-11-12 11:17:23', '2014-11-12 11:17:23');
INSERT INTO `operation` VALUES ('34', '21', '管理', 'reporting.designer:*', '2', '报表设计器管理', '2014-11-12 11:19:36', '2014-11-12 11:19:36');
INSERT INTO `operation` VALUES ('35', '28', '管理', 'reporting.ds:*', '1', '数据源管理', '2014-11-12 11:24:26', '2014-11-12 11:24:26');
INSERT INTO `operation` VALUES ('36', '22', '管理', 'reporting.config:*', '1', '报表配置', '2014-11-12 11:24:42', '2014-11-12 11:24:42');
INSERT INTO `operation` VALUES ('37', '23', '管理', 'membership.user:*', '1', '用户管理', '2014-11-12 11:26:41', '2014-11-12 11:26:41');
INSERT INTO `operation` VALUES ('38', '24', '管理', 'memberships.role:*', '1', '角色管理', '2014-11-12 11:27:49', '2014-11-12 11:27:49');
INSERT INTO `operation` VALUES ('41', '12', '管理', 'tagFactory.userFilter:*', '1', '所有权限', '2014-11-15 13:00:01', '2014-11-15 12:59:59');
INSERT INTO `operation` VALUES ('42', '13', '管理', 'tagFactory.history:*', '1', '所有权限', '2014-11-15 13:00:10', '2014-11-15 13:00:08');
INSERT INTO `operation` VALUES ('43', '14', '管理', 'tagFactory.fixedTag:*', '1', '所有权限', '2014-11-15 13:00:14', '2014-11-15 13:00:13');
INSERT INTO `operation` VALUES ('44', '15', '管理', 'tagFactory.tagMgr:*', '1', '所有权限', '2014-11-15 13:00:18', '2014-11-15 13:00:16');
INSERT INTO `operation` VALUES ('48', '37', '管理', 'tagFactory.expTagMgr:*', '1', '实验标签管理', '2014-11-26 10:26:56', '2014-11-26 10:26:54');
INSERT INTO `operation` VALUES ('49', '37', '增加', 'tagFactory.expTagMgr:create', '2', '增加实验标签', '2014-11-26 10:27:28', '2014-11-26 10:27:26');
INSERT INTO `operation` VALUES ('50', '37', '删除', 'tagFactory.expTagMgr:delete', '3', '删除实验标签', '2014-11-26 10:27:53', '2014-11-26 10:27:51');
INSERT INTO `operation` VALUES ('51', '37', '修改', 'tagFactory.expTagMgr:update', '4', '修改实验标签', '2014-11-26 10:28:23', '2014-11-26 10:28:21');
INSERT INTO `operation` VALUES ('52', '37', '查看', 'tagFactory.expTagMgr:view', '5', '查看实验标签', '2014-11-26 10:29:08', '2014-11-26 10:29:06');
INSERT INTO `operation` VALUES ('53', '38', '管理', 'system.config:*', '1', '管理所有', '2014-11-27 15:44:33', '2014-11-27 15:44:33');
INSERT INTO `operation` VALUES ('54', '38', '增加', 'system.config:create', '2', '增加', '2014-11-27 15:44:51', '2014-11-27 15:44:51');
INSERT INTO `operation` VALUES ('55', '38', '删除', 'system.config:delete', '3', '删除', '2014-11-27 15:45:02', '2014-11-27 15:45:02');
INSERT INTO `operation` VALUES ('56', '38', '修改', 'system.config:update', '4', '修改', '2014-11-27 15:46:01', '2014-11-27 15:46:01');
INSERT INTO `operation` VALUES ('57', '38', '查看', 'system.config:view', '5', '查看', '2014-11-27 15:46:09', '2014-11-27 15:46:09');
INSERT INTO `operation` VALUES ('58', '26', '日志管理', 'memberships.event:*', '2', '日志管理', '2014-11-27 15:51:02', '2014-11-27 15:51:04');
INSERT INTO `operation` VALUES ('59', '39', '管理', 'system.AppPosid:*', '1', 'AppPosid字典管理', '2014-11-29 10:23:36', '2014-11-29 10:23:42');
INSERT INTO `operation` VALUES ('60', '40', '管理', 'system.appMd:*', '1', 'App埋点字典管理', '2014-11-29 10:23:48', '2014-11-29 10:23:53');
INSERT INTO `operation` VALUES ('61', '41', '管理', 'system.country:*', '1', '国家字典管理', '2014-11-29 10:23:54', '2014-11-29 10:24:00');
INSERT INTO `operation` VALUES ('62', '42', '管理', 'system.dictActiveMd:*', '1', '标签埋点字典管理', '2014-11-29 10:24:01', '2014-11-29 10:24:07');
INSERT INTO `operation` VALUES ('63', '43', '管理', 'system.dictAndroidOs:*', '1', 'Android操作系统字典管理', '2014-11-29 10:24:08', '2014-11-29 10:24:13');
INSERT INTO `operation` VALUES ('64', '44', '管理', 'system.dictDateRange:*', '1', '标签时间范围字典管理', '2014-11-29 10:24:14', '2014-11-29 10:24:19');
INSERT INTO `operation` VALUES ('65', '45', '管理', 'system.dictDiffDegree:*', '1', '标签区分度字典管理', '2014-11-29 10:24:20', '2014-11-29 10:24:26');
INSERT INTO `operation` VALUES ('66', '46', '管理', 'system.dictGender:*', '1', '标签性别字典管理', '2014-11-29 10:24:26', '2014-11-29 10:24:32');
INSERT INTO `operation` VALUES ('67', '47', '管理', 'system.dictInsNum:*', '1', '标签安装数字典管理', '2014-11-29 10:24:41', '2014-11-29 10:24:47');
INSERT INTO `operation` VALUES ('68', '48', '管理', 'system.dictMcc:*', '1', '运营商MCC字典管理', '2014-11-29 10:24:48', '2014-11-29 10:24:53');
INSERT INTO `operation` VALUES ('69', '49', '管理', 'system.dictPhoneModel:*', '1', '手机机型字典管理', '2014-11-29 10:24:53', '2014-11-29 10:24:58');
INSERT INTO `operation` VALUES ('70', '50', '管理', 'system.dictPosid:*', '1', '标签Posid字典管理', '2014-11-29 10:24:59', '2014-11-29 10:25:04');
INSERT INTO `operation` VALUES ('71', '51', '管理', 'system.DictProductPosid:*', '1', '所有权限', '2014-12-11 15:36:59', '2014-12-11 15:36:59');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统角色标识',
  `modules` varchar(1000) NOT NULL COMMENT '系统角色所拥有的模块集合(module_id以英文逗号分隔)',
  `operations` varchar(1000) NOT NULL COMMENT '系统角色所拥有的操作集合(operation_id以英文逗号分隔)',
  `name` varchar(50) NOT NULL COMMENT '系统角色名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '系统角色英语名',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统角色,1表示是，0表示否,默认为0',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '系统角色的状态,1表示启用,0表示禁用,默认为1,其他保留',
  `sequence` int(11) NOT NULL COMMENT '系统角色的排序顺序',
  `comment` varchar(50) NOT NULL COMMENT '系统角色备注',
  `create_user` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '系统角色记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统角色记录更新时间戳',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uk_role_name` (`name`),
  UNIQUE KEY `uk_role_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('4', '2,3,8,9,10,11,4,12,13,14,15,37,5,16,17,18,20,6,21,28,22,7,23,24,25,31,26,32,38,39,40,41,42,43,44,45,46,47,48,49,50,51', '21,22,23,25,24,26,27,41,42,43,44,48,49,50,51,52,28,29,30,31,32,33,34,35,36,37,20,2,4,5,38,9,8,7,6,10,14,15,16,18,53,54,55,56,57,59,60,61,62,63,64,65,66,67,68,69,70,71,', '超级管理员', 'superAdmin', '1', '1', '1', '管理员', 'admin', '2014-10-31 14:38:09', '2014-10-31 14:37:13');
INSERT INTO `role` VALUES ('19', '2,3,8,9,10,11,5,16,17,18,20,32', '21,22,23,24,25,26,27,28,29,30,31,32,33,40,', '产品运营人员', 'product', '0', '1', '3', '产品运营管理员', 'admin', '2014-11-13 19:03:20', '2014-11-13 19:03:20');
INSERT INTO `role` VALUES ('22', '2,3,8,9,10,11,4,12,13,14,15,5,16,17,18,20,6,21,22,7,23,24,26,32', '21,22,23,24,25,26,27,41,42,43,44,28,29,30,31,32,33,34,36,20,37,2,4,5,38,9,8,7,6,18,39,40,', '产品管理员', 'productAdmin', '1', '1', '2', '系统管理员，权限仅次于超级管理员', 'admin', '2014-11-15 12:56:56', '2014-11-15 12:56:54');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统用户标识',
  `roles` varchar(500) NOT NULL COMMENT '系统用户所属角色集合(role_id以英文逗号分隔)',
  `account` varchar(64) NOT NULL COMMENT '系统用户账号',
  `password` varchar(64) NOT NULL COMMENT '系统用户密码',
  `salt` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '系统用户姓名',
  `email` varchar(64) NOT NULL COMMENT '系统用户电子邮箱',
  `telephone` varchar(36) NOT NULL COMMENT '系统用户用户电话号码,多个用英文逗号分开',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '系统用户的状态,1表示启用,0表示禁用,默认为1,其他保留',
  `comment` varchar(50) NOT NULL COMMENT '系统用户备注',
  `create_time` datetime NOT NULL COMMENT '系统用户记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统用户记录更新时间戳',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_user_account` (`account`),
  UNIQUE KEY `uk_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '4', 'admin', '67f55a5a7b659f0ef73f4f9d2339f14e', '110a4979493fbf5a8fd35de1a3b4ebfa', 'Tom Deng', '14068728@qq.com', '123456789', '1', '', '2015-01-05 17:38:50', '2015-01-05 17:38:50');
