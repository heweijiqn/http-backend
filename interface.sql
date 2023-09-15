/*

SQLyog Professional v12.14 (64 bit)

MySQL - 5.7.19 : Database - interface

*********************************************************************

*/




/*!40101 SET NAMES utf8 */;


 
/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`interface` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;



USE `interface`;



/*Table structure for table `sys_api` */



CREATE TABLE `sys_api` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',

  `api_name` varchar(100) DEFAULT NULL COMMENT '接口名称',

  `path` varchar(255) DEFAULT NULL COMMENT '访问地址',

  `http_method` varchar(10) DEFAULT NULL COMMENT '请求 http 方法',

  `parameter_name` varchar(100) DEFAULT NULL COMMENT '参数名称',

  `parameter_type` varchar(255) DEFAULT NULL COMMENT '参数类型',

  `request_parameters` varchar(600) DEFAULT NULL COMMENT '请求参数',

  `response_data_structure` json DEFAULT NULL COMMENT '响应数据',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='接口表';



/*Data for the table `sys_api` */



LOCK TABLES `sys_api` WRITE;



insert  into `sys_api`(`id`,`api_name`,`path`,`http_method`,`parameter_name`,`parameter_type`,`request_parameters`,`response_data_structure`,`create_time`,`update_time`,`is_deleted`) values 


(45,'用户注册','/api/user/register','POST','user','user： username: String,email: String, password: Long','{ \n \"username\": \"john_doe\",\n  \"email\": \"john@example.com\", \n  \"password\": \"123\"\n}','{\"code\": 200, \"data\": {\"message\": \"john_doe 用户注册成功\", \"success\": true}, \"message\": \"成功\"}','2023-08-13 01:08:26','2023-08-13 01:08:26',0),


(46,'用户登录','/api/user/login','POST','Login','user： username: String,email: String, password: Long','{\n\"username\": \"john_doe\", \n\"password\": \"password123\"\n}','{\"code\": 200, \"data\": {\"message\": \"john_doe 用户登录成功\", \"success\": true}, \"message\": \"成功\"}','2023-08-13 01:08:26','2023-08-13 01:08:26',0),


(47,'文章创建','/book/post/create','POST','article','article: title: String, content: String\n','{\n\"title\": \"新文章\", \n\"content\": \"这是新文章的内容。\"\n}','{\"code\": 200, \"data\": {\"message\": \"新文章 文章创建成功\", \"success\": true}, \"message\": \"成功\"}','2023-08-13 01:08:26','2023-08-13 01:08:26',0),


(48,'文章更新','/book/post/{id}/update','PUT','id, article','URL 参数, article: title: String, content: String','{\n    \"title\": \"更新后的文章\",\n    \"content\": \"这是更新后的文章内容。\"\n  \n}','{\"code\": 200, \"data\": {\"message\": \"文章更新   [title, content]:修改成[更新后的文章, 这是更新后的文章内容。]\", \"success\": true, \"pathParameter\": [{\"name\": \"id\", \"value\": \"1\"}]}, \"message\": \"成功\"}','2023-08-13 01:08:26','2023-08-13 01:08:26',0),


(49,'文章删除','/book/post/delete{id}','DELETE','id','URL 参数','{\"id\": 789}','{\"code\": 200, \"data\": {\"SELECT\": [{\"name\": \"id\", \"value\": \"111\"}], \"message\": \"文章删除 成功删除该数据\", \"success\": true}, \"message\": \"成功\"}','2023-08-13 01:08:26','2023-08-13 01:08:26',0),


(50,'用户列表','/api/users//{page}/{limit}','GET','page, limit','Long、Long','{\n    \"page\": 1,\n    \"limit\": 1,\n   \n}','[{\"id\": 1, \"age\": 30, \"email\": \"john@example.com\", \"username\": \"john_doe\", \"is_active\": true}, {\"id\": 2, \"age\": 28, \"email\": \"jane@example.com\", \"username\": \"jane_smith\", \"is_active\": true}]','2023-08-13 01:08:26','2023-08-13 01:08:26',0),


(51,'文章批量删除','/book/post/delete','DELETE','idList','List','{\n  \"idList\": [85, 92, 78]\n}\n','{\"code\": 200, \"data\": {\"message\": \"文章批量输出 成功\", \"success\": true, \"DELETE-LIST\": \"\"}, \"message\": \"成功\"}','2023-08-17 01:28:09','2023-08-17 01:28:09',0);



UNLOCK TABLES;



/*Table structure for table `sys_dept` */



CREATE TABLE `sys_dept` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT,

  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',

  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级部门id',

  `tree_path` varchar(255) DEFAULT ',' COMMENT '树结构',

  `sort_value` int(11) DEFAULT '1' COMMENT '排序',

  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',

  `phone` varchar(11) DEFAULT NULL COMMENT '电话',

  `status` tinyint(1) DEFAULT '1' COMMENT '状态（1正常 0停用）',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`) USING BTREE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='组织机构';



/*Data for the table `sys_dept` */



LOCK TABLES `sys_dept` WRITE;



UNLOCK TABLES;



/*Table structure for table `sys_item` */



CREATE TABLE `sys_item` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目ID',

  `name` varchar(100) NOT NULL COMMENT '项目名称',

  `description` text COMMENT '项目描述',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='项目表';



/*Data for the table `sys_item` */



LOCK TABLES `sys_item` WRITE;



insert  into `sys_item`(`id`,`name`,`description`,`create_time`,`update_time`,`is_deleted`) values 


(3,'图书管理','jsp图书馆官网','2023-08-08 02:13:02','2023-08-26 06:18:06',0),


(6,'接口平台','模仿postman和swagger的','2023-08-21 22:27:37','2023-08-26 06:18:07',0);



UNLOCK TABLES;



/*Table structure for table `sys_item_api` */



CREATE TABLE `sys_item_api` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',

  `item_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '项目id',

  `api_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '接口id',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`),

  KEY `idx_item_id` (`item_id`),

  KEY `idx_api_id` (`api_id`)

) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='项目接口';



/*Data for the table `sys_item_api` */



LOCK TABLES `sys_item_api` WRITE;



insert  into `sys_item_api`(`id`,`item_id`,`api_id`,`create_time`,`update_time`,`is_deleted`) values 


(1,3,45,'2023-08-23 01:02:26','2023-08-23 01:02:31',1),


(2,3,45,'2023-08-23 01:02:31','2023-08-23 01:02:36',1),


(3,3,46,'2023-08-23 01:02:31','2023-08-23 01:02:36',1),


(4,3,47,'2023-08-23 01:02:31','2023-08-23 01:02:36',1),


(5,3,48,'2023-08-23 01:02:31','2023-08-23 01:02:36',1),


(6,3,49,'2023-08-23 01:02:31','2023-08-23 01:02:36',1),


(7,3,50,'2023-08-23 01:02:31','2023-08-23 01:02:36',1),


(8,3,51,'2023-08-23 01:02:31','2023-08-23 01:02:36',1),


(9,3,45,'2023-08-23 01:02:36','2023-08-25 17:55:53',1),


(10,3,45,'2023-08-25 17:55:53','2023-08-25 23:29:14',1),


(11,3,46,'2023-08-25 17:55:53','2023-08-25 23:29:14',1),


(12,6,45,'2023-08-25 17:56:01','2023-08-25 23:09:38',1),


(13,6,46,'2023-08-25 17:56:01','2023-08-25 23:09:38',1),


(14,3,45,'2023-08-25 23:29:14','2023-08-25 23:29:14',1),


(15,3,46,'2023-08-25 23:29:14','2023-08-25 23:29:14',1),


(16,3,47,'2023-08-25 23:29:14','2023-08-25 23:29:31',1),


(17,3,47,'2023-08-25 23:29:31','2023-08-25 23:29:31',1),


(18,3,45,'2023-08-25 23:29:31','2023-08-25 23:29:31',1),


(19,3,46,'2023-08-25 23:29:31','2023-08-25 23:31:00',1),


(20,3,46,'2023-08-25 23:31:00','2023-08-25 23:39:31',1),


(21,3,45,'2023-08-25 23:31:00','2023-08-25 23:39:31',1),


(22,6,45,'2023-08-25 23:31:06','2023-08-25 23:49:08',1),


(23,3,46,'2023-08-25 23:39:31','2023-08-25 23:49:32',1),


(24,3,45,'2023-08-25 23:39:31','2023-08-25 23:49:32',1),


(25,3,47,'2023-08-25 23:39:31','2023-08-25 23:49:32',1),


(26,6,45,'2023-08-25 23:49:08','2023-08-26 00:07:09',1),


(27,6,46,'2023-08-25 23:49:08','2023-08-26 00:07:09',1),


(28,3,46,'2023-08-25 23:49:32','2023-08-26 00:07:05',1),


(29,3,45,'2023-08-25 23:49:32','2023-08-26 00:07:05',1),


(30,3,47,'2023-08-26 00:07:05','2023-08-26 00:07:05',0),


(31,3,48,'2023-08-26 00:07:05','2023-08-26 00:07:05',0),


(32,3,49,'2023-08-26 00:07:05','2023-08-26 00:07:05',0),


(33,3,51,'2023-08-26 00:07:05','2023-08-26 00:07:05',0),


(34,6,45,'2023-08-26 00:07:09','2023-08-26 00:07:09',0),


(35,6,46,'2023-08-26 00:07:09','2023-08-26 00:07:09',0),


(36,6,50,'2023-08-26 00:07:09','2023-08-26 00:07:09',0);



UNLOCK TABLES;



/*Table structure for table `sys_login_log` */



