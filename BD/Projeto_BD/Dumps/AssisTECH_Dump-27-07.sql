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
-- Table structure for table `adm_financeiro`
--

DROP TABLE IF EXISTS `adm_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_financeiro` (
  `Matricula` varchar(10) NOT NULL DEFAULT '',
  `Cod_Contracheque` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `adm_fincanceiro_contracheque` (`Cod_Contracheque`),
  CONSTRAINT `adm_financeiro_funcionario_fk` FOREIGN KEY (`Matricula`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_financeiro`
--

LOCK TABLES `adm_financeiro` WRITE;
/*!40000 ALTER TABLE `adm_financeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_financeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracheque`
--

DROP TABLE IF EXISTS `contracheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracheque` (
  `Matricula_Admin_Financeiro` varchar(10) DEFAULT NULL,
  `Codigo` varchar(14) NOT NULL DEFAULT '',
  `Data_Contracheque` date DEFAULT NULL,
  `Horas_extras` int(10) DEFAULT NULL,
  `Salario_Base` int(9) DEFAULT NULL,
  `Adicional_Salario` int(9) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `contracheque_admin_fincanceiro_fk_idx` (`Matricula_Admin_Financeiro`),
  CONSTRAINT `contracheque_admin_financeiro_fk` FOREIGN KEY (`Matricula_Admin_Financeiro`) REFERENCES `adm_financeiro` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracheque`
--

LOCK TABLES `contracheque` WRITE;
/*!40000 ALTER TABLE `contracheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `COD_Contrato` varchar(5) NOT NULL DEFAULT '',
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  `StatusContrato` enum('Aberto','Finalizado') DEFAULT NULL,
  `ID_Documento` varchar(10) NOT NULL,
  `ID_Tipo_Contrato` varchar(5) NOT NULL,
  PRIMARY KEY (`COD_Contrato`),
  KEY `contrato_ID_Documento_fk` (`ID_Documento`),
  KEY `contrato_ID_Tipo_Contrato_fk` (`ID_Tipo_Contrato`),
  CONSTRAINT `contrato_ID_Documento_fk` FOREIGN KEY (`ID_Documento`) REFERENCES `documento` (`ID_Documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contrato_ID_Tipo_Contrato_fk` FOREIGN KEY (`ID_Tipo_Contrato`) REFERENCES `tipo_contrato` (`ID_Tipo_Contrato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `Sequencial` int(10) NOT NULL DEFAULT '0',
  `Matricula_Func` varchar(10) NOT NULL DEFAULT '',
  `Sexo` varchar(1) DEFAULT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `Parentesco` varchar(8) DEFAULT NULL,
  `Idade` int(3) DEFAULT NULL,
  PRIMARY KEY (`Matricula_Func`,`Sequencial`),
  CONSTRAINT `dependente_funcionario_fk` FOREIGN KEY (`Matricula_Func`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `ID_Documento` varchar(10) NOT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Título` varchar(50) DEFAULT NULL,
  `Data_De_Criação` date DEFAULT NULL,
  `Arquivo` varchar(6) DEFAULT NULL,
  `Versão` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID_Documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `CNPJ` int(14) NOT NULL,
  `RazaoSocial` varchar(20) DEFAULT NULL,
  `Endereço` varchar(30) DEFAULT NULL,
  `Fone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipamento` (
  `Cod_Equipamento` varchar(8) NOT NULL DEFAULT '',
  `Cod_Contrato` varchar(5) DEFAULT NULL,
  `StatusEquip` enum('Bom','Regular','Ruim') DEFAULT NULL,
  `FabricanteEquip` varchar(30) DEFAULT NULL,
  `HistoricoEquip` varchar(40) DEFAULT NULL,
  `DescricaoEquip` varchar(50) DEFAULT NULL,
  `SetorEquip` varchar(20) DEFAULT NULL,
  `DataEntradaEquip` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Equipamento`),
  KEY `equipamento_contrato_fk_idx` (`Cod_Contrato`),
  CONSTRAINT `equipamento_contrato_fk` FOREIGN KEY (`Cod_Contrato`) REFERENCES `contrato` (`COD_Contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `Matricula` varchar(10) NOT NULL DEFAULT '',
  `Cod_Contracheque` varchar(10) DEFAULT NULL,
  `Sequencial_Dependente` varchar(12) DEFAULT NULL,
  `Id_Jornada_Trabalho` varchar(8) DEFAULT NULL,
  `Login` varchar(15) DEFAULT NULL,
  `Senha` varchar(8) DEFAULT NULL,
  `Nome` varchar(15) DEFAULT NULL,
  `Cpf` int(9) DEFAULT NULL,
  `Email` varchar(12) DEFAULT NULL,
  `Carga_hora` int(10) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `funcionario_jornada_trabalho_fk` (`Id_Jornada_Trabalho`),
  KEY `funcionario_contracheque_fk` (`Cod_Contracheque`),
  CONSTRAINT `funcionario_contracheque_fk` FOREIGN KEY (`Cod_Contracheque`) REFERENCES `contracheque` (`Codigo`),
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

--
-- Table structure for table `jornada_trabalho`
--

DROP TABLE IF EXISTS `jornada_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornada_trabalho` (
  `ID_Jornada_Trabalho` varchar(8) NOT NULL DEFAULT '',
  `Horario_Inicio` int(11) DEFAULT NULL,
  `Horario_Fim` int(11) DEFAULT NULL,
  `Trabalha_Sabado` varchar(5) DEFAULT NULL,
  `Descricao` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID_Jornada_Trabalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada_trabalho`
--

LOCK TABLES `jornada_trabalho` WRITE;
/*!40000 ALTER TABLE `jornada_trabalho` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orcamento` (
  `CodOrcamento` varchar(10) NOT NULL DEFAULT '',
  `DescOrcamento` varchar(50) DEFAULT NULL,
  `DtAbert_Orcto` date DEFAULT NULL,
  `DtEmissao_Orcto` date DEFAULT NULL,
  `ValidadeEmDias_Orcto` date DEFAULT NULL,
  `UltimaData_Orcto` date DEFAULT NULL,
  PRIMARY KEY (`CodOrcamento`),
  UNIQUE KEY `CodOrcamento_UNIQUE` (`CodOrcamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_de_servico`
--

DROP TABLE IF EXISTS `ordem_de_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_de_servico` (
  `Num_OS` varchar(10) NOT NULL DEFAULT '',
  `Cod_Orcamento` varchar(10) DEFAULT NULL,
  `Status_OS` enum('Aberto','Fechado') DEFAULT NULL,
  `DataCricao_OS` date DEFAULT NULL,
  `PrazoEmDiasOS` date DEFAULT NULL,
  `DtDevida` date DEFAULT NULL,
  PRIMARY KEY (`Num_OS`),
  UNIQUE KEY `Cod_Orcamento_UNIQUE` (`Cod_Orcamento`),
  CONSTRAINT `orcamento_ordem_fk` FOREIGN KEY (`Cod_Orcamento`) REFERENCES `orcamento` (`CodOrcamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_de_servico`
--

LOCK TABLES `ordem_de_servico` WRITE;
/*!40000 ALTER TABLE `ordem_de_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_de_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contrato` (
  `ID_Tipo_Contrato` varchar(5) NOT NULL,
  `Descrição` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Tipo_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_de_suporte`
--

DROP TABLE IF EXISTS `unidade_de_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_de_suporte` (
  `CNPJ_Empresa` int(14) NOT NULL,
  `Estado` varchar(10) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `Endereço` varchar(30) DEFAULT NULL,
  `Nome` varchar(15) DEFAULT NULL,
  `Matriz` varchar(20) DEFAULT NULL,
  `RazaoSocial` varchar(20) NOT NULL,
  PRIMARY KEY (`CNPJ_Empresa`),
  CONSTRAINT `CNPJ_unidade_de_suporte_fk` FOREIGN KEY (`CNPJ_Empresa`) REFERENCES `empresa` (`CNPJ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_de_suporte`
--

LOCK TABLES `unidade_de_suporte` WRITE;
/*!40000 ALTER TABLE `unidade_de_suporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_de_suporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-27 21:37:07
