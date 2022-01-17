-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: frankMemory
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
INSERT INTO `response` VALUES ('enough about me how are you?','pretty good ngl',NULL,NULL,0,0,0),('good how about you','preatty good',NULL,NULL,0,0,0),('Hello there','how are you',NULL,NULL,0,0,0),('Hi','hello there!','hiii','hows it going',1,1,1),('hi there','hi there ig',NULL,NULL,0,0,0),('hi there ig','wow rude',NULL,NULL,0,0,0),('Hi!!','hello there!!!','hiii!!','hows it going?',1,1,1),('how are you','good how about you',NULL,NULL,0,0,0),('i am sure','you are??',NULL,NULL,0,0,0),('i did','ya ikr',NULL,NULL,0,0,0),('i didn\'t agree','i did',NULL,NULL,0,0,0),('i was agreeing','i wasn\'t',NULL,NULL,0,0,0),('i wasn\'t','what the heck',NULL,NULL,0,0,0),('im not a boomer 😠','ya ik you aren\'t',NULL,NULL,0,0,0),('im not sure','i am sure',NULL,NULL,0,0,0),('mhm',NULL,NULL,NULL,0,0,0),('no','wow ok',NULL,NULL,0,0,0),('no u','nou',NULL,NULL,0,0,0),('no you','no you are',NULL,NULL,0,0,0),('no you are','ok wow',NULL,NULL,0,0,0),('no you are not','no u',NULL,NULL,0,0,0),('nou','no you',NULL,NULL,0,0,0),('ok boomer','im not a boomer 😠',NULL,NULL,0,0,0),('ok wow','yes',NULL,NULL,0,0,0),('preatty good','whats preatty good',NULL,NULL,0,0,0),('pretty good ngl','ya ikr',NULL,NULL,0,0,0),('thats rude','yup it is',NULL,NULL,0,0,0),('what that wasnt rude','ya ik it wasnt',NULL,NULL,0,0,0),('what the heck','wow ok rude',NULL,NULL,0,0,0),('whats preatty good','your mom',NULL,NULL,0,0,0),('why','im not sure',NULL,NULL,0,0,0),('wow ok','i was agreeing',NULL,NULL,0,0,0),('wow ok rude','yes ikr',NULL,NULL,0,0,0),('wow rude','what that wasnt rude',NULL,NULL,0,0,0),('wow you are lame','thats rude',NULL,NULL,0,0,0),('ya ik it wasnt','yes',NULL,NULL,0,0,0),('ya ik you aren\'t','yes i am',NULL,NULL,0,0,0),('ya ikr','wow you are lame',NULL,NULL,0,0,0),('yes','no',NULL,NULL,0,0,0),('yes actually','yesss',NULL,NULL,0,0,0),('yes i am','no you are not',NULL,NULL,0,0,0),('yes ikr','why',NULL,NULL,0,0,0),('yesss','you arent supposed to agree',NULL,NULL,0,0,0),('you are??','yes actually',NULL,NULL,0,0,0),('you arent supposed to agree','i didn\'t agree',NULL,NULL,0,0,0),('your mom','ok boomer',NULL,NULL,0,0,0),('yup it is','mhm',NULL,NULL,0,0,0);
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

-- Dump completed on 2021-12-14 15:04:34
