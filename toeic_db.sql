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
SET @part_struct_id_1_1 = 'b75d9f72-d35f-4a36-861f-4fafae76f2ad';
SET @part_struct_id_1_2 = '47b10509-b691-4440-b92e-f0abb96a6cd3';
SET @part_struct_id_1_3 = 'a2daa8c4-5aaa-4882-b439-41537f25a2ba';

INSERT INTO `part_struct`
VALUES
(@part_struct_id_1_2,10,2),
(@part_struct_id_1_3,20,3),
(@part_struct_id_1_1,10,1);
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
-- Part 1
SET @group_questions_id_1_1 = uuid();
SET @group_questions_id_1_2 = uuid();
SET @group_questions_id_1_3 = uuid();
SET @group_questions_id_1_4 = uuid();
SET @group_questions_id_1_5 = uuid();
SET @group_questions_id_1_6 = uuid();
SET @group_questions_id_1_7 = uuid();
SET @group_questions_id_1_8 = uuid();
SET @group_questions_id_1_9 = uuid();
SET @group_questions_id_1_10 = uuid();
SET @group_questions_id_1_11 = uuid();

INSERT INTO `group_questions`
VALUES
(@group_questions_id_1_1,@part_struct_id_1_1,1),
(@group_questions_id_1_2,@part_struct_id_1_1,1),
(@group_questions_id_1_3,@part_struct_id_1_1,1),
(@group_questions_id_1_4,@part_struct_id_1_1,1),
(@group_questions_id_1_5,@part_struct_id_1_1,1),
(@group_questions_id_1_6,@part_struct_id_1_1,1),
(@group_questions_id_1_7,@part_struct_id_1_1,1),
(@group_questions_id_1_8,@part_struct_id_1_1,1),
(@group_questions_id_1_9,@part_struct_id_1_1,1),
(@group_questions_id_1_10,@part_struct_id_1_1,1),
(@group_questions_id_1_11,@part_struct_id_1_1,1);


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
INSERT INTO `media`
VALUES
       -- Part 1
       (uuid(),@group_questions_id_1_1,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_1,'https://toeic24.vn/upload/img/part_1.png','Image'),
       (uuid(),@group_questions_id_1_2,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_2,'https://toeic24.vn/upload/img/resized/1579321422.png','Image'),
       (uuid(),@group_questions_id_1_3,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_3,'https://toeic24.vn/upload/img/resized/1579321545.png','Image'),
       (uuid(),@group_questions_id_1_4,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_4,'https://toeic24.vn/upload/img/resized/1579321614.png','Image'),
       (uuid(),@group_questions_id_1_5,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_5,'https://toeic24.vn/upload/img/resized/1579321701.png','Image'),
       (uuid(),@group_questions_id_1_6,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_6,'https://toeic24.vn/upload/img/resized/1579321809.png','Image'),
       (uuid(),@group_questions_id_1_7,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_7,'https://toeic24.vn/upload/img/resized/1580434191.png','Image'),
       (uuid(),@group_questions_id_1_8,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_8,'https://toeic24.vn/upload/img/resized/1580434399.png','Image'),
       (uuid(),@group_questions_id_1_9,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_9,'https://toeic24.vn/upload/img/resized/1580434545.png','Image'),
       (uuid(),@group_questions_id_1_10,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_10,'https://toeic24.vn/upload/img/resized/1579321898.png','Image'),
       (uuid(),@group_questions_id_1_11,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
       (uuid(),@group_questions_id_1_11,'https://toeic24.vn/upload/img/resized/1580434492.png','Image');
# (uuid(),@group_questions_id_1_9,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
# (uuid(),@group_questions_id_1_9,'https://toeic24.vn/upload/img/resized/1580434758.png','Image'),
# (uuid(),@group_questions_id_1_9,'https://toeic24.vn/upload/audio/part_i_intro.mp3','Audio'),
# (uuid(),@group_questions_id_1_9,'https://toeic24.vn/upload/img/resized/1580434859.png','Image');
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
-- Part 1
SET @questions_id_1_1 = uuid();
SET @questions_id_1_2 = uuid();
SET @questions_id_1_3 = uuid();
SET @questions_id_1_4 = uuid();
SET @questions_id_1_5 = uuid();
SET @questions_id_1_6 = uuid();
SET @questions_id_1_7 = uuid();
SET @questions_id_1_8 = uuid();
SET @questions_id_1_9 = uuid();
SET @questions_id_1_10 = uuid();
SET @questions_id_1_11 = uuid();
INSERT INTO `questions` 
VALUES 
-- Part 1
(@questions_id_1_1,@group_questions_id_1_1,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_2,@group_questions_id_1_2,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_3,@group_questions_id_1_3,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_4,@group_questions_id_1_4,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_5,@group_questions_id_1_5,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_6,@group_questions_id_1_6,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_7,@group_questions_id_1_7,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_8,@group_questions_id_1_8,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_9,@group_questions_id_1_9,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_10,@group_questions_id_1_10,'Select the answer','Chọn đáp án đúng',NULL),
(@questions_id_1_11,@group_questions_id_1_11,'Select the answer','Chọn đáp án đúng',NULL);
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
INSERT INTO `answers`
VALUES
(uuid(),@questions_id_1_1,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_1,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_1,'C','Lorem 3','Đáp án 3',1),
(uuid(),@questions_id_1_1,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_2,'B','Lorem 2','Đáp án 2',1),
(uuid(),@questions_id_1_2,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_2,'C','Lorem 3','Đáp án 3',0),
(uuid(),@questions_id_1_2,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_3,'B','Lorem 2','Đáp án 2',1),
(uuid(),@questions_id_1_3,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_3,'C','Lorem 3','Đáp án 3',0),
(uuid(),@questions_id_1_3,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_4,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_4,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_4,'C','Lorem 3','Đáp án 3',1),
(uuid(),@questions_id_1_4,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_5,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_5,'D','Lorem 4','Đáp án 4',1),
(uuid(),@questions_id_1_5,'C','Lorem 3','Đáp án 3',0),
(uuid(),@questions_id_1_5,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_6,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_6,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_6,'C','Lorem 3','Đáp án 3',0),
(uuid(),@questions_id_1_6,'A','Lorem 1','Đáp án 1',1),

(uuid(),@questions_id_1_7,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_7,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_7,'C','Lorem 3','Đáp án 3',1),
(uuid(),@questions_id_1_7,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_8,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_8,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_8,'C','Lorem 3','Đáp án 3',1),
(uuid(),@questions_id_1_8,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_9,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_9,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_9,'C','Lorem 3','Đáp án 3',1),
(uuid(),@questions_id_1_9,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_10,'B','Lorem 2','Đáp án 2',0),
(uuid(),@questions_id_1_10,'D','Lorem 4','Đáp án 4',1),
(uuid(),@questions_id_1_10,'C','Lorem 3','Đáp án 3',0),
(uuid(),@questions_id_1_10,'A','Lorem 1','Đáp án 1',0),

(uuid(),@questions_id_1_11,'B','Lorem 2','Đáp án 2',1),
(uuid(),@questions_id_1_11,'D','Lorem 4','Đáp án 4',0),
(uuid(),@questions_id_1_11,'C','Lorem 3','Đáp án 3',0),
(uuid(),@questions_id_1_11,'A','Lorem 1','Đáp án 1',0);
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
