/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80039
Source Host           : localhost:3306
Source Database       : fish

Target Server Type    : MYSQL
Target Server Version : 80039
File Encoding         : 65001

Date: 2024-12-08 17:01:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 短信验证码', '6', 'add_verifycode');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 短信验证码', '6', 'change_verifycode');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 短信验证码', '6', 'delete_verifycode');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 短信验证码', '6', 'view_verifycode');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 用户', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 用户', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 用户', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 用户', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('29', 'Can add Token', '8', 'add_token');
INSERT INTO `auth_permission` VALUES ('30', 'Can change Token', '8', 'change_token');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete Token', '8', 'delete_token');
INSERT INTO `auth_permission` VALUES ('32', 'Can view Token', '8', 'view_token');
INSERT INTO `auth_permission` VALUES ('33', 'Can add Token', '9', 'add_tokenproxy');
INSERT INTO `auth_permission` VALUES ('34', 'Can change Token', '9', 'change_tokenproxy');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete Token', '9', 'delete_tokenproxy');
INSERT INTO `auth_permission` VALUES ('36', 'Can view Token', '9', 'view_tokenproxy');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 水池信息', '10', 'add_waterpool');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 水池信息', '10', 'change_waterpool');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 水池信息', '10', 'delete_waterpool');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 水池信息', '10', 'view_waterpool');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 鱼类信息', '11', 'add_fishgroup');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 鱼类信息', '11', 'change_fishgroup');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 鱼类信息', '11', 'delete_fishgroup');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 鱼类信息', '11', 'view_fishgroup');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 鱼类分类', '12', 'add_fishcategory');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 鱼类分类', '12', 'change_fishcategory');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 鱼类分类', '12', 'delete_fishcategory');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 鱼类分类', '12', 'view_fishcategory');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 鱼类分类', '13', 'add_fishcategory');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 鱼类分类', '13', 'change_fishcategory');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 鱼类分类', '13', 'delete_fishcategory');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 鱼类分类', '13', 'view_fishcategory');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 鱼类信息', '14', 'add_fishgroup');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 鱼类信息', '14', 'change_fishgroup');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 鱼类信息', '14', 'delete_fishgroup');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 鱼类信息', '14', 'view_fishgroup');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 水池信息', '15', 'add_waterpool');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 水池信息', '15', 'change_waterpool');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 水池信息', '15', 'delete_waterpool');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 水池信息', '15', 'view_waterpool');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 轮播图', '16', 'add_banners');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 轮播图', '16', 'change_banners');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 轮播图', '16', 'delete_banners');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 轮播图', '16', 'view_banners');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 用户搜索的图片', '17', 'add_profile');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 用户搜索的图片', '17', 'change_profile');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 用户搜索的图片', '17', 'delete_profile');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 用户搜索的图片', '17', 'view_profile');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 用户个人资料展示', '18', 'add_listuserprofile');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 用户个人资料展示', '18', 'change_listuserprofile');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 用户个人资料展示', '18', 'delete_listuserprofile');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 用户个人资料展示', '18', 'view_listuserprofile');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2024-11-28 16:02:33.061733', '17', '732649', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2024-11-28 16:02:33.061733', '16', '645370', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2024-11-28 16:02:33.061733', '15', '580308', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2024-11-28 16:02:33.061733', '14', '831572', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2024-11-28 16:02:33.061733', '13', '535603', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2024-11-28 16:02:33.061733', '12', '225692', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2024-11-28 16:02:33.061733', '11', '770072', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2024-11-28 16:02:33.061733', '10', '962001', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2024-11-28 16:02:33.061733', '9', '929094', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2024-11-28 16:02:33.061733', '8', '617539', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2024-11-28 16:02:33.061733', '7', '566569', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2024-11-28 16:02:33.061733', '6', '426293', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2024-11-28 16:02:33.061733', '5', '171010', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2024-11-28 16:02:33.061733', '4', '988310', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2024-11-28 16:02:33.061733', '3', '393765', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2024-11-28 16:02:33.061733', '2', '801490', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2024-11-28 16:02:33.061733', '1', '872450', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2024-11-28 16:02:47.618594', '18', '123456', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2024-11-28 16:11:33.495430', '19', '13456', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2024-11-28 16:11:59.106246', '20', '111111', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2024-11-28 16:56:32.718942', '2', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2024-11-28 17:37:57.142064', '4', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2024-11-28 17:37:57.142064', '3', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2024-11-28 17:41:10.076080', '5', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2024-11-28 17:42:03.238957', '6', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2024-11-28 17:45:39.302379', '7', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2024-11-28 17:50:33.933734', '8', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2024-11-29 03:07:52.062587', '9', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2024-11-29 09:32:55.348327', '28', '200421', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2024-11-29 09:40:48.401199', '1', '未命名用户', '2', '[{\"changed\": {\"fields\": [\"\\u7535\\u8bdd\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2024-11-30 15:04:59.475078', '1', '深海池塘', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2024-11-30 15:14:03.920272', '1', '金枪鱼科', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2024-12-01 09:47:43.909280', '9', '水池C', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2024-12-01 09:47:43.909280', '8', '水池B', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2024-12-01 09:47:43.909280', '6', '水池C', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2024-12-01 09:47:43.909280', '4', '水池A', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2024-12-01 09:47:43.909280', '2', '水池B', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2024-12-01 09:47:43.909280', '1', '水池A', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2024-12-01 15:05:31.741544', '20', '黑石斑鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2024-12-01 15:05:31.741544', '19', '螳螂鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2024-12-01 15:05:31.741544', '18', '魔鬼鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2024-12-01 15:05:31.741544', '17', '大西洋鳕鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2024-12-01 15:05:31.741544', '16', '石斑鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2024-12-01 15:05:31.741544', '15', '银龙鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2024-12-01 15:05:31.741544', '14', '红目鲢', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2024-12-01 15:05:31.741544', '13', '草鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2024-12-01 15:05:31.741544', '12', '飞鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2024-12-01 15:05:31.741544', '11', '月光鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2024-12-01 15:05:31.741544', '10', '黄鳍鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2024-12-01 15:05:31.741544', '9', '红鳍鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2024-12-01 15:05:31.741544', '8', '龙鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2024-12-01 15:05:31.741544', '7', '金枪鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2024-12-01 15:05:31.741544', '6', '海马', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2024-12-01 15:05:31.741544', '5', '虎头鲨', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2024-12-01 15:05:31.741544', '4', '锦鲤', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2024-12-01 15:05:31.741544', '3', '孔雀鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2024-12-01 15:05:31.741544', '2', '金龙鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2024-12-01 15:05:31.741544', '1', '黑鳍金枪鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2024-12-01 15:12:04.680900', '20', '黑石斑鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2024-12-01 15:12:04.680900', '19', '螳螂鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2024-12-01 15:12:04.680900', '18', '魔鬼鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2024-12-01 15:12:04.680900', '17', '大西洋鳕鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2024-12-01 15:12:04.680900', '16', '石斑鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2024-12-01 15:12:04.680900', '15', '银龙鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2024-12-01 15:12:04.680900', '14', '红目鲢', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2024-12-01 15:12:04.680900', '13', '草鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2024-12-01 15:12:04.680900', '12', '飞鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2024-12-01 15:12:04.680900', '11', '月光鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2024-12-01 15:12:04.680900', '10', '黄鳍鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2024-12-01 15:12:04.681910', '9', '红鳍鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2024-12-01 15:12:04.681910', '8', '龙鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2024-12-01 15:12:04.681910', '7', '金枪鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2024-12-01 15:12:04.681910', '6', '海马', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2024-12-01 15:12:04.681910', '5', '虎头鲨', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2024-12-01 15:12:04.681910', '4', '锦鲤', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2024-12-01 15:12:04.681910', '3', '孔雀鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2024-12-01 15:12:04.681910', '2', '金龙鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2024-12-01 15:12:04.681910', '1', '黑鳍金枪鱼', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2024-12-03 05:20:05.188436', '20', '黑石斑鱼', '2', '[{\"changed\": {\"fields\": [\"\\u89c6\\u9891\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2024-12-03 05:20:23.013072', '20', '黑石斑鱼', '2', '[{\"changed\": {\"fields\": [\"\\u89c6\\u9891\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2024-12-03 16:20:36.685329', '12', '飞鱼', '2', '[{\"changed\": {\"fields\": [\"\\u9c7c\\u7c7b\\u5206\\u5e03\\u7684\\u6c34\\u6c60\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2024-12-03 17:32:12.584060', '12', '飞鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2024-12-04 11:45:31.831684', '1', '黑鳍金枪鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2024-12-04 11:47:26.358439', '1', '黑鳍金枪鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2024-12-04 11:48:44.887180', '2', '金龙鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2024-12-04 11:49:58.582922', '3', '孔雀鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2024-12-04 11:51:37.727552', '4', '锦鲤', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2024-12-04 11:54:03.091973', '5', '虎头鲨', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2024-12-04 11:55:18.796358', '6', '海马', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2024-12-04 11:56:57.850094', '7', '金枪鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2024-12-04 11:59:01.216973', '6', '海马', '2', '[{\"changed\": {\"fields\": [\"\\u5065\\u5eb7\\u9884\\u8b66\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2024-12-04 12:00:12.855389', '9', '红鳍鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2024-12-04 12:01:17.999119', '10', '黄鳍鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2024-12-04 12:03:02.570207', '11', '月光鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2024-12-04 12:04:08.365740', '12', '飞鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2024-12-04 12:05:04.641524', '13', '草鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2024-12-04 12:06:27.678988', '14', '红目鲢', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2024-12-04 12:09:29.547809', '15', '银龙鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2024-12-04 12:12:12.144669', '16', '石斑鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2024-12-04 12:13:15.149681', '17', '大西洋鳕鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2024-12-04 12:32:03.380929', '18', '魔鬼鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2024-12-04 12:33:09.052430', '19', '螳螂鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2024-12-04 12:34:03.145672', '20', '黑石斑鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2024-12-04 12:37:29.621289', '8', '龙鱼', '2', '[{\"changed\": {\"fields\": [\"\\u5bcc\\u6587\\u672c\\u5185\\u5bb9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2024-12-04 15:30:52.516082', '20', '黑石斑鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2024-12-04 15:30:52.516082', '19', '螳螂鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2024-12-04 15:30:52.516082', '18', '魔鬼鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2024-12-04 15:30:52.516082', '17', '大西洋鳕鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2024-12-04 15:30:52.516082', '16', '石斑鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2024-12-04 15:30:52.516082', '15', '银龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2024-12-04 15:30:52.516082', '14', '红目鲢', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2024-12-04 15:30:52.516082', '13', '草鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2024-12-04 15:30:52.516082', '12', '飞鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('114', '2024-12-04 15:30:52.517083', '11', '月光鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('115', '2024-12-04 15:30:52.517083', '10', '黄鳍鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('116', '2024-12-04 15:30:52.517083', '9', '红鳍鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('117', '2024-12-04 15:30:52.517083', '8', '龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('118', '2024-12-04 15:30:52.517083', '7', '金枪鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('119', '2024-12-04 15:30:52.517083', '6', '海马', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('120', '2024-12-04 15:30:52.517083', '5', '虎头鲨', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('121', '2024-12-04 15:30:52.517083', '4', '锦鲤', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('122', '2024-12-04 15:30:52.517083', '3', '孔雀鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('123', '2024-12-04 15:30:52.517083', '2', '金龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('124', '2024-12-04 15:30:52.517083', '1', '黑鳍金枪鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('125', '2024-12-04 15:32:34.364827', '40', '黑石斑鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('126', '2024-12-04 15:32:34.364827', '39', '螳螂鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('127', '2024-12-04 15:32:34.364827', '38', '魔鬼鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('128', '2024-12-04 15:32:34.364827', '37', '大西洋鳕鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('129', '2024-12-04 15:32:34.364827', '36', '石斑鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('130', '2024-12-04 15:32:34.364827', '35', '银龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('131', '2024-12-04 15:32:34.364827', '34', '红目鲢', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('132', '2024-12-04 15:32:34.364827', '33', '草鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('133', '2024-12-04 15:32:34.364827', '32', '飞鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('134', '2024-12-04 15:32:34.364827', '31', '月光鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('135', '2024-12-04 15:32:34.364827', '30', '黄鳍鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('136', '2024-12-04 15:32:34.364827', '29', '红鳍鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('137', '2024-12-04 15:32:34.364827', '28', '龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('138', '2024-12-04 15:32:34.364827', '27', '金枪鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('139', '2024-12-04 15:32:34.364827', '26', '海马', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('140', '2024-12-04 15:32:34.364827', '25', '虎头鲨', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('141', '2024-12-04 15:32:34.364827', '24', '锦鲤', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('142', '2024-12-04 15:32:34.364827', '23', '孔雀鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('143', '2024-12-04 15:32:34.364827', '22', '金龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('144', '2024-12-04 15:32:34.364827', '21', '黑鳍金枪鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('145', '2024-12-04 15:33:44.272341', '60', '黑石斑鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('146', '2024-12-04 15:33:44.272341', '59', '螳螂鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('147', '2024-12-04 15:33:44.272341', '58', '魔鬼鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('148', '2024-12-04 15:33:44.272341', '57', '大西洋鳕鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('149', '2024-12-04 15:33:44.272341', '56', '石斑鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('150', '2024-12-04 15:33:44.272341', '55', '银龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('151', '2024-12-04 15:33:44.272341', '54', '红目鲢', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('152', '2024-12-04 15:33:44.272341', '53', '草鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('153', '2024-12-04 15:33:44.272341', '52', '飞鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('154', '2024-12-04 15:33:44.272341', '51', '月光鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('155', '2024-12-04 15:33:44.272341', '50', '黄鳍鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('156', '2024-12-04 15:33:44.272341', '49', '红鳍鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('157', '2024-12-04 15:33:44.272341', '48', '龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('158', '2024-12-04 15:33:44.272341', '47', '金枪鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('159', '2024-12-04 15:33:44.272341', '46', '海马', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('160', '2024-12-04 15:33:44.272341', '45', '虎头鲨', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('161', '2024-12-04 15:33:44.272341', '44', '锦鲤', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('162', '2024-12-04 15:33:44.272341', '43', '孔雀鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('163', '2024-12-04 15:33:44.272341', '42', '金龙鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('164', '2024-12-04 15:33:44.272341', '41', '黑鳍金枪鱼', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('165', '2024-12-05 16:15:15.365888', '7', 'root', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('166', '2024-12-05 16:15:15.365888', '6', 'root', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('167', '2024-12-05 16:15:15.365888', '5', 'root', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('168', '2024-12-05 16:15:15.365888', '4', 'AME', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('169', '2024-12-05 16:15:15.365888', '3', 'AME', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('170', '2024-12-05 16:15:15.365888', '2', 'AME', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('171', '2024-12-05 16:15:15.365888', '1', 'AME', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('172', '2024-12-07 12:07:02.609586', '12', '未命名用户', '2', '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('173', '2024-12-07 12:07:15.266258', '12', 'zhangqiwei', '2', '[{\"changed\": {\"fields\": [\"\\u59d3\\u540d\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('174', '2024-12-07 12:08:28.733378', '11', 'DANZAI', '2', '[{\"changed\": {\"fields\": [\"\\u59d3\\u540d\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('175', '2024-12-07 12:12:01.348801', '10', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('176', '2024-12-07 12:32:15.025526', '13', '未命名用户', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('177', '2024-12-07 12:41:30.418506', '14', 'AQU', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('178', '2024-12-07 12:46:44.027894', '15', 'QTU', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('179', '2024-12-07 12:53:15.056007', '1', 'AWER', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('180', '2024-12-07 12:53:20.799967', '2', 'ARES', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('181', '2024-12-07 13:58:47.636428', '16', 'AWER', '2', '[{\"changed\": {\"fields\": [\"\\u7535\\u5b50\\u90ae\\u7bb1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('182', '2024-12-07 13:59:55.311234', '1', 'AWER', '2', '[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u7b80\\u4ecb\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('183', '2024-12-07 16:33:19.347602', '16', 'AWER', '2', '[{\"changed\": {\"fields\": [\"\\u7535\\u8bdd\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('184', '2024-12-07 17:46:45.182035', '16', 'AWEP', '2', '[{\"changed\": {\"fields\": [\"\\u7535\\u8bdd\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('185', '2024-12-07 17:48:42.262052', '16', 'AWEP', '2', '[{\"changed\": {\"fields\": [\"\\u7535\\u8bdd\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('186', '2024-12-07 17:49:15.799245', '16', 'AWEP', '2', '[]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('187', '2024-12-08 08:35:06.327331', '16', 'AWEO', '2', '[{\"changed\": {\"fields\": [\"Password\"]}}]', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('8', 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES ('9', 'authtoken', 'tokenproxy');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('12', 'fish', 'fishcategory');
INSERT INTO `django_content_type` VALUES ('11', 'fish', 'fishgroup');
INSERT INTO `django_content_type` VALUES ('10', 'fish', 'waterpool');
INSERT INTO `django_content_type` VALUES ('16', 'fish_manage', 'banners');
INSERT INTO `django_content_type` VALUES ('13', 'fish_manage', 'fishcategory');
INSERT INTO `django_content_type` VALUES ('14', 'fish_manage', 'fishgroup');
INSERT INTO `django_content_type` VALUES ('17', 'fish_manage', 'profile');
INSERT INTO `django_content_type` VALUES ('15', 'fish_manage', 'waterpool');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('18', 'users', 'listuserprofile');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'verifycode');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2024-11-27 13:24:51.406678');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2024-11-27 13:24:51.428935');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2024-11-27 13:24:51.504487');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2024-11-27 13:24:51.523829');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2024-11-27 13:24:51.526829');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2024-11-27 13:24:51.530834');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2024-11-27 13:24:51.534836');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2024-11-27 13:24:51.535828');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2024-11-27 13:24:51.537828');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2024-11-27 13:24:51.540866');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2024-11-27 13:24:51.542829');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2024-11-27 13:24:51.549767');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2024-11-27 13:24:51.553769');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0012_alter_user_first_name_max_length', '2024-11-27 13:24:51.556769');
INSERT INTO `django_migrations` VALUES ('15', 'users', '0001_initial', '2024-11-27 13:24:51.657815');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0001_initial', '2024-11-27 13:24:51.708398');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0002_logentry_remove_auto_add', '2024-11-27 13:24:51.713398');
INSERT INTO `django_migrations` VALUES ('18', 'admin', '0003_logentry_add_action_flag_choices', '2024-11-27 13:24:51.716407');
INSERT INTO `django_migrations` VALUES ('19', 'authtoken', '0001_initial', '2024-11-27 13:24:51.744301');
INSERT INTO `django_migrations` VALUES ('20', 'authtoken', '0002_auto_20160226_1747', '2024-11-27 13:24:51.760302');
INSERT INTO `django_migrations` VALUES ('21', 'authtoken', '0003_tokenproxy', '2024-11-27 13:24:51.762302');
INSERT INTO `django_migrations` VALUES ('22', 'authtoken', '0004_alter_tokenproxy_options', '2024-11-27 13:24:51.765303');
INSERT INTO `django_migrations` VALUES ('23', 'sessions', '0001_initial', '2024-11-27 13:24:51.778884');
INSERT INTO `django_migrations` VALUES ('24', 'fish', '0001_initial', '2024-11-30 11:50:44.721817');
INSERT INTO `django_migrations` VALUES ('25', 'fish', '0002_fishgroup_desc', '2024-11-30 13:03:28.092418');
INSERT INTO `django_migrations` VALUES ('26', 'fish_manage', '0001_initial', '2024-12-01 09:33:04.274542');
INSERT INTO `django_migrations` VALUES ('27', 'fish_manage', '0002_alter_fishgroup_species', '2024-12-01 17:03:48.867252');
INSERT INTO `django_migrations` VALUES ('28', 'fish_manage', '0003_fishgroup_videos', '2024-12-03 05:12:01.933223');
INSERT INTO `django_migrations` VALUES ('29', 'fish_manage', '0004_alter_fishgroup_water_pool', '2024-12-03 16:23:40.742911');
INSERT INTO `django_migrations` VALUES ('30', 'fish_manage', '0005_banners', '2024-12-04 05:55:37.148555');
INSERT INTO `django_migrations` VALUES ('31', 'fish_manage', '0006_profile', '2024-12-05 15:35:06.290092');
INSERT INTO `django_migrations` VALUES ('32', 'fish_manage', '0007_profile_result', '2024-12-05 16:10:51.583968');
INSERT INTO `django_migrations` VALUES ('33', 'fish_manage', '0008_alter_fishgroup_water_pool', '2024-12-06 14:22:44.901478');
INSERT INTO `django_migrations` VALUES ('34', 'users', '0002_listuserprofile', '2024-12-07 12:03:03.035738');
INSERT INTO `django_migrations` VALUES ('35', 'users', '0003_listuserprofile_add_time', '2024-12-07 12:05:01.509165');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('53syz2v7j2ndux1o5ila66kjy0441y6e', '.eJxVy8sKwjAQheF3yVoCSXN1qQ8SJpkJKaIWp6kL6bu3BRe6_c75PyJBn1vqTK80ojgLJU6_lqHc6HEMME0sD2O5jPRmee08P--X7-GvasBtT5AKqQg-Y3C1WmWiybZGUJ50NrZ41AUQgg95IDcEh2BgF_JBEygn1g2MAzVN:1tGgwM:2mpmrQtL63qqQlkpaszbZXTMBWpNb1JKzguMPdzUza4', '2024-12-12 16:00:26.379014');
INSERT INTO `django_session` VALUES ('9sgxrynery0lgr6iqzgapka3jzg0pobc', '.eJxVy8sKwjAQheF3yVoCSXN1qQ8SJpkJKaIWp6kL6bu3BRe6_c75PyJBn1vqTK80ojgLJU6_lqHc6HEMME0sD2O5jPRmee08P--X7-GvasBtT5AKqQg-Y3C1WmWiybZGUJ50NrZ41AUQgg95IDcEh2BgF_JBEygn1g2MAzVN:1tHM3A:dvIHmC3gHVIrI5kdn_IuhjmQ7WGZUHnxpmXXg8usGRM', '2024-12-14 11:54:12.515213');
INSERT INTO `django_session` VALUES ('a6e2a3gugxcd689ji5ltr5a8yts5trcj', '.eJxVy8sKwjAQheF3yVoCSXN1qQ8SJpkJKaIWp6kL6bu3BRe6_c75PyJBn1vqTK80ojgLJU6_lqHc6HEMME0sD2O5jPRmee08P--X7-GvasBtT5AKqQg-Y3C1WmWiybZGUJ50NrZ41AUQgg95IDcEh2BgF_JBEygn1g2MAzVN:1tHyrN:Y_ZO2imHXK8Q6Hv5p04eQ4dUqq6qxCfyejFgVtky8jw', '2024-12-16 05:20:37.438789');
INSERT INTO `django_session` VALUES ('ozikjcfei4rqo4a1vzlyweovlhrdgo89', '.eJxVy8sKwjAQheF3yVoCSXN1qQ8SJpkJKaIWp6kL6bu3BRe6_c75PyJBn1vqTK80ojgLJU6_lqHc6HEMME0sD2O5jPRmee08P--X7-GvasBtT5AKqQg-Y3C1WmWiybZGUJ50NrZ41AUQgg95IDcEh2BgF_JBEygn1g2MAzVN:1tGI7q:LcdIgIi_5QF3F863UaEOyFofWxdIeCsH7JlCcZjCITY', '2024-12-11 13:30:38.222454');
INSERT INTO `django_session` VALUES ('z3zhh9lnm97dj2ltm5qjw13fkroencel', '.eJxVy8sKwjAQheF3yVoCSXN1qQ8SJpkJKaIWp6kL6bu3BRe6_c75PyJBn1vqTK80ojgLJU6_lqHc6HEMME0sD2O5jPRmee08P--X7-GvasBtT5AKqQg-Y3C1WmWiybZGUJ50NrZ41AUQgg95IDcEh2BgF_JBEygn1g2MAzVN:1tIVcQ:tzqbDDA2BRgLB3Hi65CcHPWM2E1YY310VJCVotFtkK4', '2024-12-17 16:19:22.084755');
INSERT INTO `django_session` VALUES ('zqy102eqizgn0jqaefppn5gc244lb2v7', '.eJxVy8sKwjAQheF3yVoCSXN1qQ8SJpkJKaIWp6kL6bu3BRe6_c75PyJBn1vqTK80ojgLJU6_lqHc6HEMME0sD2O5jPRmee08P--X7-GvasBtT5AKqQg-Y3C1WmWiybZGUJ50NrZ41AUQgg95IDcEh2BgF_JBEygn1g2MAzVN:1tIpua:ujr20jtGH7q7uG8YWCRcC9k5kfmWvlNdP4mUwuouLe8', '2024-12-18 13:59:28.756194');

