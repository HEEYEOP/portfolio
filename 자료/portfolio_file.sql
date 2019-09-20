CREATE DATABASE  IF NOT EXISTS `portfolio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `portfolio`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `file` (
  `fileNum` int(11) NOT NULL AUTO_INCREMENT,
  `fileBoardNum` int(11) NOT NULL,
  `isMainImg` varchar(1) NOT NULL DEFAULT 'N',
  `fileTitle` varchar(255) NOT NULL,
  `display` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fileNum`),
  KEY `board_num_idx` (`fileBoardNum`),
  CONSTRAINT `fileBoardNum` FOREIGN KEY (`fileBoardNum`) REFERENCES `board` (`boardNum`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (53,78,'Y','/2019/09/20/0f2e5054-27b0-4ab8-b04d-a8914b35b1bf_20160503_064803-706x354.jpg','Y'),(54,79,'Y','/2019/09/20/afc952d9-fa31-48a7-99a1-d4ff820439da_mug_obj_143028493262198199.jpg','Y'),(55,80,'Y','/2019/09/20/2f69820b-1c82-40d2-8ea2-a2ae570c1db8_20160503_064803-706x354.jpg','Y'),(56,81,'Y','/2019/09/20/09a9b35d-d365-4dc3-be30-351deefa6465_교통.jpg','Y');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 18:27:00
