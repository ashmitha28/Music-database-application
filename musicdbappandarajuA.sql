CREATE DATABASE  IF NOT EXISTS `music_Appandaraju_As` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- drop database music_Appandaraju_As;
USE `music_Appandaraju_As`;
-- drop database music1_db;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: music1_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `alid` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(50) NOT NULL,
  `artist` varchar(50) NOT NULL,
  PRIMARY KEY (`alid`),
  KEY `albums_artists` (`artist`),
  CONSTRAINT `albums_artists` FOREIGN KEY (`artist`) REFERENCES `artists` (`artist_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Thrill of the Arts','Vulfpeck'),(2,'Nonfiction','Low Hum'),(3,'Habit','Still Woozy'),(4,'Origin','Vanilla'),(5,'Prologue','Life of Dillon'),(6,'New Light','John Mayer'),(7,'Overexposed','Maroon 5'),(8,'Television','99 Neighbors'),(9,'The Story of Us','Quinn XCII'),(10,'After Hours','The Weeknd'),(11,'Wait','Arlie'),(12,'Kauai','Childish Gambino'),(13,'Love Songs','Neil Diamond'),(14,'Synpathique','Pink Martini'),(15,'Happy Together','The Turtles'),(16,'Despacito Remix','Luis Fonsi');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_performs_song`
--

DROP TABLE IF EXISTS `artist_performs_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_performs_song` (
  `sid` int NOT NULL,
  `aid` int NOT NULL,
  PRIMARY KEY (`sid`,`aid`),
  KEY `artist_performs_song_fk2` (`aid`),
  CONSTRAINT `artist_performs_song_fk1` FOREIGN KEY (`sid`) REFERENCES `songs` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `artist_performs_song_fk2` FOREIGN KEY (`aid`) REFERENCES `artists` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_performs_song`
--

LOCK TABLES `artist_performs_song` WRITE;
/*!40000 ALTER TABLE `artist_performs_song` DISABLE KEYS */;
INSERT INTO `artist_performs_song` VALUES (1,1),(17,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(16,17),(16,18);
/*!40000 ALTER TABLE `artist_performs_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(50) NOT NULL,
  `record_label_id` int NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `artist_name` (`artist_name`),
  KEY `artists_record_label` (`record_label_id`),
  CONSTRAINT `artists_record_label` FOREIGN KEY (`record_label_id`) REFERENCES `record_label` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Vulfpeck',1),(2,'Low Hum',2),(3,'Still Woozy',4),(4,'Vanilla',4),(5,'Life of Dillon',5),(6,'John Mayer',1),(7,'Maroon 5',3),(8,'99 Neighbors',3),(9,'Quinn XCII',2),(10,'The Weeknd',1),(11,'Arlie',1),(12,'Childish Gambino',5),(13,'Neil Diamond',1),(14,'Pink Martini',6),(15,'The Turtles',2),(16,'Justin Beiber',2),(17,'Luis Fonsi',3),(18,'Daddy Yankee',3);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `gid` int NOT NULL,
  `genre_name` varchar(50) NOT NULL,
  `genre_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Rock','lots of electric instruments'),(2,'Pop','popular music'),(3,'Jazz','originated from blues and ragtime'),(4,'Hip Hop','includes rapping and utilizes synthesizers'),(5,'Country','originated from gosepl and church music'),(6,'Heavy Metal','characterized by loud distorted guitars and vocals'),(7,'Classical','written in a Western musical tradition'),(8,'Latin pop','A catchy pop style with Latin music flare');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moods`
--

DROP TABLE IF EXISTS `moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moods` (
  `mid` int NOT NULL,
  `mood_name` varchar(50) NOT NULL,
  `mood_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moods`
--

LOCK TABLES `moods` WRITE;
/*!40000 ALTER TABLE `moods` DISABLE KEYS */;
INSERT INTO `moods` VALUES (1,'Happy','cheerful music'),(2,'Exuberant','exciting, upbeat music'),(3,'Energetic','powerful music'),(4,'Frantic','fast-paced busy music'),(5,'Anxious/Sad','slow and melancholy tunes'),(6,'Depression','very sad, angsty songs'),(7,'Calm','good music to relax to'),(8,'Contentment','fulfilling and satisfying');
/*!40000 ALTER TABLE `moods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_label`
--

DROP TABLE IF EXISTS `record_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_label` (
  `rid` int NOT NULL,
  `label_name` varchar(50) NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_label`
--

LOCK TABLES `record_label` WRITE;
/*!40000 ALTER TABLE `record_label` DISABLE KEYS */;
INSERT INTO `record_label` VALUES (6,'Atlantic Records'),(1,'Capitol Music Group'),(2,'Def Jam Recordings'),(4,'Island Records'),(3,'Republic Records'),(5,'Warner Music Group');
/*!40000 ALTER TABLE `record_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `song_name` varchar(50) NOT NULL,
  `album_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `mood_id` int NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `songs_albums` (`album_id`),
  KEY `songs_genres` (`genre_id`),
  KEY `songs_mood` (`mood_id`),
  CONSTRAINT `songs_albums` FOREIGN KEY (`album_id`) REFERENCES `albums` (`alid`),
  CONSTRAINT `songs_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`gid`),
  CONSTRAINT `songs_mood` FOREIGN KEY (`mood_id`) REFERENCES `moods` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Funky Duck',1,2,4),(2,'Escape',2,2,8),(3,'Habit',3,2,1),(4,'Footsteps',4,2,8),(5,'Overload',5,1,3),(6,'New Light',6,2,7),(7,'One More Night',7,2,2),(8,'Lock N Key',8,4,7),(9,'Straightjacket',9,4,1),(10,'Blinding Lights',10,2,1),(11,'didya think',11,1,8),(12,'The Palisades',12,4,7),(13,'Suzanne',13,2,3),(14,'Amado Mio',14,3,5),(15,'Happy Together',15,1,7),(16,'Despacito',16,8,1),(17,'Walkies',1,2,4);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'User 1 ','user1@gmail.com'),(2,'User 2','user2.@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follows_artist`
--

DROP TABLE IF EXISTS `user_follows_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_follows_artist` (
  `aid` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`aid`,`user_id`),
  KEY `user_follows_artist_fk2` (`user_id`),
  CONSTRAINT `user_follows_artist_fk1` FOREIGN KEY (`aid`) REFERENCES `artists` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_follows_artist_fk2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follows_artist`
--

LOCK TABLES `user_follows_artist` WRITE;
/*!40000 ALTER TABLE `user_follows_artist` DISABLE KEYS */;
INSERT INTO `user_follows_artist` VALUES (1,1),(4,1),(7,1),(9,1),(1,2),(7,2),(9,2);
/*!40000 ALTER TABLE `user_follows_artist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28 15:36:12
