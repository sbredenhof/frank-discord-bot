-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: frankmemory
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `response` (
  `message` varchar(255) NOT NULL,
  `response1` varchar(30) DEFAULT NULL,
  `response2` varchar(30) DEFAULT NULL,
  `response3` varchar(30) DEFAULT NULL,
  `score1` int(11) DEFAULT NULL,
  `score2` int(11) DEFAULT NULL,
  `score3` int(11) DEFAULT NULL,
  PRIMARY KEY (`message`),
  UNIQUE KEY `message` (`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
INSERT INTO `response` VALUES ('good','ok',NULL,NULL,1,0,0),('good how bout u','not bad','not bad','idk good ig',1,1,1),('Hello there','hi there','hi there buddy','hey there bud',1,1,1),('hey','waht',NULL,NULL,1,0,0),('hey there bud',NULL,NULL,NULL,0,0,0),('Hi','wassup','hiii','hows it going',2,1,1),('hi there',NULL,NULL,NULL,0,0,0),('hi there buddy','hi there',NULL,NULL,1,0,0),('Hi!!','ok hi','hiii!!','hows it going?',4,1,1),('hows it going','good how bout u','hi','good',1,2,1),('idk',NULL,NULL,NULL,0,0,0),('idk good ig',NULL,NULL,NULL,0,0,0),('Knock Knock!','whos there','whos there',NULL,1,1,0),('not bad',NULL,NULL,NULL,0,0,0),('ok',NULL,NULL,NULL,0,0,0),('ok hi',NULL,NULL,NULL,0,0,0),('rude',NULL,NULL,NULL,0,0,0),('waht','idk','idk',NULL,1,1,0),('wassup',NULL,NULL,NULL,0,0,0),('where do you live',NULL,NULL,NULL,0,0,0),('whos there','knock knock!','knock knock!',NULL,1,1,0),('your mom','rude',NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-21 13:41:22
