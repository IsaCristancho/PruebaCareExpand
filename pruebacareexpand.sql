-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: pruebacareexpand
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `fallevents`
--

DROP TABLE IF EXISTS `fallevents`;
/*!50001 DROP VIEW IF EXISTS `fallevents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fallevents` AS SELECT 
 1 AS `event_id`,
 1 AS `timestamp`,
 1 AS `dataOwner`,
 1 AS `eventType`,
 1 AS `Name`,
 1 AS `LastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient_device_history`
--

DROP TABLE IF EXISTS `patient_device_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_device_history` (
  `id` int NOT NULL,
  `timestamp` text NOT NULL,
  `dataOwner` text,
  `eventType` text,
  `patientId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `patient_device_history_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_device_history`
--

LOCK TABLES `patient_device_history` WRITE;
/*!40000 ALTER TABLE `patient_device_history` DISABLE KEYS */;
INSERT INTO `patient_device_history` VALUES (1,'2024-09-26 18:50:29','SYSTEM','FALL',4),(2,'2024-09-26 18:51:00','WATCH','LOCATION',4),(3,'2024-09-26 18:52:00','SYSTEM','SMS',5),(4,'2024-09-26 18:53:30','WATCH','FALL',6),(5,'2024-09-26 18:54:15','SYSTEM','LOCATION',6),(6,'2024-09-26 18:55:45','WATCH','FALL',4);
/*!40000 ALTER TABLE `patient_device_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL,
  `Name` text NOT NULL,
  `LastName` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Maria','Sanchez'),(2,'Marina','Rodriguez'),(3,'Diego','Serrano'),(4,'Pablo','Vinals'),(5,'Daniel','Gordillo'),(6,'Laura','Martínez');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `fallevents`
--

/*!50001 DROP VIEW IF EXISTS `fallevents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fallevents` AS select `p`.`id` AS `event_id`,`p`.`timestamp` AS `timestamp`,`p`.`dataOwner` AS `dataOwner`,`p`.`eventType` AS `eventType`,`pat`.`Name` AS `Name`,`pat`.`LastName` AS `LastName` from (`patient_device_history` `p` join `patients` `pat` on((`p`.`patientId` = `pat`.`id`))) where ((`p`.`eventType` = 'FALL') and (`p`.`dataOwner` = 'WATCH')) */;
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

-- Dump completed on 2024-11-15 20:51:00
