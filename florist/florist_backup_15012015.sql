-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: florist
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add content type',3,'add_contenttype'),(8,'Can change content type',3,'change_contenttype'),(9,'Can delete content type',3,'delete_contenttype'),(10,'Can add session',4,'add_session'),(11,'Can change session',4,'change_session'),(12,'Can delete session',4,'delete_session'),(13,'Can add site',5,'add_site'),(14,'Can change site',5,'change_site'),(15,'Can delete site',5,'delete_site'),(16,'Can add daily report',6,'add_dailyreport'),(17,'Can change daily report',6,'change_dailyreport'),(18,'Can delete daily report',6,'delete_dailyreport'),(25,'Can add order',9,'add_order'),(26,'Can change order',9,'change_order'),(27,'Can delete order',9,'delete_order'),(28,'Can add order position',10,'add_orderposition'),(29,'Can change order position',10,'change_orderposition'),(30,'Can delete order position',10,'delete_orderposition'),(31,'Can add vat',11,'add_vat'),(32,'Can change vat',11,'change_vat'),(33,'Can delete vat',11,'delete_vat'),(34,'Can add user',12,'add_myuser'),(35,'Can change user',12,'change_myuser'),(36,'Can delete user',12,'delete_myuser'),(37,'Can add customer',13,'add_customer'),(38,'Can change customer',13,'change_customer'),(39,'Can delete customer',13,'delete_customer'),(40,'Can add selling place',14,'add_sellingplace'),(41,'Can change selling place',14,'change_sellingplace'),(42,'Can delete selling place',14,'delete_sellingplace'),(43,'Can add product',15,'add_product'),(44,'Can change product',15,'change_product'),(45,'Can delete product',15,'delete_product');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractors_customer`
--

