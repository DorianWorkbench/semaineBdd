-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: woofing
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `ACTIVITE`
--

DROP TABLE IF EXISTS `ACTIVITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTIVITE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITE`
--

LOCK TABLES `ACTIVITE` WRITE;
/*!40000 ALTER TABLE `ACTIVITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTIVITE_HOTE`
--

DROP TABLE IF EXISTS `ACTIVITE_HOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTIVITE_HOTE` (
  `idHote` int NOT NULL,
  `idActivite` int NOT NULL,
  PRIMARY KEY (`idHote`,`idActivite`),
  KEY `idActivite` (`idActivite`),
  CONSTRAINT `ACTIVITE_HOTE_ibfk_1` FOREIGN KEY (`idHote`) REFERENCES `HOTE` (`idUtilisateur`),
  CONSTRAINT `ACTIVITE_HOTE_ibfk_2` FOREIGN KEY (`idActivite`) REFERENCES `ACTIVITE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITE_HOTE`
--

LOCK TABLES `ACTIVITE_HOTE` WRITE;
/*!40000 ALTER TABLE `ACTIVITE_HOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVITE_HOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHANTIER`
--

DROP TABLE IF EXISTS `CHANTIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHANTIER` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) NOT NULL,
  `capacite` int NOT NULL,
  `date_Debut` datetime NOT NULL,
  `date_Fin` datetime NOT NULL,
  `idHote` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idHote` (`idHote`),
  CONSTRAINT `CHANTIER_ibfk_1` FOREIGN KEY (`idHote`) REFERENCES `HOTE` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHANTIER`
--

LOCK TABLES `CHANTIER` WRITE;
/*!40000 ALTER TABLE `CHANTIER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHANTIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOTE`
--

DROP TABLE IF EXISTS `HOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOTE` (
  `idUtilisateur` int NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`idUtilisateur`),
  CONSTRAINT `HOTE_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `UTILISATEUR` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOTE`
--

LOCK TABLES `HOTE` WRITE;
/*!40000 ALTER TABLE `HOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `HOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NIVEAU`
--

DROP TABLE IF EXISTS `NIVEAU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NIVEAU` (
  `idUtilisateur` int NOT NULL,
  `idTypeActivite` int NOT NULL,
  `note` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`idTypeActivite`),
  KEY `idTypeActivite` (`idTypeActivite`),
  CONSTRAINT `NIVEAU_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `UTILISATEUR` (`id`),
  CONSTRAINT `NIVEAU_ibfk_2` FOREIGN KEY (`idTypeActivite`) REFERENCES `TYPE_ACTIVITE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NIVEAU`
--

LOCK TABLES `NIVEAU` WRITE;
/*!40000 ALTER TABLE `NIVEAU` DISABLE KEYS */;
/*!40000 ALTER TABLE `NIVEAU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPEACT_CHANTIER`
--

DROP TABLE IF EXISTS `TYPEACT_CHANTIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TYPEACT_CHANTIER` (
  `idChantier` int NOT NULL,
  `idTypeActivite` int NOT NULL,
  PRIMARY KEY (`idChantier`,`idTypeActivite`),
  KEY `idTypeActivite` (`idTypeActivite`),
  CONSTRAINT `TYPEACT_CHANTIER_ibfk_1` FOREIGN KEY (`idChantier`) REFERENCES `CHANTIER` (`id`),
  CONSTRAINT `TYPEACT_CHANTIER_ibfk_2` FOREIGN KEY (`idTypeActivite`) REFERENCES `TYPE_ACTIVITE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPEACT_CHANTIER`
--

LOCK TABLES `TYPEACT_CHANTIER` WRITE;
/*!40000 ALTER TABLE `TYPEACT_CHANTIER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPEACT_CHANTIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_ACTIVITE`
--

DROP TABLE IF EXISTS `TYPE_ACTIVITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TYPE_ACTIVITE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_ACTIVITE`
--

LOCK TABLES `TYPE_ACTIVITE` WRITE;
/*!40000 ALTER TABLE `TYPE_ACTIVITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_ACTIVITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UTILISATEUR`
--

DROP TABLE IF EXISTS `UTILISATEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UTILISATEUR` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ndc` varchar(25) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `idRole` int NOT NULL,
  `ban` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idRole` (`idRole`),
  CONSTRAINT `UTILISATEUR_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `ROLE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UTILISATEUR`
--

LOCK TABLES `UTILISATEUR` WRITE;
/*!40000 ALTER TABLE `UTILISATEUR` DISABLE KEYS */;
/*!40000 ALTER TABLE `UTILISATEUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VALIDER`
--

DROP TABLE IF EXISTS `VALIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VALIDER` (
  `idVolontaire` int NOT NULL,
  `idChantier` int NOT NULL,
  `idHote` int NOT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idVolontaire`,`idChantier`),
  KEY `idChantier` (`idChantier`),
  CONSTRAINT `VALIDER_ibfk_1` FOREIGN KEY (`idVolontaire`) REFERENCES `UTILISATEUR` (`id`),
  CONSTRAINT `VALIDER_ibfk_2` FOREIGN KEY (`idChantier`) REFERENCES `CHANTIER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VALIDER`
--

LOCK TABLES `VALIDER` WRITE;
/*!40000 ALTER TABLE `VALIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `VALIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WOOFING`
--

DROP TABLE IF EXISTS `WOOFING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WOOFING` (
  `idVolontaire` int NOT NULL,
  `idHote` int NOT NULL,
  `date_arrivee` datetime NOT NULL,
  `date_depart` datetime NOT NULL,
  PRIMARY KEY (`idVolontaire`,`idHote`),
  KEY `idHote` (`idHote`),
  CONSTRAINT `WOOFING_ibfk_1` FOREIGN KEY (`idVolontaire`) REFERENCES `UTILISATEUR` (`id`),
  CONSTRAINT `WOOFING_ibfk_2` FOREIGN KEY (`idHote`) REFERENCES `HOTE` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WOOFING`
--

LOCK TABLES `WOOFING` WRITE;
/*!40000 ALTER TABLE `WOOFING` DISABLE KEYS */;
/*!40000 ALTER TABLE `WOOFING` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-19 13:38:46