CREATE TABLE `sys_login_log` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',

  `username` varchar(50) DEFAULT '' COMMENT '用户账号',

  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',

  `status` tinyint(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',

  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',

  `access_time` datetime DEFAULT NULL COMMENT '访问时间',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';



/*Data for the table `sys_login_log` */



LOCK TABLES `sys_login_log` WRITE;



insert  into `sys_login_log`(`id`,`username`,`ipaddr`,`status`,`msg`,`access_time`,`create_time`,`update_time`,`is_deleted`) values 


(44,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-03 19:59:23',NULL,0),


(45,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-07 00:49:46',NULL,0),


(46,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-07 00:51:02',NULL,0),


(47,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-07 01:06:08',NULL,0),


(48,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-07 01:07:40',NULL,0),


(49,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-08 02:18:24',NULL,0),


(50,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-08 02:50:39',NULL,0),


(51,'admin','192.168.31.215',1,'登录成功',NULL,'2023-08-08 03:07:29',NULL,0),


(52,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-08 03:22:08',NULL,0),


(53,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-08 20:35:18',NULL,0),


(54,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-08 21:14:42',NULL,0),


(55,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-08 22:06:23',NULL,0),


(56,'hwj1218','127.0.0.1',1,'登录成功',NULL,'2023-08-08 22:47:48',NULL,0),


(57,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-08 22:47:54',NULL,0),


(58,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-09 18:34:22',NULL,0),


(59,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-10 00:52:25',NULL,0),


(60,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-10 01:00:57',NULL,0),


(61,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-10 01:02:10',NULL,0),


(62,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-10 01:07:35',NULL,0),


(63,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-10 01:25:20',NULL,0),


(64,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-10 01:28:29',NULL,0),


(65,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-10 01:30:17',NULL,0),


(66,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 00:39:05',NULL,0),


(67,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 00:47:14',NULL,0),


(68,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 00:48:47',NULL,0),


(69,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 00:50:08',NULL,0),


(70,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 01:04:05',NULL,0),


(71,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 18:32:41',NULL,0),


(72,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 18:34:45',NULL,0),


(73,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 22:31:00',NULL,0),


(74,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 22:34:19',NULL,0),


(75,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-11 22:39:56',NULL,0),


(76,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 02:52:09',NULL,0),


(77,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 02:56:42',NULL,0),


(78,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 02:58:45',NULL,0),


(79,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 05:48:03',NULL,0),


(80,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 05:51:43',NULL,0),


(81,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 17:47:48',NULL,0),


(82,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 17:50:02',NULL,0),


(83,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 17:58:16',NULL,0),


(84,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 18:00:33',NULL,0),


(85,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-12 18:14:45',NULL,0),


(86,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-12 23:12:05',NULL,0),


(87,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-13 04:29:29',NULL,0),


(88,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-13 07:51:19',NULL,0),


(89,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-13 16:14:55',NULL,0),


(90,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-13 20:55:55',NULL,0),


(91,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-13 21:02:50',NULL,0),


(92,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-14 01:44:59',NULL,0),


(93,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-14 18:46:45',NULL,0),


(94,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-14 18:59:07',NULL,0),


(95,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-14 19:30:00',NULL,0),


(96,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-14 19:57:50',NULL,0),


(97,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-14 20:03:44',NULL,0),


(98,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-14 20:04:13',NULL,0),


(99,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-14 21:54:07',NULL,0),


(100,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-15 01:54:30',NULL,0),


(101,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-17 19:40:16',NULL,0),


(102,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-17 21:41:55',NULL,0),


(103,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-17 21:47:00',NULL,0),


(104,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-17 22:00:33',NULL,0),


(105,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-17 22:21:29',NULL,0),


(106,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-17 22:38:49',NULL,0),


(107,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-17 22:52:08',NULL,0),


(108,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 03:14:23',NULL,0),


(109,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 03:30:42',NULL,0),


(110,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 03:35:17',NULL,0),


(111,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-18 04:01:45',NULL,0),


(112,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-18 04:19:13',NULL,0),


(113,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-18 19:28:52',NULL,0),


(114,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 21:50:18',NULL,0),


(115,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 22:25:00',NULL,0),


(116,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 22:27:55',NULL,0),


(117,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 22:34:13',NULL,0),


(118,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-18 22:44:03',NULL,0),


(119,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-19 07:09:45',NULL,0),


(120,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-19 07:15:12',NULL,0),


(121,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-19 07:17:51',NULL,0),


(122,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 07:27:58',NULL,0),


(123,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 07:51:48',NULL,0),


(124,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 07:58:59',NULL,0),


(125,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 08:28:59',NULL,0),


(126,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 10:47:53',NULL,0),


(127,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 11:19:22',NULL,0),


(128,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 21:21:20',NULL,0),


(129,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 21:40:44',NULL,0),


(130,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-19 23:10:03',NULL,0),


(131,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-20 01:22:37',NULL,0),


(132,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-20 03:36:35',NULL,0),


(133,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-21 00:10:20',NULL,0),


(134,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-23 00:29:16',NULL,0),


(135,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-23 00:30:47',NULL,0),


(136,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-23 01:02:19',NULL,0),


(137,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-23 21:37:54',NULL,0),


(138,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-25 17:55:42',NULL,0),


(139,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-25 17:56:43',NULL,0),


(140,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-25 22:18:01',NULL,0),


(141,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-26 00:44:56',NULL,0),


(142,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-26 00:51:31',NULL,0),


(143,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-26 00:54:38',NULL,0),


(144,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-26 03:20:56',NULL,0),


(145,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-26 03:56:31',NULL,0),


(146,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-26 07:14:29',NULL,0),


(147,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-26 19:14:40',NULL,0),


(148,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-08-26 19:18:40',NULL,0),


(149,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-26 19:31:44',NULL,0);



UNLOCK TABLES;



/*Table structure for table `sys_menu` */



CREATE TABLE `sys_menu` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',

  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属上级',

  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',

  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型(0:目录,1:菜单,2:按钮)',

  `path` varchar(100) DEFAULT NULL COMMENT '路由地址',

  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',

  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',

  `icon` varchar(100) DEFAULT NULL COMMENT '图标',

  `sort_value` int(11) DEFAULT NULL COMMENT '排序',

  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`),

  KEY `idx_parent_id` (`parent_id`)

) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';



/*Data for the table `sys_menu` */



LOCK TABLES `sys_menu` WRITE;



insert  into `sys_menu`(`id`,`parent_id`,`name`,`type`,`path`,`component`,`perms`,`icon`,`sort_value`,`status`,`create_time`,`update_time`,`is_deleted`) values 


(2,0,'HTTP 接口管理平台',0,'system','Layout',NULL,'el-icon-s-tools',1,1,'2021-05-31 18:05:37','2022-06-09 09:23:24',0),


(3,2,'成员管理',1,'sysUser','system/sysUser/list','','el-icon-s-custom',1,1,'2021-05-31 18:05:37','2022-06-09 09:22:47',0),


(4,2,'角色管理',1,'sysRole','system/sysRole/list','','el-icon-user-solid',2,1,'2021-05-31 18:05:37','2022-06-09 09:37:18',0),


(5,2,'权限菜单',1,'sysMenu','system/sysMenu/list','','el-icon-s-unfold',6,1,'2021-05-31 18:05:37','2022-06-09 09:37:21',0),


(6,3,'查看',2,NULL,NULL,'bnt.sysUser.list',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(7,3,'添加',2,NULL,NULL,'bnt.sysUser.save',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(8,3,'修改',2,NULL,NULL,'bnt.sysUser.update',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(9,3,'删除',2,NULL,NULL,'bnt.sysUser.remove',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(10,4,'查看',2,NULL,NULL,'bnt.sysRole.list',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(11,4,'添加',2,NULL,NULL,'bnt.sysRole.add',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(12,4,'修改',2,NULL,NULL,'bnt.sysRole.update',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(13,4,'删除',2,NULL,NULL,'bnt.sysRole.remove',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(14,5,'查看',2,NULL,NULL,'bnt.sysMenu.list',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(15,5,'添加',2,NULL,NULL,'bnt.sysMenu.add',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(16,5,'修改',2,NULL,NULL,'bnt.sysMenu.update',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(17,5,'删除',2,NULL,NULL,'bnt.sysMenu.remove',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),


(18,3,'分配角色',2,NULL,NULL,'bnt.sysUser.assignRole',NULL,1,1,'2022-05-23 17:14:32','2022-06-09 09:22:38',0),


(19,4,'分配权限',2,'assignAuth','system/sysRole/assignAuth','bnt.sysRole.assignAuth',NULL,1,1,'2022-05-23 17:18:14','2022-06-09 09:22:38',0),


(20,2,'项目人员管理',1,'sysDept','system/sysDept/list','','el-icon-s-operation',4,1,'2022-05-24 10:07:05','2023-08-04 23:53:31',1),


(21,20,'查看',2,NULL,NULL,'bnt.sysDept.list',NULL,1,1,'2022-05-24 10:07:44','2023-08-04 23:53:18',1),


(22,2,'岗位管理',1,'sysPost','system/sysPost/list','','el-icon-more-outline',5,1,'2022-05-24 10:25:30','2023-08-03 19:23:46',1),


(23,22,'查看',2,NULL,NULL,'bnt.sysPost.list',NULL,1,1,'2022-05-24 10:25:45','2023-08-03 19:21:27',1),


(24,20,'添加',2,NULL,NULL,'bnt.sysDept.add',NULL,1,1,'2022-05-25 15:31:27','2023-08-04 23:53:24',1),


(25,20,'修改',2,NULL,NULL,'bnt.sysDept.update',NULL,1,1,'2022-05-25 15:31:41','2023-08-04 23:53:21',1),


(26,20,'删除',2,NULL,NULL,'bnt.sysDept.remove',NULL,1,1,'2022-05-25 15:31:59','2023-08-04 23:53:26',1),


(27,22,'添加',2,NULL,NULL,'bnt.sysPost.add',NULL,1,1,'2022-05-25 15:32:44','2023-08-03 19:21:30',1),


(28,22,'修改',2,NULL,NULL,'bnt.sysPost.update',NULL,1,1,'2022-05-25 15:32:58','2023-08-03 19:21:33',1),


(29,22,'删除',2,NULL,NULL,'bnt.sysPost.remove',NULL,1,1,'2022-05-25 15:33:11','2023-08-03 19:21:36',1),


(30,34,'操作记录',1,'sysOperLog','system/sysOperLog/list','','el-icon-document-remove',7,1,'2022-05-26 16:09:59','2023-06-22 17:34:13',0),


(31,30,'查看',2,NULL,NULL,'bnt.sysOperLog.list',NULL,1,1,'2022-05-26 16:10:17','2023-06-22 17:34:23',0),


(32,34,'登录记录',1,'sysLoginLog','system/sysLoginLog/list','','el-icon-s-goods',8,1,'2022-05-26 16:36:13','2022-06-09 09:39:24',0),


(33,32,'查看',2,NULL,NULL,'bnt.sysLoginLog.list',NULL,1,1,'2022-05-26 16:36:31','2022-06-09 09:36:36',0),


(34,2,'监控管理',0,'log','ParentView','','el-icon-tickets',5,1,'2022-05-31 13:23:07','2022-06-09 09:39:22',0),


(37,3,'修改状态',2,'','','bnt.sysUser.updateStatus','',1,1,'2023-06-21 16:55:26','2023-06-21 16:55:26',0),


(38,4,'批量删除',2,'','','bnt.sysRole.batchRemove','',1,1,'2023-06-21 20:05:59','2023-06-21 20:05:59',0),


(39,20,'修改状态',2,'','','bnt.sysDept.updateStatus','',1,1,'2023-06-21 20:39:28','2023-08-04 23:53:28',1),


(40,22,'批量删除',2,'','','bnt.sysPost.batchRemove','',1,1,'2023-06-21 23:54:53','2023-08-03 19:21:38',1),


(41,22,'修改状态',2,'','','bnt.sysPost.updateStatus','',1,1,'2023-06-22 14:20:29','2023-08-03 19:21:40',1),


(42,30,'删除',2,'','','bnt.sysOperLog.delete','',1,1,'2023-06-22 21:27:17','2023-06-22 21:27:17',0),


(43,30,'批量删除',2,'','','bnt.sysOperLog.batchRemove','',1,1,'2023-06-22 21:27:45','2023-06-22 21:27:45',0),


(44,32,'批量删除',2,'','','bnt.sysLoginLog.batchRemove','',1,1,'2023-06-22 21:28:12','2023-06-22 21:28:12',0),


(45,32,'删除',2,'','','bnt.sysLoginLog.delete','',1,1,'2023-06-22 21:29:27','2023-06-22 21:29:27',0),


(46,2,'项目管理',1,'sysItem','system/sysItem/list','','el-icon-more-outline',3,1,'2023-08-03 20:01:57','2023-08-03 20:01:57',0),


(47,46,'查看',2,'','','bnt.sysItem.list','',1,1,'2023-08-07 00:52:36','2023-08-07 00:52:36',0),


(48,46,'添加',2,'','','bnt.sysItem.save','',1,1,'2023-08-07 00:53:00','2023-08-07 00:53:00',0),


(49,46,'修改',2,'','','bnt.sysItem.update','',1,1,'2023-08-07 00:53:28','2023-08-07 00:53:28',0),


(50,46,'删除',2,'','','bnt.sysItem.remove','',1,1,'2023-08-07 00:53:44','2023-08-07 00:53:44',0),


(51,46,'分配成员',2,'','','bnt.sysItem.assignItem','',1,1,'2023-08-08 20:17:57','2023-08-08 20:17:57',0),


(52,2,'接口管理',1,'sysApi','system/sysApi/list','','el-icon-s-goods',4,1,'2023-08-10 00:58:36','2023-08-10 00:58:36',0),


(53,52,'添加',2,'','','bnt.sysApi.save','',1,1,'2023-08-10 01:00:21','2023-08-10 01:00:21',0),


(54,52,'查看列表',2,'','','bnt.sysApi.list','',1,1,'2023-08-10 19:00:50','2023-08-10 19:00:50',0),


(55,52,'更新',2,'','','bnt.sysApi.update','',1,1,'2023-08-10 19:03:56','2023-08-10 19:03:56',0),


(56,52,'删除',2,'','','bnt.sysApi.remove','',1,1,'2023-08-10 19:04:52','2023-08-10 19:04:52',0),


(57,52,'',2,'api','system/sysApi/assignAuth','','',1,1,'2023-08-13 07:07:53','2023-08-13 07:17:00',1),


(58,52,'调用post接口',2,'','','bnt.sysApi.invokePost','',1,1,'2023-08-18 03:49:50','2023-08-18 03:49:50',0),


(59,52,'调用put接口',2,'','','bnt.sysApi.invokePut','',1,1,'2023-08-18 03:50:46','2023-08-18 03:50:46',0),


(60,52,'调用del接口',2,'','','bnt.sysApi.invokeDelete','',1,1,'2023-08-18 03:51:17','2023-08-18 03:51:17',0),


(61,52,'修改格式',2,'','','bnt.sysApi.format','',1,1,'2023-08-18 03:52:22','2023-08-18 03:52:22',0),


(63,46,'分配接口',2,'','','bnt.sysItem.assignapi','',1,1,'2023-08-23 00:57:57','2023-08-23 00:57:57',0),


(64,52,'查看模拟数据',2,'assignSimulation','system/sysApi/assignSimulation','bnt.sysMock.list','',1,1,'2023-08-26 03:31:06','2023-08-26 06:12:16',0),


(65,52,'修改模拟数据',2,'assignSimulation','system/sysApi/assignSimulation','bnt.sysMock.update','',1,1,'2023-08-26 03:33:02','2023-08-26 06:37:30',0),


(66,52,'添加模拟数据',2,'assignSimulation','system/sysApi/assignSimulation','bnt.sysMock.save','',1,1,'2023-08-26 03:34:14','2023-08-26 06:37:31',0),


(67,52,'删除模拟数据',2,'system/sysApi/assignSimulation','assignSimulation','bnt.sysUser.remove','',1,1,'2023-08-26 03:34:47','2023-08-26 06:37:32',0),


(68,2,'模拟数据管理',1,'sysMock','system/sysMock/list','','el-icon-s-tools',4,1,'2023-08-26 05:39:40','2023-08-26 06:37:46',1);



UNLOCK TABLES;



/*Table structure for table `sys_mock` */



CREATE TABLE `sys_mock` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',

  `name` varchar(20) NOT NULL COMMENT '关联的接口名',

  `mock_data` varchar(255) DEFAULT NULL COMMENT '模拟数据',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='模拟数据表';



/*Data for the table `sys_mock` */



LOCK TABLES `sys_mock` WRITE;



insert  into `sys_mock`(`id`,`name`,`mock_data`,`create_time`,`update_time`,`is_deleted`) values 


(3,'用户列表','{ \"records\": { \"username\": \"admin\", \"password\": \"96e79218965eb72c92a549dd5a330112\", \"email\": \"13414730186@qq.com\" } }','2023-08-26 06:08:22','2023-08-26 06:20:45',0);



UNLOCK TABLES;



/*Table structure for table `sys_oper_log` */



CREATE TABLE `sys_oper_log` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',

  `title` varchar(50) DEFAULT '' COMMENT '模块标题',

  `business_type` varchar(20) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',

  `method` varchar(100) DEFAULT '' COMMENT '方法名称',

  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',

  `operator_type` varchar(20) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',

  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',

  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',

  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',

  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',

  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',

  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',

  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',

  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',

  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1297 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';



/*Data for the table `sys_oper_log` */



LOCK TABLES `sys_oper_log` WRITE;



insert  into `sys_oper_log`(`id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`create_time`,`update_time`,`is_deleted`) values 


(203,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/22','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:23:46',NULL,0),


(204,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:25:26',NULL,0),


(205,'用户管理','UPDATE','com.hwj.system.controller.SysUserController.updateById()','PUT','MANAGE','admin','','/admin/system/sysUser/update','127.0.0.1','{\"updateTime\":1687265317000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"isDeleted\":0,\"createTime\":1687265317000,\"param\":{},\"phone\":\"17058787425\",\"name\":\"何世九\",\"id\":\"6\",\"status\":1,\"username\":\"hwj2023\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:27:00',NULL,0),


(206,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:27:04',NULL,0),


(207,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"5\"],\"userId\":\"6\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:27:30',NULL,0),


(208,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"11\"],\"userId\":\"7\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:27:40',NULL,0),


(209,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:28:32',NULL,0),


(210,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"EXPLOITATION\",\"roleName\":\"开发人员\",\"updateTime\":1686836165000},{\"createTime\":1691061567000,\"id\":\"12\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"MONITOR\",\"roleName\":\"运维人员\",\"updateTime\":1691061567000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:28:35',NULL,0),


(211,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:28:36',NULL,0),


(212,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-operation\",\"updateTime\":1654738692000,\"type\":1,\"parentId\":2,\"path\":\"sysDept\",\"sortValue\":4,\"component\":\"system/sysDept/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1691061904000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysDept.list\",\"id\":\"21\",\"status\":1},{\"select\":false,\"updateTime\":1691061921000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysDept.add\",\"id\":\"24\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysDept.update\",\"id\":\"25\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysDept.remove\",\"id\":\"26\",\"status\":1},{\"select\":false,\"icon\":\"\",\"updateTime\":1687351168000,\"type\":2,\"parentId\":20,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687351168000,\"param\":{},\"name\":\"修改状态\",\"perms\":\"bnt.sysDept.updateStatus\",\"id\":\"39\",\"status\":1}],\"createTime\":1653358025000,\"param\":{},\"name\":\"项目人员管理\",\"perms\":\"\",\"id\":\"20\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:30:43',NULL,0),


(213,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-unfold\",\"updateTime\":1654738641000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu\",\"sortValue\":6,\"component\":\"system/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":\"14\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":\"15\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":\"16\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":\"17\",\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"菜单管理\",\"perms\":\"\",\"id\":\"5\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:38:41',NULL,0),


(214,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-unfold\",\"updateTime\":1654738641000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu\",\"sortValue\":6,\"component\":\"system/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":\"14\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":\"15\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":\"16\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":\"17\",\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"权限菜单\",\"perms\":\"\",\"id\":\"5\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:40:30',NULL,0),


(215,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:58:05',NULL,0),


(216,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 19:59:22',NULL,0),


(217,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":1,\"parentId\":2,\"path\":\"sysItem\",\"sortValue\":3,\"component\":\"\",\"param\":{},\"name\":\"项目管理\",\"perms\":\"\",\"id\":\"46\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 20:01:57',NULL,0),


(218,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691064117000,\"type\":1,\"parentId\":2,\"path\":\"sysItem\",\"sortValue\":3,\"component\":\"system/sysItem/list\",\"isDeleted\":0,\"children\":[],\"createTime\":1691064117000,\"param\":{},\"name\":\"项目管理\",\"perms\":\"\",\"id\":\"46\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 20:02:41',NULL,0),


(219,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-more-outline\",\"updateTime\":1691064117000,\"type\":1,\"parentId\":2,\"path\":\"sysItem\",\"sortValue\":3,\"component\":\"system/sysItem/list\",\"isDeleted\":0,\"children\":[],\"createTime\":1691064117000,\"param\":{},\"name\":\"项目管理\",\"perms\":\"\",\"id\":\"46\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 20:03:10',NULL,0),


(220,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 20:15:12',NULL,0),


(221,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"20\",\"21\",\"24\",\"25\",\"26\",\"39\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 20:15:19',NULL,0),


(222,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 20:15:20',NULL,0),


(223,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"12\"],\"userId\":\"9\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:09:15',NULL,0),


(224,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:09:17',NULL,0),


(225,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:09:23',NULL,0),


(226,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"2\",\"menuIdList\":[\"2\",\"3\",\"6\",\"4\",\"10\",\"5\",\"14\",\"20\",\"21\",\"34\",\"30\",\"31\",\"32\",\"33\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:09:44',NULL,0),


(227,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:09:45',NULL,0),


(228,'项目人员管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','POST','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"leader\":\"张怀民\",\"updateTime\":1687267557000,\"parentId\":0,\"sortValue\":1,\"isDeleted\":0,\"children\":[{\"leader\":\"李总\",\"updateTime\":1687267564000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267564000,\"param\":{},\"phone\":\"18790007789\",\"name\":\"北京分公司\",\"id\":\"10\",\"treePath\":\",1,10,\",\"status\":1},{\"leader\":\"王总\",\"updateTime\":1687267572000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267572000,\"param\":{},\"phone\":\"15090987678\",\"name\":\"上海分公司\",\"id\":\"20\",\"treePath\":\",1,20,\",\"status\":1},{\"leader\":\"李总\",\"updateTime\":1687267584000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267584000,\"param\":{},\"phone\":\"15090987678\",\"name\":\"深圳分公司\",\"id\":\"30\",\"treePath\":\",1,30,\",\"status\":1}],\"createTime\":1687267557000,\"param\":{},\"phone\":\"15659090912\",\"name\":\"接口管理\",\"id\":\"1\",\"treePath\":\",1,\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:28:57',NULL,0),


(229,'项目人员管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','POST','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"leader\":\"李总\",\"updateTime\":1687267564000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267564000,\"param\":{},\"phone\":\"18790007789\",\"name\":\"接口测试\",\"id\":\"10\",\"treePath\":\",1,10,\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:29:11',NULL,0),


(230,'项目人员管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','POST','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"leader\":\"王阳明\",\"updateTime\":1687267572000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267572000,\"param\":{},\"phone\":\"15090987678\",\"name\":\"接口编写\",\"id\":\"20\",\"treePath\":\",1,20,\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:29:49',NULL,0),


(231,'项目人员管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','POST','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"leader\":\"李世民\",\"updateTime\":1687267564000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267564000,\"param\":{},\"phone\":\"18790007789\",\"name\":\"接口测试\",\"id\":\"10\",\"treePath\":\",1,10,\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:30:01',NULL,0),


(232,'项目人员管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','POST','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"leader\":\"程咬金\",\"updateTime\":1687267584000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267584000,\"param\":{},\"phone\":\"15090987678\",\"name\":\"接口维护\",\"id\":\"30\",\"treePath\":\",1,30,\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:30:31',NULL,0),


(233,'项目人员管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','POST','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"leader\":\"王阳明\",\"updateTime\":1687267572000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267572000,\"param\":{},\"phone\":\"15090987600\",\"name\":\"接口编写\",\"id\":\"20\",\"treePath\":\",1,20,\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:30:42',NULL,0),


(234,'项目人员管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','POST','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"leader\":\"程咬金\",\"updateTime\":1687267584000,\"parentId\":1,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1687267584000,\"param\":{},\"phone\":\"15090987676\",\"name\":\"接口维护\",\"id\":\"30\",\"treePath\":\",1,30,\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-03 23:30:49',NULL,0),


(235,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-04 19:07:38',NULL,0),


(236,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-custom\",\"updateTime\":1654737767000,\"type\":1,\"parentId\":2,\"path\":\"sysUser\",\"sortValue\":1,\"component\":\"system/sysUser/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysUser.list\",\"id\":\"6\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysUser.add\",\"id\":\"7\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysUser.update\",\"id\":\"8\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysUser.remove\",\"id\":\"9\",\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653297272000,\"param\":{},\"name\":\"分配角色\",\"perms\":\"bnt.sysUser.assignRole\",\"id\":\"18\",\"status\":1},{\"select\":false,\"icon\":\"\",\"updateTime\":1687337726000,\"type\":2,\"parentId\":3,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687337726000,\"param\":{},\"name\":\"修改状态\",\"perms\":\"bnt.sysUser.updateStatus\",\"id\":\"37\",\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"成员管理\",\"perms\":\"\",\"id\":\"3\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 22:30:40',NULL,0),


(237,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-04 22:45:32',NULL,0),


(238,'项目人员管理','DELETE','com.hwj.system.controller.SysItemController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/10','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:44:09',NULL,0),


(239,'项目人员管理','DELETE','com.hwj.system.controller.SysItemController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/20','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:44:12',NULL,0),


(240,'项目人员管理','DELETE','com.hwj.system.controller.SysItemController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/30','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:44:14',NULL,0),


(241,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/21','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:53:18',NULL,0),


(242,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/25','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:53:21',NULL,0),


(243,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/24','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:53:24',NULL,0),


(244,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/26','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:53:26',NULL,0),


(245,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/39','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:53:28',NULL,0),


(246,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/20','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-04 23:53:31',NULL,0),


(247,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:00:38',NULL,0),


(248,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"EXPLOITATION\",\"roleName\":\"开发人员\",\"updateTime\":1686836165000},{\"createTime\":1691061567000,\"id\":\"12\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"MONITOR\",\"roleName\":\"运维人员\",\"updateTime\":1691061567000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:00:40',NULL,0),


(249,'角色管理','INSERT','com.hwj.system.controller.SysRoleController.saveRole()','POST','MANAGE','admin','','/admin/system/sysRole/save','127.0.0.1','{\"param\":{},\"roleCode\":\"PROJECT MANAGER\",\"roleName\":\"项目经理\",\"id\":\"13\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:02:14',NULL,0),


(250,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"EXPLOITATION\",\"roleName\":\"开发人员\",\"updateTime\":1686836165000},{\"createTime\":1691061567000,\"id\":\"12\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"MONITOR\",\"roleName\":\"运维人员\",\"updateTime\":1691061567000},{\"createTime\":1691164934000,\"id\":\"13\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"PROJECT MANAGER\",\"roleName\":\"项目经理\",\"updateTime\":1691164934000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:02:14',NULL,0),


(251,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"13\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:02:32',NULL,0),


(252,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:02:33',NULL,0),


(253,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:02:38',NULL,0),


(254,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"2\",\"menuIdList\":[\"2\",\"3\",\"6\",\"4\",\"10\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:02:56',NULL,0),


(255,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-05 00:02:57',NULL,0),


(256,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"\",\"perms\":\"bnt.sysItem.list\",\"id\":\"47\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:52:36',NULL,0),


(257,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"\",\"perms\":\"bnt.sysItem.save\",\"id\":\"48\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:53:00',NULL,0),


(258,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"\",\"perms\":\"bnt.sysItem.update\",\"id\":\"49\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:53:28',NULL,0),


(259,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"\",\"perms\":\"bnt.sysItem.remove\",\"id\":\"50\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:53:44',NULL,0),


(260,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691340756000,\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691340756000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysItem.list\",\"id\":\"47\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:54:24',NULL,0),


(261,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691340756000,\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691340756000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysItem.list\",\"id\":\"47\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:54:24',NULL,0),


(262,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691340780000,\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691340780000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysItem.save\",\"id\":\"48\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:54:33',NULL,0),


(263,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691340808000,\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691340808000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysItem.update\",\"id\":\"49\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:54:50',NULL,0),


(264,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691340824000,\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691340824000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysItem.remove\",\"id\":\"50\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:54:56',NULL,0),


(265,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:54:59',NULL,0),


(266,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:55:05',NULL,0),


(267,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:55:06',NULL,0),


(268,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:55:46',NULL,0),


(269,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:55:51',NULL,0),


(270,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 00:55:52',NULL,0),


(271,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 01:03:06',NULL,0),


(272,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 01:03:13',NULL,0),


(273,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 01:03:14',NULL,0),


(274,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"1\"],\"userId\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 01:03:18',NULL,0),


(275,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/1','0:0:0:0:0:0:0:1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-07 01:06:29',NULL,0),


(276,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 16:50:25',NULL,0),


(277,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-07 18:58:11',NULL,0),


(278,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:02:15',NULL,0),


(279,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:04:53',NULL,0),


(280,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:04:58',NULL,0),


(281,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:05:02',NULL,0),


(282,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:05:18',NULL,0),


(283,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:05:29',NULL,0),


(284,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:05:51',NULL,0),


(285,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:06:03',NULL,0),


(286,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:14:55',NULL,0),


(287,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:15:35',NULL,0),


(288,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:15:56',NULL,0),


(289,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:25:11',NULL,0),


(290,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/1','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 01:38:42',NULL,0),


(291,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/1','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 01:48:04',NULL,0),


(292,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/1','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:01:09',NULL,0),


(293,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/2','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 02:02:21',NULL,0),


(294,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 02:08:25',NULL,0),


(295,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/1','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:12:33',NULL,0),


(296,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 02:13:05',NULL,0),


(297,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:14:01',NULL,0),


(298,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:18:44',NULL,0),


(299,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/1','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:24:18',NULL,0),


(300,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 02:24:35',NULL,0),


(301,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 02:24:41',NULL,0),


(302,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 02:24:42',NULL,0),


(303,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','0:0:0:0:0:0:0:1','{\"isDeleted\":0,\"param\":{},\"name\":\"\",\"description\":\"jsp图书管理系统\",\"id\":\"2\"}','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:51:51',NULL,0),


(304,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','0:0:0:0:0:0:0:1','{\"isDeleted\":0,\"param\":{},\"name\":\"\",\"description\":\"jsp图书管理系统\",\"id\":\"2\"}','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:52:12',NULL,0),


(305,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','0:0:0:0:0:0:0:1','{\"isDeleted\":0,\"param\":{},\"name\":\"\",\"description\":\"\",\"id\":\"\"}','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:54:13',NULL,0),


(306,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','0:0:0:0:0:0:0:1','{\"isDeleted\":0,\"param\":{},\"name\":\"\",\"description\":\"jsp图书管理系统\",\"id\":\"3\"}','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:55:00',NULL,0),


(307,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','0:0:0:0:0:0:0:1','{\"isDeleted\":1,\"param\":{},\"name\":\"图书管理系统\",\"description\":\"jsp图书管理系统\",\"id\":\"3\"}','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 02:55:45',NULL,0),


(308,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 03:02:13',NULL,0),


(309,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/1','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 03:02:36',NULL,0),


(310,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 03:04:41',NULL,0),


(311,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','192.168.31.215','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 03:07:48',NULL,0),


(312,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 03:17:48',NULL,0),


(313,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-08 03:23:21',NULL,0),


(314,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 03:28:46',NULL,0),


(315,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"isDeleted\":0,\"createTime\":1691431982000,\"param\":{},\"name\":\"图书管理\",\"description\":\"jsp图书馆官网\",\"updateTime\":1691436545000,\"id\":\"3\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 03:29:37',NULL,0),


(316,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 16:01:49',NULL,0),


(317,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"isDeleted\":0,\"createTime\":1690821033000,\"param\":{},\"name\":\"接口平台\",\"description\":\"接口平台是模仿postman仿写的平台\",\"updateTime\":1691436510000,\"id\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 16:02:02',NULL,0),


(318,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 16:02:30',NULL,0),


(319,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 16:03:04',NULL,0),


(320,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 16:39:27',NULL,0),


(321,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"分配用户\",\"perms\":\"bnt.sysItem.assignItem\",\"id\":\"51\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 20:17:57',NULL,0),


(322,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691497077000,\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691497077000,\"param\":{},\"name\":\"分配成员\",\"perms\":\"bnt.sysItem.assignItem\",\"id\":\"51\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 20:20:34',NULL,0),


(323,'项目成员管理','IMPORT','com.hwj.system.controller.SysUserItemController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserItem/doAssign','0:0:0:0:0:0:0:1','{\"itemId\":\"1\",\"userIdList\":[\"5\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 20:35:40',NULL,0),


(324,'项目成员管理','IMPORT','com.hwj.system.controller.SysUserItemController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserItem/doAssign','127.0.0.1','{\"itemId\":\"1\",\"userIdList\":[\"1\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:09:26',NULL,0),


(325,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:10:36',NULL,0),


(326,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:11:25',NULL,0),


(327,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:11:30',NULL,0),


(328,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:11:31',NULL,0),


(329,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:12:08',NULL,0),


(330,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:12:13',NULL,0),


(331,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:12:14',NULL,0),


(332,'项目成员管理','IMPORT','com.hwj.system.controller.SysUserItemController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserItem/doAssign','127.0.0.1','{\"itemId\":\"1\",\"userIdList\":[\"1\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:12:22',NULL,0),


(333,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:46:33',NULL,0),


(334,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"1\"],\"userId\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:46:39',NULL,0),


(335,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:46:40',NULL,0),


(336,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:46:45',NULL,0),


(337,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:46:46',NULL,0),


(338,'项目成员管理','IMPORT','com.hwj.system.controller.SysUserItemController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserItem/doAssign','127.0.0.1','{\"itemId\":\"1\",\"userIdList\":[\"1\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:46:50',NULL,0),


(339,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:46:54',NULL,0),


(340,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:01',NULL,0),


(341,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:02',NULL,0),


(342,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:08',NULL,0),


(343,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:08',NULL,0),


(344,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"11\",\"12\",\"13\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:23',NULL,0),


(345,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:24',NULL,0),


(346,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:26',NULL,0),


(347,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:38',NULL,0),


(348,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:39',NULL,0),


(349,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:45',NULL,0),


(350,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','hwj1218','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:53',NULL,0),


(351,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:47:57',NULL,0),


(352,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"2\"],\"userId\":\"5\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:51:49',NULL,0),


(353,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"2\"],\"userId\":\"5\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-08 22:52:31',NULL,0),


(354,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-goods\",\"type\":1,\"parentId\":2,\"path\":\"\",\"sortValue\":5,\"component\":\"\",\"param\":{},\"name\":\"接口管理\",\"perms\":\"\",\"id\":\"52\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 00:58:36',NULL,0),


(355,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-goods\",\"updateTime\":1691600316000,\"type\":1,\"parentId\":2,\"path\":\"sysApi\",\"sortValue\":5,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691600316000,\"param\":{},\"name\":\"接口管理\",\"perms\":\"\",\"id\":\"52\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 00:58:55',NULL,0),


(356,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-goods\",\"updateTime\":1691600316000,\"type\":1,\"parentId\":2,\"path\":\"sysApi\",\"sortValue\":5,\"component\":\"system/sysApi/list\",\"isDeleted\":0,\"children\":[],\"createTime\":1691600316000,\"param\":{},\"name\":\"接口管理\",\"perms\":\"\",\"id\":\"52\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 00:59:43',NULL,0),


(357,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysApi.save\",\"id\":\"53\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 01:00:21',NULL,0),


(358,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-10 01:00:24',NULL,0),


(359,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 01:00:37',NULL,0),


(360,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-10 01:00:37',NULL,0),


(361,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"INT\",\"path\":\"/admin/system/sysUser/update\",\"apiName\":\"GetUser\",\"isDeleted\":0,\"param\":{},\"id\":\"1\",\"parameterName\":\"id\",\"httpMethod\":\"PUT\"}','',0,'',NULL,'2023-08-10 01:01:18',NULL,0),


(362,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"INT\",\"path\":\"/admin/system/sysUser/update\",\"apiName\":\"GetUser\",\"isDeleted\":0,\"param\":{},\"id\":\"2\",\"parameterName\":\"id\",\"httpMethod\":\"PUT\"}','',0,'',NULL,'2023-08-10 01:02:29',NULL,0),


(363,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"INT\",\"path\":\"/users/{id}\",\"apiName\":\"GetUser\",\"isDeleted\":0,\"param\":{},\"id\":\"3\",\"parameterName\":\"id\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 01:10:12',NULL,0),


(364,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"INT\",\"path\":\"/users\",\"apiName\":\"GetUser\",\"isDeleted\":0,\"param\":{},\"id\":\"4\",\"parameterName\":\"id\",\"httpMethod\":\"GET\"}','',0,'argument \"content\" is null',NULL,'2023-08-10 01:29:12',NULL,0),


(365,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"INT\",\"path\":\"/users\",\"apiName\":\"Get\",\"isDeleted\":0,\"param\":{},\"id\":\"5\",\"parameterName\":\"id\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 01:30:41',NULL,0),


(366,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-10 18:59:27',NULL,0),


(367,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-goods\",\"updateTime\":1691600316000,\"type\":1,\"parentId\":2,\"path\":\"sysApi\",\"sortValue\":4,\"component\":\"system/sysApi/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"icon\":\"\",\"updateTime\":1691600421000,\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691600421000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysApi.save\",\"id\":\"53\",\"status\":1}],\"createTime\":1691600316000,\"param\":{},\"name\":\"接口管理\",\"perms\":\"\",\"id\":\"52\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 19:00:11',NULL,0),


(368,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"查看列表\",\"perms\":\"bnt.sysApi.list\",\"id\":\"54\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 19:00:50',NULL,0),


(369,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"更新接口\",\"perms\":\"bnt.sysApi.update\",\"id\":\"55\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 19:03:56',NULL,0),


(370,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691665436000,\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691665436000,\"param\":{},\"name\":\"更新\",\"perms\":\"bnt.sysApi.update\",\"id\":\"55\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 19:04:04',NULL,0),


(371,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysApi.remove\",\"id\":\"56\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-10 19:04:52',NULL,0),


(372,'接口管理','DELETE','com.hwj.system.controller.SysApiController.remove()','DELETE','MANAGE','admin','','/admin/system/sysApi/remove/31','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-12 23:24:36',NULL,0),


(373,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:01:01',NULL,0),


(374,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:03:02',NULL,0),


(375,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"message\\\": \\\"用户注册成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"username\\\": \\\"john_doe\\\", \\\"email\\\": \\\"john@example.com\\\", \\\"password\\\": \\\"password123\\\"}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:12:59',NULL,0),


(376,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/login\",\"apiName\":\"用户登录\",\"responseDataStructure\":\"{\\\"token\\\": \\\"示例令牌\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"username\\\": \\\"john_doe\\\", \\\"password\\\": \\\"password123\\\"}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"LoginVo\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:14:26',NULL,0),


(377,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"message\\\": \\\"用户注册成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"username\\\": \\\"john_doe\\\", \\\"email\\\": \\\"john@example.com\\\", \\\"password\\\": \\\"password123\\\"}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"userQueryVo\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:14:47',NULL,0),


(378,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/post/create\",\"apiName\":\"创建文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章创建成功\\\", \\\"post_id\\\": 1, \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"title\\\": \\\"新文章\\\", \\\"content\\\": \\\"这是新文章的内容。\\\"}\",\"updateTime\":1691860106000,\"id\":\"47\",\"parameterName\":\"textQueryVo\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:15:22',NULL,0),


(379,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/api/post/{id}update\",\"apiName\":\"更新文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章更新成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"title\\\": \\\"更新后的文章\\\", \\\"content\\\": \\\"这是更新后的文章内容。\\\"}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, Article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:17:33',NULL,0),


(380,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"message\\\": \\\"用户注册成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"username\\\": \\\"john_doe\\\", \\\"email\\\": \\\"john@example.com\\\", \\\"password\\\": \\\"password123\\\"}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:17:43',NULL,0),


(381,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/login\",\"apiName\":\"用户登录\",\"responseDataStructure\":\"{\\\"token\\\": \\\"示例令牌\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"username\\\": \\\"john_doe\\\", \\\"password\\\": \\\"password123\\\"}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"Login\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:17:50',NULL,0),


(382,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/post/create\",\"apiName\":\"创建文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章创建成功\\\", \\\"post_id\\\": 1, \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"title\\\": \\\"新文章\\\", \\\"content\\\": \\\"这是新文章的内容。\\\"}\",\"updateTime\":1691860106000,\"id\":\"47\",\"parameterName\":\"Article\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:17:58',NULL,0),


(383,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/api/post/{id}/delete\",\"apiName\":\"删除文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章删除成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"id=1\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:19:15',NULL,0),


(384,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"查询参数\",\"path\":\"/api/users\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  UserQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:21:07',NULL,0),


(385,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"message\\\": \\\"用户注册成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"username\\\": \\\"john_doe\\\", \\\"email\\\": \\\"john@example.com\\\", \\\"password\\\": \\\"password123\\\"}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:21:18',NULL,0),


(386,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/api/post/{id}/delete\",\"apiName\":\"删除文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章删除成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:21:45',NULL,0),


(387,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:23:31',NULL,0),


(388,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/api/post/{id}/delete\",\"apiName\":\"删除文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章删除成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"id\\\": 789}\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:26:33',NULL,0),


(389,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,    \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     }\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:31:40',NULL,0),


(390,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,    \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     }\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:31:55',NULL,0),


(391,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{ \\\"message\\\": \\\"用户注册成功\\\",\\n  \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:33:59',NULL,0),


(392,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/login\",\"apiName\":\"用户登录\",\"responseDataStructure\":\"{\\n\\\"token\\\": \\\"示例令牌\\\", \\n\\\"success\\\": true\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"Login\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:34:23',NULL,0),


(393,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\n\\\"message\\\": \\\"用户注册成功\\\", \\n\\\"success\\\": true\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:34:40',NULL,0),


(394,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/post/create\",\"apiName\":\"创建文章\",\"responseDataStructure\":\"{\\n\\\"message\\\": \\\"文章创建成功\\\", \\n \\\"success\\\": true\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"47\",\"parameterName\":\"Article\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:35:19',NULL,0),


(395,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/api/post/{id}/update\",\"apiName\":\"更新文章\",\"responseDataStructure\":\"{\\n\\\"message\\\": \\\"文章更新成功\\\", \\n\\\"success\\\": true\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:38:35',NULL,0),


(396,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\n\\\"message\\\": \\\"用户注册成功\\\", \\n\\\"success\\\": true\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:38:51',NULL,0),


(397,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\n\\\"message\\\": \\\"用户注册成功\\\", \\n\\\"success\\\": true\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:40:32',NULL,0),


(398,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:41:47',NULL,0),


(399,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\n\\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 01:42:12',NULL,0),


(400,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-13 04:06:51',NULL,0),


(401,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-13 07:03:26',NULL,0),


(402,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"sysApi/assignAuth\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"\",\"perms\":\"\",\"id\":\"57\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 07:07:53',NULL,0),


(403,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691881673000,\"type\":2,\"parentId\":52,\"path\":\"api\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1691881673000,\"param\":{},\"name\":\"\",\"perms\":\"\",\"id\":\"57\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 07:08:14',NULL,0),


(404,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1691881673000,\"type\":2,\"parentId\":52,\"path\":\"api\",\"sortValue\":1,\"component\":\"system/sysApi/assignAuth\",\"isDeleted\":0,\"children\":[],\"createTime\":1691881673000,\"param\":{},\"name\":\"\",\"perms\":\"\",\"id\":\"57\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 07:08:45',NULL,0),


(405,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/57','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-13 07:17:00',NULL,0),


(406,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-13 07:19:11',NULL,0),


(407,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"失败\"}',1,'',NULL,'2023-08-13 07:42:55',NULL,0),


(408,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"查询参数为空\"}',1,'',NULL,'2023-08-13 07:47:37',NULL,0),


(409,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"查询参数为空\"}',1,'',NULL,'2023-08-13 07:48:35',NULL,0),


(410,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"查询参数为空\"}',1,'',NULL,'2023-08-13 07:49:00',NULL,0),


(411,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"查询参数为空\"}',1,'',NULL,'2023-08-13 07:49:09',NULL,0),


(412,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"查询参数为空\"}',1,'',NULL,'2023-08-13 07:51:23',NULL,0),


(413,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"查询参数为空\"}',1,'',NULL,'2023-08-13 07:52:06',NULL,0),


(414,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-13 15:47:16',NULL,0),


(415,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-13 15:47:16',NULL,0),


(416,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 15:47:23',NULL,0),


(417,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,         \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     } }\"}',1,'',NULL,'2023-08-13 16:15:13',NULL,0),


(418,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 18:44:34',NULL,0),


(419,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-13 18:45:36',NULL,0),


(420,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 18:45:43',NULL,0),


(421,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 18:47:15',NULL,0),


(422,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,         \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     } }\"}',1,'',NULL,'2023-08-13 18:47:38',NULL,0),


(423,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 18:48:12',NULL,0),


(424,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 18:48:14',NULL,0),


(425,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-13 20:56:04',NULL,0),


(426,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 20:56:11',NULL,0),


(427,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"响应数据结构为空\"}',1,'',NULL,'2023-08-13 20:57:34',NULL,0),


(428,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:00:48',NULL,0),


(429,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:03:59',NULL,0),


(430,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:04:12',NULL,0),


(431,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":201,\"message\":\"接口不存在\"}',1,'',NULL,'2023-08-13 21:04:50',NULL,0),


(432,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:05:24',NULL,0),


(433,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,         \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     } }\"}',1,'',NULL,'2023-08-13 21:05:46',NULL,0),


(434,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-13 21:08:13',NULL,0),


(435,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:08:20',NULL,0),


(436,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:08:59',NULL,0),


(437,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:10:51',NULL,0),


(438,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-13 21:11:06',NULL,0),


(439,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:45:08',NULL,0),


(440,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 01:46:02',NULL,0),


(441,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:46:09',NULL,0),


(442,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:48:11',NULL,0),


(443,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:48:15',NULL,0),


(444,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:48:16',NULL,0),


(445,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:48:17',NULL,0),


(446,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:50:06',NULL,0),


(447,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\"}',1,'',NULL,'2023-08-14 01:51:11',NULL,0),


(448,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:52:54',NULL,0),


(449,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:53:33',NULL,0),


(450,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:55:16',NULL,0),


(451,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:55:42',NULL,0),


(452,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:55:51',NULL,0),


(453,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:55:59',NULL,0),


(454,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:56:03',NULL,0),


(455,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:56:47',NULL,0),


(456,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:57:06',NULL,0),


(457,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:58:19',NULL,0),


(458,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:59:45',NULL,0),


(459,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 01:59:53',NULL,0),


(460,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 02:00:43',NULL,0),


(461,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 02:00:58',NULL,0),


(462,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为空\"}',1,'',NULL,'2023-08-14 02:02:05',NULL,0),


(463,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 02:22:17',NULL,0),


(464,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:22:22',NULL,0),


(465,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:22:34',NULL,0),


(466,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:22:39',NULL,0),


(467,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:27:37',NULL,0),


(468,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:27:47',NULL,0),


(469,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:29:47',NULL,0),


(470,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:31:09',NULL,0),


(471,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:32:50',NULL,0),


(472,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 02:36:49',NULL,0),


(473,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:36:57',NULL,0),


(474,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:39:08',NULL,0),


(475,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:39:27',NULL,0),


(476,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:42:34',NULL,0),


(477,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:42:42',NULL,0),


(478,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 02:50:14',NULL,0),


(479,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:50:21',NULL,0),


(480,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:50:28',NULL,0),


(481,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:51:30',NULL,0),


(482,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 02:55:44',NULL,0),


(483,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 02:57:22',NULL,0),


(484,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:57:33',NULL,0),


(485,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 02:58:13',NULL,0),


(486,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 03:10:53',NULL,0),


(487,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 03:11:07',NULL,0),


(488,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,         \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     } }\"}',1,'',NULL,'2023-08-14 03:15:56',NULL,0),


(489,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 03:16:38',NULL,0),


(490,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 03:16:44',NULL,0),


(491,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 03:16:54',NULL,0),


(492,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 03:21:13',NULL,0),


(493,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 03:21:18',NULL,0),


(494,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 03:21:32',NULL,0),


(495,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 03:23:54',NULL,0),


(496,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 03:24:01',NULL,0),


(497,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 03:24:08',NULL,0),


(498,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 03:25:16',NULL,0),


(499,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 03:25:29',NULL,0),


(500,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 03:26:04',NULL,0),


(501,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 03:27:07',NULL,0),


(502,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"\"}',1,'',NULL,'2023-08-14 03:27:44',NULL,0),


(503,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,         \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     } }\"}',1,'',NULL,'2023-08-14 17:46:51',NULL,0),


(504,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 17:48:29',NULL,0),


(505,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 17:48:40',NULL,0),


(506,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 18:03:55',NULL,0),


(507,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{}\"}',1,'',NULL,'2023-08-14 18:04:00',NULL,0),


(508,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 18:04:11',NULL,0),


(509,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 18:12:27',NULL,0),


(510,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{}\"}',1,'',NULL,'2023-08-14 18:12:33',NULL,0),


(511,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{}\"}',1,'',NULL,'2023-08-14 18:14:17',NULL,0),


(512,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{}\"}',1,'',NULL,'2023-08-14 18:14:44',NULL,0),


(513,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{}\"}',1,'',NULL,'2023-08-14 18:15:18',NULL,0),


(514,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 18:20:48',NULL,0),


(515,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\"}',1,'',NULL,'2023-08-14 18:20:55',NULL,0),


(516,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 18:21:33',NULL,0),


(517,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 18:21:54',NULL,0),


(518,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"message\":\"成功\",\"request\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\"}',1,'',NULL,'2023-08-14 18:25:28',NULL,0),


(519,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 18:44:19',NULL,0),


(520,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":201,\"message\":\"method不是get\"}',1,'',NULL,'2023-08-14 18:45:19',NULL,0),


(521,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"exampleParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\",\"id\":\"50\",\"method\":\"GET\",\"requestParameter\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n    \\\"userQueryVo\\\": {\\n        \\\"id\\\": null,\\n        \\\"username\\\": null,\\n        \\\"email\\\": null,\\n        \\\"age\\\": null,\\n        \\\"is_active\\\": null\\n    }\\n}\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 18:45:38',NULL,0),


(522,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 19:00:31',NULL,0),


(523,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"id\":\"50\",\"method\":\"GET\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:01:57',NULL,0),


(524,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":201,\"message\":\"请求参数为null或者为空\"}',1,'',NULL,'2023-08-14 19:17:17',NULL,0),


(525,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"id\":\"50\",\"method\":\"GET\",\"requestParameter\":\"{     \\\"page\\\": 1,     \\\"limit\\\": 10,     \\\"userQueryVo\\\": {         \\\"id\\\": null,         \\\"username\\\": null,         \\\"email\\\": null,         \\\"age\\\": null,         \\\"is_active\\\": null     } }\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:17:54',NULL,0),


(526,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"id\":\"50\",\"method\":\"GET\",\"requestParameter\":\"{   \\\"id\\\": 123,   \\\"article\\\": {     \\\"title\\\": \\\"更新后的文章\\\",     \\\"content\\\": \\\"这是更新后的文章内容。\\\"   } }\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:23:17',NULL,0),


(527,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"id\":\"50\",\"method\":\"GET\",\"requestParameter\":\"{ id: 123,   article: {title: \\\"更新后的文章\\\",  content: \\\"这是更新后的文章内容\\\"} }\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:24:10',NULL,0),


(528,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"id\":\"50\",\"method\":\"GET\",\"requestParameter\":\"{ id: 123,   article: {title: 更新后的文章,  content: 这是更新后的文章内容} }\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:24:46',NULL,0),


(529,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"id\":\"50\",\"method\":\"GET\",\"requestParameter\":\"{   \\\"apiName\\\": \\\"\\\",   \\\"createTime\\\": \\\"\\\",   \\\"httpMethod\\\": \\\"\\\",   \\\"id\\\": \\\"\\\",   \\\"isDeleted\\\": 0,   \\\"param\\\": {},   \\\"parameterName\\\": \\\"\\\",   \\\"parameterType\\\": \\\"\\\",   \\\"path\\\": \\\"\\\",   \\\"requestParameters\\\": {},   \\\"responseDataStructure\\\": \\\"\\\",   \\\"updateTime\\\": \\\"\\\" }\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:28:33',NULL,0),


(530,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"id\":\"50\",\"method\":\"GET\",\"requestParameter\":\"{ id: 123,   article: {title: 更新后的文章,  content: 这是更新后的文章内容} }\",\"url\":\"/api/users//{page}/{limit}\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:28:42',NULL,0),


(531,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/5','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000},{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"EXPLOITATION\",\"roleName\":\"开发人员\",\"updateTime\":1686836165000},{\"createTime\":1691061567000,\"id\":\"12\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"MONITOR\",\"roleName\":\"运维人员\",\"updateTime\":1691061567000}],\"searchCount\":true,\"size\":5,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:31:22',NULL,0),


(532,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','{\"requestParameter\":{\"email\":\"john@example.com\",\"password\":\"password123\",\"username\":\"john_doe\"},\"method\":\"post\",\"id\":\"45\",\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"id\":\"45\",\"method\":\"post\",\"requestParameter\":{\"username\":\"john_doe\",\"email\":\"john@example.com\",\"password\":\"password123\"},\"url\":\"/api/user/register\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 19:56:50',NULL,0),


(533,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"\",\"path\":\"\",\"apiName\":\"\",\"responseDataStructure\":\"\",\"isDeleted\":0,\"param\":{},\"requestParameters\":{},\"id\":\"\",\"parameterName\":\"\",\"httpMethod\":\"\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"The document is empty.\" at position 0 in value for column \'sys_api.response_data_structure\'.\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_api  ( api_name, path, http_method, parameter_name, parameter_type, response_data_structure, request_parameters,   is_deleted )  VALUES  ( ?, ?, ?, ?, ?, ?, ?,   ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"The document is empty.\" at position 0 in value for column \'sys_api.response_data_structure\'.\n; Data truncation: Invalid JSON text: \"The document is empty.\" at position 0 in value for column \'sys_api.response_data_structure\'.; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"The document is empty.\" at position 0 in value for column \'sys_api.response_data_structure\'.',NULL,'2023-08-14 19:58:55',NULL,0),


(534,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:01',NULL,0),


(535,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:09',NULL,0),


(536,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:09',NULL,0),


(537,'成员管理','UPDATE','com.hwj.system.controller.SysUserController.updateById()','PUT','MANAGE','admin','','/admin/system/sysUser/update','127.0.0.1','{\"updateTime\":1691062106000,\"password\":\"96e79218965eb72c92a549dd5a330112\",\"isDeleted\":0,\"createTime\":1691062106000,\"param\":{},\"phone\":\"18512099486\",\"name\":\"weijin he\",\"id\":\"9\",\"status\":1,\"username\":\"hwj1104\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:26',NULL,0),


(538,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:45',NULL,0),


(539,'角色管理','INSERT','com.hwj.system.controller.SysRoleController.saveRole()','POST','MANAGE','admin','','/admin/system/sysRole/save','127.0.0.1','{\"param\":{}}','',0,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in com/hwj/system/mapper/SysRoleMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysRoleMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_role    VALUES\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1',NULL,'2023-08-14 20:00:47',NULL,0),


(540,'角色管理','INSERT','com.hwj.system.controller.SysRoleController.saveRole()','POST','MANAGE','admin','','/admin/system/sysRole/save','127.0.0.1','{\"param\":{},\"roleCode\":\"11111\",\"roleName\":\"1111\",\"id\":\"14\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:53',NULL,0),


(541,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":3,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":7},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:53',NULL,0),


(542,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/3/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":3,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":3,\"records\":[{\"createTime\":1692014453000,\"id\":\"14\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"11111\",\"roleName\":\"1111\",\"updateTime\":1692014453000}],\"searchCount\":true,\"size\":3,\"total\":7},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:54',NULL,0),


(543,'角色管理','DELETE','com.hwj.system.controller.SysRoleController.deleteById()','DELETE','MANAGE','admin','','/admin/system/sysRole/remove/14','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:57',NULL,0),


(544,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/3/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":3,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:00:57',NULL,0),


(545,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{}}','',0,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in com/hwj/system/mapper/SysItemMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysItemMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_item    VALUES\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1',NULL,'2023-08-14 20:01:02',NULL,0),


(546,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"1111\",\"description\":\"1111\",\"id\":\"4\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:01:06',NULL,0),


(547,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/4','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:01:09',NULL,0),


(548,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','127.0.0.1','{\"parameterType\":\"111\",\"path\":\"1111\",\"apiName\":\"1111\",\"param\":{},\"requestParameters\":\"111\",\"id\":\"51\",\"parameterName\":\"111\",\"httpMethod\":\"111\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:01:20',NULL,0),


(549,'接口管理','DELETE','com.hwj.system.controller.SysApiController.remove()','DELETE','MANAGE','admin','','/admin/system/sysApi/remove/51','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:01:26',NULL,0),


(550,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysUser.save\",\"id\":\"7\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:02:22',NULL,0),


(551,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:02:24',NULL,0),


(552,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:02:47',NULL,0),


(553,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:02:56',NULL,0),


(554,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:02:56',NULL,0),


(555,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:03:38',NULL,0),


(556,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:03:43',NULL,0),


(557,'成员管理','DELETE','com.hwj.system.controller.SysUserController.remove()','DELETE','MANAGE','admin','','/admin/system/sysUser/remove/11','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:04:06',NULL,0),


(558,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"1\",\"path\":\"1\",\"apiName\":\"1111\",\"responseDataStructure\":\"111\",\"param\":{\"1111\":1111},\"requestParameters\":{\"1111\":1111},\"parameterName\":\"1\",\"httpMethod\":\"1111\"}','',0,'\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_api  ( api_name, path, http_method, parameter_name, parameter_type, response_data_structure, request_parameters )  VALUES  ( ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1',NULL,'2023-08-14 20:05:44',NULL,0),


(559,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"1\",\"path\":\"1\",\"apiName\":\"1111\",\"responseDataStructure\":\"111\",\"param\":{\"1111\":1111},\"requestParameters\":{\"1111\":1111},\"parameterName\":\"1\",\"httpMethod\":\"1111\"}','',0,'\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_api  ( api_name, path, http_method, parameter_name, parameter_type, response_data_structure, request_parameters )  VALUES  ( ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xAC\\xED\\x00\\x05sr...\' for column \'request_parameters\' at row 1',NULL,'2023-08-14 20:05:48',NULL,0),


(560,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','127.0.0.1','{\"parameterType\":\"1\",\"path\":\"1\",\"apiName\":\"1\",\"param\":{},\"requestParameters\":\"1\",\"id\":\"52\",\"parameterName\":\"1\",\"httpMethod\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:06:53',NULL,0),


(561,'接口管理','DELETE','com.hwj.system.controller.SysApiController.remove()','DELETE','MANAGE','admin','','/admin/system/sysApi/remove/52','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:06:59',NULL,0),


(562,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','0:0:0:0:0:0:0:1','{\"parameterType\":\"1\",\"apiName\":\"1111\",\"param\":{},\"id\":\"53\",\"parameterName\":\"1\",\"httpMethod\":\"1111\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 20:08:14',NULL,0),


(563,'接口管理','DELETE','com.hwj.system.controller.SysApiController.remove()','DELETE','MANAGE','admin','','/admin/system/sysApi/remove/53','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-14 21:04:58',NULL,0),


(564,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"id\":\"45\",\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"id\":\"45\",\"method\":\"POST\",\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"url\":\"/api/user/register\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 21:55:48',NULL,0),


(565,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"id\":\"45\",\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"id\":\"45\",\"method\":\"POST\",\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"url\":\"/api/user/register\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 22:00:32',NULL,0),


(566,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invoke()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"id\":\"45\",\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册:添加成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-14 22:08:52',NULL,0),


(567,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/api/post/delete{id}\",\"apiName\":\"删除文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章删除成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"id\\\": 789}\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-15 01:54:54',NULL,0),


(568,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":201,\"message\":\"查询参数存在\"}',1,'',NULL,'2023-08-15 01:55:13',NULL,0),


(569,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"id\":\"45\",\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册:成功添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 01:57:02',NULL,0),


(570,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"id\":\"45\",\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"ADD\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"success\":true,\"message\":\"用户注册:成功添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 02:01:53',NULL,0),


(571,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"method\":\"POST\",\"id\":\"47\",\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"创建文章 成功 已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 02:06:54',NULL,0),


(572,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"method\":\"POST\",\"id\":\"47\",\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"创建文章 成功 已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 02:09:38',NULL,0),


(573,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"id\":\"45\",\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功 已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 02:22:32',NULL,0),


(574,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":201,\"message\":\"查询结果不存在\"}',1,'',NULL,'2023-08-15 02:25:54',NULL,0),


(575,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 02:30:21',NULL,0),


(576,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"《红楼梦》\\\",\\n    \\\"content\\\": \\\"贾宝玉\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 02:31:21',NULL,0),


(577,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 20:58:58',NULL,0),


(578,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 21:03:56',NULL,0),


(579,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 21:05:53',NULL,0),


(580,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[\"id\"],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[\"id\"]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 21:07:20',NULL,0),


(581,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[\"id\"],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[\"id\"]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 21:58:34',NULL,0),


(582,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 22:02:18',NULL,0),


(583,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[\"id\"],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[\"id\"]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 22:04:02',NULL,0),


(584,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"id\\\": 123,\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[\"id\"],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[\"id\"]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 22:05:00',NULL,0),


(585,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[\"id\"],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[\"id\"]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 22:05:12',NULL,0),


(586,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[\"id\"],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[\"id\"]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 22:10:36',NULL,0),


(587,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"123\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"123\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 23:07:34',NULL,0),


(588,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"124\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"124\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-15 23:08:01',NULL,0),


(589,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"135\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"更新文章 成功 已修改数据库该数据\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"135\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 01:02:29',NULL,0),


(590,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/api/post/{id}/update\",\"apiName\":\"更新文章\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章更新成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 01:03:25',NULL,0),


(591,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:12:57',NULL,0),


(592,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:14:36',NULL,0),


(593,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:16:23',NULL,0),


(594,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:17:18',NULL,0),


(595,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:22:14',NULL,0),


(596,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:24:03',NULL,0),


(597,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:24:45',NULL,0),


(598,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:27:18',NULL,0),


(599,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户登录 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:30:58',NULL,0),


(600,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"0\",\"requestKey\":[],\"id\":\"47\",\"pathParameter\":[],\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"创建文章 成功0已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:31:32',NULL,0),


(601,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\" \",\"requestKey\":\"1\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功 已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:33:12',NULL,0),


(602,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"\\n\",\"requestKey\":\"1\",\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户登录 成功\\n已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:33:34',NULL,0),


(603,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"{\",\"requestKey\":\"0\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功{已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:35:47',NULL,0),


(604,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"{\",\"requestKey\":\"0\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功{已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:35:57',NULL,0),


(605,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"{\",\"requestKey\":\"0\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功{已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:36:11',NULL,0),


(606,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"{\",\"requestKey\":\"0\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功{已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:38:16',NULL,0),


(607,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"{\",\"requestKey\":\"0\",\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户登录 成功{已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:38:50',NULL,0),


(608,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"john_doe\",\"requestKey\":\"username\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册 成功john_doe已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:40:29',NULL,0),


(609,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"\\\"1111111\\\"\",\"method\":\"POST\",\"requestValue\":\"1\",\"requestKey\":\"0\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户注册成功1已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:41:56',NULL,0),


(610,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"john_doe\",\"requestKey\":\"username\",\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"用户登录成功john_doe已添加到数据库\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:45:24',NULL,0),


(611,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"john_doe\",\"requestKey\":\"username\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:51:59',NULL,0),


(612,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"john_doe\",\"requestKey\":\"username\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe     用户注册   成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:53:06',NULL,0),


(613,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"《红楼梦》\\\", \\n\\\"content\\\": \\\"贾宝玉和林黛玉。\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"《红楼梦》\",\"requestKey\":\"title\",\"id\":\"47\",\"pathParameter\":[],\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"《红楼梦》     创建文章   成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:54:18',NULL,0),


(614,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/post/create\",\"apiName\":\"文章创建\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章创建成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"47\",\"parameterName\":\"Article\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:55:27',NULL,0),


(615,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/api/post/{id}/update\",\"apiName\":\"文章更新\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章更新成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:55:49',NULL,0),


(616,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/api/post/delete{id}\",\"apiName\":\"文章删除\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章删除成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"id\\\": 789}\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:56:04',NULL,0),


(617,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"john_doe\",\"requestKey\":\"username\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe     用户注册   成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 03:59:35',NULL,0),


(618,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"requestValue\":[{\"title\":\"更新后的文章\",\"content\":\"这是更新后的文章内容。\"}],\"requestKey\":[\"article\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"333\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [article]修改成[{title=更新后的文章, content=这是更新后的文章内容。}]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"333\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:02:29',NULL,0),


(619,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"requestValue\":[{\"title\":\"更新后的文章\",\"content\":\"这是更新后的文章内容。\"}],\"requestKey\":[\"article\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [article]修改成[{title=更新后的文章, content=这是更新后的文章内容。}]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:05:29',NULL,0),


(620,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"requestValue\":\"[object Object],\",\"requestKey\":\"article,\",\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   article,修改成[object Object],\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:07:48',NULL,0),


(621,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n  \\\"article\\\": {\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[{\"value\":{\"title\":\"更新后的文章\",\"content\":\"这是更新后的文章内容。\"},\"key\":\"article\"}],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [{key=article, value={title=更新后的文章, content=这是更新后的文章内容。}}]修改成[]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:09:00',NULL,0),


(622,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/api/post/{id}/update\",\"apiName\":\"文章更新\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章更新成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  }\\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:11:15',NULL,0),


(623,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/api/post/{id}/update\",\"apiName\":\"文章更新\",\"responseDataStructure\":\"{\\\"message\\\": \\\"文章更新成功\\\", \\\"success\\\": true}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:14:34',NULL,0),


(624,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [title, content]修改成[更新后的文章, 这是更新后的文章内容。]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:15:48',NULL,0),


(625,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\",\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\",\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [title, content, title, content]修改成[更新后的文章, 这是更新后的文章内容。, 更新后的文章, 这是更新后的文章内容。]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:21:33',NULL,0),


(626,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"123\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [title, content]修改成[更新后的文章, 这是更新后的文章内容。]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"123\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:22:12',NULL,0),


(627,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [title, content]:修改成[更新后的文章, 这是更新后的文章内容。]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:23:51',NULL,0),


(628,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章删除 成功删除[{name=id, value=1111}]该数据库的\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:31:36',NULL,0),


(629,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章删除 成功删除该数据\",\"SELECT\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:34:35',NULL,0),


(630,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:38:09',NULL,0),


(631,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"john_doe\",\"requestKey\":\"username\",\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe 用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:44:27',NULL,0),


(632,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\n  \\\"code\\\": 200,\\n  \\\"message\\\": \\\"成功\\\",\\n  \\\"data\\\": {\\n    \\\"success\\\": true,\\n    \\\"message\\\": \\\"john_doe 用户注册成功\\\"\\n  }\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:45:48',NULL,0),


(633,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"john_doe\",\"requestKey\":\"username\",\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe 用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:46:07',NULL,0),


(634,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/login\",\"apiName\":\"用户登录\",\"responseDataStructure\":\"{\\n  \\\"code\\\": 200,\\n  \\\"message\\\": \\\"成功\\\",\\n  \\\"data\\\": {\\n    \\\"success\\\": true,\\n    \\\"message\\\": \\\"john_doe 用户登录成功\\\"\\n  }\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"Login\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:46:20',NULL,0),


(635,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"method\":\"POST\",\"requestValue\":\"新文章\",\"requestKey\":\"title\",\"id\":\"47\",\"pathParameter\":[],\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"新文章 文章创建成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:46:30',NULL,0),


(636,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/post/create\",\"apiName\":\"文章创建\",\"responseDataStructure\":\"{\\n  \\\"code\\\": 200,\\n  \\\"message\\\": \\\"成功\\\",\\n  \\\"data\\\": {\\n    \\\"success\\\": true,\\n    \\\"message\\\": \\\"新文章 文章创建成功\\\"\\n  }\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"47\",\"parameterName\":\"Article\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:46:45',NULL,0),


(637,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   [title, content]:修改成[更新后的文章, 这是更新后的文章内容。]\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:47:15',NULL,0),


(638,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/api/post/{id}/update\",\"apiName\":\"文章更新\",\"responseDataStructure\":\"\\n{\\n  \\\"code\\\": 200,\\n  \\\"message\\\": \\\"成功\\\",\\n  \\\"data\\\": {\\n    \\\"success\\\": true,\\n    \\\"message\\\": \\\"文章更新   [title, content]:修改成[更新后的文章, 这是更新后的文章内容。]\\\",\\n    \\\"pathParameter\\\": [\\n      {\\n        \\\"name\\\": \\\"id\\\",\\n        \\\"value\\\": \\\"1\\\"\\n      }\\n    ]\\n  }\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:47:33',NULL,0),


(639,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章删除 成功删除该数据\",\"SELECT\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:47:46',NULL,0),


(640,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/api/post/delete{id}\",\"apiName\":\"文章删除\",\"responseDataStructure\":\"{\\n  \\\"code\\\": 200,\\n  \\\"message\\\": \\\"成功\\\",\\n  \\\"data\\\": {\\n    \\\"success\\\": true,\\n    \\\"message\\\": \\\"文章删除 成功删除该数据\\\",\\n    \\\"SELECT\\\": [\\n      {\\n        \\\"name\\\": \\\"id\\\",\\n        \\\"value\\\": \\\"111\\\"\\n      }\\n    ]\\n  }\\n}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"id\\\": 789}\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-16 04:48:04',NULL,0),


(641,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe 用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 23:47:18',NULL,0),


(642,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe 用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 23:47:55',NULL,0),


(643,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"文章更新   content:修改成这是更新后的文章内容。\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 23:51:41',NULL,0),


(644,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"message\":\"title:修改成更新后的文章\"},{\"message\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-16 23:59:00',NULL,0),


(645,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','127.0.0.1','{\"parameterType\":\"List\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量输出\",\"param\":{},\"requestParameters\":\"[1,2]\",\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"delete\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:28:09',NULL,0),


(646,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"List\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量输出\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"[1,2]\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:29:14',NULL,0),


(647,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE-LIST\":\"[1,2]\",\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:29:18',NULL,0),


(648,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE-LIST\":\"\",\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:34:56',NULL,0),


(649,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"List\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量输出\",\"responseDataStructure\":\"{\\n  \\\"code\\\": 200,\\n  \\\"message\\\": \\\"成功\\\",\\n  \\\"data\\\": {\\n    \\\"DELETE-LIST\\\": \\\"\\\",\\n    \\\"success\\\": true,\\n    \\\"message\\\": \\\"文章批量输出 成功\\\"\\n  }\\n}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"[1,2]\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:35:13',NULL,0),


(650,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE-LIST\":\"\",\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:35:28',NULL,0),


(651,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE-LIST\":\"\",\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:38:04',NULL,0),


(652,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE-LIST\":\"\",\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:39:20',NULL,0),


(653,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE-LIST\":\"\",\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:39:40',NULL,0),


(654,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE-LIST\":\"\",\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:40:36',NULL,0),


(655,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"2\"}],\"REQUEST\":[],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:46:56',NULL,0),


(656,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"2\"}],\"REQUEST\":[],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:46:56',NULL,0),


(657,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":[]},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:49:11',NULL,0),


(658,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":[]},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:49:11',NULL,0),


(659,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"success\":true,\"message\":\"文章批量输出 成功\",\"REQ\":\"[1,2]\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:49:38',NULL,0),


(660,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"success\":true,\"message\":\"文章批量输出 成功\",\"REQ\":\"[1,2]\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:51:04',NULL,0),


(661,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"success\":true,\"message\":\"文章批量输出 成功\",\"REQ\":\"1\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:52:32',NULL,0),


(662,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:53:18',NULL,0),


(663,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:53:19',NULL,0),


(664,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:54:38',NULL,0),


(665,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:54:38',NULL,0),


(666,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:54:44',NULL,0),


(667,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:54:44',NULL,0),


(668,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:55:13',NULL,0),


(669,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:56:14',NULL,0),


(670,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 01:56:14',NULL,0),


(671,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":[]},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:10:34',NULL,0),


(672,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\",\"REQ\":\"\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:12:06',NULL,0),


(673,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"请求参数\":\"\",\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:13:32',NULL,0),


(674,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"请求参数\":\"\",\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:13:57',NULL,0),


(675,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"22\"}],\"success\":true,\"请求参数\":[],\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:17:08',NULL,0),


(676,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"success\":true,\"请求参数\":\"[1,2]\",\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:17:23',NULL,0),


(677,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"success\":true,\"请求参数\":\"[1,2]\",\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:18:08',NULL,0),


(678,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"请求参数\":[],\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:22:26',NULL,0),


(679,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE2\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"请求参数\":[],\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:23:20',NULL,0),


(680,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE2\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"请求参数\":[],\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:23:59',NULL,0),


(681,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE2\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"请求参数\":{},\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:24:10',NULL,0),


(682,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"请求参数\":{},\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:29:05',NULL,0),


(683,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"请求参数\":{},\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:32:02',NULL,0),


(684,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"11\"}],\"success\":true,\"请求参数\":[{}],\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:38:55',NULL,0),


(685,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"请求参数\":[\"\"],\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:39:52',NULL,0),


(686,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:42:00',NULL,0),


(687,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"success\":true,\"请求参数\":[\"[1,12,111]\"],\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:42:54',NULL,0),


(688,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:46:37',NULL,0),


(689,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:47:09',NULL,0),


(690,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:49:27',NULL,0),


(691,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:49:40',NULL,0),


(692,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:49:53',NULL,0),


(693,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"新文章\",\"这是新文章的内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"47\",\"pathParameter\":[],\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"新文章    文章创建成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:50:05',NULL,0),


(694,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"新文章\",\"这是新文章的内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"123\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATEDEtAIL\":\"title:修改成新文章\"},{\"UPDATEDEtAIL\":\"content:修改成这是新文章的内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"123\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:50:20',NULL,0),


(695,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:50:34',NULL,0),


(696,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"REQBADY\":[\"[1,2,1111]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 02:50:50',NULL,0),


(697,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 23:51:18',NULL,0),


(698,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 23:51:35',NULL,0),


(699,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[\"[1,2]\"],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 23:54:37',NULL,0),


(700,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 23:56:10',NULL,0),


(701,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-17 23:57:14',NULL,0),


(702,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"234\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:03:02',NULL,0),


(703,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:03:15',NULL,0),


(704,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:03:37',NULL,0),


(705,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:04:59',NULL,0),


(706,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:05:10',NULL,0),


(707,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:08:00',NULL,0),


(708,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"PATH\":[[]],\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:08:12',NULL,0),


(709,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:12:44',NULL,0),


(710,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:12:57',NULL,0),


(711,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:15:59',NULL,0),


(712,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:16:12',NULL,0),


(713,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"新文章\",\"这是新文章的内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"47\",\"pathParameter\":[],\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"新文章    文章创建成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:21:45',NULL,0),


(714,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:22:04',NULL,0),


(715,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:23:48',NULL,0),


(716,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-document-remove\",\"updateTime\":1687426453000,\"type\":1,\"parentId\":34,\"path\":\"sysOperLog\",\"sortValue\":7,\"component\":\"system/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1687426463000,\"type\":2,\"parentId\":30,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":\"31\",\"status\":1},{\"select\":false,\"icon\":\"\",\"updateTime\":1687440437000,\"type\":2,\"parentId\":30,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687440437000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysOperLog.delete\",\"id\":\"42\",\"status\":1},{\"select\":false,\"icon\":\"\",\"updateTime\":1687440465000,\"type\":2,\"parentId\":30,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687440465000,\"param\":{},\"name\":\"批量删除\",\"perms\":\"bnt.sysOperLog.batchRemove\",\"id\":\"43\",\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作记录\",\"perms\":\"\",\"id\":\"30\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:29:08',NULL,0),


(717,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-goods\",\"updateTime\":1654738764000,\"type\":1,\"parentId\":34,\"path\":\"sysLoginLog\",\"sortValue\":8,\"component\":\"system/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654738596000,\"type\":2,\"parentId\":32,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysLoginLog.list\",\"id\":\"33\",\"status\":1},{\"select\":false,\"icon\":\"\",\"updateTime\":1687440492000,\"type\":2,\"parentId\":32,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687440492000,\"param\":{},\"name\":\"批量删除\",\"perms\":\"bnt.sysLoginLog.batchRemove\",\"id\":\"44\",\"status\":1},{\"select\":false,\"icon\":\"\",\"updateTime\":1687440567000,\"type\":2,\"parentId\":32,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687440567000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysLoginLog.delete\",\"id\":\"45\",\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录记录\",\"perms\":\"\",\"id\":\"32\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:29:15',NULL,0),


(718,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:30:55',NULL,0),


(719,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"isDeleted\":0,\"createTime\":1690821033000,\"param\":{},\"name\":\"接口平台\",\"description\":\"模仿postman的\",\"updateTime\":1691436510000,\"id\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 00:31:17',NULL,0),


(720,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:23:22',NULL,0),


(721,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:24:19',NULL,0),


(722,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','',0,'com.alibaba.fastjson.JSONArray cannot be cast to com.alibaba.fastjson.JSONObject',NULL,'2023-08-18 03:24:46',NULL,0),


(723,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','',0,'com.alibaba.fastjson.JSONArray cannot be cast to com.alibaba.fastjson.JSONObject',NULL,'2023-08-18 03:25:43',NULL,0),


(724,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','',0,'com.alibaba.fastjson.JSONArray cannot be cast to com.alibaba.fastjson.JSONObject',NULL,'2023-08-18 03:25:52',NULL,0),


(725,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe 用户登录成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-18 03:26:16',NULL,0),


(726,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"code: 200\\ndata:\\n  message: john_doe 用户登录成功\\n  success: true\\nmessage: 成功\\n\"',1,'',NULL,'2023-08-18 03:26:23',NULL,0),


(727,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe 用户登录成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-18 03:26:30',NULL,0),


(728,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?> <info> \\t<code>200</code> \\t<data> \\t\\t<success>true</success> \\t\\t<message>john_doe 用户登录成功</message> \\t</data> \\t<message>成功</message> </info>\"',1,'',NULL,'2023-08-18 03:26:38',NULL,0),


(729,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe 用户登录成功\\\"},\\\"message\\\":\\\"成功\\\"}}\"',1,'',NULL,'2023-08-18 03:26:43',NULL,0),


(730,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe 用户登录成功\\n  message: 成功\\n\"',1,'',NULL,'2023-08-18 03:26:49',NULL,0),


(731,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:26:57',NULL,0),


(732,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:28:07',NULL,0),


(733,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:28:12',NULL,0),


(734,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:28:18',NULL,0),


(735,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:28:19',NULL,0),


(736,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:28:30',NULL,0),


(737,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:28:40',NULL,0),


(738,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:30:30',NULL,0),


(739,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:30:56',NULL,0),


(740,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:31:06',NULL,0),


(741,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:33:28',NULL,0),


(742,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:35:37',NULL,0),


(743,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:38:06',NULL,0),


(744,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:38:11',NULL,0),


(745,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:41:06',NULL,0),


(746,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:41:09',NULL,0),


(747,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:41:09',NULL,0),


(748,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/jsonToXml','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 03:41:45',NULL,0),


(749,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:47:38',NULL,0),


(750,'成员管理','UPDATE','com.hwj.system.controller.SysUserController.updateById()','PUT','MANAGE','admin','','/admin/system/sysUser/update','127.0.0.1','{\"updateTime\":1692301678000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"isDeleted\":0,\"createTime\":1692301678000,\"param\":{},\"phone\":\"11111111110\",\"name\":\"何伟健\",\"id\":\"12\",\"status\":1,\"username\":\"hwj1211111\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:08',NULL,0),


(751,'成员管理','DELETE','com.hwj.system.controller.SysUserController.remove()','DELETE','MANAGE','admin','','/admin/system/sysUser/remove/12','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:16',NULL,0),


(752,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:18',NULL,0),


(753,'角色管理','INSERT','com.hwj.system.controller.SysRoleController.saveRole()','POST','MANAGE','admin','','/admin/system/sysRole/save','127.0.0.1','{\"param\":{},\"roleCode\":\"111\",\"roleName\":\"111\",\"id\":\"15\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:23',NULL,0),


(754,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":3,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":7},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:24',NULL,0),


(755,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":3,\"records\":[{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"EXPLOITATION\",\"roleName\":\"开发人员\",\"updateTime\":1686836165000},{\"createTime\":1691061567000,\"id\":\"12\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"MONITOR\",\"roleName\":\"运维人员\",\"updateTime\":1691061567000},{\"createTime\":1691164934000,\"id\":\"13\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"PROJECT MANAGER\",\"roleName\":\"项目经理\",\"updateTime\":1691164934000}],\"searchCount\":true,\"size\":3,\"total\":7},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:25',NULL,0),


(756,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/3/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":3,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":3,\"records\":[{\"createTime\":1692301703000,\"id\":\"15\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"111\",\"roleName\":\"111\",\"updateTime\":1692301703000}],\"searchCount\":true,\"size\":3,\"total\":7},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:26',NULL,0),


(757,'角色管理','UPDATE','com.hwj.system.controller.SysRoleController.updateRole()','POST','MANAGE','admin','','/admin/system/sysRole/update','127.0.0.1','{\"isDeleted\":0,\"createTime\":1692301703000,\"param\":{},\"roleCode\":\"11111\",\"roleName\":\"111\",\"updateTime\":1692301703000,\"id\":\"15\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:30',NULL,0),


(758,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/3/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":3,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":3,\"records\":[{\"createTime\":1692301703000,\"id\":\"15\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"11111\",\"roleName\":\"111\",\"updateTime\":1692301703000}],\"searchCount\":true,\"size\":3,\"total\":7},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:31',NULL,0),


(759,'角色管理','DELETE','com.hwj.system.controller.SysRoleController.deleteById()','DELETE','MANAGE','admin','','/admin/system/sysRole/remove/15','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:33',NULL,0),


(760,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/3/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":3,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:33',NULL,0),


(761,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"111\",\"description\":\"111\",\"id\":\"5\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:41',NULL,0),


(762,'项目管理','UPDATE','com.hwj.system.controller.SysItemController.updateById()','PUT','MANAGE','admin','','/admin/system/sysItem/update','127.0.0.1','{\"isDeleted\":0,\"createTime\":1692301721000,\"param\":{},\"name\":\"111\",\"description\":\"11111\",\"updateTime\":1692301721000,\"id\":\"5\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:46',NULL,0),


(763,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/5','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:48:48',NULL,0),


(764,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"调用post接口\",\"perms\":\"bnt.sysApi.invokePost\",\"id\":\"58\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:49:50',NULL,0),


(765,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"调用put接口\",\"perms\":\"bnt.sysApi.invokePost\",\"id\":\"59\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:50:46',NULL,0),


(766,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"调用delete接口\",\"perms\":\"bnt.sysApi.invokeDelete\",\"id\":\"60\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:51:17',NULL,0),


(767,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692301877000,\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1692301877000,\"param\":{},\"name\":\"调用delete接口\",\"perms\":\"bnt.sysApi.invokeDelete\",\"id\":\"60\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:51:41',NULL,0),


(768,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692301877000,\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1692301877000,\"param\":{},\"name\":\"调用del接口\",\"perms\":\"bnt.sysApi.invokeDelete\",\"id\":\"60\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:51:56',NULL,0),


(769,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"修改格式\",\"perms\":\"bnt.sysApi.format\",\"id\":\"61\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:52:22',NULL,0),


(770,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:52:26',NULL,0),


(771,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"58\",\"59\",\"60\",\"61\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:52:34',NULL,0),


(772,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 03:52:35',NULL,0),


(773,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:01:43',NULL,0),


(774,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:01:54',NULL,0),


(775,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:02:03',NULL,0),


(776,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:06:07',NULL,0),


(777,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:06:12',NULL,0),


(778,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:06:34',NULL,0),


(779,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:09:04',NULL,0),


(780,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:10:01',NULL,0),


(781,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:12:13',NULL,0),


(782,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:12:25',NULL,0),


(783,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:13:57',NULL,0),


(784,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:19:27',NULL,0),


(785,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:21:00',NULL,0),


(786,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 04:23:18',NULL,0),


(787,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 16:08:47',NULL,0),


(788,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:28:57',NULL,0),


(789,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:30:51',NULL,0),


(790,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:31:28',NULL,0),


(791,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:32:44',NULL,0),


(792,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:37:01',NULL,0),


(793,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:38:23',NULL,0),


(794,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:38:51',NULL,0),


(795,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:41:00',NULL,0),


(796,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:44:33',NULL,0),


(797,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:49:05',NULL,0),


(798,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:50:11',NULL,0),


(799,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:51:25',NULL,0),


(800,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:53:17',NULL,0),


(801,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 19:54:48',NULL,0),


(802,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 20:08:22',NULL,0),


(803,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 20:16:22',NULL,0),


(804,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 20:18:47',NULL,0),


(805,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 20:19:10',NULL,0),


(806,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 20:19:31',NULL,0),


(807,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 20:19:39',NULL,0),


(808,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 20:28:51',NULL,0),


(809,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-18 20:28:54',NULL,0),


(810,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-18 20:29:05',NULL,0),


(811,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-18 20:29:15',NULL,0),


(812,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-18 20:50:50',NULL,0),


(813,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<password>password123</password>\\n\\t<username>john_doe</username>\\n</info>\\n\"',1,'',NULL,'2023-08-18 21:50:45',NULL,0),


(814,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"{ \\\"username\\\": \\\"john_doe\\\",  \\\"password\\\": \\\"password123\\\" }\"',1,'',NULL,'2023-08-18 21:50:51',NULL,0),


(815,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"username: john_doe\\npassword: password123\\n\"',1,'',NULL,'2023-08-18 21:50:56',NULL,0),


(816,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<password>password123</password>\\n\\t<username>john_doe</username>\\n</info>\\n\"',1,'',NULL,'2023-08-18 21:51:03',NULL,0),


(817,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"<info> \\t<password>password123</password> \\t<username>john_doe</username> </info>\"',1,'',NULL,'2023-08-18 21:51:11',NULL,0),


(818,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"{\\\"RESULT\\\":{\\\"password\\\":\\\"password123\\\",\\\"username\\\":\\\"john_doe\\\"}}\"',1,'',NULL,'2023-08-18 21:51:16',NULL,0),


(819,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"RESULT:\\n  password: password123\\n  username: john_doe\\n\"',1,'',NULL,'2023-08-18 21:51:22',NULL,0),


(820,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"{\\\"RESULT\\\":{\\\"password\\\":\\\"password123\\\",\\\"username\\\":\\\"john_doe\\\"}}\"',1,'',NULL,'2023-08-18 21:51:38',NULL,0),


(821,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"RESULT:\\n  password: password123\\n  username: john_doe\\n\"',1,'',NULL,'2023-08-18 21:51:49',NULL,0),


(822,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 21:51:56',NULL,0),


(823,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 21:52:29',NULL,0),


(824,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-18 21:52:33',NULL,0),


(825,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-18 21:55:48',NULL,0),


(826,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"333\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 05:10:29',NULL,0),


(827,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 05:13:11',NULL,0),


(828,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 05:15:19',NULL,0),


(829,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 05:16:51',NULL,0),


(830,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 05:17:54',NULL,0),


(831,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 05:18:22',NULL,0),


(832,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"code: 200\\nmessage: 成功\\ndata:\\n  DELETE:\\n  - name: id\\n    value: \'111\'\\n  success: true\\n  message: 文章删除 成功\\n\"',1,'',NULL,'2023-08-19 05:18:29',NULL,0),


(833,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"code: 200\\nmessage: 成功\\ndata:\\n  DELETE:\\n  - name: id\\n    value: \'111\'\\n  success: true\\n  message: 文章删除 成功\\n\"',1,'',NULL,'2023-08-19 07:10:02',NULL,0),


(834,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t\\t<object>\\n\\t\\t\\t\\t<name>id</name>\\n\\t\\t\\t\\t<value>111</value>\\n\\t\\t\\t</object>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-19 07:10:08',NULL,0),


(835,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 07:10:26',NULL,0),


(836,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 07:10:53',NULL,0),


(837,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t\\t<object>\\n\\t\\t\\t\\t<name>id</name>\\n\\t\\t\\t\\t<value>111</value>\\n\\t\\t\\t</object>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-19 07:10:59',NULL,0),


(838,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 07:11:06',NULL,0),


(839,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 07:13:50',NULL,0),


(840,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 07:14:58',NULL,0),


(841,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 07:15:29',NULL,0),


(842,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"格式错误\"',1,'',NULL,'2023-08-19 07:18:06',NULL,0),


(843,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"DELETE\\\":{\\\"object\\\":{\\\"name\\\":\\\"id\\\",\\\"value\\\":\\\"111\\\"}},\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"文章删除 成功\\\"},\\\"message\\\":\\\"成功\\\"}}\"',1,'',NULL,'2023-08-19 07:18:27',NULL,0),


(844,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE:\\n      object:\\n        name: id\\n        value: \'111\'\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\"',1,'',NULL,'2023-08-19 07:20:08',NULL,0),


(845,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"RESULT:   code: \'200\'   data:     DELETE:       object:         name: id         value: \'111\'     success: \'true\'     message: 文章删除 成功   message: 成功\"',1,'',NULL,'2023-08-19 07:20:18',NULL,0),


(846,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','',0,'syntax error, pos 1, line 1, column 2RESULT:   code: \'200\'   data:     DELETE:       object:         name: id         value: \'111\'     success: \'true\'     message: 文章删除 成功   message: 成功',NULL,'2023-08-19 07:20:25',NULL,0),


(847,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','\"RESULT:   code: \'200\'   data:     DELETE:       object:         name: id         value: \'111\'     success: \'true\'     message: 文章删除 成功   message: 成功\"',1,'',NULL,'2023-08-19 07:20:31',NULL,0),


(848,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:28:06',NULL,0),


(849,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:35:37',NULL,0),


(850,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户登录成功\\\"}}\"',1,'',NULL,'2023-08-19 07:35:39',NULL,0),


(851,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<success>true</success>\\n\\t<message>john_doe    用户登录成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-19 07:35:45',NULL,0),


(852,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户登录成功\\\"}\"',1,'',NULL,'2023-08-19 07:35:49',NULL,0),


(853,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"success: true\\nmessage: john_doe    用户登录成功\\n\"',1,'',NULL,'2023-08-19 07:35:54',NULL,0),


(854,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:36:10',NULL,0),


(855,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户登录成功\\n\"',1,'',NULL,'2023-08-19 07:36:12',NULL,0),


(856,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户登录成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-19 07:36:15',NULL,0),


(857,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户登录成功\\\"}}\"',1,'',NULL,'2023-08-19 07:36:19',NULL,0),


(858,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:38:02',NULL,0),


(859,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\"',1,'',NULL,'2023-08-19 07:38:10',NULL,0),


(860,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"新文章\",\"这是新文章的内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"47\",\"pathParameter\":[],\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"新文章    文章创建成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:39:24',NULL,0),


(861,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:41:11',NULL,0),


(862,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:43:23',NULL,0),


(863,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:51:57',NULL,0),


(864,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:53:12',NULL,0),


(865,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:54:20',NULL,0),


(866,'成员管理','DELETE','com.hwj.system.controller.SysUserController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysUser/updateStatus/1/0','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:59:18',NULL,0),


(867,'成员管理','DELETE','com.hwj.system.controller.SysUserController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysUser/updateStatus/1/1','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:59:19',NULL,0),


(868,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 07:59:28',NULL,0),


(869,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:04:39',NULL,0),


(870,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:07:22',NULL,0),


(871,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"47\",\"pathParameter\":[],\"url\":\"/api/post/create\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    文章创建成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:09:32',NULL,0),


(872,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:09:54',NULL,0),


(873,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:13:19',NULL,0),


(874,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:16:01',NULL,0),


(875,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:18:01',NULL,0),


(876,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:18:40',NULL,0),


(877,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:20:46',NULL,0),


(878,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692301846000,\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1692301846000,\"param\":{},\"name\":\"调用put接口\",\"perms\":\"\'bnt.sysApi.invokePut\",\"id\":\"59\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:21:33',NULL,0),


(879,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:22:35',NULL,0),


(880,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:23:11',NULL,0),


(881,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:23:13',NULL,0),


(882,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692301846000,\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1692301846000,\"param\":{},\"name\":\"调用put接口\",\"perms\":\"bnt.sysApi.invokePut\",\"id\":\"59\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:23:58',NULL,0),


(883,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692301846000,\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1692301846000,\"param\":{},\"name\":\"调用put接口\",\"perms\":\"bnt.sysApi.invokePut\",\"id\":\"59\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:25:21',NULL,0),


(884,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:26:26',NULL,0),


(885,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:26:29',NULL,0),


(886,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:26:34',NULL,0),


(887,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:27:11',NULL,0),


(888,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:28:57',NULL,0),


(889,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"1\"],\"userId\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:29:05',NULL,0),


(890,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:29:07',NULL,0),


(891,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"58\",\"59\",\"60\",\"61\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:29:12',NULL,0),


(892,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:29:12',NULL,0),


(893,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:29:24',NULL,0),


(894,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:30:52',NULL,0),


(895,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:34:21',NULL,0),


(896,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:34:53',NULL,0),


(897,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:35:07',NULL,0),


(898,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"null<code>200</code>\\nnull<data>\\nnull\\t<success>true</success>\\nnull\\t<message>john_doe    用户注册成功</message>\\nnull</data>\\nnull<message>成功</message>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 08:35:10',NULL,0),


(899,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:48:27',NULL,0),


(900,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:48:54',NULL,0),


(901,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:50:30',NULL,0),


(902,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:50:57',NULL,0),


(903,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:50:59',NULL,0),


(904,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:51:02',NULL,0),


(905,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:51:04',NULL,0),


(906,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"2\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:51:25',NULL,0),


(907,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"333\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:53:02',NULL,0),


(908,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t\\t<object>\\n\\t\\t\\t\\t<name>id</name>\\n\\t\\t\\t\\t<value>333</value>\\n\\t\\t\\t</object>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:53:50',NULL,0),


(909,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  DELETE:\\n  - name: id\\n    value: \'333\'\\n  success: true\\n  message: 文章删除 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:54:14',NULL,0),


(910,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:59:01',NULL,0),


(911,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"%7B%22code%22%3A200%2C%22message%22%3A%22%E6%88%90%E5%8A%9F%22%2C%22data%22%3A%7B%22success%22%3Atrue%2C%22message%22%3A%22john_doe%20%20%20%20%E7%94%A8%E6%88%B7%E6%B3%A8%E5%86%8C%E6%88%90%E5%8A%9F%22%7D%7D\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:59:03',NULL,0),


(912,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'syntax error, pos 1, line 1, column 2%22%257B%2522code%2522%253A200%252C%2522message%2522%253A%2522%25E6%2588%2590%25E5%258A%259F%2522%252C%2522data%2522%253A%257B%2522success%2522%253Atrue%252C%2522message%2522%253A%2522john_doe%2520%2520%2520%2520%25E7%2594%25A8%25E6%2588%25B7%25E6%25B3%25A8%25E5%2586%258C%25E6%2588%2590%25E5%258A%259F%2522%257D%257D%22',NULL,'2023-08-19 10:59:10',NULL,0),


(913,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"22\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 10:59:20',NULL,0),


(914,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'syntax error, pos 1, line 1, column 2%7B%22code%22%3A200%2C%22message%22%3A%22%E6%88%90%E5%8A%9F%22%2C%22data%22%3A%7B%22DELETE%22%3A%5B%7B%22name%22%3A%22id%22%2C%22value%22%3A%2222%22%7D%5D%2C%22success%22%3Atrue%2C%22message%22%3A%22%E6%96%87%E7%AB%A0%E5%88%A0%E9%99%A4%20%E6%88%90%E5%8A%9F%22%7D%7D',NULL,'2023-08-19 10:59:22',NULL,0),


(915,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:00:38',NULL,0),


(916,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'syntax error, pos 1, line 1, column 2%7B%22success%22%3Atrue%2C%22message%22%3A%22john_doe%20%20%20%20%E7%94%A8%E6%88%B7%E6%B3%A8%E5%86%8C%E6%88%90%E5%8A%9F%22%7D',NULL,'2023-08-19 11:00:42',NULL,0),


(917,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:01:00',NULL,0),


(918,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:01:03',NULL,0),


(919,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:01:58',NULL,0),


(920,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:02:01',NULL,0),


(921,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"username:修改成john_doe\"},{\"UPDATED\":\"email:修改成john@example.com\"},{\"UPDATED\":\"password:修改成password123\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:02:20',NULL,0),


(922,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:05:45',NULL,0),


(923,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:10:14',NULL,0),


(924,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:10:16',NULL,0),


(925,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:10:24',NULL,0),


(926,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"44444\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:10:51',NULL,0),


(927,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:11:35',NULL,0),


(928,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:13:29',NULL,0),


(929,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:19:34',NULL,0),


(930,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"222\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:22:31',NULL,0),


(931,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:27:29',NULL,0),


(932,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:27:33',NULL,0),


(933,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'java.lang.String cannot be cast to java.util.Map',NULL,'2023-08-19 11:27:34',NULL,0),


(934,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:28:00',NULL,0),


(935,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:28:02',NULL,0),


(936,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"\\\"code: 200\\\\nmessage: 成功\\\\ndata:\\\\n  success: true\\\\n  message: john_doe    用户注册成功\\\\n\\\"\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:28:05',NULL,0),


(937,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'can not cast to JSONObject.',NULL,'2023-08-19 11:28:07',NULL,0),


(938,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:28:58',NULL,0),


(939,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:29:01',NULL,0),


(940,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:29:03',NULL,0),


(941,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:29:06',NULL,0),


(942,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:29:19',NULL,0),


(943,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:30:32',NULL,0),


(944,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:30:35',NULL,0),


(945,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:30:38',NULL,0),


(946,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":\"[{\\\"UPDATED\\\":\\\"username:修改成john_doe\\\"},{\\\"UPDATED\\\":\\\"email:修改成john@example.com\\\"},{\\\"UPDATED\\\":\\\"password:修改成password123\\\"}]\",\"pathParameter\":\"[{\\\"name\\\":\\\"id\\\",\\\"value\\\":\\\"22\\\"}]\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:37:52',NULL,0),


(947,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:42:20',NULL,0),


(948,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户注册成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:42:21',NULL,0),


(949,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"null<code>200</code>\\nnull<data>\\nnull\\t<success>true</success>\\nnull\\t<message>john_doe    用户注册成功</message>\\nnull</data>\\nnull<message>成功</message>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:42:25',NULL,0),


(950,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'java.lang.String cannot be cast to java.util.Map',NULL,'2023-08-19 11:42:34',NULL,0),


(951,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:44:54',NULL,0),


(952,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<code>200</code>\\n<data>\\n</data>\\n<message>成功</message>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:44:58',NULL,0),


(953,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<code>200</code>\\n<data>\\n</data>\\n<message>成功</message>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:45:01',NULL,0),


(954,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<code>200</code>\\n<data>\\n</data>\\n<message>成功</message>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:45:05',NULL,0),


(955,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'syntax error, pos 1, line 1, column 2转化失败',NULL,'2023-08-19 11:45:08',NULL,0),


(956,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"转化失败\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:45:11',NULL,0),


(957,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:46:38',NULL,0),


(958,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户注册成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:46:39',NULL,0),


(959,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:46:41',NULL,0),


(960,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"null<code>200</code>\\nnull<data>\\nnull\\t<success>true</success>\\nnull\\t<message>john_doe    用户注册成功</message>\\nnull</data>\\nnull<message>成功</message>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:46:43',NULL,0),


(961,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"null<code>200</code>\\nnull<data>\\nnull\\t<success>true</success>\\nnull\\t<message>john_doe    用户注册成功</message>\\nnull</data>\\nnull<message>成功</message>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:46:46',NULL,0),


(962,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'java.lang.String cannot be cast to java.util.Map',NULL,'2023-08-19 11:46:47',NULL,0),


(963,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:47:47',NULL,0),


(964,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:47:49',NULL,0),


(965,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:47:52',NULL,0),


(966,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:47:54',NULL,0),


(967,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:47:58',NULL,0),


(968,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"22\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:48:10',NULL,0),


(969,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:49:54',NULL,0),


(970,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:51:02',NULL,0),


(971,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:52:04',NULL,0),


(972,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:52:29',NULL,0),


(973,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户注册成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:52:30',NULL,0),


(974,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:52:33',NULL,0),


(975,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:52:40',NULL,0),


(976,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:54:53',NULL,0),


(977,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:56:01',NULL,0),


(978,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:57:33',NULL,0),


(979,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:58:25',NULL,0),


(980,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户注册成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:58:27',NULL,0),


(981,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"code: 200\\nmessage: 成功\\ndata:\\n  success: true\\n  message: john_doe    用户注册成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:58:29',NULL,0),


(982,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 11:58:31',NULL,0),


(983,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}]},\"message\":\"[{\\\"name\\\":\\\"id\\\",\\\"value\\\":\\\"22\\\"}][{\\\"UPDATED\\\":\\\"username:修改成john_doe\\\"},{\\\"UPDATED\\\":\\\"email:修改成john@example.com\\\"},{\\\"UPDATED\\\":\\\"password:修改成password123\\\"}]\"}',1,'',NULL,'2023-08-19 12:08:09',NULL,0),


(984,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"2\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[\"{{\\\"UPDATED\\\":\\\"username:修改成john_doe\\\"},{\\\"UPDATED\\\":\\\"email:修改成john@example.com\\\"},{\\\"UPDATED\\\":\\\"password:修改成password123\\\"},{\\\"UPDATED\\\":\\\"{{name=id, value=2}}\\\"}}\"]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 12:16:50',NULL,0),


(985,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 12:21:51',NULL,0),


(986,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"11\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"code\":200,\"data\":{},\"message\":\"成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 12:24:18',NULL,0),


(987,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 12:28:46',NULL,0),


(988,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"password123\"],\"requestKey\":[\"username\",\"password\"],\"id\":\"46\",\"pathParameter\":[],\"url\":\"/api/user/login\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户登录成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 12:34:26',NULL,0),


(989,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"2\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:21:32',NULL,0),


(990,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"22\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:21:48',NULL,0),


(991,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:24:37',NULL,0),


(992,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:25:00',NULL,0),


(993,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:26:44',NULL,0),


(994,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:28:29',NULL,0),


(995,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:28:34',NULL,0),


(996,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:28:36',NULL,0),


(997,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:28:39',NULL,0),


(998,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"username:修改成john_doe\"},{\"UPDATED\":\"email:修改成john@example.com\"},{\"UPDATED\":\"password:修改成password123\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:28:49',NULL,0),


(999,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:29:20',NULL,0),


(1000,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:30:02',NULL,0),


(1001,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:30:44',NULL,0),


(1002,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[],\"requestKey\":[],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"2\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[],\"pathParameter\":[{\"name\":\"id\",\"value\":\"2\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:36:31',NULL,0),


(1003,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:40:56',NULL,0),


(1004,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:42:37',NULL,0),


(1005,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:42:43',NULL,0),


(1006,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:42:46',NULL,0),


(1007,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"2\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"2\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:53:02',NULL,0),


(1008,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:54:57',NULL,0),


(1009,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:55:00',NULL,0),


(1010,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:55:03',NULL,0),


(1011,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:55:05',NULL,0),


(1012,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<RESULT>\\n\\t\\t<code>200</code>\\n\\t\\t<data>\\n\\t\\t\\t<success>true</success>\\n\\t\\t\\t<message>john_doe    用户注册成功</message>\\n\\t\\t</data>\\n\\t\\t<message>成功</message>\\n\\t</RESULT>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:55:08',NULL,0),


(1013,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:55:18',NULL,0),


(1014,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:59:35',NULL,0),


(1015,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"success\\\":true,\\\"message\\\":\\\"john_doe    用户注册成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 21:59:37',NULL,0),


(1016,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:00:14',NULL,0),


(1017,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:00:17',NULL,0),


(1018,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"22\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:01:08',NULL,0),


(1019,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:02:37',NULL,0),


(1020,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:15',NULL,0),


(1021,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:20',NULL,0),


(1022,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:24',NULL,0),


(1023,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<RESULT>\\n\\t\\t<code>200</code>\\n\\t\\t<data>\\n\\t\\t\\t<success>true</success>\\n\\t\\t\\t<message>john_doe    用户注册成功</message>\\n\\t\\t</data>\\n\\t\\t<message>成功</message>\\n\\t</RESULT>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:27',NULL,0),


(1024,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"22\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:38',NULL,0),


(1025,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t</messages>\\n\\t\\t<pathParameter>\\n\\t\\t</pathParameter>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:47',NULL,0),


(1026,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages: \\\"\\\\n\\\\t\\\\t\\\"\\n    pathParameter: \\\"\\\\n\\\\t\\\\t\\\"\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:49',NULL,0),


(1027,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<RESULT>\\n\\t\\t<code>200</code>\\n\\t\\t<data>\\n\\t\\t\\t<success>true</success>\\n\\t\\t\\t<messages>\\n\\t\\t</messages>\\n\\t\\t\\t<pathParameter>\\n\\t\\t</pathParameter>\\n\\t\\t</data>\\n\\t\\t<message>成功</message>\\n\\t</RESULT>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:07:55',NULL,0),


(1028,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  RESULT:\\n    code: \'200\'\\n    data:\\n      success: \'true\'\\n      messages: \\\"\\\\n\\\\t\\\\t\\\"\\n      pathParameter: \\\"\\\\n\\\\t\\\\t\\\"\\n    message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:08:05',NULL,0),


(1029,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:08:15',NULL,0),


(1030,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:08:17',NULL,0),


(1031,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE: \\\"\\\\n\\\\t\\\\t\\\"\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:08:22',NULL,0),


(1032,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:09:30',NULL,0),


(1033,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:09:36',NULL,0),


(1034,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE: \\\"\\\\n\\\\t\\\\t\\\"\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:09:43',NULL,0),


(1035,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<RESULT>\\n\\t\\t<code>200</code>\\n\\t\\t<data>\\n\\t\\t\\t<DELETE>\\n\\t\\t</DELETE>\\n\\t\\t\\t<success>true</success>\\n\\t\\t\\t<message>文章删除 成功</message>\\n\\t\\t</data>\\n\\t\\t<message>成功</message>\\n\\t</RESULT>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:09:49',NULL,0),


(1036,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"DELETE\\\":\\\"\\\\n\\\\t\\\\t\\\",\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"文章删除 成功\\\"},\\\"message\\\":\\\"成功\\\"}}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:09:54',NULL,0),


(1037,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:10:18',NULL,0),


(1038,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t</messages>\\n\\t\\t<pathParameter>\\n\\t\\t</pathParameter>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:10:27',NULL,0),


(1039,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages: \\\"\\\\n\\\\t\\\\t\\\"\\n    pathParameter: \\\"\\\\n\\\\t\\\\t\\\"\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:10:31',NULL,0),


(1040,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"messages\\\":\\\"\\\\n\\\\t\\\\t\\\",\\\"pathParameter\\\":\\\"\\\\n\\\\t\\\\t\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:10:34',NULL,0),


(1041,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"22\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:10:43',NULL,0),


(1042,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"code\\\":200,\\\"message\\\":\\\"成功\\\",\\\"data\\\":{\\\"DELETE\\\":{{\\\"name\\\":\\\"id\\\",\\\"value\\\":\\\"22\\\"}},\\\"success\\\":true,\\\"message\\\":\\\"文章删除 成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:10:46',NULL,0),


(1043,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:10:55',NULL,0),


(1044,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE: \\\"\\\\n\\\\t\\\\t\\\"\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:11:00',NULL,0),


(1045,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:13:14',NULL,0),


(1046,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t</messages>\\n\\t\\t<pathParameter>\\n\\t\\t</pathParameter>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:13:19',NULL,0),


(1047,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'java.lang.String cannot be cast to java.util.Map',NULL,'2023-08-19 22:13:24',NULL,0),


(1048,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','',0,'can not cast to JSONObject.',NULL,'2023-08-19 22:13:31',NULL,0),


(1049,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"\\\"<?xml version=\\\\\\\"1.0\\\\\\\" encoding=\\\\\\\"UTF-8\\\\\\\"?>\\\\n<info>\\\\n\\\\t<code>200</code>\\\\n\\\\t<data>\\\\n\\\\t\\\\t<success>true</success>\\\\n\\\\t\\\\t<messages>\\\\n\\\\t\\\\t</messages>\\\\n\\\\t\\\\t<pathParameter>\\\\n\\\\t\\\\t</pathParameter>\\\\n\\\\t</data>\\\\n\\\\t<message>成功</message>\\\\n</info>\\\\n\\\"\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:13:33',NULL,0),


(1050,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:16:47',NULL,0),


(1051,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:16:50',NULL,0),


(1052,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:16:52',NULL,0),


(1053,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:16:56',NULL,0),


(1054,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}],\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:17:07',NULL,0),


(1055,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"11\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"messages\":[{\"UPDATED\":\"title:修改成更新后的文章\"},{\"UPDATED\":\"content:修改成这是更新后的文章内容。\"}]},\"pathParameter\":[{\"name\":\"id\",\"value\":\"11\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:19:45',NULL,0),


(1056,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:21:57',NULL,0),


(1057,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"pathParameter\":{\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]}},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:24:28',NULL,0),


(1058,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"pathParameter\":{\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]}},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:25:08',NULL,0),


(1059,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"pathParameter\":{\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]}},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:27:50',NULL,0),


(1060,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"pathParameter\":{\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]}},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:28:47',NULL,0),


(1061,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"pathParameter\":{\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}]}},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:30:37',NULL,0),


(1062,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:33:58',NULL,0),


(1063,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:34:02',NULL,0),


(1064,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:34:05',NULL,0),


(1065,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"messages\\\":{\\\"UPDATED_1\\\":\\\"content:修改成这是更新后的文章内容。\\\",\\\"UPDATED_0\\\":\\\"title:修改成更新后的文章\\\"}},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 22:34:08',NULL,0),


(1066,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:01:21',NULL,0),


(1067,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:01:24',NULL,0),


(1068,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:01:26',NULL,0),


(1069,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:01:28',NULL,0),


(1070,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:16:43',NULL,0),


(1071,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:16:45',NULL,0),


(1072,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:16:48',NULL,0),


(1073,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:16:49',NULL,0),


(1074,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"11\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:17:00',NULL,0),


(1075,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:17:03',NULL,0),


(1076,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:17:06',NULL,0),


(1077,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"messages\\\":{\\\"UPDATED_1\\\":\\\"content:修改成这是更新后的文章内容。\\\",\\\"UPDATED_0\\\":\\\"title:修改成更新后的文章\\\"}},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-19 23:17:09',NULL,0),


(1078,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:03:37',NULL,0),


(1079,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:03:39',NULL,0),


(1080,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:03:41',NULL,0),


(1081,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:03:43',NULL,0),


(1082,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{     \\\"title\\\": \\\"更新后的文章\\\",     \\\"content\\\": \\\"这是更新后的文章内容。\\\"    }\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}]},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:04:50',NULL,0),


(1083,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{     \\\"title\\\": \\\"更新后的文章\\\",     \\\"content\\\": \\\"这是更新后的文章内容。\\\"    }\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"2\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"Path\":{\"REQBADY\":[[{\"name\":\"id\",\"value\":\"2\"}]]},\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:09:53',NULL,0),


(1084,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:31:11',NULL,0),


(1085,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:31:14',NULL,0),


(1086,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:31:15',NULL,0),


(1087,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:31:17',NULL,0),


(1088,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:31:26',NULL,0),


(1089,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:31:30',NULL,0),


(1090,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:31:32',NULL,0),


(1091,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','',0,'Unexpected character (\'n\' (code 110)): was expecting double-quote to start field name\n at [Source: (String)\"[[{name=id, value=111}]]\"; line: 1, column: 5]',NULL,'2023-08-20 00:40:16',NULL,0),


(1092,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:41:26',NULL,0),


(1093,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:41:30',NULL,0),


(1094,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:41:33',NULL,0),


(1095,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"11\"}],\"url\":\"/api/post/{id}/update\"}','',0,'Unexpected character (\'n\' (code 110)): was expecting double-quote to start field name\n at [Source: (String)\"[[{name=id, value=11}]]\"; line: 1, column: 5]',NULL,'2023-08-20 00:41:44',NULL,0),


(1096,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"Path\":\"[{\\\"name\\\":\\\"id\\\",\\\"value\\\":\\\"111\\\"}]\",\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:43:56',NULL,0),


(1097,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"Path\":[{\"name\":\"id\",\"value\":\"1\"}],\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:48:42',NULL,0),


(1098,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"Path\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:50:13',NULL,0),


(1099,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"Path\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:50:32',NULL,0),


(1100,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<Path>\\n\\t\\t</Path>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:50:35',NULL,0),


(1101,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    Path: \\\"\\\\n\\\\t\\\\t\\\"\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:50:42',NULL,0),


(1102,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1111\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"pathData\":{\"Path\":[{\"name\":\"id\",\"value\":\"1111\"}]},\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:55:21',NULL,0),


(1103,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<pathData>\\n\\t\\t\\t<Path>\\n\\t\\t\\t</Path>\\n\\t\\t</pathData>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:55:30',NULL,0),


(1104,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    pathData:\\n      Path: \\\"\\\\n\\\\t\\\\t\\\\t\\\"\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:55:34',NULL,0),


(1105,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"1\"}],\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"pathData\":{\"Path\":[{\"name\":\"id\",\"value\":\"1\"}]},\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 00:56:16',NULL,0),


(1106,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":[{\"name\":\"id\",\"value\":\"111\"}],\"url\":\"/api/post/{id}/update\"}','',0,'java.util.ArrayList cannot be cast to java.lang.Integer',NULL,'2023-08-20 01:03:04',NULL,0),


(1107,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":{\"id\":\"111\"},\"url\":\"/api/post/{id}/update\"}','',0,'java.lang.String cannot be cast to [J',NULL,'2023-08-20 01:28:13',NULL,0),


(1108,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":{\"id\":\"11\"},\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"PathParameter\":{\"id\":\"11\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:30:42',NULL,0),


(1109,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t\\t<PathParameter>\\n\\t\\t\\t<id>11</id>\\n\\t\\t</PathParameter>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:30:48',NULL,0),


(1110,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n    PathParameter:\\n      id: \'11\'\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:30:52',NULL,0),


(1111,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"222\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:33:11',NULL,0),


(1112,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:34:37',NULL,0),


(1113,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:34:40',NULL,0),


(1114,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:34:41',NULL,0),


(1115,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":{\"id\":\"11\"},\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:34:49',NULL,0),


(1116,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t\\t<id>11</id>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:34:55',NULL,0),


(1117,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE:\\n      id: \'11\'\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:34:57',NULL,0),


(1118,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<RESULT>\\n\\t\\t<code>200</code>\\n\\t\\t<data>\\n\\t\\t\\t<DELETE>\\n\\t\\t\\t\\t<id>11</id>\\n\\t\\t\\t</DELETE>\\n\\t\\t\\t<success>true</success>\\n\\t\\t\\t<message>文章删除 成功</message>\\n\\t\\t</data>\\n\\t\\t<message>成功</message>\\n\\t</RESULT>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:35:00',NULL,0),


(1119,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":{\"id\":\"2\"},\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:35:18',NULL,0),


(1120,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":{\"id\":\"11\"},\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"PathParameter\":{\"id\":\"11\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:35:46',NULL,0),


(1121,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t\\t<PathParameter>\\n\\t\\t\\t<id>11</id>\\n\\t\\t</PathParameter>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:35:50',NULL,0),


(1122,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":{\"id\":\"222\"},\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"PathParameter\":{\"id\":\"222\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:40:15',NULL,0),


(1123,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t\\t<PathParameter>\\n\\t\\t\\t<id>222</id>\\n\\t\\t</PathParameter>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:40:20',NULL,0),


(1124,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n    PathParameter:\\n      id: \'222\'\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:40:24',NULL,0),


(1125,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"messages\\\":{\\\"UPDATED_1\\\":\\\"content:修改成这是更新后的文章内容。\\\",\\\"UPDATED_0\\\":\\\"title:修改成更新后的文章\\\"},\\\"PathParameter\\\":{\\\"id\\\":\\\"222\\\"}},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:40:27',NULL,0),


(1126,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n    PathParameter:\\n      id: \'222\'\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:40:30',NULL,0),


(1127,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"PATH\":[{\"id\":\"1111\"}],\"REQBADY\":[[]],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:41:25',NULL,0),


(1128,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":[{\"name\":\"id\",\"value\":\"111\"}],\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:43:09',NULL,0),


(1129,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":{\"id\":\"1111\"},\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:44:31',NULL,0),


(1130,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t\\t<id>1111</id>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:44:36',NULL,0),


(1131,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE:\\n      id: \'1111\'\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 01:44:39',NULL,0),


(1132,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":{\"id\":\"111\"},\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:36:48',NULL,0),


(1133,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t\\t<id>111</id>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:36:52',NULL,0),


(1134,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE:\\n      id: \'111\'\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:36:54',NULL,0),


(1135,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE:\\n      id: \'111\'\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:36:57',NULL,0),


(1136,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<RESULT>\\n\\t\\t<code>200</code>\\n\\t\\t<data>\\n\\t\\t\\t<DELETE>\\n\\t\\t\\t\\t<id>111</id>\\n\\t\\t\\t</DELETE>\\n\\t\\t\\t<success>true</success>\\n\\t\\t\\t<message>文章删除 成功</message>\\n\\t\\t</data>\\n\\t\\t<message>成功</message>\\n\\t</RESULT>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:37:00',NULL,0),


(1137,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"DELETE\\\":{\\\"id\\\":\\\"111\\\"},\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"文章删除 成功\\\"},\\\"message\\\":\\\"成功\\\"}}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:37:01',NULL,0),


(1138,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":[\"[1,2]\"],\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:37:25',NULL,0),


(1139,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"List\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量输出\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"{1,2}\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:39:54',NULL,0),


(1140,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"List\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量输出\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"[1,2]\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:40:28',NULL,0),


(1141,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":\"[1,2]\",\"success\":true,\"message\":\"文章批量输出 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:40:35',NULL,0),


(1142,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"List\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"[1,2]\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:41:12',NULL,0),


(1143,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"json\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"[1,2]\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:48:05',NULL,0),


(1144,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"[1,2]\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:48:25',NULL,0),


(1145,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/post/delete\",\"apiName\":\"文章批量删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"{\\n  \\\"idList\\\": [85, 92, 78]\\n}\\n\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:50:01',NULL,0),


(1146,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":\"{\\n  \\\"idList\\\": [85, 92, 78]\\n}\\n\",\"success\":true,\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:50:08',NULL,0),


(1147,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":\"{\\n  \\\"idList\\\": [85, 92, 78]\\n}\\n\",\"success\":true,\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:52:02',NULL,0),


(1148,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"REQBADY\":\"{\\n  \\\"idList\\\": [85, 92, 78]\\n}\\n\",\"success\":true,\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:52:52',NULL,0),


(1149,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"success\":true,\"WHERE\":{},\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:56:55',NULL,0),


(1150,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"success\":true,\"WHERE\":{},\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 03:58:12',NULL,0),


(1151,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"success\":true,\"WHERE\":\"成功获取删除条件\",\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:01:43',NULL,0),


(1152,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<WHERE>成功获取删除条件</WHERE>\\n\\t\\t<message>文章批量删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:01:51',NULL,0),


(1153,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    WHERE: 成功获取删除条件\\n    message: 文章批量删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:01:55',NULL,0),


(1154,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:05',NULL,0),


(1155,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:09',NULL,0),


(1156,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:11',NULL,0),


(1157,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"john_doe    用户注册成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:13',NULL,0),


(1158,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeUpdate()','PUT','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"method\":\"PUT\",\"requestValue\":[\"更新后的文章\",\"这是更新后的文章内容。\"],\"requestKey\":[\"title\",\"content\"],\"id\":\"48\",\"pathParameter\":{\"id\":\"1111\"},\"url\":\"/api/post/{id}/update\"}','{\"code\":200,\"data\":{\"success\":true,\"messages\":{\"UPDATED_1\":\"content:修改成这是更新后的文章内容。\",\"UPDATED_0\":\"title:修改成更新后的文章\"},\"PathParameter\":{\"id\":\"1111\"}},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:23',NULL,0),


(1159,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<messages>\\n\\t\\t\\t<UPDATED_1>content:修改成这是更新后的文章内容。</UPDATED_1>\\n\\t\\t\\t<UPDATED_0>title:修改成更新后的文章</UPDATED_0>\\n\\t\\t</messages>\\n\\t\\t<PathParameter>\\n\\t\\t\\t<id>1111</id>\\n\\t\\t</PathParameter>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:25',NULL,0),


(1160,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    messages:\\n      UPDATED_1: content:修改成这是更新后的文章内容。\\n      UPDATED_0: title:修改成更新后的文章\\n    PathParameter:\\n      id: \'1111\'\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:27',NULL,0),


(1161,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"DELETE\":{\"id\":\"111\"},\"success\":true,\"message\":\"文章删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:33',NULL,0),


(1162,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<DELETE>\\n\\t\\t\\t<id>111</id>\\n\\t\\t</DELETE>\\n\\t\\t<success>true</success>\\n\\t\\t<message>文章删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:37',NULL,0),


(1163,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    DELETE:\\n      id: \'111\'\\n    success: \'true\'\\n    message: 文章删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:39',NULL,0),


(1164,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"{\\\"RESULT\\\":{\\\"code\\\":\\\"200\\\",\\\"data\\\":{\\\"DELETE\\\":{\\\"id\\\":\\\"111\\\"},\\\"success\\\":\\\"true\\\",\\\"message\\\":\\\"文章删除 成功\\\"},\\\"message\\\":\\\"成功\\\"}}\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:08:41',NULL,0),


(1165,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"WHEREidList\":\"{\\n  \\\"idList\\\": [85, 92, 78]\\n}\\n\",\"success\":true,\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:10:49',NULL,0),


(1166,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeDelete()','DELETE','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','','{\"code\":200,\"data\":{\"success\":true,\"WHERE\":\"idList\",\"message\":\"文章批量删除 成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:16:45',NULL,0),


(1167,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<WHERE>idList</WHERE>\\n\\t\\t<message>文章批量删除 成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:16:51',NULL,0),


(1168,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    WHERE: idList\\n    message: 文章批量删除 成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-20 04:16:54',NULL,0),


(1169,'成员管理','DELETE','com.hwj.system.controller.SysUserController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysUser/updateStatus/1/0','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 00:10:27',NULL,0),


(1170,'成员管理','DELETE','com.hwj.system.controller.SysUserController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysUser/updateStatus/1/1','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 00:10:28',NULL,0),


(1171,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"模拟数据添加\",\"perms\":\"\",\"id\":\"62\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 00:11:27',NULL,0),


(1172,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692547887000,\"type\":2,\"parentId\":52,\"path\":\"assignSimulation\",\"sortValue\":1,\"component\":\"system/sysApi/assignSimulation\",\"isDeleted\":0,\"children\":[],\"createTime\":1692547887000,\"param\":{},\"name\":\"模拟数据添加\",\"perms\":\"\",\"id\":\"62\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 00:12:50',NULL,0),


(1173,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-21 15:52:57',NULL,0),


(1174,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeAdd()','POST','MANAGE','admin','','/admin/system/sysApi/invoke','127.0.0.1','{\"requestParameter\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"method\":\"POST\",\"requestValue\":[\"john_doe\",\"john@example.com\",\"password123\"],\"requestKey\":[\"username\",\"email\",\"password\"],\"id\":\"45\",\"pathParameter\":[],\"url\":\"/api/user/register\"}','{\"code\":200,\"data\":{\"success\":true,\"message\":\"john_doe    用户注册成功\"},\"message\":\"成功\"}',1,'',NULL,'2023-08-21 15:53:08',NULL,0),


(1175,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?>\\n<info>\\n\\t<code>200</code>\\n\\t<data>\\n\\t\\t<success>true</success>\\n\\t\\t<message>john_doe    用户注册成功</message>\\n\\t</data>\\n\\t<message>成功</message>\\n</info>\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-21 15:53:11',NULL,0),


(1176,'格式转化','OTHER','com.hwj.system.controller.FormatController.jsonToXml()','GET','MANAGE','admin','','/admin/system/format/toFormat','127.0.0.1','','{\"code\":200,\"data\":\"RESULT:\\n  code: \'200\'\\n  data:\\n    success: \'true\'\\n    message: john_doe    用户注册成功\\n  message: 成功\\n\",\"message\":\"成功\"}',1,'',NULL,'2023-08-21 15:53:16',NULL,0),


(1177,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"接口平台\",\"description\":\"模仿postman和swagger的\",\"id\":\"6\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:27:37',NULL,0),


(1178,'成员管理','UPDATE','com.hwj.system.controller.SysUserController.updateById()','PUT','MANAGE','admin','','/admin/system/sysUser/update','127.0.0.1','{\"updateTime\":1691062106000,\"password\":\"96e79218965eb72c92a549dd5a330112\",\"isDeleted\":0,\"createTime\":1691062106000,\"param\":{},\"phone\":\"18512099480\",\"name\":\"weijin he\",\"id\":\"9\",\"status\":1,\"username\":\"hwj1104\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:35:12',NULL,0),


(1179,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:35:46',NULL,0),


(1180,'角色管理','INSERT','com.hwj.system.controller.SysRoleController.saveRole()','POST','MANAGE','admin','','/admin/system/sysRole/save','127.0.0.1','{\"param\":{},\"roleCode\":\"111111\",\"roleName\":\"11111\",\"id\":\"16\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:35:52',NULL,0),


(1181,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":3,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":7},\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:35:52',NULL,0),


(1182,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"1111111\",\"description\":\"1111111\",\"id\":\"7\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:36:27',NULL,0),


(1183,'接口管理','INSERT','com.hwj.system.controller.SysApiController.save()','POST','MANAGE','admin','','/admin/system/sysApi/save','127.0.0.1','{\"parameterType\":\"111111\",\"path\":\"1111111111\",\"apiName\":\"111111111\",\"responseDataStructure\":\"111111111\",\"param\":{},\"requestParameters\":\"1111111111\",\"id\":\"52\",\"parameterName\":\"111111\",\"httpMethod\":\"1111111111\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:37:09',NULL,0),


(1184,'成员管理','UPDATE','com.hwj.system.controller.SysUserController.updateById()','PUT','MANAGE','admin','','/admin/system/sysUser/update','127.0.0.1','{\"updateTime\":1692628744000,\"password\":\"96e79218965eb72c92a549dd5a330112\",\"isDeleted\":0,\"createTime\":1692628744000,\"param\":{},\"phone\":\"15816474932\",\"name\":\"ljll\",\"id\":\"16\",\"status\":1,\"username\":\"hwj1104\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:39:14',NULL,0),


(1185,'成员管理','DELETE','com.hwj.system.controller.SysUserController.remove()','DELETE','MANAGE','admin','','/admin/system/sysUser/remove/16','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-21 22:39:17',NULL,0),


(1186,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-23 00:57:38',NULL,0),


(1187,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":46,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"分配接口\",\"perms\":\"bnt.sysItem.assignapi\",\"id\":\"63\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-23 00:57:57',NULL,0),


(1188,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-23 01:02:17',NULL,0),


(1189,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-23 01:02:26',NULL,0),


(1190,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-23 01:02:31',NULL,0),


(1191,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-23 01:02:36',NULL,0),


(1192,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-23 17:24:26',NULL,0),


(1193,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-23 17:39:49',NULL,0),


(1194,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-23 20:47:45',NULL,0),


(1195,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"45\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 17:55:53',NULL,0),


(1196,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"6\",\"apiIdList\":[\"45\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 17:56:01',NULL,0),


(1197,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"6\",\"apiIdList\":[]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:09:38',NULL,0),


(1198,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"图书平台用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:10:02',NULL,0),


(1199,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:10:27',NULL,0),


(1200,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"6\",\"apiIdList\":[\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:17:53',NULL,0),


(1201,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"6\",\"apiIdList\":[\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:29:08',NULL,0),


(1202,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"45\",\"46\",\"47\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:29:14',NULL,0),


(1203,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"47\",\"45\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:29:31',NULL,0),


(1204,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"46\",\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:31:00',NULL,0),


(1205,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"6\",\"apiIdList\":[\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:31:06',NULL,0),


(1206,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"46\",\"45\",\"47\"]}','',0,'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2',NULL,'2023-08-25 23:39:31',NULL,0),


(1207,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"6\",\"apiIdList\":[\"45\",\"46\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:49:08',NULL,0),


(1208,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"46\",\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:49:32',NULL,0),


(1209,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"图书平台用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:49:47',NULL,0),


(1210,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/login\",\"apiName\":\"图书平台用户登录\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户登录成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"Login\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:50:07',NULL,0),


(1211,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:50:42',NULL,0),


(1212,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/login\",\"apiName\":\"用户登录\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户登录成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"Login\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-25 23:50:51',NULL,0),


(1213,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/book/post/create\",\"apiName\":\"文章创建\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"新文章 文章创建成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"47\",\"parameterName\":\"Article\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:05:52',NULL,0),


(1214,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, JSON\",\"path\":\"/book/post/{id}/update\",\"apiName\":\"文章更新\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章更新   [title, content]:修改成[更新后的文章, 这是更新后的文章内容。]\\\", \\\"success\\\": true, \\\"pathParameter\\\": [{\\\"name\\\": \\\"id\\\", \\\"value\\\": \\\"1\\\"}]}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:06:03',NULL,0),


(1215,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/book/post/delete{id}\",\"apiName\":\"文章删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"SELECT\\\": [{\\\"name\\\": \\\"id\\\", \\\"value\\\": \\\"111\\\"}], \\\"message\\\": \\\"文章删除 成功删除该数据\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"id\\\": 789}\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:06:11',NULL,0),


(1216,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/book/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n   \\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:06:31',NULL,0),


(1217,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/book/post/delete\",\"apiName\":\"文章批量删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"{\\n  \\\"idList\\\": [85, 92, 78]\\n}\\n\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:06:46',NULL,0),


(1218,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"3\",\"apiIdList\":[\"47\",\"48\",\"49\",\"51\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:07:05',NULL,0),


(1219,'项目接口管理','IMPORT','com.hwj.system.controller.SysItemApiController.doAssign()','POST','MANAGE','admin','','/admin/system/sysItemApi/doAssign','127.0.0.1','{\"itemId\":\"6\",\"apiIdList\":[\"45\",\"46\",\"50\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:07:09',NULL,0),


(1220,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 10,\\n   \\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:07:22',NULL,0),


(1221,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:09:16',NULL,0),


(1222,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-26 00:36:23',NULL,0),


(1223,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"assignSimulation\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"查看模拟数据\",\"perms\":\"\",\"id\":\"64\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:31:06',NULL,0),


(1224,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692991866000,\"type\":2,\"parentId\":52,\"path\":\"assignSimulation\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1692991866000,\"param\":{},\"name\":\"查看模拟数据\",\"perms\":\"bnt.sysMock.list\",\"id\":\"64\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:31:38',NULL,0),


(1225,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692991866000,\"type\":2,\"parentId\":52,\"path\":\"assignSimulation\",\"sortValue\":1,\"component\":\"system/sysApi/assignSimulation\",\"isDeleted\":0,\"children\":[],\"createTime\":1692991866000,\"param\":{},\"name\":\"查看模拟数据\",\"perms\":\"bnt.sysMock.list\",\"id\":\"64\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:32:25',NULL,0),


(1226,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"\",\"sortValue\":1,\"component\":\"system/sysApi/assignSimulation\",\"param\":{},\"name\":\"修改模拟数据\",\"perms\":\"\",\"id\":\"65\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:33:02',NULL,0),


(1227,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692991982000,\"type\":2,\"parentId\":52,\"path\":\"assignSimulation\",\"sortValue\":1,\"component\":\"system/sysApi/assignSimulation\",\"isDeleted\":0,\"children\":[],\"createTime\":1692991982000,\"param\":{},\"name\":\"修改模拟数据\",\"perms\":\"bnt.sysMock.update\",\"id\":\"65\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:33:29',NULL,0),


(1228,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"assignSimulation\",\"sortValue\":1,\"component\":\"system/sysApi/assignSimulation\",\"param\":{},\"name\":\"添加模拟数据\",\"perms\":\"bnt.sysMock.save\",\"id\":\"66\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:34:14',NULL,0),


(1229,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":52,\"path\":\"system/sysApi/assignSimulation\",\"sortValue\":1,\"component\":\"assignSimulation\",\"param\":{},\"name\":\"\",\"perms\":\"bnt.sysUser.remove\",\"id\":\"67\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:34:47',NULL,0),


(1230,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692992087000,\"type\":2,\"parentId\":52,\"path\":\"system/sysApi/assignSimulation\",\"sortValue\":1,\"component\":\"assignSimulation\",\"isDeleted\":0,\"children\":[],\"createTime\":1692992087000,\"param\":{},\"name\":\"删除模拟数据\",\"perms\":\"bnt.sysUser.remove\",\"id\":\"67\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:34:58',NULL,0),


(1231,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:51:27',NULL,0),


(1232,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/3','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:53:59',NULL,0),


(1233,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/6','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 03:54:02',NULL,0),


(1234,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"用户列表\",\"id\":\"7\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 04:00:58',NULL,0),


(1235,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/7','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 04:02:26',NULL,0),


(1236,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"1\",\"id\":\"8\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 04:09:10',NULL,0),


(1237,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/64','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:37:54',NULL,0),


(1238,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/67','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:37:58',NULL,0),


(1239,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/66','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:38:00',NULL,0),


(1240,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/65','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:38:03',NULL,0),


(1241,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":1,\"parentId\":2,\"path\":\"sysMock\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"模拟数据管理\",\"perms\":\"\",\"id\":\"68\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:39:40',NULL,0),


(1242,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1692999580000,\"type\":1,\"parentId\":2,\"path\":\"sysMock\",\"sortValue\":1,\"component\":\"system/sysMock/list\",\"isDeleted\":0,\"children\":[],\"createTime\":1692999580000,\"param\":{},\"name\":\"模拟数据管理\",\"perms\":\"\",\"id\":\"68\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:39:56',NULL,0),


(1243,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-tools\",\"updateTime\":1692999580000,\"type\":1,\"parentId\":2,\"path\":\"sysMock\",\"sortValue\":7,\"component\":\"system/sysMock/list\",\"isDeleted\":0,\"children\":[],\"createTime\":1692999580000,\"param\":{},\"name\":\"模拟数据管理\",\"perms\":\"\",\"id\":\"68\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:40:30',NULL,0),


(1244,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"el-icon-s-tools\",\"updateTime\":1692999580000,\"type\":1,\"parentId\":2,\"path\":\"sysMock\",\"sortValue\":4,\"component\":\"system/sysMock/list\",\"isDeleted\":0,\"children\":[],\"createTime\":1692999580000,\"param\":{},\"name\":\"模拟数据管理\",\"perms\":\"\",\"id\":\"68\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:40:56',NULL,0),


(1245,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/8','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:41:05',NULL,0),


(1246,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"用户列表\",\"id\":\"9\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:47:57',NULL,0),


(1247,'项目管理','DELETE','com.hwj.system.controller.SysItemController.remove()','DELETE','MANAGE','admin','','/admin/system/sysItem/remove/9','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:48:33',NULL,0),


(1248,'项目管理','INSERT','com.hwj.system.controller.SysItemController.save()','POST','MANAGE','admin','','/admin/system/sysItem/save','127.0.0.1','{\"param\":{},\"name\":\"用户列表\",\"id\":\"10\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 05:57:25',NULL,0),


(1249,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"{     \\\"records\\\": {       {         \\\"id\\\": \\\"1\\\",         \\\"createTime\\\": \\\"2021-05-31 18:08:43\\\",         \\\"updateTime\\\": \\\"2023-06-14 22:54:32\\\",         \\\"isDeleted\\\": 0,         \\\"param\\\": {},         \\\"username\\\": \\\"admin\\\",         \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",         \\\"name\\\": \\\"admin\\\",         \\\"phone\\\": \\\"13414730186\\\",         \\\"headUrl\\\": \\\"\\\",         \\\"deptId\\\": 1021,         \\\"postId\\\": 5,         \\\"description\\\": null,         \\\"status\\\": 1,         \\\"roleList\\\": null,         \\\"postName\\\": null,         \\\"deptName\\\": null       }     } }\",\"param\":{},\"name\":\"用户列表\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.\r\n### The error may exist in com/hwj/system/mapper/SysMockMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysMockMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_mock  ( name, mock_data )  VALUES  ( ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.\n; Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.',NULL,'2023-08-26 05:59:53',NULL,0),


(1250,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"{     \\\"records\\\": {       {         \\\"id\\\": \\\"1\\\",         \\\"createTime\\\": \\\"2021-05-31 18:08:43\\\",         \\\"updateTime\\\": \\\"2023-06-14 22:54:32\\\",         \\\"isDeleted\\\": 0,         \\\"param\\\": {},         \\\"username\\\": \\\"admin\\\",         \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",         \\\"name\\\": \\\"admin\\\",         \\\"phone\\\": \\\"13414730186\\\",         \\\"headUrl\\\": \\\"\\\",         \\\"deptId\\\": 1021,         \\\"postId\\\": 5,         \\\"description\\\": null,         \\\"status\\\": 1,         \\\"roleList\\\": null,         \\\"postName\\\": null,         \\\"deptName\\\": null       }     } }\",\"param\":{},\"name\":\"用户列表\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.\r\n### The error may exist in com/hwj/system/mapper/SysMockMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysMockMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_mock  ( name, mock_data )  VALUES  ( ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.\n; Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.',NULL,'2023-08-26 05:59:53',NULL,0),


(1251,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"{     \\\"records\\\": {       {         \\\"id\\\": \\\"1\\\",         \\\"createTime\\\": \\\"2021-05-31 18:08:43\\\",         \\\"updateTime\\\": \\\"2023-06-14 22:54:32\\\",         \\\"isDeleted\\\": 0,         \\\"param\\\": {},         \\\"username\\\": \\\"admin\\\",         \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",         \\\"name\\\": \\\"admin\\\",         \\\"phone\\\": \\\"13414730186\\\",         \\\"headUrl\\\": \\\"\\\",         \\\"deptId\\\": 1021,         \\\"postId\\\": 5,         \\\"description\\\": null,         \\\"status\\\": 1,         \\\"roleList\\\": null,         \\\"postName\\\": null,         \\\"deptName\\\": null       }     } }\",\"param\":{},\"name\":\"用户列表\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.\r\n### The error may exist in com/hwj/system/mapper/SysMockMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysMockMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_mock  ( name, mock_data )  VALUES  ( ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.\n; Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Missing a name for object member.\" at position 25 in value for column \'sys_mock.mock_data\'.',NULL,'2023-08-26 05:59:53',NULL,0),


(1252,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"1\",\"param\":{},\"name\":\"1\",\"id\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:05:55',NULL,0),


(1253,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"1\",\"param\":{},\"name\":\"1\",\"id\":\"2\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:05:55',NULL,0),


(1254,'模拟数据管理','DELETE','com.hwj.system.controller.SysMockController.remove()','DELETE','MANAGE','admin','','/admin/system/sysMock/remove/2','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:05:59',NULL,0),


(1255,'模拟数据管理','DELETE','com.hwj.system.controller.SysMockController.remove()','DELETE','MANAGE','admin','','/admin/system/sysMock/remove/1','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:06:02',NULL,0),


(1256,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"{     \\\"records\\\": {       {         \\\"id\\\": \\\"1\\\",         \\\"createTime\\\": \\\"2021-05-31 18:08:43\\\",         \\\"updateTime\\\": \\\"2023-06-14 22:54:32\\\",         \\\"isDeleted\\\": 0,         \\\"param\\\": {},         \\\"username\\\": \\\"admin\\\",         \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",         \\\"name\\\": \\\"admin\\\",         \\\"phone\\\": \\\"13414730186\\\",         \\\"headUrl\\\": \\\"\\\",         \\\"deptId\\\": 1021,         \\\"postId\\\": 5,         \\\"description\\\": null,         \\\"status\\\": 1,         \\\"roleList\\\": null,         \\\"postName\\\": null,         \\\"deptName\\\": null       }     } }\",\"param\":{},\"name\":\"用户列表\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysMockMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysMockMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_mock  ( name, mock_data )  VALUES  ( ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1\n; Data truncation: Data too long for column \'mock_data\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1',NULL,'2023-08-26 06:06:33',NULL,0),


(1257,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"{     \\\"records\\\": {       {         \\\"id\\\": \\\"1\\\",         \\\"username\\\": \\\"admin\\\",         \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",         \\\"name\\\": \\\"admin\\\",         \\\"phone\\\": \\\"13414730186\\\",       }     } }\",\"param\":{},\"name\":\"用户列表\",\"id\":\"3\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:08:22',NULL,0),


(1258,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/68','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:09:59',NULL,0),


(1259,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"{     \\\"records\\\": {       {         \\\"id\\\": \\\"1\\\",         \\\"username\\\": \\\"admin\\\",         \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",         \\\"name\\\": \\\"admin\\\",         \\\"phone\\\": \\\"13414730186\\\",       },       {         \\\"id\\\": \\\"5\\\",         \\\"username\\\": \\\"hwj1218\\\",         \\\"password\\\": \\\"e10adc3949ba59abbe56e057f20f883e\\\",         \\\"name\\\": \\\"何伟健\\\",         \\\"phone\\\": \\\"15816474932\\\",       },       {         \\\"id\\\": \\\"6\\\",         \\\"username\\\": \\\"hwj2023\\\",         \\\"password\\\": \\\"e10adc3949ba59abbe56e057f20f883e\\\",         \\\"name\\\": \\\"何世九\\\",         \\\"phone\\\": \\\"17058787425\\\",       }     }    }\",\"param\":{},\"name\":\"用户\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysMockMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysMockMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_mock  ( name, mock_data )  VALUES  ( ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1\n; Data truncation: Data too long for column \'mock_data\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1',NULL,'2023-08-26 06:16:09',NULL,0),


(1260,'模拟数据管理','INSERT','com.hwj.system.controller.SysMockController.save()','POST','MANAGE','admin','','/admin/system/sysMock/save','127.0.0.1','{\"mockData\":\"x {    \\\"records\\\": {      {        \\\"id\\\": \\\"1\\\",        \\\"username\\\": \\\"admin\\\",        \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",        \\\"name\\\": \\\"admin\\\",        \\\"phone\\\": \\\"13414730186\\\",      },      {        \\\"id\\\": \\\"5\\\",        \\\"username\\\": \\\"hwj1218\\\",        \\\"password\\\": \\\"e10adc3949ba59abbe56e057f20f883e\\\",        \\\"name\\\": \\\"何伟健\\\",        \\\"phone\\\": \\\"15816474932\\\",      }    }}\",\"param\":{},\"name\":\"用户\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysMockMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysMockMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_mock  ( name, mock_data )  VALUES  ( ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1\n; Data truncation: Data too long for column \'mock_data\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'mock_data\' at row 1',NULL,'2023-08-26 06:16:41',NULL,0),


(1261,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:17:51',NULL,0),


(1262,'模拟数据管理','DELETE','com.hwj.system.controller.SysMockController.remove()','DELETE','MANAGE','admin','','/admin/system/sysMock/remove/3','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:20:29',NULL,0),


(1263,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/68','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:37:46',NULL,0),


(1264,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、UserQueryVo\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 1,\\n   \\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:38:43',NULL,0),


(1265,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"JSON\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:40:38',NULL,0),


(1266,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象\\n username: String,\\n  email: String, \\n  password: Long\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"12345678\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE sys_api  SET api_name=?, path=?, http_method=?, parameter_name=?, parameter_type=?, response_data_structure=?, request_parameters=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\n; Data truncation: Data too long for column \'parameter_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1',NULL,'2023-08-26 06:45:00',NULL,0),


(1267,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象\\n username: String,\\n  email: String, \\n  password: Long\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"12345678\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE sys_api  SET api_name=?, path=?, http_method=?, parameter_name=?, parameter_type=?, response_data_structure=?, request_parameters=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\n; Data truncation: Data too long for column \'parameter_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1',NULL,'2023-08-26 06:45:35',NULL,0),


(1268,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象：username: String,email: String, password: Long\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"12345678\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE sys_api  SET api_name=?, path=?, http_method=?, parameter_name=?, parameter_type=?, response_data_structure=?, request_parameters=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\n; Data truncation: Data too long for column \'parameter_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1',NULL,'2023-08-26 06:46:27',NULL,0),


(1269,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象：username: String,email: String, password: Long\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE sys_api  SET api_name=?, path=?, http_method=?, parameter_name=?, parameter_type=?, response_data_structure=?, request_parameters=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\n; Data truncation: Data too long for column \'parameter_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1',NULL,'2023-08-26 06:46:51',NULL,0),


(1270,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:47:20',NULL,0),


(1271,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象 username: String,email: String, password: Long\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','',0,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\r\n### The error may exist in com/hwj/system/mapper/SysApiMapper.java (best guess)\r\n### The error may involve com.hwj.system.mapper.SysApiMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE sys_api  SET api_name=?, path=?, http_method=?, parameter_name=?, parameter_type=?, response_data_structure=?, request_parameters=?, create_time=?, update_time=?  WHERE id=?  AND is_deleted=0\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1\n; Data truncation: Data too long for column \'parameter_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'parameter_type\' at row 1',NULL,'2023-08-26 06:47:48',NULL,0),


(1272,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象 username: String,email: String, password: Long\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:48:22',NULL,0),


(1273,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user对象 username: String,email: String, password: Long\",\"path\":\"/api/user/login\",\"apiName\":\"用户登录\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户登录成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"Login\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:48:39',NULL,0),


(1274,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long、 userQueryVo： username: String,email: String, password: Long\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 1,\\n   \\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:49:24',NULL,0),


(1275,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user： username: String,email: String, password: Long\",\"path\":\"/api/user/register\",\"apiName\":\"用户注册\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户注册成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{ \\n \\\"username\\\": \\\"john_doe\\\",\\n  \\\"email\\\": \\\"john@example.com\\\", \\n  \\\"password\\\": \\\"123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"45\",\"parameterName\":\"user\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:49:34',NULL,0),


(1276,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"user： username: String,email: String, password: Long\",\"path\":\"/api/user/login\",\"apiName\":\"用户登录\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"john_doe 用户登录成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"username\\\": \\\"john_doe\\\", \\n\\\"password\\\": \\\"password123\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"46\",\"parameterName\":\"Login\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:49:41',NULL,0),


(1277,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"article: title: String, content: String\\n\",\"path\":\"/book/post/create\",\"apiName\":\"文章创建\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"新文章 文章创建成功\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n\\\"title\\\": \\\"新文章\\\", \\n\\\"content\\\": \\\"这是新文章的内容。\\\"\\n}\",\"updateTime\":1691860106000,\"id\":\"47\",\"parameterName\":\"article\",\"httpMethod\":\"POST\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:50:43',NULL,0),


(1278,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数, article: title: String, content: String\",\"path\":\"/book/post/{id}/update\",\"apiName\":\"文章更新\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章更新   [title, content]:修改成[更新后的文章, 这是更新后的文章内容。]\\\", \\\"success\\\": true, \\\"pathParameter\\\": [{\\\"name\\\": \\\"id\\\", \\\"value\\\": \\\"1\\\"}]}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"title\\\": \\\"更新后的文章\\\",\\n    \\\"content\\\": \\\"这是更新后的文章内容。\\\"\\n  \\n}\",\"updateTime\":1691860106000,\"id\":\"48\",\"parameterName\":\"id, article\",\"httpMethod\":\"PUT\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:50:54',NULL,0),


(1279,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"URL 参数\",\"path\":\"/book/post/delete{id}\",\"apiName\":\"文章删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"SELECT\\\": [{\\\"name\\\": \\\"id\\\", \\\"value\\\": \\\"111\\\"}], \\\"message\\\": \\\"文章删除 成功删除该数据\\\", \\\"success\\\": true}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\\"id\\\": 789}\",\"updateTime\":1691860106000,\"id\":\"49\",\"parameterName\":\"id\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:50:59',NULL,0),


(1280,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"List\",\"path\":\"/book/post/delete\",\"apiName\":\"文章批量删除\",\"responseDataStructure\":\"{\\\"code\\\": 200, \\\"data\\\": {\\\"message\\\": \\\"文章批量输出 成功\\\", \\\"success\\\": true, \\\"DELETE-LIST\\\": \\\"\\\"}, \\\"message\\\": \\\"成功\\\"}\",\"isDeleted\":0,\"createTime\":1692206889000,\"param\":{},\"requestParameters\":\"{\\n  \\\"idList\\\": [85, 92, 78]\\n}\\n\",\"updateTime\":1692206889000,\"id\":\"51\",\"parameterName\":\"idList\",\"httpMethod\":\"DELETE\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:52:00',NULL,0),


(1281,'模拟数据管理','UPDATE','com.hwj.system.controller.SysMockController.updateById()','PUT','MANAGE','admin','','/admin/system/sysMock/update','127.0.0.1','{\"mockData\":\"{     \\\"records\\\": {       {  \\\"username\\\": \\\"admin\\\",         \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\",  \\\"email\\\": \\\"13414730186@qq.com\\\",       }     } }\",\"isDeleted\":0,\"createTime\":1693001302000,\"param\":{},\"name\":\"用户列表\",\"updateTime\":1693002045000,\"id\":\"3\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 06:53:25',NULL,0),


(1282,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 1,\\n   \\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit,  userQueryVo\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 07:05:01',NULL,0),


(1283,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','',0,'Invalid bound statement (not found): com.hwj.system.mapper.SysMockMapper.selectMockDataByApiName',NULL,'2023-08-26 07:18:09',NULL,0),


(1284,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','',0,'Invalid bound statement (not found): com.hwj.system.mapper.SysMockMapper.selectMockDataByApiName',NULL,'2023-08-26 19:06:37',NULL,0),


(1285,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','',0,'syntax error, pos 7, line 1, column 8SysMock(name=null, mockData={     \"records\": {       {  \"username\": \"admin\",         \"password\": \"96e79218965eb72c92a549dd5a330112\",  \"email\": \"13414730186@qq.com\",       }     } })',NULL,'2023-08-26 19:09:08',NULL,0),


(1286,'模拟数据管理','UPDATE','com.hwj.system.controller.SysMockController.updateById()','PUT','MANAGE','admin','','/admin/system/sysMock/update','127.0.0.1','{\"mockData\":\"{ \\\"records\\\": { \\\"username\\\": \\\"admin\\\", \\\"password\\\": \\\"96e79218965eb72c92a549dd5a330112\\\", \\\"email\\\": \\\"13414730186@qq.com\\\" } }\",\"isDeleted\":0,\"createTime\":1693001302000,\"param\":{},\"name\":\"用户列表\",\"updateTime\":1693002045000,\"id\":\"3\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 19:10:38',NULL,0),


(1287,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','',0,'syntax error, pos 7, line 1, column 8SysMock(name=null, mockData={ \"records\": { \"username\": \"admin\", \"password\": \"96e79218965eb72c92a549dd5a330112\", \"email\": \"13414730186@qq.com\" } })',NULL,'2023-08-26 19:10:51',NULL,0),


(1288,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','',0,'syntax error, pos 7, line 1, column 8SysMock(name=null, mockData={ \"records\": { \"username\": \"admin\", \"password\": \"96e79218965eb72c92a549dd5a330112\", \"email\": \"13414730186@qq.com\" } })',NULL,'2023-08-26 19:10:56',NULL,0),


(1289,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','',0,'syntax error, pos 7, line 1, column 8SysMock(name=null, mockData={ \"records\": { \"username\": \"admin\", \"password\": \"96e79218965eb72c92a549dd5a330112\", \"email\": \"13414730186@qq.com\" } })',NULL,'2023-08-26 19:13:27',NULL,0),


(1290,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','',0,'syntax error, pos 7, line 1, column 8SysMock(name=null, mockData={ \"records\": { \"username\": \"admin\", \"password\": \"96e79218965eb72c92a549dd5a330112\", \"email\": \"13414730186@qq.com\" } })',NULL,'2023-08-26 19:14:53',NULL,0),


(1291,'接口管理','OTHER','com.hwj.system.controller.SysApiController.invokeGet()','GET','MANAGE','admin','','/admin/system/sysApi/invoke','0:0:0:0:0:0:0:1','','{\"code\":200,\"data\":{\"data\":{\"records\":{\"password\":\"96e79218965eb72c92a549dd5a330112\",\"email\":\"13414730186@qq.com\",\"username\":\"admin\"}}},\"message\":\"成功\"}',1,'',NULL,'2023-08-26 19:18:58',NULL,0),


(1292,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-26 19:31:30',NULL,0),


(1293,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"63\",\"52\",\"53\",\"54\",\"55\",\"56\",\"58\",\"59\",\"60\",\"61\",\"64\",\"65\",\"66\",\"67\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 19:31:40',NULL,0),


(1294,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统用户\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通用户\",\"updateTime\":1687363013000},{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试人员\",\"updateTime\":1686836155000}],\"searchCount\":true,\"size\":3,\"total\":6},\"message\":\"成功\"}',1,'',NULL,'2023-08-26 19:31:40',NULL,0),


(1295,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 19:31:43',NULL,0),


(1296,'接口管理','UPDATE','com.hwj.system.controller.SysApiController.updateById()','PUT','MANAGE','admin','','/admin/system/sysApi/update','127.0.0.1','{\"parameterType\":\"Long、Long\",\"path\":\"/api/users//{page}/{limit}\",\"apiName\":\"用户列表\",\"responseDataStructure\":\"[{\\\"id\\\": 1, \\\"age\\\": 30, \\\"email\\\": \\\"john@example.com\\\", \\\"username\\\": \\\"john_doe\\\", \\\"is_active\\\": true}, {\\\"id\\\": 2, \\\"age\\\": 28, \\\"email\\\": \\\"jane@example.com\\\", \\\"username\\\": \\\"jane_smith\\\", \\\"is_active\\\": true}]\",\"isDeleted\":0,\"createTime\":1691860106000,\"param\":{},\"requestParameters\":\"{\\n    \\\"page\\\": 1,\\n    \\\"limit\\\": 1,\\n   \\n}\",\"updateTime\":1691860106000,\"id\":\"50\",\"parameterName\":\"page, limit\",\"httpMethod\":\"GET\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-26 19:32:08',NULL,0);



UNLOCK TABLES;



/*Table structure for table `sys_role` */



CREATE TABLE `sys_role` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',

  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',

  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',

  `description` varchar(255) DEFAULT NULL COMMENT '描述',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='角色';



/*Data for the table `sys_role` */



LOCK TABLES `sys_role` WRITE;



insert  into `sys_role`(`id`,`role_name`,`role_code`,`description`,`create_time`,`update_time`,`is_deleted`) values 


(1,'系统用户','SYSTEM','超级管理员','2021-05-31 18:09:18','2023-06-14 23:08:48',0),


(2,'普通用户','COMMON','普通管理员','2021-06-01 08:38:40','2023-06-21 23:56:53',0),


(3,'用户管理员','USER','用户管理员','2022-06-08 17:39:04','2023-08-03 19:15:20',1),


(5,'测试人员','TEST','测试管理员','2023-06-14 17:40:59','2023-06-15 21:35:55',0),


(11,'开发人员','EXPLOITATION','普通人员','2023-06-14 18:00:55','2023-06-15 21:36:05',0),


(12,'运维人员','MONITOR',NULL,'2023-08-03 19:19:27','2023-08-03 19:19:27',0),


(13,'项目经理','PROJECT MANAGER',NULL,'2023-08-05 00:02:14','2023-08-05 00:02:14',0);



UNLOCK TABLES;



/*Table structure for table `sys_role_menu` */



CREATE TABLE `sys_role_menu` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT,

  `role_id` bigint(20) NOT NULL DEFAULT '0',

  `menu_id` bigint(11) NOT NULL DEFAULT '0',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`),

  KEY `idx_role_id` (`role_id`),

  KEY `idx_menu_id` (`menu_id`)

) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8 COMMENT='角色菜单';



/*Data for the table `sys_role_menu` */



LOCK TABLES `sys_role_menu` WRITE;



insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`,`create_time`,`update_time`,`is_deleted`) values 


(554,1,2,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(555,1,3,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(556,1,6,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(557,1,7,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(558,1,8,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(559,1,9,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(560,1,18,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(561,1,37,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(562,1,4,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(563,1,10,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(564,1,11,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(565,1,12,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(566,1,13,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(567,1,19,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(568,1,38,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(569,1,5,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(570,1,14,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(571,1,15,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(572,1,16,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(573,1,17,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(574,1,34,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(575,1,30,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(576,1,31,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(577,1,42,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(578,1,43,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(579,1,32,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(580,1,33,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(581,1,44,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(582,1,45,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(583,1,46,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(584,1,47,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(585,1,48,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(586,1,49,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(587,1,50,'2023-08-07 01:03:13','2023-08-08 02:24:41',1),


(588,1,2,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(589,1,3,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(590,1,6,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(591,1,7,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(592,1,8,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(593,1,9,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(594,1,18,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(595,1,37,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(596,1,4,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(597,1,10,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(598,1,11,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(599,1,12,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(600,1,13,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(601,1,19,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(602,1,38,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(603,1,5,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(604,1,14,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(605,1,15,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(606,1,16,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(607,1,17,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(608,1,34,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(609,1,30,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(610,1,31,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(611,1,42,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(612,1,43,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(613,1,32,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(614,1,33,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(615,1,44,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(616,1,45,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(617,1,46,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(618,1,47,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(619,1,48,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(620,1,49,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(621,1,50,'2023-08-08 02:24:41','2023-08-08 22:11:30',1),


(622,1,2,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(623,1,3,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(624,1,6,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(625,1,7,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(626,1,8,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(627,1,9,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(628,1,18,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(629,1,37,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(630,1,4,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(631,1,10,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(632,1,11,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(633,1,12,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(634,1,13,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(635,1,19,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(636,1,38,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(637,1,5,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(638,1,14,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(639,1,15,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(640,1,16,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(641,1,17,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(642,1,34,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(643,1,30,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(644,1,31,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(645,1,42,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(646,1,43,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(647,1,32,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(648,1,33,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(649,1,44,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(650,1,45,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(651,1,46,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(652,1,47,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(653,1,48,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(654,1,49,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(655,1,50,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(656,1,51,'2023-08-08 22:11:30','2023-08-08 22:12:13',1),


(657,1,2,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(658,1,3,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(659,1,6,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(660,1,7,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(661,1,8,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(662,1,9,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(663,1,18,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(664,1,37,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(665,1,4,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(666,1,10,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(667,1,11,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(668,1,12,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(669,1,13,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(670,1,19,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(671,1,38,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(672,1,5,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(673,1,14,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(674,1,15,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(675,1,16,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(676,1,17,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(677,1,34,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(678,1,30,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(679,1,31,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(680,1,42,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(681,1,43,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(682,1,32,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(683,1,33,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(684,1,44,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(685,1,45,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(686,1,46,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(687,1,47,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(688,1,48,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(689,1,49,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(690,1,50,'2023-08-08 22:12:13','2023-08-08 22:46:45',1),


(691,1,2,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(692,1,3,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(693,1,6,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(694,1,7,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(695,1,8,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(696,1,9,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(697,1,18,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(698,1,37,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(699,1,4,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(700,1,10,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(701,1,11,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(702,1,12,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(703,1,13,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(704,1,19,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(705,1,38,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(706,1,5,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(707,1,14,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(708,1,15,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(709,1,16,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(710,1,17,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(711,1,34,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(712,1,30,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(713,1,31,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(714,1,42,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(715,1,43,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(716,1,32,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(717,1,33,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(718,1,44,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(719,1,45,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(720,1,46,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(721,1,47,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(722,1,48,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(723,1,49,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(724,1,50,'2023-08-08 22:46:45','2023-08-08 22:47:01',1),


(725,1,2,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(726,1,3,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(727,1,6,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(728,1,7,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(729,1,8,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(730,1,9,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(731,1,18,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(732,1,37,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(733,1,4,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(734,1,10,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(735,1,11,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(736,1,12,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(737,1,13,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(738,1,38,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(739,1,5,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(740,1,14,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(741,1,15,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(742,1,16,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(743,1,17,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(744,1,34,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(745,1,30,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(746,1,31,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(747,1,42,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(748,1,43,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(749,1,32,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(750,1,33,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(751,1,44,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(752,1,45,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(753,1,46,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(754,1,47,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(755,1,48,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(756,1,49,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(757,1,50,'2023-08-08 22:47:01','2023-08-08 22:47:08',1),


(758,1,2,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(759,1,3,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(760,1,6,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(761,1,7,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(762,1,8,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(763,1,9,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(764,1,18,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(765,1,37,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(766,1,4,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(767,1,10,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(768,1,11,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(769,1,12,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(770,1,13,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(771,1,38,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(772,1,5,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(773,1,14,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(774,1,15,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(775,1,16,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(776,1,17,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(777,1,34,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(778,1,30,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(779,1,31,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(780,1,42,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(781,1,43,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(782,1,32,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(783,1,33,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(784,1,44,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(785,1,45,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(786,1,46,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(787,1,47,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(788,1,48,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(789,1,49,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(790,1,50,'2023-08-08 22:47:08','2023-08-08 22:47:23',1),


(791,1,2,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(792,1,3,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(793,1,6,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(794,1,7,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(795,1,8,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(796,1,9,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(797,1,18,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(798,1,37,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(799,1,4,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(800,1,11,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(801,1,12,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(802,1,13,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(803,1,38,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(804,1,5,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(805,1,14,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(806,1,15,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(807,1,16,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(808,1,17,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(809,1,34,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(810,1,30,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(811,1,31,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(812,1,42,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(813,1,43,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(814,1,32,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(815,1,33,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(816,1,44,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(817,1,45,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(818,1,46,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(819,1,47,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(820,1,48,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(821,1,49,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(822,1,50,'2023-08-08 22:47:23','2023-08-08 22:47:38',1),


(823,1,2,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(824,1,3,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(825,1,6,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(826,1,7,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(827,1,8,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(828,1,9,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(829,1,18,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(830,1,37,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(831,1,4,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(832,1,10,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(833,1,11,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(834,1,12,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(835,1,13,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(836,1,19,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(837,1,38,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(838,1,5,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(839,1,14,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(840,1,15,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(841,1,16,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(842,1,17,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(843,1,34,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(844,1,30,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(845,1,31,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(846,1,42,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(847,1,43,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(848,1,32,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(849,1,33,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(850,1,44,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(851,1,45,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(852,1,46,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(853,1,47,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(854,1,48,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(855,1,49,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(856,1,50,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(857,1,51,'2023-08-08 22:47:38','2023-08-10 01:00:36',1),


(858,1,2,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(859,1,3,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(860,1,6,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(861,1,7,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(862,1,8,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(863,1,9,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(864,1,18,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(865,1,37,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(866,1,4,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(867,1,10,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(868,1,11,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(869,1,12,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(870,1,13,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(871,1,19,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(872,1,38,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(873,1,5,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(874,1,14,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(875,1,15,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(876,1,16,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(877,1,17,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(878,1,34,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(879,1,30,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(880,1,31,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(881,1,42,'2023-08-10 01:00:36','2023-08-14 20:00:09',1),


(882,1,43,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(883,1,32,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(884,1,33,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(885,1,44,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(886,1,45,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(887,1,46,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(888,1,47,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(889,1,48,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(890,1,49,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(891,1,50,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(892,1,51,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(893,1,52,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(894,1,53,'2023-08-10 01:00:37','2023-08-14 20:00:09',1),


(895,1,2,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(896,1,3,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(897,1,6,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(898,1,7,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(899,1,8,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(900,1,9,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(901,1,18,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(902,1,37,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(903,1,4,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(904,1,10,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(905,1,11,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(906,1,12,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(907,1,13,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(908,1,19,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(909,1,38,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(910,1,5,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(911,1,14,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(912,1,15,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(913,1,16,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(914,1,17,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(915,1,34,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(916,1,30,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(917,1,31,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(918,1,42,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(919,1,43,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(920,1,32,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(921,1,33,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(922,1,44,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(923,1,45,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(924,1,46,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(925,1,47,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(926,1,48,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(927,1,49,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(928,1,50,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(929,1,51,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(930,1,52,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(931,1,53,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(932,1,54,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(933,1,55,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(934,1,56,'2023-08-14 20:00:09','2023-08-14 20:02:56',1),


(935,1,2,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(936,1,3,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(937,1,6,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(938,1,7,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(939,1,8,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(940,1,9,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(941,1,18,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(942,1,37,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(943,1,4,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(944,1,10,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(945,1,11,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(946,1,12,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(947,1,13,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(948,1,19,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(949,1,38,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(950,1,5,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(951,1,14,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(952,1,15,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(953,1,16,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(954,1,17,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(955,1,34,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(956,1,30,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(957,1,31,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(958,1,42,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(959,1,43,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(960,1,32,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(961,1,33,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(962,1,44,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(963,1,45,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(964,1,46,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(965,1,47,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(966,1,48,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(967,1,49,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(968,1,50,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(969,1,51,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(970,1,52,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(971,1,53,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(972,1,54,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(973,1,55,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(974,1,56,'2023-08-14 20:02:56','2023-08-18 03:52:34',1),


(975,1,2,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(976,1,3,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(977,1,6,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(978,1,7,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(979,1,8,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(980,1,9,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(981,1,18,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(982,1,37,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(983,1,4,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(984,1,10,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(985,1,11,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(986,1,12,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(987,1,13,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(988,1,19,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(989,1,38,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(990,1,5,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(991,1,14,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(992,1,15,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(993,1,16,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(994,1,17,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(995,1,34,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(996,1,30,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(997,1,31,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(998,1,42,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(999,1,43,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1000,1,32,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1001,1,33,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1002,1,44,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1003,1,45,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1004,1,46,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1005,1,47,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1006,1,48,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1007,1,49,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1008,1,50,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1009,1,51,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1010,1,52,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1011,1,53,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1012,1,54,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1013,1,55,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1014,1,56,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1015,1,58,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1016,1,59,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1017,1,60,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1018,1,61,'2023-08-18 03:52:34','2023-08-19 08:29:11',1),


(1019,1,2,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1020,1,3,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1021,1,6,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1022,1,7,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1023,1,8,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1024,1,9,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1025,1,18,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1026,1,37,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1027,1,4,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1028,1,10,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1029,1,11,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1030,1,12,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1031,1,13,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1032,1,19,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1033,1,38,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1034,1,5,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1035,1,14,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1036,1,15,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1037,1,16,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1038,1,17,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1039,1,34,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1040,1,30,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1041,1,31,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1042,1,42,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1043,1,43,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1044,1,32,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1045,1,33,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1046,1,44,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1047,1,45,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1048,1,46,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1049,1,47,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1050,1,48,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1051,1,49,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1052,1,50,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1053,1,51,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1054,1,52,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1055,1,53,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1056,1,54,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1057,1,55,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1058,1,56,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1059,1,58,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1060,1,59,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1061,1,60,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1062,1,61,'2023-08-19 08:29:11','2023-08-26 19:31:40',1),


(1063,1,2,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1064,1,3,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1065,1,6,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1066,1,7,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1067,1,8,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1068,1,9,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1069,1,18,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1070,1,37,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1071,1,4,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1072,1,10,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1073,1,11,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1074,1,12,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1075,1,13,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1076,1,19,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1077,1,38,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1078,1,5,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1079,1,14,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1080,1,15,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1081,1,16,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1082,1,17,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1083,1,34,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1084,1,30,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1085,1,31,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1086,1,42,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1087,1,43,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1088,1,32,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1089,1,33,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1090,1,44,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1091,1,45,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1092,1,46,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1093,1,47,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1094,1,48,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1095,1,49,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1096,1,50,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1097,1,51,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1098,1,63,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1099,1,52,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1100,1,53,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1101,1,54,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1102,1,55,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1103,1,56,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1104,1,58,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1105,1,59,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1106,1,60,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1107,1,61,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1108,1,64,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1109,1,65,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1110,1,66,'2023-08-26 19:31:40','2023-08-26 19:31:40',0),


(1111,1,67,'2023-08-26 19:31:40','2023-08-26 19:31:40',0);



UNLOCK TABLES;



/*Table structure for table `sys_user` */



CREATE TABLE `sys_user` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员id',

  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',

  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',

  `name` varchar(50) DEFAULT NULL COMMENT '姓名',

  `phone` varchar(11) DEFAULT NULL COMMENT '手机',

  `head_url` varchar(200) DEFAULT NULL COMMENT '头像地址',

  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',

  `post_id` bigint(20) DEFAULT NULL COMMENT '岗位id',

  `description` varchar(255) DEFAULT NULL COMMENT '描述',

  `status` tinyint(3) DEFAULT '1' COMMENT '状态（1：正常 0：停用）',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`),

  UNIQUE KEY `idx_username` (`username`)

) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';



/*Data for the table `sys_user` */



LOCK TABLES `sys_user` WRITE;



insert  into `sys_user`(`id`,`username`,`password`,`name`,`phone`,`head_url`,`dept_id`,`post_id`,`description`,`status`,`create_time`,`update_time`,`is_deleted`) values 


(1,'admin','96e79218965eb72c92a549dd5a330112','admin','13414730186','',1021,5,NULL,1,'2021-05-31 18:08:43','2023-06-14 22:54:32',0),


(5,'hwj1218','e10adc3949ba59abbe56e057f20f883e','何伟健','15816474932',NULL,NULL,NULL,NULL,1,'2023-06-16 22:41:29','2023-06-16 22:41:29',0),


(6,'hwj2023','e10adc3949ba59abbe56e057f20f883e','何世九','17058787425',NULL,NULL,NULL,NULL,1,'2023-06-20 20:48:37','2023-06-20 20:48:37',0),


(7,'hwj1111','96e79218965eb72c92a549dd5a330112','李伟骏','13542747592',NULL,NULL,NULL,NULL,1,'2023-06-25 10:43:38','2023-06-25 10:43:38',0);



UNLOCK TABLES;



/*Table structure for table `sys_user_item` */



CREATE TABLE `sys_user_item` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',

  `item_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '项目id',

  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`),

  KEY `idx_item_id` (`item_id`),

  KEY `idx_admin_id` (`user_id`)

) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='项目成员';



/*Data for the table `sys_user_item` */



LOCK TABLES `sys_user_item` WRITE;



insert  into `sys_user_item`(`id`,`item_id`,`user_id`,`create_time`,`update_time`,`is_deleted`) values 


(11,1,5,'2023-08-08 20:35:40','2023-08-08 22:09:26',1),


(12,1,1,'2023-08-08 22:09:26','2023-08-08 22:12:22',1),


(13,1,1,'2023-08-08 22:12:22','2023-08-08 22:46:50',1),


(14,1,1,'2023-08-08 22:46:50','2023-08-08 22:46:50',0);



UNLOCK TABLES;



/*Table structure for table `sys_user_role` */



CREATE TABLE `sys_user_role` (

  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',

  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色id',

  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',

  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',

  PRIMARY KEY (`id`),

  KEY `idx_role_id` (`role_id`),

  KEY `idx_admin_id` (`user_id`)

) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='用户角色';



/*Data for the table `sys_user_role` */



LOCK TABLES `sys_user_role` WRITE;



insert  into `sys_user_role`(`id`,`role_id`,`user_id`,`create_time`,`update_time`,`is_deleted`) values 


(17,1,1,'2023-08-03 19:13:30','2023-08-07 01:03:18',1),


(18,2,5,'2023-08-03 19:13:36','2023-08-08 22:51:49',1),


(19,5,6,'2023-08-03 19:27:30','2023-08-03 19:27:30',0),


(20,11,7,'2023-08-03 19:27:40','2023-08-03 19:27:40',0),


(21,12,9,'2023-08-03 23:09:15','2023-08-03 23:09:15',0),


(22,1,1,'2023-08-07 01:03:18','2023-08-08 22:46:39',1),


(23,1,1,'2023-08-08 22:46:39','2023-08-19 08:29:05',1),


(24,2,5,'2023-08-08 22:51:49','2023-08-08 22:52:31',1),


(25,2,5,'2023-08-08 22:52:31','2023-08-08 22:52:31',0),


(26,1,1,'2023-08-19 08:29:05','2023-08-19 08:29:05',0);



UNLOCK TABLES;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

