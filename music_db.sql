-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accompany`
--

DROP TABLE IF EXISTS `accompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accompany` (
  `m_id` int(11) NOT NULL,
  `location` varchar(280) NOT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `music_id` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accompany`
--

LOCK TABLES `accompany` WRITE;
/*!40000 ALTER TABLE `accompany` DISABLE KEYS */;
INSERT INTO `accompany` VALUES (1,'C:UsersTongDesktopwhat if.mp3'),(2,'C:UsersTongDesktopmiao.mp3'),(4,'test'),(7,'accmopany_location'),(8,'accmopany_location'),(10,'/audio/Imagine Dragons - Natural.mp3'),(23,'E:/sql/storage/lrc/578c811b-e163-4512-8229-563ba29745e4.lrc');
/*!40000 ALTER TABLE `accompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `album` (
  `alb_id` int(11) NOT NULL AUTO_INCREMENT,
  `alb_name` varchar(30) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `releaseDate` datetime NOT NULL,
  `firstchar` varchar(45) NOT NULL,
  `cover` varchar(50) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `leader_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`alb_id`,`releaseDate`),
  UNIQUE KEY `alb_name` (`alb_name`),
  KEY `c_id2_idx` (`leader_id`),
  CONSTRAINT `c_id2` FOREIGN KEY (`leader_id`) REFERENCES `creator` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'单曲','单曲发售','2015-02-02 12:12:12','',NULL,NULL,NULL),(2,'Mr.Cat','来吸猫猫啊！','2019-07-18 16:14:00','MC',NULL,NULL,NULL),(3,'test1','just test!','2017-02-12 00:00:00','T1',NULL,NULL,NULL),(5,'测试专用','撒谎备注都行','2019-07-29 00:00:00','cszy',NULL,NULL,NULL),(6,'让酒',NULL,'2018-08-08 12:12:12','RJ',NULL,NULL,NULL),(7,'观察者',NULL,'2018-08-08 12:12:12','GCZ',NULL,NULL,NULL),(9,'冰雪奇缘',NULL,'2012-02-02 12:12:12','BXQY',NULL,NULL,NULL),(11,'圣诞节',NULL,'2018-12-24 12:12:12','SDJ',NULL,NULL,NULL),(12,'无根',NULL,'2014-07-02 12:12:12','WG',NULL,NULL,NULL),(16,'丝路花雨',NULL,'2014-01-02 14:12:12','SLHY',NULL,NULL,NULL),(17,'桃花扇',NULL,'1997-05-04 09:20:00','THS',NULL,NULL,NULL),(19,'梦回环',NULL,'2015-01-03 11:50:00','MHH',NULL,NULL,NULL),(20,'荣木',NULL,'2017-01-02 06:20:00','RM',NULL,NULL,NULL),(21,'射雕英雄传',NULL,'1994-08-02 22:00:00','SDYXZ',NULL,NULL,NULL),(22,'倚天屠龙记',NULL,'1994-05-06 12:00:00','YTTLJ',NULL,NULL,NULL),(23,'故乡',NULL,'2018-01-05 12:00:00','GX',NULL,NULL,NULL),(25,'北国',NULL,'2012-02-02 12:12:12','BG',NULL,NULL,NULL),(27,'山顶洞人',NULL,'2014-07-02 12:12:12','SDDR',NULL,NULL,NULL),(28,'三体',NULL,'2018-12-24 12:12:12','ST',NULL,NULL,NULL),(29,'混沌',NULL,'2012-02-02 12:12:12','HD',NULL,NULL,NULL),(30,'奇谈',NULL,'2018-12-24 12:12:12','QT',NULL,NULL,NULL),(31,'长江',NULL,'2018-08-08 12:12:12','CJ',NULL,NULL,NULL),(32,'饥饿游戏',NULL,'2012-02-02 12:12:12','JEYX',NULL,NULL,NULL),(33,'光',NULL,'2018-12-24 12:12:12','G',NULL,NULL,NULL),(34,'洞庭',NULL,'2018-08-08 12:12:12','DT',NULL,NULL,NULL),(35,'窃听',NULL,'2014-07-02 12:12:12','QT',NULL,NULL,NULL),(38,'春秋',NULL,'2018-08-08 12:12:12','CQ',NULL,NULL,NULL),(39,'南国',NULL,'2012-02-02 12:12:12','NG',NULL,NULL,NULL),(40,'秋水',NULL,'2018-08-08 12:12:12','QS',NULL,NULL,NULL),(41,'春潭',NULL,'2018-08-08 12:12:12','CT',NULL,NULL,NULL),(42,'冬眠',NULL,'2019-09-09 12:12:12','DM',NULL,NULL,NULL),(43,'繁星',NULL,'2019-09-09 12:12:12','FX',NULL,NULL,NULL),(44,'注水',NULL,'2019-09-09 12:12:12','ZS',NULL,NULL,NULL),(45,'东方',NULL,'2019-09-09 12:12:12','DF',NULL,NULL,NULL),(48,'寻',NULL,'2019-09-09 12:12:12','X',NULL,NULL,NULL),(49,'夏困',NULL,'2019-09-09 12:12:12','XK',NULL,NULL,NULL),(50,'F',NULL,'2019-09-09 12:12:12','F',NULL,NULL,NULL),(51,'星球',NULL,'2019-09-09 12:12:12','XQ',NULL,NULL,NULL),(52,'焚琴',NULL,'2019-09-09 12:12:12','FQ',NULL,NULL,NULL),(53,'煮鹤',NULL,'2019-09-09 12:12:12','ZH',NULL,NULL,NULL),(54,'haha',NULL,'2019-09-09 12:12:12','H',NULL,NULL,NULL),(55,'HEHE',NULL,'2019-09-09 12:12:12','H',NULL,NULL,NULL),(56,'HI',NULL,'2019-09-09 12:12:12','H',NULL,NULL,NULL),(57,'Y',NULL,'2019-09-09 12:12:12','Y',NULL,NULL,NULL),(58,'豆羹',NULL,'2014-04-04 01:01:01','DG',NULL,NULL,NULL),(59,'青鸟',NULL,'2014-04-04 01:01:01','QN',NULL,NULL,NULL),(61,'枣树',NULL,'2014-04-04 01:01:01','ZS',NULL,NULL,NULL),(62,'家有儿女',NULL,'2014-04-04 01:01:01','JYEN',NULL,NULL,NULL),(63,'Natural','梦龙专辑','2020-01-08 09:24:00','Natural',NULL,NULL,NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `album_music`
--

DROP TABLE IF EXISTS `album_music`;
/*!50001 DROP VIEW IF EXISTS `album_music`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `album_music` AS SELECT 
 1 AS `album_id`,
 1 AS `album_name`,
 1 AS `music_name`,
 1 AS `music_id`,
 1 AS `creator_id`,
 1 AS `creator_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `audio` (
  `m_id` int(11) NOT NULL,
  `location` varchar(180) NOT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `musci_id9` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='音频文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio`
--

LOCK TABLES `audio` WRITE;
/*!40000 ALTER TABLE `audio` DISABLE KEYS */;
INSERT INTO `audio` VALUES (1,'adsa'),(7,'audio_location'),(8,'audio_location'),(10,'/audio/Imagine Dragons - Natural.mp3'),(23,'E:/sql/storage/audio/da13c644-778b-4fbd-bed5-72b8948def25.mp3'),(25,'E:/sql/storage/audio/fe50b385-966f-4932-bd9a-06826dc2fe62.mp3'),(26,'E:/sql/storage/audio/882515bb-cc9c-413d-9aaa-21ee7894fb64.mp3');
/*!40000 ALTER TABLE `audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator`
--

DROP TABLE IF EXISTS `creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creator` (
  `c_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cover` int(11) DEFAULT NULL,
  `gender` char(5) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `view` int(15) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `firstchar` varchar(20) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `picture_id_idx` (`cover`),
  CONSTRAINT `picture_id` FOREIGN KEY (`cover`) REFERENCES `picture` (`pic_id`),
  CONSTRAINT `singer_id` FOREIGN KEY (`c_id`) REFERENCES `worker` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='歌手，制作人,特指，较为著名，信息较全';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator`
--

LOCK TABLES `creator` WRITE;
/*!40000 ALTER TABLE `creator` DISABLE KEYS */;
INSERT INTO `creator` VALUES (1,'三猫',5,'女','中国','上海猫猫居',1534,'云爹妈早安午安晚安~','sm'),(2,'花花',4,'男','中国','上海猫猫居',233,'女仆为您服务~','hh'),(5,'mdk',NULL,NULL,NULL,NULL,0,NULL,'mdk'),(7,'test_singer',NULL,NULL,NULL,NULL,0,NULL,'test_singer'),(10,'梦龙',NULL,'男','美国','纽约',12,'美国著名摇滚乐队','ml');
/*!40000 ALTER TABLE `creator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatormakealbum`
--

DROP TABLE IF EXISTS `creatormakealbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creatormakealbum` (
  `alb_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`alb_id`,`c_id`),
  KEY `c_id_idx` (`c_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`c_id`) REFERENCES `creator` (`c_id`),
  CONSTRAINT `creatormakealbum_ibfk_1` FOREIGN KEY (`alb_id`) REFERENCES `album` (`alb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatormakealbum`
--

LOCK TABLES `creatormakealbum` WRITE;
/*!40000 ALTER TABLE `creatormakealbum` DISABLE KEYS */;
INSERT INTO `creatormakealbum` VALUES (2,1),(2,2),(5,5),(61,5),(1,7),(3,7),(5,7),(61,7),(63,10);
/*!40000 ALTER TABLE `creatormakealbum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatormakemusic`
--

DROP TABLE IF EXISTS `creatormakemusic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creatormakemusic` (
  `m_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `arrangement_id` int(11) DEFAULT NULL,
  `lyricist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`m_id`,`c_id`),
  KEY `arrangement_id_idx` (`arrangement_id`),
  KEY `lyricist_id_idx` (`lyricist_id`),
  KEY `c_id1_idx` (`c_id`),
  CONSTRAINT `arrangement_id` FOREIGN KEY (`arrangement_id`) REFERENCES `music_worker` (`music_workerID`),
  CONSTRAINT `c_id1` FOREIGN KEY (`c_id`) REFERENCES `creator` (`c_id`),
  CONSTRAINT `lyricist_id` FOREIGN KEY (`lyricist_id`) REFERENCES `music_worker` (`music_workerID`),
  CONSTRAINT `music_id6` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatormakemusic`
--

LOCK TABLES `creatormakemusic` WRITE;
/*!40000 ALTER TABLE `creatormakemusic` DISABLE KEYS */;
INSERT INTO `creatormakemusic` VALUES (1,1,1,1),(2,1,4,3),(3,2,4,3),(7,7,9,8),(8,7,9,8),(10,10,10,10);
/*!40000 ALTER TABLE `creatormakemusic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatormakemusic_text`
--

DROP TABLE IF EXISTS `creatormakemusic_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creatormakemusic_text` (
  `m_id` int(11) NOT NULL,
  `singer_name` varchar(20) DEFAULT NULL,
  `composer_name` varchar(20) DEFAULT NULL,
  `lyricist_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `creatormakemusic_text_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatormakemusic_text`
--

LOCK TABLES `creatormakemusic_text` WRITE;
/*!40000 ALTER TABLE `creatormakemusic_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `creatormakemusic_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback` (
  `pagemark` varchar(20) DEFAULT NULL,
  `contain` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `information_singer`
--

DROP TABLE IF EXISTS `information_singer`;
/*!50001 DROP VIEW IF EXISTS `information_singer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `information_singer` AS SELECT 
 1 AS `singer_name`,
 1 AS `singer_id`,
 1 AS `cover_location`,
 1 AS `gender`,
 1 AS `country`,
 1 AS `area`,
 1 AS `singer_view`,
 1 AS `remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lrc`
--

DROP TABLE IF EXISTS `lrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lrc` (
  `m_id` int(11) NOT NULL,
  `location` varchar(180) NOT NULL,
  `contributor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `music_id5` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lrc`
--

LOCK TABLES `lrc` WRITE;
/*!40000 ALTER TABLE `lrc` DISABLE KEYS */;
INSERT INTO `lrc` VALUES (1,'null',NULL),(2,'C:UsersTongDesktopmiao.lrc','云玩家'),(10,'/audio/Imagine Dragons - Natural.mp3',NULL);
/*!40000 ALTER TABLE `lrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager` (
  `manage_id` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `manage_level` varchar(45) NOT NULL,
  PRIMARY KEY (`manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'123456','high'),(2,'123456','middle'),(3,'123456','low');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_worker`
--

DROP TABLE IF EXISTS `music_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music_worker` (
  `music_workerID` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `music_workerName` varchar(45) NOT NULL,
  PRIMARY KEY (`music_workerID`,`position`),
  KEY `music_workerID_idx` (`music_workerID`),
  KEY `music_workername_idx` (`music_workerName`),
  CONSTRAINT `music_workerID` FOREIGN KEY (`music_workerID`) REFERENCES `worker` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='特指作词作曲等对一首音乐的产生较为重要的人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_worker`
--

LOCK TABLES `music_worker` WRITE;
/*!40000 ALTER TABLE `music_worker` DISABLE KEYS */;
INSERT INTO `music_worker` VALUES (9,'作曲','testarrangement'),(8,'作词','testlyricist'),(1,'作曲','三猫'),(1,'作词','三猫'),(3,'作词','方文山'),(10,'作曲','梦龙'),(10,'作词','梦龙'),(4,'作曲','韦小宝');
/*!40000 ALTER TABLE `music_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musiccategory`
--

DROP TABLE IF EXISTS `musiccategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `musiccategory` (
  `m_id` int(11) NOT NULL,
  `cat_id` int(3) NOT NULL,
  PRIMARY KEY (`m_id`,`cat_id`),
  CONSTRAINT `music_id3` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musiccategory`
--

LOCK TABLES `musiccategory` WRITE;
/*!40000 ALTER TABLE `musiccategory` DISABLE KEYS */;
INSERT INTO `musiccategory` VALUES (1,1),(2,5),(3,3);
/*!40000 ALTER TABLE `musiccategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicinalbum`
--

DROP TABLE IF EXISTS `musicinalbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `musicinalbum` (
  `alb_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  PRIMARY KEY (`alb_id`,`m_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `musicinalbum_ibfk_1` FOREIGN KEY (`alb_id`) REFERENCES `album` (`alb_id`),
  CONSTRAINT `musicinalbum_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicinalbum`
--

LOCK TABLES `musicinalbum` WRITE;
/*!40000 ALTER TABLE `musicinalbum` DISABLE KEYS */;
INSERT INTO `musicinalbum` VALUES (2,1),(2,2),(2,3),(1,5),(5,9),(63,10),(7,11),(43,12),(7,13),(21,20),(9,23);
/*!40000 ALTER TABLE `musicinalbum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicmessage`
--

DROP TABLE IF EXISTS `musicmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `musicmessage` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(40) NOT NULL,
  `view` int(15) DEFAULT '0',
  `remark` varchar(126) DEFAULT NULL,
  `firstchar` varchar(20) NOT NULL,
  `picture` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `m_name` (`m_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicmessage`
--

LOCK TABLES `musicmessage` WRITE;
/*!40000 ALTER TABLE `musicmessage` DISABLE KEYS */;
INSERT INTO `musicmessage` VALUES (1,'Mr.White',0,'白老师是个呆逼?','MW',NULL),(2,'Mr.Du',0,'妈！头绳有点紧！','MD',NULL),(3,'Mr.Ma',0,'用来测试','MM',NULL),(4,'mdk',0,'nothing','test',NULL),(5,'test',0,'test','test',NULL),(6,'test1',0,'','test',NULL),(7,'testmusic',0,'testremark','testmusic',NULL),(8,'testmusic1',0,'testremark','testmusic',NULL),(9,'东郭先生',0,NULL,'DGXS','648ac377gy1fx8quveyjbj21kw2t5u10.jpg'),(10,'Natural',12,'梦龙单曲','Natural',NULL),(11,'山海',0,NULL,'SH',NULL),(12,'海子',0,NULL,'HZ',NULL),(13,'南华',0,NULL,'NH',NULL),(20,'碑亭',0,'','BT','E:/sql/storage/cover/ceef0254564e9258bf4b30d09282d158cdbf4eda.jpg'),(23,'造梦者',0,'','ZMZ','E:/sql/storage/cover/74cfa335-1018-4b06-bf51-77af44ae6776.jpg'),(25,'疏林',0,'','SL',''),(26,'夜空中最亮的星',0,'没啥说的','ykzzldx','');
/*!40000 ALTER TABLE `musicmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `picture` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (1,'C:UsersTongDesktopMr.White.jpg'),(2,'C:UsersTongDesktopMr.Du.jpg'),(3,'C:UsersTongDesktopMr.Cat.jpg'),(4,'C:UsersTongDesktophuahua.jpg'),(5,'C:UsersTongDesktopsanmao.jpg'),(6,'sadasdasd'),(9,'c.location');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `play_music`
--

DROP TABLE IF EXISTS `play_music`;
/*!50001 DROP VIEW IF EXISTS `play_music`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `play_music` AS SELECT 
 1 AS `music_id`,
 1 AS `video_location`,
 1 AS `accompany_location`,
 1 AS `audio_location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_albumfirrstchar`
--

DROP TABLE IF EXISTS `search_albumfirrstchar`;
/*!50001 DROP VIEW IF EXISTS `search_albumfirrstchar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_albumfirrstchar` AS SELECT 
 1 AS `album_name`,
 1 AS `album_id`,
 1 AS `album_maker`,
 1 AS `album_remark`,
 1 AS `album_releseDate`,
 1 AS `firstchar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_albumname`
--

DROP TABLE IF EXISTS `search_albumname`;
/*!50001 DROP VIEW IF EXISTS `search_albumname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_albumname` AS SELECT 
 1 AS `album_name`,
 1 AS `album_id`,
 1 AS `album_maker`,
 1 AS `album_remark`,
 1 AS `album_releseDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `search_charamount`
--

DROP TABLE IF EXISTS `search_charamount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `search_charamount` (
  `m_id` int(11) NOT NULL,
  `charAmount` int(2) NOT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `music_id2` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_charamount`
--

LOCK TABLES `search_charamount` WRITE;
/*!40000 ALTER TABLE `search_charamount` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_charamount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `search_musicbyfirstchar`
--

DROP TABLE IF EXISTS `search_musicbyfirstchar`;
/*!50001 DROP VIEW IF EXISTS `search_musicbyfirstchar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_musicbyfirstchar` AS SELECT 
 1 AS `music_id`,
 1 AS `music_name`,
 1 AS `creator_name`,
 1 AS `album_name`,
 1 AS `music_view`,
 1 AS `arrangenment_name`,
 1 AS `lyricist_name`,
 1 AS `music_remark`,
 1 AS `music_firstchar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_musicbyname`
--

DROP TABLE IF EXISTS `search_musicbyname`;
/*!50001 DROP VIEW IF EXISTS `search_musicbyname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_musicbyname` AS SELECT 
 1 AS `music_id`,
 1 AS `music_name`,
 1 AS `creator_name`,
 1 AS `album_name`,
 1 AS `music_view`,
 1 AS `arrangenment_name`,
 1 AS `lyricist_name`,
 1 AS `music_remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_singerfirstchar`
--

DROP TABLE IF EXISTS `search_singerfirstchar`;
/*!50001 DROP VIEW IF EXISTS `search_singerfirstchar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_singerfirstchar` AS SELECT 
 1 AS `creator_name`,
 1 AS `creator_id`,
 1 AS `creator_gender`,
 1 AS `creator_country`,
 1 AS `creator_area`,
 1 AS `creator_remark`,
 1 AS `creator_view`,
 1 AS `firstchar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_singername`
--

DROP TABLE IF EXISTS `search_singername`;
/*!50001 DROP VIEW IF EXISTS `search_singername`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_singername` AS SELECT 
 1 AS `creator_name`,
 1 AS `creator_id`,
 1 AS `creator_gender`,
 1 AS `creator_country`,
 1 AS `creator_area`,
 1 AS `creator_remark`,
 1 AS `creator_view`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `singer_music`
--

DROP TABLE IF EXISTS `singer_music`;
/*!50001 DROP VIEW IF EXISTS `singer_music`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `singer_music` AS SELECT 
 1 AS `singer_name`,
 1 AS `singer_id`,
 1 AS `music_name`,
 1 AS `music_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `table_admin`
--

DROP TABLE IF EXISTS `table_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `table_admin` (
  `admid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(10) NOT NULL,
  `phone` char(11) NOT NULL,
  `password` varchar(16) NOT NULL,
  `record` text,
  PRIMARY KEY (`admid`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_admin`
--

LOCK TABLES `table_admin` WRITE;
/*!40000 ALTER TABLE `table_admin` DISABLE KEYS */;
INSERT INTO `table_admin` VALUES (3,'龙族','13674025555','18','2018-8-7 注册'),(4,'人族','13674024444','111','2018-8-8 注册'),(5,'敖丙','13522221111','01',''),(6,'哪吒','13522222222','011',''),(8,'李靖','13544441111','nezha03','逆天改命'),(9,'殷夫人','13522224444','122',''),(11,'太乙','13511113333','61',NULL);
/*!40000 ALTER TABLE `table_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `VIP` int(11) NOT NULL DEFAULT '0',
  `email_address` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用来储存用户账号密码的表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'madengke','123',0,'2235535203@qq.com'),(3,'ma','123',0,'2235535203@qq.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `m_id` int(11) NOT NULL,
  `location` varchar(180) NOT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `musci_id` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'C://'),(7,'video_location'),(8,'video_location'),(10,'/audio/Imagine Dragons - Natural.mp3'),(23,'E:/sql/storage/video/2eb4cf18-d52a-4c1a-88be-1a112fed6221.mp4');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_account`
--

DROP TABLE IF EXISTS `view_account`;
/*!50001 DROP VIEW IF EXISTS `view_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_account` AS SELECT 
 1 AS `a`,
 1 AS `b`,
 1 AS `c`,
 1 AS `d`,
 1 AS `e`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_admin`
--

DROP TABLE IF EXISTS `view_admin`;
/*!50001 DROP VIEW IF EXISTS `view_admin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_admin` AS SELECT 
 1 AS `a`,
 1 AS `b`,
 1 AS `c`,
 1 AS `d`,
 1 AS `e`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_album`
--

DROP TABLE IF EXISTS `view_album`;
/*!50001 DROP VIEW IF EXISTS `view_album`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_album` AS SELECT 
 1 AS `a`,
 1 AS `b`,
 1 AS `c`,
 1 AS `d`,
 1 AS `e`,
 1 AS `f`,
 1 AS `g`,
 1 AS `h`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_create`
--

DROP TABLE IF EXISTS `view_create`;
/*!50001 DROP VIEW IF EXISTS `view_create`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_create` AS SELECT 
 1 AS `m_id`,
 1 AS `singer_id`,
 1 AS `singer_name`,
 1 AS `composer_id`,
 1 AS `composer_name`,
 1 AS `lyricist_id`,
 1 AS `lyricist_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_creator`
--

DROP TABLE IF EXISTS `view_creator`;
/*!50001 DROP VIEW IF EXISTS `view_creator`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_creator` AS SELECT 
 1 AS `a`,
 1 AS `b`,
 1 AS `c`,
 1 AS `d`,
 1 AS `e`,
 1 AS `f`,
 1 AS `g`,
 1 AS `h`,
 1 AS `i`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_location`
--

DROP TABLE IF EXISTS `view_location`;
/*!50001 DROP VIEW IF EXISTS `view_location`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_location` AS SELECT 
 1 AS `m_id`,
 1 AS `lrc`,
 1 AS `lrc_co`,
 1 AS `audio`,
 1 AS `acmp`,
 1 AS `video`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_music`
--

DROP TABLE IF EXISTS `view_music`;
/*!50001 DROP VIEW IF EXISTS `view_music`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_music` AS SELECT 
 1 AS `a`,
 1 AS `b`,
 1 AS `c`,
 1 AS `d`,
 1 AS `e`,
 1 AS `f`,
 1 AS `g`,
 1 AS `h`,
 1 AS `i`,
 1 AS `j`,
 1 AS `k`,
 1 AS `l`,
 1 AS `m`,
 1 AS `n`,
 1 AS `o`,
 1 AS `p`,
 1 AS `q`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_music_`
--

DROP TABLE IF EXISTS `view_music_`;
/*!50001 DROP VIEW IF EXISTS `view_music_`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_music_` AS SELECT 
 1 AS `m_id`,
 1 AS `m_name`,
 1 AS `view`,
 1 AS `remark`,
 1 AS `firstchar`,
 1 AS `picture`,
 1 AS `singer_id`,
 1 AS `singer_name`,
 1 AS `composer_id`,
 1 AS `composer_name`,
 1 AS `lyricist_id`,
 1 AS `lyricist_name`,
 1 AS `lrc`,
 1 AS `lrc_co`,
 1 AS `audio`,
 1 AS `acmp`,
 1 AS `video`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_musicid`
--

DROP TABLE IF EXISTS `view_musicid`;
/*!50001 DROP VIEW IF EXISTS `view_musicid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_musicid` AS SELECT 
 1 AS `m_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `worker` (
  `worker_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`worker_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='从事音乐行业的工作者，泛指';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'三猫'),(2,'花花'),(3,'方文山'),(4,'韦小宝'),(5,'mdk'),(7,'test_singer'),(8,'testlyricist'),(9,'testarrangement'),(10,'梦龙');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `album_music`
--

/*!50001 DROP VIEW IF EXISTS `album_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `album_music` (`album_id`,`album_name`,`music_name`,`music_id`,`creator_id`,`creator_name`) AS select `album`.`alb_id` AS `alb_id`,`album`.`alb_name` AS `alb_name`,`musicmessage`.`m_name` AS `m_name`,`musicmessage`.`m_id` AS `m_id`,`creator`.`c_id` AS `c_id`,`creator`.`name` AS `name` from ((((`album` join `musicmessage`) join `creator`) join `musicinalbum`) join `creatormakemusic`) where ((`album`.`alb_id` = `musicinalbum`.`alb_id`) and (`musicinalbum`.`m_id` = `musicmessage`.`m_id`) and (`musicmessage`.`m_id` = `creatormakemusic`.`m_id`) and (`creatormakemusic`.`c_id` = `creator`.`c_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `information_singer`
--

/*!50001 DROP VIEW IF EXISTS `information_singer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `information_singer` (`singer_name`,`singer_id`,`cover_location`,`gender`,`country`,`area`,`singer_view`,`remark`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`picture`.`location` AS `location`,`creator`.`gender` AS `gender`,`creator`.`country` AS `country`,`creator`.`area` AS `area`,`creator`.`view` AS `view`,`creator`.`remark` AS `remark` from (`creator` join `picture`) where (`creator`.`cover` = `picture`.`pic_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `play_music`
--

/*!50001 DROP VIEW IF EXISTS `play_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `play_music` (`music_id`,`video_location`,`accompany_location`,`audio_location`) AS select `musicmessage`.`m_id` AS `m_id`,`video`.`location` AS `location`,`accompany`.`location` AS `location`,`audio`.`location` AS `location` from (((`musicmessage` join `video`) join `accompany`) join `audio`) where ((`musicmessage`.`m_id` = `video`.`m_id`) and (`musicmessage`.`m_id` = `audio`.`m_id`) and (`musicmessage`.`m_id` = `accompany`.`m_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_albumfirrstchar`
--

/*!50001 DROP VIEW IF EXISTS `search_albumfirrstchar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_albumfirrstchar` (`album_name`,`album_id`,`album_maker`,`album_remark`,`album_releseDate`,`firstchar`) AS select `album`.`alb_name` AS `alb_name`,`album`.`alb_id` AS `alb_id`,`creator`.`name` AS `name`,`album`.`remark` AS `remark`,`album`.`releaseDate` AS `releaseDate`,`album`.`firstchar` AS `firstchar` from ((`album` join `creator`) join `creatormakealbum`) where ((`album`.`alb_id` = `creatormakealbum`.`alb_id`) and (`creator`.`c_id` = `creatormakealbum`.`c_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_albumname`
--

/*!50001 DROP VIEW IF EXISTS `search_albumname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_albumname` (`album_name`,`album_id`,`album_maker`,`album_remark`,`album_releseDate`) AS select `album`.`alb_name` AS `alb_name`,`album`.`alb_id` AS `alb_id`,`creator`.`name` AS `name`,`album`.`remark` AS `remark`,`album`.`releaseDate` AS `releaseDate` from ((`album` join `creator`) join `creatormakealbum`) where ((`album`.`alb_id` = `creatormakealbum`.`alb_id`) and (`creator`.`c_id` = `creatormakealbum`.`c_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_musicbyfirstchar`
--

/*!50001 DROP VIEW IF EXISTS `search_musicbyfirstchar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_musicbyfirstchar` (`music_id`,`music_name`,`creator_name`,`album_name`,`music_view`,`arrangenment_name`,`lyricist_name`,`music_remark`,`music_firstchar`) AS select `musicmessage`.`m_id` AS `m_id`,`musicmessage`.`m_name` AS `m_name`,`creator`.`name` AS `name`,`album`.`alb_name` AS `alb_name`,`musicmessage`.`view` AS `view`,`a`.`music_workerName` AS `music_workerName`,`l`.`music_workerName` AS `music_workerName`,`musicmessage`.`firstchar` AS `firstchar`,`musicmessage`.`remark` AS `remark` from ((((((`musicmessage` join `creator`) join `album`) join `creatormakemusic`) join `musicinalbum`) join `music_worker` `a`) join `music_worker` `l`) where ((`musicmessage`.`m_id` = `creatormakemusic`.`m_id`) and (`creatormakemusic`.`c_id` = `creator`.`c_id`) and (`musicmessage`.`m_id` = `musicinalbum`.`m_id`) and (`musicinalbum`.`alb_id` = `album`.`alb_id`) and (`creatormakemusic`.`arrangement_id` = `a`.`music_workerID`) and (`a`.`position` = '作曲') and (`creatormakemusic`.`lyricist_id` = `l`.`music_workerID`) and (`l`.`position` = '作词')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_musicbyname`
--

/*!50001 DROP VIEW IF EXISTS `search_musicbyname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_musicbyname` (`music_id`,`music_name`,`creator_name`,`album_name`,`music_view`,`arrangenment_name`,`lyricist_name`,`music_remark`) AS select `musicmessage`.`m_id` AS `m_id`,`musicmessage`.`m_name` AS `m_name`,`creator`.`name` AS `name`,`album`.`alb_name` AS `alb_name`,`musicmessage`.`view` AS `view`,`a`.`music_workerName` AS `music_workerName`,`l`.`music_workerName` AS `music_workerName`,`musicmessage`.`remark` AS `remark` from ((((((`musicmessage` join `creator`) join `album`) join `creatormakemusic`) join `musicinalbum`) join `music_worker` `a`) join `music_worker` `l`) where ((`musicmessage`.`m_id` = `creatormakemusic`.`m_id`) and (`musicmessage`.`m_id` = `musicinalbum`.`m_id`) and (`creatormakemusic`.`c_id` = `creator`.`c_id`) and (`musicinalbum`.`alb_id` = `album`.`alb_id`) and (`creatormakemusic`.`arrangement_id` = `a`.`music_workerID`) and (`a`.`position` = '作曲') and (`creatormakemusic`.`lyricist_id` = `l`.`music_workerID`) and (`l`.`position` = '作词')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_singerfirstchar`
--

/*!50001 DROP VIEW IF EXISTS `search_singerfirstchar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_singerfirstchar` (`creator_name`,`creator_id`,`creator_gender`,`creator_country`,`creator_area`,`creator_remark`,`creator_view`,`firstchar`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`creator`.`gender` AS `gender`,`creator`.`country` AS `country`,`creator`.`area` AS `area`,`creator`.`remark` AS `remark`,`creator`.`view` AS `view`,`creator`.`firstchar` AS `firstchar` from `creator` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_singername`
--

/*!50001 DROP VIEW IF EXISTS `search_singername`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_singername` (`creator_name`,`creator_id`,`creator_gender`,`creator_country`,`creator_area`,`creator_remark`,`creator_view`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`creator`.`gender` AS `gender`,`creator`.`country` AS `country`,`creator`.`area` AS `area`,`creator`.`remark` AS `remark`,`creator`.`view` AS `view` from `creator` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `singer_music`
--

/*!50001 DROP VIEW IF EXISTS `singer_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `singer_music` (`singer_name`,`singer_id`,`music_name`,`music_id`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`musicmessage`.`m_name` AS `m_name`,`musicmessage`.`m_id` AS `m_id` from ((`creator` join `musicmessage`) join `creatormakemusic`) where ((`creator`.`c_id` = `creatormakemusic`.`c_id`) and (`musicmessage`.`m_id` = `creatormakemusic`.`m_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_account`
--

/*!50001 DROP VIEW IF EXISTS `view_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_account` AS select `users`.`userID` AS `a`,`users`.`username` AS `b`,`users`.`password` AS `c`,`users`.`VIP` AS `d`,`users`.`email_address` AS `e` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_admin`
--

/*!50001 DROP VIEW IF EXISTS `view_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_admin` AS select `table_admin`.`admid` AS `a`,`table_admin`.`account` AS `b`,`table_admin`.`phone` AS `c`,`table_admin`.`password` AS `d`,`table_admin`.`record` AS `e` from `table_admin` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_album`
--

/*!50001 DROP VIEW IF EXISTS `view_album`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_album` AS select `album`.`alb_id` AS `a`,`album`.`alb_name` AS `b`,`album`.`remark` AS `c`,`album`.`releaseDate` AS `d`,`album`.`firstchar` AS `e`,`album`.`cover` AS `f`,`album`.`leader_id` AS `g`,`album`.`leader_name` AS `h` from `album` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_create`
--

/*!50001 DROP VIEW IF EXISTS `view_create`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_create` AS select `t2`.`m_id` AS `m_id`,`t2`.`c_id` AS `singer_id`,`creator`.`name` AS `singer_name`,`t2`.`composer_id` AS `composer_id`,`t2`.`composer_name` AS `composer_name`,`t2`.`lyricist_id` AS `lyricist_id`,`t2`.`lyricist_name` AS `lyricist_name` from ((select `t1`.`m_id` AS `m_id`,`t1`.`c_id` AS `c_id`,`t1`.`arrangement_id` AS `composer_id`,`worker`.`name` AS `composer_name`,`t1`.`lyricist_id` AS `lyricist_id`,`t1`.`lyricist_name` AS `lyricist_name` from ((select `creatormakemusic`.`m_id` AS `m_id`,`creatormakemusic`.`c_id` AS `c_id`,`creatormakemusic`.`arrangement_id` AS `arrangement_id`,`creatormakemusic`.`lyricist_id` AS `lyricist_id`,`worker`.`name` AS `lyricist_name` from (`creatormakemusic` left join `worker` on((`creatormakemusic`.`lyricist_id` = `worker`.`worker_id`)))) `t1` left join `worker` on((`t1`.`arrangement_id` = `worker`.`worker_id`)))) `t2` left join `creator` on((`t2`.`c_id` = `creator`.`c_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_creator`
--

/*!50001 DROP VIEW IF EXISTS `view_creator`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_creator` AS select `creator`.`c_id` AS `a`,`creator`.`name` AS `b`,`creator`.`cover` AS `c`,`creator`.`gender` AS `d`,`creator`.`country` AS `e`,`creator`.`area` AS `f`,`creator`.`view` AS `g`,`creator`.`remark` AS `h`,`creator`.`firstchar` AS `i` from `creator` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_location`
--

/*!50001 DROP VIEW IF EXISTS `view_location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_location` AS select `t3`.`m_id` AS `m_id`,`t3`.`lrc` AS `lrc`,`t3`.`lrc_co` AS `lrc_co`,`t3`.`audio` AS `audio`,`t3`.`acmp` AS `acmp`,`video`.`location` AS `video` from ((select `t2`.`m_id` AS `m_id`,`t2`.`lrc` AS `lrc`,`t2`.`lrc_co` AS `lrc_co`,`t2`.`audio` AS `audio`,`accompany`.`location` AS `acmp` from ((select `t1`.`m_id` AS `m_id`,`t1`.`lrc` AS `lrc`,`t1`.`lrc_co` AS `lrc_co`,`audio`.`location` AS `audio` from ((select `view_musicid`.`m_id` AS `m_id`,`lrc`.`location` AS `lrc`,`lrc`.`contributor` AS `lrc_co` from (`view_musicid` left join `lrc` on((`view_musicid`.`m_id` = `lrc`.`m_id`)))) `t1` left join `audio` on((`t1`.`m_id` = `audio`.`m_id`)))) `t2` left join `accompany` on((`t2`.`m_id` = `accompany`.`m_id`)))) `t3` left join `video` on((`t3`.`m_id` = `video`.`m_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_music`
--

/*!50001 DROP VIEW IF EXISTS `view_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_music` AS select `t1`.`m_id` AS `a`,`t1`.`m_name` AS `b`,`t1`.`view` AS `c`,`t1`.`remark` AS `d`,`t1`.`firstchar` AS `e`,`t1`.`picture` AS `f`,`t1`.`singer_id` AS `g`,`t1`.`singer_name` AS `h`,`t1`.`composer_id` AS `i`,`t1`.`composer_name` AS `j`,`t1`.`lyricist_id` AS `k`,`t1`.`lyricist_name` AS `l`,`view_location`.`lrc` AS `m`,`view_location`.`lrc_co` AS `n`,`view_location`.`audio` AS `o`,`view_location`.`acmp` AS `p`,`view_location`.`video` AS `q` from ((select `musicmessage`.`m_id` AS `m_id`,`musicmessage`.`m_name` AS `m_name`,`musicmessage`.`view` AS `view`,`musicmessage`.`remark` AS `remark`,`musicmessage`.`firstchar` AS `firstchar`,`musicmessage`.`picture` AS `picture`,`view_create`.`singer_id` AS `singer_id`,`view_create`.`singer_name` AS `singer_name`,`view_create`.`composer_id` AS `composer_id`,`view_create`.`composer_name` AS `composer_name`,`view_create`.`lyricist_id` AS `lyricist_id`,`view_create`.`lyricist_name` AS `lyricist_name` from (`musicmessage` left join `view_create` on((`musicmessage`.`m_id` = `view_create`.`m_id`)))) `t1` left join `view_location` on((`t1`.`m_id` = `view_location`.`m_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_music_`
--

/*!50001 DROP VIEW IF EXISTS `view_music_`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_music_` AS select `t1`.`m_id` AS `m_id`,`t1`.`m_name` AS `m_name`,`t1`.`view` AS `view`,`t1`.`remark` AS `remark`,`t1`.`firstchar` AS `firstchar`,`t1`.`picture` AS `picture`,`t1`.`singer_id` AS `singer_id`,`t1`.`singer_name` AS `singer_name`,`t1`.`composer_id` AS `composer_id`,`t1`.`composer_name` AS `composer_name`,`t1`.`lyricist_id` AS `lyricist_id`,`t1`.`lyricist_name` AS `lyricist_name`,`view_location`.`lrc` AS `lrc`,`view_location`.`lrc_co` AS `lrc_co`,`view_location`.`audio` AS `audio`,`view_location`.`acmp` AS `acmp`,`view_location`.`video` AS `video` from ((select `musicmessage`.`m_id` AS `m_id`,`musicmessage`.`m_name` AS `m_name`,`musicmessage`.`view` AS `view`,`musicmessage`.`remark` AS `remark`,`musicmessage`.`firstchar` AS `firstchar`,`musicmessage`.`picture` AS `picture`,`view_create`.`singer_id` AS `singer_id`,`view_create`.`singer_name` AS `singer_name`,`view_create`.`composer_id` AS `composer_id`,`view_create`.`composer_name` AS `composer_name`,`view_create`.`lyricist_id` AS `lyricist_id`,`view_create`.`lyricist_name` AS `lyricist_name` from (`musicmessage` left join `view_create` on((`musicmessage`.`m_id` = `view_create`.`m_id`)))) `t1` left join `view_location` on((`t1`.`m_id` = `view_location`.`m_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_musicid`
--

/*!50001 DROP VIEW IF EXISTS `view_musicid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_musicid` AS select `musicmessage`.`m_id` AS `m_id` from `musicmessage` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-25 22:57:25