DROP TABLE IF EXISTS `contractors_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractors_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `nip` varchar(13) NOT NULL,
  `name` varchar(512) NOT NULL,
  `address` varchar(512) NOT NULL,
  `telNumber` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contractors_customer_5fa96721` (`whoModified_id`),
  CONSTRAINT `whoModified_id_refs_id_0e3cea16` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractors_customer`
--

LOCK TABLES `contractors_customer` WRITE;
/*!40000 ALTER TABLE `contractors_customer` DISABLE KEYS */;
INSERT INTO `contractors_customer` VALUES (1,1,'2014-06-29 15:21:23',1,'222222','222','22','323'),(2,1,'2014-09-14 10:50:20',1,'s','sssssss','s','s'),(3,1,'2014-09-14 10:50:26',1,'s','6565656565','s','s'),(4,1,'2014-09-14 10:50:33',1,'s','mmmmmmm','s','s');
/*!40000 ALTER TABLE `contractors_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractors_sellingplace`
--

DROP TABLE IF EXISTS `contractors_sellingplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractors_sellingplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `address` varchar(512) NOT NULL,
  `telNumber` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contractors_sellingplace_5fa96721` (`whoModified_id`),
  KEY `contractors_sellingplace_cb902d83` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_2ba9b841` FOREIGN KEY (`owner_id`) REFERENCES `contractors_customer` (`id`),
  CONSTRAINT `whoModified_id_refs_id_d749c4a0` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractors_sellingplace`
--

LOCK TABLES `contractors_sellingplace` WRITE;
/*!40000 ALTER TABLE `contractors_sellingplace` DISABLE KEYS */;
INSERT INTO `contractors_sellingplace` VALUES (1,1,'2014-07-06 17:30:47',1,1,'zmiana adresu lololol','22222'),(2,0,'2014-07-06 17:36:09',1,1,'lololol','212121212'),(3,1,'2014-07-20 14:23:59',1,1,'ewewe','22222'),(4,1,'2014-07-06 17:13:59',1,1,'fgfg','gfgf'),(5,1,'2014-07-06 17:15:15',1,1,'dd','dd'),(6,1,'2014-07-20 14:24:09',1,1,'ds','ds');
/*!40000 ALTER TABLE `contractors_sellingplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_myuser`
--

DROP TABLE IF EXISTS `core_myuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_myuser`
--

LOCK TABLES `core_myuser` WRITE;
/*!40000 ALTER TABLE `core_myuser` DISABLE KEYS */;
INSERT INTO `core_myuser` VALUES (1,'pbkdf2_sha256$10000$ULAKOFDiwMd9$7zwrec4ZNcyN+qUEDV0uiEE15B37P9ypUzVAUZ4Fako=','2015-01-11 11:29:14',1,'wojtek','','','',1,1,'2014-06-29 12:22:17');
/*!40000 ALTER TABLE `core_myuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_myuser_groups`
--

DROP TABLE IF EXISTS `core_myuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_myuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myuser_id` (`myuser_id`,`group_id`),
  KEY `core_myuser_groups_f1d9e869` (`myuser_id`),
  KEY `core_myuser_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_19e831ef` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `myuser_id_refs_id_c51cd837` FOREIGN KEY (`myuser_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_myuser_groups`
--

LOCK TABLES `core_myuser_groups` WRITE;
/*!40000 ALTER TABLE `core_myuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_myuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_myuser_user_permissions`
--

DROP TABLE IF EXISTS `core_myuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_myuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myuser_id` (`myuser_id`,`permission_id`),
  KEY `core_myuser_user_permissions_f1d9e869` (`myuser_id`),
  KEY `core_myuser_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `myuser_id_refs_id_28c951a1` FOREIGN KEY (`myuser_id`) REFERENCES `core_myuser` (`id`),
  CONSTRAINT `permission_id_refs_id_6320ee75` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_myuser_user_permissions`
--

LOCK TABLES `core_myuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_myuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_myuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'content type','contenttypes','contenttype'),(4,'session','sessions','session'),(5,'site','sites','site'),(6,'daily report','selling','dailyreport'),(9,'order','selling','order'),(10,'order position','selling','orderposition'),(11,'vat','vats','vat'),(12,'user','core','myuser'),(13,'customer','contractors','customer'),(14,'selling place','contractors','sellingplace'),(15,'product','products','product');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0gygr9om8its36rrxb20n0nnlr3u39ga','OWQ3MTNjYzE4ZjI0MmYxM2Y0MjljYmFlNzQwNDlmNDAwODFiOTA1ZDp7InRlc3Rjb29raWUiOiJ3b3JrZWQiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2014-10-26 14:48:19'),('3qg4juvmz4j56qp5nwbb4v5ld6leqd3p','MmJmN2FhNTQ3MDRlOWJkNTE1ZTRlOTc0MjA1Y2JjMWRhN2QxMDIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-10 18:33:03'),('3vbm7b375x5fpmauevoucljvfsr9xzl0','MDZhM2I3NGUwM2U1ODgyZDhiM2IxNmE0NjUwZTY2MmI1ZjQxMmFhZjp7InRlc3Rjb29raWUiOiJ3b3JrZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-07-13 15:20:55'),('45r8mxdeai5bl3nghgydf6v7mm8mowdr','MmJmN2FhNTQ3MDRlOWJkNTE1ZTRlOTc0MjA1Y2JjMWRhN2QxMDIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-10 19:26:55'),('5ux42gmlfrvl2f8addz8xuo9mmnlvrrj','MDZhM2I3NGUwM2U1ODgyZDhiM2IxNmE0NjUwZTY2MmI1ZjQxMmFhZjp7InRlc3Rjb29raWUiOiJ3b3JrZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-11-25 19:18:11'),('bvzxew74kgfbsgkyus0uzzckjp20167r','MmJmN2FhNTQ3MDRlOWJkNTE1ZTRlOTc0MjA1Y2JjMWRhN2QxMDIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-21 16:13:42'),('mkiusg5w8p3wqft3bwut2hnijggb9u6a','MmJmN2FhNTQ3MDRlOWJkNTE1ZTRlOTc0MjA1Y2JjMWRhN2QxMDIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-01-25 11:29:14'),('rcrfao6ieene0vfdmoi0dwmz2nethx6k','MmJmN2FhNTQ3MDRlOWJkNTE1ZTRlOTc0MjA1Y2JjMWRhN2QxMDIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-08-03 14:23:42'),('wt8i7dewzs94myxpq6x02xmzrqk2dpwu','MmJmN2FhNTQ3MDRlOWJkNTE1ZTRlOTc0MjA1Y2JjMWRhN2QxMDIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-10 19:19:06');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `vatTax_id` int(11) NOT NULL,
  `nettoPrice` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_5fa96721` (`whoModified_id`),
  KEY `products_product_92f35381` (`vatTax_id`),
  CONSTRAINT `vatTax_id_refs_id_b061a08e` FOREIGN KEY (`vatTax_id`) REFERENCES `vats_vat` (`id`),
  CONSTRAINT `whoModified_id_refs_id_1a43799f` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,0,'2014-11-30 21:32:18',1,'dsds88888','ssss',3,1212.00),(2,0,'2014-11-29 20:52:44',1,'dsds','ssss',1,1212.00),(3,0,'2014-11-29 20:53:35',1,'dsds','ssss',1,1212.00),(4,0,'2014-11-29 20:56:11',1,'dalia','kwait szuczny',3,1.22),(5,0,'2014-11-29 21:00:38',1,'ww','rr',7,1.00),(6,0,'2014-11-29 21:01:33',1,'ww','rr',7,1.00),(7,0,'2014-11-29 21:04:23',1,'2','2',3,2.00),(8,0,'2014-11-29 21:44:15',1,'111111','11',3,11.00),(9,0,'2014-11-29 21:44:57',1,'a','a',3,1.00),(10,0,'2014-11-29 21:44:57',1,'a','a',3,1.00),(11,0,'2014-11-29 21:46:50',1,'a','a',3,11.00),(12,0,'2014-11-29 21:46:50',1,'q','q',7,1.00),(13,0,'2014-11-29 21:49:10',1,'q','q',7,1.00),(14,0,'2014-11-29 21:48:46',1,'2','2',3,1.00),(15,0,'2014-11-29 21:51:17',1,'2','2',6,2.00),(16,0,'2014-11-29 21:51:48',1,'2','2',6,2.00),(17,0,'2014-11-29 21:51:48',1,'a','a',4,1.00),(18,0,'2014-11-29 21:53:26',1,'a','a',4,1.00),(19,0,'2014-11-29 21:53:26',1,'1','1',3,1.00),(20,0,'2014-11-29 21:53:26',1,'1','1',3,1.00),(21,0,'2014-11-29 21:57:03',1,'qq','qq',3,1.00),(22,0,'2014-11-29 21:57:03',1,'1','1',3,11.00),(23,0,'2014-11-29 21:57:35',1,'1','1',3,1.00),(24,0,'2014-11-29 21:57:03',1,'6565','56565',3,222.00),(25,0,'2014-11-29 21:57:35',1,'6565','56565',3,222.00),(26,0,'2014-11-29 22:02:17',1,'a','aaa',3,111.00),(27,0,'2014-11-29 22:02:17',1,'1','1',6,1111.00),(28,0,'2014-11-29 22:03:41',1,'rer','ewew',7,33.00),(29,0,'2014-11-29 22:09:17',1,'2`2','3',7,33.00),(30,0,'2014-11-29 22:09:17',1,'444','444',5,33.00),(31,0,'2014-11-29 22:28:13',1,'212121','2121',5,2121.00),(32,0,'2014-11-29 22:28:13',1,'111','4343',6,5555.00),(33,0,'2014-11-29 22:45:24',1,'5555','5555',3,7777.00),(34,0,'2014-11-29 22:45:24',1,'8888','8888',4,888.00),(35,0,'2014-11-29 22:46:53',1,'3232','4343',5,1.22),(36,0,'2014-11-29 22:48:12',1,'dsds1111111112121','212121',6,121.00),(37,0,'2014-11-29 22:49:12',1,'dsds1111111112121','212121',6,121.00),(38,0,'2014-11-29 22:49:13',1,'zzz','zzz',4,3434.00),(39,0,'2014-11-29 22:55:43',1,'aaaa','aaa',3,222.00),(40,0,'2014-11-29 22:56:58',1,'222','222',6,222.00),(41,0,'2014-11-29 22:57:37',1,'2222','22',3,22.00),(42,0,'2014-11-29 22:59:33',1,'55','55',5,9898.00),(43,0,'2014-11-29 22:59:33',1,'777','999',5,777.00),(44,1,'2014-11-29 23:00:40',1,'llll','ggg',3,88.00),(45,1,'2014-11-29 23:03:24',1,'cxcxc','cxcxcxc',4,44.00),(46,1,'2014-11-29 23:03:33',1,'bbb','bbb',4,44.00),(47,1,'2014-11-30 19:40:32',1,'11','22',4,2121.00),(48,1,'2015-01-11 11:30:53',1,'eqwewe','ewewe',3,22.44);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_dailyreport`
