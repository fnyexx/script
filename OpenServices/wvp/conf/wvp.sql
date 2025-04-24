/*
 Navicat Premium Data Transfer

 Source Server         : dev-192.168.186.x
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : 192.168.186.x:3306
 Source Schema         : oig-wvp

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 24/04/2025 17:32:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wvp_cloud_record
-- ----------------------------
DROP TABLE IF EXISTS `wvp_cloud_record`;
CREATE TABLE `wvp_cloud_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stream` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `call_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` bigint(20) NULL DEFAULT NULL,
  `end_time` bigint(20) NULL DEFAULT NULL,
  `media_server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `folder` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `collect` tinyint(1) NULL DEFAULT 0,
  `file_size` bigint(20) NULL DEFAULT NULL,
  `time_len` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_cloud_record
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_common_group
-- ----------------------------
DROP TABLE IF EXISTS `wvp_common_group`;
CREATE TABLE `wvp_common_group`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `parent_device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `business_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `civil_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_common_group_device_platform`(`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_common_group
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_common_region
-- ----------------------------
DROP TABLE IF EXISTS `wvp_common_region`;
CREATE TABLE `wvp_common_region`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `parent_device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_common_region_device_id`(`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_common_region
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_device
-- ----------------------------
DROP TABLE IF EXISTS `wvp_device`;
CREATE TABLE `wvp_device`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firmware` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transport` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stream_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `on_line` tinyint(1) NULL DEFAULT 0,
  `register_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepalive_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `port` int(11) NULL DEFAULT NULL,
  `expires` int(11) NULL DEFAULT NULL,
  `subscribe_cycle_for_catalog` int(11) NULL DEFAULT 0,
  `subscribe_cycle_for_mobile_position` int(11) NULL DEFAULT 0,
  `mobile_position_submission_interval` int(11) NULL DEFAULT 5,
  `subscribe_cycle_for_alarm` int(11) NULL DEFAULT 0,
  `host_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `charset` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ssrc_check` tinyint(1) NULL DEFAULT 0,
  `geo_coord_sys` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `media_server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'auto',
  `custom_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdp_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `local_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `as_message_channel` tinyint(1) NULL DEFAULT 0,
  `heart_beat_interval` int(11) NULL DEFAULT NULL,
  `heart_beat_count` int(11) NULL DEFAULT NULL,
  `position_capability` int(11) NULL DEFAULT NULL,
  `broadcast_push_after_ack` tinyint(1) NULL DEFAULT 0,
  `server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_device_device`(`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_device
-- ----------------------------
INSERT INTO `wvp_device` VALUES (2, '11010100001300000001', 'EasyGBD-00001', 'TSINGSEE', 'EasyGBD', 'V1.0', 'TCP', 'TCP-PASSIVE', 1, '2025-04-24 08:54:04', '2025-04-24 09:31:41', '10.233.92.128', '2025-04-17 12:24:14', '2025-04-24 09:31:41', 63742, 3600, 0, 0, 5, 0, '10.233.92.128:63742', 'GB2312', 0, 'WGS84', 'auto', NULL, '192.168.186.148', '10.233.70.233', NULL, 0, 60, 3, 0, 0, '000000');

-- ----------------------------
-- Table structure for wvp_device_alarm
-- ----------------------------
DROP TABLE IF EXISTS `wvp_device_alarm`;
CREATE TABLE `wvp_device_alarm`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `channel_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alarm_priority` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarm_method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarm_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarm_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `alarm_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_device_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_device_channel
-- ----------------------------
DROP TABLE IF EXISTS `wvp_device_channel`;
CREATE TABLE `wvp_device_channel`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `civil_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `block` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parental` int(11) NULL DEFAULT NULL,
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `safety_way` int(11) NULL DEFAULT NULL,
  `register_way` int(11) NULL DEFAULT NULL,
  `cert_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `certifiable` int(11) NULL DEFAULT NULL,
  `err_code` int(11) NULL DEFAULT NULL,
  `end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secrecy` int(11) NULL DEFAULT NULL,
  `ip_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `port` int(11) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `ptz_type` int(11) NULL DEFAULT NULL,
  `position_type` int(11) NULL DEFAULT NULL,
  `room_type` int(11) NULL DEFAULT NULL,
  `use_type` int(11) NULL DEFAULT NULL,
  `supply_light_type` int(11) NULL DEFAULT NULL,
  `direction_type` int(11) NULL DEFAULT NULL,
  `resolution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `business_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `download_speed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `svc_space_support_mod` int(11) NULL DEFAULT NULL,
  `svc_time_support_mode` int(11) NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sub_count` int(11) NULL DEFAULT NULL,
  `stream_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_audio` tinyint(1) NULL DEFAULT 0,
  `gps_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stream_identification` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `channel_type` int(11) NOT NULL DEFAULT 0,
  `gb_device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_manufacturer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_civil_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_block` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_parental` int(11) NULL DEFAULT NULL,
  `gb_parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_safety_way` int(11) NULL DEFAULT NULL,
  `gb_register_way` int(11) NULL DEFAULT NULL,
  `gb_cert_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_certifiable` int(11) NULL DEFAULT NULL,
  `gb_err_code` int(11) NULL DEFAULT NULL,
  `gb_end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_secrecy` int(11) NULL DEFAULT NULL,
  `gb_ip_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_port` int(11) NULL DEFAULT NULL,
  `gb_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_longitude` double NULL DEFAULT NULL,
  `gb_latitude` double NULL DEFAULT NULL,
  `gb_business_group_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_ptz_type` int(11) NULL DEFAULT NULL,
  `gb_position_type` int(11) NULL DEFAULT NULL,
  `gb_room_type` int(11) NULL DEFAULT NULL,
  `gb_use_type` int(11) NULL DEFAULT NULL,
  `gb_supply_light_type` int(11) NULL DEFAULT NULL,
  `gb_direction_type` int(11) NULL DEFAULT NULL,
  `gb_resolution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_download_speed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gb_svc_space_support_mod` int(11) NULL DEFAULT NULL,
  `gb_svc_time_support_mode` int(11) NULL DEFAULT NULL,
  `record_plan_id` int(11) NULL DEFAULT NULL,
  `data_type` int(11) NOT NULL,
  `data_device_id` int(11) NOT NULL,
  `gps_speed` double NULL DEFAULT NULL,
  `gps_altitude` double NULL DEFAULT NULL,
  `gps_direction` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_wvp_unique_channel`(`gb_device_id`) USING BTREE,
  INDEX `data_type`(`data_type`) USING BTREE,
  INDEX `data_device_id`(`data_device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_device_channel
-- ----------------------------
INSERT INTO `wvp_device_channel` VALUES (2, '11010100001310000001', 'CH00', 'TSINGSEE', 'EasyGBD', 'owner', NULL, NULL, '', 0, '11010100001300000001', NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'ON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 12:24:15', '2025-04-24 03:28:35', 0, '11010100001300000001_11010100001310000001', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for wvp_device_mobile_position
-- ----------------------------
DROP TABLE IF EXISTS `wvp_device_mobile_position`;
CREATE TABLE `wvp_device_mobile_position`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `channel_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `altitude` double NULL DEFAULT NULL,
  `speed` double NULL DEFAULT NULL,
  `direction` double NULL DEFAULT NULL,
  `report_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_device_mobile_position
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_media_server
-- ----------------------------
DROP TABLE IF EXISTS `wvp_media_server`;
CREATE TABLE `wvp_media_server`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hook_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdp_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stream_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `http_port` int(11) NULL DEFAULT NULL,
  `http_ssl_port` int(11) NULL DEFAULT NULL,
  `rtmp_port` int(11) NULL DEFAULT NULL,
  `rtmp_ssl_port` int(11) NULL DEFAULT NULL,
  `rtp_proxy_port` int(11) NULL DEFAULT NULL,
  `rtsp_port` int(11) NULL DEFAULT NULL,
  `rtsp_ssl_port` int(11) NULL DEFAULT NULL,
  `flv_port` int(11) NULL DEFAULT NULL,
  `flv_ssl_port` int(11) NULL DEFAULT NULL,
  `ws_flv_port` int(11) NULL DEFAULT NULL,
  `ws_flv_ssl_port` int(11) NULL DEFAULT NULL,
  `auto_config` tinyint(1) NULL DEFAULT 0,
  `secret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'zlm',
  `rtp_enable` tinyint(1) NULL DEFAULT 0,
  `rtp_port_range` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_rtp_port_range` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record_assist_port` int(11) NULL DEFAULT NULL,
  `default_server` tinyint(1) NULL DEFAULT 0,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hook_alive_interval` int(11) NULL DEFAULT NULL,
  `record_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record_day` int(11) NULL DEFAULT 7,
  `transcode_suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_media_server_unique_ip_http_port`(`ip`, `http_port`, `server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_media_server
-- ----------------------------
INSERT INTO `wvp_media_server` VALUES ('zlmediakit-local', '0.0.0.0', '127.0.0.1', '192.168.186.154', '192.168.186.154', 30201, 32244, 11935, 18350, 32526, 22554, 11332, 30201, 32244, 30201, 32244, 1, '034523TF8yT83wh5Wvz73f7', 'zlm', 0, '30010,30014', '50000,50050', 18081, 1, '2025-04-18 03:33:26', '2025-04-18 07:06:33', 10, '', 7, '', '000000');

-- ----------------------------
-- Table structure for wvp_platform
-- ----------------------------
DROP TABLE IF EXISTS `wvp_platform`;
CREATE TABLE `wvp_platform`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_gb_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_gb_domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_port` int(11) NULL DEFAULT NULL,
  `device_gb_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_port` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expires` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keep_timeout` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transport` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `civil_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `character_set` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ptz` tinyint(1) NULL DEFAULT 0,
  `rtcp` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `catalog_group` int(11) NULL DEFAULT NULL,
  `register_way` int(11) NULL DEFAULT NULL,
  `secrecy` int(11) NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `as_message_channel` tinyint(1) NULL DEFAULT 0,
  `catalog_with_platform` int(11) NULL DEFAULT 1,
  `catalog_with_group` int(11) NULL DEFAULT 1,
  `catalog_with_region` int(11) NULL DEFAULT 1,
  `auto_push_channel` tinyint(1) NULL DEFAULT 1,
  `send_stream_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_platform_unique_server_gb_id`(`server_gb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_platform
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_platform_channel
-- ----------------------------
DROP TABLE IF EXISTS `wvp_platform_channel`;
CREATE TABLE `wvp_platform_channel`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform_id` int(11) NULL DEFAULT NULL,
  `device_channel_id` int(11) NULL DEFAULT NULL,
  `custom_device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_owner` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_civil_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_block` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_parental` int(11) NULL DEFAULT NULL,
  `custom_parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_safety_way` int(11) NULL DEFAULT NULL,
  `custom_register_way` int(11) NULL DEFAULT NULL,
  `custom_cert_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_certifiable` int(11) NULL DEFAULT NULL,
  `custom_err_code` int(11) NULL DEFAULT NULL,
  `custom_end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_secrecy` int(11) NULL DEFAULT NULL,
  `custom_ip_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_port` int(11) NULL DEFAULT NULL,
  `custom_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_longitude` double NULL DEFAULT NULL,
  `custom_latitude` double NULL DEFAULT NULL,
  `custom_ptz_type` int(11) NULL DEFAULT NULL,
  `custom_position_type` int(11) NULL DEFAULT NULL,
  `custom_room_type` int(11) NULL DEFAULT NULL,
  `custom_use_type` int(11) NULL DEFAULT NULL,
  `custom_supply_light_type` int(11) NULL DEFAULT NULL,
  `custom_direction_type` int(11) NULL DEFAULT NULL,
  `custom_resolution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_business_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_download_speed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_svc_space_support_mod` int(11) NULL DEFAULT NULL,
  `custom_svc_time_support_mode` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_platform_gb_channel_platform_id_catalog_id_device_channel_id`(`platform_id`, `device_channel_id`) USING BTREE,
  UNIQUE INDEX `uk_platform_gb_channel_device_id`(`custom_device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_platform_channel
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_platform_group
-- ----------------------------
DROP TABLE IF EXISTS `wvp_platform_group`;
CREATE TABLE `wvp_platform_group`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform_id` int(11) NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_wvp_platform_group_platform_id_group_id`(`platform_id`, `group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_platform_group
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_platform_region
-- ----------------------------
DROP TABLE IF EXISTS `wvp_platform_region`;
CREATE TABLE `wvp_platform_region`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform_id` int(11) NULL DEFAULT NULL,
  `region_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_wvp_platform_region_platform_id_group_id`(`platform_id`, `region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_platform_region
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_record_plan
-- ----------------------------
DROP TABLE IF EXISTS `wvp_record_plan`;
CREATE TABLE `wvp_record_plan`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `snap` tinyint(1) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_record_plan
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_record_plan_item
-- ----------------------------
DROP TABLE IF EXISTS `wvp_record_plan_item`;
CREATE TABLE `wvp_record_plan_item`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start` int(11) NULL DEFAULT NULL,
  `stop` int(11) NULL DEFAULT NULL,
  `week_day` int(11) NULL DEFAULT NULL,
  `plan_id` int(11) NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_record_plan_item
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_resources_tree
-- ----------------------------
DROP TABLE IF EXISTS `wvp_resources_tree`;
CREATE TABLE `wvp_resources_tree`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_catalog` tinyint(1) NULL DEFAULT 1,
  `device_channel_id` int(11) NULL DEFAULT NULL,
  `gb_stream_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_resources_tree
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_stream_proxy
-- ----------------------------
DROP TABLE IF EXISTS `wvp_stream_proxy`;
CREATE TABLE `wvp_stream_proxy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stream` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `src_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeout` int(11) NULL DEFAULT NULL,
  `ffmpeg_cmd_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rtsp_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `media_server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable_audio` tinyint(1) NULL DEFAULT 0,
  `enable_mp4` tinyint(1) NULL DEFAULT 0,
  `pulling` tinyint(1) NULL DEFAULT 0,
  `enable` tinyint(1) NULL DEFAULT 0,
  `enable_remove_none_reader` tinyint(1) NULL DEFAULT 0,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stream_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable_disable_none_reader` tinyint(1) NULL DEFAULT 0,
  `relates_media_server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_stream_proxy_app_stream`(`app`, `stream`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_stream_proxy
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_stream_push
-- ----------------------------
DROP TABLE IF EXISTS `wvp_stream_push`;
CREATE TABLE `wvp_stream_push`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stream` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `media_server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `push_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pushing` tinyint(1) NULL DEFAULT 0,
  `self` tinyint(1) NULL DEFAULT 0,
  `start_offline_push` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_stream_push_app_stream`(`app`, `stream`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_stream_push
-- ----------------------------

-- ----------------------------
-- Table structure for wvp_user
-- ----------------------------
DROP TABLE IF EXISTS `wvp_user`;
CREATE TABLE `wvp_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `push_key` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_user_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wvp_user
-- ----------------------------
INSERT INTO `wvp_user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '2021-04-13 14:14:57', '2021-04-13 14:14:57', '3e80d1762a324d5b0ff636e0bd16f1e3');
INSERT INTO `wvp_user` VALUES (2, 'yhapi', '0501c1de482b48fe71d8b107bc7a1040', 1, '2025-03-04 14:48:31', '2025-03-04 14:48:31', '416ba4e856cfea764bbaaf6718424e50');

-- ----------------------------
-- Table structure for wvp_user_api_key
-- ----------------------------
DROP TABLE IF EXISTS `wvp_user_api_key`;
CREATE TABLE `wvp_user_api_key`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `app` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `api_key` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `expired_at` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `enable` tinyint(1) NULL DEFAULT 1,
  `create_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wvp_user_api_key
-- ----------------------------
INSERT INTO `wvp_user_api_key` VALUES (1, 2, 'yh-iot', 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjNlNzk2NDZjNGRiYzQwODM4M2E5ZWVkMDlmMmI4NWFlIn0.eyJqdGkiOiJ6MHNvX0ZYYUNFTFRTckY5Yk14MW93IiwiaWF0IjoxNzQxMDcwOTI0LCJuYmYiOjE3NDEwNzA5MjQsInN1YiI6ImxvZ2luIiwiYXVkIjoiQXVkaWVuY2UiLCJ1c2VyTmFtZSI6InloYXBpIiwiYXBpS2V5SWQiOjF9.EchNaQ-ReTLD09GXbmf_TPZA1FgaL9ePHLJEoG030ZruSTCIFg58BQudBPm9UyIIiNRUQEhrvhD05n8bVLZVg7t0yYalyMhhch_mYHmqzABuMK4NyOe529-J-ANgxTIfOEgUbOl46vR1MDMY1dLXEPgsc_vqzkhDNp-iqOma34kXLwCMimKIFdFdZl9vyNvPi9Op_JrULnNfKXSSI_PudhZDo9YJxwwEH9eVyn_6t2ctkC7d9NnZ7vrwJXKbPXjYv5dA6TfEpQg6fwhsh2_mz0vAK8PW0td9Nh8hXgYYTosBctdvUikUtzmXvDvbuYdS2tJPNUpDdEYZMfBuvRPeEQ', 0, NULL, 1, '2025-03-04 14:48:44', '2025-03-04 14:48:44');

-- ----------------------------
-- Table structure for wvp_user_api_key_copy1
-- ----------------------------
DROP TABLE IF EXISTS `wvp_user_api_key_copy1`;
CREATE TABLE `wvp_user_api_key_copy1`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `api_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `expired_at` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` tinyint(1) NULL DEFAULT 1,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_user_api_key_copy1
-- ----------------------------
INSERT INTO `wvp_user_api_key_copy1` VALUES (1, 2, 'yh-iot', 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjNlNzk2NDZjNGRiYzQwODM4M2E5ZWVkMDlmMmI4NWFlIn0.eyJqdGkiOiJ6MHNvX0ZYYUNFTFRTckY5Yk14MW93IiwiaWF0IjoxNzQxMDcwOTI0LCJuYmYiOjE3NDEwNzA5MjQsInN1YiI6ImxvZ2luIiwiYXVkIjoiQXVkaWVuY2UiLCJ1c2VyTmFtZSI6InloYXBpIiwiYXBpS2V5SWQiOjF9.EchNaQ-ReTLD09GXbmf_TPZA1FgaL9ePHLJEoG030ZruSTCIFg58BQudBPm9UyIIiNRUQEhrvhD05n8bVLZVg7t0yYalyMhhch_mYHmqzABuMK4NyOe529-J-ANgxTIfOEgUbOl46vR1MDMY1dLXEPgsc_vqzkhDNp-iqOma34kXLwCMimKIFdFdZl9vyNvPi9Op_JrULnNfKXSSI_PudhZDo9YJxwwEH9eVyn_6t2ctkC7d9NnZ7vrwJXKbPXjYv5dA6TfEpQg6fwhsh2_mz0vAK8PW0td9Nh8hXgYYTosBctdvUikUtzmXvDvbuYdS2tJPNUpDdEYZMfBuvRPeEQ', 0, NULL, 1, '2025-03-04 14:48:44', '2025-03-04 14:48:44');

-- ----------------------------
-- Table structure for wvp_user_copy1
-- ----------------------------
DROP TABLE IF EXISTS `wvp_user_copy1`;
CREATE TABLE `wvp_user_copy1`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `push_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uk_user_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_user_copy1
-- ----------------------------
INSERT INTO `wvp_user_copy1` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '2021-04-13 14:14:57', '2021-04-13 14:14:57', '3e80d1762a324d5b0ff636e0bd16f1e3');
INSERT INTO `wvp_user_copy1` VALUES (2, 'yhapi', '0501c1de482b48fe71d8b107bc7a1040', 1, '2025-03-04 14:48:31', '2025-03-04 14:48:31', '416ba4e856cfea764bbaaf6718424e50');

-- ----------------------------
-- Table structure for wvp_user_role
-- ----------------------------
DROP TABLE IF EXISTS `wvp_user_role`;
CREATE TABLE `wvp_user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `authority` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wvp_user_role
-- ----------------------------
INSERT INTO `wvp_user_role` VALUES (1, 'admin', '0', '2021-04-13 14:14:57', '2021-04-13 14:14:57');

-- ----------------------------
-- Table structure for wvp_user_role_copy1
-- ----------------------------
DROP TABLE IF EXISTS `wvp_user_role_copy1`;
CREATE TABLE `wvp_user_role_copy1`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authority` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wvp_user_role_copy1
-- ----------------------------
INSERT INTO `wvp_user_role_copy1` VALUES (1, 'admin', '0', '2021-04-13 14:14:57', '2021-04-13 14:14:57');

-- ----------------------------
-- Procedure structure for wvp_20240528
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20240528`;
delimiter ;;
CREATE PROCEDURE `wvp_20240528`()
BEGIN
    IF NOT EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_media_server' and column_name = 'transcode_suffix')
    THEN
        ALTER TABLE wvp_media_server ADD transcode_suffix  character varying(255);
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_media_server' and column_name = 'type')
    THEN
        alter table wvp_media_server
            add  type character varying(50) default 'zlm';
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_media_server' and column_name = 'flv_port')
    THEN
        alter table wvp_media_server  add flv_port integer;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_media_server' and column_name = 'flv_ssl_port')
    THEN
        alter table wvp_media_server add flv_ssl_port integer;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_media_server' and column_name = 'ws_flv_port')
    THEN
        alter table wvp_media_server add ws_flv_port integer;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_media_server' and column_name = 'ws_flv_ssl_port')
    THEN
        alter table wvp_media_server add ws_flv_ssl_port integer;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wvp_20241222
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20241222`;
delimiter ;;
CREATE PROCEDURE `wvp_20241222`()
BEGIN
    IF EXISTS (SELECT column_name FROM information_schema.STATISTICS
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and INDEX_NAME = 'uk_wvp_device_channel_unique_device_channel')
    THEN
        alter table wvp_device_channel drop index uk_wvp_device_channel_unique_device_channel;
    END IF;

    IF EXISTS (SELECT column_name FROM information_schema.STATISTICS
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and INDEX_NAME = 'uk_wvp_unique_stream_push_id')
    THEN
        alter table wvp_device_channel drop index uk_wvp_unique_stream_push_id;
    END IF;

    IF EXISTS (SELECT column_name FROM information_schema.STATISTICS
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and INDEX_NAME = 'uk_wvp_unique_stream_proxy_id')
    THEN
        alter table wvp_device_channel drop index uk_wvp_unique_stream_proxy_id;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device_channel' and column_name = 'data_type')
    THEN
        alter table wvp_device_channel add data_type integer not null;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device_channel' and column_name = 'data_device_id')
    THEN
        alter table wvp_device_channel add data_device_id integer not null;
    END IF;

    IF EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device_channel' and column_name = 'device_db_id')
    THEN
        update wvp_device_channel wdc INNER JOIN
            (SELECT id, device_db_id from wvp_device_channel where device_db_id is not null ) ct on ct.id = wdc.id
        set wdc.data_type = 1, wdc.data_device_id = ct.device_db_id where wdc.device_db_id is not null;
        alter table wvp_device_channel drop device_db_id;
    END IF;

    IF EXISTS (SELECT column_name FROM information_schema.columns
               WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device_channel' and column_name = 'stream_push_id')
    THEN
        update wvp_device_channel wdc INNER JOIN
            (SELECT id, stream_push_id from wvp_device_channel where stream_push_id is not null ) ct on ct.id = wdc.id
        set wdc.data_type = 2, wdc.data_device_id = ct.stream_push_id where wdc.stream_push_id is not null;
        alter table wvp_device_channel drop stream_push_id;
    END IF;

    IF EXISTS (SELECT column_name FROM information_schema.columns
               WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device_channel' and column_name = 'stream_proxy_id')
    THEN
        update wvp_device_channel wdc INNER JOIN
            (SELECT id, stream_proxy_id from wvp_device_channel where stream_proxy_id is not null ) ct on ct.id = wdc.id
        set wdc.data_type = 3, wdc.data_device_id = ct.stream_proxy_id where wdc.stream_proxy_id is not null;
        alter table wvp_device_channel drop stream_proxy_id;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wvp_20241231
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20241231`;
delimiter ;;
CREATE PROCEDURE `wvp_20241231`()
BEGIN
    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_stream_proxy' and column_name = 'relates_media_server_id')
    THEN
        alter table wvp_stream_proxy add relates_media_server_id character varying(50);
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wvp_20250111
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20250111`;
delimiter ;;
CREATE PROCEDURE `wvp_20250111`()
BEGIN
    IF EXISTS (SELECT column_name FROM information_schema.STATISTICS
               WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_cloud_record' and INDEX_NAME = 'uk_stream_push_app_stream_path')
    THEN
        alter table wvp_cloud_record drop index uk_stream_push_app_stream_path ;
    END IF;

    IF EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_cloud_record' and column_name = 'folder')
    THEN
        alter table wvp_cloud_record modify folder varchar(500) null;
    END IF;

    IF EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_cloud_record' and column_name = 'file_path')
    THEN
        alter table wvp_cloud_record modify file_path varchar(500) null;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wvp_20250211
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20250211`;
delimiter ;;
CREATE PROCEDURE `wvp_20250211`()
BEGIN
    IF EXISTS (SELECT column_name FROM information_schema.STATISTICS
               WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device' and column_name = 'keepalive_interval_time')
    THEN
        alter table wvp_device change keepalive_interval_time heart_beat_interval integer after as_message_channel;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device' and column_name = 'heart_beat_count')
    THEN
        alter table wvp_device add heart_beat_count integer;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device' and column_name = 'position_capability')
    THEN
        alter table wvp_device add position_capability integer;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wvp_20250312
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20250312`;
delimiter ;;
CREATE PROCEDURE `wvp_20250312`()
BEGIN
    DECLARE serverId VARCHAR(32) DEFAULT '你的服务ID';
    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_device' and column_name = 'server_id')
    THEN
        alter table wvp_device add server_id character varying(50);
        update wvp_device set server_id = serverId;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_media_server' and column_name = 'server_id')
    THEN
        alter table wvp_media_server add server_id character varying(50);
        update wvp_media_server set server_id = serverId;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_stream_proxy' and column_name = 'server_id')
    THEN
        alter table wvp_stream_proxy add server_id character varying(50);
        update wvp_stream_proxy set server_id = serverId;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_cloud_record' and column_name = 'server_id')
    THEN
        alter table wvp_cloud_record add server_id character varying(50);
        update wvp_cloud_record set server_id = serverId;
    END IF;

    IF not EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and table_name = 'wvp_platform' and column_name = 'server_id')
    THEN
        alter table wvp_platform add server_id character varying(50);
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wvp_20250319
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20250319`;
delimiter ;;
CREATE PROCEDURE `wvp_20250319`()
BEGIN
    IF NOT EXISTS (SELECT column_name FROM information_schema.columns
               WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and column_name = 'gps_speed')
    THEN
        alter table wvp_device_channel add gps_speed double precision;
    END IF;

    IF NOT EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and column_name = 'gps_altitude')
    THEN
        alter table wvp_device_channel add gps_altitude double precision;
    END IF;

    IF NOT EXISTS (SELECT column_name FROM information_schema.columns
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and column_name = 'gps_direction')
    THEN
        alter table wvp_device_channel add gps_direction double precision;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wvp_20250402
-- ----------------------------
DROP PROCEDURE IF EXISTS `wvp_20250402`;
delimiter ;;
CREATE PROCEDURE `wvp_20250402`()
BEGIN
    IF NOT EXISTS (SELECT column_name FROM information_schema.STATISTICS
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and INDEX_NAME = 'data_type')
    THEN
        create index data_type on wvp_device_channel (data_type);
    END IF;
    IF NOT EXISTS (SELECT column_name FROM information_schema.STATISTICS
                   WHERE TABLE_SCHEMA = (SELECT DATABASE()) and  table_name = 'wvp_device_channel' and INDEX_NAME = 'data_device_id')
    THEN
        create index data_device_id on wvp_device_channel (data_device_id);
    END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
