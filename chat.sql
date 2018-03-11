/*
Navicat MySQL Data Transfer

Source Server         : chen
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : chat

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-03-11 21:54:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add user', '2', 'add_user');
INSERT INTO `auth_permission` VALUES ('5', 'Can change user', '2', 'change_user');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete user', '2', 'delete_user');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add permission', '4', 'add_permission');
INSERT INTO `auth_permission` VALUES ('11', 'Can change permission', '4', 'change_permission');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete permission', '4', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add user profile', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change user profile', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete user profile', '7', 'delete_userprofile');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$fPOtzxCxfvpo$S5A5SDyzxUiT17BXjyItOVP5OgGFYfPvbaxLmh45VMw=', '2018-03-11 21:53:30.912000', '1', 'chen', '', '', '1@1.com', '1', '1', '2018-03-11 21:50:03.211000');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$36000$ORTDrOqwFMkw$YKb/j6fQPKeI/0z0adqK+He+pCxP5XHBkJbj6uiHGjE=', null, '0', 'test1', '', '', '', '0', '1', '2018-03-11 21:51:36.113000');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$36000$InSvF3u7WH3G$uKX7aiKus/XuNtv7QZsroOSM9PdrWVsjCJ9uohuGXxU=', null, '0', 'test2', '', '', '', '0', '1', '2018-03-11 21:51:48.516000');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$36000$MigwES0LaGxl$1yGK+a4tqsY7yIA+8bo11KagRp2FbOnjcf8ImAjabGA=', null, '0', 'test3', '', '', '', '0', '1', '2018-03-11 21:52:08.591000');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-03-11 21:51:36.207000', '2', 'test1', '1', '[{\"added\": {}}]', '2', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-03-11 21:51:48.578000', '3', 'test2', '1', '[{\"added\": {}}]', '2', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-03-11 21:52:08.652000', '4', 'test3', '1', '[{\"added\": {}}]', '2', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-03-11 21:52:32.631000', '1', '小明', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-03-11 21:52:40.700000', '2', '小红', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-03-11 21:52:52.222000', '3', '小芳', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-03-11 21:53:07.997000', '4', '小强', '1', '[{\"added\": {}}]', '7', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'qq', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-03-11 21:49:10.751000');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-03-11 21:49:20.009000');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-03-11 21:49:22.345000');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-03-11 21:49:22.525000');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-03-11 21:49:24.237000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-03-11 21:49:25.792000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-03-11 21:49:26.505000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-03-11 21:49:26.575000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-03-11 21:49:26.998000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-03-11 21:49:27.031000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-03-11 21:49:27.087000');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-03-11 21:49:30.033000');
INSERT INTO `django_migrations` VALUES ('13', 'qq', '0001_initial', '2018-03-11 21:49:34.324000');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-03-11 21:49:34.978000');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('7biv9kmkdq1ga8gt1bri39b44ibk9r0q', 'ZWUxMmVkNzAwMmU4NGFiZmY3OTdhMzk2YmFjZjc5MGI3NjYxOGE3MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwMWJiMjQxZGMxMmYzYTMwMWIwZWIxMTcwZDVkYTZiZTE5Y2NiMjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-03-25 21:53:30.978000');

-- ----------------------------
-- Table structure for `qq_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `qq_userprofile`;
CREATE TABLE `qq_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `qq_userprofile_user_id_a216c76f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qq_userprofile
-- ----------------------------
INSERT INTO `qq_userprofile` VALUES ('1', '小明', '1');
INSERT INTO `qq_userprofile` VALUES ('2', '小红', '2');
INSERT INTO `qq_userprofile` VALUES ('3', '小芳', '3');
INSERT INTO `qq_userprofile` VALUES ('4', '小强', '4');

-- ----------------------------
-- Table structure for `qq_userprofile_friends`
-- ----------------------------
DROP TABLE IF EXISTS `qq_userprofile_friends`;
CREATE TABLE `qq_userprofile_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_userprofile_id` int(11) NOT NULL,
  `to_userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qq_userprofile_friends_from_userprofile_id_to_u_87d92825_uniq` (`from_userprofile_id`,`to_userprofile_id`),
  KEY `qq_userprofile_frien_to_userprofile_id_facd3ef5_fk_qq_userpr` (`to_userprofile_id`),
  CONSTRAINT `qq_userprofile_frien_to_userprofile_id_facd3ef5_fk_qq_userpr` FOREIGN KEY (`to_userprofile_id`) REFERENCES `qq_userprofile` (`id`),
  CONSTRAINT `qq_userprofile_frien_from_userprofile_id_ee1cb0a2_fk_qq_userpr` FOREIGN KEY (`from_userprofile_id`) REFERENCES `qq_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qq_userprofile_friends
-- ----------------------------
INSERT INTO `qq_userprofile_friends` VALUES ('2', '1', '2');
INSERT INTO `qq_userprofile_friends` VALUES ('5', '1', '3');
INSERT INTO `qq_userprofile_friends` VALUES ('10', '1', '4');
INSERT INTO `qq_userprofile_friends` VALUES ('1', '2', '1');
INSERT INTO `qq_userprofile_friends` VALUES ('6', '2', '3');
INSERT INTO `qq_userprofile_friends` VALUES ('11', '2', '4');
INSERT INTO `qq_userprofile_friends` VALUES ('3', '3', '1');
INSERT INTO `qq_userprofile_friends` VALUES ('4', '3', '2');
INSERT INTO `qq_userprofile_friends` VALUES ('12', '3', '4');
INSERT INTO `qq_userprofile_friends` VALUES ('7', '4', '1');
INSERT INTO `qq_userprofile_friends` VALUES ('8', '4', '2');
INSERT INTO `qq_userprofile_friends` VALUES ('9', '4', '3');
