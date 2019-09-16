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
-- Table structure for table `vstype`
--

DROP TABLE IF EXISTS `vstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vstype` (
  `vsTypeNum` int(11) NOT NULL AUTO_INCREMENT,
  `vsTypeBoardNum` int(11) NOT NULL,
  `yORn` varchar(1) NOT NULL,
  `vsContents` varchar(100) NOT NULL DEFAULT ' ',
  `totalNum` int(11) DEFAULT '0',
  PRIMARY KEY (`vsTypeNum`),
  KEY `board_num_idx` (`vsTypeBoardNum`),
  CONSTRAINT `vsTypeBoardNum` FOREIGN KEY (`vsTypeBoardNum`) REFERENCES `board` (`boardNum`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vstype`
--

LOCK TABLES `vstype` WRITE;
/*!40000 ALTER TABLE `vstype` DISABLE KEYS */;
INSERT INTO `vstype` VALUES (1,27,'Y','지효',0),(2,27,'N','반대',0),(3,28,'Y','찬성하겠습니다',0),(4,28,'N','반대하겠습니다',1),(5,29,'Y','찬성',0),(6,29,'N','반대',0),(7,30,'Y','찬성',0),(8,30,'N','반대',0),(9,31,'Y','찬성',0),(10,31,'N','반대',1),(11,32,'Y','네거리 교차로에 우회전 차로를 설치하는것에 찬성한다',1),(12,32,'N','네거리 교차로에 우회전 차로를 설치하는것에 반대한다',0),(13,34,'Y','찬성',0),(14,34,'N','반대',0);
/*!40000 ALTER TABLE `vstype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-17  0:30:40
