-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: toeic_db
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Table structure for table `part_struct`
--

DROP TABLE IF EXISTS `part_struct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_struct` (
  `id` char(36) NOT NULL,
  `numOfQuestions` int NOT NULL,
  `part` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_struct`
--

LOCK TABLES `part_struct` WRITE;
/*!40000 ALTER TABLE `part_struct` DISABLE KEYS */;
INSERT INTO `part_struct` VALUES ('47b10509-b691-4440-b92e-f0abb96a6cd3',10,2),('a2daa8c4-5aaa-4882-b439-41537f25a2ba',20,3),('b75d9f72-d35f-4a36-861f-4fafae76f2ad',10,1);
/*!40000 ALTER TABLE `part_struct` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `group_questions`
--

DROP TABLE IF EXISTS `group_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_questions` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `partStructId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numOfQuestions` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK__part_struct_group_questions` (`partStructId`) USING BTREE,
  CONSTRAINT `FK__part_struct_group_questions` FOREIGN KEY (`partStructId`) REFERENCES `part_struct` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_questions`
--

LOCK TABLES `group_questions` WRITE;
/*!40000 ALTER TABLE `group_questions` DISABLE KEYS */;
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);
INSERT INTO `group_questions` VALUES ('10c7ca6e-54f3-11eb-975b-444bac7a627b','b75d9f72-d35f-4a36-861f-4fafae76f2ad',1);

/*!40000 ALTER TABLE `group_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupQuestionsId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(1024) NOT NULL,
  `type` enum('Image','Audio','Video','Document') NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK__group_questions_media` (`groupQuestionsId`) USING BTREE,
  CONSTRAINT `FK__group_questions_media` FOREIGN KEY (`groupQuestionsId`) REFERENCES `group_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES ('3d78a6da-54f5-11eb-975b-444bac7a627b','10c7ca6e-54f3-11eb-975b-444bac7a627b','https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),('ad5b7d62-54f3-11eb-975b-444bac7a627b','10c7ca6e-54f3-11eb-975b-444bac7a627b','https://toeic24.vn/upload/img/part_1.png','Image');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupQuestionsId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(1024) NOT NULL,
  `titleTranslate` varchar(1024) NOT NULL,
  `explain` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK__group_questions_questions` (`groupQuestionsId`) USING BTREE,
  CONSTRAINT `FK__group_questions_questions` FOREIGN KEY (`groupQuestionsId`) REFERENCES `group_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('fd6cdf56-54f5-11eb-975b-444bac7a627b','10c7ca6e-54f3-11eb-975b-444bac7a627b','Select the answer','Chọn đáp án đúng',NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` char(1) NOT NULL,
  `answer` varchar(1024) NOT NULL,
  `answerTranslate` varchar(1024) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK__questions_answers` (`questionId`) USING BTREE,
  CONSTRAINT `FK__questions_answers` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES ('188b11b2-54f7-11eb-975b-444bac7a627b','fd6cdf56-54f5-11eb-975b-444bac7a627b','B','Lorem 2','Long 2',0),('1bc3f38a-54f7-11eb-975b-444bac7a627b','fd6cdf56-54f5-11eb-975b-444bac7a627b','D','Lorem 4','Long 4',0),('20de0b30-54f7-11eb-975b-444bac7a627b','fd6cdf56-54f5-11eb-975b-444bac7a627b','C','Lorem 3','Long 3',1),('7ae2ea98-54f6-11eb-975b-444bac7a627b','fd6cdf56-54f5-11eb-975b-444bac7a627b','A','Lorem 1','Long 1',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_session`
--

DROP TABLE IF EXISTS `test_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_session` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `labelChosen` char(1) NOT NULL,
  `result` tinyint(1) NOT NULL DEFAULT '0',
  `index` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK__questions_test_session` (`questionId`) USING BTREE,
  CONSTRAINT `FK__questions_test_session` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_session`
--

LOCK TABLES `test_session` WRITE;
/*!40000 ALTER TABLE `test_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'toeic_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13  1:00:44