-- ----------------------------
-- Table structure for fish_manage_banners
-- ----------------------------
DROP TABLE IF EXISTS `fish_manage_banners`;
CREATE TABLE `fish_manage_banners` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image1` varchar(100) DEFAULT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `image3` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `name_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fish_manage_banners_name_id_9820d0f0_fk_fish_manage_fishgroup_id` (`name_id`),
  CONSTRAINT `fish_manage_banners_name_id_9820d0f0_fk_fish_manage_fishgroup_id` FOREIGN KEY (`name_id`) REFERENCES `fish_manage_fishgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fish_manage_banners
-- ----------------------------
INSERT INTO `fish_manage_banners` VALUES ('61', 'banners/yu/黑鳍金枪鱼/微信图片_20241204214026.jpg', 'banners/yu/黑鳍金枪鱼/微信图片_20241204214038.png', 'banners/yu/黑鳍金枪鱼/微信图片_20241204214050.jpg', '2024-12-04 15:33:51.775957', '1');
INSERT INTO `fish_manage_banners` VALUES ('62', 'banners/yu/金龙鱼/微信图片_20241204214511.jpg', 'banners/yu/金龙鱼/微信图片_20241204214522.jpg', 'banners/yu/金龙鱼/微信图片_20241204214533.jpg', '2024-12-04 15:33:51.777955', '2');
INSERT INTO `fish_manage_banners` VALUES ('63', 'banners/yu/孔雀鱼/微信图片_20241204214834.jpg', 'banners/yu/孔雀鱼/微信图片_20241204214848.jpg', 'banners/yu/孔雀鱼/微信图片_20241204214901.jpg', '2024-12-04 15:33:51.779954', '3');
INSERT INTO `fish_manage_banners` VALUES ('64', 'banners/yu/锦鲤/微信图片_20241204215218.jpg', 'banners/yu/锦鲤/微信图片_20241204215231.jpg', 'banners/yu/锦鲤/微信图片_20241204215246.jpg', '2024-12-04 15:33:51.781955', '4');
INSERT INTO `fish_manage_banners` VALUES ('65', 'banners/yu/虎头鲨/微信图片_20241204215748.jpg', 'banners/yu/虎头鲨/微信图片_20241204215759.jpg', 'banners/yu/虎头鲨/微信图片_20241204215809.jpg', '2024-12-04 15:33:51.783955', '5');
INSERT INTO `fish_manage_banners` VALUES ('66', 'banners/yu/海马/微信图片_20241204220131.jpg', 'banners/yu/海马/微信图片_20241204220144.jpg', 'banners/yu/海马/微信图片_20241204220156.jpg', '2024-12-04 15:33:51.784964', '6');
INSERT INTO `fish_manage_banners` VALUES ('67', 'banners/yu/金枪鱼/微信图片_20241204220541.jpg', 'banners/yu/金枪鱼/微信图片_20241204220552.jpg', 'banners/yu/金枪鱼/微信图片_20241204220602.jpg', '2024-12-04 15:33:51.786958', '7');
INSERT INTO `fish_manage_banners` VALUES ('68', 'banners/yu/龙鱼/微信图片_20241204220842.jpg', 'banners/yu/龙鱼/微信图片_20241204220855.jpg', 'banners/yu/龙鱼/微信图片_20241204220907.jpg', '2024-12-04 15:33:51.789910', '8');
INSERT INTO `fish_manage_banners` VALUES ('69', 'banners/yu/红鳍鱼/微信图片_20241204221258.jpg', 'banners/yu/红鳍鱼/微信图片_20241204221312.jpg', 'banners/yu/红鳍鱼/微信图片_20241204221325.jpg', '2024-12-04 15:33:51.791957', '9');
INSERT INTO `fish_manage_banners` VALUES ('70', 'banners/yu/黄鳍鱼/微信图片_20241204221720.jpg', 'banners/yu/黄鳍鱼/微信图片_20241204221731.jpg', 'banners/yu/黄鳍鱼/微信图片_20241204221742.jpg', '2024-12-04 15:33:51.793962', '10');
INSERT INTO `fish_manage_banners` VALUES ('71', 'banners/yu/月光鱼/微信图片_20241204222104.jpg', 'banners/yu/月光鱼/微信图片_20241204222116.jpg', 'banners/yu/月光鱼/微信图片_20241204222125.jpg', '2024-12-04 15:33:51.794955', '11');
INSERT INTO `fish_manage_banners` VALUES ('72', 'banners/yu/飞鱼/微信图片_20241204222353.jpg', 'banners/yu/飞鱼/微信图片_20241204222406.jpg', 'banners/yu/飞鱼/微信图片_20241204222415.jpg', '2024-12-04 15:33:51.796958', '12');
INSERT INTO `fish_manage_banners` VALUES ('73', 'banners/yu/草鱼/微信图片_20241204222651.jpg', 'banners/yu/草鱼/微信图片_20241204222659.jpg', 'banners/yu/草鱼/微信图片_20241204222708.jpg', '2024-12-04 15:33:51.799870', '13');
INSERT INTO `fish_manage_banners` VALUES ('74', 'banners/yu/红目鲢/微信图片_20241204223139.jpg', 'banners/yu/红目鲢/微信图片_20241204223153.jpg', 'banners/yu/红目鲢/微信图片_20241204223202.jpg', '2024-12-04 15:33:51.801881', '14');
INSERT INTO `fish_manage_banners` VALUES ('75', 'banners/yu/银龙鱼/微信图片_20241204223417.jpg', 'banners/yu/银龙鱼/微信图片_20241204223428.jpg', 'banners/yu/银龙鱼/微信图片_20241204223437.jpg', '2024-12-04 15:33:51.802870', '15');
INSERT INTO `fish_manage_banners` VALUES ('76', 'banners/yu/石斑鱼/微信图片_20241204223727.jpg', 'banners/yu/石斑鱼/微信图片_20241204223741.jpg', 'banners/yu/石斑鱼/微信图片_20241204223752.jpg', '2024-12-04 15:33:51.804871', '16');
INSERT INTO `fish_manage_banners` VALUES ('77', 'banners/yu/大西洋鳕鱼/微信图片_20241204224045.jpg', 'banners/yu/大西洋鳕鱼/微信图片_20241204224055.jpg', 'banners/yu/大西洋鳕鱼/微信图片_20241204224105.jpg', '2024-12-04 15:33:51.806870', '17');
INSERT INTO `fish_manage_banners` VALUES ('78', 'banners/yu/魔鬼鱼/微信图片_20241204224357.jpg', 'banners/yu/魔鬼鱼/微信图片_20241204224408.jpg', 'banners/yu/魔鬼鱼/微信图片_20241204224418.jpg', '2024-12-04 15:33:51.808871', '18');
INSERT INTO `fish_manage_banners` VALUES ('79', 'banners/yu/螳螂鱼/微信图片_20241204224834.jpg', 'banners/yu/螳螂鱼/微信图片_20241204224848.jpg', 'banners/yu/螳螂鱼/微信图片_20241204224913.jpg', '2024-12-04 15:33:51.810870', '19');
INSERT INTO `fish_manage_banners` VALUES ('80', 'banners/yu/黑石斑鱼/微信图片_20241204225130.jpg', 'banners/yu/黑石斑鱼/微信图片_20241204225143.jpg', 'banners/yu/黑石斑鱼/微信图片_20241204225154.jpg', '2024-12-04 15:33:51.812870', '20');

