CREATE DATABASE  IF NOT EXISTS `assistech` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `assistech`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: assistech
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `supervisor_supervisiona_funcionario`
--

DROP TABLE IF EXISTS `supervisor_supervisiona_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor_supervisiona_funcionario` (
  `Matricula_supervisor` varchar(10) NOT NULL DEFAULT '',
  `Matricula_supervisionado` varchar(10) NOT NULL DEFAULT '',
  `Data_inicio` date DEFAULT NULL,
  PRIMARY KEY (`Matricula_supervisor`,`Matricula_supervisionado`),
  UNIQUE KEY `Matricula_supervisor_UNIQUE` (`Matricula_supervisor`),
  KEY `supervisao_supervisionado_fk` (`Matricula_supervisionado`),
  CONSTRAINT `supervisao_supervisionado_fk` FOREIGN KEY (`Matricula_supervisionado`) REFERENCES `funcionario` (`Matricula`),
  CONSTRAINT `supervisao_supervisor_fk` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor_supervisiona_funcionario`
--

LOCK TABLES `supervisor_supervisiona_funcionario` WRITE;
/*!40000 ALTER TABLE `supervisor_supervisiona_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisor_supervisiona_funcionario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-04 16:22:44
