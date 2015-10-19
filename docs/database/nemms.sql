/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : nemms

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2015-10-19 21:39:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for au_alarm_type
-- ----------------------------
DROP TABLE IF EXISTS `au_alarm_type`;
CREATE TABLE `au_alarm_type` (
  `alarm_type_id` varchar(32) DEFAULT NULL,
  `alarm_name_ch` varchar(32) DEFAULT NULL,
  `alarm_type` varchar(32) DEFAULT NULL,
  `alarm_level` varchar(32) DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of au_alarm_type
-- ----------------------------
INSERT INTO `au_alarm_type` VALUES ('0x00000301', '电源掉电告警', 'Equipment Alarm', 'Critical', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000302', '电源故障告警', 'Equipment Alarm', 'Critical', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000304', '监控模块电池故障告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000305', '位置告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000308', '其它模块告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000309', '本振失锁告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x0000030E', '光收发模块故障告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x0000030F', '主从监控链路告警', 'Communications Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000320', '外部告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000321', '外部告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000322', '外部告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000323', '外部告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000324', '外部告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000325', '外部告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000328', '门禁告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000372', 'TD-SCDMA失步告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x0000005C', '光收发故障告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x0000005D', '光收发故障告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x0000005E', '光收发故障告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x0000005F', '光收发故障告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000060', '光收发故障告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000061', '光收发故障告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000062', '光收发故障告警7', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000063', '光收发故障告警8', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000075', '设备过温告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `au_alarm_type` VALUES ('0x00000373', 'TD-LTE失步告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');

-- ----------------------------
-- Table structure for au_pm_parameter_name
-- ----------------------------
DROP TABLE IF EXISTS `au_pm_parameter_name`;
CREATE TABLE `au_pm_parameter_name` (
  `parameter_id` varchar(32) DEFAULT NULL,
  `parameter_name_ch` varchar(32) DEFAULT NULL,
  `parameter_name_en` varchar(32) DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of au_pm_parameter_name
-- ----------------------------
INSERT INTO `au_pm_parameter_name` VALUES ('0x08007001', 'TD-LTE1下行输入导频功率电平', '', '有符号1字节');
INSERT INTO `au_pm_parameter_name` VALUES ('0x08008001', 'TD-LTE2下行输入导频功率电平', '', '有符号1字节');
INSERT INTO `au_pm_parameter_name` VALUES ('0x08007010', 'TD-LTE1系统最大下行链路时延', '', '无符号4字节');

-- ----------------------------
-- Table structure for config_dict
-- ----------------------------
DROP TABLE IF EXISTS `config_dict`;
CREATE TABLE `config_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置字典ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `key` varchar(50) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `sequence` int(11) NOT NULL COMMENT '节点在其父节点中的顺序',
  `comment` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_pid_key` (`pid`,`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='配置字典表';

-- ----------------------------
-- Records of config_dict
-- ----------------------------
INSERT INTO `config_dict` VALUES ('46', '0', '设备参数', 'deviceParam', 'deviceParam', '1', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('47', '0', '监控参数', 'monitorParam', 'monitorParam', '2', '', '2015-05-09 15:43:14', '2015-05-09 15:43:14');
INSERT INTO `config_dict` VALUES ('48', '46', '参数类别', 'deviceParamCategory', 'deviceParamCategory', '1', '', '2015-05-09 16:17:23', '2015-05-09 16:17:23');
INSERT INTO `config_dict` VALUES ('49', '46', '数值类型', 'deviceParamValueType', 'deviceParamValueType', '2', '', '2015-05-09 16:21:03', '2015-05-09 16:21:03');
INSERT INTO `config_dict` VALUES ('50', '46', '参数模式', 'deviceParamMode', 'deviceParamMode', '3', '', '2015-05-09 16:21:59', '2015-05-09 16:21:59');
INSERT INTO `config_dict` VALUES ('51', '46', '告警级别', 'deviceParamWarnLevel', 'deviceParamWarnLevel', '4', '', '2015-05-09 16:23:09', '2015-05-09 16:23:09');
INSERT INTO `config_dict` VALUES ('52', '0', '设备类型', 'deviceType', 'deviceType', '3', '', '2015-05-09 16:28:58', '2015-05-09 16:28:58');
INSERT INTO `config_dict` VALUES ('53', '48', '设备', 'device', '0', '1', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('54', '48', '网管', 'netmgr', '1', '2', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('55', '48', '告警', 'warning', '2', '3', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('56', '48', '使能', 'enabled', '3', '4', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('57', '48', '设置', 'settings', '4', '5', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('58', '48', '性能', 'performance', '5', '6', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('59', '48', '自定义', 'custom', '6', '7', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('60', '52', '主单元', '10', '1', '1', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('61', '52', '扩展单元', '20', '2', '2', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('62', '52', '主单元模块', '21', '2', '3', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('63', '52', '主单元远端', '22', '2', '4', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('64', '52', '扩展单元远端', '30', '3', '5', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('65', '52', '扩展单元模块', '31', '3', '6', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('66', '52', '远端单元模块', '40', '4', '7', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('67', '50', '读写', 'readwrite', 'rw', '1', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('68', '50', '只读', 'read', 'ro', '2', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('69', '50', '告警', 'warning', 'rn', '3', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('70', '51', '正常状态', 'normal', '0', '1', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('71', '51', '一般告警', 'general', '1', '2', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('72', '51', '重要告警', 'important', '2', '3', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('73', '51', '严重告警', 'fault', '3', '3', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('74', '51', '告警确认', 'confirm', '9', '3', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('75', '49', '字符串', 'str', 'str', '1', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('76', '49', 'bit型', 'bit', 'bit', '2', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('77', '49', '1字节有符号整数', 'sint1', 'sint1', '3', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('78', '49', '1字节无符号整数', 'uint1', 'uint1', '4', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('79', '49', '2字节有符号整数', 'sint2', 'sint2', '5', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('80', '49', '2字节无符号整数', 'uint2', 'uint2', '6', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('81', '49', '3字节无符号整数', 'uint3', 'uint3', '7', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('82', '49', '4字节无符号整数', 'uint4', 'uint4', '8', '', '2015-05-09 15:42:36', '2015-05-09 15:42:36');
INSERT INTO `config_dict` VALUES ('83', '47', 'AP协议类型', 'apProtocol', 'apProtocol', '1', 'AP协议类型', '2015-06-28 06:30:07', '2015-06-28 06:30:07');
INSERT INTO `config_dict` VALUES ('84', '47', 'MCP协议类型', 'mcpProtocol', 'mcpProtocol', '2', 'MCP协议类型', '2015-06-28 06:31:43', '2015-06-28 06:31:43');
INSERT INTO `config_dict` VALUES ('85', '47', '通讯协议类型', 'protocol', 'protocol', '3', '通讯协议类型', '2015-06-28 06:32:09', '2015-06-28 06:32:09');
INSERT INTO `config_dict` VALUES ('86', '83', 'AP_A', 'AP_A', '1', '3', 'AP_A', '2015-06-28 06:33:04', '2015-06-28 06:33:04');
INSERT INTO `config_dict` VALUES ('87', '83', 'AP_B', 'AP_B', '2', '2', 'AP_B', '2015-06-28 06:33:22', '2015-06-28 06:33:22');
INSERT INTO `config_dict` VALUES ('88', '83', 'AP_C', 'AP_C', '3', '3', 'AP_C', '2015-06-28 06:33:41', '2015-06-28 06:33:41');
INSERT INTO `config_dict` VALUES ('89', '84', 'MCP_A', 'MCP_A', '1', '1', 'MCP_A', '2015-06-28 06:34:17', '2015-06-28 06:34:17');
INSERT INTO `config_dict` VALUES ('90', '84', 'MCP_B', 'MCP_B', '2', '2', 'MCP_B', '2015-06-28 06:34:32', '2015-06-28 06:34:32');
INSERT INTO `config_dict` VALUES ('91', '84', 'MCP_C', 'MCP_C', '3', '3', 'MCP_C', '2015-06-28 06:34:49', '2015-06-28 06:34:49');
INSERT INTO `config_dict` VALUES ('92', '85', 'TCP/IP', 'TCP_IP', '1', '1', 'TCP/IP', '2015-06-28 06:37:57', '2015-06-28 06:37:57');
INSERT INTO `config_dict` VALUES ('93', '85', 'UDP', 'UDP', '2', '2', 'UDP', '2015-06-28 06:38:11', '2015-06-28 06:38:11');
INSERT INTO `config_dict` VALUES ('94', '85', 'SMS', 'SMS', '3', '3', 'SMS', '2015-06-28 15:50:29', '2015-06-28 15:50:29');
INSERT INTO `config_dict` VALUES ('95', '85', 'GPRS', 'GPRS', '4', '4', 'GPRS', '2015-06-28 15:50:51', '2015-06-28 15:50:51');
INSERT INTO `config_dict` VALUES ('96', '85', 'RS232', 'RS232', '5', '5', 'RS232', '2015-06-28 15:51:21', '2015-06-28 15:51:21');
INSERT INTO `config_dict` VALUES ('97', '0', '参数选项', 'paramOption', 'paramOption', '4', '设备参数的选项', '2015-07-19 11:28:49', '2015-07-19 11:28:49');
INSERT INTO `config_dict` VALUES ('98', '97', '无选项', 'paramOptionNone', 'paramOptionNone', '1', '无选项', '2015-07-19 12:19:23', '2015-07-19 12:19:23');
INSERT INTO `config_dict` VALUES ('99', '98', '无', 'paramOptionNone0', '0', '10', '', '2015-08-22 13:39:19', '2015-08-22 13:39:19');
INSERT INTO `config_dict` VALUES ('100', '97', '远程数据通信模块', 'paramOption1', 'paramOption1', '11', '', '2015-08-22 13:40:24', '2015-08-22 13:40:24');
INSERT INTO `config_dict` VALUES ('101', '100', 'GSM MODEM', 'paramOption1-0', '0', '10', '', '2015-08-22 13:41:11', '2015-08-22 13:41:11');
INSERT INTO `config_dict` VALUES ('102', '100', 'TD-SCDMA MODEM', 'paramOption1-1', '1', '9', '', '2015-08-22 13:41:56', '2015-08-22 13:41:56');
INSERT INTO `config_dict` VALUES ('103', '100', 'TD-SCDMA/GSM 双MODEM', 'paramOption1-2', '2', '8', '', '2015-08-22 14:09:19', '2015-08-22 14:09:19');
INSERT INTO `config_dict` VALUES ('104', '100', 'WCDMA MODEM', 'paramOption1-3', '3', '7', '', '2015-08-22 14:09:49', '2015-08-22 14:09:49');
INSERT INTO `config_dict` VALUES ('105', '100', 'WCDMA/GSM MODEM', 'paramOption1-4', '4', '6', '', '2015-08-22 14:10:21', '2015-08-22 14:10:21');
INSERT INTO `config_dict` VALUES ('106', '100', '802.3网卡', 'paramOption1-5', '5', '5', '', '2015-08-22 14:11:30', '2015-08-22 14:11:30');
INSERT INTO `config_dict` VALUES ('107', '100', 'ADSL MODEM', 'paramOption1-6', '6', '4', '', '2015-08-22 14:11:54', '2015-08-22 14:11:54');
INSERT INTO `config_dict` VALUES ('108', '100', 'LTE MODEM', 'paramOption1-7', '7', '3', '', '2015-08-22 14:12:15', '2015-08-22 14:12:15');
INSERT INTO `config_dict` VALUES ('109', '46', '显示格式', 'deviceParamFormat', 'deviceParamFormat', '5', '显示格式', '2015-09-09 01:26:12', '2015-09-09 01:26:12');
INSERT INTO `config_dict` VALUES ('110', '109', '默认', 'default', 'default', '1', '', '2015-09-09 01:27:52', '2015-09-09 01:27:52');
INSERT INTO `config_dict` VALUES ('111', '109', 'IP地址', 'ip', 'ip', '2', '', '2015-09-09 01:28:13', '2015-09-09 01:28:13');
INSERT INTO `config_dict` VALUES ('112', '109', '日期时间', 'dt', 'dt', '3', '', '2015-09-09 01:28:41', '2015-09-09 01:28:41');
INSERT INTO `config_dict` VALUES ('113', '49', '数字串', 'dstr', 'dstr', '9', '', '2015-09-09 01:37:24', '2015-09-09 01:37:24');

-- ----------------------------
-- Table structure for config_settings
-- ----------------------------
DROP TABLE IF EXISTS `config_settings`;
CREATE TABLE `config_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置字典ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `key` varchar(50) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `sequence` int(11) NOT NULL COMMENT '节点在其父节点中的顺序',
  `comment` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置字典表';

-- ----------------------------
-- Records of config_settings
-- ----------------------------
INSERT INTO `config_settings` VALUES ('2', 'WebSocket服务器IP', 'WebSocketIP', '192.168.10.99', '1', 'web端与通讯服务器连接的IP', '2015-08-29 11:04:31', '2015-08-29 11:04:31');
INSERT INTO `config_settings` VALUES ('3', 'WebSocket服务器端口', 'WebSocketPort', '9100', '2', 'WebSocket服务器连接端口', '2015-08-29 13:37:25', '2015-08-29 13:37:25');

-- ----------------------------
-- Table structure for device_conn_info
-- ----------------------------
DROP TABLE IF EXISTS `device_conn_info`;
CREATE TABLE `device_conn_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_uid` varchar(50) NOT NULL COMMENT '站点与设备唯一编号（十六进制)',
  `device_ip` varchar(50) NOT NULL COMMENT '客户端设备IP',
  `device_port` int(11) NOT NULL COMMENT '客户端设备IP端口',
  `server_ip` varchar(50) NOT NULL COMMENT '连接的服务器IP',
  `server_port` int(11) NOT NULL COMMENT '连接的服务器端口',
  `status` int(11) NOT NULL COMMENT '当前连接状态',
  `create_time` datetime NOT NULL COMMENT '建立连接时间',
  `update_time` datetime NOT NULL COMMENT '更新连接时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_site_uid` (`site_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=81777 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_conn_info
-- ----------------------------
INSERT INTO `device_conn_info` VALUES ('81775', '0x00000001', '192.168.10.69', '8020', '192.168.10.99', '8001', '1', '2015-10-19 11:00:24', '2015-10-19 11:00:24');
INSERT INTO `device_conn_info` VALUES ('81776', '0x00000003', '192.168.10.70', '8030', '192.168.10.99', '8000', '1', '2015-10-19 11:00:46', '2015-10-19 11:00:46');

-- ----------------------------
-- Table structure for device_data
-- ----------------------------
DROP TABLE IF EXISTS `device_data`;
CREATE TABLE `device_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_uid` varchar(50) NOT NULL,
  `param_uid` varchar(50) NOT NULL,
  `mcp_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL COMMENT '监控值',
  `create_time` datetime NOT NULL COMMENT '监控时间',
  `update_time` datetime NOT NULL COMMENT '监控更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_site_param_mcp` (`site_uid`,`param_uid`,`mcp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80041 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_data
-- ----------------------------

-- ----------------------------
-- Table structure for device_param
-- ----------------------------
DROP TABLE IF EXISTS `device_param`;
CREATE TABLE `device_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` varchar(32) NOT NULL COMMENT '设备参数标识(十六进制表示)',
  `mcp_id` int(11) NOT NULL COMMENT 'mcp协义类型1:mcp_a;2:mcp_b;3:mcp_c',
  `category_id` int(11) NOT NULL COMMENT '参数类别',
  `name` varchar(100) NOT NULL COMMENT '参数名称',
  `mode` varchar(5) NOT NULL COMMENT '读写属性',
  `unit` varchar(10) NOT NULL COMMENT '参数单位',
  `ratio` double NOT NULL COMMENT '传输比或系数',
  `value_type` varchar(20) NOT NULL COMMENT '参数值数据类型(uint等)',
  `value_len` int(11) NOT NULL COMMENT '参数值数据长度',
  `value_min_len` int(11) NOT NULL COMMENT '参数值数据最小长度',
  `value_max_len` int(11) NOT NULL COMMENT '参数值数据最大长度',
  `min_value` varchar(50) NOT NULL COMMENT '参数最小值',
  `max_value` varchar(50) NOT NULL COMMENT '参数最大值',
  `authority_roles` varchar(50) NOT NULL COMMENT '参数权限归属(即系统哪些角色的用户可以使用),对应角色id',
  `warn_level` varchar(20) NOT NULL COMMENT '参数告警级别',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `html_elem` varchar(10) NOT NULL COMMENT '参数html控件名称(text,select,radio等)',
  `html_elem_key` varchar(20) NOT NULL COMMENT '设备参数选项对应配置表(config_dict)中key值',
  `format` varchar(20) NOT NULL DEFAULT '' COMMENT '显示格式(default默认,ipIP地址,dt日期时间)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uid_mcp_id` (`uid`,`mcp_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_param
-- ----------------------------
INSERT INTO `device_param` VALUES ('1', '0x0000', '1', '0', '无效的对象代码', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-08-06 18:32:23', '2015-08-06 18:32:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2', '0x00000000', '3', '0', '无效的对象代码', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3', '0x0002', '1', '0', '设备厂商代码', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('4', '0x00000002', '3', '0', '设备厂商代码', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('5', '0x0003', '1', '0', '设备类别', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('6', '0x00000003', '3', '0', '设备类别', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '255', '4', '0', '2015-10-17 18:49:25', '2015-10-17 18:49:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('7', '0x0004', '1', '0', '设备型号', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('8', '0x00000004', '3', '0', '设备型号', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-09 08:17:19', '2015-10-09 08:17:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('9', '0x0005', '1', '0', '设备生产序列号', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('10', '0x00000005', '3', '0', '设备生产序列号', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('11', '0x0006', '1', '0', '设备实际载波总数', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('12', '0x00000006', '3', '0', '设备实际载波总数', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('13', '0x0007', '1', '0', '经度', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-08 16:40:51', '2015-10-08 16:40:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('14', '0x00000007', '3', '0', '经度', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 16:36:34', '2015-10-17 16:36:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('15', '0x0008', '1', '0', '纬度', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-08 16:51:54', '2015-10-08 16:51:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('16', '0x00000008', '3', '0', '纬度', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-08 16:52:09', '2015-10-08 16:52:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('17', '0x000A', '1', '0', '监控的当前版本信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('18', '0x0000000A', '3', '0', '监控的当前版本信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-09 08:15:03', '2015-10-09 08:15:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('19', '0x000B', '1', '0', '远程数据通信模块', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-08-22 16:59:27', '2015-08-22 16:59:27', 'select', 'paramOption1', 'default');
INSERT INTO `device_param` VALUES ('20', '0x0000000B', '3', '0', '远程数据通信模块', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-08-22 17:04:18', '2015-08-22 17:04:18', 'select', 'paramOption1', 'default');
INSERT INTO `device_param` VALUES ('21', '0x0010', '1', '0', '嵌入式软件运行模式', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('22', '0x00000010', '3', '0', '嵌入式软件运行模式', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('23', '0x0011', '1', '0', '可支持AP:C协议的最大长度', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('24', '0x00000011', '3', '0', '可支持AP:C协议的最大长度', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('25', '0x0012', '1', '0', 'MCP:B采用的交互机制', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('26', '0x00000012', '3', '0', 'MCP:B采用的交互机制', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('27', '0x0013', '1', '0', '连发系数(Nc)', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('28', '0x00000013', '3', '0', '连发系数(Nc)', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('29', '0x0014', '1', '0', '设备响应超时', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('30', '0x00000014', '3', '0', '设备响应超时', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('31', '0x0015', '1', '0', '发送间隔时间', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('32', '0x00000015', '3', '0', '发送间隔时间', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('33', '0x0016', '1', '0', '暂停传输等待时间', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('34', '0x00000016', '3', '0', '暂停传输等待时间', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('35', '0x0017', '1', '0', '转换到软件升级模式时OMC需要等待的时间', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('36', '0x00000017', '3', '0', '转换到软件升级模式时OMC需要等待的时间', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('37', '0x0018', '1', '0', '设备执行软件升级的结果', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('38', '0x00000018', '3', '0', '设备执行软件升级的结果', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('39', '0x0019', '1', '0', 'FTP方式软件升级进度', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('40', '0x00000019', '3', '0', 'FTP方式软件升级进度', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('41', '0x0020', '1', '0', '设备使用的远程升级方式', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('42', '0x00000020', '3', '0', '设备使用的远程升级方式', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('43', '0x0021', '1', '0', 'FPGA版本信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('44', '0x00000021', '3', '0', 'FPGA版本信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('45', '0x0023', '1', '0', '设备位置信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('46', '0x00000023', '3', '0', '设备位置信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('47', '0x0024', '1', '0', '远端端口数量', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('48', '0x00000024', '3', '0', '远端端口数量', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('49', '0x0030', '1', '3', '光收发故障告警1使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:11:45', '2015-10-17 15:11:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('50', '0x00000030', '3', '3', '光收发故障告警1使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:11:56', '2015-10-17 15:11:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('51', '0x0031', '1', '0', '光收发故障告警2使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('52', '0x00000031', '3', '3', '光收发故障告警2使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:12:09', '2015-10-17 15:12:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('53', '0x0032', '1', '0', '光收发故障告警3使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('54', '0x00000032', '3', '3', '光收发故障告警3使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:12:18', '2015-10-17 15:12:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('55', '0x0033', '1', '0', '光收发故障告警4使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('56', '0x00000033', '3', '3', '光收发故障告警4使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:12:27', '2015-10-17 15:12:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('57', '0x0034', '1', '0', '光收发故障告警5使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('58', '0x00000034', '3', '3', '光收发故障告警5使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:12:36', '2015-10-17 15:12:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('59', '0x0035', '1', '0', '光收发故障告警6使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('60', '0x00000035', '3', '3', '光收发故障告警6使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:12:43', '2015-10-17 15:12:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('61', '0x0036', '1', '0', '光收发故障告警7使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('62', '0x00000036', '3', '3', '光收发故障告警7使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:12:56', '2015-10-17 15:12:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('63', '0x0037', '1', '0', '光收发故障告警8使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('64', '0x00000037', '3', '3', '光收发故障告警8使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:13:08', '2015-10-17 15:13:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('65', '0x0049', '1', '0', '设备过温告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('66', '0x00000049', '3', '3', '设备过温告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:13:25', '2015-10-17 15:13:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('67', '0x03A8', '1', '0', '光收发故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 18:24:58', '2015-10-17 18:24:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('68', '0x0000005C', '3', '2', '光收发故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:13:39', '2015-10-17 15:13:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('69', '0x03A9', '1', '0', '光收发故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 18:25:12', '2015-10-17 18:25:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('70', '0x0000005D', '3', '2', '光收发故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:13:51', '2015-10-17 15:13:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('71', '0x03AA', '1', '0', '光收发故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 18:25:26', '2015-10-17 18:25:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('72', '0x0000005E', '3', '2', '光收发故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:14:01', '2015-10-17 15:14:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('73', '0x03AB', '1', '0', '光收发故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 18:25:38', '2015-10-17 18:25:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('74', '0x0000005F', '3', '2', '光收发故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:14:10', '2015-10-17 15:14:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('75', '0x03AC', '1', '0', '光收发故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 18:25:58', '2015-10-17 18:25:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('76', '0x00000060', '3', '2', '光收发故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:14:19', '2015-10-17 15:14:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('77', '0x03AD', '1', '0', '光收发故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 18:26:11', '2015-10-17 18:26:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('78', '0x00000061', '3', '2', '光收发故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:14:27', '2015-10-17 15:14:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('79', '0x0062', '1', '0', '光收发故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('80', '0x00000062', '3', '2', '光收发故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:14:36', '2015-10-17 15:14:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('81', '0x0063', '1', '0', '光收发故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('82', '0x00000063', '3', '2', '光收发故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:14:45', '2015-10-17 15:14:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('83', '0x0075', '1', '0', '设备过温告警', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('84', '0x00000075', '3', '2', '设备过温告警', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 15:15:12', '2015-10-17 15:15:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('85', '0x00A0', '1', '0', '设备日志', 'ro', 'none', '1', 'uint1', '0', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('86', '0x000000A0', '3', '0', '设备日志', 'ro', 'none', '1', 'uint1', '0', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('87', '0x0101', '1', '0', '站点编号', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('88', '0x00000101', '3', '1', '站点编号', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 14:49:12', '2015-10-17 14:49:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('89', '0x0102', '1', '0', '设备编号', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('90', '0x00000102', '3', '1', '设备编号', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:49:31', '2015-10-17 14:49:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('91', '0x0110', '1', '0', '短信服务中心号码', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('92', '0x00000110', '3', '1', '短信服务中心号码', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:49:46', '2015-10-17 14:49:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('93', '0x0111', '1', '0', '查询/设置电话号码1', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('94', '0x00000111', '3', '1', '查询/设置电话号码1', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:49:57', '2015-10-17 14:49:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('95', '0x0112', '1', '0', '查询/设置电话号码2', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('96', '0x00000112', '3', '1', '查询/设置电话号码2', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:50:05', '2015-10-17 14:50:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('97', '0x0113', '1', '0', '查询/设置电话号码3', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('98', '0x00000113', '3', '1', '查询/设置电话号码3', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:50:17', '2015-10-17 14:50:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('99', '0x0114', '1', '0', '查询/设置电话号码4', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('100', '0x00000114', '3', '1', '查询/设置电话号码4', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:50:26', '2015-10-17 14:50:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('101', '0x0115', '1', '0', '查询/设置电话号码5', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('102', '0x00000115', '3', '1', '查询/设置电话号码5', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:50:34', '2015-10-17 14:50:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('103', '0x0120', '1', '0', '上报号码', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('104', '0x00000120', '3', '1', '上报号码', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:50:48', '2015-10-17 14:50:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('105', '0x0130', '1', '0', '监控中心IP地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('106', '0x00000130', '3', '1', '监控中心IP地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 14:50:59', '2015-10-17 14:50:59', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('107', '0x0131', '1', '0', '监控中心IP地址端口号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('108', '0x00000131', '3', '1', '监控中心IP地址端口号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:51:11', '2015-10-17 14:51:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('109', '0x0133', '1', '0', 'GPRS接入点名称', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('110', '0x00000133', '3', '1', 'GPRS接入点名称', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:51:22', '2015-10-17 14:51:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('111', '0x0134', '1', '0', '设备的心跳包间隔时间', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('112', '0x00000134', '3', '1', '设备的心跳包间隔时间', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:51:40', '2015-10-17 14:51:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('113', '0x0135', '1', '0', '设备的电话号码', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('114', '0x00000135', '3', '1', '设备的电话号码', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:51:49', '2015-10-17 14:51:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('115', '0x0136', '1', '0', 'GPRS参数:用户标识', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('116', '0x00000136', '3', '1', 'GPRS参数:用户标识', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:51:59', '2015-10-17 14:51:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('117', '0x0137', '1', '0', 'GPRS参数:口令', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('118', '0x00000137', '3', '1', 'GPRS参数:口令', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:52:10', '2015-10-17 14:52:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('119', '0x0138', '1', '0', 'PS域传输协议', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('120', '0x00000138', '3', '1', 'PS域传输协议', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:52:22', '2015-10-17 14:52:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('121', '0x0139', '1', '0', '设备接收端口(UDP协议)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('122', '0x00000139', '3', '1', '设备接收端口(UDP协议)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:52:32', '2015-10-17 14:52:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('123', '0x0140', '1', '0', '上报通信方式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('124', '0x00000140', '3', '0', '上报通信方式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('125', '0x0141', '1', '0', '上报类型', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('126', '0x00000141', '3', '1', '上报类型', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:52:44', '2015-10-17 14:52:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('127', '0x0142', '1', '0', '通信方式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('128', '0x00000142', '3', '1', '通信方式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:53:04', '2015-10-17 14:53:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('129', '0x0150', '1', '0', '设备当前时间', 'rw', 'none', '1', 'dstr', '7', '1', '255', '0', '255', '4', '0', '2015-09-09 01:35:18', '2015-09-09 01:35:18', 'text', 'paramOptionNone', 'dt');
INSERT INTO `device_param` VALUES ('130', '0x00000150', '3', '1', '设备当前时间', 'rw', 'none', '1', 'dstr', '7', '1', '255', '0', '255', '4', '0', '2015-10-17 14:53:42', '2015-10-17 14:53:42', 'text', 'paramOptionNone', 'dt');
INSERT INTO `device_param` VALUES ('131', '0x0151', '1', '0', '设备IP地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('132', '0x00000151', '3', '1', '设备IP地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 14:53:52', '2015-10-17 14:53:52', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('133', '0x0152', '1', '0', '设备子网掩码', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('134', '0x00000152', '3', '1', '设备子网掩码', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 14:54:20', '2015-10-17 14:54:20', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('135', '0x0153', '1', '0', '设备默认网关', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('136', '0x00000153', '3', '1', '设备默认网关', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 14:54:29', '2015-10-17 14:54:29', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('137', '0x0160', '1', '0', 'FTP服务器IP地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('138', '0x00000160', '3', '1', 'FTP服务器IP地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 14:54:39', '2015-10-17 14:54:39', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('139', '0x0161', '1', '0', 'FTP服务器IP地址端口号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('140', '0x00000161', '3', '1', 'FTP服务器IP地址端口号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:54:48', '2015-10-17 14:54:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('141', '0x0162', '1', '0', 'FTP升级操作的用户名', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('142', '0x00000162', '3', '1', 'FTP升级操作的用户名', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:54:59', '2015-10-17 14:54:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('143', '0x0163', '1', '0', 'FTP升级操作的口令', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('144', '0x00000163', '3', '1', 'FTP升级操作的口令', 'rw', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:55:09', '2015-10-17 14:55:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('145', '0x0164', '1', '0', '相对路径', 'rw', 'none', '1', 'str', '40', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('146', '0x00000164', '3', '1', '相对路径', 'rw', 'none', '1', 'str', '40', '1', '255', '0', '255', '4', '0', '2015-10-17 14:55:19', '2015-10-17 14:55:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('147', '0x0165', '1', '0', '文件名', 'rw', 'none', '1', 'str', '40', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('148', '0x00000165', '3', '1', '文件名', 'rw', 'none', '1', 'str', '40', '1', '255', '0', '255', '4', '0', '2015-10-17 14:55:28', '2015-10-17 14:55:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('149', '0x0166', '1', '0', 'FTP文件传输控制', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('150', '0x00000166', '3', '1', 'FTP文件传输控制', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:55:46', '2015-10-17 14:55:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('151', '0x0172', '1', '0', '设备过温告警门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('152', '0x00000172', '3', '4', '设备过温告警门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 15:15:46', '2015-10-17 15:15:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('153', '0x01A0', '1', '0', 'CPLD版本信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('154', '0x000001A0', '3', '0', 'CPLD版本信息', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('155', '0x01A1', '1', '0', '设备MAC地址', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('156', '0x000001A1', '3', '0', '设备MAC地址', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('157', '0x01FC', '1', '0', '开机自校通道选择指令', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('158', '0x000001FC', '3', '0', '开机自校通道选择指令', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('159', '0x01FE', '1', '0', '开机自校信号选择指令', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('160', '0x000001FE', '3', '0', '开机自校信号选择指令', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('161', '0x01FF', '1', '0', '扩展单元开机上报指令', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('162', '0x000001FF', '3', '0', '扩展单元开机上报指令', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('163', '0x0201', '1', '3', '电源掉电告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('164', '0x00000201', '3', '3', '电源掉电告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('165', '0x0202', '1', '3', '电源故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('166', '0x00000202', '3', '3', '电源故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('167', '0x0203', '1', '3', '太阳能电池低电压告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('168', '0x00000203', '3', '3', '太阳能电池低电压告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('169', '0x0204', '1', '3', '监控模块电池故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('170', '0x00000204', '3', '3', '监控模块电池故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('171', '0x0205', '1', '3', '位置告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('172', '0x00000205', '3', '3', '位置告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('173', '0x0206', '1', '3', '功放过温告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('174', '0x00000206', '3', '3', '功放过温告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('175', '0x0207', '1', '3', '信源变化告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('176', '0x00000207', '3', '3', '信源变化告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('177', '0x0208', '1', '3', '其他模块告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('178', '0x00000208', '3', '3', '其他模块告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('179', '0x0209', '1', '3', '本振失锁告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('180', '0x00000209', '3', '3', '本振失锁告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('181', '0x020A', '1', '3', '上行低噪放故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('182', '0x0000020A', '3', '3', '上行低噪放故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('183', '0x020B', '1', '3', '下行低噪放故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('184', '0x0000020B', '3', '3', '下行低噪放故障告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('185', '0x020C', '1', '3', '上行功放告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('186', '0x0000020C', '3', '3', '上行功放告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('187', '0x020D', '1', '3', '下行功放告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('188', '0x0000020D', '3', '3', '下行功放告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('189', '0x020E', '1', '3', '光收发告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('190', '0x0000020E', '3', '3', '光收发告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('191', '0x020F', '1', '3', '主从监控链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('192', '0x0000020F', '3', '3', '主从监控链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('193', '0x0210', '1', '3', '下行输入过功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('194', '0x00000210', '3', '3', '下行输入过功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('195', '0x0211', '1', '3', '下行输入欠功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('196', '0x00000211', '3', '3', '下行输入欠功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('197', '0x0212', '1', '3', '下行输出过功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('198', '0x00000212', '3', '3', '下行输出过功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('199', '0x0213', '1', '3', '下行输出欠功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('200', '0x00000213', '3', '3', '下行输出欠功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('201', '0x0214', '1', '3', '下行驻波比告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('202', '0x00000214', '3', '3', '下行驻波比告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('203', '0x0215', '1', '3', '上行输出过功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('204', '0x00000215', '3', '3', '上行输出过功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('205', '0x0216', '1', '3', '上行输出欠功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('206', '0x00000216', '3', '3', '上行输出欠功率告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('207', '0x0217', '1', '3', '上行驻波比告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('208', '0x00000217', '3', '3', '上行驻波比告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('209', '0x0220', '1', '3', '外部告警1告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('210', '0x00000220', '3', '3', '外部告警1告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('211', '0x0221', '1', '3', '外部告警2告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('212', '0x00000221', '3', '3', '外部告警2告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('213', '0x0222', '1', '3', '外部告警3告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('214', '0x00000222', '3', '3', '外部告警3告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('215', '0x0223', '1', '3', '外部告警4告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('216', '0x00000223', '3', '3', '外部告警4告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('217', '0x0224', '1', '3', '外部告警5告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('218', '0x00000224', '3', '3', '外部告警5告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('219', '0x0225', '1', '3', '外部告警6告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('220', '0x00000225', '3', '3', '外部告警6告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('221', '0x0226', '1', '3', '外部告警7告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('222', '0x00000226', '3', '3', '外部告警7告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('223', '0x0227', '1', '3', '外部告警8告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('224', '0x00000227', '3', '3', '外部告警8告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('225', '0x0228', '1', '3', '门禁告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('226', '0x00000228', '3', '3', '门禁告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('227', '0x0229', '1', '3', '自激告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('228', '0x00000229', '3', '3', '自激告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('229', '0x0230', '1', '3', '下行输入过功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('230', '0x0800100D', '3', '3', '下行输入过功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:18:53', '2015-10-17 16:18:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('231', '0x0231', '1', '3', '下行输入欠功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('232', '0x0800100C', '3', '3', '下行输入欠功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:17:35', '2015-10-17 16:17:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('233', '0x0232', '1', '3', '下行输出过功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('234', '0x00000232', '3', '3', '下行输出过功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('235', '0x0233', '1', '3', '下行输出欠功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('236', '0x00000233', '3', '3', '下行输出欠功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('237', '0x0234', '1', '3', '上行输出过功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('238', '0x00000234', '3', '3', '上行输出过功率告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('239', '0x0235', '1', '3', '下行驻波比告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('240', '0x00000235', '3', '3', '下行驻波比告警使能(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('241', '0x0236', '1', '3', '下行输入过功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('242', '0x0800400D', '3', '3', '下行输入过功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:19:20', '2015-10-17 16:19:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('243', '0x0237', '1', '3', '下行输入欠功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('244', '0x0800400C', '3', '3', '下行输入欠功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:17:52', '2015-10-17 16:17:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('245', '0x0238', '1', '3', '下行输出过功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('246', '0x00000238', '3', '3', '下行输出过功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('247', '0x0239', '1', '3', '下行输出欠功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('248', '0x00000239', '3', '3', '下行输出欠功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('249', '0x023A', '1', '3', '上行输出过功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('250', '0x0000023A', '3', '3', '上行输出过功率告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('251', '0x023B', '1', '3', '下行驻波比告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('252', '0x0000023B', '3', '3', '下行驻波比告警使能(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('253', '0x023C', '1', '3', '下行输入过功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('254', '0x0800700D', '3', '3', '下行输入过功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:19:40', '2015-10-17 16:19:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('255', '0x023D', '1', '3', '下行输入欠功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('256', '0x0800700C', '3', '3', '下行输入欠功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:18:10', '2015-10-17 16:18:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('257', '0x023E', '1', '3', '下行输出过功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('258', '0x0000023E', '3', '3', '下行输出过功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('259', '0x023F', '1', '3', '下行输出欠功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('260', '0x0000023F', '3', '3', '下行输出欠功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('261', '0x0240', '1', '3', '上行输出过功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('262', '0x00000240', '3', '3', '上行输出过功率告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('263', '0x0241', '1', '3', '下行驻波比告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('264', '0x00000241', '3', '3', '下行驻波比告警使能(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('265', '0x0242', '1', '3', '下行输入过功率告警使能(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('266', '0x0800800D', '3', '3', '下行输入过功率告警使能(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:19:58', '2015-10-17 16:19:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('267', '0x0243', '1', '3', '下行输入欠功率告警使能(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('268', '0x0800800C', '3', '3', '下行输入欠功率告警使能(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:18:27', '2015-10-17 16:18:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('269', '0x0244', '1', '3', '下行输出过功率告警使能(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('270', '0x00000244', '3', '3', '下行输出过功率告警使能(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('359', '0x02A9', '1', '3', '光口2告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('360', '0x000002A9', '3', '3', '光口2告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('361', '0x02AA', '1', '3', '光口3告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('362', '0x000002AA', '3', '3', '光口3告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('363', '0x02AB', '1', '3', '光口4告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('364', '0x000002AB', '3', '3', '光口4告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('365', '0x02AC', '1', '3', '光口5告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('366', '0x000002AC', '3', '3', '光口5告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('367', '0x02AD', '1', '3', '光口6告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('368', '0x000002AD', '3', '3', '光口6告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('369', '0x02AE', '1', '3', '光口7告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('370', '0x000002AE', '3', '3', '光口7告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('371', '0x02AF', '1', '3', '光口8告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('372', '0x000002AF', '3', '3', '光口8告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('373', '0x02B0', '1', '3', 'RAU端口1通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('374', '0x000002B0', '3', '3', 'RAU端口1通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('375', '0x02B1', '1', '3', 'RAU端口2通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('376', '0x000002B1', '3', '3', 'RAU端口2通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('377', '0x02B2', '1', '3', 'RAU端口3通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('378', '0x000002B2', '3', '3', 'RAU端口3通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('379', '0x02B3', '1', '3', 'RAU端口4通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('380', '0x000002B3', '3', '3', 'RAU端口4通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('381', '0x02B4', '1', '3', 'RAU端口5通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('382', '0x000002B4', '3', '3', 'RAU端口5通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('383', '0x02B5', '1', '3', 'RAU端口6通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('384', '0x000002B5', '3', '3', 'RAU端口6通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('385', '0x02B6', '1', '3', 'RAU端口7通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('386', '0x000002B6', '3', '3', 'RAU端口7通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('387', '0x02B7', '1', '3', 'RAU端口8通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('388', '0x000002B7', '3', '3', 'RAU端口8通讯告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('389', '0x02B8', '1', '3', '上行发光告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('390', '0x000002B8', '3', '3', '上行发光告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('391', '0x02B9', '1', '3', '下行发光告警1使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('392', '0x000002B9', '3', '3', '下行发光告警1使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('393', '0x02BA', '1', '3', '下行发光告警2使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('394', '0x000002BA', '3', '3', '下行发光告警2使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('395', '0x02BB', '1', '3', '上行收无光告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('396', '0x000002BB', '3', '3', '上行收无光告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('397', '0x02BC', '1', '3', '本振1告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('398', '0x000002BC', '3', '3', '本振1告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('399', '0x02BD', '1', '3', '本振2告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('400', '0x000002BD', '3', '3', '本振2告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('401', '0x02BE', '1', '3', '本振3告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('402', '0x000002BE', '3', '3', '本振3告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('403', '0x02BF', '1', '3', '本振4告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('404', '0x000002BF', '3', '3', '本振4告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('405', '0x02C0', '1', '3', '下行收无光告警1使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('406', '0x000002C0', '3', '3', '下行收无光告警1使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('407', '0x02C1', '1', '3', '下行收无光告警2使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('408', '0x000002C1', '3', '3', '下行收无光告警2使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('409', '0x02C2', '1', '3', '下行收无光告警3使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('410', '0x000002C2', '3', '3', '下行收无光告警3使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('411', '0x02C3', '1', '3', '下行收无光告警4使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('412', '0x000002C3', '3', '3', '下行收无光告警4使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('413', '0x02C4', '1', '3', '下行收无光告警5使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('414', '0x000002C4', '3', '3', '下行收无光告警5使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('415', '0x02C5', '1', '3', '下行收无光告警6使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('416', '0x000002C5', '3', '3', '下行收无光告警6使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('417', '0x02C6', '1', '3', '下行收无光告警7使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('418', '0x000002C6', '3', '3', '下行收无光告警7使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('419', '0x02C7', '1', '3', '下行收无光告警8使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('420', '0x000002C7', '3', '3', '下行收无光告警8使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('421', '0x02C8', '1', '3', '下行GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('422', '0x000002C8', '3', '3', '下行GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('423', '0x02C9', '1', '3', '下行TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('424', '0x000002C9', '3', '3', '下行TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('425', '0x02D0', '1', '3', '上行通道1-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('426', '0x000002D0', '3', '3', '上行通道1-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('427', '0x02D1', '1', '3', '上行通道1-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('428', '0x000002D1', '3', '3', '上行通道1-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('429', '0x02D2', '1', '3', '上行通道2-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('430', '0x000002D2', '3', '3', '上行通道2-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('431', '0x02D3', '1', '3', '上行通道2-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('432', '0x000002D3', '3', '3', '上行通道2-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('433', '0x02D4', '1', '3', '上行通道3-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('434', '0x000002D4', '3', '3', '上行通道3-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('435', '0x02D5', '1', '3', '上行通道3-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('436', '0x000002D5', '3', '3', '上行通道3-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('437', '0x02D6', '1', '3', '上行通道4-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('438', '0x000002D6', '3', '3', '上行通道4-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('439', '0x02D7', '1', '3', '上行通道4-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('440', '0x000002D7', '3', '3', '上行通道4-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('441', '0x02D8', '1', '3', '上行通道5-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('442', '0x000002D8', '3', '3', '上行通道5-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('443', '0x02D9', '1', '3', '上行通道5-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('444', '0x000002D9', '3', '3', '上行通道5-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('445', '0x02DA', '1', '3', '上行通道6-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('446', '0x000002DA', '3', '3', '上行通道6-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('447', '0x02DB', '1', '3', '上行通道6-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('448', '0x000002DB', '3', '3', '上行通道6-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('449', '0x02DC', '1', '3', '上行通道7-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('450', '0x000002DC', '3', '3', '上行通道7-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('451', '0x02DD', '1', '3', '上行通道7-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('452', '0x000002DD', '3', '3', '上行通道7-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('453', '0x02DE', '1', '3', '上行通道8-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('454', '0x000002DE', '3', '3', '上行通道8-GSM链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('455', '0x02DF', '1', '3', '上行通道8-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('456', '0x000002DF', '3', '3', '上行通道8-TD链路告警使能', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('457', '0x0301', '1', '2', '电源掉电告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('458', '0x00000301', '3', '2', '电源掉电告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('459', '0x0302', '1', '2', '电源故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('460', '0x00000302', '3', '2', '电源故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('461', '0x0303', '1', '2', '太阳能电池低电压告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('462', '0x00000303', '3', '2', '太阳能电池低电压告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('463', '0x0304', '1', '2', '监控模块电池故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('464', '0x00000304', '3', '2', '监控模块电池故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('465', '0x0305', '1', '2', '位置告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('466', '0x00000305', '3', '2', '位置告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('467', '0x0306', '1', '2', '功放过温告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('468', '0x00000306', '3', '2', '功放过温告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('469', '0x0307', '1', '2', '信源变化告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('470', '0x00000307', '3', '2', '信源变化告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('471', '0x0308', '1', '2', '其他模块告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('472', '0x00000308', '3', '2', '其他模块告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('473', '0x0309', '1', '2', '本振失锁告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('474', '0x00000309', '3', '2', '本振失锁告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('475', '0x030A', '1', '2', '上行低噪放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('476', '0x0000030A', '3', '2', '上行低噪放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('477', '0x030B', '1', '2', '下行低噪放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('478', '0x0000030B', '3', '2', '下行低噪放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('479', '0x030C', '1', '2', '上行功放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('480', '0x0000030C', '3', '2', '上行功放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('481', '0x030D', '1', '2', '下行功放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('482', '0x0000030D', '3', '2', '下行功放故障告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('483', '0x030E', '1', '2', '光收发告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('484', '0x0000030E', '3', '2', '光收发告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('485', '0x030F', '1', '2', '主从监控链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('486', '0x0000030F', '3', '2', '主从监控链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('487', '0x0310', '1', '2', '下行输入过功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('488', '0x00000310', '3', '2', '下行输入过功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('489', '0x0311', '1', '2', '下行输入欠功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('490', '0x00000311', '3', '2', '下行输入欠功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('491', '0x0312', '1', '2', '下行输出过功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('492', '0x00000312', '3', '2', '下行输出过功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('493', '0x0313', '1', '2', '下行输出欠功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('494', '0x00000313', '3', '2', '下行输出欠功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('495', '0x0314', '1', '2', '下行驻波比告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('496', '0x00000314', '3', '2', '下行驻波比告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('497', '0x0315', '1', '2', '上行输出过功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('498', '0x00000315', '3', '2', '上行输出过功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('499', '0x0316', '1', '2', '上行输出欠功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('500', '0x00000316', '3', '2', '上行输出欠功率告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('501', '0x0317', '1', '2', '上行驻波比告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('502', '0x00000317', '3', '2', '上行驻波比告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('503', '0x0320', '1', '2', '外部告警1告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('504', '0x00000320', '3', '2', '外部告警1告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('505', '0x0321', '1', '2', '外部告警2告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('506', '0x00000321', '3', '2', '外部告警2告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('507', '0x0322', '1', '2', '外部告警3告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('508', '0x00000322', '3', '2', '外部告警3告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('509', '0x0323', '1', '2', '外部告警4告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('510', '0x00000323', '3', '2', '外部告警4告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('511', '0x0324', '1', '2', '外部告警5告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('512', '0x00000324', '3', '2', '外部告警5告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('513', '0x0325', '1', '2', '外部告警6告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('514', '0x00000325', '3', '2', '外部告警6告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('515', '0x0326', '1', '2', '外部告警7告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('516', '0x00000326', '3', '2', '外部告警7告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('517', '0x0327', '1', '2', '外部告警8告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('518', '0x00000327', '3', '2', '外部告警8告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('519', '0x0328', '1', '2', '门禁告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('520', '0x00000328', '3', '2', '门禁告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('521', '0x0329', '1', '2', '自激告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('522', '0x00000329', '3', '2', '自激告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('523', '0x0330', '1', '2', '下行输入过功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('524', '0x0800100F', '3', '2', '下行输入过功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:21:46', '2015-10-17 16:21:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('525', '0x0331', '1', '2', '下行输入欠功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('526', '0x00000331', '3', '2', '下行输入欠功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('527', '0x0332', '1', '2', '下行输出过功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('528', '0x0800100E', '3', '2', '下行输出过功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:20:26', '2015-10-17 16:20:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('529', '0x0333', '1', '2', '下行输出欠功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('530', '0x00000333', '3', '2', '下行输出欠功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('531', '0x0334', '1', '2', '上行输出过功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('532', '0x00000334', '3', '2', '上行输出过功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('533', '0x0335', '1', '2', '下行驻波比告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('534', '0x00000335', '3', '2', '下行驻波比告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('535', '0x0336', '1', '2', '下行输入过功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('536', '0x0800400F', '3', '2', '下行输入过功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:22:04', '2015-10-17 16:22:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('537', '0x0337', '1', '2', '下行输入欠功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('538', '0x0800400E', '3', '2', '下行输入欠功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:20:46', '2015-10-17 16:20:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('539', '0x0338', '1', '2', '下行输出过功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('540', '0x00000338', '3', '2', '下行输出过功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('541', '0x0339', '1', '2', '下行输出欠功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('542', '0x00000339', '3', '2', '下行输出欠功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('543', '0x033A', '1', '2', '上行输出过功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('544', '0x0000033A', '3', '2', '上行输出过功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('545', '0x033B', '1', '2', '下行驻波比告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('546', '0x0000033B', '3', '2', '下行驻波比告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('547', '0x033C', '1', '2', '下行输入过功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('548', '0x0800700F', '3', '2', '下行输入过功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:22:24', '2015-10-17 16:22:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('549', '0x033D', '1', '2', '下行输入欠功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('550', '0x0800700E', '3', '2', '下行输入欠功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:21:07', '2015-10-17 16:21:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('551', '0x033E', '1', '2', '下行输出过功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('552', '0x0000033E', '3', '2', '下行输出过功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('553', '0x033F', '1', '2', '下行输出欠功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('554', '0x0000033F', '3', '2', '下行输出欠功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('555', '0x0340', '1', '2', '上行输出过功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('556', '0x00000340', '3', '2', '上行输出过功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('557', '0x0341', '1', '2', '下行驻波比告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('558', '0x00000341', '3', '2', '下行驻波比告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('559', '0x0342', '1', '2', '下行输入过功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('560', '0x0800800F', '3', '2', '下行输入过功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:22:38', '2015-10-17 16:22:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('561', '0x0343', '1', '2', '下行输入欠功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('562', '0x0800800E', '3', '2', '下行输入欠功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 16:21:24', '2015-10-17 16:21:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('563', '0x0344', '1', '2', '下行输出过功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('564', '0x00000344', '3', '2', '下行输出过功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('565', '0x0345', '1', '2', '下行输出欠功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('566', '0x00000345', '3', '2', '下行输出欠功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('567', '0x0346', '1', '2', '上行输出过功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('568', '0x00000346', '3', '2', '上行输出过功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('569', '0x0347', '1', '2', '下行驻波比告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('570', '0x00000347', '3', '2', '下行驻波比告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('571', '0x0348', '1', '2', '上行输出欠功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('572', '0x00000348', '3', '2', '上行输出欠功率告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('573', '0x0349', '1', '2', '上行输出欠功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('574', '0x00000349', '3', '2', '上行输出欠功率告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('575', '0x034A', '1', '2', '上行输出欠功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('576', '0x0000034A', '3', '2', '上行输出欠功率告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('577', '0x034B', '1', '2', '上行输出欠功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('578', '0x0000034B', '3', '2', '上行输出欠功率告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('579', '0x034C', '1', '2', '上行驻波比告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('580', '0x0000034C', '3', '2', '上行驻波比告警(通道1)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('581', '0x034D', '1', '2', '上行驻波比告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('582', '0x0000034D', '3', '2', '上行驻波比告警(通道2)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('583', '0x034E', '1', '2', '上行驻波比告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('584', '0x0000034E', '3', '2', '上行驻波比告警(通道3)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('585', '0x034F', '1', '2', '上行驻波比告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('586', '0x0000034F', '3', '2', '上行驻波比告警(通道4)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('587', '0x0360', '1', '2', '塔顶放大器1告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('588', '0x00000360', '3', '2', '塔顶放大器1告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('589', '0x0361', '1', '2', '塔顶放大器2告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('590', '0x00000361', '3', '2', '塔顶放大器2告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('591', '0x0362', '1', '2', '塔顶放大器3告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('592', '0x00000362', '3', '2', '塔顶放大器3告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('593', '0x0363', '1', '2', '塔顶放大器4告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('594', '0x00000363', '3', '2', '塔顶放大器4告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('595', '0x0364', '1', '2', '塔顶放大器5告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('596', '0x00000364', '3', '2', '塔顶放大器5告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('597', '0x0365', '1', '2', '塔顶放大器6告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('598', '0x00000365', '3', '2', '塔顶放大器6告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('599', '0x0366', '1', '2', '塔顶放大器7告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('600', '0x00000366', '3', '2', '塔顶放大器7告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('601', '0x0367', '1', '2', '塔顶放大器8告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('602', '0x00000367', '3', '2', '塔顶放大器8告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('603', '0x0368', '1', '2', '功放旁路1告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('604', '0x00000368', '3', '2', '功放旁路1告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('605', '0x0369', '1', '2', '功放旁路2告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('606', '0x00000369', '3', '2', '功放旁路2告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('607', '0x036A', '1', '2', '功放旁路3告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('608', '0x0000036A', '3', '2', '功放旁路3告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('609', '0x036B', '1', '2', '功放旁路4告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('610', '0x0000036B', '3', '2', '功放旁路4告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('611', '0x036C', '1', '2', '功放旁路5告警', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-08 16:49:54', '2015-10-08 16:49:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('712', '0x000003C6', '3', '2', '下行收无光告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('713', '0x03C7', '1', '2', '下行收无光告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('714', '0x000003C7', '3', '2', '下行收无光告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('715', '0x03C8', '1', '2', '下行GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('716', '0x000003C8', '3', '2', '下行GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('717', '0x03C9', '1', '2', '下行TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('718', '0x000003C9', '3', '2', '下行TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('719', '0x03D0', '1', '2', '上行通道1-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('720', '0x000003D0', '3', '2', '上行通道1-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('721', '0x03D1', '1', '2', '上行通道1-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('722', '0x000003D1', '3', '2', '上行通道1-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('723', '0x03D2', '1', '2', '上行通道2-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('724', '0x000003D2', '3', '2', '上行通道2-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('725', '0x03D3', '1', '2', '上行通道2-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('726', '0x000003D3', '3', '2', '上行通道2-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('727', '0x03D4', '1', '2', '上行通道3-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('728', '0x000003D4', '3', '2', '上行通道3-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('729', '0x03D5', '1', '2', '上行通道3-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('730', '0x000003D5', '3', '2', '上行通道3-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('731', '0x03D6', '1', '2', '上行通道4-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('732', '0x000003D6', '3', '2', '上行通道4-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('733', '0x03D7', '1', '2', '上行通道4-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('734', '0x000003D7', '3', '2', '上行通道4-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('735', '0x03D8', '1', '2', '上行通道5-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('736', '0x000003D8', '3', '2', '上行通道5-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('737', '0x03D9', '1', '2', '上行通道5-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('738', '0x000003D9', '3', '2', '上行通道5-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('739', '0x03DA', '1', '2', '上行通道6-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('740', '0x000003DA', '3', '2', '上行通道6-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('741', '0x03DB', '1', '2', '上行通道6-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('742', '0x000003DB', '3', '2', '上行通道6-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('743', '0x03DC', '1', '2', '上行通道7-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('744', '0x000003DC', '3', '2', '上行通道7-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('745', '0x03DD', '1', '2', '上行通道7-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('746', '0x000003DD', '3', '2', '上行通道7-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('747', '0x03DE', '1', '2', '上行通道8-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('748', '0x000003DE', '3', '2', '上行通道8-GSM链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('749', '0x03DF', '1', '2', '上行通道8-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('750', '0x000003DF', '3', '2', '上行通道8-TD链路告警', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('751', '0x03E0', '1', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('752', '0x000003E0', '3', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('753', '0x03E1', '1', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('754', '0x000003E1', '3', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('755', '0x03E2', '1', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('756', '0x000003E2', '3', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('757', '0x03E3', '1', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('758', '0x000003E3', '3', '2', '故障告警通道1告警(过流)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('759', '0x0401', '1', '4', '射频信号开关状态', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('760', '0x00000401', '3', '4', '射频信号开关状态', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('761', '0x0402', '1', '4', '功放开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('762', '0x00000402', '3', '4', '功放开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('763', '0x0403', '1', '4', '功放开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('764', '0x00000403', '3', '4', '功放开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('765', '0x0404', '1', '4', '功放开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('766', '0x00000404', '3', '4', '功放开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('767', '0x0405', '1', '4', '功放开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('768', '0x00000405', '3', '4', '功放开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('769', '0x0406', '1', '4', '功放开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('770', '0x00000406', '3', '4', '功放开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('771', '0x0407', '1', '4', '功放开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('772', '0x00000407', '3', '4', '功放开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('773', '0x0408', '1', '4', '功放开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('774', '0x00000408', '3', '4', '功放开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('775', '0x0409', '1', '4', '功放开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('776', '0x00000409', '3', '4', '功放开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('777', '0x0410', '1', '4', '工作信道号1', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('778', '0x00000410', '3', '4', '工作信道号1', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('779', '0x0411', '1', '4', '工作信道号2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('780', '0x00000411', '3', '4', '工作信道号2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('781', '0x0412', '1', '4', '工作信道号3', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('782', '0x00000412', '3', '4', '工作信道号3', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('783', '0x0413', '1', '4', '工作信道号4', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('784', '0x00000413', '3', '4', '工作信道号4', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('785', '0x0414', '1', '4', '工作信道号5', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('786', '0x00000414', '3', '4', '工作信道号5', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('787', '0x0415', '1', '4', '工作信道号6', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('788', '0x00000415', '3', '4', '工作信道号6', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('789', '0x0416', '1', '4', '工作信道号7', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('790', '0x00000416', '3', '4', '工作信道号7', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('791', '0x0417', '1', '4', '工作信道号8', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('792', '0x00000417', '3', '4', '工作信道号8', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('793', '0x0418', '1', '4', '工作信道号9', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('794', '0x00000418', '3', '4', '工作信道号9', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('795', '0x0419', '1', '4', '工作信道号10', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('796', '0x00000419', '3', '4', '工作信道号10', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('797', '0x041A', '1', '4', '工作信道号11', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('798', '0x0000041A', '3', '4', '工作信道号11', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('799', '0x041B', '1', '4', '工作信道号12', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('800', '0x0000041B', '3', '4', '工作信道号12', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('801', '0x041C', '1', '4', '工作信道号13', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('802', '0x0000041C', '3', '4', '工作信道号13', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('803', '0x041D', '1', '4', '工作信道号14', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('804', '0x0000041D', '3', '4', '工作信道号14', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('805', '0x041E', '1', '4', '工作信道号15', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('806', '0x0000041E', '3', '4', '工作信道号15', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('807', '0x041F', '1', '4', '工作信道号16', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('808', '0x0000041F', '3', '4', '工作信道号16', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('809', '0x0420', '1', '4', '移频信道号1', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('810', '0x00000420', '3', '4', '移频信道号1', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('811', '0x0421', '1', '4', '移频信道号2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('812', '0x00000421', '3', '4', '移频信道号2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('813', '0x0422', '1', '4', '移频信道号3', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('814', '0x00000422', '3', '4', '移频信道号3', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('815', '0x0423', '1', '4', '移频信道号4', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('816', '0x00000423', '3', '4', '移频信道号4', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('817', '0x0424', '1', '4', '移频信道号5', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('818', '0x00000424', '3', '4', '移频信道号5', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('819', '0x0425', '1', '4', '移频信道号6', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('820', '0x00000425', '3', '4', '移频信道号6', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('821', '0x0426', '1', '4', '移频信道号7', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('822', '0x00000426', '3', '4', '移频信道号7', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('823', '0x0427', '1', '4', '移频信道号8', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('824', '0x00000427', '3', '4', '移频信道号8', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('825', '0x0428', '1', '4', '移频信道号9', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('826', '0x00000428', '3', '4', '移频信道号9', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('827', '0x0429', '1', '4', '移频信道号10', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('828', '0x00000429', '3', '4', '移频信道号10', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('829', '0x042A', '1', '4', '移频信道号11', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('830', '0x0000042A', '3', '4', '移频信道号11', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('831', '0x042B', '1', '4', '移频信道号12', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('832', '0x0000042B', '3', '4', '移频信道号12', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('833', '0x042C', '1', '4', '移频信道号13', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('834', '0x0000042C', '3', '4', '移频信道号13', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('835', '0x042D', '1', '4', '移频信道号14', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('836', '0x0000042D', '3', '4', '移频信道号14', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('837', '0x042E', '1', '4', '移频信道号15', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('838', '0x0000042E', '3', '4', '移频信道号15', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('839', '0x042F', '1', '4', '移频信道号16', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('840', '0x0000042F', '3', '4', '移频信道号16', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('841', '0x0430', '1', '4', '工作频带的上边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('842', '0x00000430', '3', '4', '工作频带的上边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('843', '0x0431', '1', '4', '工作频带的下边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('844', '0x00000431', '3', '4', '工作频带的下边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('845', '0x0432', '1', '4', '移频频带的上边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('846', '0x00000432', '3', '4', '移频频带的上边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('847', '0x0433', '1', '4', '移频频带的下边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('848', '0x00000433', '3', '4', '移频频带的下边带信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('849', '0x0434', '1', '4', '工作频带的上边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('850', '0x00000434', '3', '4', '工作频带的上边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('851', '0x0435', '1', '4', '工作频带的下边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('852', '0x00000435', '3', '4', '工作频带的下边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('853', '0x0436', '1', '4', '工作频带的上边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('854', '0x00000436', '3', '4', '工作频带的上边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('855', '0x0437', '1', '4', '工作频带的下边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('856', '0x00000437', '3', '4', '工作频带的下边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('857', '0x0438', '1', '4', '工作频带的上边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('858', '0x00000438', '3', '4', '工作频带的上边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('859', '0x0439', '1', '4', '工作频带的下边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('860', '0x00000439', '3', '4', '工作频带的下边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('861', '0x043A', '1', '4', '工作频带的上边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('862', '0x0000043A', '3', '4', '工作频带的上边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('863', '0x043B', '1', '4', '工作频带的下边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('864', '0x0000043B', '3', '4', '工作频带的下边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('865', '0x0440', '1', '4', '上行衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('866', '0x00000440', '3', '4', '上行衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('867', '0x0441', '1', '4', '下行衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('868', '0x00000441', '3', '4', '下行衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('869', '0x0442', '1', '4', '上行衰减值(通道1)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('870', '0x08001005', '3', '4', '上行衰减值(通道1)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:09:47', '2015-10-17 16:09:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('871', '0x0443', '1', '4', '下行衰减值(通道1)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('872', '0x08001006', '3', '4', '下行衰减值(通道1)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:10:03', '2015-10-17 16:10:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('873', '0x0444', '1', '4', '上行衰减值(通道2)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('874', '0x08004005', '3', '4', '上行衰减值(通道2)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:12:30', '2015-10-17 16:12:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('875', '0x0445', '1', '4', '下行衰减值(通道2)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('876', '0x08004006', '3', '4', '下行衰减值(通道2)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:13:12', '2015-10-17 16:13:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('877', '0x0446', '1', '4', '上行衰减值(通道3)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('878', '0x08007005', '3', '4', '上行衰减值(通道3)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:12:43', '2015-10-17 16:12:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('879', '0x0447', '1', '4', '下行衰减值(通道3)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('880', '0x08007006', '3', '4', '下行衰减值(通道3)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:13:24', '2015-10-17 16:13:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('881', '0x0448', '1', '4', '上行衰减值(通道4)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('882', '0x08008005', '3', '4', '上行衰减值(通道4)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:12:54', '2015-10-17 16:12:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('883', '0x0449', '1', '4', '下行衰减值(通道4)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('884', '0x08008006', '3', '4', '下行衰减值(通道4)', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 16:13:35', '2015-10-17 16:13:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('885', '0x044A', '1', '4', '上行驻波比门限(通道1)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('886', '0x0000044A', '3', '4', '上行驻波比门限(通道1)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('887', '0x044B', '1', '4', '上行驻波比门限(通道2)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('888', '0x0000044B', '3', '4', '上行驻波比门限(通道2)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('889', '0x044C', '1', '4', '上行驻波比门限(通道3)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('890', '0x0000044C', '3', '4', '上行驻波比门限(通道3)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('891', '0x044D', '1', '4', '上行驻波比门限(通道4)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('892', '0x0000044D', '3', '4', '上行驻波比门限(通道4)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('893', '0x0450', '1', '4', '下行驻波比门限', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('894', '0x00000450', '3', '4', '下行驻波比门限', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('895', '0x0451', '1', '4', '功放过温度告警门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('896', '0x00000451', '3', '4', '功放过温度告警门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('897', '0x0452', '1', '4', '信源小区识别码参照值', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('898', '0x00000452', '3', '4', '信源小区识别码参照值', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('899', '0x0453', '1', '4', '下行输入功率欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('900', '0x00000453', '3', '4', '下行输入功率欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('901', '0x0454', '1', '4', '下行输入功率过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('902', '0x00000454', '3', '4', '下行输入功率过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('903', '0x0455', '1', '4', '下行输出功率欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('904', '0x00000455', '3', '4', '下行输出功率欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('905', '0x0456', '1', '4', '下行输出功率过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('906', '0x00000456', '3', '4', '下行输出功率过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('907', '0x0457', '1', '4', '上行输出功率过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('908', '0x00000457', '3', '4', '上行输出功率过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('909', '0x0458', '1', '4', '移频频带的上边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('910', '0x00000458', '3', '4', '移频频带的上边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('911', '0x0459', '1', '4', '移频频带的下边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('912', '0x00000459', '3', '4', '移频频带的下边带信道号(通道1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('913', '0x045A', '1', '4', '移频频带的上边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('914', '0x0000045A', '3', '4', '移频频带的上边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('915', '0x045B', '1', '4', '移频频带的下边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('916', '0x0000045B', '3', '4', '移频频带的下边带信道号(通道2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('917', '0x045C', '1', '4', '移频频带的上边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('918', '0x0000045C', '3', '4', '移频频带的上边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('919', '0x045D', '1', '4', '移频频带的下边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('920', '0x0000045D', '3', '4', '移频频带的下边带信道号(通道3)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('921', '0x045E', '1', '4', '移频频带的上边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('922', '0x0000045E', '3', '4', '移频频带的上边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('923', '0x045F', '1', '4', '移频频带的下边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('924', '0x0000045F', '3', '4', '移频频带的下边带信道号(通道4)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('925', '0x0460', '1', '4', '射频切换开关状态1(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('926', '0x00000460', '3', '4', '射频切换开关状态1(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('927', '0x0461', '1', '4', '射频切换开关状态2(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('928', '0x00000461', '3', '4', '射频切换开关状态2(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('929', '0x0462', '1', '4', '射频切换开关状态3(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('930', '0x00000462', '3', '4', '射频切换开关状态3(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('931', '0x0463', '1', '4', '射频切换开关状态4(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('932', '0x00000463', '3', '4', '射频切换开关状态4(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('933', '0x0464', '1', '4', '射频切换开关状态5(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('934', '0x00000464', '3', '4', '射频切换开关状态5(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('935', '0x0465', '1', '4', '射频切换开关状态6(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('936', '0x00000465', '3', '4', '射频切换开关状态6(载波池)', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('937', '0x0466', '1', '4', '下行输入功率欠功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('938', '0x08001007', '3', '4', '下行输入功率欠功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:11:35', '2015-10-17 16:11:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('939', '0x0467', '1', '4', '下行输入功率过功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('940', '0x08001008', '3', '4', '下行输入功率过功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:15:54', '2015-10-17 16:15:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('941', '0x0468', '1', '4', '下行输出功率欠功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('942', '0x00000468', '3', '4', '下行输出功率欠功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('943', '0x0469', '1', '4', '下行输出功率过功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('944', '0x00000469', '3', '4', '下行输出功率过功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('945', '0x046A', '1', '4', '上行输出功率过功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('946', '0x0000046A', '3', '4', '上行输出功率过功率门限(通道1)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('947', '0x046B', '1', '4', '下行驻波比门限(通道1)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('948', '0x0000046B', '3', '4', '下行驻波比门限(通道1)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('949', '0x046C', '1', '4', '下行输入功率欠功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('950', '0x08004007', '3', '4', '下行输入功率欠功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:14:42', '2015-10-17 16:14:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('951', '0x046D', '1', '4', '下行输入功率过功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('952', '0x08004008', '3', '4', '下行输入功率过功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:16:27', '2015-10-17 16:16:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('953', '0x046E', '1', '4', '下行输出功率欠功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('954', '0x0000046E', '3', '4', '下行输出功率欠功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('955', '0x046F', '1', '4', '下行输出功率过功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('956', '0x0000046F', '3', '4', '下行输出功率过功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('957', '0x0470', '1', '4', '上行输出功率过功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('958', '0x00000470', '3', '4', '上行输出功率过功率门限(通道2)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('959', '0x0471', '1', '4', '下行驻波比门限(通道2)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('960', '0x00000471', '3', '4', '下行驻波比门限(通道2)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('961', '0x0472', '1', '4', '下行输入功率欠功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('962', '0x08007007', '3', '4', '下行输入功率欠功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:15:06', '2015-10-17 16:15:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('963', '0x0473', '1', '4', '下行输入功率过功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('964', '0x08007008', '3', '4', '下行输入功率过功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:16:49', '2015-10-17 16:16:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('965', '0x0474', '1', '4', '下行输出功率欠功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('966', '0x00000474', '3', '4', '下行输出功率欠功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('967', '0x0475', '1', '4', '下行输出功率过功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('968', '0x00000475', '3', '4', '下行输出功率过功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('969', '0x0476', '1', '4', '上行输出功率过功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('970', '0x00000476', '3', '4', '上行输出功率过功率门限(通道3)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('971', '0x0477', '1', '4', '下行驻波比门限(通道3)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('972', '0x00000477', '3', '4', '下行驻波比门限(通道3)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('973', '0x0478', '1', '4', '下行输入功率欠功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('974', '0x08008007', '3', '4', '下行输入功率欠功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:15:27', '2015-10-17 16:15:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('975', '0x0479', '1', '4', '下行输入功率过功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('976', '0x08008008', '3', '4', '下行输入功率过功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 16:17:10', '2015-10-17 16:17:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('977', '0x047A', '1', '4', '下行输出功率欠功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('978', '0x0000047A', '3', '4', '下行输出功率欠功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('979', '0x047B', '1', '4', '下行输出功率过功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('980', '0x0000047B', '3', '4', '下行输出功率过功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('981', '0x047C', '1', '4', '上行输出功率过功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('982', '0x0000047C', '3', '4', '上行输出功率过功率门限(通道4)', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('983', '0x047D', '1', '4', '下行驻波比门限(通道4)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('984', '0x0000047D', '3', '4', '下行驻波比门限(通道4)', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('985', '0x0480', '1', '4', '下行输入功率欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('986', '0x00000480', '3', '4', '下行输入功率欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('987', '0x0481', '1', '4', '下行输入功率过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('988', '0x00000481', '3', '4', '下行输入功率过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('989', '0x0482', '1', '4', '下行输出功率欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('990', '0x00000482', '3', '4', '下行输出功率欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('991', '0x0483', '1', '4', '下行输出功率过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('992', '0x00000483', '3', '4', '下行输出功率过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('993', '0x0484', '1', '4', '上行输出功率过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('994', '0x00000484', '3', '4', '上行输出功率过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('995', '0x0485', '1', '4', '上行输出欠功率告警门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('996', '0x00000485', '3', '4', '上行输出欠功率告警门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('997', '0x0486', '1', '4', '上行驻波比门限', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('998', '0x00000486', '3', '4', '上行驻波比门限', 'rw', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('999', '0x0488', '1', '4', '下行输入功率欠功率门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1000', '0x00000488', '3', '4', '下行输入功率欠功率门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1001', '0x0489', '1', '4', '下行输入功率欠功率门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1002', '0x00000489', '3', '4', '下行输入功率欠功率门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1003', '0x048A', '1', '4', '下行输入功率欠功率门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1004', '0x0000048A', '3', '4', '下行输入功率欠功率门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1005', '0x048B', '1', '4', '下行输入功率欠功率门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1006', '0x0000048B', '3', '4', '下行输入功率欠功率门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1007', '0x048C', '1', '4', '下行输入功率过功率门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1008', '0x0000048C', '3', '4', '下行输入功率过功率门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1009', '0x048D', '1', '4', '下行输入功率过功率门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1010', '0x0000048D', '3', '4', '下行输入功率过功率门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1011', '0x048E', '1', '4', '下行输入功率过功率门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1012', '0x0000048E', '3', '4', '下行输入功率过功率门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1013', '0x048F', '1', '4', '下行输入功率过功率门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1014', '0x0000048F', '3', '4', '下行输入功率过功率门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1015', '0x0490', '1', '4', '下行输出功率欠功率门限(通道1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:36:46', '2015-10-17 16:36:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1017', '0x0491', '1', '4', '下行输出功率欠功率门限(通道2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:38:35', '2015-10-17 16:38:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1018', '0x08004009', '3', '4', '下行输出功率欠功率门限(通道2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:39:48', '2015-10-17 16:39:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1019', '0x0492', '1', '4', '下行输出功率欠功率门限(通道3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:40:05', '2015-10-17 16:40:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1020', '0x08007009', '3', '4', '下行输出功率欠功率门限(通道3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:41:26', '2015-10-17 16:41:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1021', '0x0493', '1', '4', '下行输出功率欠功率门限(通道4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:42:17', '2015-10-17 16:42:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1022', '0x08008009', '3', '4', '下行输出功率欠功率门限(通道4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:42:11', '2015-10-17 16:42:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1023', '0x0494', '1', '4', '下行输出功率过功率门限(通道1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:42:31', '2015-10-17 16:42:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1024', '0x00800100A', '3', '4', '下行输出功率过功率门限(通道1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:43:12', '2015-10-17 16:43:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1025', '0x0495', '1', '4', '下行输出功率过功率门限(通道2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:44:29', '2015-10-17 16:44:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1026', '0x0800400A', '3', '4', '下行输出功率过功率门限(通道2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:44:43', '2015-10-17 16:44:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1027', '0x0496', '1', '4', '下行输出功率过功率门限(通道3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:44:56', '2015-10-17 16:44:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1028', '0x0800700A', '3', '4', '下行输出功率过功率门限(通道3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:45:15', '2015-10-17 16:45:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1029', '0x0497', '1', '4', '下行输出功率过功率门限(通道4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:45:27', '2015-10-17 16:45:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1030', '0x0800800A', '3', '4', '下行输出功率过功率门限(通道4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:46:43', '2015-10-17 16:46:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1031', '0x0498', '1', '4', '上行输出功率过功率门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1032', '0x00000498', '3', '4', '上行输出功率过功率门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1033', '0x0499', '1', '4', '上行输出功率过功率门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1034', '0x00000499', '3', '4', '上行输出功率过功率门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1035', '0x049A', '1', '4', '上行输出功率过功率门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1036', '0x0000049A', '3', '4', '上行输出功率过功率门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1037', '0x049B', '1', '4', '上行输出功率过功率门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1038', '0x0000049B', '3', '4', '上行输出功率过功率门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1039', '0x049C', '1', '4', '上行输出欠功率告警门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1040', '0x0000049C', '3', '4', '上行输出欠功率告警门限(通道1)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1041', '0x049D', '1', '4', '上行输出欠功率告警门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1042', '0x0000049D', '3', '4', '上行输出欠功率告警门限(通道2)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1043', '0x049E', '1', '4', '上行输出欠功率告警门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1044', '0x0000049E', '3', '4', '上行输出欠功率告警门限(通道3)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1045', '0x049F', '1', '4', '上行输出欠功率告警门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1046', '0x0000049F', '3', '4', '上行输出欠功率告警门限(通道4)', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1047', '0x04A0', '1', '4', '检波AGC', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '0', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1048', '0x000004A0', '3', '4', '检波AGC', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '0', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1049', '0x04A1', '1', '4', '上行起控点', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1050', '0x000004A1', '3', '4', '上行起控点', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1051', '0x04A2', '1', '4', '上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1052', '0x000004A2', '3', '4', '上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1053', '0x04A3', '1', '4', '上行增益温度补偿x', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1054', '0x000004A3', '3', '4', '上行增益温度补偿x', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1055', '0x04A4', '1', '4', '上行增益温度补偿a', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1056', '0x000004A4', '3', '4', '上行增益温度补偿a', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1057', '0x04A5', '1', '4', '上行增益温度补偿b', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1058', '0x000004A5', '3', '4', '上行增益温度补偿b', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1059', '0x04A6', '1', '4', 'uAtt1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1060', '0x000004A6', '3', '4', 'uAtt1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1061', '0x04A7', '1', '4', 'uAtt2', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1062', '0x000004A7', '3', '4', 'uAtt2', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1063', '0x04A8', '1', '4', '上行射频开关', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1064', '0x000004A8', '3', '4', '上行射频开关', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1065', '0x04A9', '1', '4', '上行输入功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1066', '0x000004A9', '3', '4', '上行输入功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1067', '0x04AA', '1', '4', '上行输入功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1068', '0x000004AA', '3', '4', '上行输入功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1069', '0x04AB', '1', '4', '上行输出功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1070', '0x000004AB', '3', '4', '上行输出功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1071', '0x04AD', '1', '4', '上行设定增益', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1072', '0x000004AD', '3', '4', '上行设定增益', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1073', '0x04AE', '1', '4', '上行低噪电流告警上限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1074', '0x000004AE', '3', '4', '上行低噪电流告警上限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1075', '0x04AF', '1', '4', '上行低噪电流告警下限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1076', '0x000004AF', '3', '4', '上行低噪电流告警下限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1077', '0x04B0', '1', '4', '下行起控点', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1078', '0x000004B0', '3', '4', '下行起控点', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1079', '0x04B1', '1', '4', '下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1080', '0x000004B1', '3', '4', '下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1081', '0x04B2', '1', '4', '下行增益温度补偿x', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1082', '0x000004B2', '3', '4', '下行增益温度补偿x', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1083', '0x04B3', '1', '4', '下行增益温度补偿a', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1084', '0x000004B3', '3', '4', '下行增益温度补偿a', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1085', '0x04B4', '1', '4', '下行增益温度补偿b', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1086', '0x000004B4', '3', '4', '下行增益温度补偿b', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1087', '0x04B5', '1', '4', 'dAtt1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1088', '0x000004B5', '3', '4', 'dAtt1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1089', '0x04B6', '1', '4', 'dAtt2', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1090', '0x000004B6', '3', '4', 'dAtt2', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1091', '0x04B7', '1', '4', '下行射频开关', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1092', '0x000004B7', '3', '4', '下行射频开关', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1093', '0x04B8', '1', '4', '下行输入功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1094', '0x000004B8', '3', '4', '下行输入功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1095', '0x04B9', '1', '4', '下行输入功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1096', '0x000004B9', '3', '4', '下行输入功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1097', '0x04BA', '1', '4', '下行设定增益', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1098', '0x000004BA', '3', '4', '下行设定增益', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1099', '0x04BB', '1', '4', '下行功放电流告警上限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1100', '0x000004BB', '3', '4', '下行功放电流告警上限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1101', '0x04BC', '1', '4', '下行功放电流告警下限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1102', '0x000004BC', '3', '4', '下行功放电流告警下限', 'rw', 'none', '10', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1103', '0x04BD', '1', '4', '下行输出功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1104', '0x000004BD', '3', '4', '下行输出功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1105', '0x04BE', '1', '4', '下行输出功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1106', '0x000004BE', '3', '4', '下行输出功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1107', '0x04BF', '1', '4', '下行输出反射功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1108', '0x000004BF', '3', '4', '下行输出反射功率电平系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1109', '0x04C0', '1', '4', '下行输出反射功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1110', '0x000004C0', '3', '4', '下行输出反射功率电平系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1111', '0x04C1', '1', '4', '上行电流系数', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1112', '0x000004C1', '3', '4', '上行电流系数', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1113', '0x04C2', '1', '4', '下行电流系数', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1114', '0x000004C2', '3', '4', '下行电流系数', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1115', '0x04C3', '1', '4', '远程功率开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1116', '0x000004C3', '3', '4', '远程功率开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1117', '0x04C4', '1', '4', '时隙比', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1118', '0x000004C4', '3', '4', '时隙比', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1119', '0x04C5', '1', '4', 'TD第一转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1120', '0x000004C5', '3', '4', 'TD第一转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1121', '0x04C6', '1', '4', 'TD第二转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1122', '0x000004C6', '3', '4', 'TD第二转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1123', '0x04C7', '1', '4', '检波衰减偏移量', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1124', '0x000004C7', '3', '4', '检波衰减偏移量', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1125', '0x04C8', '1', '4', '检波灵敏度', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1126', '0x000004C8', '3', '4', '检波灵敏度', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1127', '0x04C9', '1', '4', '上行数控增益', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1128', '0x000004C9', '3', '4', '上行数控增益', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1129', '0x04CA', '1', '4', '下行数控增益', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1130', '0x000004CA', '3', '4', '下行数控增益', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1131', '0x04CB', '1', '4', '模块地址', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1132', '0x000004CB', '3', '4', '模块地址', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1133', '0x04CC', '1', '4', '上行衰减(自定义)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1134', '0x000004CC', '3', '4', '上行衰减(自定义)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1135', '0x04CD', '1', '4', '下行衰减(自定义)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1136', '0x000004CD', '3', '4', '下行衰减(自定义)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1137', '0x04CE', '1', '4', '上行理论增益', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1138', '0x000004CE', '3', '4', '上行理论增益', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1139', '0x04CF', '1', '4', '低噪输入欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1140', '0x000004CF', '3', '4', '低噪输入欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1141', '0x04D0', '1', '4', '温度系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1142', '0x000004D0', '3', '4', '温度系数a', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1143', '0x04D1', '1', '4', '温度系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1144', '0x000004D1', '3', '4', '温度系数b', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1145', '0x04D2', '1', '4', '时隙选择', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1146', '0x000004D2', '3', '4', '时隙选择', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1147', '0x04D3', '1', '4', '机箱温度告警门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1148', '0x000004D3', '3', '4', '机箱温度告警门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1149', '0x04D4', '1', '4', '功放偏置电压1', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1150', '0x000004D4', '3', '4', '功放偏置电压1', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1151', '0x04D5', '1', '4', '功放偏置电压2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1152', '0x000004D5', '3', '4', '功放偏置电压2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1153', '0x04D6', '1', '4', '时隙控制方式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1154', '0x000004D6', '3', '4', '时隙控制方式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1155', '0x04D7', '1', '4', '监控方式标志', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1156', '0x000004D7', '3', '4', '监控方式标志', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1157', '0x04D8', '1', '4', '上行输入功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1158', '0x000004D8', '3', '4', '上行输入功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1159', '0x04D9', '1', '4', '上行输入功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1160', '0x000004D9', '3', '4', '上行输入功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1161', '0x04DA', '1', '4', '上行输入功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1162', '0x000004DA', '3', '4', '上行输入功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1163', '0x04DB', '1', '4', '上行输入功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1164', '0x000004DB', '3', '4', '上行输入功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1165', '0x04DC', '1', '4', '上行输入功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1166', '0x000004DC', '3', '4', '上行输入功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1167', '0x04DD', '1', '4', '上行输入功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1168', '0x000004DD', '3', '4', '上行输入功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1169', '0x04DE', '1', '4', '上行输入功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1170', '0x000004DE', '3', '4', '上行输入功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1171', '0x04DF', '1', '4', '上行输入功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1172', '0x000004DF', '3', '4', '上行输入功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1173', '0x04E0', '1', '4', '上行输出功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1174', '0x000004E0', '3', '4', '上行输出功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1175', '0x04E1', '1', '4', '上行输出功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1176', '0x000004E1', '3', '4', '上行输出功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1177', '0x04E2', '1', '4', '上行输出功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1178', '0x000004E2', '3', '4', '上行输出功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1179', '0x04E3', '1', '4', '上行输出功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1180', '0x000004E3', '3', '4', '上行输出功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1181', '0x04E4', '1', '4', '上行输出功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1182', '0x000004E4', '3', '4', '上行输出功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1183', '0x04E5', '1', '4', '上行输出功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1184', '0x000004E5', '3', '4', '上行输出功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1185', '0x04E6', '1', '4', '上行输出功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1186', '0x000004E6', '3', '4', '上行输出功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1187', '0x04E7', '1', '4', '上行输出功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1188', '0x000004E7', '3', '4', '上行输出功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1189', '0x04E8', '1', '4', '下行输入功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1190', '0x000004E8', '3', '4', '下行输入功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1191', '0x04E9', '1', '4', '下行输入功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1192', '0x000004E9', '3', '4', '下行输入功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1193', '0x04EA', '1', '4', '下行输入功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1194', '0x000004EA', '3', '4', '下行输入功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1195', '0x04EB', '1', '4', '下行输入功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1196', '0x000004EB', '3', '4', '下行输入功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1197', '0x04EC', '1', '4', '下行输入功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1198', '0x000004EC', '3', '4', '下行输入功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1199', '0x04ED', '1', '4', '下行输入功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1200', '0x000004ED', '3', '4', '下行输入功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1201', '0x04EE', '1', '4', '下行输入功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1202', '0x000004EE', '3', '4', '下行输入功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1203', '0x04EF', '1', '4', '下行输入功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1204', '0x000004EF', '3', '4', '下行输入功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1205', '0x04F0', '1', '4', '下行输出功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1206', '0x000004F0', '3', '4', '下行输出功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1207', '0x04F1', '1', '4', '下行输出功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1208', '0x000004F1', '3', '4', '下行输出功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1209', '0x04F2', '1', '4', '下行输出功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1210', '0x000004F2', '3', '4', '下行输出功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1211', '0x04F3', '1', '4', '下行输出功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1212', '0x000004F3', '3', '4', '下行输出功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1213', '0x04F4', '1', '4', '下行输出功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1214', '0x000004F4', '3', '4', '下行输出功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1215', '0x04F5', '1', '4', '下行输出功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1216', '0x000004F5', '3', '4', '下行输出功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1217', '0x04F6', '1', '4', '下行输出功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1218', '0x000004F6', '3', '4', '下行输出功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1219', '0x04F7', '1', '4', '下行输出功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1220', '0x000004F7', '3', '4', '下行输出功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1221', '0x04F8', '1', '4', '下行输出反射功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1222', '0x000004F8', '3', '4', '下行输出反射功率电平系数b(时隙0)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1223', '0x04F9', '1', '4', '下行输出反射功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1224', '0x000004F9', '3', '4', '下行输出反射功率电平系数b(时隙1)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1225', '0x04FA', '1', '4', '下行输出反射功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1226', '0x000004FA', '3', '4', '下行输出反射功率电平系数b(时隙2)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1227', '0x04FB', '1', '4', '下行输出反射功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1228', '0x000004FB', '3', '4', '下行输出反射功率电平系数b(时隙3)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1229', '0x04FC', '1', '4', '下行输出反射功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1230', '0x000004FC', '3', '4', '下行输出反射功率电平系数b(时隙4)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1231', '0x04FD', '1', '4', '下行输出反射功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1232', '0x000004FD', '3', '4', '下行输出反射功率电平系数b(时隙5)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1233', '0x04FE', '1', '4', '下行输出反射功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1234', '0x000004FE', '3', '4', '下行输出反射功率电平系数b(时隙6)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1235', '0x04FF', '1', '4', '下行输出反射功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1236', '0x000004FF', '3', '4', '下行输出反射功率电平系数b(导频)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1237', '0x0501', '1', '4', '功放温度值', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1238', '0x00000501', '3', '4', '功放温度值', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1239', '0x0502', '1', '4', '下行输入功率电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1240', '0x00000502', '3', '4', '下行输入功率电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1241', '0x0503', '1', '4', '下行输出功率电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1242', '0x00000503', '3', '4', '下行输出功率电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1243', '0x0504', '1', '4', '上行理论增益', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1244', '0x00000504', '3', '4', '上行理论增益', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1245', '0x0505', '1', '4', '下行实际增益', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1246', '0x00000505', '3', '4', '下行实际增益', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1247', '0x0506', '1', '4', '下行驻波比值', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1248', '0x00000506', '3', '4', '下行驻波比值', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1249', '0x0507', '1', '4', '信源信息：运营商代码', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1250', '0x00000507', '3', '4', '信源信息：运营商代码', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1251', '0x0508', '1', '4', '信源信息：位置区编码', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1252', '0x00000508', '3', '4', '信源信息：位置区编码', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1253', '0x0509', '1', '4', '信源信息：基站识别码', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1254', '0x00000509', '3', '4', '信源信息：基站识别码', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1255', '0x050A', '1', '4', '信源信息：BCCH绝对载频号', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1256', '0x0000050A', '3', '4', '信源信息：BCCH绝对载频号', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1257', '0x050B', '1', '4', '信源信息：BCCH接收电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1258', '0x0000050B', '3', '4', '信源信息：BCCH接收电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1259', '0x050C', '1', '4', '信源信息：小区识别码实时值', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1260', '0x0000050C', '3', '4', '信源信息：小区识别码实时值', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1261', '0x050D', '1', '4', '上行输出功率电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1262', '0x0000050D', '3', '4', '上行输出功率电平', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1263', '0x050E', '1', '4', '光收功率', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1264', '0x0000050E', '3', '4', '光收功率', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1265', '0x050F', '1', '4', '光发功率', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1266', '0x0000050F', '3', '4', '光发功率', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1267', '0x0510', '1', '4', '下行输入功率电平(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1268', '0x00000510', '3', '4', '下行输入功率电平(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1269', '0x0511', '1', '4', '下行输出功率电平(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1270', '0x00000511', '3', '4', '下行输出功率电平(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1271', '0x0512', '1', '4', '上行理论增益(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1272', '0x00000512', '3', '4', '上行理论增益(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1273', '0x0513', '1', '4', '下行实际增益(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1274', '0x00000513', '3', '4', '下行实际增益(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1275', '0x0514', '1', '4', '上行输出功率电平(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1276', '0x00000514', '3', '4', '上行输出功率电平(通道1)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1277', '0x0515', '1', '4', '下行驻波比值(通道1)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1278', '0x00000515', '3', '4', '下行驻波比值(通道1)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1279', '0x0516', '1', '4', '下行输入功率电平(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1280', '0x00000516', '3', '4', '下行输入功率电平(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1281', '0x0517', '1', '4', '下行输出功率电平(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1282', '0x00000517', '3', '4', '下行输出功率电平(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1283', '0x0518', '1', '4', '上行理论增益(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1284', '0x00000518', '3', '4', '上行理论增益(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1285', '0x0519', '1', '4', '下行实际增益(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1286', '0x00000519', '3', '4', '下行实际增益(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1287', '0x051A', '1', '4', '上行输出功率电平(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1288', '0x0000051A', '3', '4', '上行输出功率电平(通道2)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1289', '0x051B', '1', '4', '下行驻波比值(通道2)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1290', '0x0000051B', '3', '4', '下行驻波比值(通道2)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1291', '0x051C', '1', '4', '下行输入功率电平(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1292', '0x0000051C', '3', '4', '下行输入功率电平(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1293', '0x051D', '1', '4', '下行输出功率电平(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1294', '0x0000051D', '3', '4', '下行输出功率电平(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1295', '0x051E', '1', '4', '上行理论增益(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1296', '0x0000051E', '3', '4', '上行理论增益(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1297', '0x051F', '1', '4', '下行实际增益(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1298', '0x0000051F', '3', '4', '下行实际增益(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1299', '0x0520', '1', '4', '上行输出功率电平(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1300', '0x00000520', '3', '4', '上行输出功率电平(通道3)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1301', '0x0521', '1', '4', '下行驻波比值(通道3)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1302', '0x00000521', '3', '4', '下行驻波比值(通道3)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1303', '0x0522', '1', '4', '下行输入功率电平(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1304', '0x00000522', '3', '4', '下行输入功率电平(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1305', '0x0523', '1', '4', '下行输出功率电平(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1306', '0x00000523', '3', '4', '下行输出功率电平(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1307', '0x0524', '1', '4', '上行理论增益(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1308', '0x00000524', '3', '4', '上行理论增益(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1309', '0x0525', '1', '4', '下行实际增益(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1310', '0x00000525', '3', '4', '下行实际增益(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1311', '0x0526', '1', '4', '上行输出功率电平(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1312', '0x00000526', '3', '4', '上行输出功率电平(通道4)', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1313', '0x0527', '1', '4', '下行驻波比值(通道4)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1314', '0x00000527', '3', '4', '下行驻波比值(通道4)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1315', '0x0528', '1', '4', '上行信号旁路状态', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1316', '0x00000528', '3', '4', '上行信号旁路状态', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1317', '0x0529', '1', '4', '下行信号旁路状态', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1318', '0x00000529', '3', '4', '下行信号旁路状态', 'ro', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1319', '0x0530', '1', '4', '下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1320', '0x00000530', '3', '4', '下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1321', '0x0531', '1', '4', '下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1322', '0x00000531', '3', '4', '下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1323', '0x0532', '1', '4', '上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1324', '0x00000532', '3', '4', '上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1325', '0x0534', '1', '5', '下行输入功率电平(通道1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:26:18', '2015-10-17 16:26:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1326', '0x08001001', '3', '5', '下行输入功率电平(通道1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:25:37', '2015-10-17 16:25:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1327', '0x0535', '1', '5', '下行输入功率电平(通道2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:26:31', '2015-10-17 16:26:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1328', '0x08004001', '3', '5', '下行输入功率电平(通道2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:25:58', '2015-10-17 16:25:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1329', '0x0536', '1', '5', '下行输入功率电平(通道3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:26:46', '2015-10-17 16:26:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1330', '0x08007001', '3', '5', '下行输入功率电平(通道3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:28:08', '2015-10-17 16:28:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1331', '0x0537', '1', '4', '下行输入功率电平(通道4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1332', '0x08008001', '3', '5', '下行输入功率电平(通道4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 16:28:16', '2015-10-17 16:28:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1333', '0x0538', '1', '4', '下行输出功率电平(通道1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1334', '0x00000538', '3', '4', '下行输出功率电平(通道1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1335', '0x0539', '1', '4', '下行输出功率电平(通道2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1336', '0x00000539', '3', '4', '下行输出功率电平(通道2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1337', '0x053A', '1', '4', '下行输出功率电平(通道3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1338', '0x0000053A', '3', '4', '下行输出功率电平(通道3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1339', '0x053B', '1', '4', '下行输出功率电平(通道4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1340', '0x0000053B', '3', '4', '下行输出功率电平(通道4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1341', '0x053C', '1', '4', '上行输出功率电平(通道1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1342', '0x0000053C', '3', '4', '上行输出功率电平(通道1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1343', '0x053D', '1', '4', '上行输出功率电平(通道2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1344', '0x0000053D', '3', '4', '上行输出功率电平(通道2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1345', '0x053E', '1', '4', '上行输出功率电平(通道3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1346', '0x0000053E', '3', '4', '上行输出功率电平(通道3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1347', '0x053F', '1', '4', '上行输出功率电平(通道4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1348', '0x0000053F', '3', '4', '上行输出功率电平(通道4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1349', '0x0550', '1', '4', '下行输入导频功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1350', '0x00000550', '3', '4', '下行输入导频功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1351', '0x0551', '1', '4', '下行输出导频功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1352', '0x00000551', '3', '4', '下行输出导频功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1353', '0x0560', '1', '4', '上行驻波比值(通道1)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1354', '0x00000560', '3', '4', '上行驻波比值(通道1)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1355', '0x0561', '1', '4', '上行驻波比值(通道2)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1356', '0x00000561', '3', '4', '上行驻波比值(通道2)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1357', '0x0562', '1', '4', '上行驻波比值(通道3)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1358', '0x00000562', '3', '4', '上行驻波比值(通道3)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1359', '0x0563', '1', '4', '上行驻波比值(通道4)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1360', '0x00000563', '3', '4', '上行驻波比值(通道4)', 'ro', 'none', '10', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1361', '0x0564', '1', '4', '常规系数0下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1362', '0x00000564', '3', '4', '常规系数0下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1363', '0x0565', '1', '4', '常规系数2下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1364', '0x00000565', '3', '4', '常规系数2下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1365', '0x0566', '1', '4', '常规系数3下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1366', '0x00000566', '3', '4', '常规系数3下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1367', '0x0567', '1', '4', '常规系数4下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1368', '0x00000567', '3', '4', '常规系数4下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1369', '0x0568', '1', '4', '常规系数5下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1370', '0x00000568', '3', '4', '常规系数5下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1371', '0x0569', '1', '4', '常规系数6下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1372', '0x00000569', '3', '4', '常规系数6下行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1373', '0x056A', '1', '4', '常规系数0下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1374', '0x0000056A', '3', '4', '常规系数0下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1375', '0x056B', '1', '4', '常规系数2下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1376', '0x0000056B', '3', '4', '常规系数2下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1377', '0x056C', '1', '4', '常规系数3下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1378', '0x0000056C', '3', '4', '常规系数3下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1379', '0x056D', '1', '4', '常规系数4下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1380', '0x0000056D', '3', '4', '常规系数4下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1381', '0x056E', '1', '4', '常规系数5下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1382', '0x0000056E', '3', '4', '常规系数5下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1383', '0x056F', '1', '4', '常规系数6下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1384', '0x0000056F', '3', '4', '常规系数6下行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1385', '0x0570', '1', '4', '常规系数1上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1386', '0x00000570', '3', '4', '常规系数1上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1387', '0x0571', '1', '4', '常规系数2上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1388', '0x00000571', '3', '4', '常规系数2上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1389', '0x0572', '1', '4', '常规系数3上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1390', '0x00000572', '3', '4', '常规系数3上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1391', '0x0573', '1', '4', '常规系数4上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1392', '0x00000573', '3', '4', '常规系数4上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1393', '0x0574', '1', '4', '常规系数5上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1394', '0x00000574', '3', '4', '常规系数5上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1395', '0x0575', '1', '4', '常规系数6上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1396', '0x00000575', '3', '4', '常规系数6上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1397', '0x05A1', '1', '4', '上行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1398', '0x000005A1', '3', '4', '上行输入功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1399', '0x05A2', '1', '4', '上行电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1400', '0x000005A2', '3', '4', '上行电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1401', '0x05A3', '1', '4', '下行电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1402', '0x000005A3', '3', '4', '下行电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1403', '0x05A4', '1', '4', '下行输出功率反射电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1404', '0x000005A4', '3', '4', '下行输出功率反射电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1405', '0x05A5', '1', '4', '下行输出驻波', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1406', '0x000005A5', '3', '4', '下行输出驻波', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1407', '0x05A6', '1', '4', '整机温度', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1408', '0x000005A6', '3', '4', '整机温度', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1409', '0x05A7', '1', '4', '整机增益', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1410', '0x000005A7', '3', '4', '整机增益', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1411', '0x05A8', '1', '4', '历史记录', 'ro', 'none', '1', 'dstr', '7', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('1412', '0x000005A8', '3', '4', '历史记录', 'ro', 'none', '1', 'dstr', '7', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('1413', '0x05A9', '1', '4', '模块数量', 'ro', 'none', '1', 'uint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1414', '0x000005A9', '3', '4', '模块数量', 'ro', 'none', '1', 'uint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1415', '0x05AA', '1', '4', '27V电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1416', '0x000005AA', '3', '4', '27V电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1417', '0x05AB', '1', '4', '5.7V电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1418', '0x000005AB', '3', '4', '5.7V电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1419', '0x05AC', '1', '4', '电池电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1420', '0x000005AC', '3', '4', '电池电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1421', '0x05B0', '1', '4', '上行输出功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1422', '0x000005B0', '3', '4', '上行输出功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1423', '0x05B1', '1', '4', '上行输出功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1424', '0x000005B1', '3', '4', '上行输出功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1425', '0x05B2', '1', '4', '上行输出功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1426', '0x000005B2', '3', '4', '上行输出功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1427', '0x05B3', '1', '4', '上行输出功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1428', '0x000005B3', '3', '4', '上行输出功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1429', '0x05B4', '1', '4', '上行输出功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1430', '0x000005B4', '3', '4', '上行输出功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1431', '0x05B5', '1', '4', '上行输出功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1432', '0x000005B5', '3', '4', '上行输出功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1433', '0x05B6', '1', '4', '上行输出功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1434', '0x000005B6', '3', '4', '上行输出功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1435', '0x05B7', '1', '4', '上行输出功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1436', '0x000005B7', '3', '4', '上行输出功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1437', '0x05B8', '1', '4', '下行输入功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1438', '0x000005B8', '3', '4', '下行输入功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1439', '0x05B9', '1', '4', '下行输入功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1440', '0x000005B9', '3', '4', '下行输入功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1441', '0x05BA', '1', '4', '下行输入功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1442', '0x000005BA', '3', '4', '下行输入功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1443', '0x05BB', '1', '4', '下行输入功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1444', '0x000005BB', '3', '4', '下行输入功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1445', '0x05BC', '1', '4', '下行输入功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1446', '0x000005BC', '3', '4', '下行输入功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1447', '0x05BD', '1', '4', '下行输入功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1448', '0x000005BD', '3', '4', '下行输入功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1449', '0x05BE', '1', '4', '下行输入功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1450', '0x000005BE', '3', '4', '下行输入功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1451', '0x05BF', '1', '4', '下行输入功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1452', '0x000005BF', '3', '4', '下行输入功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1453', '0x05C0', '1', '4', '下行输出功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1454', '0x000005C0', '3', '4', '下行输出功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1455', '0x05C1', '1', '4', '下行输出功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1456', '0x000005C1', '3', '4', '下行输出功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1457', '0x05C2', '1', '4', '下行输出功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1458', '0x000005C2', '3', '4', '下行输出功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1459', '0x05C3', '1', '4', '下行输出功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1460', '0x000005C3', '3', '4', '下行输出功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1461', '0x05C4', '1', '4', '下行输出功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1462', '0x000005C4', '3', '4', '下行输出功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1463', '0x05C5', '1', '4', '下行输出功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1464', '0x000005C5', '3', '4', '下行输出功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1465', '0x05C6', '1', '4', '下行输出功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1466', '0x000005C6', '3', '4', '下行输出功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1467', '0x05C7', '1', '4', '下行输出功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1468', '0x000005C7', '3', '4', '下行输出功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1469', '0x05C8', '1', '4', '下行输出反射功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1470', '0x000005C8', '3', '4', '下行输出反射功率电平(时隙0)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1471', '0x05C9', '1', '4', '下行输出反射功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1472', '0x000005C9', '3', '4', '下行输出反射功率电平(时隙1)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1473', '0x05CA', '1', '4', '下行输出反射功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1474', '0x000005CA', '3', '4', '下行输出反射功率电平(时隙2)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1475', '0x05CB', '1', '4', '下行输出反射功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1476', '0x000005CB', '3', '4', '下行输出反射功率电平(时隙3)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1477', '0x05CC', '1', '4', '下行输出反射功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1478', '0x000005CC', '3', '4', '下行输出反射功率电平(时隙4)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1479', '0x05CD', '1', '4', '下行输出反射功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1480', '0x000005CD', '3', '4', '下行输出反射功率电平(时隙5)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1481', '0x05CE', '1', '4', '下行输出反射功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1482', '0x000005CE', '3', '4', '下行输出反射功率电平(时隙6)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1483', '0x05CF', '1', '4', '下行输出反射功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1484', '0x000005CF', '3', '4', '下行输出反射功率电平(导频)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1485', '0x05D0', '1', '4', '上行输入功率电平(时隙0)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1486', '0x000005D0', '3', '4', '上行输入功率电平(时隙0)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1487', '0x05D1', '1', '4', '上行输入功率电平(时隙1)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1488', '0x000005D1', '3', '4', '上行输入功率电平(时隙1)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1489', '0x05D2', '1', '4', '上行输入功率电平(时隙2)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1490', '0x000005D2', '3', '4', '上行输入功率电平(时隙2)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1491', '0x05D3', '1', '4', '上行输入功率电平(时隙3)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1492', '0x000005D3', '3', '4', '上行输入功率电平(时隙3)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1493', '0x05D4', '1', '4', '上行输入功率电平(时隙4)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1494', '0x000005D4', '3', '4', '上行输入功率电平(时隙4)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1495', '0x05D5', '1', '4', '上行输入功率电平(时隙5)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1496', '0x000005D5', '3', '4', '上行输入功率电平(时隙5)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1497', '0x05D6', '1', '4', '上行输入功率电平(时隙6)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1498', '0x000005D6', '3', '4', '上行输入功率电平(时隙6)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1499', '0x05D7', '1', '4', '上行输入功率电平(导频)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1500', '0x000005D7', '3', '4', '上行输入功率电平(导频)', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1501', '0x05D8', '1', '4', '下行导频反射功率', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1502', '0x000005D8', '3', '4', '下行导频反射功率', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1503', '0x05D9', '1', '4', '远端单元上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1504', '0x000005D9', '3', '4', '远端单元上行输出功率电平', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1505', '0x05DA', '1', '4', '远端单元下行输出功率电平1', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1506', '0x000005DA', '3', '4', '远端单元下行输出功率电平1', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1507', '0x05DB', '1', '4', '远端单元下行输出功率电平2', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1508', '0x000005DB', '3', '4', '远端单元下行输出功率电平2', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1509', '0x05E0', '1', '4', 'RAU端口1电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1510', '0x000005E0', '3', '4', 'RAU端口1电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1511', '0x05E1', '1', '4', 'RAU端口2电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1512', '0x000005E1', '3', '4', 'RAU端口2电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1513', '0x05E2', '1', '4', 'RAU端口3电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1514', '0x000005E2', '3', '4', 'RAU端口3电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1515', '0x05E3', '1', '4', 'RAU端口4电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1516', '0x000005E3', '3', '4', 'RAU端口4电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1517', '0x05E4', '1', '4', 'RAU端口5电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1518', '0x000005E4', '3', '4', 'RAU端口5电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1519', '0x05E5', '1', '4', 'RAU端口6电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1520', '0x000005E5', '3', '4', 'RAU端口6电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1521', '0x05E6', '1', '4', 'RAU端口7电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1522', '0x000005E6', '3', '4', 'RAU端口7电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1523', '0x05E7', '1', '4', 'RAU端口8电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1524', '0x000005E7', '3', '4', 'RAU端口8电流', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1525', '0x05E8', '1', '4', 'RAU端口1电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1526', '0x000005E8', '3', '4', 'RAU端口1电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1527', '0x05E9', '1', '4', 'RAU端口2电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1528', '0x000005E9', '3', '4', 'RAU端口2电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1529', '0x05EA', '1', '4', 'RAU端口3电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1530', '0x000005EA', '3', '4', 'RAU端口3电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1531', '0x05EB', '1', '4', 'RAU端口4电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1532', '0x000005EB', '3', '4', 'RAU端口4电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1533', '0x05EC', '1', '4', 'RAU端口5电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1534', '0x000005EC', '3', '4', 'RAU端口5电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1535', '0x05ED', '1', '4', 'RAU端口6电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1536', '0x000005ED', '3', '4', 'RAU端口6电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1537', '0x05EE', '1', '4', 'RAU端口7电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1538', '0x000005EE', '3', '4', 'RAU端口7电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1539', '0x05EF', '1', '4', 'RAU端口8电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1540', '0x000005EF', '3', '4', 'RAU端口8电压', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1541', '0x05F0', '1', '4', '上行收光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1542', '0x000005F0', '3', '4', '上行收光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1543', '0x05F1', '1', '4', '上行收光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1544', '0x000005F1', '3', '4', '上行收光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1545', '0x05F2', '1', '4', '上行收光管3电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1546', '0x000005F2', '3', '4', '上行收光管3电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1547', '0x05F3', '1', '4', '上行收光管4电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1548', '0x000005F3', '3', '4', '上行收光管4电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1549', '0x05F4', '1', '4', '上行收光管5电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1550', '0x000005F4', '3', '4', '上行收光管5电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1551', '0x05F5', '1', '4', '上行收光管6电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1552', '0x000005F5', '3', '4', '上行收光管6电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1553', '0x05F6', '1', '4', '上行收光管7电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1554', '0x000005F6', '3', '4', '上行收光管7电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1555', '0x05F7', '1', '4', '上行收光管8电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1556', '0x000005F7', '3', '4', '上行收光管8电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1557', '0x05F8', '1', '4', '下行收光管电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1558', '0x000005F8', '3', '4', '下行收光管电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1559', '0x05F9', '1', '4', '下行1发光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1560', '0x000005F9', '3', '4', '下行1发光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1561', '0x05FA', '1', '4', '下行1发光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1562', '0x000005FA', '3', '4', '下行1发光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1563', '0x05FB', '1', '4', '下行2发光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1564', '0x000005FB', '3', '4', '下行2发光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1565', '0x05FC', '1', '4', '下行2发光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1566', '0x000005FC', '3', '4', '下行2发光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1567', '0x05FD', '1', '4', '上行发光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1568', '0x000005FD', '3', '4', '上行发光管1电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1569', '0x05FE', '1', '4', '上行发光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1570', '0x000005FE', '3', '4', '上行发光管2电压uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1571', '0x0601', '1', '4', '批采开始时间', 'rw', 'none', '1', 'dstr', '7', '1', '255', '0', '255', '4', '0', '2015-09-09 01:34:48', '2015-09-09 01:34:48', 'text', 'paramOptionNone', 'dt');
INSERT INTO `device_param` VALUES ('1572', '0x00000601', '3', '1', '批采开始时间', 'rw', 'none', '1', 'dstr', '7', '1', '255', '0', '255', '4', '0', '2015-10-17 14:55:59', '2015-10-17 14:55:59', 'text', 'paramOptionNone', 'dt');
INSERT INTO `device_param` VALUES ('1573', '0x0602', '1', '4', '批采时长', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1574', '0x00000602', '3', '1', '批采时长', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:56:10', '2015-10-17 14:56:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1575', '0x0603', '1', '4', '批采对象', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1576', '0x00000603', '3', '1', '批采对象', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:56:20', '2015-10-17 14:56:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1577', '0x0604', '1', '4', '批采开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1578', '0x00000604', '3', '1', '批采开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:56:29', '2015-10-17 14:56:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1579', '0x0605', '1', '4', '批采状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1580', '0x00000605', '3', '1', '批采状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:56:42', '2015-10-17 14:56:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1581', '0x0606', '1', '4', '批采数据', 'ro', 'none', '1', 'uint1', '255', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1582', '0x00000606', '3', '1', '批采数据', 'ro', 'none', '1', 'uint1', '255', '1', '255', '0', '255', '4', '0', '2015-10-17 14:56:52', '2015-10-17 14:56:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1583', '0x0607', '1', '4', '批采数据每组长度', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1584', '0x00000607', '3', '1', '批采数据每组长度', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:57:06', '2015-10-17 14:57:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1585', '0x0610', '1', '4', 'TD-SCDMA帧第二时隙切换点', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1586', '0x00000610', '3', '4', 'TD-SCDMA帧第二时隙切换点', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1587', '0x0611', '1', '4', 'TD-SCDMA帧同步载波信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1588', '0x00000611', '3', '4', 'TD-SCDMA帧同步载波信道号', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1589', '0x0612', '1', '4', 'TD-SCDMA帧同步开启门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1590', '0x00000612', '3', '4', 'TD-SCDMA帧同步开启门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1591', '0x0613', '1', '4', 'TD-SCDMA帧同步关闭门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1592', '0x00000613', '3', '4', 'TD-SCDMA帧同步关闭门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1593', '0x0620', '1', '4', '下行输入导频欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1594', '0x00000620', '3', '4', '下行输入导频欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1595', '0x0621', '1', '4', '下行输入导频过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1596', '0x00000621', '3', '4', '下行输入导频过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1597', '0x0622', '1', '4', '下行输出导频欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1598', '0x00000622', '3', '4', '下行输出导频欠功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1599', '0x0623', '1', '4', '下行输出导频过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1600', '0x00000623', '3', '4', '下行输出导频过功率门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1601', '0x0624', '1', '4', '常规时隙0衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1602', '0x00000624', '3', '4', '常规时隙0衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1603', '0x0625', '1', '4', '常规时隙1衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1604', '0x00000625', '3', '4', '常规时隙1衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1605', '0x0626', '1', '4', '常规时隙2衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1606', '0x00000626', '3', '4', '常规时隙2衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1607', '0x0627', '1', '4', '常规时隙3衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1608', '0x00000627', '3', '4', '常规时隙3衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1609', '0x0628', '1', '4', '常规时隙4衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1610', '0x00000628', '3', '4', '常规时隙4衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1611', '0x0629', '1', '4', '常规时隙5衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1612', '0x00000629', '3', '4', '常规时隙5衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1613', '0x062A', '1', '4', '常规时隙6衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1614', '0x0000062A', '3', '4', '常规时隙6衰减', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1615', '0x062B', '1', '4', '上行导频时隙衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1616', '0x0000062B', '3', '4', '上行导频时隙衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1617', '0x062C', '1', '4', '下行导频时隙衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1618', '0x0000062C', '3', '4', '下行导频时隙衰减值', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1619', '0x06A0', '1', '4', '上行光纤链路衰减1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1620', '0x000006A0', '3', '4', '上行光纤链路衰减1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1621', '0x06A1', '1', '4', '上行光纤链路衰减2', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1622', '0x000006A1', '3', '4', '上行光纤链路衰减2', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1623', '0x06A2', '1', '4', '上行光纤链路衰减3', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1624', '0x000006A2', '3', '4', '上行光纤链路衰减3', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1625', '0x06A3', '1', '4', '上行光纤链路衰减4', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1626', '0x000006A3', '3', '4', '上行光纤链路衰减4', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1627', '0x06A4', '1', '4', '上行光纤链路衰减5', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1628', '0x000006A4', '3', '4', '上行光纤链路衰减5', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1629', '0x06A5', '1', '4', '上行光纤链路衰减6', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1630', '0x000006A5', '3', '4', '上行光纤链路衰减6', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1631', '0x06A6', '1', '4', '上行光纤链路衰减7', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1632', '0x000006A6', '3', '4', '上行光纤链路衰减7', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1633', '0x06A7', '1', '4', '上行光纤链路衰减8', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1634', '0x000006A7', '3', '4', '上行光纤链路衰减8', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1635', '0x06A8', '1', '4', '端口1设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1636', '0x000006A8', '3', '4', '端口1设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1637', '0x06A9', '1', '4', '端口2设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1638', '0x000006A9', '3', '4', '端口2设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1639', '0x06AA', '1', '4', '端口3设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1640', '0x000006AA', '3', '4', '端口3设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1641', '0x06AB', '1', '4', '端口4设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1642', '0x000006AB', '3', '4', '端口4设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1643', '0x06AC', '1', '4', '端口5设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1644', '0x000006AC', '3', '4', '端口5设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1645', '0x06AD', '1', '4', '端口6设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1646', '0x000006AD', '3', '4', '端口6设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1647', '0x06AE', '1', '4', '端口7设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1648', '0x000006AE', '3', '4', '端口7设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1649', '0x06AF', '1', '4', '端口8设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1650', '0x000006AF', '3', '4', '端口8设备类型查询uint2', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1651', '0x06B0', '1', '4', '远端单元链路开关1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1652', '0x000006B0', '3', '4', '远端单元链路开关1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1653', '0x06B1', '1', '4', '远端单元链路开关2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1654', '0x000006B1', '3', '4', '远端单元链路开关2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1655', '0x06B2', '1', '4', '远端单元链路开关3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1656', '0x000006B2', '3', '4', '远端单元链路开关3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1657', '0x06B3', '1', '4', '远端单元链路开关4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1658', '0x000006B3', '3', '4', '远端单元链路开关4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1659', '0x06B4', '1', '4', '远端单元链路开关5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1660', '0x000006B4', '3', '4', '远端单元链路开关5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1661', '0x06B5', '1', '4', '远端单元链路开关6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1662', '0x000006B5', '3', '4', '远端单元链路开关6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1663', '0x06B6', '1', '4', '远端单元链路开关7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1664', '0x000006B6', '3', '4', '远端单元链路开关7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1665', '0x06B7', '1', '4', '远端单元链路开关8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1666', '0x000006B7', '3', '4', '远端单元链路开关8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1667', '0x06D0', '1', '4', '距离调整', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1668', '0x000006D0', '3', '4', '距离调整', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1669', '0x06D1', '1', '4', '风扇控制门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1670', '0x000006D1', '3', '4', '风扇控制门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1671', '0x06D2', '1', '4', '模块型号，地址标识', 'rw', 'none', '1', 'uint3', '3', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1672', '0x000006D2', '3', '4', '模块型号，地址标识', 'rw', 'none', '1', 'uint3', '3', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1673', '0x06D3', '1', '4', '下行功率电平系数a1', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1674', '0x000006D3', '3', '4', '下行功率电平系数a1', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1675', '0x06D4', '1', '4', '下行功率电平系数b1', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1676', '0x000006D4', '3', '4', '下行功率电平系数b1', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1677', '0x06D5', '1', '4', '下行功率电平系数a2', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1678', '0x000006D5', '3', '4', '下行功率电平系数a2', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1679', '0x06D6', '1', '4', '下行功率电平系数b2', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1680', '0x000006D6', '3', '4', '下行功率电平系数b2', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1681', '0x06D7', '1', '4', 'C寄存器2g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1682', '0x000006D7', '3', '4', 'C寄存器2g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1683', '0x06D8', '1', '4', 'R寄存器2g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1684', '0x000006D8', '3', '4', 'R寄存器2g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1685', '0x06D9', '1', '4', 'N寄存器2g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1686', '0x000006D9', '3', '4', 'N寄存器2g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1687', '0x06DA', '1', '4', 'C寄存器3g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1688', '0x000006DA', '3', '4', 'C寄存器3g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1689', '0x06DB', '1', '4', 'R寄存器3g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1690', '0x000006DB', '3', '4', 'R寄存器3g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1691', '0x06DC', '1', '4', 'N寄存器3g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1692', '0x000006DC', '3', '4', 'N寄存器3g', 'rw', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1693', '0x06DD', '1', '4', '2G\\3G转换0->2g1->3g', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1694', '0x000006DD', '3', '4', '2G\\3G转换0->2g1->3g', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1695', '0x06DE', '1', '4', '测试模式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1696', '0x000006DE', '3', '4', '测试模式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1697', '0x06DF', '1', '4', 'FSK调控功率等级', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1698', '0x000006DF', '3', '4', 'FSK调控功率等级', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1699', '0x06E0', '1', '4', '端口1设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1700', '0x000006E0', '3', '4', '端口1设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1701', '0x06E1', '1', '4', '端口2设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1702', '0x000006E1', '3', '4', '端口2设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1703', '0x06E2', '1', '4', '端口3设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1704', '0x000006E2', '3', '4', '端口3设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1705', '0x06E3', '1', '4', '端口4设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1706', '0x000006E3', '3', '4', '端口4设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1707', '0x06E4', '1', '4', '端口5设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1708', '0x000006E4', '3', '4', '端口5设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1709', '0x06E5', '1', '4', '端口6设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1710', '0x000006E5', '3', '4', '端口6设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1711', '0x06E6', '1', '4', '端口7设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1712', '0x000006E6', '3', '4', '端口7设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1713', '0x06E7', '1', '4', '端口8设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1714', '0x000006E7', '3', '4', '端口8设备类型设置uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1715', '0x06E8', '1', '4', '端口1设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1716', '0x000006E8', '3', '4', '端口1设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1717', '0x06E9', '1', '4', '端口2设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1718', '0x000006E9', '3', '4', '端口2设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1719', '0x06EA', '1', '4', '端口3设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1720', '0x000006EA', '3', '4', '端口3设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1721', '0x06EB', '1', '4', '端口4设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1722', '0x000006EB', '3', '4', '端口4设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1723', '0x06EC', '1', '4', '端口5设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1724', '0x000006EC', '3', '4', '端口5设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1725', '0x06ED', '1', '4', '端口6设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1726', '0x000006ED', '3', '4', '端口6设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1727', '0x06EE', '1', '4', '端口7设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1728', '0x000006EE', '3', '4', '端口7设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1729', '0x06EF', '1', '4', '端口8设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1730', '0x000006EF', '3', '4', '端口8设备类型查询uint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1731', '0x07A0', '1', '4', '上行1GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1732', '0x000007A0', '3', '4', '上行1GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1733', '0x07A1', '1', '4', '上行1TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1734', '0x000007A1', '3', '4', '上行1TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1735', '0x07A2', '1', '4', '上行2GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1736', '0x000007A2', '3', '4', '上行2GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1737', '0x07A3', '1', '4', '上行2TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1738', '0x000007A3', '3', '4', '上行2TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1739', '0x07A4', '1', '4', '上行3GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1740', '0x000007A4', '3', '4', '上行3GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1741', '0x07A5', '1', '4', '上行3TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1742', '0x000007A5', '3', '4', '上行3TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1743', '0x07A6', '1', '4', '上行4GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1744', '0x000007A6', '3', '4', '上行4GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1745', '0x07A7', '1', '4', '上行4TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1746', '0x000007A7', '3', '4', '上行4TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1747', '0x07A8', '1', '4', '上行5GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1748', '0x000007A8', '3', '4', '上行5GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1749', '0x07A9', '1', '4', '上行5TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1750', '0x000007A9', '3', '4', '上行5TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1751', '0x07AA', '1', '4', '上行6GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1752', '0x000007AA', '3', '4', '上行6GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1753', '0x07AB', '1', '4', '上行6TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1754', '0x000007AB', '3', '4', '上行6TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1755', '0x07AC', '1', '4', '上行7GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1756', '0x000007AC', '3', '4', '上行7GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1757', '0x07AD', '1', '4', '上行7TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1758', '0x000007AD', '3', '4', '上行7TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1759', '0x07AE', '1', '4', '上行8GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1760', '0x000007AE', '3', '4', '上行8GSM支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1761', '0x07AF', '1', '4', '上行8TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1762', '0x000007AF', '3', '4', '上行8TD支路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1763', '0x07B0', '1', '4', '上行干路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1764', '0x000007B0', '3', '4', '上行干路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1765', '0x07B1', '1', '4', '下行GSM干路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1766', '0x000007B1', '3', '4', '下行GSM干路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1767', '0x07B2', '1', '4', '下行TD干路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1768', '0x000007B2', '3', '4', '下行TD干路衰减uint1', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1769', '0x07B3', '1', '4', '3G链路上行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1770', '0x000007B3', '3', '4', '3G链路上行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1771', '0x07B4', '1', '4', '3G链路下行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1772', '0x000007B4', '3', '4', '3G链路下行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1773', '0x07B5', '1', '4', '2G链路上行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1774', '0x000007B5', '3', '4', '2G链路上行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1775', '0x07B6', '1', '4', '2G链路下行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1776', '0x000007B6', '3', '4', '2G链路下行增益', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1777', '0x07B7', '1', '4', '上行增益衰减(3G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1778', '0x000007B7', '3', '4', '上行增益衰减(3G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1779', '0x07B8', '1', '4', '下行增益衰减(3G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1780', '0x000007B8', '3', '4', '下行增益衰减(3G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1781', '0x07B9', '1', '4', '上行增益衰减(2G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1782', '0x000007B9', '3', '4', '上行增益衰减(2G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1783', '0x07BA', '1', '4', '下行增益衰减(2G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1784', '0x000007BA', '3', '4', '下行增益衰减(2G)', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1785', '0x07BB', '1', '4', '合路模块类型0x07BBruint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1786', '0x000007BB', '3', '4', '合路模块类型0x07BBruint2', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1787', '0x07C0', '1', '4', '上行输入功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1788', '0x000007C0', '3', '4', '上行输入功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1789', '0x07C1', '1', '4', '上行输入功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1790', '0x000007C1', '3', '4', '上行输入功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1791', '0x07C2', '1', '4', '上行输出功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1792', '0x000007C2', '3', '4', '上行输出功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1793', '0x07C3', '1', '4', '上行输出功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1794', '0x000007C3', '3', '4', '上行输出功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1795', '0x07C4', '1', '4', '下行输入功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1796', '0x000007C4', '3', '4', '下行输入功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1797', '0x07C5', '1', '4', '下行输入功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1798', '0x000007C5', '3', '4', '下行输入功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1799', '0x07C6', '1', '4', '下行输出功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1800', '0x000007C6', '3', '4', '下行输出功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1801', '0x07C7', '1', '4', '下行输出功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1802', '0x000007C7', '3', '4', '下行输出功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1803', '0x07C8', '1', '4', '下行输出反射功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1804', '0x00007C08', '3', '6', '下行输出反射功率电平系数a(2G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1805', '0x07C9', '1', '4', '下行输出反射功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1806', '0x00007C09', '3', '6', '下行输出反射功率电平系数b(2G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1807', '0x07D0', '1', '4', '上行输入功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1808', '0x000007D0', '3', '4', '上行输入功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1809', '0x07D1', '1', '4', '上行输入功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1810', '0x000007D1', '3', '4', '上行输入功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1811', '0x07D2', '1', '4', '上行输出功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1812', '0x000007D2', '3', '4', '上行输出功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1813', '0x07D3', '1', '4', '上行输出功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1814', '0x000007D3', '3', '4', '上行输出功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1815', '0x07D4', '1', '4', '下行输入功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1816', '0x000007D4', '3', '4', '下行输入功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1817', '0x07D5', '1', '4', '下行输入功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1818', '0x000007D5', '3', '4', '下行输入功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1819', '0x07D6', '1', '4', '下行输出功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1820', '0x000007D6', '3', '4', '下行输出功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1821', '0x07D7', '1', '4', '下行输出功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1822', '0x000007D7', '3', '4', '下行输出功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1823', '0x07D8', '1', '4', '下行输出反射功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1824', '0x000007D8', '3', '4', '下行输出反射功率电平系数a(3G)', 'rw', 'none', '100', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1825', '0x07D9', '1', '4', '下行输出反射功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1826', '0x000007D9', '3', '4', '下行输出反射功率电平系数b(3G)', 'rw', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1827', '0x07E1', '1', '4', '上行输出功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1828', '0x000007E1', '3', '4', '上行输出功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1829', '0x07E2', '1', '4', '上行输出功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1830', '0x000007E2', '3', '4', '上行输出功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1831', '0x07E3', '1', '4', '上行输入功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1832', '0x000007E3', '3', '4', '上行输入功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1833', '0x07E4', '1', '4', '上行输入功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1834', '0x000007E4', '3', '4', '上行输入功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1835', '0x07E5', '1', '4', '下行输出功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1836', '0x000007E5', '3', '4', '下行输出功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1837', '0x07E6', '1', '4', '下行输出功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1838', '0x000007E6', '3', '4', '下行输出功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1839', '0x07E7', '1', '4', '下行输入功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1840', '0x000007E7', '3', '4', '下行输入功率电平(2G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1841', '0x07E8', '1', '4', '下行输入功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1842', '0x000007E8', '3', '4', '下行输入功率电平(3G)', 'ro', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1843', '0x0801', '1', '6', 'RAU通道CH1链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1844', '0x00000801', '3', '6', 'RAU通道CH1链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1845', '0x0802', '1', '6', 'RAU通道CH2链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1846', '0x00000802', '3', '6', 'RAU通道CH2链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1847', '0x0803', '1', '6', 'RAU通道CH3链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1848', '0x00000803', '3', '6', 'RAU通道CH3链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1849', '0x0804', '1', '6', 'RAU通道CH4链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1850', '0x00000804', '3', '6', 'RAU通道CH4链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1851', '0x0805', '1', '6', 'RAU通道CH5链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1852', '0x00000805', '3', '6', 'RAU通道CH5链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1853', '0x0806', '1', '6', 'RAU通道CH6链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1854', '0x00000806', '3', '6', 'RAU通道CH6链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1855', '0x0807', '1', '6', 'RAU通道CH7链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1856', '0x00000807', '3', '6', 'RAU通道CH7链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1857', '0x0808', '1', '6', 'RAU通道CH8链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1858', '0x00000808', '3', '6', 'RAU通道CH8链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1859', '0x0809', '1', '6', 'RAU通道CH1状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1860', '0x00000809', '3', '6', 'RAU通道CH1状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1861', '0x080A', '1', '6', 'RAU通道CH2状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1862', '0x0000080A', '3', '6', 'RAU通道CH2状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1863', '0x080B', '1', '6', 'RAU通道CH3状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1864', '0x0000080B', '3', '6', 'RAU通道CH3状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1865', '0x080C', '1', '6', 'RAU通道CH4状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1866', '0x0000080C', '3', '6', 'RAU通道CH4状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1867', '0x080D', '1', '6', 'RAU通道CH5状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1868', '0x0000080D', '3', '6', 'RAU通道CH5状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1869', '0x080E', '1', '6', 'RAU通道CH6状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1870', '0x0000080E', '3', '6', 'RAU通道CH6状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1871', '0x080F', '1', '6', 'RAU通道CH7状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1872', '0x0000080F', '3', '6', 'RAU通道CH7状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1873', '0x0810', '1', '6', 'RAU通道CH8状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1874', '0x00000810', '3', '6', 'RAU通道CH8状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1875', '0x0811', '1', '6', 'LTE通道CH1链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1876', '0x00000811', '3', '6', 'LTE通道CH1链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1877', '0x0812', '1', '6', 'LTE通道CH2链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1878', '0x00000812', '3', '6', 'LTE通道CH2链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1879', '0x0813', '1', '6', 'LTE通道CH3链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1880', '0x00000813', '3', '6', 'LTE通道CH3链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1881', '0x0814', '1', '6', 'LTE通道CH4链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1882', '0x00000814', '3', '6', 'LTE通道CH4链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1883', '0x0815', '1', '6', 'LTE通道CH5链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1884', '0x00000815', '3', '6', 'LTE通道CH5链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1885', '0x0816', '1', '6', 'LTE通道CH6链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1886', '0x00000816', '3', '6', 'LTE通道CH6链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1887', '0x0817', '1', '6', 'LTE通道CH7链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1888', '0x00000817', '3', '6', 'LTE通道CH7链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1889', '0x0818', '1', '6', 'LTE通道CH8链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1890', '0x00000818', '3', '6', 'LTE通道CH8链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1891', '0x0819', '1', '6', 'LTE通道CH1状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1892', '0x00000819', '3', '6', 'LTE通道CH1状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1893', '0x081A', '1', '6', 'LTE通道CH2状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1894', '0x0000081A', '3', '6', 'LTE通道CH2状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1895', '0x081B', '1', '6', 'LTE通道CH3状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1896', '0x0000081B', '3', '6', 'LTE通道CH3状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1897', '0x081C', '1', '6', 'LTE通道CH4状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1898', '0x0000081C', '3', '6', 'LTE通道CH4状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1899', '0x081D', '1', '6', 'LTE通道CH5状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1900', '0x0000081D', '3', '6', 'LTE通道CH5状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1901', '0x081E', '1', '6', 'LTE通道CH6状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1902', '0x0000081E', '3', '6', 'LTE通道CH6状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1903', '0x081F', '1', '6', 'LTE通道CH7状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1904', '0x0000081F', '3', '6', 'LTE通道CH7状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1905', '0x0820', '1', '6', 'LTE通道CH8状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1906', '0x00000820', '3', '6', 'LTE通道CH8状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1907', '0x0821', '1', '6', 'RMU-TD通道链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1908', '0x00000821', '3', '6', 'RMU-TD通道链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1909', '0x0822', '1', '6', 'RMU-TD通道状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1910', '0x00000822', '3', '6', 'RMU-TD通道状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1911', '0x0823', '1', '6', 'RMU-LTE通道链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1912', '0x00000823', '3', '6', 'RMU-LTE通道链路指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1913', '0x0824', '1', '6', 'RMU-LTE通道状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1914', '0x00000824', '3', '6', 'RMU-LTE通道状态指示灯', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1915', '0x0871', '1', '6', '上行噪声抑制开关', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1916', '0x00000871', '3', '6', '上行噪声抑制开关', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1917', '0x0872', '1', '6', '上行噪声抑制门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1918', '0x00000872', '3', '6', '上行噪声抑制门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1919', '0x0873', '1', '5', '设备路由登记地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 16:06:21', '2015-10-17 16:06:21', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('1920', '0x00000873', '3', '5', '设备路由登记地址', 'rw', 'none', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 15:49:56', '2015-10-17 15:49:56', 'text', 'paramOptionNone', 'ip');
INSERT INTO `device_param` VALUES ('1921', '0x087C', '1', '6', '整机温度', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1922', '0x0000087C', '3', '5', '整机温度', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 15:52:43', '2015-10-17 15:52:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1923', '0x0A00', '1', '6', 'P1口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1924', '0x00000A00', '3', '6', 'P1口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1925', '0x0A01', '1', '6', 'P2口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1926', '0x00000A01', '3', '6', 'P2口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1927', '0x0A02', '1', '6', 'P3口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1928', '0x00000A02', '3', '6', 'P3口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1929', '0x0A03', '1', '6', 'P4口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1930', '0x00000A03', '3', '6', 'P4口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1931', '0x0A04', '1', '6', 'P5口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1932', '0x00000A04', '3', '6', 'P5口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1933', '0x0A05', '1', '6', 'P6口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1934', '0x00000A05', '3', '6', 'P6口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1935', '0x0A06', '1', '6', 'P7口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1936', '0x00000A06', '3', '6', 'P7口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1937', '0x0A07', '1', '6', 'P8口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1938', '0x00000A07', '3', '6', 'P8口光模块状态', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1939', '0x0A08', '1', '6', 'LTE1 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1940', '0x00800A08', '3', '6', 'LTE1 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 15:08:10', '2015-10-17 15:08:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1941', '0x0A09', '1', '6', 'LTE2 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1942', '0x00800A09', '3', '6', 'LTE2 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 15:07:59', '2015-10-17 15:07:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1943', '0x0A0A', '1', '6', 'WCDMA 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1944', '0x00800A0A', '3', '6', 'WCDMA 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 15:07:51', '2015-10-17 15:07:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1945', '0x0A0B', '1', '6', 'GSM 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1946', '0x00800A0B', '3', '6', 'GSM 数字功率', 'ro', 'none', '1', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 15:07:42', '2015-10-17 15:07:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1947', '0x0B00', '1', '6', 'LTE1 VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1948', '0x00800B00', '3', '6', 'LTE1 VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 15:06:44', '2015-10-17 15:06:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1949', '0x0B01', '1', '6', 'LTE2 VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1950', '0x00800B01', '3', '6', 'LTE2 VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 15:06:23', '2015-10-17 15:06:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1951', '0x0B02', '1', '6', '3g VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1952', '0x00800B02', '3', '6', '3g VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 15:06:00', '2015-10-17 15:06:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1953', '0x0B03', '1', '6', 'GSM VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1954', '0x00800B03', '3', '6', 'GSM VGA', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 15:05:46', '2015-10-17 15:05:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1955', '0x0B04', '1', '6', 'LTE1 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1956', '0x00800B04', '3', '6', 'LTE1 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 18:18:45', '2015-10-17 18:18:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1957', '0x0B05', '1', '6', 'LTE2 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1958', '0x00800B05', '3', '6', 'LTE2 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 18:18:38', '2015-10-17 18:18:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1959', '0x0B06', '1', '6', '3G 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1960', '0x00800B06', '3', '6', '3G 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 18:18:30', '2015-10-17 18:18:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1961', '0x0B07', '1', '6', 'GSM 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1962', '0x00800B07', '3', '6', 'GSM 数字增益', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-10-17 18:18:19', '2015-10-17 18:18:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1963', '0x0B08', '1', '6', 'GSM 载波屏蔽寄存器', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1964', '0x00000B08', '3', '6', 'GSM 载波屏蔽寄存器', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1965', '0x0B09', '1', '6', '测试模式和正常模式切换', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1966', '0x00000B09', '3', '6', '测试模式和正常模式切换', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1967', '0x0B0A', '1', '6', '内部测试源使能', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1968', '0x00000B0A', '3', '6', '内部测试源使能', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1969', '0x0B0B', '1', '6', '内部源频率设置', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1970', '0x00800B0B', '3', '6', '内部源频率设置', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:44:34', '2015-10-17 14:44:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1971', '0x0B0C', '1', '6', 'AGC 参考值设定', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1972', '0x00800B0C', '3', '6', 'AGC 参考值设定', 'ro', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:44:02', '2015-10-17 14:44:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1973', '0x0B0D', '1', '6', 'AGC 步进设置', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1974', '0x00800B0D', '3', '6', 'AGC 步进设置', 'ro', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:43:21', '2015-10-17 14:43:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1975', '0x0B10', '1', '6', 'GSM上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1976', '0x00800B10', '3', '6', 'GSM上行增益偏移', 'rw', 'none', '2', 'sint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:41:52', '2015-10-17 14:41:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1977', '0x0B11', '1', '6', 'GSM下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1978', '0x00800B11', '3', '6', 'GSM下行增益偏移', 'rw', 'none', '2', 'sint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:41:12', '2015-10-17 14:41:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1979', '0x0B12', '1', '6', '3G上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1980', '0x00800B12', '3', '6', '3G上行增益偏移', 'rw', 'none', '2', 'sint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:42:07', '2015-10-17 14:42:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1981', '0x0B13', '1', '6', '3G下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1982', '0x00800B13', '3', '6', '3G下行增益偏移', 'rw', 'none', '2', 'sint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:42:20', '2015-10-17 14:42:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1983', '0x0B14', '1', '6', 'LTE1上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1984', '0x00800B14', '3', '6', 'LTE1上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:42:29', '2015-10-17 14:42:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1985', '0x0B15', '1', '6', 'LTE1下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1986', '0x00800B15', '3', '6', 'LTE1下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:42:37', '2015-10-17 14:42:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1987', '0x0B16', '1', '6', 'LTE2上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1988', '0x00800B16', '3', '6', 'LTE2上行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:42:44', '2015-10-17 14:42:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1989', '0x0B17', '1', '6', 'LTE2下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1990', '0x00800B17', '3', '6', 'LTE2下行增益偏移', 'rw', 'none', '2', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:42:51', '2015-10-17 14:42:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1991', '0x0B18', '1', '6', '下行输入功率电平校准(通道1(GSM))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1992', '0x00000B18', '3', '6', '下行输入功率电平校准(通道1(GSM))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1993', '0x0B19', '1', '6', '下行输入功率电平校准(通道2(3G))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1994', '0x00000B19', '3', '6', '下行输入功率电平校准(通道2(3G))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1995', '0x0B1A', '1', '6', '下行输入功率电平校准(通道3(LTE1))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1996', '0x00000B1A', '3', '6', '下行输入功率电平校准(通道3(LTE1))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1997', '0x0B1B', '1', '6', '下行输入功率电平校准(通道4(LTE2))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1998', '0x00000B1B', '3', '6', '下行输入功率电平校准(通道4(LTE2))', 'rw', 'none', '10', 'sint2', '2', '1', '255', '-32767', '32767', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('1999', '0x0B1C', '1', '6', '工作信道号通道2(3G)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2000', '0x08004004', '3', '4', '工作信道号通道2(3G)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 16:31:29', '2015-10-17 16:31:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2001', '0x0B1D', '1', '6', '工作信道号通道3(LTE1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2002', '0x08007004', '3', '4', '工作信道号通道3(LTE1)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 16:31:19', '2015-10-17 16:31:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2003', '0x0B1E', '1', '6', '工作信道号通道4(LTE2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2004', '0x08008004', '3', '4', '工作信道号通道4(LTE2)', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 16:31:12', '2015-10-17 16:31:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2005', '0x0B20', '1', '6', 'LTE远程功率开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2006', '0x00800B20', '3', '6', 'LTE远程功率开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:36:13', '2015-10-17 14:36:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2007', '0x0B21', '1', '6', 'TD远程功率开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2008', '0x00800B21', '3', '6', 'TD远程功率开关', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:35:54', '2015-10-17 14:35:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2009', '0x0B22', '1', '6', 'TD-SCDMA时隙配置', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2011', '0x0B23', '1', '6', 'TD-LTE时隙配置', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2012', '0x00000609', '3', '4', 'TD-LTE时隙配置', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 15:49:16', '2015-10-17 15:49:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2013', '0x0B24', '1', '6', 'TD-SCDMA同步开启门限', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2014', '0x00800B24', '3', '6', 'TD-SCDMA同步开启门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:33:44', '2015-10-17 14:33:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2015', '0x0B25', '1', '6', 'TD-LTE同步开启门限', 'rw', 'none', '1', 'uint2', '2', '1', '255', '0', '65535', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2016', '0x00800B25', '3', '6', 'TD-LTE同步开启门限', 'rw', 'none', '10', 'sint2', '2', '1', '255', '0', '65535', '4', '0', '2015-10-17 14:34:10', '2015-10-17 14:34:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2017', '0x0B26', '1', '6', 'TD-LTE特殊子帧', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2018', '0x00000608', '3', '4', 'TD-LTE特殊子帧', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 15:49:25', '2015-10-17 15:49:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2019', '0x0B27', '1', '6', '噪声抑制', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2020', '0x00000B27', '3', '6', '噪声抑制', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2021', '0x0B28', '1', '6', '带宽模式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2022', '0x00000B28', '3', '6', '带宽模式', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2023', '0x0B37', '1', '6', 'LTE第一转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2024', '0x00800B37', '3', '6', 'LTE第一转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:29:17', '2015-10-17 14:29:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2025', '0x0B38', '1', '6', 'LTE第二转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2026', '0x00800B38', '3', '6', 'LTE第二转换点微调', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:28:55', '2015-10-17 14:28:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2027', '0x0B39', '1', '6', 'LTE接入通道选择', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2028', '0x00800B39', '3', '6', 'LTE接入通道选择', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:28:31', '2015-10-17 14:28:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2029', '0x0B41', '1', '6', '广播升级', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2030', '0x00800B41', '3', '6', '广播升级', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:27:23', '2015-10-17 14:27:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2031', '0x0B42', '1', '0', '设备名称', 'ro', 'none', '1', 'str', '40', '1', '255', '0', '255', '4', '0', '2015-10-17 14:26:29', '2015-10-17 14:26:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2032', '0x00000B42', '3', '0', '设备名称', 'ro', 'none', '1', 'str', '40', '1', '255', '0', '255', '4', '0', '2015-10-17 14:26:21', '2015-10-17 14:26:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2033', '0x0C00', '1', '5', '远端光收功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:44', '2015-10-17 14:22:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2034', '0x08000000', '3', '5', '远端光收功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:38', '2015-10-17 14:22:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2035', '0x0C01', '1', '5', '远端光收功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:32', '2015-10-17 14:22:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2036', '0x08000001', '3', '5', '远端光收功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:26', '2015-10-17 14:22:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2037', '0x0C02', '1', '5', '远端光收功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:20', '2015-10-17 14:22:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2038', '0x08000002', '3', '5', '远端光收功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:13', '2015-10-17 14:22:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2039', '0x0C03', '1', '5', '远端光收功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:07', '2015-10-17 14:22:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2040', '0x08000003', '3', '5', '远端光收功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:22:02', '2015-10-17 14:22:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2041', '0x0C04', '1', '5', '远端光收功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:56', '2015-10-17 14:21:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2042', '0x08000004', '3', '5', '远端光收功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:51', '2015-10-17 14:21:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2043', '0x0C05', '1', '5', '远端光收功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:46', '2015-10-17 14:21:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2044', '0x08000005', '3', '5', '远端光收功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:40', '2015-10-17 14:21:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2045', '0x0C06', '1', '5', '远端光收功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:34', '2015-10-17 14:21:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2046', '0x08000006', '3', '5', '远端光收功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:29', '2015-10-17 14:21:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2047', '0x0C07', '1', '5', '远端光收功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:23', '2015-10-17 14:21:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2048', '0x08000007', '3', '5', '远端光收功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:16', '2015-10-17 14:21:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2049', '0x0C20', '1', '5', '远端光发功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:21:11', '2015-10-17 14:21:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2050', '0x08000020', '3', '5', '远端光发功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:59', '2015-10-17 14:20:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2051', '0x0C21', '1', '5', '远端光发功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:52', '2015-10-17 14:20:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2052', '0x08000021', '3', '5', '远端光发功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:47', '2015-10-17 14:20:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2053', '0x0C22', '1', '5', '远端光发功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:40', '2015-10-17 14:20:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2054', '0x08000022', '3', '5', '远端光发功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:34', '2015-10-17 14:20:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2055', '0x0C23', '1', '5', '远端光发功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:27', '2015-10-17 14:20:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2056', '0x08000023', '3', '5', '远端光发功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:20', '2015-10-17 14:20:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2057', '0x0C24', '1', '5', '远端光发功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:14', '2015-10-17 14:20:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2058', '0x08000024', '3', '5', '远端光发功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:08', '2015-10-17 14:20:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2059', '0x0C25', '1', '5', '远端光发功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:20:02', '2015-10-17 14:20:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2060', '0x08000025', '3', '5', '远端光发功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:19:56', '2015-10-17 14:19:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2061', '0x0C26', '1', '5', '远端光发功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:19:50', '2015-10-17 14:19:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2062', '0x08000026', '3', '5', '远端光发功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:19:43', '2015-10-17 14:19:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2063', '0x0C27', '1', '5', '远端光发功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:19:35', '2015-10-17 14:19:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2064', '0x08000027', '3', '5', '远端光发功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:19:29', '2015-10-17 14:19:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2065', '0x0C30', '1', '5', '远端接入状态1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:19:22', '2015-10-17 14:19:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2066', '0x08000080', '3', '5', '远端接入状态1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:19:15', '2015-10-17 14:19:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2067', '0x0C31', '1', '5', '远端接入状态2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:19:08', '2015-10-17 14:19:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2068', '0x08000081', '3', '5', '远端接入状态2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:19:01', '2015-10-17 14:19:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2069', '0x0C32', '1', '5', '远端接入状态3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:18:37', '2015-10-17 14:18:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2070', '0x08000082', '3', '5', '远端接入状态3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:18:44', '2015-10-17 14:18:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2071', '0x0C33', '1', '5', '远端接入状态4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:18:28', '2015-10-17 14:18:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2072', '0x08000083', '3', '5', '远端接入状态4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:18:22', '2015-10-17 14:18:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2073', '0x0C34', '1', '5', '远端接入状态5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:18:15', '2015-10-17 14:18:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2074', '0x08000084', '3', '5', '远端接入状态5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:18:10', '2015-10-17 14:18:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2075', '0x0C35', '1', '5', '远端接入状态6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:55', '2015-10-17 14:17:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2076', '0x08000085', '3', '5', '远端接入状态6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:18:04', '2015-10-17 14:18:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2077', '0x0C36', '1', '5', '远端接入状态7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:49', '2015-10-17 14:17:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2078', '0x08000086', '3', '5', '远端接入状态7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:43', '2015-10-17 14:17:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2079', '0x0C37', '1', '5', '远端接入状态8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:37', '2015-10-17 14:17:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2080', '0x08000087', '3', '5', '远端接入状态8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:31', '2015-10-17 14:17:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2081', '0x0C40', '1', '5', 'WLAN/固网宽带接入状态1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:20', '2015-10-17 14:17:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2082', '0x08000220', '3', '5', 'WLAN/固网宽带接入状态1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:25', '2015-10-17 14:17:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2083', '0x0C41', '1', '5', 'WLAN/固网宽带接入状态2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:12', '2015-10-17 14:17:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2084', '0x08000221', '3', '5', 'WLAN/固网宽带接入状态2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:07', '2015-10-17 14:17:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2085', '0x0C42', '1', '5', 'WLAN/固网宽带接入状态3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:17:02', '2015-10-17 14:17:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2086', '0x08000222', '3', '5', 'WLAN/固网宽带接入状态3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:56', '2015-10-17 14:16:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2087', '0x0C43', '1', '5', 'WLAN/固网宽带接入状态4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:50', '2015-10-17 14:16:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2088', '0x08000223', '3', '5', 'WLAN/固网宽带接入状态4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:45', '2015-10-17 14:16:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2089', '0x0C44', '1', '5', 'WLAN/固网宽带接入状态5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:39', '2015-10-17 14:16:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2090', '0x08000224', '3', '5', 'WLAN/固网宽带接入状态5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:34', '2015-10-17 14:16:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2091', '0x0C45', '1', '5', 'WLAN/固网宽带接入状态6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:28', '2015-10-17 14:16:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2092', '0x08000225', '3', '5', 'WLAN/固网宽带接入状态6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:22', '2015-10-17 14:16:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2093', '0x0C46', '1', '5', 'WLAN/固网宽带接入状态7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:16', '2015-10-17 14:16:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2094', '0x08000226', '3', '5', 'WLAN/固网宽带接入状态7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:16:03', '2015-10-17 14:16:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2095', '0x0C47', '1', '5', 'WLAN/固网宽带接入状态8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:15:56', '2015-10-17 14:15:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2096', '0x08000227', '3', '5', 'WLAN/固网宽带接入状态8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '255', '4', '0', '2015-10-17 14:15:49', '2015-10-17 14:15:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2097', '0x0C50', '1', '5', '远端设备温度值1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:14:39', '2015-10-17 14:14:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2098', '0x08000500', '3', '5', '远端设备温度值1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:14:33', '2015-10-17 14:14:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2099', '0x0C51', '1', '5', '远端设备温度值2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:14:27', '2015-10-17 14:14:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2100', '0x08000501', '3', '5', '远端设备温度值2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:14:14', '2015-10-17 14:14:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2101', '0x0C52', '1', '5', '远端设备温度值3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:14:07', '2015-10-17 14:14:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2102', '0x08000502', '3', '5', '远端设备温度值3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:14:00', '2015-10-17 14:14:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2103', '0x0C53', '1', '5', '远端设备温度值4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:13:52', '2015-10-17 14:13:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2104', '0x08000503', '3', '5', '远端设备温度值4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:13:32', '2015-10-17 14:13:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2105', '0x0C54', '1', '5', '远端设备温度值5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:13:25', '2015-10-17 14:13:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2106', '0x08000504', '3', '5', '远端设备温度值5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:13:17', '2015-10-17 14:13:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2107', '0x0C55', '1', '5', '远端设备温度值6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:13:11', '2015-10-17 14:13:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2108', '0x08000505', '3', '5', '远端设备温度值6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:13:05', '2015-10-17 14:13:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2109', '0x0C56', '1', '5', '远端设备温度值7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:12:58', '2015-10-17 14:12:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2110', '0x08000506', '3', '5', '远端设备温度值7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:12:50', '2015-10-17 14:12:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2111', '0x0C57', '1', '5', '远端设备温度值8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:12:40', '2015-10-17 14:12:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2112', '0x08000507', '3', '5', '远端设备温度值8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 14:12:30', '2015-10-17 14:12:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2113', '0x0C60', '1', '5', '远端位置信息1', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:12:02', '2015-10-17 14:12:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2114', '0x08000680', '3', '5', '远端位置信息1', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:11:54', '2015-10-17 14:11:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2115', '0x0C61', '1', '5', '远端位置信息2', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:11:14', '2015-10-17 14:11:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2116', '0x08000681', '3', '5', '远端位置信息2', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:11:08', '2015-10-17 14:11:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2117', '0x0C62', '1', '5', '远端位置信息3', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:11:01', '2015-10-17 14:11:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2118', '0x08000682', '3', '5', '远端位置信息3', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:54', '2015-10-17 14:10:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2119', '0x0C63', '1', '5', '远端位置信息4', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:47', '2015-10-17 14:10:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2120', '0x08000683', '3', '5', '远端位置信息4', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:39', '2015-10-17 14:10:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2121', '0x0C64', '1', '5', '远端位置信息5', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:31', '2015-10-17 14:10:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2122', '0x08000684', '3', '5', '远端位置信息5', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:26', '2015-10-17 14:10:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2123', '0x0C65', '1', '5', '远端位置信息6', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:19', '2015-10-17 14:10:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2124', '0x08000685', '3', '5', '远端位置信息6', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:13', '2015-10-17 14:10:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2125', '0x0C66', '1', '5', '远端位置信息7', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:10:05', '2015-10-17 14:10:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2126', '0x08000686', '3', '5', '远端位置信息7', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:09:59', '2015-10-17 14:09:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2127', '0x0C67', '1', '5', '远端位置信息8', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:09:52', '2015-10-17 14:09:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2128', '0x08000687', '3', '5', '远端位置信息8', 'ro', 'none', '1', 'str', '20', '1', '255', '0', '255', '4', '0', '2015-10-17 14:09:45', '2015-10-17 14:09:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2129', '0x0D00', '1', '3', '远端光收发故障告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:55', '2015-10-17 14:08:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2130', '0x08000040', '3', '3', '远端光收发故障告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:49', '2015-10-17 14:08:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2131', '0x0D01', '1', '3', '远端光收发故障告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:33', '2015-10-17 14:08:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2132', '0x08000041', '3', '3', '远端光收发故障告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:38', '2015-10-17 14:08:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2133', '0x0D02', '1', '3', '远端光收发故障告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:25', '2015-10-17 14:08:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2134', '0x08000042', '3', '3', '远端光收发故障告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:19', '2015-10-17 14:08:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2135', '0x0D03', '1', '3', '远端光收发故障告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:13', '2015-10-17 14:08:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2136', '0x08000043', '3', '3', '远端光收发故障告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:08', '2015-10-17 14:08:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2137', '0x0D04', '1', '3', '远端光收发故障告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:08:03', '2015-10-17 14:08:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2138', '0x08000044', '3', '3', '远端光收发故障告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:57', '2015-10-17 14:07:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2139', '0x0D05', '1', '3', '远端光收发故障告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:51', '2015-10-17 14:07:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2140', '0x08000045', '3', '3', '远端光收发故障告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:45', '2015-10-17 14:07:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2141', '0x0D06', '1', '3', '远端光收发故障告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:39', '2015-10-17 14:07:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2142', '0x08000046', '3', '3', '远端光收发故障告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:34', '2015-10-17 14:07:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2143', '0x0D07', '1', '3', '远端光收发故障告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:28', '2015-10-17 14:07:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2144', '0x08000047', '3', '3', '远端光收发故障告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:22', '2015-10-17 14:07:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2145', '0x0D08', '1', '3', '远端射频电路故障告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:07:16', '2015-10-17 14:07:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2146', '0x08000300', '3', '3', '远端射频电路故障告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:06:54', '2015-10-17 14:06:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2147', '0x0D09', '1', '3', '远端射频电路故障告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:06:49', '2015-10-17 14:06:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2148', '0x08000301', '3', '3', '远端射频电路故障告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:06:43', '2015-10-17 14:06:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2149', '0x0D0A', '1', '3', '远端射频电路故障告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:06:38', '2015-10-17 14:06:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2150', '0x08000302', '3', '3', '远端射频电路故障告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:06:26', '2015-10-17 14:06:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2151', '0x0D0B', '1', '3', '远端射频电路故障告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:06:20', '2015-10-17 14:06:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2152', '0x08000303', '3', '3', '远端射频电路故障告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:05:35', '2015-10-17 14:05:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2153', '0x0D0C', '1', '3', '远端射频电路故障告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:05:30', '2015-10-17 14:05:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2154', '0x08000304', '3', '3', '远端射频电路故障告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:05:23', '2015-10-17 14:05:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2155', '0x0D0D', '1', '3', '远端射频电路故障告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:05:17', '2015-10-17 14:05:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2156', '0x08000305', '3', '3', '远端射频电路故障告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:04:29', '2015-10-17 14:04:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2157', '0x0D0E', '1', '3', '远端射频电路故障告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:04:23', '2015-10-17 14:04:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2158', '0x08000306', '3', '3', '远端射频电路故障告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:04:17', '2015-10-17 14:04:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2159', '0x0D0F', '1', '3', '远端射频电路故障告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:04:12', '2015-10-17 14:04:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2160', '0x08000307', '3', '3', '远端射频电路故障告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:04:05', '2015-10-17 14:04:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2161', '0x0D10', '1', '3', '远端链路故障告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:58', '2015-10-17 14:03:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2162', '0x08000400', '3', '3', '远端链路故障告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:52', '2015-10-17 14:03:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2163', '0x0D11', '1', '3', '远端链路故障告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:43', '2015-10-17 14:03:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2164', '0x08000401', '3', '3', '远端链路故障告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:36', '2015-10-17 14:03:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2165', '0x0D12', '1', '3', '远端链路故障告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:29', '2015-10-17 14:03:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2166', '0x08000402', '3', '3', '远端链路故障告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:22', '2015-10-17 14:03:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2167', '0x0D13', '1', '3', '远端链路故障告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:12', '2015-10-17 14:03:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2168', '0x08000403', '3', '3', '远端链路故障告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:03:03', '2015-10-17 14:03:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2169', '0x0D14', '1', '3', '远端链路故障告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:46', '2015-10-17 14:02:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2170', '0x08000404', '3', '3', '远端链路故障告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:55', '2015-10-17 14:02:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2171', '0x0D15', '1', '3', '远端链路故障告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:40', '2015-10-17 14:02:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2172', '0x08000405', '3', '3', '远端链路故障告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:35', '2015-10-17 14:02:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2173', '0x0D16', '1', '3', '远端链路故障告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:29', '2015-10-17 14:02:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2174', '0x08000406', '3', '3', '远端链路故障告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:24', '2015-10-17 14:02:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2175', '0x0D17', '1', '3', '远端链路故障告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:17', '2015-10-17 14:02:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2176', '0x08000407', '3', '3', '远端链路故障告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:11', '2015-10-17 14:02:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2177', '0x0D18', '1', '3', '远端设备过温告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:06', '2015-10-17 14:02:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2178', '0x08000580', '3', '3', '远端设备过温告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:02:01', '2015-10-17 14:02:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2179', '0x0D19', '1', '3', '远端设备过温告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:01:54', '2015-10-17 14:01:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2180', '0x08000581', '3', '3', '远端设备过温告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:01:46', '2015-10-17 14:01:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2181', '0x0D1A', '1', '3', '远端设备过温告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:58', '2015-10-17 14:00:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2182', '0x08000582', '3', '3', '远端设备过温告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:01:05', '2015-10-17 14:01:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2183', '0x0D1B', '1', '3', '远端设备过温告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:52', '2015-10-17 14:00:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2184', '0x08000583', '3', '3', '远端设备过温告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:47', '2015-10-17 14:00:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2185', '0x0D1C', '1', '3', '远端设备过温告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:42', '2015-10-17 14:00:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2186', '0x08000584', '3', '3', '远端设备过温告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:33', '2015-10-17 14:00:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2187', '0x0D1D', '1', '3', '远端设备过温告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:25', '2015-10-17 14:00:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2188', '0x08000585', '3', '3', '远端设备过温告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:19', '2015-10-17 14:00:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2189', '0x0D1E', '1', '3', '远端设备过温告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:14', '2015-10-17 14:00:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2190', '0x08000586', '3', '3', '远端设备过温告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:08', '2015-10-17 14:00:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2191', '0x0D1F', '1', '3', '远端设备过温告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 14:00:02', '2015-10-17 14:00:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2192', '0x08000587', '3', '3', '远端设备过温告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:55', '2015-10-17 13:59:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2193', '0x0D80', '1', '2', '远端光收发故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:49', '2015-10-17 13:59:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2194', '0x08000060', '3', '2', '远端光收发故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:44', '2015-10-17 13:59:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2195', '0x0D81', '1', '2', '远端光收发故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:37', '2015-10-17 13:59:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2196', '0x08000061', '3', '2', '远端光收发故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:29', '2015-10-17 13:59:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2197', '0x0D82', '1', '2', '远端光收发故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:23', '2015-10-17 13:59:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2198', '0x08000062', '3', '2', '远端光收发故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:18', '2015-10-17 13:59:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2199', '0x0D83', '1', '2', '远端光收发故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:59:12', '2015-10-17 13:59:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2200', '0x08000063', '3', '2', '远端光收发故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:58', '2015-10-17 13:58:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2201', '0x0D84', '1', '2', '远端光收发故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:50', '2015-10-17 13:58:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2202', '0x08000064', '3', '2', '远端光收发故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:44', '2015-10-17 13:58:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2203', '0x0D85', '1', '2', '远端光收发故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:38', '2015-10-17 13:58:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2204', '0x08000065', '3', '2', '远端光收发故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:32', '2015-10-17 13:58:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2205', '0x0D86', '1', '2', '远端光收发故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:25', '2015-10-17 13:58:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2206', '0x08000066', '3', '2', '远端光收发故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:19', '2015-10-17 13:58:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2207', '0x0D87', '1', '2', '远端光收发故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:11', '2015-10-17 13:58:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2208', '0x08000067', '3', '2', '远端光收发故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:58:05', '2015-10-17 13:58:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2209', '0x0D88', '1', '2', '远端射频电路故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:57', '2015-10-17 13:57:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2210', '0x08000380', '3', '2', '远端射频电路故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:50', '2015-10-17 13:57:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2211', '0x0D89', '1', '2', '远端射频电路故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:43', '2015-10-17 13:57:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2212', '0x08000381', '3', '2', '远端射频电路故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:37', '2015-10-17 13:57:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2213', '0x0D8A', '1', '2', '远端射频电路故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:28', '2015-10-17 13:57:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2214', '0x08000382', '3', '2', '远端射频电路故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:21', '2015-10-17 13:57:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2215', '0x0D8B', '1', '2', '远端射频电路故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:14', '2015-10-17 13:57:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2216', '0x08000383', '3', '2', '远端射频电路故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:08', '2015-10-17 13:57:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2217', '0x0D8C', '1', '2', '远端射频电路故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:57:02', '2015-10-17 13:57:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2218', '0x08000384', '3', '2', '远端射频电路故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:54', '2015-10-17 13:56:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2219', '0x0D8D', '1', '2', '远端射频电路故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:38', '2015-10-17 13:56:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2220', '0x08000385', '3', '2', '远端射频电路故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:47', '2015-10-17 13:56:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2221', '0x0D8E', '1', '2', '远端射频电路故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:28', '2015-10-17 13:56:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2222', '0x08000386', '3', '2', '远端射频电路故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:19', '2015-10-17 13:56:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2223', '0x0D8F', '1', '2', '远端射频电路故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:13', '2015-10-17 13:56:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2224', '0x08000387', '3', '2', '远端射频电路故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:08', '2015-10-17 13:56:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2225', '0x0D90', '1', '2', '远端链路故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:56:02', '2015-10-17 13:56:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2226', '0x08000480', '3', '2', '远端链路故障告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:55:55', '2015-10-17 13:55:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2227', '0x0D91', '1', '2', '远端链路故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:50:25', '2015-10-17 13:50:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2228', '0x08000481', '3', '2', '远端链路故障告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:50:16', '2015-10-17 13:50:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2229', '0x0D92', '1', '2', '远端链路故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:50:10', '2015-10-17 13:50:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2230', '0x08000482', '3', '2', '远端链路故障告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:50:03', '2015-10-17 13:50:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2231', '0x0D93', '1', '2', '远端链路故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:57', '2015-10-17 13:49:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2232', '0x08000483', '3', '2', '远端链路故障告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:50', '2015-10-17 13:49:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2233', '0x0D94', '1', '2', '远端链路故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:43', '2015-10-17 13:49:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2234', '0x08000484', '3', '2', '远端链路故障告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:38', '2015-10-17 13:49:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2235', '0x0D95', '1', '2', '远端链路故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:31', '2015-10-17 13:49:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2236', '0x08000485', '3', '2', '远端链路故障告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:25', '2015-10-17 13:49:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2237', '0x0D96', '1', '2', '远端链路故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:18', '2015-10-17 13:49:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2238', '0x08000486', '3', '2', '远端链路故障告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:12', '2015-10-17 13:49:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2239', '0x0D97', '1', '2', '远端链路故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:49:05', '2015-10-17 13:49:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2240', '0x08000487', '3', '2', '远端链路故障告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:57', '2015-10-17 13:48:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2241', '0x0D98', '1', '2', '远端设备过温告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:52', '2015-10-17 13:48:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2242', '0x08000600', '3', '2', '远端设备过温告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:45', '2015-10-17 13:48:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2243', '0x0D99', '1', '2', '远端设备过温告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:37', '2015-10-17 13:48:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2244', '0x08000601', '3', '2', '远端设备过温告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:31', '2015-10-17 13:48:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2245', '0x0D9A', '1', '2', '远端设备过温告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:24', '2015-10-17 13:48:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2246', '0x08000602', '3', '2', '远端设备过温告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:18', '2015-10-17 13:48:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2247', '0x0D9B', '1', '2', '远端设备过温告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:12', '2015-10-17 13:48:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2248', '0x08000603', '3', '2', '远端设备过温告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:48:06', '2015-10-17 13:48:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2249', '0x0D9C', '1', '2', '远端设备过温告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:47:58', '2015-10-17 13:47:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2250', '0x08000604', '3', '2', '远端设备过温告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:47:24', '2015-10-17 13:47:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2251', '0x0D9D', '1', '2', '远端设备过温告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:47:16', '2015-10-17 13:47:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2252', '0x08000605', '3', '2', '远端设备过温告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:47:09', '2015-10-17 13:47:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2253', '0x0D9E', '1', '2', '远端设备过温告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:47:00', '2015-10-17 13:47:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2254', '0x08000606', '3', '2', '远端设备过温告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:46:52', '2015-10-17 13:46:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2255', '0x0D9F', '1', '2', '远端设备过温告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:46:42', '2015-10-17 13:46:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2256', '0x08000607', '3', '2', '远端设备过温告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 13:46:35', '2015-10-17 13:46:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2257', '0x0E00', '1', '4', 'GSM远端下行输出欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:46:16', '2015-10-17 13:46:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2258', '0x08001009', '3', '4', 'GSM远端下行输出欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:46:08', '2015-10-17 13:46:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2259', '0x0E01', '1', '4', 'TD-SCDMA远端下行输出欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:46:02', '2015-10-17 13:46:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2261', '0x0E02', '1', '4', 'TD-LTE1远端下行输出欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:45:46', '2015-10-17 13:45:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2263', '0x0E03', '1', '4', 'TD-LTE2远端下行输出欠功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:45:31', '2015-10-17 13:45:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2265', '0x0E04', '1', '4', 'GSM远端下行输出过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:45:14', '2015-10-17 13:45:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2267', '0x0E05', '1', '4', 'TD-SCDMA远端下行输出过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:45:01', '2015-10-17 13:45:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2269', '0x0E06', '1', '4', 'TD-LTE1远端下行输出过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:44:47', '2015-10-17 13:44:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2271', '0x0E07', '1', '4', 'TD-LTE2远端下行输出过功率门限', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 13:44:29', '2015-10-17 13:44:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2273', '0x0E08', '1', '5', 'GSM远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '4294967295', '4', '0', '2015-10-17 13:44:15', '2015-10-17 13:44:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2274', '0x08001080', '3', '5', 'GSM远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '4294967295', '4', '0', '2015-10-17 13:44:07', '2015-10-17 13:44:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2275', '0x0E09', '1', '5', 'TD-SCDMA远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:53', '2015-10-17 13:43:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2276', '0x08004080', '3', '5', 'TD-SCDMA远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:59', '2015-10-17 13:43:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2277', '0x0E0A', '1', '5', 'TD-LTE1远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:40', '2015-10-17 13:43:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2278', '0x08007080', '3', '5', 'TD-LTE1远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:45', '2015-10-17 13:43:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2279', '0x0E0B', '1', '5', 'TD-LTE2远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:34', '2015-10-17 13:43:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2280', '0x08008080', '3', '5', 'TD-LTE2远端下行链路时延1', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:28', '2015-10-17 13:43:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2281', '0x0E0C', '1', '5', 'GSM远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:21', '2015-10-17 13:43:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2282', '0x08001081', '3', '5', 'GSM远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:16', '2015-10-17 13:43:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2283', '0x0E0D', '1', '5', 'TD-SCDMA远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:09', '2015-10-17 13:43:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2284', '0x08004081', '3', '5', 'TD-SCDMA远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:43:01', '2015-10-17 13:43:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2285', '0x0E0E', '1', '5', 'TD-LTE1远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:42:54', '2015-10-17 13:42:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2286', '0x08007081', '3', '5', 'TD-LTE1远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:40:44', '2015-10-17 13:40:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2287', '0x0E0F', '1', '5', 'TD-LTE2远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:40:29', '2015-10-17 13:40:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2288', '0x08008081', '3', '5', 'TD-LTE2远端下行链路时延2', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:40:22', '2015-10-17 13:40:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2289', '0x0E10', '1', '5', 'GSM远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:40:17', '2015-10-17 13:40:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2290', '0x08001082', '3', '5', 'GSM远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:40:10', '2015-10-17 13:40:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2291', '0x0E11', '1', '5', 'TD-SCDMA远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:40:01', '2015-10-17 13:40:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2292', '0x08004082', '3', '5', 'TD-SCDMA远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:55', '2015-10-17 13:39:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2293', '0x0E12', '1', '5', 'TD-LTE1远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:49', '2015-10-17 13:39:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2294', '0x08007082', '3', '5', 'TD-LTE1远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:43', '2015-10-17 13:39:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2295', '0x0E13', '1', '5', 'TD-LTE2远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:37', '2015-10-17 13:39:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2296', '0x08008082', '3', '5', 'TD-LTE2远端下行链路时延3', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:31', '2015-10-17 13:39:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2297', '0x0E14', '1', '5', 'GSM远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:24', '2015-10-17 13:39:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2298', '0x08001083', '3', '5', 'GSM远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:17', '2015-10-17 13:39:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2299', '0x0E15', '1', '5', 'TD-SCDMA远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 13:39:11', '2015-10-17 13:39:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2300', '0x08004083', '3', '5', 'TD-SCDMA远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:13:23', '2015-10-17 12:13:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2301', '0x0E16', '1', '5', 'TD-LTE1远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:13:17', '2015-10-17 12:13:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2302', '0x08007083', '3', '5', 'TD-LTE1远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:13:11', '2015-10-17 12:13:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2303', '0x0E17', '1', '5', 'TD-LTE2远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:13:04', '2015-10-17 12:13:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2304', '0x08008083', '3', '5', 'TD-LTE2远端下行链路时延4', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:58', '2015-10-17 12:12:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2305', '0x0E18', '1', '5', 'GSM远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:53', '2015-10-17 12:12:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2306', '0x08001084', '3', '5', 'GSM远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:46', '2015-10-17 12:12:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2307', '0x0E19', '1', '5', 'TD-SCDMA远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:37', '2015-10-17 12:12:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2308', '0x08004084', '3', '5', 'TD-SCDMA远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:30', '2015-10-17 12:12:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2309', '0x0E1A', '1', '5', 'TD-LTE1远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:24', '2015-10-17 12:12:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2310', '0x08007084', '3', '5', 'TD-LTE1远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:18', '2015-10-17 12:12:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2311', '0x0E1B', '1', '5', 'TD-LTE2远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:12', '2015-10-17 12:12:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2312', '0x08008084', '3', '5', 'TD-LTE2远端下行链路时延5', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:12:06', '2015-10-17 12:12:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2313', '0x0E1C', '1', '5', 'GSM远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:58', '2015-10-17 12:11:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2314', '0x08001085', '3', '5', 'GSM远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:53', '2015-10-17 12:11:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2315', '0x0E1D', '1', '5', 'TD-SCDMA远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:46', '2015-10-17 12:11:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2316', '0x08004085', '3', '5', 'TD-SCDMA远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:40', '2015-10-17 12:11:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2317', '0x0E1E', '1', '5', 'TD-LTE1远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:34', '2015-10-17 12:11:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2318', '0x08007085', '3', '5', 'TD-LTE1远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:28', '2015-10-17 12:11:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2319', '0x0E1F', '1', '5', 'TD-LTE2远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:10', '2015-10-17 12:11:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2320', '0x08008085', '3', '5', 'TD-LTE2远端下行链路时延6', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:11:02', '2015-10-17 12:11:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2321', '0x0E20', '1', '5', 'GSM远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:56', '2015-10-17 12:10:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2322', '0x08001086', '3', '5', 'GSM远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:50', '2015-10-17 12:10:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2323', '0x0E21', '1', '5', 'TD-SCDMA远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:43', '2015-10-17 12:10:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2324', '0x08004086', '3', '5', 'TD-SCDMA远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:37', '2015-10-17 12:10:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2325', '0x0E22', '1', '5', 'TD-LTE1远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:28', '2015-10-17 12:10:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2326', '0x08007086', '3', '5', 'TD-LTE1远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:13', '2015-10-17 12:10:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2327', '0x0E23', '1', '5', 'TD-LTE2远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:20', '2015-10-17 12:10:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2328', '0x08008086', '3', '5', 'TD-LTE2远端下行链路时延7', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:10:07', '2015-10-17 12:10:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2329', '0x0E24', '1', '5', 'GSM远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:56', '2015-10-17 12:09:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2330', '0x08001087', '3', '5', 'GSM远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:50', '2015-10-17 12:09:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2331', '0x0E25', '1', '5', 'TD-SCDMA远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:44', '2015-10-17 12:09:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2332', '0x08004087', '3', '5', 'TD-SCDMA远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:39', '2015-10-17 12:09:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2333', '0x0E26', '1', '5', 'TD-LTE1远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:32', '2015-10-17 12:09:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2334', '0x08007087', '3', '5', 'TD-LTE1远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:24', '2015-10-17 12:09:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2335', '0x0E27', '1', '5', 'TD-LTE2远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:19', '2015-10-17 12:09:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2336', '0x08008087', '3', '5', 'TD-LTE2远端下行链路时延8', 'ro', 'none', '1', 'uint4', '4', '1', '255', '0', '2147483647', '4', '0', '2015-10-17 12:09:13', '2015-10-17 12:09:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2337', '0x0E28', '1', '5', 'GSM下行输出功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:09:03', '2015-10-17 12:09:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2338', '0x08001100', '3', '5', 'GSM下行输出功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:57', '2015-10-17 12:08:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2339', '0x0E29', '1', '5', 'TD-SCDMA下行输出导频功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:48', '2015-10-17 12:08:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2340', '0x08004100', '3', '5', 'TD-SCDMA下行输出导频功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:42', '2015-10-17 12:08:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2341', '0x0E2A', '1', '5', 'TD-LTE1下行输出导频功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:36', '2015-10-17 12:08:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2342', '0x08007100', '3', '5', 'TD-LTE1下行输出导频功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:30', '2015-10-17 12:08:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2343', '0x0E2B', '1', '5', 'TD-LTE2下行输出导频功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:23', '2015-10-17 12:08:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2344', '0x08008100', '3', '5', 'TD-LTE2下行输出导频功率电平1', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:17', '2015-10-17 12:08:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2345', '0x0E2C', '1', '5', 'GSM下行输出功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:12', '2015-10-17 12:08:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2346', '0x08001101', '3', '5', 'GSM下行输出功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:08:04', '2015-10-17 12:08:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2347', '0x0E2D', '1', '5', 'TD-SCDMA下行输出导频功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:58', '2015-10-17 12:07:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2348', '0x08004101', '3', '5', 'TD-SCDMA下行输出导频功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:53', '2015-10-17 12:07:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2349', '0x0E2E', '1', '5', 'TD-LTE1下行输出导频功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:46', '2015-10-17 12:07:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2350', '0x08007101', '3', '5', 'TD-LTE1下行输出导频功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:26', '2015-10-17 12:07:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2351', '0x0E2F', '1', '5', 'TD-LTE2下行输出导频功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:20', '2015-10-17 12:07:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2352', '0x08008101', '3', '5', 'TD-LTE2下行输出导频功率电平2', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:13', '2015-10-17 12:07:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2353', '0x0E30', '1', '5', 'GSM下行输出功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:07', '2015-10-17 12:07:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2354', '0x08001102', '3', '5', 'GSM下行输出功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:07:01', '2015-10-17 12:07:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2355', '0x0E31', '1', '5', 'TD-SCDMA下行输出导频功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:55', '2015-10-17 12:06:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2356', '0x08004102', '3', '5', 'TD-SCDMA下行输出导频功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:48', '2015-10-17 12:06:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2357', '0x0E32', '1', '5', 'TD-LTE1下行输出导频功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:40', '2015-10-17 12:06:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2358', '0x08007102', '3', '5', 'TD-LTE1下行输出导频功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:34', '2015-10-17 12:06:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2359', '0x0E33', '1', '5', 'TD-LTE2下行输出导频功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:29', '2015-10-17 12:06:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2360', '0x08008102', '3', '5', 'TD-LTE2下行输出导频功率电平3', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:22', '2015-10-17 12:06:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2361', '0x0E34', '1', '5', 'GSM下行输出功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:07', '2015-10-17 12:06:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2362', '0x08001103', '3', '5', 'GSM下行输出功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:14', '2015-10-17 12:06:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2363', '0x0E35', '1', '5', 'TD-SCDMA下行输出导频功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:06:01', '2015-10-17 12:06:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2364', '0x08004103', '3', '5', 'TD-SCDMA下行输出导频功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:05:53', '2015-10-17 12:05:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2365', '0x0E36', '1', '5', 'TD-LTE1下行输出导频功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:05:46', '2015-10-17 12:05:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2366', '0x08007103', '3', '5', 'TD-LTE1下行输出导频功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:05:35', '2015-10-17 12:05:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2367', '0x0E37', '1', '5', 'TD-LTE2下行输出导频功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:05:28', '2015-10-17 12:05:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2368', '0x08008103', '3', '5', 'TD-LTE2下行输出导频功率电平4', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:05:20', '2015-10-17 12:05:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2369', '0x0E38', '1', '5', 'GSM下行输出功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:05:06', '2015-10-17 12:05:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2370', '0x08001104', '3', '5', 'GSM下行输出功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:05:13', '2015-10-17 12:05:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2371', '0x0E39', '1', '5', 'TD-SCDMA下行输出导频功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:59', '2015-10-17 12:04:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2372', '0x08004104', '3', '5', 'TD-SCDMA下行输出导频功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:52', '2015-10-17 12:04:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2373', '0x0E3A', '1', '5', 'TD-LTE1下行输出导频功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:39', '2015-10-17 12:04:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2374', '0x08007104', '3', '5', 'TD-LTE1下行输出导频功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:34', '2015-10-17 12:04:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2375', '0x0E3B', '1', '5', 'TD-LTE2下行输出导频功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:29', '2015-10-17 12:04:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2376', '0x08008104', '3', '5', 'TD-LTE2下行输出导频功率电平5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:24', '2015-10-17 12:04:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2377', '0x0E3C', '1', '5', 'GSM下行输出功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:19', '2015-10-17 12:04:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2378', '0x08001105', '3', '5', 'GSM下行输出功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:13', '2015-10-17 12:04:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2379', '0x0E3D', '1', '5', 'TD-SCDMA下行输出导频功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:04:06', '2015-10-17 12:04:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2380', '0x08004105', '3', '5', 'TD-SCDMA下行输出导频功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:55', '2015-10-17 12:03:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2381', '0x0E3E', '1', '5', 'TD-LTE1下行输出导频功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:49', '2015-10-17 12:03:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2382', '0x08007105', '3', '5', 'TD-LTE1下行输出导频功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:43', '2015-10-17 12:03:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2383', '0x0E3F', '1', '5', 'TD-LTE2下行输出导频功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:37', '2015-10-17 12:03:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2384', '0x08008105', '3', '5', 'TD-LTE2下行输出导频功率电平6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:31', '2015-10-17 12:03:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2385', '0x0E40', '1', '5', 'GSM下行输出功率电平7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:25', '2015-10-17 12:03:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2386', '0x08001106', '3', '5', 'GSM下行输出功率电平7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:19', '2015-10-17 12:03:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2387', '0x0E41', '1', '5', 'TD-SCDMA下行输出导频功率电平7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:12', '2015-10-17 12:03:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2388', '0x08004106', '3', '5', 'TD-SCDMA下行输出导频功率电平7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:03:06', '2015-10-17 12:03:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2389', '0x0E42', '1', '5', 'TD-LTE1下行输出导频功率电平7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:58', '2015-10-17 12:02:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2475', '0x0E6D', '1', '5', 'TD-SCDMA远端下行实际增益2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:50', '2015-10-17 12:02:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2476', '0x08004201', '3', '5', 'TD-SCDMA远端下行实际增益2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:44', '2015-10-17 12:02:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2477', '0x0E6E', '1', '5', 'TD-LTE1远端下行实际增益2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:39', '2015-10-17 12:02:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2478', '0x08007201', '3', '5', 'TD-LTE1远端下行实际增益2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:33', '2015-10-17 12:02:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2479', '0x0E6F', '1', '5', 'TD-LTE2远端下行实际增益2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:28', '2015-10-17 12:02:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2480', '0x08008201', '3', '5', 'TD-LTE2远端下行实际增益2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:20', '2015-10-17 12:02:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2481', '0x0E70', '1', '5', 'GSM远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:15', '2015-10-17 12:02:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2482', '0x08001202', '3', '5', 'GSM远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:09', '2015-10-17 12:02:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2483', '0x0E71', '1', '5', 'TD-SCDMA远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:02:03', '2015-10-17 12:02:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2484', '0x08004202', '3', '5', 'TD-SCDMA远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:56', '2015-10-17 12:01:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2485', '0x0E72', '1', '5', 'TD-LTE1远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:42', '2015-10-17 12:01:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2486', '0x08007202', '3', '5', 'TD-LTE1远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:35', '2015-10-17 12:01:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2487', '0x0E73', '1', '5', 'TD-LTE2远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:29', '2015-10-17 12:01:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2488', '0x08008202', '3', '5', 'TD-LTE2远端下行实际增益3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:23', '2015-10-17 12:01:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2489', '0x0E74', '1', '5', 'GSM远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:15', '2015-10-17 12:01:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2490', '0x08001203', '3', '5', 'GSM远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:07', '2015-10-17 12:01:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2491', '0x0E75', '1', '5', 'TD-SCDMA远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:01:01', '2015-10-17 12:01:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2492', '0x08004203', '3', '5', 'TD-SCDMA远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:54', '2015-10-17 12:00:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2493', '0x0E76', '1', '5', 'TD-LTE1远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:48', '2015-10-17 12:00:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2494', '0x08007203', '3', '5', 'TD-LTE1远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:39', '2015-10-17 12:00:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2495', '0x0E77', '1', '5', 'TD-LTE2远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:31', '2015-10-17 12:00:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2496', '0x08008203', '3', '5', 'TD-LTE2远端下行实际增益4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:25', '2015-10-17 12:00:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2497', '0x0E78', '1', '5', 'GSM远端下行实际增益5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:18', '2015-10-17 12:00:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2498', '0x08001204', '3', '5', 'GSM远端下行实际增益5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:08', '2015-10-17 12:00:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2499', '0x0E79', '1', '5', 'TD-SCDMA远端下行实际增益5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 12:00:02', '2015-10-17 12:00:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2500', '0x08004204', '3', '5', 'TD-SCDMA远端下行实际增益5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:46:33', '2015-10-17 18:46:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2501', '0x0E7A', '1', '5', 'TD-LTE1远端下行实际增益5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:46:27', '2015-10-17 18:46:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2502', '0x08007204', '3', '5', 'TD-LTE1远端下行实际增益5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:46:19', '2015-10-17 18:46:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2503', '0x0E7B', '1', '5', 'TD-LTE2远端下行实际增益5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:46:13', '2015-10-17 18:46:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2504', '0x08008204', '3', '5', 'TD-LTE2远端下行实际增益5', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:46:06', '2015-10-17 18:46:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2505', '0x0E7C', '1', '5', 'GSM远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:46:00', '2015-10-17 18:46:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2506', '0x08001205', '3', '5', 'GSM远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 17:47:29', '2015-10-17 17:47:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2507', '0x0E7D', '1', '5', 'TD-SCDMA远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:45:53', '2015-10-17 18:45:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2508', '0x08004205', '3', '5', 'TD-SCDMA远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:45:47', '2015-10-17 18:45:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2509', '0x0E7E', '1', '5', 'TD-LTE1远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:44:58', '2015-10-17 18:44:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2510', '0x08007205', '3', '5', 'TD-LTE1远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:44:53', '2015-10-17 18:44:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2511', '0x0E7F', '1', '5', 'TD-LTE2远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:44:48', '2015-10-17 18:44:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2512', '0x08008205', '3', '5', 'TD-LTE2远端下行实际增益6', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:44:42', '2015-10-17 18:44:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2513', '0x0E80', '1', '5', 'GSM远端下行实际增益7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:44:36', '2015-10-17 18:44:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2514', '0x08001206', '3', '5', 'GSM远端下行实际增益7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:44:29', '2015-10-17 18:44:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2515', '0x0E81', '1', '5', 'TD-SCDMA远端下行实际增益7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:58:13', '2015-10-17 11:58:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2516', '0x08004206', '3', '5', 'TD-SCDMA远端下行实际增益7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:58:06', '2015-10-17 11:58:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2517', '0x0E82', '1', '5', 'TD-LTE1远端下行实际增益7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:58:00', '2015-10-17 11:58:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2518', '0x08007206', '3', '5', 'TD-LTE1远端下行实际增益7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:57:55', '2015-10-17 11:57:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2519', '0x0E83', '1', '5', 'TD-LTE2远端下行实际增益7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:45:31', '2015-10-17 18:45:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2520', '0x08008206', '3', '5', 'TD-LTE2远端下行实际增益7', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:44:17', '2015-10-17 18:44:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2521', '0x0E84', '1', '5', 'GSM远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:45:37', '2015-10-17 18:45:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2522', '0x08001207', '3', '5', 'GSM远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:45:24', '2015-10-17 18:45:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2523', '0x0E85', '1', '5', 'TD-SCDMA远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:45:19', '2015-10-17 18:45:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2524', '0x08004207', '3', '5', 'TD-SCDMA远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 18:45:12', '2015-10-17 18:45:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2525', '0x0E86', '1', '5', 'TD-LTE1远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:54:37', '2015-10-17 11:54:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2526', '0x08007207', '3', '5', 'TD-LTE1远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:54:28', '2015-10-17 11:54:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2527', '0x0E87', '1', '5', 'TD-LTE2远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:54:18', '2015-10-17 11:54:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2528', '0x08008207', '3', '5', 'TD-LTE2远端下行实际增益8', 'ro', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 11:54:06', '2015-10-17 11:54:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2529', '0x0E88', '1', '4', 'GSM远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:50:23', '2015-10-17 11:50:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2530', '0x08001280', '3', '4', 'GSM远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:50:16', '2015-10-17 11:50:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2531', '0x0E89', '1', '4', 'TD-SCDMA远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:50:08', '2015-10-17 11:50:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2532', '0x08004280', '3', '4', 'TD-SCDMA远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:50:02', '2015-10-17 11:50:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2533', '0x0E8A', '1', '4', 'TD-LTE1远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:49:57', '2015-10-17 11:49:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2534', '0x08007280', '3', '4', 'TD-LTE1远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:49:49', '2015-10-17 11:49:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2535', '0x0E8B', '1', '4', 'TD-LTE2远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:49:31', '2015-10-17 11:49:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2536', '0x08008280', '3', '4', 'TD-LTE2远端射频信号开关状态1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:49:24', '2015-10-17 11:49:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2537', '0x0E8C', '1', '4', 'GSM远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:49:18', '2015-10-17 11:49:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2538', '0x08001281', '3', '4', 'GSM远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:49:12', '2015-10-17 11:49:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2539', '0x0E8D', '1', '4', 'TD-SCDMA远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:49:05', '2015-10-17 11:49:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2540', '0x08004281', '3', '4', 'TD-SCDMA远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:58', '2015-10-17 11:48:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2541', '0x0E8E', '1', '4', 'TD-LTE1远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:52', '2015-10-17 11:48:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2542', '0x08007281', '3', '4', 'TD-LTE1远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:45', '2015-10-17 11:48:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2543', '0x0E8F', '1', '4', 'TD-LTE2远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:38', '2015-10-17 11:48:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2544', '0x08008281', '3', '4', 'TD-LTE2远端射频信号开关状态2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:32', '2015-10-17 11:48:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2545', '0x0E90', '1', '4', 'GSM远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:23', '2015-10-17 11:48:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2546', '0x08001282', '3', '4', 'GSM远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:14', '2015-10-17 11:48:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2547', '0x0E91', '1', '4', 'TD-SCDMA远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:48:06', '2015-10-17 11:48:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2548', '0x08004282', '3', '4', 'TD-SCDMA远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:59', '2015-10-17 11:47:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2549', '0x0E92', '1', '4', 'TD-LTE1远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:52', '2015-10-17 11:47:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2550', '0x08007282', '3', '4', 'TD-LTE1远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:46', '2015-10-17 11:47:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2551', '0x0E93', '1', '4', 'TD-LTE2远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:40', '2015-10-17 11:47:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2552', '0x08008282', '3', '4', 'TD-LTE2远端射频信号开关状态3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:34', '2015-10-17 11:47:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2553', '0x0E94', '1', '4', 'GSM远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:27', '2015-10-17 11:47:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2554', '0x08001283', '3', '4', 'GSM远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:20', '2015-10-17 11:47:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2555', '0x0E95', '1', '4', 'TD-SCDMA远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:11', '2015-10-17 11:47:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2556', '0x08004283', '3', '4', 'TD-SCDMA远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:47:05', '2015-10-17 11:47:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2557', '0x0E96', '1', '4', 'TD-LTE1远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:59', '2015-10-17 11:46:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2558', '0x08007283', '3', '4', 'TD-LTE1远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:52', '2015-10-17 11:46:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2559', '0x0E97', '1', '4', 'TD-LTE2远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:44', '2015-10-17 11:46:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2560', '0x08008283', '3', '4', 'TD-LTE2远端射频信号开关状态4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:39', '2015-10-17 11:46:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2561', '0x0E98', '1', '4', 'GSM远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:31', '2015-10-17 11:46:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2562', '0x08001284', '3', '4', 'GSM远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:15', '2015-10-17 11:46:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2563', '0x0E99', '1', '4', 'TD-SCDMA远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:22', '2015-10-17 11:46:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2564', '0x08004284', '3', '4', 'TD-SCDMA远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:08', '2015-10-17 11:46:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2565', '0x0E9A', '1', '4', 'TD-LTE1远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:46:01', '2015-10-17 11:46:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2566', '0x08007284', '3', '4', 'TD-LTE1远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:45:54', '2015-10-17 11:45:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2567', '0x0E9B', '1', '4', 'TD-LTE2远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:45:42', '2015-10-17 11:45:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2568', '0x08008284', '3', '4', 'TD-LTE2远端射频信号开关状态5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:45:31', '2015-10-17 11:45:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2569', '0x0E9C', '1', '4', 'GSM远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:45:22', '2015-10-17 11:45:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2570', '0x08001285', '3', '4', 'GSM远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:45:16', '2015-10-17 11:45:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2571', '0x0E9D', '1', '4', 'TD-SCDMA远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:45:08', '2015-10-17 11:45:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2572', '0x08004285', '3', '4', 'TD-SCDMA远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:45:02', '2015-10-17 11:45:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2573', '0x0E9E', '1', '4', 'TD-LTE1远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:44:55', '2015-10-17 11:44:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2574', '0x08007285', '3', '4', 'TD-LTE1远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:44:49', '2015-10-17 11:44:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2575', '0x0E9F', '1', '4', 'TD-LTE2远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:44:42', '2015-10-17 11:44:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2576', '0x08008285', '3', '4', 'TD-LTE2远端射频信号开关状态6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:44:31', '2015-10-17 11:44:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2577', '0x0EA0', '1', '4', 'GSM远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:44:17', '2015-10-17 11:44:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2578', '0x08001286', '3', '4', 'GSM远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:44:10', '2015-10-17 11:44:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2579', '0x0EA1', '1', '4', 'TD-SCDMA远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:44:04', '2015-10-17 11:44:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2580', '0x08004286', '3', '4', 'TD-SCDMA远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:43:58', '2015-10-17 11:43:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2581', '0x0EA2', '1', '4', 'TD-LTE1远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:43:51', '2015-10-17 11:43:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2582', '0x08007286', '3', '4', 'TD-LTE1远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:43:46', '2015-10-17 11:43:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2583', '0x0EA3', '1', '4', 'TD-LTE2远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:43:36', '2015-10-17 11:43:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2584', '0x08008286', '3', '4', 'TD-LTE2远端射频信号开关状态7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:43:29', '2015-10-17 11:43:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2585', '0x0EA4', '1', '4', 'GSM远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:43:14', '2015-10-17 11:43:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2586', '0x08001287', '3', '4', 'GSM远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:43:07', '2015-10-17 11:43:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2587', '0x0EA5', '1', '4', 'TD-SCDMA远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:42:54', '2015-10-17 11:42:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2588', '0x08004287', '3', '4', 'TD-SCDMA远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:42:48', '2015-10-17 11:42:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2589', '0x0EA6', '1', '4', 'TD-LTE1远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:42:42', '2015-10-17 11:42:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2590', '0x08007287', '3', '4', 'TD-LTE1远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:42:34', '2015-10-17 11:42:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2591', '0x0EA7', '1', '4', 'TD-LTE2远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:42:25', '2015-10-17 11:42:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2592', '0x08008287', '3', '4', 'TD-LTE2远端射频信号开关状态8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:42:15', '2015-10-17 11:42:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2593', '0x0EA8', '1', '4', 'GSM远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:56', '2015-10-17 11:41:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2594', '0x08001300', '3', '4', 'GSM远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:49', '2015-10-17 11:41:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2595', '0x0EA9', '1', '4', 'TD-SCDMA远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:42', '2015-10-17 11:41:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2596', '0x08004300', '3', '4', 'TD-SCDMA远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:30', '2015-10-17 11:41:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2597', '0x0EAA', '1', '4', 'TD-LTE1远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:25', '2015-10-17 11:41:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2598', '0x08007300', '3', '4', 'TD-LTE1远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:19', '2015-10-17 11:41:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2599', '0x0EAB', '1', '4', 'TD-LTE2远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:14', '2015-10-17 11:41:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2600', '0x08008300', '3', '4', 'TD-LTE2远端上行衰减值1', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:08', '2015-10-17 11:41:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2601', '0x0EAC', '1', '4', 'GSM远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:41:02', '2015-10-17 11:41:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2602', '0x08001301', '3', '4', 'GSM远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:56', '2015-10-17 11:40:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2603', '0x0EAD', '1', '4', 'TD-SCDMA远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:51', '2015-10-17 11:40:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2604', '0x08004301', '3', '4', 'TD-SCDMA远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:44', '2015-10-17 11:40:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2605', '0x0EAE', '1', '4', 'TD-LTE1远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:38', '2015-10-17 11:40:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2606', '0x08007301', '3', '4', 'TD-LTE1远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:30', '2015-10-17 11:40:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2607', '0x0EAF', '1', '4', 'TD-LTE2远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:22', '2015-10-17 11:40:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2608', '0x08008301', '3', '4', 'TD-LTE2远端上行衰减值2', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:09', '2015-10-17 11:40:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2609', '0x0EB0', '1', '4', 'GSM远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:40:03', '2015-10-17 11:40:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2610', '0x08001302', '3', '4', 'GSM远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:57', '2015-10-17 11:39:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2611', '0x0EB1', '1', '4', 'TD-SCDMA远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:51', '2015-10-17 11:39:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2612', '0x08004302', '3', '4', 'TD-SCDMA远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:45', '2015-10-17 11:39:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2613', '0x0EB2', '1', '4', 'TD-LTE1远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:38', '2015-10-17 11:39:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2614', '0x08007302', '3', '4', 'TD-LTE1远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:30', '2015-10-17 11:39:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2615', '0x0EB3', '1', '4', 'TD-LTE2远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:22', '2015-10-17 11:39:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2616', '0x08008302', '3', '4', 'TD-LTE2远端上行衰减值3', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:16', '2015-10-17 11:39:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2617', '0x0EB4', '1', '4', 'GSM远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:39:09', '2015-10-17 11:39:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2618', '0x08001303', '3', '4', 'GSM远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:38:42', '2015-10-17 11:38:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2619', '0x0EB5', '1', '4', 'TD-SCDMA远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:38:35', '2015-10-17 11:38:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2620', '0x08004303', '3', '4', 'TD-SCDMA远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:38:28', '2015-10-17 11:38:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2621', '0x0EB6', '1', '4', 'TD-LTE1远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:38:21', '2015-10-17 11:38:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2622', '0x08007303', '3', '4', 'TD-LTE1远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:38:15', '2015-10-17 11:38:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2623', '0x0EB7', '1', '4', 'TD-LTE2远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:38:07', '2015-10-17 11:38:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2624', '0x08008303', '3', '4', 'TD-LTE2远端上行衰减值4', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:38:00', '2015-10-17 11:38:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2625', '0x0EB8', '1', '4', 'GSM远端上行衰减值5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:52', '2015-10-17 11:37:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2626', '0x08001304', '3', '4', 'GSM远端上行衰减值5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:46', '2015-10-17 11:37:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2627', '0x0EB9', '1', '4', 'TD-SCDMA远端上行衰减值5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:38', '2015-10-17 11:37:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2628', '0x08004304', '3', '4', 'TD-SCDMA远端上行衰减值5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:31', '2015-10-17 11:37:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2696', '0x08008384', '3', '4', 'TD-LTE2远端下行衰减值5', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:25', '2015-10-17 11:37:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2697', '0x0EDC', '1', '4', 'GSM远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:19', '2015-10-17 11:37:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2698', '0x08001385', '3', '4', 'GSM远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:13', '2015-10-17 11:37:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2699', '0x0EDD', '1', '4', 'TD-SCDMA远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:06', '2015-10-17 11:37:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2700', '0x08004385', '3', '4', 'TD-SCDMA远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:37:00', '2015-10-17 11:37:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2701', '0x0EDE', '1', '4', 'TD-LTE1远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:54', '2015-10-17 11:36:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2702', '0x08007385', '3', '4', 'TD-LTE1远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:41', '2015-10-17 11:36:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2703', '0x0EDF', '1', '4', 'TD-LTE2远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:34', '2015-10-17 11:36:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2704', '0x08008385', '3', '4', 'TD-LTE2远端下行衰减值6', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:27', '2015-10-17 11:36:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2705', '0x0EE0', '1', '4', 'GSM远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:21', '2015-10-17 11:36:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2706', '0x08001386', '3', '4', 'GSM远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:14', '2015-10-17 11:36:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2707', '0x0EE1', '1', '4', 'TD-SCDMA远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:07', '2015-10-17 11:36:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2708', '0x08004386', '3', '4', 'TD-SCDMA远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:36:01', '2015-10-17 11:36:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2709', '0x0EE2', '1', '4', 'TD-LTE1远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:54', '2015-10-17 11:35:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2710', '0x08007386', '3', '4', 'TD-LTE1远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:48', '2015-10-17 11:35:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2711', '0x0EE3', '1', '4', 'TD-LTE2远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:42', '2015-10-17 11:35:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2712', '0x08008386', '3', '4', 'TD-LTE2远端下行衰减值7', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:36', '2015-10-17 11:35:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2713', '0x0EE4', '1', '4', 'GSM远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:27', '2015-10-17 11:35:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2714', '0x08001387', '3', '4', 'GSM远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:21', '2015-10-17 11:35:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2715', '0x0EE5', '1', '4', 'TD-SCDMA远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:15', '2015-10-17 11:35:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2716', '0x08004387', '3', '4', 'TD-SCDMA远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:08', '2015-10-17 11:35:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2717', '0x0EE6', '1', '4', 'TD-LTE1远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:35:00', '2015-10-17 11:35:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2718', '0x08007387', '3', '4', 'TD-LTE1远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:34:50', '2015-10-17 11:34:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2719', '0x0EE7', '1', '4', 'TD-LTE2远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:34:40', '2015-10-17 11:34:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2720', '0x08008387', '3', '4', 'TD-LTE2远端下行衰减值8', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '127', '4', '0', '2015-10-17 11:29:24', '2015-10-17 11:29:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2721', '0x0EE8', '1', '3', 'GSM远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:28:51', '2015-10-17 11:28:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2722', '0x08001400', '3', '3', 'GSM远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:28:38', '2015-10-17 11:28:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2723', '0x0EE9', '1', '3', 'TD-SCDMA远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:28:31', '2015-10-17 11:28:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2724', '0x08004400', '3', '3', 'TD-SCDMA远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:28:23', '2015-10-17 11:28:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2725', '0x0EEA', '1', '3', 'TD-LTE1远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:28:16', '2015-10-17 11:28:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2726', '0x08007400', '3', '3', 'TD-LTE1远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:28:11', '2015-10-17 11:28:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2727', '0x0EEB', '1', '3', 'TD-LTE2远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:28:05', '2015-10-17 11:28:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2728', '0x08008400', '3', '3', 'TD-LTE2远端下行输出欠功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:57', '2015-10-17 11:27:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2729', '0x0EEC', '1', '3', 'GSM远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:51', '2015-10-17 11:27:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2730', '0x08001401', '3', '3', 'GSM远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:44', '2015-10-17 11:27:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2731', '0x0EED', '1', '3', 'TD-SCDMA远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:36', '2015-10-17 11:27:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2732', '0x08004401', '3', '3', 'TD-SCDMA远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:27', '2015-10-17 11:27:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2733', '0x0EEE', '1', '3', 'TD-LTE1远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:13', '2015-10-17 11:27:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2734', '0x08007401', '3', '3', 'TD-LTE1远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:20', '2015-10-17 11:27:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2735', '0x0EEF', '1', '3', 'TD-LTE2远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:27:05', '2015-10-17 11:27:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2736', '0x08008401', '3', '3', 'TD-LTE2远端下行输出欠功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:59', '2015-10-17 11:26:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2737', '0x0EF0', '1', '3', 'GSM远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:53', '2015-10-17 11:26:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2738', '0x08001402', '3', '3', 'GSM远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:46', '2015-10-17 11:26:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2739', '0x0EF1', '1', '3', 'TD-SCDMA远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:39', '2015-10-17 11:26:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2740', '0x08004402', '3', '3', 'TD-SCDMA远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:32', '2015-10-17 11:26:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2741', '0x0EF2', '1', '3', 'TD-LTE1远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:26', '2015-10-17 11:26:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2742', '0x08007402', '3', '3', 'TD-LTE1远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:20', '2015-10-17 11:26:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2743', '0x0EF3', '1', '3', 'TD-LTE2远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:13', '2015-10-17 11:26:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2744', '0x08008402', '3', '3', 'TD-LTE2远端下行输出欠功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:06', '2015-10-17 11:26:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2745', '0x0EF4', '1', '3', 'GSM远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:26:00', '2015-10-17 11:26:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2746', '0x08001403', '3', '3', 'GSM远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:25:52', '2015-10-17 11:25:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2747', '0x0EF5', '1', '3', 'TD-SCDMA远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:25:45', '2015-10-17 11:25:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2748', '0x08004403', '3', '3', 'TD-SCDMA远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:25:36', '2015-10-17 11:25:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2749', '0x0EF6', '1', '3', 'TD-LTE1远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:25:26', '2015-10-17 11:25:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2750', '0x08007403', '3', '3', 'TD-LTE1远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:25:17', '2015-10-17 11:25:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2751', '0x0EF7', '1', '3', 'TD-LTE2远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:25:07', '2015-10-17 11:25:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2752', '0x08008403', '3', '3', 'TD-LTE2远端下行输出欠功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:45', '2015-10-17 11:24:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2753', '0x0EF8', '1', '3', 'GSM远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:39', '2015-10-17 11:24:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2754', '0x08001404', '3', '3', 'GSM远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:32', '2015-10-17 11:24:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2755', '0x0EF9', '1', '3', 'TD-SCDMA远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:26', '2015-10-17 11:24:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2756', '0x08004404', '3', '3', 'TD-SCDMA远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:20', '2015-10-17 11:24:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2757', '0x0EFA', '1', '3', 'TD-LTE1远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:14', '2015-10-17 11:24:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2758', '0x08007404', '3', '3', 'TD-LTE1远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:08', '2015-10-17 11:24:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2759', '0x0EFB', '1', '3', 'TD-LTE2远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:24:00', '2015-10-17 11:24:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2760', '0x08008404', '3', '3', 'TD-LTE2远端下行输出欠功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:23:53', '2015-10-17 11:23:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2761', '0x0EFC', '1', '3', 'GSM远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:23:44', '2015-10-17 11:23:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2762', '0x08001405', '3', '3', 'GSM远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:23:38', '2015-10-17 11:23:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2763', '0x0EFD', '1', '3', 'TD-SCDMA远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:23:29', '2015-10-17 11:23:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2764', '0x08004405', '3', '3', 'TD-SCDMA远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:23:21', '2015-10-17 11:23:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2765', '0x0EFE', '1', '3', 'TD-LTE1远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:23:12', '2015-10-17 11:23:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2766', '0x08007405', '3', '3', 'TD-LTE1远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:23:05', '2015-10-17 11:23:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2767', '0x0EFF', '1', '3', 'TD-LTE2远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:58', '2015-10-17 11:22:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2768', '0x08008405', '3', '3', 'TD-LTE2远端下行输出欠功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:53', '2015-10-17 11:22:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2769', '0x0F00', '1', '3', 'GSM远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:45', '2015-10-17 11:22:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2770', '0x08001406', '3', '3', 'GSM远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:39', '2015-10-17 11:22:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2771', '0x0F01', '1', '3', 'TD-SCDMA远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:31', '2015-10-17 11:22:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2772', '0x08004406', '3', '3', 'TD-SCDMA远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:24', '2015-10-17 11:22:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2773', '0x0F02', '1', '3', 'TD-LTE1远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:17', '2015-10-17 11:22:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2774', '0x08007406', '3', '3', 'TD-LTE1远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:10', '2015-10-17 11:22:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2775', '0x0F03', '1', '3', 'TD-LTE2远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:22:04', '2015-10-17 11:22:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2776', '0x08008406', '3', '3', 'TD-LTE2远端下行输出欠功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:21:40', '2015-10-17 11:21:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2777', '0x0F04', '1', '3', 'GSM远端下行输出欠功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:21:51', '2015-10-17 11:21:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2839', '0x0F23', '1', '2', 'TD-LTE2远端下行输出欠功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:21:00', '2015-10-17 11:21:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2840', '0x08008486', '3', '2', 'TD-LTE2远端下行输出欠功率告警7', 'rn', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 18:08:46', '2015-10-17 18:08:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2841', '0x0F24', '1', '2', 'GSM远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:20:47', '2015-10-17 11:20:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2842', '0x08001487', '3', '2', 'GSM远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:20:39', '2015-10-17 11:20:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2843', '0x0F25', '1', '2', 'TD-SCDMA远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:20:29', '2015-10-17 11:20:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2844', '0x08004487', '3', '2', 'TD-SCDMA远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:20:22', '2015-10-17 11:20:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2845', '0x0F26', '1', '2', 'TD-LTE1远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:20:16', '2015-10-17 11:20:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2846', '0x08007487', '3', '2', 'TD-LTE1远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:20:09', '2015-10-17 11:20:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2847', '0x0F27', '1', '2', 'TD-LTE2远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:20:03', '2015-10-17 11:20:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2848', '0x08008487', '3', '2', 'TD-LTE2远端下行输出欠功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:19:56', '2015-10-17 11:19:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2849', '0x0F28', '1', '3', 'GSM远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:19:47', '2015-10-17 11:19:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2850', '0x08001500', '3', '3', 'GSM远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:19:37', '2015-10-17 11:19:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2851', '0x0F29', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:19:08', '2015-10-17 11:19:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2852', '0x08004500', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:19:02', '2015-10-17 11:19:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2853', '0x0F2A', '1', '3', 'TD-LTE1远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:55', '2015-10-17 11:18:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2854', '0x08007500', '3', '3', 'TD-LTE1远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:47', '2015-10-17 11:18:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2855', '0x0F2B', '1', '3', 'TD-LTE2远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:39', '2015-10-17 11:18:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2856', '0x08008500', '3', '3', 'TD-LTE2远端下行输出过功率告警使能1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:33', '2015-10-17 11:18:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2857', '0x0F2C', '1', '3', 'GSM远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:28', '2015-10-17 11:18:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2858', '0x08001501', '3', '3', 'GSM远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:23', '2015-10-17 11:18:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2859', '0x0F2D', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:17', '2015-10-17 11:18:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2860', '0x08004501', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:11', '2015-10-17 11:18:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2861', '0x0F2E', '1', '3', 'TD-LTE1远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:18:06', '2015-10-17 11:18:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2862', '0x08007501', '3', '3', 'TD-LTE1远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:17:58', '2015-10-17 11:17:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2863', '0x0F2F', '1', '3', 'TD-LTE2远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:17:21', '2015-10-17 11:17:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2864', '0x08008501', '3', '3', 'TD-LTE2远端下行输出过功率告警使能2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:17:14', '2015-10-17 11:17:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2865', '0x0F30', '1', '3', 'GSM远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:17:08', '2015-10-17 11:17:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2866', '0x08001502', '3', '3', 'GSM远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:58', '2015-10-17 11:16:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2867', '0x0F31', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:52', '2015-10-17 11:16:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2868', '0x08004502', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:46', '2015-10-17 11:16:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2869', '0x0F32', '1', '3', 'TD-LTE1远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:39', '2015-10-17 11:16:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2870', '0x08007502', '3', '3', 'TD-LTE1远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:28', '2015-10-17 11:16:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2871', '0x0F33', '1', '3', 'TD-LTE2远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:22', '2015-10-17 11:16:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2872', '0x08008502', '3', '3', 'TD-LTE2远端下行输出过功率告警使能3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:16', '2015-10-17 11:16:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2873', '0x0F34', '1', '3', 'GSM远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:09', '2015-10-17 11:16:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2874', '0x08001503', '3', '3', 'GSM远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:16:03', '2015-10-17 11:16:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2875', '0x0F35', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:57', '2015-10-17 11:15:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2876', '0x08004503', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:51', '2015-10-17 11:15:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2877', '0x0F36', '1', '3', 'TD-LTE1远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:44', '2015-10-17 11:15:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2878', '0x08007503', '3', '3', 'TD-LTE1远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:37', '2015-10-17 11:15:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2879', '0x0F37', '1', '3', 'TD-LTE2远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:31', '2015-10-17 11:15:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2880', '0x08008503', '3', '3', 'TD-LTE2远端下行输出过功率告警使能4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:25', '2015-10-17 11:15:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2881', '0x0F38', '1', '3', 'GSM远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:18', '2015-10-17 11:15:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2882', '0x08001504', '3', '3', 'GSM远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:11', '2015-10-17 11:15:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2883', '0x0F39', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:15:05', '2015-10-17 11:15:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2884', '0x08004504', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:53', '2015-10-17 11:14:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2885', '0x0F3A', '1', '3', 'TD-LTE1远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:46', '2015-10-17 11:14:46', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2886', '0x08007504', '3', '3', 'TD-LTE1远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:40', '2015-10-17 11:14:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2887', '0x0F3B', '1', '3', 'TD-LTE2远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:33', '2015-10-17 11:14:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2888', '0x08008504', '3', '3', 'TD-LTE2远端下行输出过功率告警使能5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:27', '2015-10-17 11:14:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2889', '0x0F3C', '1', '3', 'GSM远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:22', '2015-10-17 11:14:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2890', '0x08001505', '3', '3', 'GSM远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:15', '2015-10-17 11:14:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2891', '0x0F3D', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:08', '2015-10-17 11:14:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2892', '0x08004505', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:14:01', '2015-10-17 11:14:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2893', '0x0F3E', '1', '3', 'TD-LTE1远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:56', '2015-10-17 11:13:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2894', '0x08007505', '3', '3', 'TD-LTE1远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:44', '2015-10-17 11:13:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2895', '0x0F3F', '1', '3', 'TD-LTE2远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:50', '2015-10-17 11:13:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2896', '0x08008505', '3', '3', 'TD-LTE2远端下行输出过功率告警使能6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:37', '2015-10-17 11:13:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2897', '0x0F40', '1', '3', 'GSM远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:31', '2015-10-17 11:13:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2898', '0x08001506', '3', '3', 'GSM远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:26', '2015-10-17 11:13:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2899', '0x0F41', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:18', '2015-10-17 11:13:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2900', '0x08004506', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:13', '2015-10-17 11:13:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2901', '0x0F42', '1', '3', 'TD-LTE1远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:08', '2015-10-17 11:13:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2902', '0x08007506', '3', '3', 'TD-LTE1远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:13:01', '2015-10-17 11:13:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2903', '0x0F43', '1', '3', 'TD-LTE2远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:12:56', '2015-10-17 11:12:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2904', '0x08008506', '3', '3', 'TD-LTE2远端下行输出过功率告警使能7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:12:51', '2015-10-17 11:12:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2905', '0x0F44', '1', '3', 'GSM远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:12:43', '2015-10-17 11:12:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2906', '0x08001507', '3', '3', 'GSM远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:12:35', '2015-10-17 11:12:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2907', '0x0F45', '1', '3', 'TD-SCDMA远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:12:24', '2015-10-17 11:12:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2908', '0x08004507', '3', '3', 'TD-SCDMA远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:59', '2015-10-17 11:11:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2909', '0x0F46', '1', '3', 'TD-LTE1远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:52', '2015-10-17 11:11:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2910', '0x08007507', '3', '3', 'TD-LTE1远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:45', '2015-10-17 11:11:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2911', '0x0F47', '1', '3', 'TD-LTE2远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:37', '2015-10-17 11:11:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2912', '0x08008507', '3', '3', 'TD-LTE2远端下行输出过功率告警使能8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:29', '2015-10-17 11:11:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2913', '0x0F48', '1', '2', 'GSM远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:17', '2015-10-17 11:11:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2914', '0x08001580', '3', '2', 'GSM远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:10', '2015-10-17 11:11:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2915', '0x0F49', '1', '2', 'TD-SCDMA远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:11:04', '2015-10-17 11:11:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2916', '0x08004580', '3', '2', 'TD-SCDMA远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:56', '2015-10-17 11:10:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2917', '0x0F4A', '1', '2', 'TD-LTE1远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:49', '2015-10-17 11:10:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2918', '0x08007580', '3', '2', 'TD-LTE1远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:40', '2015-10-17 11:10:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2919', '0x0F4B', '1', '2', 'TD-LTE2远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:34', '2015-10-17 11:10:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2920', '0x08008580', '3', '2', 'TD-LTE2远端下行输出过功率告警1', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:09:18', '2015-10-17 11:09:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2921', '0x0F4C', '1', '2', 'GSM远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:27', '2015-10-17 11:10:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2922', '0x08001581', '3', '2', 'GSM远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:20', '2015-10-17 11:10:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2923', '0x0F4D', '1', '2', 'TD-SCDMA远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:14', '2015-10-17 11:10:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2924', '0x08004581', '3', '2', 'TD-SCDMA远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:10:06', '2015-10-17 11:10:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2925', '0x0F4E', '1', '2', 'TD-LTE1远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:09:59', '2015-10-17 11:09:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2926', '0x08007581', '3', '2', 'TD-LTE1远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:09:53', '2015-10-17 11:09:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2927', '0x0F4F', '1', '2', 'TD-LTE2远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:09:41', '2015-10-17 11:09:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2928', '0x08008581', '3', '2', 'TD-LTE2远端下行输出过功率告警2', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:09:34', '2015-10-17 11:09:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2929', '0x0F50', '1', '2', 'GSM远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:09:07', '2015-10-17 11:09:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2930', '0x08001582', '3', '2', 'GSM远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:09:00', '2015-10-17 11:09:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2931', '0x0F51', '1', '2', 'TD-SCDMA远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:08:41', '2015-10-17 11:08:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2932', '0x08004582', '3', '2', 'TD-SCDMA远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:08:34', '2015-10-17 11:08:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2933', '0x0F52', '1', '2', 'TD-LTE1远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:08:27', '2015-10-17 11:08:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2934', '0x08007582', '3', '2', 'TD-LTE1远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:08:20', '2015-10-17 11:08:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2935', '0x0F53', '1', '2', 'TD-LTE2远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:08:12', '2015-10-17 11:08:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2936', '0x08008582', '3', '2', 'TD-LTE2远端下行输出过功率告警3', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 11:07:57', '2015-10-17 11:07:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2937', '0x0F54', '1', '2', 'GSM远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:30:51', '2015-10-17 10:30:51', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2938', '0x08001583', '3', '2', 'GSM远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:30:40', '2015-10-17 10:30:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2939', '0x0F55', '1', '2', 'TD-SCDMA远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:30:34', '2015-10-17 10:30:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2940', '0x08004583', '3', '2', 'TD-SCDMA远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:30:21', '2015-10-17 10:30:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2941', '0x0F56', '1', '2', 'TD-LTE1远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:30:15', '2015-10-17 10:30:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2942', '0x08007583', '3', '2', 'TD-LTE1远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:30:08', '2015-10-17 10:30:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2943', '0x0F57', '1', '2', 'TD-LTE2远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:30:01', '2015-10-17 10:30:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2944', '0x08008583', '3', '2', 'TD-LTE2远端下行输出过功率告警4', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:53', '2015-10-17 10:29:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2945', '0x0F58', '1', '2', 'GSM远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:47', '2015-10-17 10:29:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2946', '0x08001584', '3', '2', 'GSM远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:40', '2015-10-17 10:29:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2947', '0x0F59', '1', '2', 'TD-SCDMA远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:32', '2015-10-17 10:29:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2948', '0x08004584', '3', '2', 'TD-SCDMA远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:26', '2015-10-17 10:29:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2949', '0x0F5A', '1', '2', 'TD-LTE1远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:19', '2015-10-17 10:29:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2950', '0x08007584', '3', '2', 'TD-LTE1远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:13', '2015-10-17 10:29:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2951', '0x0F5B', '1', '2', 'TD-LTE2远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:29:06', '2015-10-17 10:29:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2952', '0x08008584', '3', '2', 'TD-LTE2远端下行输出过功率告警5', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:28:57', '2015-10-17 10:28:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2953', '0x0F5C', '1', '2', 'GSM远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:28:01', '2015-10-17 10:28:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2954', '0x08001585', '3', '2', 'GSM远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:27:50', '2015-10-17 10:27:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2955', '0x0F5D', '1', '2', 'TD-SCDMA远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:27:38', '2015-10-17 10:27:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2956', '0x08004585', '3', '2', 'TD-SCDMA远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:27:31', '2015-10-17 10:27:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2957', '0x0F5E', '1', '2', 'TD-LTE1远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:27:23', '2015-10-17 10:27:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2958', '0x08007585', '3', '2', 'TD-LTE1远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:27:14', '2015-10-17 10:27:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2959', '0x0F5F', '1', '2', 'TD-LTE2远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:27:01', '2015-10-17 10:27:01', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2960', '0x08008585', '3', '2', 'TD-LTE2远端下行输出过功率告警6', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:26:52', '2015-10-17 10:26:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2961', '0x0F60', '1', '2', 'GSM远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:26:38', '2015-10-17 10:26:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2962', '0x08001586', '3', '2', 'GSM远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:26:23', '2015-10-17 10:26:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2963', '0x0F61', '1', '2', 'TD-SCDMA远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:26:02', '2015-10-17 10:26:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2964', '0x08004586', '3', '2', 'TD-SCDMA远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:25:53', '2015-10-17 10:25:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2965', '0x0F62', '1', '2', 'TD-LTE1远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:25:45', '2015-10-17 10:25:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2966', '0x08007586', '3', '2', 'TD-LTE1远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:25:38', '2015-10-17 10:25:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2967', '0x0F63', '1', '2', 'TD-LTE2远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:25:31', '2015-10-17 10:25:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2968', '0x08008586', '3', '2', 'TD-LTE2远端下行输出过功率告警7', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:25:24', '2015-10-17 10:25:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2969', '0x0F64', '1', '2', 'GSM远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:25:16', '2015-10-17 10:25:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2970', '0x08001587', '3', '2', 'GSM远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:25:07', '2015-10-17 10:25:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2971', '0x0F65', '1', '2', 'TD-SCDMA远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:24:58', '2015-10-17 10:24:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2972', '0x08004587', '3', '2', 'TD-SCDMA远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:24:47', '2015-10-17 10:24:47', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2973', '0x0F66', '1', '2', 'TD-LTE1远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:24:36', '2015-10-17 10:24:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2974', '0x08007587', '3', '2', 'TD-LTE1远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:24:29', '2015-10-17 10:24:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2975', '0x0F67', '1', '2', 'TD-LTE2远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:24:22', '2015-10-17 10:24:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2976', '0x08008587', '3', '2', 'TD-LTE2远端下行输出过功率告警8', 'rw', 'none', '1', 'bit', '1', '1', '255', '0', '1', '4', '0', '2015-10-17 10:24:13', '2015-10-17 10:24:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2977', '0x0F68', '1', '5', '光收功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:23:29', '2015-10-17 10:23:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2978', '0x080007E0', '3', '5', '光收功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:23:39', '2015-10-17 10:23:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2979', '0x0F69', '1', '5', '光收功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:23:49', '2015-10-17 10:23:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2980', '0x080007E1', '3', '5', '光收功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:23:57', '2015-10-17 10:23:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2981', '0x0F6A', '1', '5', '光收功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:23:07', '2015-10-17 10:23:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2982', '0x080007E2', '3', '5', '光收功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:22:14', '2015-10-17 10:22:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2983', '0x0F6B', '1', '5', '光收功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:20:04', '2015-10-17 10:20:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2984', '0x080007E3', '3', '5', '光收功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:59', '2015-10-17 10:19:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2985', '0x0F6C', '1', '5', '光收功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:54', '2015-10-17 10:19:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2986', '0x080007E4', '3', '5', '光收功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:48', '2015-10-17 10:19:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2987', '0x0F6D', '1', '5', '光收功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:44', '2015-10-17 10:19:44', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2988', '0x080007E5', '3', '5', '光收功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:39', '2015-10-17 10:19:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2989', '0x0F6E', '1', '5', '光收功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:35', '2015-10-17 10:19:35', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2990', '0x080007E6', '3', '5', '光收功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:30', '2015-10-17 10:19:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2991', '0x0F6F', '1', '5', '光收功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:26', '2015-10-17 10:19:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2992', '0x080007E7', '3', '5', '光收功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:20', '2015-10-17 10:19:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2993', '0x0F70', '1', '5', '光发功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:13', '2015-10-17 10:19:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2994', '0x080007E8', '3', '5', '光发功率1', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:07', '2015-10-17 10:19:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2995', '0x0F71', '1', '5', '光发功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:19:02', '2015-10-17 10:19:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2996', '0x080007E9', '3', '5', '光发功率2', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:18:50', '2015-10-17 10:18:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2997', '0x0F72', '1', '5', '光发功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:18:42', '2015-10-17 10:18:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2998', '0x080007EA', '3', '5', '光发功率3', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:18:38', '2015-10-17 10:18:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('2999', '0x0F73', '1', '5', '光发功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:18:33', '2015-10-17 10:18:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3000', '0x080007EB', '3', '5', '光发功率4', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:18:27', '2015-10-17 10:18:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3001', '0x0F74', '1', '5', '光发功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:18:19', '2015-10-17 10:18:19', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3002', '0x080007EC', '3', '5', '光发功率5', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:18:13', '2015-10-17 10:18:13', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3003', '0x0F75', '1', '5', '光发功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:04:31', '2015-10-17 10:04:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3004', '0x080007ED', '3', '5', '光发功率6', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:04:25', '2015-10-17 10:04:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3005', '0x0F76', '1', '5', '光发功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:04:20', '2015-10-17 10:04:20', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3006', '0x080007EE', '3', '5', '光发功率7', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 09:59:09', '2015-10-17 09:59:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3007', '0x0F77', '1', '5', '光发功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:04:14', '2015-10-17 10:04:14', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3008', '0x080007EF', '3', '5', '光发功率8', 'rw', 'none', '1', 'sint1', '1', '1', '255', '-127', '127', '4', '0', '2015-10-17 10:03:42', '2015-10-17 10:03:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3009', '0x0FFF', '1', '6', '操作权限', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '3', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3010', '0x00800FFF', '3', '6', '操作权限', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '3', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3011', '0xFFFF', '1', '6', '无效的对象代码', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '1', '4', '0', '2015-07-19 19:28:41', '2015-07-19 19:28:41', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3012', '0xFFFFFFFF', '3', '6', '无效的对象代码', 'rw', 'none', '1', 'uint1', '1', '1', '255', '0', '1', '4', '0', '2015-09-21 01:37:25', '2015-09-21 01:37:25', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3016', '0x00000143', '3', '1', '查询/设置IP地址1', 'rw', '0', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 15:01:23', '2015-10-17 15:01:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3017', '0x00000144', '3', '1', '查询/设置IP地址2', 'rw', '0', '1', 'dstr', '4', '1', '255', '0', '255', '4', '0', '2015-10-17 15:15:27', '2015-10-17 15:15:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3018', '0x00000373', '3', '2', 'TD-LTE失步告警', 'ro', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 15:25:59', '2015-10-17 15:25:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3019', '0x00000273', '3', '3', 'TD-LTE失步告警使能', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 15:30:53', '2015-10-17 15:30:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3026', '0x00000185', '3', '4', '自动载波跟踪开关', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 15:34:26', '2015-10-17 15:34:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3027', '0x0B40', '1', '4', '自动载波跟踪开关', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 15:34:53', '2015-10-17 15:34:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3028', '0x08008106', '3', '5', 'TD-LTE2下行输出导频功率电平7', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:23:21', '2015-10-17 17:23:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3029', '0x08007106', '3', '5', 'TD-LTE1下行输出导频功率电平7', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:23:08', '2015-10-17 17:23:08', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3030', '0x08001180', '3', '5', 'GSM远端上行理论增益1', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:27:38', '2015-10-17 17:27:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3031', '0x08004180', '3', '5', 'TD-SCDMA远端上行理论增益1', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:28:15', '2015-10-17 17:28:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3032', '0x0C80', '1', '5', 'GSM远端上行理论增益1', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:28:52', '2015-10-17 17:28:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3033', '0x0C81', '1', '5', 'TD-SCDMA远端上行理论增益1', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:29:24', '2015-10-17 17:29:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3034', '0x08007180', '3', '5', 'TD-LTE1远端上行理论增益1', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:29:59', '2015-10-17 17:29:59', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3035', '0x0C82', '1', '5', 'TD-LTE1远端上行理论增益1', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:30:28', '2015-10-17 17:30:28', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3036', '0x08008180', '3', '5', 'TD-LTE2远端上行理论增益1', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:43:42', '2015-10-17 17:43:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3037', '0x08001181', '3', '5', 'GSM远端上行理论增益2', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:31:23', '2015-10-17 17:31:23', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3038', '0x08004181', '1', '5', 'TD-SCDMA远端上行理论增益2', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:31:49', '2015-10-17 17:31:49', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3039', '0x08007181', '1', '5', 'TD-LTE1远端上行理论增益2', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:32:16', '2015-10-17 17:32:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3040', '0x08008181', '3', '5', 'TD-LTE2远端上行理论增益2', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:43:09', '2015-10-17 17:43:09', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3041', '0x08001182', '1', '5', 'GSM远端上行理论增益3', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:33:10', '2015-10-17 17:33:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3042', '0x08004182', '3', '5', 'TD-SCDMA远端上行理论增益3', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:33:40', '2015-10-17 17:33:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3043', '0x08007182', '3', '5', 'TD-LTE1远端上行理论增益3', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:43:17', '2015-10-17 17:43:17', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3044', '0x08008182', '3', '5', 'TD-LTE2远端上行理论增益3', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:34:34', '2015-10-17 17:34:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3045', '0x08001183', '3', '5', 'GSM远端上行理论增益4', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:35:39', '2015-10-17 17:35:39', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3046', '0x08004183', '3', '5', 'TD-SCDMA远端上行理论增益4', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:36:12', '2015-10-17 17:36:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3047', '0x08007183', '3', '5', 'TD-LTE1远端上行理论增益4', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:36:38', '2015-10-17 17:36:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3048', '0x08008183', '3', '5', 'TD-LTE2远端上行理论增益4', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:37:06', '2015-10-17 17:37:06', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3049', '0x08001184', '3', '5', 'GSM远端上行理论增益5', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:37:30', '2015-10-17 17:37:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3050', '0x08004184', '3', '5', 'TD-SCDMA远端上行理论增益5', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:37:58', '2015-10-17 17:37:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3051', '0x08007184', '3', '5', 'TD-LTE1远端上行理论增益5', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:38:34', '2015-10-17 17:38:34', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3052', '0x08008184', '3', '5', 'TD-LTE2远端上行理论增益5', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:39:02', '2015-10-17 17:39:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3053', '0x08001185', '3', '5', 'GSM远端上行理论增益6', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:39:29', '2015-10-17 17:39:29', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3054', '0x08004185', '3', '5', 'TD-SCDMA远端上行理论增益6', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:39:53', '2015-10-17 17:39:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3055', '0x08007185', '3', '5', 'TD-LTE1远端上行理论增益6', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:40:22', '2015-10-17 17:40:22', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3056', '0x08008185', '3', '5', 'TD-LTE2远端上行理论增益6', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:40:52', '2015-10-17 17:40:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3057', '0x08001186', '3', '5', 'GSM远端上行理论增益7', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:41:18', '2015-10-17 17:41:18', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3058', '0x08004186', '3', '5', 'TD-SCDMA远端上行理论增益7', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:41:43', '2015-10-17 17:41:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3059', '0x08007186', '3', '5', 'TD-LTE1远端上行理论增益7', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:42:12', '2015-10-17 17:42:12', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3060', '0x08008186', '3', '5', 'TD-LTE2远端上行理论增益7', 'ro', '0', '1', 'sint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:42:43', '2015-10-17 17:42:43', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3061', '0x08001480', '3', '2', 'GSM远端下行输出欠功率告警1', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:52:40', '2015-10-17 17:52:40', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3062', '0x08004480', '3', '2', 'TD-SCDMA远端下行输出欠功率告警1', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:54:37', '2015-10-17 17:54:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3063', '0x08007480', '3', '2', 'TD-LTE1远端下行输出欠功率告警1', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:55:07', '2015-10-17 17:55:07', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3064', '0x08008480', '3', '2', 'TD-LTE2远端下行输出欠功率告警1', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:55:37', '2015-10-17 17:55:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3065', '0x08001481', '3', '2', 'GSM远端下行输出欠功率告警2', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:56:03', '2015-10-17 17:56:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3066', '0x08004481', '3', '2', 'TD-SCDMA远端下行输出欠功率告警2', 'ro', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:56:36', '2015-10-17 17:56:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3067', '0x08007481', '3', '2', 'TD-LTE1远端下行输出欠功率告警2', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:57:11', '2015-10-17 17:57:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3068', '0x08008481', '3', '2', 'TD-LTE2远端下行输出欠功率告警2', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:57:38', '2015-10-17 17:57:38', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3069', '0x08001482', '3', '2', 'GSM远端下行输出欠功率告警3', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:58:04', '2015-10-17 17:58:04', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3070', '0x08004482', '3', '2', 'TD-SCDMA远端下行输出欠功率告警3', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:58:36', '2015-10-17 17:58:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3071', '0x08007482', '3', '2', 'TD-LTE1远端下行输出欠功率告警3', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:59:10', '2015-10-17 17:59:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3072', '0x08008482', '3', '2', 'TD-LTE2远端下行输出欠功率告警3', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 17:59:36', '2015-10-17 17:59:36', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3073', '0x08001483', '3', '2', 'GSM远端下行输出欠功率告警4', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:00:03', '2015-10-17 18:00:03', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3074', '0x08004483', '3', '2', 'TD-SCDMA远端下行输出欠功率告警4', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:00:32', '2015-10-17 18:00:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3075', '0x08007483', '3', '2', 'TD-LTE1远端下行输出欠功率告警4', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:01:00', '2015-10-17 18:01:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3076', '0x08008483', '3', '2', 'TD-LTE2远端下行输出欠功率告警4', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:02:33', '2015-10-17 18:02:33', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3077', '0x08001484', '3', '2', 'GSM远端下行输出欠功率告警5', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:03:02', '2015-10-17 18:03:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3078', '0x08004484', '1', '2', 'TD-SCDMA远端下行输出欠功率告警5', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:03:30', '2015-10-17 18:03:30', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3079', '0x08007484', '3', '2', 'TD-LTE1远端下行输出欠功率告警5', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:03:56', '2015-10-17 18:03:56', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3080', '0x08008484', '1', '2', 'TD-LTE2远端下行输出欠功率告警5', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:04:26', '2015-10-17 18:04:26', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3081', '0x08001485', '3', '2', 'GSM远端下行输出欠功率告警6', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:04:53', '2015-10-17 18:04:53', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3082', '0x08004485', '3', '2', 'TD-SCDMA远端下行输出欠功率告警6', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:05:21', '2015-10-17 18:05:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3083', '0x08007485', '3', '2', 'TD-LTE1远端下行输出欠功率告警6', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:06:05', '2015-10-17 18:06:05', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3084', '0x08008485', '3', '2', 'TD-LTE2远端下行输出欠功率告警6', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:06:32', '2015-10-17 18:06:32', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3085', '0x08001486', '3', '2', 'GSM远端下行输出欠功率告警7', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:07:00', '2015-10-17 18:07:00', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3086', '0x08004486', '3', '2', 'TD-SCDMA远端下行输出欠功率告警7', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:07:27', '2015-10-17 18:07:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3087', '0x08007486', '3', '2', 'TD-LTE1远端下行输出欠功率告警7', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:07:50', '2015-10-17 18:07:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3090', '0x08001010', '3', '5', 'GSM系统最大下行链路时延', 'ro', '0', '1', 'uint4', '4', '1', '8', '0', '255', '4', '0', '2015-10-17 18:35:57', '2015-10-17 18:35:57', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3091', '0x08004010', '3', '5', 'TD-SCDMA系统最大下行链路时延', 'ro', '0', '1', 'uint4', '4', '1', '8', '0', '255', '4', '0', '2015-10-17 18:13:10', '2015-10-17 18:13:10', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3092', '0x08007010', '3', '5', 'TD-LTE1系统最大下行链路时延', 'ro', '0', '1', 'uint4', '4', '1', '8', '0', '255', '4', '0', '2015-10-17 18:13:45', '2015-10-17 18:13:45', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3093', '0x08008010', '3', '5', 'TD-LTE2系统最大下行链路时延', 'ro', '0', '1', 'uint4', '4', '1', '8', '0', '255', '4', '0', '2015-10-17 18:14:15', '2015-10-17 18:14:15', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3094', '0x08001011', '3', '5', 'GSM自动时延调整开关状态', 'ro', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:16:58', '2015-10-17 18:16:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3095', '0x08004011', '3', '5', 'TD-SCDMA自动时延调整开关状态', 'ro', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:15:54', '2015-10-17 18:15:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3096', '0x08007011', '3', '5', 'TD-LTE1自动时延调整开关状态', 'ro', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:16:21', '2015-10-17 18:16:21', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3097', '0x08008011', '3', '5', 'TD-LTE2自动时延调整开关状态', 'ro', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:16:52', '2015-10-17 18:16:52', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3098', '0x00800B09', '3', '6', '测试模式和正常模式切换', 'rw', '0', '1', 'uint1', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:19:55', '2015-10-17 18:19:55', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3100', '0x00000372', '3', '2', 'TD-SCDMA失步告警', 'rn', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:41:50', '2015-10-17 18:41:50', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3101', '0x00000860', '3', '4', '工作信道开关1', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:29:31', '2015-10-17 18:29:31', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3102', '0x00000861', '3', '4', '工作信道开关2', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:29:58', '2015-10-17 18:29:58', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3103', '0x00000862', '3', '4', '工作信道开关3', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:30:24', '2015-10-17 18:30:24', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3104', '0x00000863', '3', '4', '工作信道开关4', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:30:48', '2015-10-17 18:30:48', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3105', '0x00000864', '3', '4', '工作信道开关5', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:31:11', '2015-10-17 18:31:11', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3106', '0x00000865', '3', '4', '工作信道开关6', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:31:37', '2015-10-17 18:31:37', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3107', '0x00000866', '3', '4', '工作信道开关7', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:32:02', '2015-10-17 18:32:02', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3108', '0x00000867', '3', '4', '工作信道开关8', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:32:27', '2015-10-17 18:32:27', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3109', '0x00000868', '3', '4', '工作信道开关9', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:32:54', '2015-10-17 18:32:54', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3110', '0x00000869', '3', '4', '工作信道开关10', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:33:16', '2015-10-17 18:33:16', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3111', '0x0000086A', '3', '4', '工作信道开关11', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:33:42', '2015-10-17 18:33:42', 'text', 'paramOptionNone', 'default');
INSERT INTO `device_param` VALUES ('3112', '0x0000086B', '3', '4', '工作信道开关12', 'rw', '0', '1', 'bit', '1', '1', '8', '0', '255', '4', '0', '2015-10-17 18:34:05', '2015-10-17 18:34:05', 'text', 'paramOptionNone', 'default');

-- ----------------------------
-- Table structure for device_report
-- ----------------------------
DROP TABLE IF EXISTS `device_report`;
CREATE TABLE `device_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_uid` varchar(50) NOT NULL COMMENT '站点/设备编号',
  `type` int(11) NOT NULL COMMENT '上报类型',
  `content` varchar(1000) NOT NULL COMMENT '上报内容',
  `create_time` datetime NOT NULL COMMENT '上报时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_report
-- ----------------------------
INSERT INTO `device_report` VALUES ('1', '0x00000000', '1', '0x03BD:1', '2015-10-08 16:20:06');
INSERT INTO `device_report` VALUES ('2', '0x00000000', '1', '0x03BF:1', '2015-10-08 16:20:06');
INSERT INTO `device_report` VALUES ('3', '0x00000000', '1', '0x03BD:1', '2015-10-12 15:40:53');
INSERT INTO `device_report` VALUES ('4', '0x00000000', '1', '0x03BF:1', '2015-10-12 15:40:53');
INSERT INTO `device_report` VALUES ('5', '0x00000001', '1', '0x00000305:1', '2015-10-14 22:00:38');
INSERT INTO `device_report` VALUES ('6', '0x00000001', '1', '0x00000302:1', '2015-10-14 22:02:50');
INSERT INTO `device_report` VALUES ('7', '0x00000001', '1', '0x00000305:1', '2015-10-18 20:59:05');

-- ----------------------------
-- Table structure for device_schedule
-- ----------------------------
DROP TABLE IF EXISTS `device_schedule`;
CREATE TABLE `device_schedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `peroid` varchar(2) NOT NULL COMMENT '任务执行频率(取值：y每年|M每月|w每周|d每天|h每小时|m每分|s每秒)',
  `interval` int(11) NOT NULL COMMENT '任务执行间隔',
  `start_time` time NOT NULL COMMENT '任务开始执行时间,指定任务什么时间执行',
  `times` int(11) NOT NULL COMMENT '任务执行次数',
  `params` varchar(2000) NOT NULL COMMENT '定时任务参数(json数据结构)',
  `comment` varchar(100) NOT NULL COMMENT '任务说明',
  `create_time` datetime NOT NULL COMMENT '任务记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务记录修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务信息表';

-- ----------------------------
-- Records of device_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for device_site
-- ----------------------------
DROP TABLE IF EXISTS `device_site`;
CREATE TABLE `device_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '站点父id',
  `uid` varchar(50) NOT NULL COMMENT '站点/设备编号(十六进制表示)',
  `name` varchar(50) NOT NULL,
  `device_type` varchar(50) NOT NULL COMMENT '设备类型',
  `ap_protocol` varchar(50) NOT NULL COMMENT 'AP协议类型',
  `mcp_protocol` varchar(50) NOT NULL COMMENT 'mcp协议类型',
  `protocol` varchar(50) NOT NULL COMMENT '协议类型',
  `manufactor` varchar(50) NOT NULL COMMENT '设备厂商',
  `location` varchar(50) NOT NULL COMMENT '设备安装地点',
  `comment` varchar(200) NOT NULL COMMENT '说明备注',
  `ap_max_len` int(11) NOT NULL COMMENT 'ap:c协议包最大长度',
  `mcp_mode` smallint(11) NOT NULL COMMENT 'mcp:b交互机制',
  `nc` smallint(6) NOT NULL COMMENT '连发系数(Nc)',
  `tot1` smallint(6) NOT NULL COMMENT '设备响应超时',
  `tg` int(11) NOT NULL COMMENT '发送间隔时间',
  `sequence` int(11) NOT NULL COMMENT '节点在其父节点中的顺序',
  `status` int(11) NOT NULL COMMENT '站点状态（1表示锁定，0表示编辑)',
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '记录标志,0为站点，1为设备',
  `has_child` tinyint(1) NOT NULL,
  `path` varchar(200) NOT NULL,
  `create_user` varchar(64) NOT NULL COMMENT '站点或设备创建用户',
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_site
-- ----------------------------
INSERT INTO `device_site` VALUES ('37', '0', '0x00000001', 'udp_test0001', '1', '3', '3', '2', '', '', '', '512', '0', '1', '60', '50', '20', '0', '0', '1', '37', 'admin', '2015-09-26 19:05:42', '2015-09-26 19:05:42');
INSERT INTO `device_site` VALUES ('46', '37', '0x0000000102', 'RU1', '1', '3', '3', '2', '', '', '远端单元', '512', '0', '1', '60', '50', '20', '0', '1', '0', '37,46', 'admin', '2015-10-12 16:09:23', '2015-10-12 16:09:23');
INSERT INTO `device_site` VALUES ('47', '0', '0x00000003', 'tcp_test0003', '1', '1', '1', '1', '裕源大通', '试验1', '5555', '156', '0', '1', '10', '50', '10', '0', '0', '1', '47', 'admin', '2015-10-12 16:18:08', '2015-10-12 16:18:08');
INSERT INTO `device_site` VALUES ('48', '47', '0x0000000301', 'EU1', '2', '1', '1', '1', '裕源大通', '试验1', '扩展', '156', '0', '1', '10', '50', '10', '0', '1', '0', '47,48', 'admin', '2015-10-12 16:29:29', '2015-10-12 16:29:29');
INSERT INTO `device_site` VALUES ('52', '37', '0x0000000101', 'EU1', '2', '3', '3', '2', '', '', '扩展', '512', '0', '1', '60', '50', '10', '0', '1', '0', '37,52', 'admin', '2015-10-14 22:17:15', '2015-10-14 22:17:15');

-- ----------------------------
-- Table structure for eu_alarm_type
-- ----------------------------
DROP TABLE IF EXISTS `eu_alarm_type`;
CREATE TABLE `eu_alarm_type` (
  `alarm_type_id` varchar(32) DEFAULT NULL,
  `alarm_name_ch` varchar(32) DEFAULT NULL,
  `alarm_type` varchar(32) DEFAULT NULL,
  `alarm_level` varchar(32) DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eu_alarm_type
-- ----------------------------
INSERT INTO `eu_alarm_type` VALUES ('0x00000301', '电源掉电告警', 'Equipment Alarm', 'Critical', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000302', '电源故障告警', 'Equipment Alarm', 'Critical', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000304', '监控模块电池故障告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000305', '位置告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000308', '其它模块告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000309', '本振失锁告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x0000030E', '光收发模块故障告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x0000030F', '主从监控链路告警', 'Communications Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000320', '外部告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000321', '外部告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000322', '外部告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000323', '外部告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000324', '外部告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000325', '外部告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000328', '门禁告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000372', 'TD-SCDMA失步告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x0000005C', '光收发故障告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x0000005D', '光收发故障告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x0000005E', '光收发故障告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x0000005F', '光收发故障告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000060', '光收发故障告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000061', '光收发故障告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000062', '光收发故障告警7', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000063', '光收发故障告警8', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000075', '设备过温告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x00000373', 'TD-LTE失步告警', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000060', '远端光收发故障告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000061', '远端光收发故障告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000062', '远端光收发故障告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000063', '远端光收发故障告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000064', '远端光收发故障告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000065', '远端光收发故障告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000066', '远端光收发故障告警7', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000067', '远端光收发故障告警8', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A0', '远端下行驻波比告警1（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A1', '远端下行驻波比告警2（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A2', '远端下行驻波比告警3（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A3', '远端下行驻波比告警4（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A4', '远端下行驻波比告警5（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A5', '远端下行驻波比告警6（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A6', '远端下行驻波比告警1（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001A7', '远端下行驻波比告警8（端口1）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C0', '远端下行驻波比告警1（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C1', '远端下行驻波比告警2（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C2', '远端下行驻波比告警3（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C3', '远端下行驻波比告警4（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C4', '远端下行驻波比告警5（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C5', '远端下行驻波比告警6（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C6', '远端下行驻波比告警7（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001C7', '远端下行驻波比告警8（端口2）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E0', '远端下行驻波比告警1（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E1', '远端下行驻波比告警2（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E2', '远端下行驻波比告警3（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E3', '远端下行驻波比告警4（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E4', '远端下行驻波比告警5（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E5', '远端下行驻波比告警6（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E6', '远端下行驻波比告警7（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x080001E7', '远端下行驻波比告警8（端口3）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000200', '远端下行驻波比告警1（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000201', '远端下行驻波比告警2（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000202', '远端下行驻波比告警3（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000203', '远端下行驻波比告警4（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000204', '远端下行驻波比告警5（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000205', '远端下行驻波比告警6（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000206', '远端下行驻波比告警7（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000207', '远端下行驻波比告警8（端口4）', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000380', '远端射频电路故障告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000381', '远端射频电路故障告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000382', '远端射频电路故障告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000383', '远端射频电路故障告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000384', '远端射频电路故障告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000385', '远端射频电路故障告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000386', '远端射频电路故障告警7', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000387', '远端射频电路故障告警8', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000480', '远端链路故障告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000481', '远端链路故障告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000482', '远端链路故障告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000483', '远端链路故障告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000484', '远端链路故障告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000485', '远端链路故障告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000486', '远端链路故障告警7', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000487', '远端链路故障告警8', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000600', '远端设备过温告警1', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000601', '远端设备过温告警2', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000602', '远端设备过温告警3', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000603', '远端设备过温告警4', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000604', '远端设备过温告警5', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000605', '远端设备过温告警6', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000606', '远端设备过温告警7', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');
INSERT INTO `eu_alarm_type` VALUES ('0x08000607', '远端设备过温告警8', 'Equipment Alarm', 'Major', 'bit型,1告警，0恢复');

-- ----------------------------
-- Table structure for eu_pm_parameter_name
-- ----------------------------
DROP TABLE IF EXISTS `eu_pm_parameter_name`;
CREATE TABLE `eu_pm_parameter_name` (
  `parameter_id` varchar(32) DEFAULT NULL,
  `parameter_name_ch` varchar(32) DEFAULT NULL,
  `parameter_name_en` varchar(32) DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eu_pm_parameter_name
-- ----------------------------
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007081', 'TD-LTE1远端下行链路时延2', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008081', 'TD-LTE1远端下行链路时延2', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007082', 'TD-LTE1远端下行链路时延3', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008082', 'TD-LTE1远端下行链路时延3', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007083', 'TD-LTE1远端下行链路时延4', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008083', 'TD-LTE1远端下行链路时延4', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007084', 'TD-LTE1远端下行链路时延5', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008084', 'TD-LTE1远端下行链路时延5', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007085', 'TD-LTE1远端下行链路时延6', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008085', 'TD-LTE1远端下行链路时延6', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007086', 'TD-LTE1远端下行链路时延7', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008086', 'TD-LTE1远端下行链路时延7', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007087', 'TD-LTE1远端下行链路时延8', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008087', 'TD-LTE1远端下行链路时延8', '', '无符号4字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007101', 'TD-LTE1下行输出导频功率电平2', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008101', 'TD-LTE2下行输出导频功率电平2', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007102', 'TD-LTE1下行输出导频功率电平3', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008102', 'TD-LTE2下行输出导频功率电平3', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007103', 'TD-LTE1下行输出导频功率电平4', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008103', 'TD-LTE2下行输出导频功率电平4', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007104', 'TD-LTE1下行输出导频功率电平5', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008104', 'TD-LTE2下行输出导频功率电平5', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007105', 'TD-LTE1下行输出导频功率电平6', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008105', 'TD-LTE2下行输出导频功率电平6', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007106', 'TD-LTE1下行输出导频功率电平7', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008106', 'TD-LTE2下行输出导频功率电平7', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08007107', 'TD-LTE1下行输出导频功率电平8', '', '有符号1字节');
INSERT INTO `eu_pm_parameter_name` VALUES ('0x08008107', 'TD-LTE2下行输出导频功率电平8', '', '有符号1字节');

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
) ENGINE=InnoDB AUTO_INCREMENT=2608 DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('3', '0', '参数管理', 'deviceParam', 'icon-param', 'device/param', '3', '\0', '0', '', '', '3', '1', '设备参数', '2014-10-30 14:41:24', '2014-10-30 14:40:26');
INSERT INTO `module` VALUES ('4', '0', '站点管理', 'deviceSite', 'icon-site', 'device/site', '4', '\0', '0', '', '', '2', '1', '站点管理', '2014-10-30 14:41:42', '2014-10-30 14:40:45');
INSERT INTO `module` VALUES ('7', '0', '用户权限', 'memberships', 'icon-user', 'membership/user', '7', '', '0', '', '', '6', '1', '用户权限', '2014-10-30 14:45:47', '2014-10-30 14:44:50');
INSERT INTO `module` VALUES ('23', '7', '用户管理', 'membership.user', 'icon-member', 'membership/user', '7,23', '\0', '0', '', '', '1', '1', '用户管理', '2014-10-30 15:38:22', '2014-10-30 15:37:24');
INSERT INTO `module` VALUES ('24', '7', '角色管理', 'memberships.role', 'icon-group', 'membership/role', '7,24', '\0', '0', '', '', '2', '1', '角色管理', '2014-10-30 15:38:44', '2014-10-30 15:37:46');
INSERT INTO `module` VALUES ('25', '7', '权限管理', 'memberships.opt', 'icon-perm', 'membership/operation', '7,25', '\0', '0', '', '', '3', '1', '操作管理', '2014-10-30 15:39:03', '2014-10-30 15:38:05');
INSERT INTO `module` VALUES ('26', '32', '系统日志', 'memberships.event', 'icon-event', 'membership/event', '7,26', '\0', '0', '', '', '3', '1', '系统日志', '2014-10-30 15:41:06', '2014-10-30 15:40:08');
INSERT INTO `module` VALUES ('31', '7', '模块管理', 'memberships.module', 'icon-org', 'membership/module', '7,31', '\0', '0', '', '', '4', '1', '模块管理', '2014-10-31 10:21:46', '2014-10-31 10:20:49');
INSERT INTO `module` VALUES ('32', '0', '系统管理', 'system', 'icon-settings', 'system/settings', '32', '', '0', '', '', '7', '1', '系统管理', '2014-11-12 12:20:57', '2014-11-12 12:20:57');
INSERT INTO `module` VALUES ('38', '32', '数据字典', 'system.dict', 'icon-dict', 'system/dict', '32,38', '\0', '0', '', '', '1', '1', '数据字典', '2014-11-27 15:27:51', '2014-11-27 15:27:51');
INSERT INTO `module` VALUES ('39', '32', '系统配置', 'system.settings', 'icon-settings2', 'system/settings', '32,39', '\0', '0', ' ', ' ', '2', '1', '系统配置', '2015-08-08 10:48:03', '2015-08-08 10:48:07');

-- ----------------------------
-- Table structure for nms_status
-- ----------------------------
DROP TABLE IF EXISTS `nms_status`;
CREATE TABLE `nms_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nms_name` varchar(32) DEFAULT NULL,
  `service_name` varchar(32) DEFAULT NULL,
  `service_url` varchar(128) DEFAULT NULL,
  `service_status` int(11) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nms_status
-- ----------------------------
INSERT INTO `nms_status` VALUES ('8', 'simulator1', 'FM', '127.0.0.1:14000', '0', '2015-10-19 11:01:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='系统操作表';

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
INSERT INTO `operation` VALUES ('37', '23', '管理', 'membership.user:*', '1', '用户管理', '2014-11-12 11:26:41', '2014-11-12 11:26:41');
INSERT INTO `operation` VALUES ('38', '24', '管理', 'memberships.role:*', '1', '角色管理', '2014-11-12 11:27:49', '2014-11-12 11:27:49');
INSERT INTO `operation` VALUES ('58', '26', '日志管理', 'memberships.event:*', '2', '日志管理', '2014-11-27 15:51:02', '2014-11-27 15:51:04');
INSERT INTO `operation` VALUES ('59', '3', '删除设备参数', 'deviceParam:delete', '1', '删除设备参数', '2015-06-23 14:55:58', '2015-06-23 14:55:58');
INSERT INTO `operation` VALUES ('60', '3', '创建设备参数', 'deviceParam:create', '2', '创建设备参数', '2015-06-23 14:56:18', '2015-06-23 14:56:18');
INSERT INTO `operation` VALUES ('61', '3', '修改设备参数', 'deviceParam:update', '3', '修改设备参数', '2015-06-23 14:56:37', '2015-06-23 14:56:37');
INSERT INTO `operation` VALUES ('62', '3', '查看设备参数', 'deviceParam:view', '4', '查看设备参数', '2015-06-23 14:57:36', '2015-06-23 14:57:36');
INSERT INTO `operation` VALUES ('63', '3', '管理设备参数', 'deviceParam:*', '5', '管理设备参数', '2015-06-23 14:59:14', '2015-06-23 14:59:14');
INSERT INTO `operation` VALUES ('64', '4', '管理站点', 'site:*', '1', '管理站点所有功能', '2015-06-23 15:01:44', '2015-06-23 15:01:44');
INSERT INTO `operation` VALUES ('65', '4', '创建站点', 'site:create', '2', '创建站点', '2015-06-23 15:02:04', '2015-06-23 15:02:04');
INSERT INTO `operation` VALUES ('66', '26', 'test', 'memberships.event:test', '10', 'ssss', '2015-08-14 13:09:10', '2015-08-14 13:09:10');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统角色标识',
  `modules` varchar(1000) NOT NULL COMMENT '系统角色所拥有的模块集合(module_id以英文逗号分隔)',
  `operations` varchar(1000) NOT NULL COMMENT '系统角色所拥有的操作集合(operation_id以英文逗号分隔)',
  `device_param_props` varchar(1000) NOT NULL COMMENT '可以查看的设备参数属性',
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('4', '7,26,3,4,23,24,25,31', '18,58,61,63,60,62,59,65,64,37,20,4,2,5,7,8,38,6,9,10,16,15,14', 'id,name,category_id,mode,unit,ratio,value_type,value_len,value_min_len,value_max_len,min_value', '超级管理员', 'superAdmin', '1', '1', '1', '管理员', 'admin', '2014-10-31 14:38:09', '2014-10-31 14:37:13');
INSERT INTO `role` VALUES ('22', '7,26,3,4,23,24,25,31', '18,58,61,63,60,62,59,65,64,37,20,4,2,5,7,8,38,6,9,10,16,15,14', 'id,name,category_id,mode,unit,ratio,value_type,value_len,value_min_len,value_max_len,min_value,max_value,warn_level', '开发人员', 'developer', '1', '1', '2', '开发人员', 'admin', '2014-11-15 12:56:56', '2014-11-15 12:56:54');
INSERT INTO `role` VALUES ('23', '', '', '', '测试gchsh', 'test', '0', '1', '3', 'test', 'yuht', '2015-08-21 18:30:45', '2015-08-21 18:30:45');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '4', 'admin', '436a5530ff7436c546dc2047d24fff46', 'c1d69267a3fd2e207408b68f8662cf27', '管理员', '14068728@qq.com', '123456789', '1', 'sa', '2015-01-05 17:38:50', '2015-01-05 17:38:50');
INSERT INTO `user` VALUES ('5', '22', 'test', 'e01fdcf6728afadb7756e9b7a233aa21', '2b81886b9de45d40ae6ba0d2e49a3b8f', 'tester', 'tester@qq.com', '12343423423', '1', '1', '2015-08-14 10:04:00', '2015-08-14 10:04:00');
INSERT INTO `user` VALUES ('6', '4', 'yuht', '978d3e991469b79a7d29ae8055527675', '314f241e111b244746cd78cc8edd2125', 'yuht', '1111', '12233', '1', '22222222222', '2015-08-21 18:29:17', '2015-08-21 18:29:17');

-- ----------------------------
-- Table structure for ydras_dam41_ai00_c10_idlist_cfg_v16
-- ----------------------------
DROP TABLE IF EXISTS `ydras_dam41_ai00_c10_idlist_cfg_v16`;
CREATE TABLE `ydras_dam41_ai00_c10_idlist_cfg_v16` (
  `id` varchar(32) DEFAULT NULL,
  `mcpc_id` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  `var_type` varchar(32) DEFAULT NULL,
  `coefficient` int(11) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` double(20,0) DEFAULT NULL,
  `pro` int(11) DEFAULT NULL,
  `v0` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ydras_dam41_ai00_c10_idlist_cfg_v16
-- ----------------------------
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0002', '0x00000002', '设备厂商代码', 'RO', 'uint1', '1', '1', '0', '255', '0', '21');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0003', '0x00000003', '设备类别', 'RO', 'uint2', '1', '2', '0', '65535', '0', '231');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0004', '0x00000004', '设备型号', 'RO', 'str', '1', '20', '0', '255', '0', 'ydras-dam41-ai00-c10');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0005', '0x00000005', '设备生产序列号', 'RO', 'str', '1', '20', '0', '255', '0', 'DMA1506001');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0006', '0x00000006', '设备实际载波总数', 'RO', 'uint1', '1', '1', '0', '255', '0', '12');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0007', '0x00000007', '经度', 'RO', 'str', '1', '20', '0', '255', '0', 'E103.12345678');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0008', '0x00000008', '纬度', 'RO', 'str', '1', '20', '0', '255', '0', 'N23.12345678');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x000A', '0x0000000A', '监控的当前版本信息', 'RO', 'str', '1', '20', '0', '255', '0', 'MU-MDG-20.16.05');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x000B', '0x0000000B', '远程数据通信模块', 'RO', 'uint1', '1', '1', '0', '255', '0', '5');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0010', '0x00000010', '嵌入式软件运行模式', 'RO', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0011', '0x00000011', '可支持AP:C协议的最大长度', 'RO', 'uint2', '1', '2', '0', '255', '0', '512');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0012', '0x00000012', 'MCP:B采用的交互机制', 'RO', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0013', '0x00000013', '连发系数(Nc)', 'RO', 'uint1', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0014', '0x00000014', '设备响应超时', 'RO', 'uint1', '1', '1', '0', '255', '0', '10');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0015', '0x00000015', '发送间隔时间', 'RO', 'uint2', '1', '2', '0', '65535', '0', '100');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0016', '0x00000016', '暂停传输等待时间', 'RO', 'uint1', '1', '1', '0', '255', '0', '10');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0017', '0x00000017', '转换到软件升级模式时OMC需要等待的时间', 'RO', 'uint2', '1', '2', '0', '65535', '0', '10');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0018', '0x00000018', '设备执行软件升级的结果', 'RO', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0020', '0x00000020', '设备使用的远程升级方式', 'RO', 'uint1', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0021', '0x00000021', 'FPGA版本信息', 'RO', 'str', '1', '20', '0', '255', '0', 'FPGA VD502.0000');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0022', '0x00000022', '设备信息：设备实际加载系统', 'RO', 'uint4', '1', '4', '0', '2147483647', '0', '1049');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0023', '0x00000023', '设备位置信息', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0101', '0x00000101', '站点编号', 'RW', 'uint4', '1', '4', '0', '2147483647', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0102', '0x00000102', '设备编号', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0111', '0x00000111', '查询/设置电话号码1', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0112', '0x00000112', '查询/设置电话号码2', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0113', '0x00000113', '查询/设置电话号码3', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0114', '0x00000114', '查询/设置电话号码4', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0115', '0x00000115', '查询/设置电话号码5', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0120', '0x00000120', '上报号码', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0130', '0x00000130', '监控中心IP地址', 'RW', 'dstr', '1', '4', '0', '255', '0', '192.168.1.10');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0131', '0x00000131', '监控中心IP地址端口号', 'RW', 'uint2', '1', '2', '0', '65535', '0', '8000');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0133', '0x00000133', 'PS域接入点名称(APN)', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0134', '0x00000134', '设备的心跳包间隔时间', 'RW', 'uint2', '1', '2', '0', '65535', '0', '60');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0136', '0x00000136', 'PS域参数：用户标识', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0137', '0x00000137', 'PS域参数：口令', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0138', '0x00000138', 'PS域传输协议', 'RW', 'uint1', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0139', '0x00000139', '设备接收端口(UDP协议)', 'RW', 'uint2', '1', '2', '0', '65535', '0', '8001');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0142', '0x00000142', '通信方式', 'RW', 'uint1', '1', '1', '0', '255', '0', '2');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0143', '0x00000143', '查询/设置IP地址1', 'RW', 'dstr', '1', '4', '0', '255', '0', '192.168.1.3');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0144', '0x00000144', '查询/设置IP地址2', 'RW', 'dstr', '1', '4', '0', '255', '0', '192.168.1.4');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0150', '0x00000150', '设备当前时间', 'RW', 'dstr', '1', '7', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0151', '0x00000151', '设备IP地址', 'RW', 'dstr', '1', '4', '0', '255', '0', '192.168.1.2');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0152', '0x00000152', '设备子网掩码', 'RW', 'dstr', '1', '4', '0', '255', '0', '255.255.255.0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0153', '0x00000153', '设备默认网关', 'RW', 'dstr', '1', '4', '0', '255', '0', '192.168.1.1');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0160', '0x00000160', 'FTP服务器IP地址', 'RW', 'dstr', '1', '4', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0161', '0x00000161', 'FTP服务器IP地址端口号', 'RW', 'uint2', '1', '2', '0', '65535', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0162', '0x00000162', 'FTP升级操作的用户名', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0163', '0x00000163', 'FTP升级操作的口令', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0164', '0x00000164', '相对路径', 'RW', 'str', '1', '40', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0165', '0x00000165', '文件名', 'RW', 'str', '1', '40', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0166', '0x00000166', 'FTP文件传输控制', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0201', '0x00000201', '电源掉电告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0202', '0x00000202', '电源故障告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0204', '0x00000204', '监控模块电池故障告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0205', '0x00000205', '位置告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0208', '0x00000208', '其它模块告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0209', '0x00000209', '本振失锁告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x020F', '0x0000020F', '主从监控链路告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0220', '0x00000220', '外部告警使能1', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0221', '0x00000221', '外部告警使能2', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0222', '0x00000222', '外部告警使能3', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0223', '0x00000223', '外部告警使能4', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0224', '0x00000224', '外部告警使能5', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0225', '0x00000225', '外部告警使能6', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0272', '0x00000272', 'TD-SCDMA失步告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0273', '0x00000273', 'TD-LTE失步告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0030', '0x00000030', '光收发故障告警1使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0031', '0x00000031', '光收发故障告警2使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0032', '0x00000032', '光收发故障告警3使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0033', '0x00000033', '光收发故障告警4使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0034', '0x00000034', '光收发故障告警5使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0035', '0x00000035', '光收发故障告警6使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0049', '0x00000049', '设备过温告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0301', '0x00000301', '电源掉电告警', 'RW', 'bit', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0302', '0x00000302', '电源故障告警', 'RW', 'bit', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0304', '0x00000304', '监控模块电池故障告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0305', '0x00000305', '位置告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0308', '0x00000308', '其它模块告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0309', '0x00000309', '本振失锁告警', 'RW', 'bit', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x030F', '0x0000030F', '主从监控链路告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0320', '0x00000320', '外部告警1', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0321', '0x00000321', '外部告警2', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0322', '0x00000322', '外部告警3', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0323', '0x00000323', '外部告警4', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0324', '0x00000324', '外部告警5', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0325', '0x00000325', '外部告警6', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0372', '0x00000372', 'TD-SCDMA失步告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0373', '0x00000373', 'TD-LTE失步告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x03A8', '0x0000005C', '光收发故障告警1', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x03A9', '0x0000005D', '光收发故障告警2', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x03AA', '0x0000005E', '光收发故障告警3', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x03AB', '0x0000005F', '光收发故障告警4', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x03AC', '0x00000060', '光收发故障告警5', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x03AD', '0x00000061', '光收发故障告警6', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0075', '0x00000075', '设备过温告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0410', '0x00000410', '工作信道号1', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0411', '0x00000411', '工作信道号2', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0412', '0x00000412', '工作信道号3', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0413', '0x00000413', '工作信道号4', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0414', '0x00000414', '工作信道号5', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0415', '0x00000415', '工作信道号6', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0416', '0x00000416', '工作信道号7', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0417', '0x00000417', '工作信道号8', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0418', '0x00000418', '工作信道号9', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0419', '0x00000419', '工作信道号10', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x041A', '0x0000041A', '工作信道号11', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x041B', '0x0000041B', '工作信道号12', 'RW', 'uint2', '1', '2', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0860', '0x00000860', '工作信道开关1', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0861', '0x00000861', '工作信道开关2', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0862', '0x00000862', '工作信道开关3', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0863', '0x00000863', '工作信道开关4', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0864', '0x00000864', '工作信道开关5', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0865', '0x00000865', '工作信道开关6', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0866', '0x00000866', '工作信道开关7', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0867', '0x00000867', '工作信道开关8', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0868', '0x00000868', '工作信道开关9', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0869', '0x00000869', '工作信道开关10', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x086A', '0x0000086A', '工作信道开关11', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x086B', '0x0000086B', '工作信道开关12', 'RW', 'bit', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B40', '0x00000185', '自动载波跟踪开关', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B26', '0x00000608', 'TD-LTE特殊子帧配置', 'RW', 'uint1', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B23', '0x00000609', 'TD-LTE上下行配比', 'RW', 'uint1', '1', '1', '0', '255', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B22', '0x00000610', 'TD-SCDMA帧第二时隙切换点', 'RW', 'uint1', '1', '1', '0', '8', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0873', '0x00000873', '设备路由登记地址', 'RW', 'dstr', '1', '4', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x087C', '0x0000087C', '设备温度', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0172', '0x00000172', '设备过温告警门限', 'RW', 'sint1', '1', '1', '-40', '125', '30', '60');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E0', '0x080007E0', '光收功率1', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E1', '0x080007E1', '光收功率2', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E2', '0x080007E2', '光收功率3', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E3', '0x080007E3', '光收功率4', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E4', '0x080007E4', '光收功率5', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E5', '0x080007E5', '光收功率6', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E8', '0x080007E8', '光发功率1', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07E9', '0x080007E9', '光发功率2', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07EA', '0x080007EA', '光发功率3', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07EB', '0x080007EB', '光发功率4', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07EC', '0x080007EC', '光发功率5', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x07ED', '0x080007ED', '光发功率6', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0534', '0x08001001', 'GSM下行输入功率电平', 'RO', 'sint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0535', '0x08004001', 'TD-SCDMA下行输入导频功率电平', 'RO', 'sint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0536', '0x08007001', 'TD-LTE1下行输入导频功率电平', 'RO', 'sint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0537', '0x08008001', 'TD-LTE2下行输入导频功率电平', 'RO', 'sint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B1C', '0x08004004', 'TD-SCDMA工作频带中心信道号', 'RW', 'uint2', '1', '2', '0', '65536', '1', '10085');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B1D', '0x08007004', 'TD-LTE1工作频带中心信道号', 'RW', 'uint2', '1', '2', '0', '65535', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B1E', '0x08008004', 'TD-LTE2工作频带中心信道号', 'RW', 'uint2', '1', '2', '0', '65535', '1', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0442', '0x08001005', 'GSM上行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0444', '0x08004005', 'TD-SCDMA上行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0446', '0x08007005', 'TD-LTE1上行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0448', '0x08008005', 'TD-LTE2上行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0443', '0x08001006', 'GSM下行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0445', '0x08004006', 'TD-SCDMA下行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0447', '0x08007006', 'TD-LTE1下行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0449', '0x08008006', 'TD-LTE2下行衰减值', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0466', '0x08001007', 'GSM下行输入功率欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x046C', '0x08004007', 'TD-SCDMA下行输入导频功率欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0472', '0x08007007', 'TD-LTE1下行输入导频功率欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0478', '0x08008007', 'TD-LTE2下行输入导频功率欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0467', '0x08001008', 'GSM下行输入功率过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x046D', '0x08004008', 'TD-SCDMA下行输入导频功率过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0473', '0x08007008', 'TD-LTE1下行输入导频功率过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0479', '0x08008008', 'TD-LTE2下行输入导频功率过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0231', '0x0800100C', 'GSM下行输入欠功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0237', '0x0800400C', 'TD-SCDMA下行输入导频欠功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x023D', '0x0800700C', 'TD-LTE1下行输入导频欠功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0243', '0x0800800C', 'TD-LTE2下行输入导频欠功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0230', '0x0800100D', 'GSM下行输入过功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0236', '0x0800400D', 'TD-SCDMA下行输入导频过功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x023C', '0x0800700D', 'TD-LTE1下行输入导频过功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0242', '0x0800800D', 'TD-LTE2下行输入导频过功率告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0332', '0x0800100E', 'GSM下行输入欠功率告警', 'RO', 'bit', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0337', '0x0800400E', 'TD-SCDMA下行输入导频欠功率告警', 'RO', 'bit', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x033D', '0x0800700E', 'TD-LTE1下行输入导频欠功率告警', 'RO', 'bit', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0343', '0x0800800E', 'TD-LTE2下行输入导频欠功率告警', 'RO', 'bit', '1', '1', '0', '255', '4', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0330', '0x0800100F', 'GSM下行输入过功率告警', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0336', '0x0800400F', 'TD-SCDMA下行输入导频过功率告警', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x033C', '0x0800700F', 'TD-LTE1下行输入导频过功率告警', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0342', '0x0800800F', 'TD-LTE2下行输入导频过功率告警', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08001010', 'GSM系统最大下行链路时延', 'RO', 'uint4', '1', '4', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08004010', 'TD-SCDMA系统最大下行链路时延', 'RO', 'uint4', '1', '4', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08007010', 'TD-LTE1系统最大下行链路时延', 'RO', 'uint4', '1', '4', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08008010', 'TD-LTE2系统最大下行链路时延', 'RO', 'uint4', '1', '4', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08001011', 'GSM自动时延调整开关状态', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08004011', 'TD-SCDMA自动时延调整开关状态', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08007011', 'TD-LTE1自动时延调整开关状态', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0000', '0x08008011', 'TD-LTE2自动时延调整开关状态', 'RO', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B00', '0x00800B00', 'LTE1 VGA', 'RW', 'uint1', '2', '1', '0', '31', '30', '12');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B01', '0x00800B01', 'LTE2 VGA', 'RW', 'uint1', '2', '1', '0', '31', '30', '12');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B02', '0x00800B02', '3g VGA', 'RW', 'uint1', '2', '1', '0', '31', '30', '12');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B03', '0x00800B03', 'GSM VGA', 'RW', 'uint1', '2', '1', '0', '31', '30', '12');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B04', '0x00800B04', 'LTE1 数字增益', 'RW', 'sint2', '10', '2', '0', '100', '30', '-150');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B05', '0x00800B05', 'LTE2 数字增益', 'RW', 'sint2', '10', '2', '0', '100', '30', '-150');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B06', '0x00800B06', '3G 数字增益', 'RW', 'sint2', '10', '2', '0', '100', '30', '-150');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B07', '0x00800B07', 'GSM 数字增益', 'RW', 'sint2', '10', '2', '0', '100', '30', '-150');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B0C', '0x00800B0C', 'AGC 参考值设定', 'RO', 'uint2', '1', '2', '0', '255', '30', '62');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B09', '0x00800B09', '测试模式和正常模式切换', 'RW', 'uint1', '1', '1', '0', '1', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B0A', '0x00800B0A', '内部测试源使能', 'RW', 'uint1', '1', '1', '0', '255', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B0B', '0x00800B0B', '内部源频率设置', 'RW', 'uint2', '1', '2', '0', '255', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x04C5', '0x008004C5', 'TD第一转换点微调', 'RW', 'sint1', '1', '1', '0', '255', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x04C6', '0x008004C6', 'TD第二转换点微调', 'RW', 'sint1', '1', '1', '0', '255', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B37', '0x00800B37', 'LTE第一转换点微调', 'RW', 'sint1', '1', '1', '0', '255', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B38', '0x00800B38', 'LTE第二转换点微调', 'RW', 'sint1', '1', '1', '0', '255', '30', '3');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B39', '0x00800B39', 'LTE接入通道选择', 'RW', 'sint1', '1', '1', '0', '10', '31', '3');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B20', '0x00800B20', 'LTE远程功率开关', 'RW', 'uint1', '1', '1', '0', '5', '31', '3');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B21', '0x00800B21', 'TD远程功率开关', 'RW', 'uint1', '1', '1', '0', '5', '31', '3');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0A08', '0x00800A08', 'LTE1 数字功率', 'RO', 'sint2', '1', '2', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0A09', '0x00800A09', 'LTE2 数字功率', 'RO', 'sint2', '1', '2', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0A0A', '0x00800A0A', 'TD-SCDMA 数字功率', 'RO', 'sint2', '1', '2', '0', '32767', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0A0B', '0x00800A0B', 'GSM 数字功率', 'RO', 'sint2', '1', '2', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B11', '0x00800B11', 'GSM下行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B13', '0x00800B13', '3G下行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B15', '0x00800B15', 'LTE1下行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B17', '0x00800B17', 'LTE2下行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B10', '0x00800B10', 'GSM上行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B12', '0x00800B12', '3G上行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B14', '0x00800B14', 'LTE1上行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B16', '0x00800B16', 'LTE2上行增益偏移', 'RW', 'sint1', '2', '1', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x01A0', '0x008001A0', 'CPLD版本信息', 'RO', 'str', '1', '20', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x01A1', '0x008001A1', '设备MAC地址', 'RO', 'str', '1', '20', '0', '0', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B0D', '0x00800B0D', 'AGC 步进设置', 'RO', 'uint1', '1', '1', '0', '0', '30', '41');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B18', '0x00800B18', '2G下行输入功率电平校准', 'RW', 'sint2', '10', '2', '0', '200', '30', '100');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B19', '0x00800B19', '3G下行输入功率电平校准', 'RW', 'sint2', '10', '2', '0', '200', '30', '100');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B1A', '0x00800B1A', 'LTE1下行输入功率电平校准', 'RW', 'sint2', '10', '2', '0', '200', '30', '100');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B1B', '0x00800B1B', 'LTE2下行输入功率电平校准', 'RW', 'sint2', '10', '2', '0', '200', '30', '100');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B24', '0x00800B24', 'TD-SCDMA同步开启门限', 'RW', 'sint2', '10', '2', '-100', '100', '31', '-240');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B25', '0x00800B25', 'TD-LTE同步开启门限', 'RW', 'sint2', '10', '2', '-100', '100', '31', '-240');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B36', '0x00800B36', 'LTE时隙自动配置', 'RW', 'uint1', '1', '1', '0', '3', '31', '3');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x03A6', '0x008003A6', '时钟告警告警', 'RO', 'bit', '1', '1', '0', '255', '30', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0B41', '0x00800B41', '广播升级', 'RW', 'uint1', '1', '1', '0', '255', '31', '0');
INSERT INTO `ydras_dam41_ai00_c10_idlist_cfg_v16` VALUES ('0x0FFF', '0x00800FFF', '操作权限', 'RW', 'uint1', '1', '1', '0', '3', '31', '3');

-- ----------------------------
-- Table structure for ydras_dem4z_ai02_a10_idlist_cfg_v21
-- ----------------------------
DROP TABLE IF EXISTS `ydras_dem4z_ai02_a10_idlist_cfg_v21`;
CREATE TABLE `ydras_dem4z_ai02_a10_idlist_cfg_v21` (
  `id` varchar(32) DEFAULT NULL,
  `mcpc_id` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  `var_type` varchar(32) DEFAULT NULL,
  `coefficient` int(11) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` double(20,0) DEFAULT NULL,
  `pro` int(11) DEFAULT NULL,
  `v0` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ydras_dem4z_ai02_a10_idlist_cfg_v21
-- ----------------------------
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0002', '0x00000002', '设备厂商代码', 'RO', 'uint1', '1', '1', '0', '255', '0', '21');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0003', '0x00000003', '设备类别', 'RO', 'uint2', '1', '2', '0', '255', '0', '230');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0004', '0x00000004', '设备型号', 'RO', 'str', '1', '20', '0', '255', '0', 'ydras-dem4z-ai02-a10');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0005', '0x00000005', '设备生产序列号', 'RO', 'str', '1', '20', '0', '255', '0', 'DMA1506002');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0006', '0x00000006', '设备实际载波总数', 'RO', 'uint1', '1', '1', '0', '255', '0', '12');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0007', '0x00000007', '经度', 'RO', 'str', '1', '20', '0', '255', '0', 'E103.12345678');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0008', '0x00000008', '纬度', 'RO', 'str', '1', '20', '0', '255', '0', 'E103.12345678');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x000A', '0x0000000A', '监控的当前版本信息', 'RO', 'str', '1', '20', '0', '255', '0', 'dem4z-20_V31.005.00');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0010', '0x00000010', '嵌入式软件运行模式', 'RO', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0011', '0x00000011', '可支持AP:C协议的最大长度', 'RO', 'uint2', '1', '2', '0', '255', '0', '512');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0012', '0x00000012', 'MCP:B采用的交互机制', 'RO', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0013', '0x00000013', '连发系数(Nc)', 'RO', 'uint1', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0014', '0x00000014', '设备响应超时', 'RO', 'uint1', '1', '1', '0', '255', '0', '10');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0015', '0x00000015', '发送间隔时间', 'RO', 'uint2', '1', '2', '0', '65535', '0', '100');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0016', '0x00000016', '暂停传输等待时间', 'RO', 'uint1', '1', '1', '0', '255', '0', '10');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0017', '0x00000017', '软件升级模式等待的时间', 'RO', 'uint2', '1', '2', '0', '65535', '0', '10');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0018', '0x00000018', '设备执行软件升级的结果', 'RO', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0020', '0x00000020', '设备使用的远程升级方式', 'RO', 'uint1', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0021', '0x00000021', 'FPGA版本信息', 'RO', 'str', '1', '20', '0', '255', '0', 'FPGA45_VD901.0045');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0022', '0x00000022', '设备信息：设备实际加载系统', 'RO', 'uint4', '1', '4', '0', '2147483647', '0', '1049');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0023', '0x00000023', '设备位置信息', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0024', '0x00000024', '远端端口数量', 'RO', 'uint1', '1', '1', '0', '255', '0', '7');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0101', '0x00000101', '站点编号', 'RW', 'uint4', '1', '4', '0', '2147483647', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0102', '0x00000102', '设备编号', 'RW', 'uint1', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0150', '0x00000150', '设备当前时间', 'RW', 'dstr', '1', '7', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0160', '0x00000160', 'FTP服务器IP地址', 'RW', 'dstr', '1', '4', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0161', '0x00000161', 'FTP服务器IP地址端口号', 'RW', 'uint2', '1', '2', '0', '65535', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0162', '0x00000162', 'FTP升级操作的用户名', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0163', '0x00000163', 'FTP升级操作的口令', 'RW', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0164', '0x00000164', '相对路径', 'RW', 'str', '1', '40', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0165', '0x00000165', '文件名', 'RW', 'str', '1', '40', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0166', '0x00000166', 'FTP文件传输控制', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0201', '0x00000201', '电源掉电告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0202', '0x00000202', '电源故障告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0204', '0x00000204', '监控模块电池故障告警使能', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0205', '0x00000205', '位置告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0208', '0x00000208', '其它模块告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x020F', '0x0000020F', '主从监控链路告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0220', '0x00000220', '外部告警1告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0221', '0x00000221', '外部告警2告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0222', '0x00000222', '外部告警3告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0223', '0x00000223', '外部告警4告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0224', '0x00000224', '外部告警5告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0225', '0x00000225', '外部告警6告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02A8', '0x00000030', '光收发故障告警1使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02A9', '0x00000031', '光收发故障告警2使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02AA', '0x00000032', '光收发故障告警3使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02AB', '0x00000033', '光收发故障告警4使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02AC', '0x00000034', '光收发故障告警5使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02AD', '0x00000035', '光收发故障告警6使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02AE', '0x00000036', '光收发故障告警7使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02AF', '0x00000037', '光收发故障告警8使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0049', '0x00000049', '设备过温告警使能', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0301', '0x00000301', '电源掉电告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0302', '0x00000302', '电源故障告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0304', '0x00000304', '监控模块电池故障告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0305', '0x00000305', '位置告警', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0308', '0x00000308', '其它模块告警', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0320', '0x00000320', '外部告警1告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0321', '0x00000321', '外部告警2告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0322', '0x00000322', '外部告警3告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0323', '0x00000323', '外部告警4告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0324', '0x00000324', '外部告警5告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0325', '0x00000325', '外部告警6告警', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03A8', '0x0000005C', '光收发故障告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03A9', '0x0000005D', '光收发故障告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03AA', '0x0000005E', '光收发故障告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03AB', '0x0000005F', '光收发故障告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03AC', '0x00000060', '光收发故障告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03AD', '0x00000061', '光收发故障告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03AE', '0x00000062', '光收发故障告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x03AF', '0x00000063', '光收发故障告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0075', '0x00000075', '设备过温告警', 'R0', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0871', '0x00000871', '上行噪声抑制开关', 'RW', 'bit', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0872', '0x00000872', '上行噪声抑制门限', 'RW', 'sint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0172', '0x00000172', '设备过温告警门限', 'RW', 'uint1', '1', '1', '0', '255', '0', '60');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0873', '0x00000873', '设备路由登记地址', 'RW', 'dstr', '1', '4', '0', '255', '0', '0.0.0.0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05A6', '0x0000087C', '设备温度', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F0', '0x080007E0', '光收功率1', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F1', '0x080007E1', '光收功率2', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F2', '0x080007E2', '光收功率3', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F3', '0x080007E3', '光收功率4', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F4', '0x080007E4', '光收功率5', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F5', '0x080007E5', '光收功率6', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F6', '0x080007E6', '光收功率7', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F7', '0x080007E7', '光收功率8', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F8', '0x080007E8', '光发功率1', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05F9', '0x080007E9', '光发功率2', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05FA', '0x080007EA', '光发功率3', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05FB', '0x080007EB', '光发功率4', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05FC', '0x080007EC', '光发功率5', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05FD', '0x080007ED', '光发功率6', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05FE', '0x080007EE', '光发功率7', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05FF', '0x080007EF', '光发功率8', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D00', '0x08000040', '远端光收发故障告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D01', '0x08000041', '远端光收发故障告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D02', '0x08000042', '远端光收发故障告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D03', '0x08000043', '远端光收发故障告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D04', '0x08000044', '远端光收发故障告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D05', '0x08000045', '远端光收发故障告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D06', '0x08000046', '远端光收发故障告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D07', '0x08000047', '远端光收发故障告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E00', '0x08000060', '远端光收发故障告警1', 'RW', 'bit', '1', '1', '0', '1', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E01', '0x08000061', '远端光收发故障告警2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E02', '0x08000062', '远端光收发故障告警3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E03', '0x08000063', '远端光收发故障告警4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E04', '0x08000064', '远端光收发故障告警5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E05', '0x08000065', '远端光收发故障告警6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E06', '0x08000066', '远端光收发故障告警7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E07', '0x08000067', '远端光收发故障告警8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C10', '0x08000080', '远端接入状态1', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C11', '0x08000081', '远端接入状态2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C12', '0x08000082', '远端接入状态3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C13', '0x08000083', '远端接入状态4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C14', '0x08000084', '远端接入状态5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C15', '0x08000085', '远端接入状态6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C16', '0x08000086', '远端接入状态7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C17', '0x08000087', '远端接入状态8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C18', '0x08000220', 'WLAN/固网宽带接入状态1', 'RW', 'uint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C19', '0x08000221', 'WLAN/固网宽带接入状态2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C1A', '0x08000222', 'WLAN/固网宽带接入状态3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C1B', '0x08000223', 'WLAN/固网宽带接入状态4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C1C', '0x08000224', 'WLAN/固网宽带接入状态5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C1D', '0x08000225', 'WLAN/固网宽带接入状态6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C1E', '0x08000226', 'WLAN/固网宽带接入状态7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C1F', '0x08000227', 'WLAN/固网宽带接入状态8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D08', '0x08000300', '远端射频电路故障告警使能1', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D09', '0x08000301', '远端射频电路故障告警使能2', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D0A', '0x08000302', '远端射频电路故障告警使能3', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D0B', '0x08000303', '远端射频电路故障告警使能4', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D0C', '0x08000304', '远端射频电路故障告警使能5', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D0D', '0x08000305', '远端射频电路故障告警使能6', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D0E', '0x08000306', '远端射频电路故障告警使能7', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D0F', '0x08000307', '远端射频电路故障告警使能8', 'RW', 'bit', '1', '1', '0', '0', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E08', '0x08000380', '远端射频电路故障告警1', 'RW', 'bit', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E09', '0x08000381', '远端射频电路故障告警2', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E0A', '0x08000382', '远端射频电路故障告警3', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E0B', '0x08000383', '远端射频电路故障告警4', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E0C', '0x08000384', '远端射频电路故障告警5', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E0D', '0x08000385', '远端射频电路故障告警6', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E0E', '0x08000386', '远端射频电路故障告警7', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E0F', '0x08000387', '远端射频电路故障告警8', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D10', '0x08000400', '远端链路故障告警使能1', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D11', '0x08000401', '远端链路故障告警使能2', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D12', '0x08000402', '远端链路故障告警使能3', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D13', '0x08000403', '远端链路故障告警使能4', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D14', '0x08000404', '远端链路故障告警使能5', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D15', '0x08000405', '远端链路故障告警使能6', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D16', '0x08000406', '远端链路故障告警使能7', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D17', '0x08000407', '远端链路故障告警使能8', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E18', '0x08000480', '远端链路故障告警1', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E19', '0x08000481', '远端链路故障告警2', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1A', '0x08000482', '远端链路故障告警3', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1B', '0x08000483', '远端链路故障告警4', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1C', '0x08000484', '远端链路故障告警5', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1D', '0x08000485', '远端链路故障告警6', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1E', '0x08000486', '远端链路故障告警7', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1F', '0x08000487', '远端链路故障告警8', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C20', '0x08000500', '远端设备温度值1', 'RW', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C21', '0x08000501', '远端设备温度值2', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C22', '0x08000502', '远端设备温度值3', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C23', '0x08000503', '远端设备温度值4', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C24', '0x08000504', '远端设备温度值5', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C25', '0x08000505', '远端设备温度值6', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C26', '0x08000506', '远端设备温度值7', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C27', '0x08000507', '远端设备温度值8', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D18', '0x08000580', '远端设备过温告警使能1', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D19', '0x08000581', '远端设备过温告警使能2', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D1A', '0x08000582', '远端设备过温告警使能3', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D1B', '0x08000583', '远端设备过温告警使能4', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D1C', '0x08000584', '远端设备过温告警使能5', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D1D', '0x08000585', '远端设备过温告警使能6', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D1E', '0x08000586', '远端设备过温告警使能7', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D1F', '0x08000587', '远端设备过温告警使能8', 'RW', 'bit', '1', '1', '0', '255', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E18', '0x08000600', '远端设备过温告警1', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E19', '0x08000601', '远端设备过温告警2', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1A', '0x08000602', '远端设备过温告警3', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1B', '0x08000603', '远端设备过温告警4', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1C', '0x08000604', '远端设备过温告警5', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1D', '0x08000605', '远端设备过温告警6', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1E', '0x08000606', '远端设备过温告警7', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E1F', '0x08000607', '远端设备过温告警8', 'RW', 'bit', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C28', '0x08000680', '远端位置信息1', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C29', '0x08000681', '远端位置信息2', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C2A', '0x08000682', '远端位置信息3', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C2B', '0x08000683', '远端位置信息4', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C2C', '0x08000684', '远端位置信息5', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C2D', '0x08000685', '远端位置信息6', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C2E', '0x08000686', '远端位置信息7', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C2F', '0x08000687', '远端位置信息8', 'RO', 'str', '1', '20', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C30', '0x08000000', '远端光收功率1', 'RW', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C31', '0x08000001', '远端光收功率2', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C32', '0x08000002', '远端光收功率3', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C33', '0x08000003', '远端光收功率4', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C34', '0x08000004', '远端光收功率5', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C35', '0x08000005', '远端光收功率6', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C36', '0x08000006', '远端光收功率7', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C37', '0x08000007', '远端光收功率8', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C38', '0x08000020', '远端光发功率1', 'RW', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C39', '0x08000021', '远端光发功率2', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C3A', '0x08000022', '远端光发功率3', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C3B', '0x08000023', '远端光发功率4', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C3C', '0x08000024', '远端光发功率5', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C3D', '0x08000025', '远端光发功率6', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C3E', '0x08000026', '远端光发功率7', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C3F', '0x08000027', '远端光发功率8', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0490', '0x08001009', 'GSM远端下行输出欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0491', '0x08004009', 'TD-SCDMA远端下行输出欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0492', '0x08007009', 'TD-LTE1远端下行输出欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0493', '0x08008009', 'TD-LTE2远端下行输出欠功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0494', '0x0800100A', 'GSM远端下行输出过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0495', '0x0800400A', 'TD-SCDMA远端下行输出过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0496', '0x0800700A', 'TD-LTE1远端下行输出过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0497', '0x0800800A', 'TD-LTE2远端下行输出过功率门限', 'RW', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C40', '0x08001080', 'GSM远端下行链路时延1', 'RW', 'uint4', '1', '4', '0', '4294967295', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C41', '0x08004080', 'TD-SCDMA远端下行链路时延1', 'RW', 'uint4', '1', '4', '0', '4294967295', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C42', '0x08007080', 'TD-LTE1远端下行链路时延1', 'RW', 'uint4', '1', '4', '0', '4294967295', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C43', '0x08008080', 'TD-LTE2远端下行链路时延1', 'RW', 'uint4', '1', '4', '0', '4294967295', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C44', '0x08001081', 'GSM远端下行链路时延2', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C45', '0x08004081', 'TD-SCDMA远端下行链路时延2', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C46', '0x08007081', 'TD-LTE1远端下行链路时延2', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C47', '0x08008081', 'TD-LTE2远端下行链路时延2', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C48', '0x08001082', 'GSM远端下行链路时延3', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C49', '0x08004082', 'TD-SCDMA远端下行链路时延3', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C4A', '0x08007082', 'TD-LTE1远端下行链路时延3', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C4B', '0x08008082', 'TD-LTE2远端下行链路时延3', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C4C', '0x08001083', 'GSM远端下行链路时延4', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C4D', '0x08004083', 'TD-SCDMA远端下行链路时延4', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C4E', '0x08007083', 'TD-LTE1远端下行链路时延4', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C4F', '0x08008083', 'TD-LTE2远端下行链路时延4', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C50', '0x08001084', 'GSM远端下行链路时延5', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C51', '0x08004084', 'TD-SCDMA远端下行链路时延5', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C52', '0x08007084', 'TD-LTE1远端下行链路时延5', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C53', '0x08008084', 'TD-LTE2远端下行链路时延5', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C54', '0x08001085', 'GSM远端下行链路时延6', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C55', '0x08004085', 'TD-SCDMA远端下行链路时延6', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C56', '0x08007085', 'TD-LTE1远端下行链路时延6', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C57', '0x08008085', 'TD-LTE2远端下行链路时延6', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C58', '0x08001086', 'GSM远端下行链路时延7', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C59', '0x08004086', 'TD-SCDMA远端下行链路时延7', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C5A', '0x08007086', 'TD-LTE1远端下行链路时延7', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C5B', '0x08008086', 'TD-LTE2远端下行链路时延7', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C5C', '0x08001087', 'GSM远端下行链路时延8', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C5D', '0x08004087', 'TD-SCDMA远端下行链路时延8', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C5E', '0x08007087', 'TD-LTE1远端下行链路时延8', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C5F', '0x08008087', 'TD-LTE2远端下行链路时延8', 'RW', 'uint4', '1', '4', '0', '4294967295', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C60', '0x08001100', 'GSM下行输出功率电平1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C61', '0x08004100', 'TD-SCDMA下行输出导频功率电平1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C62', '0x08007100', 'TD-LTE1下行输出导频功率电平1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C63', '0x08008100', 'TD-LTE2下行输出导频功率电平1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C64', '0x08001101', 'GSM下行输出功率电平2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C65', '0x08004101', 'TD-SCDMA下行输出导频功率电平2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C66', '0x08007101', 'TD-LTE1下行输出导频功率电平2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C67', '0x08008101', 'TD-LTE2下行输出导频功率电平2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C68', '0x08001102', 'GSM下行输出功率电平3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C69', '0x08004102', 'TD-SCDMA下行输出导频功率电平3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C6A', '0x08007102', 'TD-LTE1下行输出导频功率电平3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C6B', '0x08008102', 'TD-LTE2下行输出导频功率电平3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C6C', '0x08001103', 'GSM下行输出功率电平4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C6D', '0x08004103', 'TD-SCDMA下行输出导频功率电平4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C6E', '0x08007103', 'TD-LTE1下行输出导频功率电平4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C6F', '0x08008103', 'TD-LTE2下行输出导频功率电平4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C70', '0x08001104', 'GSM下行输出功率电平5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C71', '0x08004104', 'TD-SCDMA下行输出导频功率电平5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C72', '0x08007104', 'TD-LTE1下行输出导频功率电平5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C73', '0x08008104', 'TD-LTE2下行输出导频功率电平5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C74', '0x08001105', 'GSM下行输出功率电平6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C75', '0x08004105', 'TD-SCDMA下行输出导频功率电平6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C76', '0x08007105', 'TD-LTE1下行输出导频功率电平6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C77', '0x08008105', 'TD-LTE2下行输出导频功率电平6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C78', '0x08001106', 'GSM下行输出功率电平7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C79', '0x08004106', 'TD-SCDMA下行输出导频功率电平7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C7A', '0x08007106', 'TD-LTE1下行输出导频功率电平7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C7B', '0x08008106', 'TD-LTE2下行输出导频功率电平7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C7C', '0x08001107', 'GSM下行输出功率电平8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C7D', '0x08004107', 'TD-SCDMA下行输出导频功率电平8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C7E', '0x08007107', 'TD-LTE1下行输出导频功率电平8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C7F', '0x08008107', 'TD-LTE2下行输出导频功率电平8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C80', '0x08001180', 'GSM远端上行理论增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C81', '0x08004180', 'TD-SCDMA远端上行理论增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C82', '0x08007180', 'TD-LTE1远端上行理论增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C83', '0x08008180', 'TD-LTE2远端上行理论增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C84', '0x08001181', 'GSM远端上行理论增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C85', '0x08004181', 'TD-SCDMA远端上行理论增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C86', '0x08007181', 'TD-LTE1远端上行理论增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C87', '0x08008181', 'TD-LTE2远端上行理论增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C88', '0x08001182', 'GSM远端上行理论增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C89', '0x08004182', 'TD-SCDMA远端上行理论增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C8A', '0x08007182', 'TD-LTE1远端上行理论增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C8B', '0x08008182', 'TD-LTE2远端上行理论增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C2C', '0x08001183', 'GSM远端上行理论增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C8D', '0x08004183', 'TD-SCDMA远端上行理论增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C8E', '0x08007183', 'TD-LTE1远端上行理论增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C8F', '0x08008183', 'TD-LTE2远端上行理论增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C90', '0x08001184', 'GSM远端上行理论增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C91', '0x08004184', 'TD-SCDMA远端上行理论增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C92', '0x08007184', 'TD-LTE1远端上行理论增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C93', '0x08008184', 'TD-LTE2远端上行理论增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C94', '0x08001185', 'GSM远端上行理论增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C95', '0x08004185', 'TD-SCDMA远端上行理论增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C96', '0x08007185', 'TD-LTE1远端上行理论增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C97', '0x08008185', 'TD-LTE2远端上行理论增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C98', '0x08001186', 'GSM远端上行理论增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C99', '0x08004186', 'TD-SCDMA远端上行理论增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C9A', '0x08007186', 'TD-LTE1远端上行理论增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C9B', '0x08008186', 'TD-LTE2远端上行理论增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C9C', '0x08001187', 'GSM远端上行理论增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C9D', '0x08004187', 'TD-SCDMA远端上行理论增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C9E', '0x08007187', 'TD-LTE1远端上行理论增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0C9F', '0x08008187', 'TD-LTE2远端上行理论增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA0', '0x08001200', 'GSM远端下行实际增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA1', '0x08004200', 'TD-SCDMA远端下行实际增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA2', '0x08007200', 'TD-LTE1远端下行实际增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA3', '0x08008200', 'TD-LTE2远端下行实际增益1', 'RO', 'sint1', '1', '1', '0', '255', '2', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA4', '0x08001201', 'GSM远端下行实际增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA5', '0x08004201', 'TD-SCDMA远端下行实际增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA6', '0x08007201', 'TD-LTE1远端下行实际增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x02A7', '0x08008201', 'TD-LTE2远端下行实际增益2', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA8', '0x08001202', 'GSM远端下行实际增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CA9', '0x08004202', 'TD-SCDMA远端下行实际增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CAA', '0x08007202', 'TD-LTE1远端下行实际增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CAB', '0x08008202', 'TD-LTE2远端下行实际增益3', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CAC', '0x08001203', 'GSM远端下行实际增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CAD', '0x08004203', 'TD-SCDMA远端下行实际增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CAE', '0x08007203', 'TD-LTE1远端下行实际增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CAF', '0x08008203', 'TD-LTE2远端下行实际增益4', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB0', '0x08001204', 'GSM远端下行实际增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB1', '0x08004204', 'TD-SCDMA远端下行实际增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB2', '0x08007204', 'TD-LTE1远端下行实际增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB3', '0x08008204', 'TD-LTE2远端下行实际增益5', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB4', '0x08001205', 'GSM远端下行实际增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB5', '0x08004205', 'TD-SCDMA远端下行实际增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB6', '0x08007205', 'TD-LTE1远端下行实际增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB7', '0x08008205', 'TD-LTE2远端下行实际增益6', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB8', '0x08001206', 'GSM远端下行实际增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CB9', '0x08004206', 'TD-SCDMA远端下行实际增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CBA', '0x08007206', 'TD-LTE1远端下行实际增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CBB', '0x08008206', 'TD-LTE2远端下行实际增益7', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CBC', '0x08001207', 'GSM远端下行实际增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CBD', '0x08004207', 'TD-SCDMA远端下行实际增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CBE', '0x08007207', 'TD-LTE1远端下行实际增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CBF', '0x08008207', 'TD-LTE2远端下行实际增益8', 'RO', 'sint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC0', '0x08001280', 'GSM远端射频信号开关状态1', 'RW', 'bit', '1', '1', '0', '1', '3', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC1', '0x08004280', 'TD-SCDMA远端射频信号开关状态1', 'RW', 'bit', '1', '1', '0', '1', '3', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC2', '0x08007280', 'TD-LTE1远端射频信号开关状态1', 'RW', 'bit', '1', '1', '0', '1', '3', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC3', '0x08008280', 'TD-LTE2远端射频信号开关状态1', 'RW', 'bit', '1', '1', '0', '1', '3', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC4', '0x08001281', 'GSM远端射频信号开关状态2', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC5', '0x08004281', 'TD-SCDMA远端射频信号开关状态2', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC6', '0x08007281', 'TD-LTE1远端射频信号开关状态2', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC7', '0x08008281', 'TD-LTE2远端射频信号开关状态2', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC8', '0x08001282', 'GSM远端射频信号开关状态3', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CC9', '0x08004282', 'TD-SCDMA远端射频信号开关状态3', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CCA', '0x08007282', 'TD-LTE1远端射频信号开关状态3', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CCB', '0x08008282', 'TD-LTE2远端射频信号开关状态3', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CCC', '0x08001283', 'GSM远端射频信号开关状态4', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CCD', '0x08004283', 'TD-SCDMA远端射频信号开关状态4', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CCE', '0x08007283', 'TD-LTE1远端射频信号开关状态4', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CCF', '0x08008283', 'TD-LTE2远端射频信号开关状态4', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD0', '0x08001284', 'GSM远端射频信号开关状态5', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD1', '0x08004284', 'TD-SCDMA远端射频信号开关状态5', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD2', '0x08007284', 'TD-LTE1远端射频信号开关状态5', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD3', '0x08008284', 'TD-LTE2远端射频信号开关状态5', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD4', '0x08001285', 'GSM远端射频信号开关状态6', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD5', '0x08004285', 'TD-SCDMA远端射频信号开关状态6', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD6', '0x08007285', 'TD-LTE1远端射频信号开关状态6', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD7', '0x08008285', 'TD-LTE2远端射频信号开关状态6', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD8', '0x08001286', 'GSM远端射频信号开关状态7', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CD9', '0x08004286', 'TD-SCDMA远端射频信号开关状态7', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CDA', '0x08007286', 'TD-LTE1远端射频信号开关状态7', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CDB', '0x08008286', 'TD-LTE2远端射频信号开关状态7', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CDC', '0x08001287', 'GSM远端射频信号开关状态8', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CDD', '0x08004287', 'TD-SCDMA远端射频信号开关状态8', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CDE', '0x08007287', 'TD-LTE1远端射频信号开关状态8', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CDF', '0x08008287', 'TD-LTE2远端射频信号开关状态8', 'RW', 'bit', '1', '1', '0', '1', '0', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE0', '0x08001300', 'GSM远端上行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE1', '0x08004300', 'TD-SCDMA远端上行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE2', '0x08007300', 'TD-LTE1远端上行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE3', '0x08008300', 'TD-LTE2远端上行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE4', '0x08001301', 'GSM远端上行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE5', '0x08004301', 'TD-SCDMA远端上行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE6', '0x08007301', 'TD-LTE1远端上行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE7', '0x08008301', 'TD-LTE2远端上行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE8', '0x08001302', 'GSM远端上行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CE9', '0x08004302', 'TD-SCDMA远端上行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CEA', '0x08007302', 'TD-LTE1远端上行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CEB', '0x08008302', 'TD-LTE2远端上行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CEC', '0x08001303', 'GSM远端上行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CED', '0x08004303', 'TD-SCDMA远端上行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CEE', '0x08007303', 'TD-LTE1远端上行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CEF', '0x08008303', 'TD-LTE2远端上行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF0', '0x08001304', 'GSM远端上行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF1', '0x08004304', 'TD-SCDMA远端上行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF2', '0x08007304', 'TD-LTE1远端上行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF3', '0x08008304', 'TD-LTE2远端上行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF4', '0x08001305', 'GSM远端上行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF5', '0x08004305', 'TD-SCDMA远端上行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF6', '0x08007305', 'TD-LTE1远端上行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF7', '0x08008305', 'TD-LTE2远端上行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF8', '0x08001306', 'GSM远端上行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CF9', '0x08004306', 'TD-SCDMA远端上行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CFA', '0x08007306', 'TD-LTE1远端上行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CFB', '0x08008306', 'TD-LTE2远端上行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CFC', '0x08001307', 'GSM远端上行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CFD', '0x08004307', 'TD-SCDMA远端上行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CFE', '0x08007307', 'TD-LTE1远端上行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0CFF', '0x08008307', 'TD-LTE2远端上行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F00', '0x08001380', 'GSM远端下行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F01', '0x08004380', 'TD-SCDMA远端下行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F02', '0x08007380', 'TD-LTE1远端下行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F03', '0x08008380', 'TD-LTE2远端下行衰减值1', 'RW', 'uint1', '1', '1', '0', '255', '3', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F04', '0x08001381', 'GSM远端下行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F05', '0x08004381', 'TD-SCDMA远端下行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F06', '0x08007381', 'TD-LTE1远端下行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F07', '0x08008381', 'TD-LTE2远端下行衰减值2', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F08', '0x08001382', 'GSM远端下行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F09', '0x08004382', 'TD-SCDMA远端下行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F0A', '0x08007382', 'TD-LTE1远端下行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F0B', '0x08008382', 'TD-LTE2远端下行衰减值3', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F0C', '0x08001383', 'GSM远端下行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F0D', '0x08004383', 'TD-SCDMA远端下行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F0E', '0x08007383', 'TD-LTE1远端下行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F0F', '0x08008383', 'TD-LTE2远端下行衰减值4', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F10', '0x08001384', 'GSM远端下行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F11', '0x08004384', 'TD-SCDMA远端下行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F12', '0x08007384', 'TD-LTE1远端下行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F13', '0x08008384', 'TD-LTE2远端下行衰减值5', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F14', '0x08001385', 'GSM远端下行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F15', '0x08004385', 'TD-SCDMA远端下行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F16', '0x08007385', 'TD-LTE1远端下行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F17', '0x08008385', 'TD-LTE2远端下行衰减值6', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F18', '0x08001386', 'GSM远端下行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F19', '0x08004386', 'TD-SCDMA远端下行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F1A', '0x08007386', 'TD-LTE1远端下行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F1B', '0x08008386', 'TD-LTE2远端下行衰减值7', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F1C', '0x08001387', 'GSM远端下行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F1D', '0x08004387', 'TD-SCDMA远端下行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F1E', '0x08007387', 'TD-LTE1远端下行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0F1F', '0x08008387', 'TD-LTE2远端下行衰减值8', 'RW', 'uint1', '1', '1', '0', '255', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D20', '0x08001400', 'GSM远端下行输出欠功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D21', '0x08004400', 'TD-SCDMA远端下行输出欠功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D22', '0x08007400', 'TD-LTE1远端下行输出欠功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D23', '0x08008400', 'TD-LTE2远端下行输出欠功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D24', '0x08001401', 'GSM远端下行输出欠功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D25', '0x08004401', 'TD-SCDMA远端下行输出欠功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D26', '0x08007401', 'TD-LTE1远端下行输出欠功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D27', '0x08008401', 'TD-LTE2远端下行输出欠功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D28', '0x08001402', 'GSM远端下行输出欠功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D29', '0x08004402', 'TD-SCDMA远端下行输出欠功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D2A', '0x08007402', 'TD-LTE1远端下行输出欠功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D2B', '0x08008402', 'TD-LTE2远端下行输出欠功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D2C', '0x08001403', 'GSM远端下行输出欠功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D2D', '0x08004403', 'TD-SCDMA远端下行输出欠功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D2E', '0x08007403', 'TD-LTE1远端下行输出欠功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D2F', '0x08008403', 'TD-LTE2远端下行输出欠功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D30', '0x08001404', 'GSM远端下行输出欠功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D31', '0x08004404', 'TD-SCDMA远端下行输出欠功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D32', '0x08007404', 'TD-LTE1远端下行输出欠功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D33', '0x08008404', 'TD-LTE2远端下行输出欠功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D34', '0x08001405', 'GSM远端下行输出欠功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D35', '0x08004405', 'TD-SCDMA远端下行输出欠功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D36', '0x08007405', 'TD-LTE1远端下行输出欠功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D37', '0x08008405', 'TD-LTE2远端下行输出欠功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D38', '0x08001406', 'GSM远端下行输出欠功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D39', '0x08004406', 'TD-SCDMA远端下行输出欠功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D3A', '0x08007406', 'TD-LTE1远端下行输出欠功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D3B', '0x08008406', 'TD-LTE2远端下行输出欠功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D3C', '0x08001407', 'GSM远端下行输出欠功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D3D', '0x08004407', 'TD-SCDMA远端下行输出欠功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D3E', '0x08007407', 'TD-LTE1远端下行输出欠功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D3F', '0x08008407', 'TD-LTE2远端下行输出欠功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E20', '0x08001480', 'GSM远端下行输出欠功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E21', '0x08004480', 'TD-SCDMA远端下行输出欠功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E22', '0x08007480', 'TD-LTE1远端下行输出欠功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E23', '0x08008480', 'TD-LTE2远端下行输出欠功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E24', '0x08001481', 'GSM远端下行输出欠功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E25', '0x08004481', 'TD-SCDMA远端下行输出欠功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E26', '0x08007481', 'TD-LTE1远端下行输出欠功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E27', '0x08008481', 'TD-LTE2远端下行输出欠功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E28', '0x08001482', 'GSM远端下行输出欠功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E29', '0x08004482', 'TD-SCDMA远端下行输出欠功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E2A', '0x08007482', 'TD-LTE1远端下行输出欠功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E2B', '0x08008482', 'TD-LTE2远端下行输出欠功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E2C', '0x08001483', 'GSM远端下行输出欠功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E2D', '0x08004483', 'TD-SCDMA远端下行输出欠功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E2E', '0x08007483', 'TD-LTE1远端下行输出欠功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E2F', '0x08008483', 'TD-LTE2远端下行输出欠功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E30', '0x08001484', 'GSM远端下行输出欠功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E31', '0x08004484', 'TD-SCDMA远端下行输出欠功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E32', '0x08007484', 'TD-LTE1远端下行输出欠功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E33', '0x08008484', 'TD-LTE2远端下行输出欠功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E34', '0x08001485', 'GSM远端下行输出欠功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E35', '0x08004485', 'TD-SCDMA远端下行输出欠功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E36', '0x08007485', 'TD-LTE1远端下行输出欠功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E37', '0x08008485', 'TD-LTE2远端下行输出欠功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E38', '0x08001486', 'GSM远端下行输出欠功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E39', '0x08004486', 'TD-SCDMA远端下行输出欠功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E3A', '0x08007486', 'TD-LTE1远端下行输出欠功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E3B', '0x08008486', 'TD-LTE2远端下行输出欠功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E3C', '0x08001487', 'GSM远端下行输出欠功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E3D', '0x08004487', 'TD-SCDMA远端下行输出欠功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E3E', '0x08007487', 'TD-LTE1远端下行输出欠功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E3F', '0x08008487', 'TD-LTE2远端下行输出欠功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D40', '0x08001500', 'GSM远端下行输出过功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D41', '0x08004500', 'TD-SCDMA远端下行输出过功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D42', '0x08007500', 'TD-LTE1远端下行输出过功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D43', '0x08008500', 'TD-LTE2远端下行输出过功率告警使能1', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D44', '0x08001501', 'GSM远端下行输出过功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D45', '0x08004501', 'TD-SCDMA远端下行输出过功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D46', '0x08007501', 'TD-LTE1远端下行输出过功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D47', '0x08008501', 'TD-LTE2远端下行输出过功率告警使能2', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D48', '0x08001502', 'GSM远端下行输出过功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D49', '0x08004502', 'TD-SCDMA远端下行输出过功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D4A', '0x08007502', 'TD-LTE1远端下行输出过功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D4B', '0x08008502', 'TD-LTE2远端下行输出过功率告警使能3', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D4C', '0x08001503', 'GSM远端下行输出过功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D4D', '0x08004503', 'TD-SCDMA远端下行输出过功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D4E', '0x08007503', 'TD-LTE1远端下行输出过功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D4F', '0x08008503', 'TD-LTE2远端下行输出过功率告警使能4', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D50', '0x08001504', 'GSM远端下行输出过功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D51', '0x08004504', 'TD-SCDMA远端下行输出过功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D52', '0x08007504', 'TD-LTE1远端下行输出过功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D53', '0x08008504', 'TD-LTE2远端下行输出过功率告警使能5', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D54', '0x08001505', 'GSM远端下行输出过功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D55', '0x08004505', 'TD-SCDMA远端下行输出过功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D56', '0x08007505', 'TD-LTE1远端下行输出过功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D57', '0x08008505', 'TD-LTE2远端下行输出过功率告警使能6', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D58', '0x08001506', 'GSM远端下行输出过功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D59', '0x08004506', 'TD-SCDMA远端下行输出过功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D5A', '0x08007506', 'TD-LTE1远端下行输出过功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D5B', '0x08008506', 'TD-LTE2远端下行输出过功率告警使能7', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D5C', '0x08001507', 'GSM远端下行输出过功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D5D', '0x08004507', 'TD-SCDMA远端下行输出过功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D5E', '0x08007507', 'TD-LTE1远端下行输出过功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0D5F', '0x08008507', 'TD-LTE2远端下行输出过功率告警使能8', 'RW', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E40', '0x08001580', 'GSM远端下行输出过功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E41', '0x08004580', 'TD-SCDMA远端下行输出过功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E42', '0x08007580', 'TD-LTE1远端下行输出过功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E43', '0x08008580', 'TD-LTE2远端下行输出过功率告警1', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E44', '0x08001581', 'GSM远端下行输出过功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E45', '0x08004581', 'TD-SCDMA远端下行输出过功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E46', '0x08007581', 'TD-LTE1远端下行输出过功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E47', '0x08008581', 'TD-LTE2远端下行输出过功率告警2', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E48', '0x08001582', 'GSM远端下行输出过功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E49', '0x08004582', 'TD-SCDMA远端下行输出过功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E4A', '0x08007582', 'TD-LTE1远端下行输出过功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E4B', '0x08008582', 'TD-LTE2远端下行输出过功率告警3', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E4C', '0x08001583', 'GSM远端下行输出过功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E4D', '0x08004583', 'TD-SCDMA远端下行输出过功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E4E', '0x08007583', 'TD-LTE1远端下行输出过功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E4F', '0x08008583', 'TD-LTE2远端下行输出过功率告警4', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E50', '0x08001584', 'GSM远端下行输出过功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E51', '0x08004584', 'TD-SCDMA远端下行输出过功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E52', '0x08007584', 'TD-LTE1远端下行输出过功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E53', '0x08008584', 'TD-LTE2远端下行输出过功率告警5', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E54', '0x08001585', 'GSM远端下行输出过功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E55', '0x08004585', 'TD-SCDMA远端下行输出过功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E56', '0x08007585', 'TD-LTE1远端下行输出过功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E57', '0x08008585', 'TD-LTE2远端下行输出过功率告警6', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E58', '0x08001586', 'GSM远端下行输出过功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E59', '0x08004586', 'TD-SCDMA远端下行输出过功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E5A', '0x08007586', 'TD-LTE1远端下行输出过功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E5B', '0x08008586', 'TD-LTE2远端下行输出过功率告警7', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E5C', '0x08001587', 'GSM远端下行输出过功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E5D', '0x08004587', 'TD-SCDMA远端下行输出过功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E5E', '0x08007587', 'TD-LTE1远端下行输出过功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0E5F', '0x08008587', 'TD-LTE2远端下行输出过功率告警8', 'RO', 'bit', '1', '1', '0', '1', '0', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0151', '0x00000151', '设备IP地址', 'RW', 'dstr', '1', '4', '0', '255', '0', '192.168.10.110');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0152', '0x00000152', '设备子网掩码', 'RW', 'dstr', '1', '4', '0', '255', '0', '255.255.255.0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0153', '0x00000153', '设备默认网关', 'RW', 'dstr', '1', '4', '0', '255', '0', '192.168.10.1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x01A0', '0x008001A0', 'CPLD版本信息', 'RO', 'str', '1', '20', '0', '0', '30', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x01A1', '0x008001A1', '设备MAC地址', 'RO', 'str', '1', '20', '0', '0', '30', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x01A6', '0x008003A6', '时钟告警告警', 'RO', 'bit', '1', '1', '0', '255', '30', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E0', '0x008005E0', 'RAU端口1电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E1', '0x008005E1', 'RAU端口2电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E2', '0x008005E2', 'RAU端口3电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E3', '0x008005E3', 'RAU端口4电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E4', '0x008005E4', 'RAU端口5电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E5', '0x008005E5', 'RAU端口6电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E6', '0x008005E6', 'RAU端口7电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E7', '0x008005E7', 'RAU端口8电流', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E8', '0x008005E8', 'RAU端口1电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05E9', '0x008005E9', 'RAU端口2电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05EA', '0x008005EA', 'RAU端口3电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05EB', '0x008005EB', 'RAU端口4电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05EC', '0x008005EC', 'RAU端口5电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05ED', '0x008005ED', 'RAU端口6电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05EE', '0x008005EE', 'RAU端口7电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x05EF', '0x008005EF', 'RAU端口8电压', 'RO', 'uint2', '1', '2', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0901', '0x00800901', '电流保护标志1', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0902', '0x00800902', '电流保护标志2', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0903', '0x00800903', '电流保护标志3', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0904', '0x00800904', '电流保护标志4', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0905', '0x00800905', '电流保护标志5', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0906', '0x00800906', '电流保护标志6', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0907', '0x00800907', '电流保护标志7', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0908', '0x00800908', '电流保护标志8', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0911', '0x00800911', '短路标志1', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0912', '0x00800912', '短路标志2', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0913', '0x00800913', '短路标志3', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0914', '0x00800914', '短路标志4', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0915', '0x00800915', '短路标志5', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0916', '0x00800916', '短路标志6', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0917', '0x00800917', '短路标志7', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0918', '0x00800918', '短路标志8', 'RO', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0921', '0x00800921', '告警复位1', 'RW', 'uint1', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0931', '0x00800931', '电流保护使能', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0932', '0x00800932', '电流保护值', 'RW', 'uint2', '1', '1', '0', '255', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06A8', '0x008006A8', '远供电源开关1', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06A9', '0x008006A9', '远供电源开关2', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06AA', '0x008006AA', '远供电源开关3', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06AB', '0x008006AB', '远供电源开关4', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06AC', '0x008006AC', '远供电源开关5', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06AD', '0x008006AD', '远供电源开关6', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06AE', '0x008006AE', '远供电源开关7', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x06AF', '0x008006AF', '远供电源开关8', 'RW', 'uint1', '1', '1', '0', '0', '31', '1');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0B41', '0x00800B41', '广播升级', 'RW', 'uint1', '1', '1', '0', '255', '31', '0');
INSERT INTO `ydras_dem4z_ai02_a10_idlist_cfg_v21` VALUES ('0x0FFF', '0x00800FFF', '操作权限', 'RW', 'uint1', '1', '1', '0', '0', '31', '3');

-- ----------------------------
-- View structure for v_au_pm_data
-- ----------------------------
DROP VIEW IF EXISTS `v_au_pm_data`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_au_pm_data` AS SELECT 
 CONCAT(
    'EMS=WELLHEAD,ManagedElement=',
    device_site.uid
  )                                     AS dn, 
 device_site.NAME                       AS userLabel,
 au_pm_parameter_name.parameter_id      AS parameter_id,
 au_pm_parameter_name.parameter_name_ch AS parameter_name_ch,
 device_data.VALUE                      AS parameter_value,
 device_data.update_time                AS update_time
FROM device_site 
  JOIN device_data ON device_site.uid = device_data.site_uid 
  JOIN au_pm_parameter_name ON device_data.param_uid = au_pm_parameter_name.parameter_id 
WHERE device_site.device_type=1 ;

-- ----------------------------
-- View structure for v_current_alarm
-- ----------------------------
DROP VIEW IF EXISTS `v_current_alarm`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_current_alarm` AS SELECT 
  device_data.id              AS NotificationId,
  CONCAT(
    device_data.site_uid,
    device_data.param_uid
  )                           AS AlarmUniqueId,
  'notifyNewAlarm'            AS NotificationType,
  device_data.update_time     AS AlarmTime,
  CONCAT(
    'EMS=WELLHEAD,ManagedElement=',
    device_site.uid
  )                           AS EquipmentSDN,
  device_site.NAME            AS EquipmentName,
  CASE
    device_site.device_type 
    WHEN 1 THEN '231' 
    WHEN 2 THEN '230' 
    ELSE        'Unknown' 
  END                         AS EquipmentClass,
  device_site.uid             AS ObjectSDN,
  device_site.NAME            AS ObjectInstanceName,
  CASE
    device_site.device_type 
    WHEN 1 THEN '231' 
    WHEN 2 THEN '230' 
    ELSE        'Unknown' 
  END                         AS ObjectClass,
  device_site.location        AS AdditionalText,
  device_site.manufactor      AS DeviceVendorOUI,
  au_alarm_type.alarm_type_id AS SpecificProblemID,
  au_alarm_type.alarm_name_ch AS SpecificProblem,
  au_alarm_type.alarm_type    AS AlarmType,
  au_alarm_type.alarm_level   AS PerceivedSeverity,
  au_alarm_type.alarm_type_id AS ProbableCause,
  ''                          AS AdditionalInformation 
FROM
  device_site 
  JOIN device_data ON device_site.uid = device_data.site_uid 
  JOIN au_alarm_type ON device_data.param_uid = au_alarm_type.alarm_type_id 
WHERE device_site.device_type = 1 AND device_data.VALUE = 1 
UNION
SELECT 
  device_data.id              AS NotificationId,
  CONCAT(
    device_data.site_uid,
    device_data.param_uid
  )                           AS AlarmUniqueId,
  'notifyNewAlarm'            AS NotificationType,
  device_data.update_time     AS AlarmTime,
  CONCAT(
    'EMS=WELLHEAD,ManagedElement=',
    device_site.uid
  )                           AS EquipmentSDN,
  device_site.NAME            AS EquipmentName,
  CASE
    device_site.device_type 
    WHEN 1 THEN '231'
    WHEN 2 THEN '230'
 ELSE        'Unknown' 
  END                         AS EquipmentClass,
  device_site.uid             AS ObjectSDN,
  device_site.NAME            AS ObjectInstanceName,
  CASE
    device_site.device_type 
    WHEN 1 THEN '231' 
    WHEN 2 THEN '230' 
    ELSE        'Unknown' 
  END                         AS ObjectClass,
  device_site.location        AS AdditionalText,
  device_site.manufactor      AS DeviceVendorOUI,
  eu_alarm_type.alarm_type_id AS SpecificProblemID,
  eu_alarm_type.alarm_name_ch AS SpecificProblem,
  eu_alarm_type.alarm_type    AS AlarmType,
  eu_alarm_type.alarm_level   AS PerceivedSeverity,
  eu_alarm_type.alarm_type_id AS ProbableCause,
  ''                          AS AdditionalInformation 
FROM
  device_site 
  JOIN device_data ON device_site.uid = device_data.site_uid 
  JOIN eu_alarm_type ON device_data.param_uid = eu_alarm_type.alarm_type_id 
WHERE device_site.device_type = 2 AND device_data.VALUE = 1 ;

-- ----------------------------
-- View structure for v_device
-- ----------------------------
DROP VIEW IF EXISTS `v_device`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_device` AS SELECT 
  CONCAT(
    'EMS=WELLHEAD,ManagedElement=',
    device_site.uid
  )            									AS dn,
  device_site.name         			AS friendlyName,
  device_site.pid          			AS pid,
  device_site.device_type  			AS deviceType,
  device_site.mcp_protocol 			AS mcpProtocol,
  device_conn_info.device_ip		AS ipAddress,
  device_conn_info.device_port  AS `port`,
  device_site.comment      			AS `comment`,
  device_site.create_user  			AS createUser,
  device_site.status       			AS `status`,
  device_site.path         			AS path,
  device_site.create_time  			AS createTime,
  device_site.update_time  			AS updateTime 
FROM
  device_site left join device_conn_info on device_site.uid=device_conn_info.site_uid ;

-- ----------------------------
-- View structure for v_eu_pm_data
-- ----------------------------
DROP VIEW IF EXISTS `v_eu_pm_data`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_eu_pm_data` AS SELECT 
   CONCAT(
    'EMS=WELLHEAD,ManagedElement=',
    device_site.uid
  )                                      AS dn, 
  device_site.NAME                       AS userLabel,
  eu_pm_parameter_name.parameter_id      AS parameter_id,
  eu_pm_parameter_name.parameter_name_ch AS parameter_name_ch,
  device_data.VALUE                      AS parameter_value,
  device_data.update_time                AS update_time
FROM device_site 
  JOIN device_data ON device_site.uid = device_data.site_uid 
  JOIN eu_pm_parameter_name ON device_data.param_uid = eu_pm_parameter_name.parameter_id 
WHERE device_site.device_type = 2 ;