--

DROP TABLE IF EXISTS `selling_dailyreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_dailyreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `ammount` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_dailyreport_5fa96721` (`whoModified_id`),
  KEY `selling_dailyreport_cb902d83` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_a74c17c7` FOREIGN KEY (`owner_id`) REFERENCES `core_myuser` (`id`),
  CONSTRAINT `whoModified_id_refs_id_a74c17c7` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_dailyreport`
--

LOCK TABLES `selling_dailyreport` WRITE;
/*!40000 ALTER TABLE `selling_dailyreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_dailyreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_discount`
--

DROP TABLE IF EXISTS `selling_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_discount_5fa96721` (`whoModified_id`),
  CONSTRAINT `whoModified_id_refs_id_d4ab5ad6` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_discount`
--

LOCK TABLES `selling_discount` WRITE;
/*!40000 ALTER TABLE `selling_discount` DISABLE KEYS */;
INSERT INTO `selling_discount` VALUES (1,1,'2014-06-29 12:23:34',1,14);
/*!40000 ALTER TABLE `selling_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_order`
--

DROP TABLE IF EXISTS `selling_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL,
  `payment` decimal(6,2) NOT NULL,
  `whoMadeIt_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_order_5fa96721` (`whoModified_id`),
  KEY `selling_order_ea3591c8` (`place_id`),
  KEY `selling_order_086f2bba` (`whoMadeIt_id`),
  CONSTRAINT `place_id_refs_id_ce2dbdc7` FOREIGN KEY (`place_id`) REFERENCES `contractors_sellingplace` (`id`),
  CONSTRAINT `whoMadeIt_id_refs_id_edeaee56` FOREIGN KEY (`whoMadeIt_id`) REFERENCES `core_myuser` (`id`),
  CONSTRAINT `whoModified_id_refs_id_edeaee56` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_order`
--

LOCK TABLES `selling_order` WRITE;
/*!40000 ALTER TABLE `selling_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_orderposition`
--

DROP TABLE IF EXISTS `selling_orderposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_orderposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `lp` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ammount` decimal(6,2) NOT NULL,
  `nettoValue` decimal(6,2) NOT NULL,
  `vatValue` decimal(6,2) NOT NULL,
  `bruttoValue` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_orderposition_5fa96721` (`whoModified_id`),
  KEY `selling_orderposition_68d25c7a` (`order_id`),
  KEY `selling_orderposition_7f1b40ad` (`product_id`),
  CONSTRAINT `order_id_refs_id_21660f2b` FOREIGN KEY (`order_id`) REFERENCES `selling_order` (`id`),
  CONSTRAINT `product_id_refs_id_e6d8cb21` FOREIGN KEY (`product_id`) REFERENCES `selling_product` (`id`),
  CONSTRAINT `whoModified_id_refs_id_5d805b5a` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_orderposition`
--

LOCK TABLES `selling_orderposition` WRITE;
/*!40000 ALTER TABLE `selling_orderposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_orderposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_product`
--

DROP TABLE IF EXISTS `selling_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `vatTax_id` int(11) NOT NULL,
  `nettoPrice` decimal(6,2) NOT NULL,
  `invoiceType` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_product_5fa96721` (`whoModified_id`),
  KEY `selling_product_92f35381` (`vatTax_id`),
  CONSTRAINT `vatTax_id_refs_id_dc1d8776` FOREIGN KEY (`vatTax_id`) REFERENCES `vats_vat` (`id`),
  CONSTRAINT `whoModified_id_refs_id_8a130f42` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_product`
--

LOCK TABLES `selling_product` WRITE;
/*!40000 ALTER TABLE `selling_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vats_vat`
--

DROP TABLE IF EXISTS `vats_vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vats_vat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isActive` tinyint(1) NOT NULL,
  `lastModification` datetime NOT NULL,
  `whoModified_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vats_vat_5fa96721` (`whoModified_id`),
  CONSTRAINT `whoModified_id_refs_id_e7ff24cb` FOREIGN KEY (`whoModified_id`) REFERENCES `core_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vats_vat`
--

LOCK TABLES `vats_vat` WRITE;
/*!40000 ALTER TABLE `vats_vat` DISABLE KEYS */;
INSERT INTO `vats_vat` VALUES (1,0,'2014-11-12 19:39:27',1,'ss1111',12),(2,0,'2014-11-26 18:34:10',1,'zwolniony',0),(3,0,'2015-01-11 11:32:23',1,'55%',55),(4,0,'2014-12-01 22:35:04',1,'1',11),(5,1,'2014-11-12 19:34:26',1,'aa',11),(6,1,'2014-11-12 19:36:29',1,'1',1),(7,1,'2014-11-26 18:33:36',1,'zwolniony',1),(8,1,'2014-11-26 20:08:36',1,'1',1),(9,1,'2014-11-26 20:09:11',1,'1',1),(10,1,'2014-11-26 20:09:59',1,'2121212',33),(11,1,'2014-12-01 22:35:32',1,'lol',77);
/*!40000 ALTER TABLE `vats_vat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-14 10:32:04
