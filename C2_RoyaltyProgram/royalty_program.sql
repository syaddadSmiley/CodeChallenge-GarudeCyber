-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: royalty_program
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `user_id` int NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,1,'ABC123','2024-01-17 07:08:26'),(2,2,2,'DEF456','2024-01-17 07:08:26'),(3,3,3,'GHI789','2024-01-17 07:08:26'),(4,4,4,'JKL012','2024-01-17 07:08:26'),(5,5,5,'MNO345','2024-01-17 07:08:26'),(6,6,6,'PQR678','2024-01-17 07:08:26'),(7,7,7,'STU901','2024-01-17 07:08:26'),(8,8,8,'VWX234','2024-01-17 07:08:26'),(9,9,9,'YZA567','2024-01-17 07:08:26'),(10,10,10,'BCD890','2024-01-17 07:08:26');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `point` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `rewards_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards`
--

LOCK TABLES `rewards` WRITE;
/*!40000 ALTER TABLE `rewards` DISABLE KEYS */;
INSERT INTO `rewards` VALUES (1,1,'Reward1','Description1',100,'2024-01-17 07:08:26'),(2,2,'Reward2','Description2',150,'2024-01-17 07:08:26'),(3,3,'Reward3','Description3',200,'2024-01-17 07:08:26'),(4,4,'Reward4','Description4',250,'2024-01-17 07:08:26'),(5,5,'Reward5','Description5',300,'2024-01-17 07:08:26'),(6,6,'Reward6','Description6',350,'2024-01-17 07:08:26'),(7,7,'Reward7','Description7',400,'2024-01-17 07:08:26'),(8,8,'Reward8','Description8',450,'2024-01-17 07:08:26'),(9,9,'Reward9','Description9',500,'2024-01-17 07:08:26'),(10,10,'Reward10','Description10',550,'2024-01-17 07:08:26');
/*!40000 ALTER TABLE `rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards_redemptions`
--

DROP TABLE IF EXISTS `rewards_redemptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewards_redemptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reward_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `reward_id` (`reward_id`),
  CONSTRAINT `rewards_redemptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `rewards_redemptions_ibfk_2` FOREIGN KEY (`reward_id`) REFERENCES `rewards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards_redemptions`
--

LOCK TABLES `rewards_redemptions` WRITE;
/*!40000 ALTER TABLE `rewards_redemptions` DISABLE KEYS */;
INSERT INTO `rewards_redemptions` VALUES (2,2,2,'2024-01-17 07:08:26'),(3,3,3,'2024-01-17 07:08:26'),(4,4,4,'2024-01-17 07:08:26'),(5,5,5,'2024-01-17 07:08:26'),(6,6,6,'2024-01-17 07:08:26'),(7,7,7,'2024-01-17 07:08:26'),(8,8,8,'2024-01-17 07:08:26'),(9,9,9,'2024-01-17 07:08:26'),(10,10,10,'2024-01-17 07:08:26'),(12,1,1,'2024-01-17 01:16:17');
/*!40000 ALTER TABLE `rewards_redemptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES (1,'Tenant 1','2024-01-17 07:08:26'),(2,'Tenant 2','2024-01-17 07:08:26'),(3,'Tenant 3','2024-01-17 07:08:26'),(4,'Tenant 4','2024-01-17 07:08:26'),(5,'Tenant 5','2024-01-17 07:08:26'),(6,'Tenant 6','2024-01-17 07:08:26'),(7,'Tenant 7','2024-01-17 07:08:26'),(8,'Tenant 8','2024-01-17 07:08:26'),(9,'Tenant 9','2024-01-17 07:08:26'),(10,'Tenant 10','2024-01-17 07:08:26');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `voucher_id` int NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `voucher_id` (`voucher_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,500000,'2024-01-17 07:08:26'),(2,2,2,600000,'2024-01-17 07:08:26'),(3,3,3,700000,'2024-01-17 07:08:26'),(4,4,4,800000,'2024-01-17 07:08:26'),(5,5,5,900000,'2024-01-17 07:08:26'),(6,6,6,1000000,'2024-01-17 07:08:26'),(7,7,7,1100000,'2024-01-17 07:08:26'),(8,8,8,1200000,'2024-01-17 07:08:26'),(9,9,9,1300000,'2024-01-17 07:08:26'),(10,10,10,1400000,'2024-01-17 07:08:26');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `points` int DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Budi Santoso','budi.santoso@mail.com','$2y$10$97lUf8PADqdMhxSipRxTeeGkZDM0V.YCbfpIXHRnnbkhP4HaNiLyC',800,'081234567890','2024-01-17 07:08:26',NULL),(2,'Dewi Rahayu','dewi.rahayu@mail.com','$2y$10$r.s.oRLMvsX1nhgt5/ZAse0WxqNcT/tztI340XU.sFWsshEcQQX8m',NULL,'087654321098','2024-01-17 07:08:26',NULL),(3,'Putra Pratama','putra.pratama@mail.com','$2y$10$ebOrZMufVkU4rTwh7tYOvefijRS6a0lSw4Ztzz5jfzVLKm5zC4TZG',NULL,'085551234567','2024-01-17 07:08:26',NULL),(4,'Anita Setiawati','anita.setiawati@mail.com','$2y$10$69kkXwHOfK7BRts6a3q//uJHf.OsJMKKjBzRlUCfV30v3FAm7G/RS',NULL,'089998765432','2024-01-17 07:08:26',NULL),(5,'Adi Nugroho','adi.nugroho@mail.com','$2y$10$qN8jBpxJc0E.5ff9YKIfU.XPlMPp3gbejFMZUGZE1oEoeta6VYgmu',NULL,'081112233445','2024-01-17 07:08:26',NULL),(6,'Rini Permata','rini.permata@mail.com','$2y$10$vuOWyHAUm3EE4RPIST1RWem1MEAjBv2FDYyfD/bhlHXuNyNUdEh/u',NULL,'06667778888','2024-01-17 07:08:26',NULL),(7,'Deni Laksono','deni.laksono@mail.com','$2y$10$MsXM2SEWd8NdFOE4jYH9Ve9Xrxnaul4S2fgH2Yv3YmH.u1I7gQmU2',NULL,'04445556666','2024-01-17 07:08:26',NULL),(8,'Sari Indah','sari.indah@mail.com','$2y$10$Ypebj7fsMMODoRHZ4zQvMeXHGiwj6l.adYYx1SSaFTbrHuwhVkIWq',NULL,'1239876543','2024-01-17 07:08:26',NULL),(9,'Hadi Wijaya','hadi.wijaya@mail.com','$2y$10$VctmY6krpmTW2ca2lFBNsurrSm73L2QJJh3NgKTDYh02KUErzRgOi',NULL,'07778889999','2024-01-17 07:08:26',NULL),(10,'Siti Nurhayati','siti.nurhayati@mail.com','$2y$10$g18uX5I/tTo84qFlbk96hOTDS2Ar/jpwoyKIAZViWKtpMO5l4.z8m',NULL,'03334445555','2024-01-17 07:08:26',NULL),(11,'Ananda Dwi Thando','adwi3551@gmail.com','$2y$10$oz4t8GEv7de8MCj6prO/4.4iJnyuxODtZ/5tB6dFc2cmHbU8/jl6i',NULL,'','2024-01-17 07:09:21',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `voucher_code` varchar(50) NOT NULL,
  `tenant_id` varchar(100) DEFAULT NULL,
  `expired_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,1,'Voucher1','1','2024-03-31 17:00:00','2024-01-17 07:08:26'),(2,2,'Voucher2','2','2024-04-14 17:00:00','2024-01-17 07:08:26'),(3,3,'Voucher3','3','2024-04-30 17:00:00','2024-01-17 07:08:26'),(4,4,'Voucher4','4','2024-05-14 17:00:00','2024-01-17 07:08:26'),(5,5,'Voucher5','5','2024-05-31 17:00:00','2024-01-17 07:08:26'),(6,6,'Voucher6','6','2024-06-14 17:00:00','2024-01-17 07:08:26'),(7,7,'Voucher7','7','2024-06-30 17:00:00','2024-01-17 07:08:26'),(8,8,'Voucher8','8','2024-07-14 17:00:00','2024-01-17 07:08:26'),(9,9,'Voucher9','9','2024-07-31 17:00:00','2024-01-17 07:08:26'),(10,10,'Voucher10','10','2024-08-14 17:00:00','2024-01-17 07:08:26');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-17 15:20:34
