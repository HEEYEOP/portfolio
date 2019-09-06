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
INSERT INTO `user` VALUES ('123123@naver.com','IndividualUser','gmlduq','$2a$10$Ca1yMRqHfa4qdIUTXkqVseanzYc7oa1rsLDCDwWUYqQb8nlvnzJgO','01088533486','M',NULL,'/2019/08/22/fe033827-96a0-45fb-a96c-a1932f655e03_',0,0,0,'Y'),('ADASDA@ASDADAD','GroupUser','ASDASD','$2a$10$H23bUuVVHLr7AYolu92.PuieMXb8MAA4DDP2oGBer3I9KV/PlZQZ.',NULL,'F','1936-09-15 00:00:00','/2019/08/26/c532fbce-1b67-4a2f-a984-ff61fe24079c_',0,0,0,'N'),('dnduq@naver.com','IndividualUser','dnduq','$2a$10$Lku0JkdAmYbnBV4xAK1eEepdGfPk3epu3K4MCsyDF/VGOm04azeX6',NULL,'M',NULL,NULL,0,0,0,'Y'),('dngml@naver.com','IndividualUser','dngml','dngml123',NULL,'M',NULL,NULL,0,0,0,'Y'),('eight@naver.com','IndividualUser','eight123','$2a$10$YWsBvOI2YYGBp8HAWKKdYO12rygesBh131w5SnK19NH9nanzpDbGG',NULL,'M',NULL,'/2019/08/22/935fa2d6-9d41-4741-b045-cdb2a7c319da_',0,0,0,'Y'),('etrete@erwerw','GroupUser','sdfsfst','$2a$10$SlKFXxm9jA5Z7ZtJrk2Sfuxg9wcFm4Kbbl9QSgAcHbXM9MlJ/j6He',NULL,'F',NULL,'/2019/08/26/3fae12bd-448c-4870-aa31-747cae1de6f0_',0,0,0,'N'),('filetest2@naver.com','GroupUser','filetest2','$2a$10$Lhn9rifHe6L06zhMzPCWKOHypVS4Ui.DTDV7Jm3rBJZdsUxG9SVV2',NULL,'M',NULL,NULL,0,0,0,'N'),('filetest@naver.com','GroupUser','dnggml','$2a$10$jYTDzX0LOoi9TbTFzRjAKeB9cicJkxbf801W/ZU.puE.LPVPEWSWa',NULL,'M',NULL,NULL,0,0,0,'N'),('gml@naver.com','IndividualUser','gmlname','abcd1234',NULL,'F',NULL,NULL,0,0,0,'Y'),('kkk@naver.com','GroupUser','kkk123','$2a$10$TOrB8jdhj9nz4oVvppa6geA7bZvkyMI3PfvEsjg40W.6gYfgrSGZe',NULL,'M',NULL,'/2019/08/20/0c44c842-26db-4433-9dda-f42ff67ef794_4번.hwp',0,0,0,'N'),('ttt@naver.com','GroupUser','ttt123','$2a$10$U2rST2uGmNF.wZRzFVgui.QVVfVkET5ktdKa8MsMyQ8zQ9zRoFtCW',NULL,'M',NULL,'/2019/08/20/e073482b-9c02-43da-bfab-b718edddcd81_',0,0,0,'N'),('uuid@naver.com','GroupUser','uuid123','$2a$10$V7ohD.t7OFbL.W3MQw/aluh3W1Qc8Kh65l0vg.nbcOloniGa4aZiS',NULL,'M',NULL,NULL,0,0,0,'N'),('what@naver.com','GroupUser','what123','$2a$10$Z1NOO6nTZWUg68nJIFEl7erWTPGgWB4ceXoOET8OzMMebnq5VQCEW',NULL,'M',NULL,NULL,0,0,0,'N'),('wwhat@naver.com','GroupUser','wwhat123','$2a$10$jC9GE4NqnZFkpye4E2n4H.zBtQzLlta0dyMyrP9BclKdAScj/l.N.',NULL,'M',NULL,'/2019/08/20/a2f3d5d7-bdcd-4f7e-955c-de1e5ba2ca7a_5.2(목).hwp',0,0,0,'N');
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

-- Dump completed on 2019-09-06 18:19:47
