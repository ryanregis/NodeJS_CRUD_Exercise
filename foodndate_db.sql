CREATE DATABASE  IF NOT EXISTS `food_n_date` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `food_n_date`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: food_n_date
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `food_category_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_id`),
  KEY `fk_food_category_idx` (`food_category_id`),
  CONSTRAINT `fk_food_category` FOREIGN KEY (`food_category_id`) REFERENCES `food_category` (`food_category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Concombre a la Menthe (Cucumber Salad with Mint Leaves)',0,1,'2021-12-13 11:19:09','2021-12-13 11:19:09'),(2,'Lyonnaise Salad',0,1,'2021-12-13 11:19:09','2021-12-13 11:19:09'),(3,'Onion Galette',0,1,'2021-12-13 11:19:09','2021-12-13 11:19:09'),(4,'Cheese Souffle',0,1,'2021-12-13 11:19:09','2021-12-13 11:19:09'),(5,'Coquilles Saint-Jacques (Great Scallops)',0,1,'2021-12-13 11:19:09','2021-12-13 11:19:09'),(6,'Olive Tapenade',0,1,'2021-12-13 11:19:09','2021-12-13 11:19:09'),(7,'Boeuf Bourguignon (Beef Stew)',0,2,'2021-12-13 11:19:09','2021-12-13 11:19:09'),(8,'Coq Au Vin (Red Wine Chicken Stew)',0,2,'2021-12-13 11:19:10','2021-12-13 11:19:10'),(9,'Chicken Cordon Bleu',0,2,'2021-12-13 11:19:10','2021-12-13 11:19:10'),(10,'Duck à l’Orange',0,2,'2021-12-13 11:19:10','2021-12-13 11:19:10'),(11,'Roasted Chicken with Herb Jus',0,2,'2021-12-13 11:19:10','2021-12-13 11:19:10'),(12,'Bouillabaisse',0,2,'2021-12-13 11:19:10','2021-12-13 11:19:10'),(13,'French Coconut Pie',0,3,'2021-12-13 11:19:10','2021-12-13 11:19:10'),(14,'Passion Fruit and Lemon Meringue Tartlets',0,3,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(15,'Pear Tart',0,3,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(16,'Strawberry Fraisier Chiffon Cake',0,3,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(17,'Profiteroles',0,3,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(18,'Mousse Au Chocolat',0,3,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(19,'Cannelés de Bordeaux',0,3,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(20,'Quiche Lorraine',0,4,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(21,'Croque Monsieur',0,4,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(22,'Croque Madame',0,4,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(23,'Jambon - Beurre',0,4,'2021-12-13 11:19:11','2021-12-13 11:19:11'),(24,'Croissant',0,4,'2021-12-13 11:19:12','2021-12-13 11:19:12'),(25,'Red Wine (Mouton Cadet Bordeaux Rouge)',0,5,'2021-12-13 11:19:12','2021-12-13 11:19:12'),(26,'White Wine (Champagne)',0,5,'2021-12-13 11:19:12','2021-12-13 11:19:12'),(27,'Mimosa',0,5,'2021-12-13 11:19:12','2021-12-13 11:19:12');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_category`
--

DROP TABLE IF EXISTS `food_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_category` (
  `food_category_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_category`
--

LOCK TABLES `food_category` WRITE;
/*!40000 ALTER TABLE `food_category` DISABLE KEYS */;
INSERT INTO `food_category` VALUES (1,'Appetizers / L’Entrée','2021-12-13 11:09:32','2021-12-13 11:09:32'),(2,'Main Course / Plat Principal','2021-12-13 11:09:32','2021-12-13 11:09:32'),(3,'Dessert / Le Dessert','2021-12-13 11:09:32','2021-12-13 11:09:32'),(4,'Side Dishes / Plat d\'Accompagnement','2021-12-13 11:09:32','2021-12-13 11:09:32'),(5,'Drinks / Boissons','2021-12-13 11:09:32','2021-12-13 11:09:32');
/*!40000 ALTER TABLE `food_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-17 15:18:10
