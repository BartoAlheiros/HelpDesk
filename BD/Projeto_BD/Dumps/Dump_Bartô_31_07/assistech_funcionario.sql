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
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `Matricula` varchar(10) NOT NULL DEFAULT '',
  `Cod_Unid_Sup` varchar(15) NOT NULL,
  `Id_Jornada_Trabalho` varchar(8) NOT NULL,
  `Cod_Contracheque` varchar(10) DEFAULT NULL,
  `Sequencial_Dependente` varchar(12) DEFAULT NULL,
  `Login` varchar(15) DEFAULT NULL,
  `Senha` varchar(8) DEFAULT NULL,
  `Nome` varchar(15) DEFAULT NULL,
  `Cpf` varchar(9) DEFAULT NULL,
  `Email` varchar(12) DEFAULT NULL,
  `Carga_hora` int(10) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `funcionario_jornada_trabalho_fk` (`Id_Jornada_Trabalho`),
  KEY `func_unidade_de_sup_fk` (`Cod_Unid_Sup`),
  CONSTRAINT `func_unidade_de_sup_fk` FOREIGN KEY (`Cod_Unid_Sup`) REFERENCES `unidade_de_suporte` (`COD`),
  CONSTRAINT `funcionario_jornada_trabalho_fk` FOREIGN KEY (`Id_Jornada_Trabalho`) REFERENCES `jornada_trabalho` (`ID_Jornada_Trabalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-31 21:46:24
