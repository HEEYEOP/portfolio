CREATE DATABASE  IF NOT EXISTS `portfolio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `portfolio`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `userEmail` varchar(45) NOT NULL,
  `userType` varchar(45) NOT NULL DEFAULT 'USER',
  `userName` varchar(45) NOT NULL,
  `userPw` varchar(255) NOT NULL,
  `userPhone` varchar(45) DEFAULT NULL,
  `userGender` varchar(1) NOT NULL,
  `userBirth` datetime DEFAULT NULL,
  `confirmFile` varchar(255) DEFAULT NULL,
  `writeBoardCount` int(11) DEFAULT '0',
  `writeCommentCount` int(11) DEFAULT '0',
  `likesBoardCount` int(11) DEFAULT '0',
  `isMember` varchar(1) NOT NULL,
  PRIMARY KEY (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('000999@naver.com','IndividualUser','나다라','$2a$10$oO6jLO.wL2.uzrYJ6KJvxOSArx/chaOonPYcCfACA9SLUxvl3Qeyq',NULL,'M','1935-03-17 00:00:00','/2019/09/16/28896022-b5b3-4e76-8bac-b49baafe5ee2_',0,0,0,'Y'),('123123@naver.com','IndividualUser','gmlduq','$2a$10$Ca1yMRqHfa4qdIUTXkqVseanzYc7oa1rsLDCDwWUYqQb8nlvnzJgO','01088533486','M',NULL,'/2019/08/22/fe033827-96a0-45fb-a96c-a1932f655e03_',1,1,0,'Y');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-17  0:30:37