-- ----------------------------
-- Table structure for fish_manage_fishcategory
-- ----------------------------
DROP TABLE IF EXISTS `fish_manage_fishcategory`;
CREATE TABLE `fish_manage_fishcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fish_manage_fishcategory
-- ----------------------------
INSERT INTO `fish_manage_fishcategory` VALUES ('1', '金枪鱼科', '2024-12-01 09:50:54.216291');
INSERT INTO `fish_manage_fishcategory` VALUES ('2', '鲢科', '2024-12-01 09:50:54.217974');
INSERT INTO `fish_manage_fishcategory` VALUES ('3', '鳕科', '2024-12-01 09:50:54.219055');
INSERT INTO `fish_manage_fishcategory` VALUES ('4', '飞鱼科', '2024-12-01 09:50:54.219566');
INSERT INTO `fish_manage_fishcategory` VALUES ('5', '螳螂鱼科', '2024-12-01 09:50:54.220079');
INSERT INTO `fish_manage_fishcategory` VALUES ('6', '月光鱼科', '2024-12-01 09:50:54.220757');
INSERT INTO `fish_manage_fishcategory` VALUES ('7', '鲤科', '2024-12-01 09:50:54.221261');
INSERT INTO `fish_manage_fishcategory` VALUES ('8', '鲨科', '2024-12-01 09:50:54.222333');
INSERT INTO `fish_manage_fishcategory` VALUES ('9', '海马科', '2024-12-01 09:50:54.222852');
INSERT INTO `fish_manage_fishcategory` VALUES ('10', '孔雀鱼科', '2024-12-01 09:50:54.223366');
INSERT INTO `fish_manage_fishcategory` VALUES ('11', '石斑鱼科', '2024-12-01 09:50:54.223878');
INSERT INTO `fish_manage_fishcategory` VALUES ('12', '龙鱼科', '2024-12-01 09:50:54.223878');
INSERT INTO `fish_manage_fishcategory` VALUES ('13', '鳍鱼科', '2024-12-01 09:50:54.224388');
INSERT INTO `fish_manage_fishcategory` VALUES ('14', '魔鬼鱼科', '2024-12-01 09:50:54.225003');

-- ----------------------------
-- Table structure for fish_manage_fishgroup
-- ----------------------------
DROP TABLE IF EXISTS `fish_manage_fishgroup`;
CREATE TABLE `fish_manage_fishgroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int unsigned DEFAULT NULL,
  `gender_ratio` varchar(20) DEFAULT NULL,
  `estimated_quantity` int unsigned NOT NULL,
  `avg_weight` double DEFAULT NULL,
  `health_status` varchar(100) NOT NULL,
  `health_alert` longtext,
  `desc` longtext,
  `image` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `species_id` bigint NOT NULL,
  `water_pool_id` bigint DEFAULT NULL,
  `videos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fish_manage_fishgrou_species_id_63731abc_fk_fish_mana` (`species_id`),
  KEY `fish_manage_fishgrou_water_pool_id_b01dd7ba_fk_fish_mana` (`water_pool_id`),
  CONSTRAINT `fish_manage_fishgrou_species_id_63731abc_fk_fish_mana` FOREIGN KEY (`species_id`) REFERENCES `fish_manage_fishcategory` (`id`),
  CONSTRAINT `fish_manage_fishgrou_water_pool_id_b01dd7ba_fk_fish_mana` FOREIGN KEY (`water_pool_id`) REFERENCES `fish_manage_waterpool` (`id`),
  CONSTRAINT `fish_manage_fishgroup_chk_1` CHECK ((`age` >= 0)),
  CONSTRAINT `fish_manage_fishgroup_chk_2` CHECK ((`estimated_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fish_manage_fishgroup
-- ----------------------------
INSERT INTO `fish_manage_fishgroup` VALUES ('1', '黑鳍金枪鱼', '3', '2:1', '20', '5', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>黑鳍金枪鱼，快速强壮，深受渔民喜爱。</strong></em></span></p>', 'fish/image1.png', '<h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黑鳍金枪鱼（学名：<em>Thunnus albacares</em>）是一种大型的回游性海洋鱼类，属于金枪鱼科。它因其体型巨大、速度快和黑色的鳍而得名。黑鳍金枪鱼广泛分布于热带和亚热带海域，尤其是在大西洋、太平洋和印度洋中较为常见。由于其商业价值和运动渔业中的重要地位，它也是全球渔业捕捞的目标之一。</span></p><h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黑鳍金枪鱼体型长而流线型，适合快速游动。它的背鳍是黄色的，而腹部则是银白色的。它的鳍呈现出明显的黑色，尤其是背鳍和尾鳍。黑鳍金枪鱼的身体表面光滑，鳞片较小，适合高速游动，且其胸鳍非常宽大，能够帮助它在水中做出快速的转弯动作。这种鱼的眼睛相对较大，能够帮助其在光线较弱的深海中保持敏锐的视觉。</span></p><h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黑鳍金枪鱼是一种快速游动的掠食性鱼类，能够在大海中迅速穿行。它们以小型鱼类、鱿鱼和甲壳类为食。由于其较强的游泳能力，黑鳍金枪鱼能在温暖的海水中快速寻找猎物。它们通常生活在水深较深的地方，喜欢温暖、清澈的海域，且具有广泛的迁徙习性，每年会进行长距离的回游。</span></p><h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为海洋食物链中的顶级捕食者，黑鳍金枪鱼在其栖息地中扮演着至关重要的角色。它们控制着小型鱼类的种群，保持了生态平衡。由于它们的游速和强大的捕猎能力，它们能够有效地减少某些鱼种的过度繁殖，从而保证生态系统的健康。</span></p><h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黑鳍金枪鱼广泛分布于热带和亚热带海域，尤其是大西洋、太平洋和印度洋中。它们通常在水深较深的区域活动，喜欢水温较高的海域，尤其是在水温在21°C至29°C之间时最为活跃。黑鳍金枪鱼的栖息地通常靠近大陆架，但也可以进入开放海域。</span></p><h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黑鳍金枪鱼的繁殖季节通常发生在水温较高的季节。雌性金枪鱼每年可以释放数百万个卵，受精后的卵会孵化成幼鱼，经过一段时间的生长发育，最终变成成年金枪鱼。成年金枪鱼的寿命一般为5至7年，尽管在一些情况下，它们可以活得更长。</span></p><h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黑鳍金枪鱼因其肉质鲜美且含有丰富的蛋白质，是全球渔业中重要的经济资源之一。它们通常用于制成生鱼片、寿司以及其他海鲜菜肴。此外，金枪鱼的捕捞也是一个热门的运动项目，吸引了世界各地的渔民和运动爱好者参与。</span></p><h4 style=\"text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">由于过度捕捞，黑鳍金枪鱼的数量在一些地区已经减少。因此，全球范围内已经采取了多项措施来保护这一物种，如实施捕捞配额、加强渔业管理、限制捕捞季节等。然而，由于全球渔业需求的持续增长，黑鳍金枪鱼的保护仍然面临着巨大的挑战。</span></p><p><br/></p>', '2024-12-01 15:12:11.837754', '2024-12-04 11:47:26.357414', '1', '3', 'videos/黑鳍金枪鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('2', '金龙鱼', '2', '1:1', '12', '4.2', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>金龙鱼，优雅高贵，深受喜爱。</strong></em></span></p>', 'fish/image2.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金龙鱼（学名：<em>Scleropages formosus</em>）是一种非常受欢迎的观赏鱼，广泛分布于东南亚、澳大利亚和南美等地。由于其鳞片闪烁着金色光泽，金龙鱼常被视为吉祥物，象征着好运与财富。金龙鱼通常栖息于水流缓慢的淡水区域，是一种具有较高商业价值的观赏鱼。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金龙鱼体型细长且侧扁，背部呈现绿色或金色，而腹部通常呈银色。其最大特点是体表有闪亮的金色鳞片，尤其在光线的照射下，鳞片显得格外耀眼。金龙鱼的口大，牙齿锋利，能够帮助它捕捉水中的小型猎物。背鳍长而尖，尾鳍大而宽，有助于其灵活游动。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金龙鱼是肉食性鱼类，主要以小型鱼类、昆虫、甲壳类以及水中的小型生物为食。它们喜欢生活在水流平缓、植被丰富的环境中，这些地方提供了丰富的食物来源。金龙鱼喜欢栖息在靠近水面的位置，通常不深入水底。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为生态系统中的掠食者，金龙鱼在其栖息地内扮演着重要的角色。它们通过捕食小型鱼类和无脊椎动物，帮助控制这些物种的数量，从而维持水域的生态平衡。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金龙鱼广泛分布于东南亚的热带淡水河流、湖泊以及澳大利亚和南美的一些地区。它们通常栖息于水流缓慢、温暖的环境中，喜欢在有水草、浮木和岩石的地方活动。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金龙鱼在水温较高的季节进行繁殖，雌性会产下大量卵，而雄性则负责照顾卵。在孵化期，金龙鱼的幼鱼会通过父母的口腔保护，直到能够独立觅食为止。金龙鱼的寿命通常在10年以上，部分个体甚至可以活到20年。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金龙鱼因其美丽的外观和象征意义，广受养鱼爱好者的青睐。它们不仅在东南亚地区被视为吉祥物，在世界各地也有大量的粉丝。由于其高昂的市场价格，金龙鱼成为了高端观赏鱼市场的重要一员。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金龙鱼是受保护的物种之一，部分种群已经濒临灭绝。因此，全球各地已采取了保护措施，包括限制捕捞和开展人工繁殖。由于它们对栖息环境的特殊要求，保护金龙鱼的栖息地也是当前的一个重要议题。</span></p><p><br/></p>', '2024-12-01 15:12:11.841753', '2024-12-04 11:48:44.886019', '12', '7', 'videos/金龙鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('3', '孔雀鱼', '1', '1:2', '30', '0.05', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>孔雀鱼，色彩斑斓，生性活泼。</strong></em></span></p>', 'fish/image3.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">孔雀鱼（学名：<em>Poecilia reticulata</em>）是一种广泛分布的淡水小型鱼类，原产于南美洲，尤其是委内瑞拉和特立尼达岛。它们因体色斑斓、繁殖能力强而成为最受欢迎的观赏鱼之一。孔雀鱼是世界上最常见的观赏鱼之一，尤其适合新手养鱼爱好者。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">孔雀鱼体型小巧，通常体长不超过5厘米。它们的体色丰富多样，雄性孔雀鱼的尾鳍和背鳍呈现出鲜艳的色彩，如蓝色、红色、黄色等，雌性则相对较为朴素。雄性和雌性的尾鳍和背鳍形态有明显差异，雄性通常具有更为华丽的尾鳍。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">孔雀鱼是群居性鱼类，喜欢生活在温暖、安静的环境中。它们是一种杂食性鱼类，主要以浮游生物、藻类、小型昆虫和水生植物为食。孔雀鱼通常在水域的中上层活动，游动迅速，能够适应各种水质条件。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">孔雀鱼在其栖息地的生态系统中扮演着重要角色。作为一种小型鱼类，它们是水生食物链中的重要一环，主要为较大鱼类的猎物。同时，孔雀鱼对水中的藻类和微小生物有控制作用，帮助维持水质的清洁。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">孔雀鱼原产于南美洲的热带淡水河流和湖泊，但如今已广泛分布于全球多个地区，特别是在热带和亚热带地区。它们通常栖息在水流较缓的区域，如池塘、河流、湖泊和水道。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">孔雀鱼是卵胎生的鱼类，雌性在体内孵化幼鱼，通常一次产下数十只幼鱼。幼鱼在出生后能够独立游动和觅食，繁殖周期短，通常每两到三周即可生育一次。孔雀鱼的寿命一般为1至3年。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">孔雀鱼因其丰富的色彩和短小的体型，成为世界各地水族爱好者的首选观赏鱼。它们对水质的适应能力强，且繁殖迅速，使得它们成为了入门级水族爱好者的理想选择。此外，孔雀鱼的研究也为科学家提供了有关水生动物行为和遗传学的宝贵数据。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">尽管孔雀鱼在野外的数量较为稳定，但由于其被广泛引入其他地区作为观赏鱼，可能对当地的生态系统造成潜在威胁。因此，在某些国家，孔雀鱼被列为外来物种并加以管理，以防其入侵当地生态环境。</span></p><p><br/></p>', '2024-12-01 15:12:11.845753', '2024-12-04 11:49:58.580803', '10', '5', 'videos/孔雀鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('4', '锦鲤', '4', '1:1', '25', '3.6', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>锦鲤，象征着好运与祝福。</strong></em></span></p>', 'fish/image4.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">锦鲤（学名：<em>Cyprinus rubrofuscus</em>）是鲤科的一种淡水鱼，起源于中国，后在日本、韩国及其他地区成为了重要的观赏鱼。由于其色彩斑斓、品种多样，锦鲤在全球范围内有着广泛的喜爱群体。它们常被作为吉祥物和象征好运的存在，在东亚文化中尤其受到尊重。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">锦鲤体型较大，成年个体可长至80厘米以上，体色多样，最常见的有红、白、黑、黄、橙等颜色。它们的鳞片光滑且排列整齐，尾鳍宽大，游动优雅。锦鲤的背鳍和腹鳍也通常较长，呈现出很高的装饰性。在不同品种中，锦鲤的颜色和花纹各不相同，深受水族爱好者的青睐。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">锦鲤是一种底栖鱼类，喜欢生活在温暖的水域中。它们主要以水生植物、浮游生物、小型昆虫和有机物质为食。锦鲤具有较强的适应能力，可以在水温较低至30°C的环境中生存。它们通常生活在池塘、湖泊等水体中，尤其偏爱有丰富植被和清澈水质的环境。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">锦鲤在其栖息地的生态系统中扮演着重要的角色。作为底栖食物链的一部分，它们以水生植物和有机物质为食，有助于维持水质的平衡。由于锦鲤体型较大，它们也成为了其他大型鱼类和鸟类的食物来源。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">锦鲤原产于中国，后来引入到日本及世界各地。它们通常栖息在温暖的淡水湖泊、池塘和水库中，喜欢清澈、流动较缓的水域。锦鲤对栖息地的环境要求较高，需要有足够的空间游动和深水区域避免高温。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">锦鲤的繁殖期通常在春夏季节，它们产下大量的卵，经过较短的孵化期后，幼鱼开始独立生活。锦鲤的寿命可长达20年以上，部分个体甚至能够活到50年。在良好的环境条件下，锦鲤会长得更大，并逐渐改变颜色和花纹。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">锦鲤不仅仅是一种观赏鱼，还是东亚文化中重要的象征物。它们在日本被视为坚韧不拔和幸运的象征，是人们送礼和祈福的传统礼物。此外，锦鲤的养殖业也具有重要的经济价值，其高品质的品种在市场上售价不菲。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">锦鲤作为一种人工养殖品种，目前在野外已较为少见。虽然锦鲤本身并不濒危，但由于其广泛的养殖和引入，它们对本地生态系统的影响仍需关注。部分地区由于过度繁殖，锦鲤已成为外来物种，因此需要适当的管理和保护。</span></p><p><br/></p>', '2024-12-01 15:12:11.847753', '2024-12-04 11:51:37.725429', '7', '5', 'videos/锦鲤.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('5', '虎头鲨', '5', '1:1', '8', '150', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>虎头鲨，捕食能力强，威猛无比。</strong></em></span></p>', 'fish/image5.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨（学名：<em>Galeocerdo cuvier</em>）是一种大型的海洋鲨鱼，分布广泛，尤其在热带和亚热带海域中较为常见。因其体型庞大、食物杂食性以及身上的独特花纹，虎头鲨被视为海洋中的强大掠食者。虎头鲨被广泛研究，其强大的捕猎能力让它在海洋食物链中占据重要位置。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨体型庞大，成年虎头鲨的体长可达到4到5米。它们的身体呈流线型，有助于快速游动。虎头鲨的皮肤上有类似虎斑的图案，颜色从灰色到绿色不等，腹部通常为白色。它们的口部宽大，牙齿尖锐而强壮，能够帮助它们咬碎猎物。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨是杂食性鲨鱼，食物包括鱼类、海豚、海龟、鸟类，甚至水下垃圾和其他大型生物。由于它们的食性广泛，虎头鲨被认为是海洋中的“垃圾清道夫”。它们通常栖息在热带和亚热带海域的珊瑚礁、海岸附近及开阔海域。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨作为食物链中的顶级掠食者，控制着其他海洋生物的数量，维持生态平衡。它们通过捕食小型鱼类和海洋哺乳动物，避免某些物种过度繁殖，确保海洋生态的多样性和稳定性。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨广泛分布于热带和亚热带的海洋中，尤其在大西洋、太平洋和印度洋的珊瑚礁及沿海水域较为常见。它们更喜欢温暖的水域，通常生活在深度为30至300米的海域。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨的繁殖周期较长，孕期为12个月，通常每胎可产下10至80只幼鲨。幼鲨出生时约60厘米长。虎头鲨的寿命通常为30至50年，在其一生中，它们会经历数次繁殖周期。由于其繁殖较慢，虎头鲨的数量容易受到过度捕捞的影响。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨的鳍和牙齿在一些地方具有高经济价值，尤其是在亚洲市场，鲨鱼鳍被用作高档菜肴。尽管如此，由于过度捕捞，虎头鲨在许多地区的数量逐渐减少。近年来，全球各地已开始呼吁保护虎头鲨，减少其商业捕捞。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虎头鲨目前被列为易危物种，面临过度捕捞、栖息地破坏等威胁。全球范围内的保护措施，如禁止鲨鱼鳍贸易、加强捕捞监管等，正在得到实施，但仍需全球范围内更多的关注与努力。</span></p><p><br/></p>', '2024-12-01 15:12:11.851753', '2024-12-04 11:54:03.090405', '8', '3', 'videos/虎头鲨.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('6', '海马', '2', '1:1', '15', '0.1', '健康', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马（学名：<em>Hippocampus</em>）是一种独特的小型海洋鱼类，因其头部形态像马而得名。海马广泛分布于热带和亚热带的浅水区，特别是珊瑚礁、海草床和潮间带。它们以其独特的外形和温顺的性格，成为了水族爱好者和海洋生物学家的研究对象。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马体型小巧，体长通常在2至30厘米之间。它们的身体呈现出弯曲的形状，像一个小小的马头。海马的背鳍位于背部，侧鳍位于两侧，腹鳍位于腹部。它们的尾巴非常灵活，可以用来抓住物体。海马的皮肤上覆盖着小而坚硬的鳞片，具有很好的保护作用。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马通常栖息在浅海区，尤其是在珊瑚礁、海草床和潮间带等栖息地。它们是一种食物链较低的生物，主要以小型浮游生物、甲壳类和浮游动物为食。海马能够利用其尾巴抓住水中的植物或礁石，帮助它们保持稳定的位置。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马在生态系统中扮演着重要角色，特别是在珊瑚礁和海草床等生态系统中。它们是许多小型甲壳类、浮游生物的捕食者，有助于调节这些物种的数量，从而维护生态平衡。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马主要分布于热带和亚热带的海洋中，尤其是在珊瑚礁、海草床和潮间带等区域。它们喜欢栖息在水流较慢的环境中，通常依附于水底的植物或岩石上。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马是唯一由雄性怀孕的鱼类。雄性海马会将雌性产下的卵收容在其腹部的育儿袋中，直至幼海马孵化出来。幼海马出生时非常小，通常在几个月内就能独立生活。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马在一些地区被视为传统药材，尤其在中国，海马被认为有一定的药用价值。尽管如此，海马的生存面临着捕捞和栖息地破坏的威胁，因此许多国家已经将其列为保护物种。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">由于过度捕捞和栖息地的破坏，海马种群数量正在减少。国际保护组织呼吁加强对海马的保护，包括禁捕措施和栖息地恢复等。许多海洋保护区也开始采取措施，保护海马的栖息环境。</span></p><p><br/></p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>海马，姿态优美，品种丰富。</strong></em></span></p>', 'fish/image6.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马（学名：<em>Hippocampus</em>）是一种独特的小型海洋鱼类，因其头部形态像马而得名。海马广泛分布于热带和亚热带的浅水区，特别是珊瑚礁、海草床和潮间带。它们以其独特的外形和温顺的性格，成为了水族爱好者和海洋生物学家的研究对象。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马体型小巧，体长通常在2至30厘米之间。它们的身体呈现出弯曲的形状，像一个小小的马头。海马的背鳍位于背部，侧鳍位于两侧，腹鳍位于腹部。它们的尾巴非常灵活，可以用来抓住物体。海马的皮肤上覆盖着小而坚硬的鳞片，具有很好的保护作用。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马通常栖息在浅海区，尤其是在珊瑚礁、海草床和潮间带等栖息地。它们是一种食物链较低的生物，主要以小型浮游生物、甲壳类和浮游动物为食。海马能够利用其尾巴抓住水中的植物或礁石，帮助它们保持稳定的位置。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马在生态系统中扮演着重要角色，特别是在珊瑚礁和海草床等生态系统中。它们是许多小型甲壳类、浮游生物的捕食者，有助于调节这些物种的数量，从而维护生态平衡。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马主要分布于热带和亚热带的海洋中，尤其是在珊瑚礁、海草床和潮间带等区域。它们喜欢栖息在水流较慢的环境中，通常依附于水底的植物或岩石上。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马是唯一由雄性怀孕的鱼类。雄性海马会将雌性产下的卵收容在其腹部的育儿袋中，直至幼海马孵化出来。幼海马出生时非常小，通常在几个月内就能独立生活。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">海马在一些地区被视为传统药材，尤其在中国，海马被认为有一定的药用价值。尽管如此，海马的生存面临着捕捞和栖息地破坏的威胁，因此许多国家已经将其列为保护物种。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">由于过度捕捞和栖息地的破坏，海马种群数量正在减少。国际保护组织呼吁加强对海马的保护，包括禁捕措施和栖息地恢复等。许多海洋保护区也开始采取措施，保护海马的栖息环境。</span></p><p><br/></p>', '2024-12-01 15:12:11.853772', '2024-12-04 11:59:01.213804', '9', '7', 'videos/海马.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('7', '金枪鱼', '3', '1:1', '18', '50', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>金枪鱼，游速极快，适应能力强。</strong></em></span></p>', 'fish/image7.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金枪鱼（学名：<em>Thunnini</em>）是一类大型海洋鱼类，属于鲭科。它们分布广泛，主要生活在热带和温带海域，尤其是大西洋、太平洋和印度洋中。金枪鱼以其快速游动、强大的捕猎能力和高经济价值而著称。它们在全球渔业中占据着重要位置，并且常常出现在各类美食中。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金枪鱼体型流线型，适合高速游动。它们的体长通常在1至4米之间，最大个体可达到6米以上。金枪鱼的背部通常为蓝色或深青色，而腹部为银白色。其尾鳍呈月牙形，可以帮助它们迅速加速，游速可达到每小时75公里。金枪鱼的肌肉发达，尤其是背部的肌肉，使其能够在水中快速游动。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金枪鱼是一种高度迁徙的鱼类，能够在广阔的海域内快速游动。它们是食肉性鱼类，主要捕食小型鱼类、甲壳类和头足类等。金枪鱼通常在海洋的中层或深层水域活动，喜欢温暖的海水环境。金枪鱼的游动速度极快，能够通过高效的肌肉和鳍肢系统在水中快速游动。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为海洋中的顶级掠食者之一，金枪鱼在其栖息地内扮演着重要的角色。它们帮助控制小型鱼类和其他海洋生物的数量，从而维持生态平衡。金枪鱼对其他物种的捕食压力影响巨大，尤其是在生态系统中占据食物链较高位置的物种。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金枪鱼广泛分布在全球的热带和温带海域，尤其在大西洋、太平洋和印度洋的开放海域。它们喜欢温暖的水域，通常栖息在水深50至200米之间的海域。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金枪鱼是卵生的鱼类，雌性每年能够产下成千上万的卵。金枪鱼的幼鱼孵化后会迅速成长，并逐渐适应海洋的复杂环境。金枪鱼的生命周期较长，一般可存活10至15年，部分个体甚至能活到20年以上。由于其繁殖周期较长，金枪鱼的种群恢复速度较慢，受到过度捕捞的威胁。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">金枪鱼是世界上最重要的经济性渔业资源之一，尤其在日本、美国和地中海地区具有极高的市场价值。金枪鱼的肉质鲜美，富含蛋白质和Omega-3脂肪酸，广泛用于寿司、刺身和罐头产品中。由于其高价值，金枪鱼渔业在全球范围内都非常发达，但也因此面临着过度捕捞的问题。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">由于过度捕捞和栖息地破坏，金枪鱼种群的数量正在逐渐减少。国际渔业组织已采取措施来限制金枪鱼的捕捞量，以保护其种群的可持续性。此外，捕捞金枪鱼的渔业管理也面临着非法捕捞和环境变化等挑战。</span></p><p><br/></p>', '2024-12-01 15:12:11.857773', '2024-12-04 11:56:57.848924', '1', '3', 'videos/金枪鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('8', '龙鱼', '4', '1:1', '10', '8.4', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>龙鱼，象征祥瑞和力量。</strong></em></span></p>', 'fish/image8.png', '<h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">龙鱼（学名：<em>Osteoglossidae</em>）是一种分布在热带和亚热带地区的大型淡水鱼类，因其体型威武、鳞片闪亮、形态似龙而得名。它们在全球范围内有多个品种，其中亚洲龙鱼（<em>Scleropages formosus</em>）是最为人熟知的品种之一。龙鱼因其美丽的外形和强大的气场，被誉为“水中龙”，在水族爱好者中极为受欢迎。</span></p><h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">龙鱼体型长而扁平，通常可以长到60至90厘米，最大个体甚至可以达到1米以上。它们的身体被坚硬的鳞片覆盖，这些鳞片闪烁着金属光泽，给人一种神秘而庄重的感觉。龙鱼的头部较大，眼睛炯炯有神，嘴巴呈弯曲状，能吞食相对较大的猎物。龙鱼的鳍长而窄，尤其是胸鳍和尾鳍，能够帮助它们进行灵活的游动。</span></p><h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">龙鱼是杂食性动物，通常以小型鱼类、甲壳类、昆虫以及水生植物为食。它们是非常活跃的捕食者，喜欢在水面附近活动，利用其敏锐的视觉和快速的反应捕捉猎物。龙鱼的游动方式非常优雅且高效，能够快速在水中游动，进行长距离追逐。它们还以喷雾的方式捕捉空中的昆虫，展示出惊人的灵活性。</span></p><h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">作为大型掠食性鱼类，龙鱼在其栖息环境中通常位于食物链的上游。它们通过捕食小型鱼类和无脊椎动物，帮助控制猎物种群的数量。龙鱼的捕食行为使得生态系统得以保持平衡，避免某些物种的过度繁殖，影响水域的生态结构。</span></p><h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">龙鱼广泛分布在东南亚、南美洲和澳大利亚的淡水河流、湖泊和湿地中。亚洲龙鱼主要栖息在印度尼西亚、马来西亚、泰国等国的热带雨林中的河流和湖泊中，而南美龙鱼则分布在亚马逊河流域。它们喜欢生活在水质清澈、富含氧气的水域中，通常栖息在水流缓慢的河流和湖泊中。</span></p><h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">龙鱼的繁殖方式为外部受精，雌性会在水中产下卵，雄性则通过释放精子使卵受精。龙鱼的幼鱼会在一段时间内依赖于父母提供的保护，特别是在一些品种中，雄性会将幼鱼储存在口中进行孵化，直到它们足够强壮可以独立游泳。龙鱼的寿命较长，通常可以活到15至20年，部分个体甚至能活到30年。</span></p><h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">龙鱼因其独特的外形和神秘的气质，在全球范围内尤其是在东南亚地区具有很高的文化价值和经济价值。龙鱼是传统的风水鱼，被认为能够带来好运、财富与健康，因此在中国、香港、新加坡等地备受推崇。在水族行业中，龙鱼是贵重的观赏鱼之一，其稀有品种和优美的姿态使其成为高端市场的宠儿。</span></p><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">龙鱼在一些地区的价格非常昂贵，尤其是颜色鲜艳、鳞片完美、体型健壮的龙鱼，往往能以数千甚至上万元人民币的价格售出。近年来，龙鱼的养殖行业也日益发展，成为了水族爱好者和投资者的热门选择。</span></p><h4 style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px;\">由于其高经济价值和文化象征意义，龙鱼的非法捕捞问题较为严重，特别是亚洲龙鱼在野外的种群数量已经大幅减少，因此它们被列为濒危物种。为了保护龙鱼，许多国家已经对其捕捞和贸易实行严格限制，推动了龙鱼的人工繁殖和保护项目。</span></p><p style=\"text-align: left; text-indent: 2em;\"><span style=\"font-size: 18px;\">此外，栖息地的破坏、污染以及气候变化等因素也对龙鱼的生存造成威胁。为了确保龙鱼的长期存续，国际自然保护联盟（IUCN）将龙鱼列为濒危物种，并为其制定了相应的保护政策，包括栖息地保护、禁止非法捕捞和推动人工繁殖等措施。</span></p><p><br/></p>', '2024-12-01 15:12:11.859820', '2024-12-04 12:37:29.619028', '12', '7', 'videos/龙鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('9', '红鳍鱼', '3', '1:1', '22', '4', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>红鳍鱼，灵活且适应性强。</strong></em></span></p>', 'fish/image9.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红鳍鱼是一类淡水鱼，因其独特的红色鳍而得名。红鳍鱼通常栖息在温暖的水域，广泛分布在东南亚的河流和湖泊中。由于其鲜艳的鳍和美丽的体色，红鳍鱼在水族箱中非常受欢迎。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红鳍鱼体型小巧，体长一般在10至15厘米之间。其最显著的特征是尾鳍和背鳍的红色，尤其在成熟的个体中，红色更为鲜艳。红鳍鱼的体表通常呈现银灰色，且体态优美，游动灵活。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红鳍鱼是杂食性鱼类，主要以水生植物、浮游生物和小型无脊椎动物为食。它们喜欢生活在水流较缓的环境中，如河流、湖泊以及水草丰富的地区。红鳍鱼是群居性鱼类，常常成群结队地活动。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红鳍鱼在生态系统中主要通过控制水中小型浮游生物和藻类的数量来帮助维持水质。它们为捕食性鱼类提供了食物来源，间接支持了食物链中的其他物种。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红鳍鱼广泛分布于东南亚的热带淡水水域，尤其在泰国、马来西亚和越南的河流、池塘和水道中较为常见。它们通常栖息在水草丛生、水质清澈的区域。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红鳍鱼通常在雨季繁殖，雌性会产下大量卵，并在水中孵化。幼鱼一旦孵化出来，就开始独立觅食，迅速成长。红鳍鱼的寿命通常为3至5年。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为一种美丽的观赏鱼，红鳍鱼在水族爱好者中颇受欢迎。它们在全球的水族市场上有着稳定的需求，并且容易养殖。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红鳍鱼目前并不濒危，但由于栖息地的破坏和非法捕捞，某些种群的数量在下降。保护红鳍鱼栖息地、加强养殖和管理成为了其保护的关键。</span></p><p><br/></p>', '2024-12-01 15:12:11.862730', '2024-12-04 12:00:12.853310', '13', '7', 'videos/红鳍鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('10', '黄鳍鱼', '3', '2:1', '15', '3.2', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>黄鳍鱼，体型优雅，色彩鲜艳。</strong></em></span></p>', 'fish/image10.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黄鳍鱼（学名：<em>Thunnus albacares</em>）是一种重要的海洋鱼类，属于金枪鱼属。其特征鲜明，背鳍和尾鳍为鲜艳的黄色，因而得名。黄鳍鱼广泛分布于热带和亚热带海域，是世界上捕捞量较大的鱼类之一，经济价值高。它们以其快速游动的能力和巨大的体型，成为海洋食物链中的顶级掠食者。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黄鳍鱼的体型流线型，成年个体的体长可达到2米，重量可超过200公斤。其背部呈深蓝色或绿色，腹部为银白色，而最显著的特征就是其黄色的背鳍和尾鳍。黄鳍鱼的嘴巴大且尖锐，适合捕捉猎物。它们的游动速度非常快，是世界上游速最快的鱼类之一。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黄鳍鱼是掠食性鱼类，主要以小型鱼类、甲壳类和软体动物为食。它们常常独自或成群游弋，速度非常快，捕食时非常具有侵略性。黄鳍鱼通常栖息在深水区，但也会游至海面寻找食物。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为海洋中的顶级掠食者，黄鳍鱼在生态系统中扮演着重要角色。它们控制着其他海洋物种的种群数量，特别是小型鱼类和甲壳类。黄鳍鱼也是海洋食物链的重要环节，它们为其他大型掠食性动物提供食物。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黄鳍鱼广泛分布于全球的热带和亚热带海域，尤其在大西洋、太平洋和印度洋的开阔水域中。它们通常栖息在温暖的海域，喜欢水温较高的地方。黄鳍鱼有很强的迁徙能力，根据水温和食物来源的变化，它们会在不同的海域之间迁移。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黄鳍鱼的繁殖期通常发生在夏季，雌性每年可产下几百万颗卵。卵孵化后，幼鱼将在水中漂浮一段时间，然后开始独立生活。黄鳍鱼的寿命通常为6到7年，但有些个体能活得更长。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">黄鳍鱼是全球重要的渔业资源，尤其在日本、美国和地中海地区，黄鳍鱼是高价值的捕捞物。它们在渔业中的地位使得黄鳍鱼在全球市场上有着很高的经济价值，尤其用于制作寿司、刺身等高档料理。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">由于过度捕捞，黄鳍鱼的种群数量受到了威胁。为了解决这一问题，许多国家已开始采取捕捞配额和保护措施，避免过度捕捞对其种群产生严重影响。此外，非法捕捞和栖息地破坏也是黄鳍鱼面临的挑战。</span></p><p><br/></p>', '2024-12-01 15:12:11.865097', '2024-12-04 12:01:17.996171', '13', '7', 'videos/黄鳍鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('11', '月光鱼', '2', '1:1', '14', '2.5', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>月光鱼，体型小巧，适合家庭养殖。</strong></em></span></p>', 'fish/image11.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\"></span></h4><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">月光鱼（学名：<em>Selene setapinnis</em>）是一种海洋鱼类，因其体表反射光线的特性而得名。它们主要生活在热带和亚热带的浅海区域，具有独特的外形和优雅的游动姿势。月光鱼的体色银白，常在水中闪闪发光，给人一种神秘、浪漫的感觉。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">月光鱼体型扁平，呈现椭圆形状，最大可长至50厘米。它们的背鳍高而尖，尾鳍呈叉状，游动时非常流畅。月光鱼的体色呈现银白色，能够反射水面上的光线，这也是它们名字的由来。它们的眼睛较大，适应低光环境。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">月光鱼是一种群居性鱼类，通常成群生活。它们主要以浮游生物、小型鱼类和甲壳类为食。月光鱼具有较强的游泳能力，能够迅速穿越水中。它们通常栖息在水深较浅、温暖的海域，尤其在海洋的中上层活动。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">月光鱼主要在食物链中扮演中等捕食者的角色。它们捕食小型鱼类和浮游生物，同时也为更大型的掠食者提供食物。由于其群居的特点，月光鱼对维持生态平衡具有一定的作用。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">月光鱼分布广泛，主要生活在温暖的热带和亚热带海域。它们通常栖息在水深10至50米的地方，喜欢栖息在水质清澈且有丰富浮游生物的区域。月光鱼常常在日落时分出现在水面附近，给人一种神秘的视觉效果。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">月光鱼的繁殖期通常在春夏季节，它们会在海水中产下大量卵，幼鱼孵化后将成为小型鱼类群体的一部分。月光鱼的寿命通常为6到8年。它们的繁殖能力强，但幼鱼的生存率相对较低。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">月光鱼因其美丽的外形和特殊的生活习性，成为了水族爱好者的热门选择。然而，由于其数量较少，月光鱼在某些地区的捕捞较为有限。它们的肉质通常不被用于商业渔业捕捞，而更多的是作为观赏鱼存在。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">由于过度捕捞和栖息地的污染，月光鱼的数量在某些区域逐渐减少。尽管目前它们不被列为濒危物种，但保持栖息地的清洁和水质的稳定是保护月光鱼的关键。全球水域的保护与管理工作正在进行中，以确保月光鱼的长期生存。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\"></span><br/></h4><p><br/></p>', '2024-12-01 15:12:11.867096', '2024-12-04 12:03:02.569692', '6', '5', 'videos/月光鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('12', '飞鱼', '2', '1:1', '18', '1.8', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>飞鱼，擅长短暂飞行，身形灵活。</strong></em></span></p>', 'fish/image12.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">飞鱼（学名：<em>Exocoetidae</em>）是一种以其能在水面上跃出并滑行的能力而闻名的海洋鱼类。飞鱼在全球热带和亚热带海域广泛分布，因其出水飞行的特性，成为了海洋生物学家和自然观察者的研究对象。飞鱼通常以群体形式活动，具有独特的行为和生理特征。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">飞鱼体型中等，体长通常在20至40厘米之间。它们的体型纤细，背部呈蓝色或绿色，腹部为银白色。飞鱼最显著的特征是它们非常大的胸鳍，能像翅膀一样展开，从而帮助它们跳跃出水面并滑行一段距离。飞鱼的尾鳍叉状，能够提供强大的推进力。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">飞鱼主要生活在温暖的海域，特别是热带和亚热带海洋的表层水域。它们以小型浮游生物、甲壳类和小型鱼类为食。飞鱼常常成群活动，当遇到捕食者时，它们会迅速跃出水面，借助胸鳍滑行到远处，逃避危险。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">飞鱼作为食物链中的中层捕食者，主要通过控制浮游生物和小型鱼类的数量来维持生态平衡。同时，飞鱼也是其他大型掠食者的猎物，它们为海洋食物链中的其他物种提供了食物。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">飞鱼广泛分布于热带和亚热带的海域，尤其在大西洋、太平洋和印度洋的表层水域中较为常见。它们通常栖息在清澈、温暖的海水中，喜欢栖息在海水的表层区域。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">飞鱼的繁殖期通常发生在夏季，雌性会产下大量卵，雄性负责受精。幼鱼孵化后会迅速成长，并开始学习如何滑行。飞鱼的寿命一般为3到5年，但某些个体能活到8年。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">飞鱼在某些地区被捕捞用于食用，其肉质鲜美，具有一定的经济价值。由于飞鱼出水飞行的特殊行为，它们也成为了旅游业和生态旅游中的一个亮点。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">尽管飞鱼在全球范围内并不被认为是濒危物种，但栖息地的污染和捕捞压力可能会对其种群产生一定影响。加强海洋生态环境保护和减少污染是保护飞鱼的重要举措。</span></p><p><br/></p>', '2024-12-01 15:12:11.870097', '2024-12-04 12:04:08.362973', '4', '5', 'videos/飞鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('13', '草鱼', '4', '1:1', '20', '3.5', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>草鱼，生长迅速，适应性强。</strong></em></span></p>', 'fish/image13.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">草鱼（学名：<em>Ctenopharyngodon idella</em>）是一种淡水鱼，属于鲤形目，原产于中国。由于其食性主要以水生植物为主，因此也被称为“水草鱼”。草鱼在中国及其他亚洲国家的水域中广泛分布，并因其快速生长、适应性强和经济价值高而成为水产养殖业的重要物种。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">草鱼体型长而流线型，成年个体体长可达1米，体重超过10公斤。其背鳍和尾鳍较长，体色为银灰色，呈现出一种较为简洁的外形。草鱼的鳞片较大，呈现出光滑的质感，背部和头部略微弯曲。草鱼的嘴巴较宽，适合捕食水中的植物。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">草鱼是杂食性鱼类，但其主要食物来源是水生植物，如水草、藻类等。它们通常栖息在水流缓慢、植被丰富的淡水环境中，喜欢在水深1-3米的地方活动。草鱼能够以非常高的速度游动，并且常常与其他草鱼成群活动，具有较强的群体意识。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">草鱼在生态系统中扮演着重要角色。它们通过大量食用水生植物，帮助控制水域中的植物生长，避免水体过度富营养化。草鱼通过其食物链中的作用，帮助保持水质清洁，防止水草过多生长导致水域生态失衡。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">草鱼广泛分布于中国及其他亚洲国家的淡水水域，尤其在湖泊、河流、池塘和水库等水体中较为常见。它们适应性强，能够在各种水环境中生存，从温暖的低温水域到较冷的水域都可以见到草鱼的身影。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">草鱼的繁殖期通常发生在春夏季节，当水温升高时，它们会进入较为浅水的区域产卵。草鱼的卵孵化时间短，幼鱼迅速成长。草鱼通常可以在2至3年内达到可捕捞的大小，寿命一般为6到8年。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">草鱼是中国以及其他亚洲地区重要的经济鱼类，广泛应用于水产养殖业。草鱼因其快速生长、肉质鲜美，成为人们餐桌上的常见鱼类。草鱼在亚洲料理中尤为常见，常用于清蒸、红烧等烹饪方式。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">尽管草鱼在自然界的数量尚未面临过度捕捞的威胁，但过度养殖可能会带来水体生态的失衡，影响其生长环境。因此，合理的养殖管理和水质保护是保持草鱼种群稳定和水域生态平衡的重要因素。</span></p><p><br/></p>', '2024-12-01 15:12:11.872603', '2024-12-04 12:05:04.640534', '7', '5', 'videos/草鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('14', '红目鲢', '2', '1:1', '22', '1.6', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>红目鲢，眼睛呈红色，体型优美。</strong></em></span></p>', 'fish/image14.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢（学名：<em>Hypophthalmichthys molitrix</em>），又名大鲢鱼，是一种广泛分布于亚洲水域的淡水鱼。红目鲢是中国重要的水产养殖鱼类之一，尤其在长江流域及其他江河湖泊中较为常见。红目鲢以其食性杂、体型大、繁殖力强而著称。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢体型庞大，成年个体体长可达到1.5米，体重可超过30公斤。其体形呈流线型，背部颜色较深，腹部较浅，呈银灰色。红目鲢的眼睛大且呈红色，这是其名称的由来。它们的嘴巴较宽，适合吞食水中的浮游生物和植物。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢是一种杂食性鱼类，主要以浮游生物、小型无脊椎动物和水草为食。它们常栖息在流速较慢的水域，如湖泊、水库和河流的缓慢水域。红目鲢适应能力强，能够在不同的水环境中生存，并且具有较强的繁殖能力。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢在水体中扮演着重要的生态角色。作为浮游生物的食者，红目鲢帮助保持水域中浮游生物的平衡，避免过度繁殖。它们也通过吃植物性物质，帮助控制水草生长，维护水体的生态平衡。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢原产于中国，现已被引入其他亚洲国家以及部分欧洲国家。它们通常栖息在温暖的淡水环境中，尤其在水质较为清澈、水流较慢的河流、湖泊和水库中。红目鲢适应性强，能够在不同类型的淡水环境中生存。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢的繁殖期通常发生在春夏季节，当水温升高时，它们会进入浅水区域进行产卵。雌性红目鲢每年可以产下数百万颗卵，幼鱼孵化后迅速成长。红目鲢的寿命通常为6到8年，但有些个体可以活得更长。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢是中国水产养殖业的重要物种，肉质鲜美，含有丰富的蛋白质和脂肪，广泛用于烹饪。红目鲢在中国传统菜肴中占有一席之地，尤其在清蒸和红烧等菜式中非常受欢迎。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">红目鲢的种群数量目前没有受到过度捕捞的威胁，但由于其主要用于水产养殖，水质污染和养殖密度过高可能对其生长环境造成负面影响。管理不当的养殖行为可能导致其生态功能的下降，因此需要采取科学的管理方法和水域保护措施。</span></p><p><br/></p>', '2024-12-01 15:12:11.875604', '2024-12-04 12:06:27.677371', '2', '5', 'videos/红目鲢.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('15', '银龙鱼', '3', '1:1', '10', '4.5', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>银龙鱼，光亮的鳞片，优雅的身姿。</strong></em></span></p>', 'fish/image15.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">银龙鱼（学名：<em>Osteoglossum bicirrhosum</em>）是一种美丽的热带淡水鱼，属于硬骨鱼目。银龙鱼因其长形的体型、光滑的银色鳞片以及优雅的游动姿态而受到水族爱好者的青睐。银龙鱼原产于南美洲的亚马逊河流域，被认为是吉祥物，在亚洲文化中享有盛誉。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">银龙鱼体型细长，最大可达到1米长。其背部呈现银白色，鳞片光滑，能够在水中反射出明亮的光芒，尤其在阳光下显得更加璀璨。银龙鱼的头部较大，嘴巴尖锐，适合捕捉小型鱼类和昆虫。它们的鳍较长，尾鳍呈叉形，游动时非常优雅。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">银龙鱼主要是食肉性鱼类，以小型鱼类、昆虫和其他水生生物为食。它们通常栖息在水流缓慢的区域，尤其是森林的湿地、沼泽和河流中。银龙鱼对水质要求较高，适合生活在清澈、温暖的淡水环境中。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为食肉性鱼类，银龙鱼在生态系统中扮演着重要角色。它们捕食水中的小型鱼类和昆虫，帮助控制这些物种的数量，维持生态平衡。银龙鱼的存在为更大型的掠食者提供了食物来源，也是亚马逊生态系统中不可或缺的一部分。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">银龙鱼原产于南美洲的亚马逊河流域及其支流。它们栖息在河流和湿地的水域，尤其是在水流较缓的区域。银龙鱼喜欢栖息在水温较高、清澈的水体中，通常在水深1到3米的地方活动。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">银龙鱼的繁殖期通常在雨季，雌性银龙鱼会在水中产下大量卵，雄性则负责孵化。银龙鱼的幼鱼孵化后，将在父母的保护下成长，直到它们能够独立生活。银龙鱼的寿命通常为10到15年。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">银龙鱼因其美丽的外形和特殊的习性，成为了许多水族爱好者追捧的物种。它们的存在被认为是吉祥的象征，尤其在亚洲文化中，银龙鱼常被用作装饰和招财的象征。银龙鱼的市场价值较高，特别是在亚洲国家，它们常作为水族箱中的主角。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">虽然银龙鱼在自然界中的数量并没有达到濒危水平，但由于过度捕捞和栖息地的破坏，银龙鱼的种群面临一定的威胁。为保护这一美丽物种，许多国家已经采取了保护措施，限制捕捞和栖息地的破坏。</span></p><p><br/></p>', '2024-12-01 15:12:11.879603', '2024-12-04 12:09:29.546805', '12', '7', 'videos/银龙鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('16', '石斑鱼', '6', '1:1', '8', '30', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>石斑鱼，肉质鲜美，商业价值高。</strong></em></span></p>', 'fish/image16.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\"></span></h4><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼（学名：<em>Epinephelinae</em>）是一类广泛分布在热带和亚热带海洋的鱼类，属于鲈形目。石斑鱼因其肉质鲜美、肉厚且富有弹性而广受欢迎，成为海鲜市场中的热门品种。石斑鱼的种类繁多，体型从小型到大型不等，广泛分布于珊瑚礁、岩石底部以及海洋的其他生态环境中。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼的体型通常较大，具有宽大的头部和坚固的身体。它们的背鳍高且明显，尾鳍呈圆形或叉形。石斑鱼的体色通常为绿色、灰色、棕色或黄褐色，身上常带有不规则的斑点或条纹，能够帮助它们在岩石或珊瑚礁中伪装。石斑鱼的口大而有力，适合捕捉和吞噬其他鱼类。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼是典型的掠食性鱼类，主要以小型鱼类、甲壳类和软体动物为食。它们通常栖息在海洋中的岩礁或珊瑚礁附近，依靠自己的伪装能力和强大的捕猎技巧来捕捉猎物。石斑鱼常常利用周围环境的隐蔽性，悄无声息地接近猎物，并迅速发起攻击。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼在海洋生态系统中扮演着重要的角色。作为顶级捕食者之一，石斑鱼帮助控制其他鱼类和无脊椎动物的数量，维护生态平衡。它们通过捕食小型物种，防止某些物种的过度繁殖，从而保持生态系统的稳定。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼主要分布在热带和亚热带的海域，尤其是在珊瑚礁和岩石底部区域。它们喜欢栖息在水深较浅、珊瑚丰富的海域，并在此处寻找食物。石斑鱼通常活动于水深30米至100米的区域，但有些品种也可以在更深的水域中发现。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼的繁殖期通常发生在春夏季节，雄性和雌性通过求偶行为相互吸引，并在特定的地点产卵。石斑鱼的卵孵化后，幼鱼将在岩礁或珊瑚礁附近的安全区域生长。石斑鱼的寿命通常为10至15年，部分个体能够达到20年以上。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼因其肉质鲜美且营养丰富，成为全球海鲜市场上的重要商品。石斑鱼的肉质紧实、味道鲜美，因此在高档餐厅和市场中极为受欢迎。此外，石斑鱼在一些文化中被认为是吉祥和财富的象征。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">石斑鱼因其市场价值高而面临过度捕捞的威胁。为了保护这一物种，许多国家已采取限制捕捞、设立保护区等措施。过度捕捞和栖息地的破坏对石斑鱼的种群造成了压力，因此保护其自然栖息地和采取可持续捕捞方法显得尤为重要。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\"></span><br/></h4><p><br/></p>', '2024-12-01 15:12:11.882604', '2024-12-04 12:12:12.143662', '11', '7', 'videos/石斑鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('17', '大西洋鳕鱼', '7', '1:1', '10', '20', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>大西洋鳕鱼，肉质细腻，经济价值高。</strong></em></span></p>', 'fish/image17.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">大西洋鳕鱼（学名：<em>Gadus morhua</em>）是一种生活在北大西洋的海洋鱼类，属于鳕形目。大西洋鳕鱼因其经济价值高、肉质鲜美而成为全球重要的渔业资源之一。它广泛分布在欧洲、北美洲及其他寒冷海域，是海鲜市场中常见的鱼类之一。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">大西洋鳕鱼体型较大，最大可达1.8米，体重大约可达100公斤。其身体呈长条状，背部呈绿色或棕色，腹部为白色，身上具有一定数量的斑点。鳕鱼的背鳍较长，尾鳍呈叉形，嘴巴宽大，适合捕捉其他鱼类和海洋生物。大西洋鳕鱼的鳞片较小，皮肤光滑。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">大西洋鳕鱼是底栖性鱼类，通常栖息在海底，尤其是在海底的沙质或泥质区域。它们以其他鱼类、小型甲壳类、软体动物等为食，并以其强大的游动能力在水中快速捕猎。大西洋鳕鱼常常聚集在水深较大的区域，尤其是在深海的寒冷水域中。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为海洋食物链中的重要捕食者，大西洋鳕鱼帮助调节其他鱼类和海洋生物的种群数量。它们的捕食行为确保了生态平衡的维持，防止了某些物种的过度繁殖。大西洋鳕鱼对海洋生态系统的健康至关重要。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">大西洋鳕鱼主要分布在北大西洋的寒冷海域，尤其在挪威、冰岛、加拿大和美国的沿海水域中较为常见。它们喜欢栖息在水深50至200米的海域，通常在温度较低的水域活动。大西洋鳕鱼通常栖息在泥沙底质的海底，并在此地觅食和繁殖。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">大西洋鳕鱼的繁殖期通常发生在冬季和春季，它们会向较浅的水域迁移进行产卵。每年，雌性鳕鱼会产下数百万颗卵，孵化后的幼鱼会在深海中生长。大西洋鳕鱼的寿命通常为10到15年，某些个体可以存活更久。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">大西洋鳕鱼在全球渔业中占据重要地位，尤其是在欧洲和北美地区。其肉质白嫩、口感鲜美，是重要的海鲜商品。大西洋鳕鱼还广泛应用于传统的鱼和薯条（fish and chips）餐饮文化中，成为英美等地的标志性食物之一。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">由于大西洋鳕鱼的高经济价值，它们遭遇了过度捕捞的问题，种群数量一度大幅下降。为了保护这一物种，许多国家已经实施了捕捞配额限制、禁渔期等措施。此外，栖息地的污染和气候变化也是大西洋鳕鱼面临的挑战。</span></p><p><br/></p>', '2024-12-01 15:12:11.884603', '2024-12-04 12:13:15.148681', '3', '3', 'videos/大西洋鳕鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('18', '魔鬼鱼', '6', '1:1', '5', '45', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>魔鬼鱼，体型庞大，神秘莫测。</strong></em></span></p>', 'fish/image18.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">魔鬼鱼（学名：<em>Manta birostris</em>）是世界上最大的鳐类之一，属于软骨鱼纲。它们因体型巨大、游动优雅和头部的特殊结构而成为海洋中的明星。魔鬼鱼通常栖息在热带和亚热带海域，广泛分布于全球的温暖水域中。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">魔鬼鱼的身体呈扁平状，宽大的胸鳍使它们的外形像一只巨大的“魔鬼翅膀”。它们的头部具有独特的“角状”突起，俗称“魔鬼头”。魔鬼鱼的体长可达7米，体重超过2吨。它们的尾巴长而细，尾端没有刺。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">魔鬼鱼是温和的滤食性动物，主要以浮游生物、甲壳类和小型鱼类为食。它们通过张开大口，将海水吸入并过滤出其中的食物。魔鬼鱼通常在海洋的较深水域活动，并在近海的珊瑚礁和富营养的水域觅食。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为海洋中的滤食性动物，魔鬼鱼在生态系统中帮助控制浮游生物的数量。它们通过食物链中的作用，确保海洋生态系统的稳定，并防止浮游生物过度繁殖，从而维持水体的健康。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">魔鬼鱼分布广泛，主要栖息在热带和亚热带的温暖海域，尤其在珊瑚礁和大陆架附近的水域中较为常见。它们适应性强，能够在不同的水域深度中活动，从海面到水深30米的地方都有它们的身影。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">魔鬼鱼的繁殖方式为胎生，雌性通常每两年产一次。魔鬼鱼的幼鱼在母体内孵化，然后通过胎盘获得养分，最终在海中出生。魔鬼鱼的寿命较长，通常可活到20年以上。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">魔鬼鱼因其独特的外形和优雅的游动方式，成为了深海探险和水族爱好者的兴趣焦点。它们也在一些地方成为了海洋保护的象征，许多旅游公司提供与魔鬼鱼共游的项目。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">魔鬼鱼由于其体型巨大、生命周期长且繁殖缓慢，容易受到过度捕捞的威胁。此外，栖息地的破坏和污染也对魔鬼鱼的种群造成了影响。为了保护这一物种，许多国家已经采取了保护措施，限制捕捞并实施海洋保护区政策。</span></p><p><br/></p>', '2024-12-01 15:12:11.888614', '2024-12-04 12:32:03.379288', '14', '7', 'videos/魔鬼鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('19', '螳螂鱼', '4', '1:1', '8', '6.5', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>螳螂鱼，捕猎技巧高，行动迅速。</strong></em></span></p>', 'fish/image19.png', '<h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">基本介绍</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">螳螂鱼（学名：<em>Stomatopoda</em>）是一类生活在热带海域的甲壳类动物，因其独特的捕猎方式和形态特征而闻名。螳螂鱼的体型较小，通常只有10厘米至30厘米长，但它们是海洋中最强大的掠食者之一。螳螂鱼的名字源自于它们的前肢形状，像极了螳螂的前臂。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">形态特征</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">螳螂鱼体型较小，但它们的前肢具有强大的攻击力，能够以极高的速度进行“打击”。这些前肢像锤子一样，可以快速击打猎物，产生强烈的冲击力。螳螂鱼的身体通常呈绿色、蓝色、橙色或红色，它们的复眼具有极强的视觉感知能力，可以感知紫外线和偏振光。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生活习性</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">螳螂鱼是肉食性动物，主要以小型鱼类、甲壳类和软体动物为食。它们通常栖息在海底的岩石缝隙或珊瑚礁中，使用强大的前肢来捕捉和打击猎物。螳螂鱼的攻击速度非常快，甚至能够打破坚硬的甲壳和玻璃。它们是非常高效的猎手，能够以惊人的速度进行打击。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">生态角色</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">作为顶级捕食者之一，螳螂鱼在生态系统中扮演着重要角色。它们帮助控制小型动物的种群数量，维持食物链的平衡。螳螂鱼的捕食行为确保了某些物种的数量不至于过度膨胀，从而保持生态系统的稳定性。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">分布与栖息地</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">螳螂鱼广泛分布在热带和亚热带海域，尤其在珊瑚礁、岩石底部和沙质海底区域中较为常见。它们喜好栖息在水深较浅的海域，通常藏身于岩石缝隙或自掘的巢穴中。螳螂鱼对栖息环境有很高的要求，通常选择透明的海水和丰富的生物多样性的地区。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">繁殖与生命周期</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">螳螂鱼的繁殖方式为外部受精，雌性会将卵产在海底的隐蔽处，然后雄性会释放精子进行受精。螳螂鱼的幼体经过数周的发育后孵化成小型螳螂鱼，随即开始独立生活。螳螂鱼的寿命通常为6至7年。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">经济与文化价值</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">螳螂鱼的市场价值相对较低，但因其独特的外形和惊人的攻击力，成为了生物学研究中的热门对象。它们的强大前肢和捕猎能力引起了很多科学家和工程师的关注，尤其在模仿自然界机制的机器人研究中，螳螂鱼成为了启发设计的对象。</span></p><h4 style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 18px;\">保护与挑战</span></h4><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px;\">螳螂鱼的种群数量目前并未面临严重的威胁，但过度捕捞和栖息地的破坏可能对它们造成一定影响。保护螳螂鱼的栖息地、避免过度捕捞以及减少海洋污染是保护这一物种的关键措施。</span></p><p><br/></p>', '2024-12-01 15:12:11.891603', '2024-12-04 12:33:09.051396', '5', '7', 'videos/螳螂鱼.mp4');
INSERT INTO `fish_manage_fishgroup` VALUES ('20', '黑石斑鱼', '5', '1:1', '12', '25', '健康', '<p>无预警</p>', '<p><span style=\"text-decoration: underline; color: rgb(0, 32, 96);\"><em><strong>黑石斑鱼，外表坚硬，耐受性强。</strong></em></span></p>', 'fish/image20.png', '<h4 style=\"text-align: center; text-indent: 2em;\">基本介绍</h4><p style=\"text-align: left; text-indent: 2em;\">黑石斑鱼（学名：<em>Mycteroperca bonaci</em>）是一种生活在加勒比海和美国东南沿海的海洋鱼类，属于鲈形目。它们因体型庞大、肉质鲜美而受到渔民和餐饮行业的青睐。黑石斑鱼广泛栖息在珊瑚礁和岩礁区域，是顶级掠食者之一。</p><h4 style=\"text-align: center; text-indent: 2em;\">形态特征</h4><p style=\"text-align: left; text-indent: 2em;\">黑石斑鱼体型巨大，成年个体的体长通常可达到1.5米，体重大约为50公斤。它们的身体呈椭圆形，背部为灰黑色或绿色，腹部较浅，呈银白色或黄色。黑石斑鱼的背鳍较长，尾鳍呈圆形，体表无鳞，皮肤光滑。</p><h4 style=\"text-align: center; text-indent: 2em;\">生活习性</h4><p style=\"text-align: left; text-indent: 2em;\">黑石斑鱼是典型的掠食性鱼类，主要以其他鱼类、甲壳类和软体动物为食。它们喜欢栖息在珊瑚礁或岩礁附近，依靠强大的捕猎能力捕捉猎物。黑石斑鱼的游泳速度较慢，但它们能在捕食时快速发动突袭，迅速击中猎物。</p><h4 style=\"text-align: center; text-indent: 2em;\">生态角色</h4><p style=\"text-align: left; text-indent: 2em;\">作为海洋食物链中的顶级捕食者，黑石斑鱼在维持生态平衡中扮演着重要角色。它们帮助控制其他鱼类和无脊椎动物的数量，避免某些物种的过度繁殖。黑石斑鱼在珊瑚礁和岩礁生态系统中起到了重要的生态调节作用。</p><h4 style=\"text-align: center; text-indent: 2em;\">分布与栖息地</h4><p style=\"text-align: left; text-indent: 2em;\">黑石斑鱼主要分布在加勒比海、墨西哥湾和美国东南沿海的热带海域。它们通常栖息在珊瑚礁、岩礁和沙底的海域，通常活动水深为30米至100米的范围。黑石斑鱼对栖息地的要求较高，尤其喜欢水质清澈、营养丰富的区域。</p><h4 style=\"text-align: center; text-indent: 2em;\">繁殖与生命周期</h4><p style=\"text-align: left; text-indent: 2em;\">黑石斑鱼的繁殖期通常在春季和夏季，雄性会通过声波和求偶行为吸引雌性。繁殖后的雌性会产卵，卵孵化后的幼鱼会在珊瑚礁和岩礁附近成长。黑石斑鱼的寿命通常为20年左右。</p><h4 style=\"text-align: center; text-indent: 2em;\">经济与文化价值</h4><p style=\"text-align: left; text-indent: 2em;\">黑石斑鱼的肉质鲜美，且脂肪含量低，因而成为了高档餐饮市场的珍贵食材。它们在加勒比地区和美国东南部的海鲜市场上占有重要地位。同时，黑石斑鱼也是商业捕鱼的重要目标之一。</p><h4 style=\"text-align: center; text-indent: 2em;\">保护与挑战</h4><p style=\"text-align: left; text-indent: 2em;\">黑石斑鱼由于过度捕捞和栖息地破坏，面临着一定的威胁。为了保护这一物种，许多地区已经采取了渔业管理措施，限制捕捞量和捕捞季节。此外，保护珊瑚礁和岩礁生态系统也是确保黑石斑鱼种群稳定的关键。</p><p><br/></p>', '2024-12-01 15:12:11.894612', '2024-12-04 12:34:03.143652', '11', '7', 'videos/黑石斑鱼.mp4');

-- ----------------------------
-- Table structure for fish_manage_profile
-- ----------------------------
DROP TABLE IF EXISTS `fish_manage_profile`;
CREATE TABLE `fish_manage_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `result` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fish_manage_profile_user_id_4af635c1_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `fish_manage_profile_user_id_4af635c1_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fish_manage_profile
-- ----------------------------
INSERT INTO `fish_manage_profile` VALUES ('8', 'avatars/微信图片_20241204224105_qQoRRqr.jpg', '2024-12-05 16:15:32.025662', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('9', 'avatars/微信图片_20241204224105_59oK04H.jpg', '2024-12-05 16:15:37.910869', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('10', 'avatars/图灵1.jpg', '2024-12-05 16:15:46.912256', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('11', 'avatars/微信图片_20240924230252.jpg', '2024-12-06 05:17:26.794281', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('12', 'avatars/图灵1_YR2gHOY.jpg', '2024-12-06 05:22:03.478170', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('13', 'avatars/微信图片_20241204224045_Q1YQEdG.jpg', '2024-12-06 05:22:14.884913', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('14', 'avatars/微信图片_20241204224105_XKYXVqK.jpg', '2024-12-06 05:22:23.508590', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('15', 'avatars/微信图片_20241204224105_2HCPrK8.jpg', '2024-12-06 05:30:58.511772', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('16', 'avatars/微信图片_20241204224105_ARUMEwn.jpg', '2024-12-06 05:37:00.370751', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('17', 'avatars/微信图片_20241204224105_nYkNyqm.jpg', '2024-12-06 05:58:34.522608', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('18', 'avatars/微信图片_20241204224105_1pf3m1A.jpg', '2024-12-06 07:01:31.145644', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('19', 'avatars/微信图片_20241204224105_xbb3ksE.jpg', '2024-12-06 07:12:51.954811', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('20', 'avatars/微信图片_20241204224105_XV8xSll.jpg', '2024-12-06 07:12:57.164140', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('21', 'avatars/微信图片_20241204224105_4HoskXY.jpg', '2024-12-06 07:15:14.799370', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('22', 'avatars/微信图片_20241204224055_bWHZXys.jpg', '2024-12-06 07:17:22.909390', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('23', 'avatars/微信图片_20241204224105_iOOpJfK.jpg', '2024-12-06 07:25:48.579106', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('24', 'avatars/微信图片_20241204224105_fYPNQcK.jpg', '2024-12-06 07:28:04.587843', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('25', 'avatars/微信图片_20241204224105_PzZ4d8d.jpg', '2024-12-06 07:35:48.434538', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('26', 'avatars/微信图片_20241204224105_cgYVPRB.jpg', '2024-12-06 07:36:01.314716', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('27', 'avatars/微信图片_20240924230252_19LOnwT.jpg', '2024-12-06 07:36:23.783460', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('28', 'avatars/微信图片_20241204214533.jpg', '2024-12-06 07:37:47.382696', '1', '金龙鱼');
INSERT INTO `fish_manage_profile` VALUES ('29', 'avatars/微信图片_20241204224055_5ozEKa9.jpg', '2024-12-06 07:40:18.688629', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('30', 'avatars/微信图片_20241204214511.jpg', '2024-12-06 07:41:27.022838', '1', '金龙鱼');
INSERT INTO `fish_manage_profile` VALUES ('31', 'avatars/微信图片_20241204224045_H4GOASq.jpg', '2024-12-06 07:41:38.129069', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('32', 'avatars/微信图片_20241204222406.jpg', '2024-12-06 07:41:53.510875', '1', '飞鱼');
INSERT INTO `fish_manage_profile` VALUES ('33', 'avatars/微信图片_20241204220144.jpg', '2024-12-06 07:42:22.145324', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('34', 'avatars/微信图片_20241204220131.jpg', '2024-12-06 07:42:27.251165', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('35', 'avatars/微信图片_20241204215748.jpg', '2024-12-06 07:43:13.345642', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('36', 'avatars/微信图片_20241204223202.jpg', '2024-12-06 07:44:00.676055', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('37', 'avatars/微信图片_20241204223202_RDUDT60.jpg', '2024-12-06 07:44:18.264468', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('38', 'avatars/微信图片_20241204214834.jpg', '2024-12-06 07:44:36.149053', '1', '孔雀鱼');
INSERT INTO `fish_manage_profile` VALUES ('39', 'avatars/微信图片_20241204214901.jpg', '2024-12-06 07:46:42.739505', '1', '孔雀鱼');
INSERT INTO `fish_manage_profile` VALUES ('40', 'avatars/微信图片_20241204220131_xYgeoRR.jpg', '2024-12-06 07:47:00.321156', '1', '海马');
INSERT INTO `fish_manage_profile` VALUES ('41', 'avatars/test.jpg', '2024-12-06 07:48:12.224764', '1', '未识别');
INSERT INTO `fish_manage_profile` VALUES ('42', 'avatars/TES.jpg', '2024-12-06 07:48:46.737500', '1', '银龙鱼');
INSERT INTO `fish_manage_profile` VALUES ('43', 'avatars/WQ.jpg', '2024-12-06 07:49:23.886362', '1', '金龙鱼');
INSERT INTO `fish_manage_profile` VALUES ('44', 'avatars/微信图片_20241204224045_t7BbQba.jpg', '2024-12-06 07:56:59.163131', '1', '大西洋鳕鱼');
INSERT INTO `fish_manage_profile` VALUES ('45', 'avatars/微信图片_20241204222353_gsErOPL.jpg', '2024-12-06 07:57:24.393017', '1', '飞鱼');
INSERT INTO `fish_manage_profile` VALUES ('46', 'avatars/微信图片_20241204222415.jpg', '2024-12-06 07:58:04.862648', '1', '飞鱼');
INSERT INTO `fish_manage_profile` VALUES ('47', 'avatars/微信图片_20241204222415_Wl5M4zv.jpg', '2024-12-06 07:58:39.787926', '1', '飞鱼');
INSERT INTO `fish_manage_profile` VALUES ('48', 'avatars/微信图片_20241204222415_eD32PUm.jpg', '2024-12-07 08:08:51.430148', '1', '飞鱼');
INSERT INTO `fish_manage_profile` VALUES ('49', 'avatars/微信图片_20241204222406_KVGTWDf.jpg', '2024-12-07 10:40:12.572411', '1', '飞鱼');

-- ----------------------------
-- Table structure for fish_manage_waterpool
-- ----------------------------
DROP TABLE IF EXISTS `fish_manage_waterpool`;
CREATE TABLE `fish_manage_waterpool` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(200) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  `capacity` double DEFAULT NULL,
  `water_temperature` double DEFAULT NULL,
  `water_ph` double DEFAULT NULL,
  `oxygen_level` double DEFAULT NULL,
  `ammonia_level` double DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fish_manage_waterpool
-- ----------------------------
INSERT INTO `fish_manage_waterpool` VALUES ('3', '水池C', '区域C', '600', '6', '3600', '22', '7.8', '9', '0.05', '2024-12-01 09:46:06.895759', '2024-12-01 09:46:06.895759');
INSERT INTO `fish_manage_waterpool` VALUES ('5', '水池B', '区域B', '450', '4.5', '2025', '24', '7.5', '7.5', '0.08', '2024-12-01 09:46:33.457051', '2024-12-01 09:46:33.457051');
INSERT INTO `fish_manage_waterpool` VALUES ('7', '水池A', '区域A', '500', '5', '2500', '28', '7.2', '8', '0.1', '2024-12-01 09:47:02.847239', '2024-12-01 09:47:02.847239');

-- ----------------------------
-- Table structure for users_listuserprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_listuserprofile`;
CREATE TABLE `users_listuserprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `desc` varchar(200) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_listuserprofile_user_id_8a9d4432_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `users_listuserprofile_user_id_8a9d4432_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users_listuserprofile
-- ----------------------------
INSERT INTO `users_listuserprofile` VALUES ('1', '直至世界尽头的旅行', '16', '2024-12-07 20:48:37.000000');
INSERT INTO `users_listuserprofile` VALUES ('2', '这个人很懒，什么都没写...', '12', '2024-12-07 20:53:17.000000');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$870000$rM3OWdC6GVI4jl2eu8xCma$BWEaB9yVcc4kZVt4hspp5cK8wyqNizUGWs7G+Xz6cb0=', '2024-12-04 13:59:28.755192', '1', 'root', '', '', '1', '1', '2024-11-27 13:26:30.000000', null, null, 'female', '18013268015', '2@2');
INSERT INTO `users_userprofile` VALUES ('11', 'pbkdf2_sha256$870000$xghLoGrE5Y80sH5aFS5Q5q$jJ+Ai/dhTPg42Zfs3tu7eIobXW9nrRbCrVEiZWOQRUs=', null, '0', 'DANZAI', '', '', '0', '1', '2024-11-29 11:11:46.000000', 'AWE', null, 'female', '18872026056', '');
INSERT INTO `users_userprofile` VALUES ('12', 'pbkdf2_sha256$870000$EtBinnWHe2UVpfG0alomHq$rQzRYrlVKUFOet0hvcZtyLkTbvibuPD3oduHwBw9A9I=', null, '0', 'zhangqiwei', 'ARE', 'AW', '0', '1', '2024-11-29 11:17:33.000000', 'ARES', null, 'female', '17881529682', '');
INSERT INTO `users_userprofile` VALUES ('16', 'pbkdf2_sha256$870000$si6BVgkvv7lVi2rg525ufJ$tLustTk2I+PaqyLdOx1P/AflgwVw2RFyDilwjntH21U=', null, '0', 'AWEP', '', '', '0', '1', '2024-12-07 12:47:44.000000', 'AWEP', null, 'female', '18013268019', '2683509479@qq.com');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
INSERT INTO `users_verifycode` VALUES ('18', '123456', '18013268019', '2024-11-29 00:02:35.000000');
INSERT INTO `users_verifycode` VALUES ('19', '13456', '18013268019', '2024-11-29 00:11:25.000000');
INSERT INTO `users_verifycode` VALUES ('20', '111111', '18013268019', '2024-11-29 00:11:47.000000');
INSERT INTO `users_verifycode` VALUES ('21', '173162', '18013268019', '2024-11-29 00:56:39.925855');
INSERT INTO `users_verifycode` VALUES ('22', '335228', '18013268019', '2024-11-29 01:34:43.412169');
INSERT INTO `users_verifycode` VALUES ('23', '627092', '18013268019', '2024-11-29 01:38:12.873507');
INSERT INTO `users_verifycode` VALUES ('24', '063127', '18013268019', '2024-11-29 01:47:02.366735');
INSERT INTO `users_verifycode` VALUES ('25', '487456', '18013268019', '2024-11-29 01:50:39.736590');
INSERT INTO `users_verifycode` VALUES ('26', '492399', '18103268019', '2024-11-29 11:08:07.325152');
INSERT INTO `users_verifycode` VALUES ('27', '081744', '18013268019', '2024-11-29 11:08:07.760802');
INSERT INTO `users_verifycode` VALUES ('28', '200421', '18013268019', '2024-11-29 17:32:48.000000');
INSERT INTO `users_verifycode` VALUES ('29', '741634', '18013268019', '2024-11-29 18:59:46.530198');
INSERT INTO `users_verifycode` VALUES ('30', '296911', '18013268019', '2024-11-29 19:02:43.579941');
INSERT INTO `users_verifycode` VALUES ('31', '797791', '18013268019', '2024-11-29 19:05:52.083337');
INSERT INTO `users_verifycode` VALUES ('32', '366237', '18872026056', '2024-11-29 19:06:47.007100');
INSERT INTO `users_verifycode` VALUES ('33', '888837', '18872026056', '2024-11-29 19:10:28.096546');
INSERT INTO `users_verifycode` VALUES ('34', '224719', '18872026056', '2024-11-29 19:13:50.055154');
INSERT INTO `users_verifycode` VALUES ('35', '652847', '17881529682', '2024-11-29 19:15:47.764674');
INSERT INTO `users_verifycode` VALUES ('36', '203940', '18013268019', '2024-12-06 13:04:58.306001');
INSERT INTO `users_verifycode` VALUES ('37', '209689', '18013268019', '2024-12-06 13:06:55.500507');
INSERT INTO `users_verifycode` VALUES ('38', '213118', '18013268019', '2024-12-07 20:13:10.780952');
INSERT INTO `users_verifycode` VALUES ('39', '636713', '18013268019', '2024-12-07 20:24:28.170754');
INSERT INTO `users_verifycode` VALUES ('40', '034286', '18013268019', '2024-12-07 20:32:32.574067');
INSERT INTO `users_verifycode` VALUES ('41', '512520', '18013268019', '2024-12-07 20:39:47.842606');
INSERT INTO `users_verifycode` VALUES ('42', '002779', '18013268019', '2024-12-07 20:41:43.388447');
INSERT INTO `users_verifycode` VALUES ('43', '811939', '18013268019', '2024-12-07 20:46:13.723790');
INSERT INTO `users_verifycode` VALUES ('44', '816560', '18013268019', '2024-12-07 20:47:14.672189');
INSERT INTO `users_verifycode` VALUES ('45', '411374', '18013268019', '2024-12-08 00:33:31.083604');
INSERT INTO `users_verifycode` VALUES ('46', '062852', '18013268019', '2024-12-08 00:33:31.084677');
INSERT INTO `users_verifycode` VALUES ('47', '956791', '18013268019', '2024-12-08 00:38:09.172034');
INSERT INTO `users_verifycode` VALUES ('48', '218123', '18013268019', '2024-12-08 00:52:14.733105');
INSERT INTO `users_verifycode` VALUES ('49', '068654', '18013268019', '2024-12-08 00:58:47.107580');
INSERT INTO `users_verifycode` VALUES ('50', '956569', '18013268019', '2024-12-08 01:00:05.799769');
INSERT INTO `users_verifycode` VALUES ('51', '240176', '18013268019', '2024-12-08 01:06:40.818664');
INSERT INTO `users_verifycode` VALUES ('52', '594747', '18013268019', '2024-12-08 01:12:17.710291');
INSERT INTO `users_verifycode` VALUES ('53', '763681', '18013268019', '2024-12-08 01:22:34.560202');
INSERT INTO `users_verifycode` VALUES ('54', '986592', '18013268019', '2024-12-08 01:28:42.901523');
INSERT INTO `users_verifycode` VALUES ('55', '942350', '18013268019', '2024-12-08 01:34:54.002811');
INSERT INTO `users_verifycode` VALUES ('56', '345810', '18013268019', '2024-12-08 01:44:54.833861');
INSERT INTO `users_verifycode` VALUES ('57', '520426', '18013268019', '2024-12-08 01:46:54.182007');
INSERT INTO `users_verifycode` VALUES ('58', '433652', '18013268019', '2024-12-08 01:48:46.158426');
INSERT INTO `users_verifycode` VALUES ('59', '622638', '18013268018', '2024-12-08 01:49:24.910119');
INSERT INTO `users_verifycode` VALUES ('60', '864329', '18013268019', '2024-12-08 16:20:31.527259');
INSERT INTO `users_verifycode` VALUES ('61', '577556', '18013268019', '2024-12-08 16:28:33.927264');
