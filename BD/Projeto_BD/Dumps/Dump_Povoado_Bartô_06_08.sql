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
-- Table structure for table `abre_chamado`
--

DROP TABLE IF EXISTS `abre_chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abre_chamado` (
  `cliente_COD` varchar(15) NOT NULL,
  PRIMARY KEY (`cliente_COD`),
  CONSTRAINT `fk_cliente_abre_chamado_cliente1` FOREIGN KEY (`cliente_COD`) REFERENCES `cliente` (`COD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abre_chamado`
--

LOCK TABLES `abre_chamado` WRITE;
/*!40000 ALTER TABLE `abre_chamado` DISABLE KEYS */;
/*!40000 ALTER TABLE `abre_chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_financeiro`
--

DROP TABLE IF EXISTS `adm_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_financeiro` (
  `Matricula_funcionario` varchar(10) NOT NULL DEFAULT '',
  `Cod_Contracheque` varchar(14) DEFAULT NULL,
  `Cod_Desp_Viag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Matricula_funcionario`),
  KEY `adm_financeiro_desp_viag_fk` (`Cod_Desp_Viag`),
  KEY `funcionario_adm_financeiro_idx_fk` (`Matricula_funcionario`),
  KEY `contracheque_admin_financeiro_fk` (`Cod_Contracheque`),
  KEY `fk_despesa_viagem_adm_financeiro1` (`Cod_Desp_Viag`),
  CONSTRAINT `adm_financeiro_desp_viag_fk` FOREIGN KEY (`Cod_Desp_Viag`) REFERENCES `despesa_viagem` (`COD`)
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
-- Table structure for table `almoxarifado`
--

DROP TABLE IF EXISTS `almoxarifado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almoxarifado` (
  `ID` varchar(14) NOT NULL,
  `Qtd_total` int(11) DEFAULT NULL,
  `Entrada_mes` date DEFAULT NULL,
  `Saida_mes` date DEFAULT NULL,
  `Descricao` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almoxarifado`
--

LOCK TABLES `almoxarifado` WRITE;
/*!40000 ALTER TABLE `almoxarifado` DISABLE KEYS */;
/*!40000 ALTER TABLE `almoxarifado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendente_solucionador_direcionador`
--

DROP TABLE IF EXISTS `atendente_solucionador_direcionador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendente_solucionador_direcionador` (
  `funcionario_matricula` varchar(10) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_atendente_solucionador_direcionador_tecnico1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `tecnico` (`funcionario_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendente_solucionador_direcionador`
--

LOCK TABLES `atendente_solucionador_direcionador` WRITE;
/*!40000 ALTER TABLE `atendente_solucionador_direcionador` DISABLE KEYS */;
/*!40000 ALTER TABLE `atendente_solucionador_direcionador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_problema_kb`
--

DROP TABLE IF EXISTS `base_problema_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_problema_kb` (
  `Id_base_problema_KB` varchar(26) NOT NULL DEFAULT '',
  `Descricao` varchar(25) DEFAULT NULL,
  `Solucao` varchar(23) DEFAULT NULL,
  `Dt_entrada` date DEFAULT NULL,
  `Tempo_necessario` varchar(22) DEFAULT NULL,
  `Obs` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`Id_base_problema_KB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_problema_kb`
--

LOCK TABLES `base_problema_kb` WRITE;
/*!40000 ALTER TABLE `base_problema_kb` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_problema_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseou_em`
--

DROP TABLE IF EXISTS `baseou_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseou_em` (
  `Id_base_problema_KB` varchar(26) NOT NULL,
  `servico_COD` varchar(13) NOT NULL,
  PRIMARY KEY (`Id_base_problema_KB`,`servico_COD`),
  KEY `fk_servico_has_base_problema_kb_base_problema_kb1_idx` (`Id_base_problema_KB`),
  KEY `fk_servico_has_base_problema_kb_servico1_idx` (`servico_COD`),
  CONSTRAINT `fk_servico_has_base_problema_kb_base_problema_kb1` FOREIGN KEY (`Id_base_problema_KB`) REFERENCES `base_problema_kb` (`Id_base_problema_KB`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_has_base_problema_kb_servico1` FOREIGN KEY (`servico_COD`) REFERENCES `servico` (`COD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseou_em`
--

LOCK TABLES `baseou_em` WRITE;
/*!40000 ALTER TABLE `baseou_em` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseou_em` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `Cod_categoria` varchar(15) NOT NULL,
  `Descricao` varchar(12) NOT NULL,
  PRIMARY KEY (`Cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado`
--

DROP TABLE IF EXISTS `chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado` (
  `No_Seq` int(11) NOT NULL DEFAULT '0',
  `Tipo` varchar(30) DEFAULT NULL,
  `Status_` varchar(20) DEFAULT NULL,
  `Descric` varchar(100) DEFAULT NULL,
  `Prioridade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`No_Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado`
--

LOCK TABLES `chamado` WRITE;
/*!40000 ALTER TABLE `chamado` DISABLE KEYS */;
/*!40000 ALTER TABLE `chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `COD` varchar(15) NOT NULL DEFAULT '',
  `Prioridade` enum('Alta','Media','Baixa') NOT NULL,
  `email` varchar(45) NOT NULL,
  `fone` varchar(16) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_fisico`
--

DROP TABLE IF EXISTS `cliente_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_fisico` (
  `Cod_Cliente` varchar(15) NOT NULL DEFAULT '',
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  UNIQUE KEY `CPF` (`CPF`),
  CONSTRAINT `cliente_fisico_cliente_fk` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_fisico`
--

LOCK TABLES `cliente_fisico` WRITE;
/*!40000 ALTER TABLE `cliente_fisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_jur`
--

DROP TABLE IF EXISTS `cliente_jur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_jur` (
  `Cod_Cliente` varchar(15) NOT NULL DEFAULT '',
  `CNPJ` varchar(14) NOT NULL,
  `Razao_Social` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  CONSTRAINT `cliente_jur_fk` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_jur`
--

LOCK TABLES `cliente_jur` WRITE;
/*!40000 ALTER TABLE `cliente_jur` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_jur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computador`
--

DROP TABLE IF EXISTS `computador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computador` (
  `Cod_Equipamento` varchar(8) NOT NULL DEFAULT '',
  `Sist_OP` varchar(30) NOT NULL,
  `End_IP` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_Equipamento`),
  CONSTRAINT `computador_equipamento_fk` FOREIGN KEY (`Cod_Equipamento`) REFERENCES `equipamento` (`Cod_Equipamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computador`
--

LOCK TABLES `computador` WRITE;
/*!40000 ALTER TABLE `computador` DISABLE KEYS */;
/*!40000 ALTER TABLE `computador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracheque`
--

DROP TABLE IF EXISTS `contracheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracheque` (
  `Codigo` varchar(14) NOT NULL DEFAULT '',
  `admin_financeiro_matricula` varchar(10) NOT NULL,
  `funcionario_matricula` varchar(10) NOT NULL,
  `Data_Contracheque` date NOT NULL,
  `Horas_extras` int(10) DEFAULT '0',
  `Salario_Base` int(9) NOT NULL,
  `Adicional_Salario` int(9) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `contracheque_admin_fincanceiro_fk_idx` (`admin_financeiro_matricula`),
  KEY `contracheque_func_fk` (`funcionario_matricula`)
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
  `ID_Tipo_Contrato` varchar(5) NOT NULL,
  `unidade_de_suporte_CNPJ` varchar(18) NOT NULL,
  `DataInicio` date NOT NULL,
  `DataFim` date NOT NULL,
  `StatusContrato` varchar(30) NOT NULL,
  PRIMARY KEY (`COD_Contrato`),
  KEY `contrato_ID_Tipo_Contrato_fk` (`ID_Tipo_Contrato`),
  KEY `fk_contrato_unidade_de_suporte1_idx` (`unidade_de_suporte_CNPJ`),
  CONSTRAINT `contrato_ID_Tipo_Contrato_fk` FOREIGN KEY (`ID_Tipo_Contrato`) REFERENCES `tipo_contrato` (`ID_Tipo_Contrato`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_contrato_unidade_de_suporte1` FOREIGN KEY (`unidade_de_suporte_CNPJ`) REFERENCES `unidade_de_suporte` (`CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `Sexo` varchar(1) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Parentesco` varchar(20) NOT NULL,
  `Idade` int(3) NOT NULL,
  PRIMARY KEY (`Matricula_Func`,`Sequencial`)
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
-- Table structure for table `despesa_viagem`
--

DROP TABLE IF EXISTS `despesa_viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa_viagem` (
  `COD` varchar(10) NOT NULL,
  `tecnico_campo_matricula` varchar(10) NOT NULL,
  `adm_financeiro_matricula` varchar(10) NOT NULL,
  `tipo_despesa_ID` varchar(7) NOT NULL,
  `Valor` int(11) NOT NULL,
  PRIMARY KEY (`COD`),
  KEY `fk_despesa_viagem_adm_financeiro1_idx` (`adm_financeiro_matricula`),
  KEY `fk_despesa_viagem_tipo_despesa1_idx` (`tipo_despesa_ID`),
  KEY `fk_despesa_viagem_tecnico_campo1_idx` (`tecnico_campo_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa_viagem`
--

LOCK TABLES `despesa_viagem` WRITE;
/*!40000 ALTER TABLE `despesa_viagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `despesa_viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `ID_Documento` varchar(10) NOT NULL,
  `contrato_COD_Contrato` varchar(5) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  `Título` varchar(50) NOT NULL,
  `Data_De_Criação` date NOT NULL,
  `Arquivo` varchar(6) NOT NULL,
  `Versão` varchar(5) NOT NULL,
  PRIMARY KEY (`ID_Documento`),
  KEY `fk_documento_contrato1_idx` (`contrato_COD_Contrato`),
  CONSTRAINT `fk_documento_contrato1` FOREIGN KEY (`contrato_COD_Contrato`) REFERENCES `contrato` (`COD_Contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `CNPJ` varchar(18) NOT NULL,
  `RazaoSocial` varchar(20) DEFAULT NULL,
  `Endereço` varchar(30) NOT NULL,
  `Fone` varchar(15) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('12.475.369/1254-05','SmarTECH','Rua Alberto Calado, 101.','3036-1012',NULL),('12.475.369/1254-06','SOLCast','Rua Alberto Calado, 102.','3036-1013',NULL),('12.475.369/1254-07','Sub11','Rua Alberto Calado, 103.','3036-1014',NULL),('12.475.369/1254-08','ALFATecno','Rua Alberto Calado, 104.','3036-1015',NULL),('12.475.369/1254-09','ARMAN','Rua Alberto Calado, 105.','3036-1016',NULL),('12.475.369/1254-10','USAbit','Rua Alberto Calado, 107.','3036-1017',NULL);
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
  `Num_OS` varchar(10) NOT NULL,
  `Cod_Contrato` varchar(5) NOT NULL,
  `Fabricante` varchar(30) NOT NULL,
  `Status` enum('Bom','Regular','Ruim') NOT NULL,
  `Historico` varchar(40) DEFAULT NULL,
  `Descricao` varchar(50) NOT NULL,
  `Setor` varchar(20) NOT NULL,
  `DataEntrada` date NOT NULL,
  `Num_Serie` varchar(11) DEFAULT NULL,
  `IP_Rede` varchar(12) DEFAULT NULL,
  `Mask_Rede` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Cod_Equipamento`,`Num_OS`),
  KEY `equipamento_contrato_fk_idx` (`Cod_Contrato`),
  KEY `fk_equipamento_ordem_de_servico1_idx` (`Num_OS`),
  CONSTRAINT `equipamento_contrato_fk` FOREIGN KEY (`Cod_Contrato`) REFERENCES `contrato` (`COD_Contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipamento_ordem_de_servico1` FOREIGN KEY (`Num_OS`) REFERENCES `ordem_de_servico` (`Num_OS`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `estante`
--

DROP TABLE IF EXISTS `estante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estante` (
  `COD` int(11) NOT NULL,
  `Descric` varchar(30) NOT NULL,
  PRIMARY KEY (`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estante`
--

LOCK TABLES `estante` WRITE;
/*!40000 ALTER TABLE `estante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fatura` (
  `COD` varchar(10) NOT NULL DEFAULT '',
  `status_` varchar(50) DEFAULT NULL,
  `No_Parcelas` int(11) DEFAULT NULL,
  `Valor_Total` float DEFAULT NULL,
  PRIMARY KEY (`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornece`
--

DROP TABLE IF EXISTS `fornece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornece` (
  `Cnpj_fornecedor` varchar(10) NOT NULL,
  `Cod_insumo` varchar(10) NOT NULL,
  `Dta` varchar(15) NOT NULL,
  `Valor_unit` varchar(15) NOT NULL,
  PRIMARY KEY (`Cnpj_fornecedor`,`Cod_insumo`),
  KEY `fornece_fk` (`Cod_insumo`),
  CONSTRAINT `fornece_fk` FOREIGN KEY (`Cod_insumo`) REFERENCES `insumo` (`Cod_Insumo`),
  CONSTRAINT `fornece_fornecedor_fk` FOREIGN KEY (`Cnpj_fornecedor`) REFERENCES `fornecedor` (`Cnpj_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornece`
--

LOCK TABLES `fornece` WRITE;
/*!40000 ALTER TABLE `fornece` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `Cnpj_fornecedor` varchar(10) NOT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `Razao` varchar(20) DEFAULT NULL,
  `Endereco` varchar(30) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Cnpj_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `matricula` varchar(13) NOT NULL DEFAULT '',
  `CPF` bigint(20) unsigned NOT NULL,
  `Matricula_supervisor` varchar(13) NOT NULL,
  `CNPJ` bigint(20) unsigned NOT NULL,
  `Login` varchar(15) NOT NULL,
  `Senha` varchar(15) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cod_Contracheque` varchar(10) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Carga_hora` int(2) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `Matricula_UNIQUE` (`matricula`),
  KEY `fk_funcionario_unidade_de_suporte1_idx` (`CNPJ`),
  KEY `fk_funcionario_unidade_de_suporte_idx` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('1375488',12475,'88',0,'Aurora','Dominic','7925 Sed St.','12355290-5','',NULL),('1375489',12475,'198',0,'Non Enim Incorp','Elaine','457-2234 Eget, Rd.','59010869-3','',NULL),('1375490',12475,'258',0,'Aliquet Associa','Scott','P.O. Box 562, 7942 Bibendum Av','54962144-7','',NULL),('1375491',12475,'130',0,'Eget Limited','Kiayada','2869 Gravida Rd.','70630423-4','',NULL),('1375492',12475,'122',0,'Sagittis Corp.','Ifeoma','P.O. Box 644, 2552 Non, Street','01975098-3','',NULL),('1375493',12475,'84',0,'Felis Corp.','Carl','P.O. Box 952, 6738 Arcu. Avenu','91694786-7','',NULL),('1375494',12475,'156',0,'Egestas Nunc Co','Madeline','P.O. Box 399, 3876 Nisi. St.','34667568-6','',NULL),('1375495',12475,'26',0,'Mattis Cras Ege','Keiko','P.O. Box 432, 2843 Donec Road','78755329-9','',NULL),('1375496',12475,'61',0,'Nulla Eu Founda','Boris','P.O. Box 121, 7063 Sit Street','05975014-5','',NULL),('1375497',12475,'5',0,'Ultrices Ltd','Xaviera','P.O. Box 658, 1685 Non St.','65431576-2','',NULL),('1375498',12475,'299',0,'Vel Arcu Eu Cor','Gail','764-8305 Interdum. Avenue','04575125-3','',NULL),('1375499',12475,'209',0,'Eros LLP','Slade','P.O. Box 267, 8236 Ac Avenue','34759192-3','',NULL),('1375500',12475,'197',0,'Mollis Integer ','Zelda','P.O. Box 892, 5869 Odio Rd.','90314700-6','',NULL),('16020110-0765',1648010943499,'16880428-9992',12475,'Knox','ELG17TAE5AM','Yates, Demetrius T.','79259','Donec.consectetuer@metus.net',8),('16020909-9084',1620091034599,'16620319-4862',12475,'Molly','NFL83XDL5XF','Day, Fatima C.','22321','adipiscing.fringilla@CuraeDonectincidunt.net',4),('16030723-1886',1651070366199,'16670810-6189',12475,'Len','UZG07OCK8JK','Barry, Abel W.','37857','est.tempor@aliquetnec.edu',7),('16030910-9072',1660041353899,'16431025-1907',12475,'Rae','UFZ71BNY9CU','Alexander, Yetta S.','76758','Maecenas.ornare.egestas@Quisque.edu',6),('16031120-9845',1623122409199,'16750423-1551',12475,'Destiny','BCV11STJ0DY','Ryan, Solomon H.','34442','sodales@mollisPhaselluslibero.net',8),('16040225-2217',1646040171899,'16190213-6587',12475,'Jack','QUB66HHQ8HM','Henderson, Jameson B.','68693','aliquam@dictum.org',5),('16040324-6762',1631071772599,'16750324-5545',12475,'Fulton','FTA77ILV7WD','Yang, Cameran T.','13616','velit.Aliquam@venenatis.edu',4),('16050614-0847',1622121033799,'16190315-6592',12475,'Jessica','RIN95NEN6YU','Griffith, Scarlet F.','81053','risus@estac.org',7),('16080614-7468',1659101501199,'16740302-0451',12475,'Peter','CSS10HAB8UU','Johnston, Jason R.','8932','senectus.et.netus@imperdiet.net',8),('16080618-4834',1683061446499,'16190315-6592',12475,'Lara','HUT20PXF0MI','Schroeder, Benjamin C.','42466','ac.orci@dapibusrutrumjusto.co.uk',6),('16110117-3902',1621081240199,'16710902-1167',12475,'Abraham','WQE04FKZ9LD','Wilson, Constance S.','66886','at.nisi.Cum@magna.net',8),('16110128-8445',1670061495999,'16440417-6069',12475,'Candace','EHD97YNZ7ZD','Simmons, Avram F.','10228','mus.Proin@molestietellus.net',7),('16120208-1525',1689100343499,'16480622-5134',12475,'Bruce','KWG06VID2NU','Baird, Nicole I.','87154','dui.nec@sagittis.com',5),('16121128-4755',1659071565899,'16751209-6046',12475,'Fatima','MWW21TBC9TY','Holden, Ulric V.','94059','est.Mauris.eu@dictumeuplacerat.edu',4),('16130703-6655',1616110915799,'16270302-1481',12475,'Shelby','PBG33DOG1VV','Kirby, Acton S.','83258','orci.Donec.nibh@quis.edu',5),('16131212-4371',1640010500499,'16181017-4456',12475,'Philip','HQX78IKB7AG','Richardson, Garrison U.','55062','Nullam@feugiatplacerat.com',5),('16141013-5691',1642051588699,'16090707-0973',12475,'Jamalia','CXN08XOB5AC','Bolton, Neil R.','25410','imperdiet.nec@sagittisDuisgravida.org',4),('16150120-7045',1614081495399,'16271224-9438',12475,'Lynn','VQB32ZKN7UK','Huber, Tanisha H.','8856','Maecenas.iaculis.aliquet@iderat.net',7),('16150912-1339',1645072964399,'16680915-7883',12475,'Jelani','OXQ60KKI0QZ','Harmon, Sylvia F.','11727','egestas@luctusvulputatenisi.net',4),('16180902-6261',1604120889399,'16581218-8612',12475,'Len','IKN50DHP8RO','Ward, Regina B.','23907','eu.sem.Pellentesque@asollicitudin.edu',4),('16190315-6592',1657051746399,'16790328-1157',12475,'Lucy','FMZ52DJP0AE','Rowland, Kimberly L.','38828','eu.tellus.Phasellus@Inornare.co.uk',6),('16220620-5433',1682031098999,'16690703-6864',12475,'Asher','HVS31HWM9TV','Flores, Yuli H.','68699','ac.mi.eleifend@blandit.net',8),('16220702-1318',1654120715999,'16160927-3204',12475,'Ciaran','PFH95WVB6JT','Carroll, Germaine W.','83550','Mauris.quis.turpis@Loremipsumdolor.ca',4),('16220726-8950',1650051228399,'16490123-0492',12475,'Emerson','RZG70WIA7MJ','Hickman, Amery D.','34856','euismod.mauris.eu@velarcu.co.uk',4),('16230222-8701',1631040169299,'16260427-9303',12475,'Kibo','LEO87ZPA0PD','Farley, Ivor C.','74931','orci@tempuslorem.org',7),('16260101-7441',1612041495399,'16891008-2299',12475,'Vaughan','XQV98MRV8WU','Christensen, Walter K.','67720','magna@atnisiCum.edu',6),('16270626-2561',1630030822499,'16420524-9701',12475,'Daryl','WYA24ZSC7XY','Sandoval, Philip S.','79205','mollis.lectus.pede@diamdictumsapien.com',5),('16270707-0625',1659122145799,'16290929-9212',12475,'Hu','YAU22KMB8XP','Oliver, Declan O.','29202','nec.urna@egetlacusMauris.net',4),('16270710-5454',1662010636999,'16280802-7268',12475,'Tyler','DRM52RAZ7OE','Solis, Lyle T.','95352','nec.malesuada.ut@parturient.edu',4),('16290215-5437',1611061242999,'16541018-9210',12475,'Alma','XXW08NYJ8QH','Hull, Chaney C.','33050','ut@semmolestiesodales.edu',6),('16340225-7251',1678081992899,'16820523-0025',12475,'Lilah','DOI56EUI5IQ','Bruce, Carl Z.','25501','erat@elementumat.net',6),('16340907-9716',1603062497999,'16410629-6595',12475,'Leslie','SBV20OCV9AH','Donaldson, Charity X.','5977','non@aliquetProin.com',8),('16350815-4642',1650061961399,'16541018-9210',12475,'Halee','RLJ97JDC7EO','Bradford, Jesse W.','15660','mi.lacinia.mattis@Curabitur.net',5),('16370607-1556',1610120230299,'16891101-3053',12475,'Yoshi','AUB49CHZ1LW','Lynch, Iona O.','51236','et@adipiscing.com',4),('16380717-0083',1691122912499,'16920816-1613',12475,'Lee','ERN03AHC8CC','Wall, Lars Y.','40282','sem@dictumsapienAenean.co.uk',7),('16380819-6509',1602040918399,'16190315-6592',12475,'Keiko','UPG90XPC9QP','Vincent, Gwendolyn Z.','73409','eget@Etiamvestibulum.edu',4),('16390711-9600',1613093045899,'16260511-3964',12475,'Hamish','MMM41XVO5WB','Holloway, Savannah I.','49441','ut@maurisid.edu',6),('16400314-5747',1685102177299,'16790328-1157',12475,'Heidi','PZF19LUI1QD','Finley, Imogene C.','13547','sollicitudin.commodo.ipsum@tempus.ca',6),('16400318-2443',1666122486899,'16070111-5339',12475,'Kamal','RPF72HVW8QO','Byrd, Jescie I.','91544','eu.neque@velit.org',5),('16401004-2606',1622052353199,'16870819-1674',12475,'Murphy','IVT63VBL4TB','Barrett, Tatyana K.','25348','iaculis.aliquet@Phasellus.co.uk',8),('16420114-6679',1650020576099,'16590123-2784',12475,'Gary','IAP10OWB0XH','Mccray, Cruz F.','71560','Donec.nibh@massaInteger.ca',7),('16420524-9701',1629112755299,'16400701-1341',12475,'Nathaniel','TLA70OYK4XX','Sherman, Tatiana C.','49085','tincidunt@sitamet.net',5),('16430904-7357',1693081134699,'16440613-6228',12475,'Fredericka','OPV98XYQ6MD','Pugh, Kaye E.','95318','Curabitur.sed@neque.org',8),('16431025-1907',1632070530899,'16541018-9210',12475,'Jena','XPM95OGZ5PZ','Harrington, Wendy W.','95041','pellentesque.tellus@nisimagna.co.uk',7),('16431106-4499',1679041406299,'16411206-0688',12475,'Lila','MUX70MVD6OI','Pickett, Amela O.','73097','Quisque.nonummy@nonvestibulum.org',7),('1643316',12475,'28',0,'Macaxeira','Mauá','Ap #340-9279 Sit Av.','65011919-1','',NULL),('16450806-8378',1699081013499,'16090213-7637',12475,'Walker','GJK74FDX8FF','Key, Kendall P.','94671','cubilia.Curae.Donec@Fuscemi.net',8),('16460409-9996',1667032802499,'16420524-9701',12475,'Melvin','WUZ23SGO0DS','Gray, Kimberley U.','15716','pede.Nunc.sed@sociisnatoque.net',4),('16470418-0969',1642081381199,'16050614-0847',12475,'Kylan','YKQ48RVO9UR','Cox, Jolene V.','8922','sed@malesuadaut.net',6),('16471122-0477',1648072921699,'16720304-4511',12475,'Leandra','KNJ47AXJ7UA','Benton, Kim T.','37060','egestas@etrisusQuisque.edu',4),('16520407-1269',1605042186199,'16030910-9072',12475,'Blaze','HDN61IUA2HC','Cochran, Anthony J.','19516','fermentum.arcu@tempor.ca',7),('16520828-9669',1612101558799,'16230315-7834',12475,'Vaughan','SRV78ICF8CF','Barrera, Robin Y.','99496','semper@nisi.net',4),('16540825-5676',1616041959899,'16320718-5954',12475,'Patience','AKO81POR8BA','Rodriguez, Noel S.','85231','sollicitudin.orci@ipsumCurabitur.com',8),('16540913-4979',1677090635999,'16250701-9327',12475,'Shafira','TXZ66HXJ9HP','Berger, Keith Y.','15096','purus.in@pedeCrasvulputate.org',6),('16540921-5414',1647071014299,'16510809-6214',12475,'Inez','SRI93NFR8GF','Calhoun, Winifred Q.','16216','ac@ut.edu',8),('16541018-9210',1687072218899,'16541018-9210',12475,'Zephania','AKM93LTU7IV','Rodriquez, Trevor T.','90141','ultricies.ornare.elit@lorem.co.uk',4),('16541210-8838',1678021191199,'16300408-4459',12475,'Sydnee','ZPJ10FLA8GR','Black, Nathan F.','29116','feugiat.metus.sit@cursusdiam.net',8),('16551208-4210',1693060677899,'16690628-2840',12475,'Ferris','TKN33GPH7NC','Meyers, Leslie Y.','71741','dis.parturient@ridiculus.edu',7),('16560728-3453',1652092124299,'16190205-5993',12475,'Gray','AZW87RMJ2XI','Schmidt, Tatum S.','83632','auctor@elitsedconsequat.edu',8),('16570703-3089',1616021083799,'16640827-4048',12475,'Clayton','CFW24TDD2YG','Beard, Nolan P.','60784','id.risus@odioNam.org',4),('16580316-5397',1637120394599,'16290530-7324',12475,'Tashya','WMT93XQG2XP','Lucas, Skyler W.','71179','velit.dui@Quisque.edu',5),('16611126-9871',1635050338799,'16640625-4364',12475,'Sawyer','ZJI49VMQ2AJ','Holder, Kirsten P.','10006','pretium.aliquet@semmollisdui.com',4),('16620828-2506',1655081023199,'16050614-0847',12475,'Rashad','TKM55KIH2YZ','Roach, Simon Q.','29127','risus@id.co.uk',8),('16630122-0809',1621071358699,'16090408-1312',12475,'Ayanna','GVP81ZHL5NJ','Cole, Thomas W.','35310','adipiscing@consequatnec.edu',7),('16640202-3979',1656120962999,'16600309-6481',12475,'Erica','TPD74MXO0GM','Elliott, Amery J.','22178','et.malesuada@eu.com',5),('16660118-2287',1655081780799,'16380413-8695',12475,'Paloma','AYI91THE6LI','Alston, Natalie A.','82743','Vivamus.nibh@auctornon.co.uk',5),('16670110-4827',1630032955499,'16970103-8979',12475,'Yardley','HXE09KOC9WP','Harrison, Aretha G.','35667','pretium.et.rutrum@laciniaorci.org',5),('16670207-7436',1613100281399,'16890120-5222',12475,'Cairo','DFN31QKP0AE','Davenport, September H.','43620','amet@aliquetPhasellus.edu',5),('16670624-1319',1605112197999,'16130612-6481',12475,'Hiram','GCW60QPV6LG','Cain, Lysandra F.','9221','sed.libero@non.edu',8),('16680821-1582',1682040296499,'16311011-7508',12475,'Dillon','PSL43TWJ3QS','Mann, Finn M.','62213','enim@nibhPhasellus.com',8),('16690814-5664',1630110856699,'16890303-9991',12475,'Lysandra','MZK55VYQ4AP','Woodard, Noble T.','66176','consequat.nec@velpedeblandit.org',7),('16691205-9026',1680111890199,'16840304-2495',12475,'Florence','JEJ17IAM3UG','Rasmussen, Kitra Z.','11336','elit.Aliquam.auctor@Sedeunibh.edu',8),('16720811-5514',1633041957499,'16180510-5747',12475,'Connor','DEE76LZQ5JA','York, Daria N.','99116','iaculis@Maurismagna.org',6),('16761219-3305',1665111536899,'16180501-1929',12475,'Gage','NFB32MLA3VQ','Wilkinson, Winifred U.','67098','Donec.fringilla.Donec@odioauctorvitae.net',4),('16790116-5014',1600070488499,'16960307-8438',12475,'Ezekiel','FZJ55CMD4CJ','Potter, William G.','20404','in.faucibus@nequeInornare.ca',8),('16790328-1157',1603052335099,'16111212-1346',12475,'Graiden','UYS31QTQ0HY','Hartman, Clio V.','9268','nec.eleifend.non@posuere.net',6),('16800117-8956',1635070507299,'16290316-2416',12475,'Kevin','DRV36QIU7MH','Pugh, Dustin W.','60242','lacus.Quisque.imperdiet@nec.co.uk',8),('16801008-8394',1616051051199,'16511023-5750',12475,'Cadman','YNF20FMA2MX','Rowland, Ray V.','74996','turpis.In@metusInlorem.com',7),('16801120-0303',1698102991899,'16070426-8135',12475,'Erin','VZH93UEQ3RR','Berger, Abraham B.','2846','quis@senectuset.net',6),('16810925-9369',1692100246599,'16050614-0847',12475,'Raymond','VZJ23KWT2QU','Mayer, Laura S.','58712','iaculis.nec@magnaaneque.net',7),('16820329-4270',1695101661199,'16870301-8039',12475,'Larissa','ZUT03NME9WR','Gonzalez, Kylan A.','455','ligula@nuncsedpede.edu',8),('16821219-8389',1601060800899,'16621006-6053',12475,'Linda','CCO68BXK9CL','Wolf, Daryl I.','78114','dapibus.quam.quis@eliteratvitae.com',7),('16840819-4846',1691072733799,'16431025-1907',12475,'Maggy','RPR58YMU1CU','Acevedo, Honorato D.','74899','dolor.vitae@aultriciesadipiscing.ca',8),('16840826-7626',1680081230999,'16360501-4236',12475,'Callie','GYL77FSH9RM','Lott, Ulric J.','28323','feugiat@ideratEtiam.org',7),('16850522-0742',1623020792899,'16590326-3712',12475,'Steven','IWJ12AMO4KI','Figueroa, Quinlan P.','96145','et.risus.Quisque@aliquetodioEtiam.edu',4),('16860906-5845',1696010922099,'16860908-3277',12475,'Alec','ZFF11MBR2EG','Bowers, Baker K.','73244','dolor.Donec@Suspendissealiquetmolestie.net',7),('16861122-6740',1605061319899,'16650812-5116',12475,'Hammett','AUV79BER8TZ','Rivera, Donovan C.','98979','elementum.lorem.ut@nonquam.edu',6),('16880118-5011',1689113031599,'16980113-4223',12475,'Quon','KXN97JUA6FC','Head, Allistair V.','38317','risus.Nunc.ac@quislectusNullam.com',8),('16880403-0487',1611092155899,'16150119-2247',12475,'Caleb','KCB36HHW1VE','House, Halee I.','36024','Sed@urnaet.org',4),('16890508-0845',1683032210199,'16590615-9537',12475,'Finn','NAR98RYZ1VQ','Santiago, Dahlia K.','39094','Nunc@non.edu',4),('16900925-2140',1670010883499,'16500211-6613',12475,'Keane','HXA88PME2LO','Francis, Carson X.','53148','mauris.sagittis@ante.ca',6),('16901030-6257',1676042382399,'16590811-5404',12475,'Hayfa','SVV66PLM3TZ','Hester, Vladimir X.','79744','senectus.et@orciDonec.org',8),('16910605-0066',1672092410199,'16621023-9080',12475,'Autumn','GTR43DIR2KP','Hester, Zeus F.','61253','eu.nibh@inmagna.org',7),('16920325-6087',1699010711699,'16591228-9104',12475,'Orson','CKQ21MUQ2ET','Moore, Cameron O.','57888','porttitor.interdum@euodiotristique.edu',7),('16920402-7321',1668123093699,'16131229-9231',12475,'Justin','USY70XOK3UQ','Perry, Rashad M.','53269','lacinia@nisl.ca',4),('16931209-1540',1682041171599,'16960321-0916',12475,'Fuller','EKE42PWS8PS','Sparks, Lionel U.','55130','Etiam@consectetueradipiscingelit.co.uk',7),('16951018-2794',1682102915899,'16090314-3717',12475,'Rama','QKK97JYM4YV','Bond, Laith Y.','54771','est.tempor@nasceturridiculus.ca',4),('16970509-6916',1612030302299,'16560618-2136',12475,'Kylynn','AIJ70JDV9CE','Solis, Adara H.','95613','ipsum@vitae.ca',6),('16980113-0031',1650091530699,'16540528-5205',12475,'Alexander','CBQ27LXF6DL','Fernandez, Stone H.','61552','molestie.orci.tincidunt@tortornibh.edu',4),('16990122-0179',1686112609499,'16900411-7256',12475,'Garth','DSH12ZSY9ST','Barton, Clarke G.','11757','Vestibulum.accumsan@Nuncullamcorper.net',6),('16990402-9510',1683032984299,'16800428-1989',12475,'Adele','TLE91QDY7EI','Mathis, Alexandra L.','97881','et.commodo@egetmetusIn.net',5),('2027527',12475,'181',0,'Parnamirim','Juazeiro','Ap #982-8622 Dolor. Av.','29348627-1','',NULL),('2078045',12475,'174',0,'Caxangá','Itajaí','991-6916 Vehicula Road','29843224-8','',NULL),('2080271',12475,'245',0,'Casa Amarela','Luziânia','P.O. Box 322, 7039 Interdum. A','36888399-4','',NULL),('2106184',12475,'276',0,'Parnamirim','Duque de Caxias','4261 Adipiscing Road','20576339-2','',NULL),('2136253',12475,'236',0,'Macaxeira','Colombo','Ap #596-4347 Nunc. Ave','98633796-6','',NULL),('2163771',12475,'267',0,'Caxangá','Patos','756-2838 Et Ave','63330848-9','',NULL),('2274229',12475,'3',0,'Parnamirim','Guarulhos','P.O. Box 549, 6333 Dolor. St.','98573882-5','',NULL),('2300789',12475,'99',0,'Boa Vista','Ribeirão Preto','Ap #581-7804 Vulputate, Street','71999516-1','',NULL),('2373436',12475,'193',0,'Casa Amarela','Campinas','5585 Ultrices. Av.','97350048-1','',NULL),('2409881',12475,'181',0,'Aurora','Piracicaba','Ap #551-5051 Lorem, Avenue','52330812-9','',NULL),('2441669',12475,'190',0,'Rio Doce','Gravataí','Ap #464-8330 Auctor Street','42444444-1','',NULL),('2477237',12475,'262',0,'Aurora','Montes Claros','1412 Arcu. Rd.','73703523-0','',NULL),('2656286',12475,'50',0,'Parnamirim','Jundiaí','Ap #522-4431 Integer Ave','13730560-5','',NULL),('2661822',12475,'235',0,'Cais do Porto','Feira de Santan','P.O. Box 111, 3776 Lorem. Stre','57429069-6','',NULL),('2666552',12475,'89',0,'Parnamirim','Mauá','Ap #625-2447 Nulla Road','81390495-5','',NULL),('2702375',12475,'189',0,'Macaxeira','São Gonçalo','8140 Donec St.','37030594-9','',NULL),('2862075',12475,'280',0,'Rio Doce','São Gonçalo','9828 Quis, St.','28988675-7','',NULL),('3028285',12475,'119',0,'Aurora','Itajaí','918-7825 Leo. Rd.','01738561-1','',NULL),('3031042',12475,'228',0,'Casa Amarela','Campos dos Goyt','Ap #515-6092 At Road','44842166-1','',NULL),('3127722',12475,'4',0,'Jardim São Paul','Imperatriz','P.O. Box 825, 2056 Sollicitudi','59795785-6','',NULL),('3133645',12475,'162',0,'Cais do Porto','Uberlândia','Ap #204-4948 A, Av.','62277328-0','',NULL),('3411536',12475,'126',0,'Cais do Porto','Piracicaba','1054 Vitae Av.','69526584-2','',NULL),('3520725',12475,'53',0,'Usina Amaral','Duque de Caxias','7696 Varius Rd.','12414490-8','',NULL),('3575136',12475,'153',0,'Ipsep','Mauá','593-5534 Mi St.','84199042-1','',NULL),('3581585',12475,'184',0,'Usina Amaral','Belford Roxo','P.O. Box 545, 8811 Arcu St.','08651051-3','',NULL),('3734314',12475,'117',0,'Imbireibeira','Petrópolis','223-5549 Sociis Ave','87153081-5','',NULL),('3750335',12475,'101',0,'Usina Amaral','Niterói','227-1499 Turpis Avenue','75251967-7','',NULL),('3898206',12475,'209',0,'Imbireibeira','Bacabal','6309 Ante Av.','68595634-2','',NULL),('3996192',12475,'259',0,'Imbireibeira','Rio de Janeiro','4169 Duis St.','87817385-8','',NULL),('4262609',12475,'132',0,'Macaxeira','Campinas','2242 Nunc Ave','52255641-8','',NULL),('4284413',12475,'4',0,'Ipsep','Uberaba','Ap #967-4668 Eu Avenue','93689115-1','',NULL),('4360015',12475,'48',0,'Parnamirim','Santa Rita','Ap #993-4242 Sem, Av.','48874548-6','',NULL),('4490355',12475,'253',0,'Xexéu','Campos dos Goyt','Ap #892-2783 A Road','29097930-9','',NULL),('4531717',12475,'228',0,'Rio Doce','Ribeirão Preto','P.O. Box 635, 3089 Quis Road','36128357-0','',NULL),('4547207',12475,'243',0,'Cais do Porto','Campina Grande','Ap #420-3767 Nisl Road','30114376-1','',NULL),('4602742',12475,'140',0,'Macaxeira','Cascavel','Ap #775-3979 Quis Avenue','06398526-4','',NULL),('4628344',12475,'193',0,'Madalena','Bragança','Ap #715-5910 Ligula St.','91157631-7','',NULL),('4639892',12475,'219',0,'Caxangá','Chapecó','307-8659 Lectus St.','35284394-6','',NULL),('4703241',12475,'48',0,'Ipsep','Osasco','P.O. Box 931, 5383 Sit Rd.','34246003-4','',NULL),('4737125',12475,'250',0,'Cais do Porto','Guarulhos','P.O. Box 427, 7209 Vitae Stree','42866684-6','',NULL),('4817994',12475,'151',0,'Imbireibeira','Caruaru','Ap #843-8926 Tristique Road','51624288-3','',NULL),('4868391',12475,'85',0,'Boa Vista','Mauá','444-5490 Nascetur Rd.','91486647-0','',NULL),('4937880',12475,'199',0,'Dois Irmãos','Santa Inês','Ap #403-5190 Maecenas Road','45486430-4','',NULL),('5080870',12475,'224',0,'Brasilit','Piracicaba','Ap #677-9361 Sed Rd.','17389849-2','',NULL),('5166473',12475,'225',0,'Torreão','Joinville','963-1933 Suspendisse Av.','26373848-6','',NULL),('5172356',12475,'142',0,'Cais do Porto','Colombo','601-8053 Turpis. Road','25195618-0','',NULL),('5257712',12475,'2',0,'Boa Vista','Santa Maria','Ap #570-995 Bibendum. Ave','93889844-5','',NULL),('5326074',12475,'207',0,'Caxangá','São José dos Pi','6390 Mattis. Rd.','23797287-8','',NULL),('5354016',12475,'52',0,'Cais do Porto','Pelotas','5658 Pellentesque St.','46372726-6','',NULL),('5382740',12475,'287',0,'Rio Doce','Belford Roxo','360-979 Imperdiet St.','64816267-3','',NULL),('5442986',12475,'49',0,'Boa Vista','Uberlândia','P.O. Box 586, 7151 A Rd.','87784114-7','',NULL),('5669782',12475,'285',0,'Jardim São Paul','Nova Iguaçu','Ap #611-7042 Imperdiet Avenue','74906238-3','',NULL),('5788520',12475,'298',0,'Caxangá','São Luís','717-8142 Id Ave','42761316-2','',NULL),('6322733',12475,'290',0,'Aurora','Parauapebas','P.O. Box 267, 234 Elit Rd.','73459319-3','',NULL),('6394061',12475,'41',0,'Caxangá','Governador Vala','9429 Class St.','98920689-8','',NULL),('6489450',12475,'284',0,'Brasilit','Santarém','570-8962 Phasellus Av.','61067298-1','',NULL),('6519462',12475,'31',0,'Casa Amarela','Paulista','Ap #197-4175 Velit. Rd.','79734184-0','',NULL),('6588477',12475,'139',0,'Cais do Porto','Maracanaú','692-4108 Est, Rd.','51904181-3','',NULL),('6692744',12475,'265',0,'Rio Doce','Itabuna','5218 Odio. Road','52021123-5','',NULL),('6786680',12475,'53',0,'Rio Doce','Camaragibe','9155 Suspendisse St.','01974902-4','',NULL),('6823876',12475,'266',0,'Parnamirim','Carapicuíba','607-6823 Ultrices. Street','61055853-3','',NULL),('6824705',12475,'154',0,'Casa Amarela','Guarulhos','9598 Sed Street','29819645-7','',NULL),('6845627',12475,'240',0,'Casa Amarela','Joinville','P.O. Box 990, 9774 Velit. St.','39862528-2','',NULL),('6855655',12475,'274',0,'Jardim São Paul','Juazeiro do Nor','Ap #919-1534 Dui Street','27602638-8','',NULL),('6964209',12475,'39',0,'Xexéu','Ananindeua','1566 Justo St.','88789691-5','',NULL),('6987890',12475,'130',0,'Ipsep','Abaetetuba','P.O. Box 717, 5696 Sit Road','57130324-4','',NULL),('6997264',12475,'211',0,'Cais do Porto','Duque de Caxias','4904 Arcu Rd.','44953267-7','',NULL),('7086195',12475,'181',0,'Brasilit','Nova Iguaçu','491-6353 Pharetra, St.','80741446-9','',NULL),('7121578',12475,'183',0,'Aurora','Duque de Caxias','119-4899 Aliquet St.','33515765-1','',NULL),('7135438',12475,'271',0,'Macaxeira','Sobral','P.O. Box 884, 6890 Rutrum Road','93730228-8','',NULL),('7176137',12475,'222',0,'Macaxeira','Carapicuíba','Ap #199-9749 Tortor Street','04802527-2','',NULL),('7272061',12475,'54',0,'Usina Amaral','Sousa','5642 Sodales Rd.','70025751-9','',NULL),('7524872',12475,'252',0,'Imbireibeira','Chapadinha','1829 Curabitur Av.','59828444-9','',NULL),('7568914',12475,'14',0,'Madalena','Castanhal','P.O. Box 617, 5571 Sodales Rd.','35222070-6','',NULL),('7596005',12475,'158',0,'Torreão','Aparecida de Go','P.O. Box 384, 1979 Enim St.','74593594-7','',NULL),('7756484',12475,'246',0,'Torreão','Maringá','426-3292 Quam Street','92183543-3','',NULL),('7773133',12475,'251',0,'Rio Doce','Gravataí','Ap #658-7990 Donec Street','80776938-5','',NULL),('8082868',12475,'221',0,'Aurora','Petrópolis','P.O. Box 673, 1378 Ac Road','88049455-8','',NULL),('8134049',12475,'129',0,'Macaxeira','Chapecó','P.O. Box 602, 7900 Elit, Ave','14956333-5','',NULL),('8297597',12475,'106',0,'Mustardinha','Mauá','P.O. Box 814, 6919 Proin St.','18671728-0','',NULL),('8323146',12475,'196',0,'Parnamirim','Mogi das Cruzes','P.O. Box 901, 4776 Mollis Rd.','97370425-2','',NULL),('8412929',12475,'256',0,'Parnamirim','Feira de Santan','P.O. Box 333, 5128 Orci. Rd.','20807990-6','',NULL),('8517620',12475,'103',0,'Brasilit','Ribeirão das Ne','1062 Risus. Ave','05982579-5','',NULL),('8703196',12475,'188',0,'Parnamirim','Rio Verde','P.O. Box 618, 7009 Bibendum Av','72158514-5','',NULL),('8732101',12475,'204',0,'Jardim São Paul','Caruaru','Ap #970-116 Non St.','33475142-2','',NULL),('8748206',12475,'136',0,'Rio Doce','Carapicuíba','P.O. Box 254, 4921 Vulputate, ','46757253-3','',NULL),('8835402',12475,'187',0,'Macaxeira','Luziânia','397-6768 Et Street','31994095-5','',NULL),('8994162',12475,'59',0,'Mustardinha','Osasco','3608 Suspendisse Ave','71116480-4','',NULL),('9282263',12475,'190',0,'Mustardinha','Jundiaí','1336 Ut, Avenue','25856309-0','',NULL),('9288645',12475,'97',0,'Imbireibeira','Piracicaba','Ap #677-383 Nunc Rd.','37512398-6','',NULL),('9335453',12475,'22',0,'Jardim São Paul','Goiânia','P.O. Box 537, 2131 Pharetra, S','43984708-6','',NULL),('9429311',12475,'100',0,'Caxangá','Piracicaba','Ap #504-5235 Primis St.','66764345-7','',NULL),('9442762',12475,'143',0,'Brasilit','Campos dos Goyt','174-7311 Massa. St.','57268805-6','',NULL),('9508662',12475,'191',0,'Cais do Porto','Vitória da Conq','8448 Mauris Ave','66417923-9','',NULL),('9711804',12475,'243',0,'Aurora','Canoas','Ap #351-3207 Diam. Ave','86789647-8','',NULL),('9744539',12475,'102',0,'Aurora','Marabá','838-3512 Eu Road','47883478-9','',NULL),('9791287',12475,'244',0,'Cais do Porto','Sobral','772-2965 Proin Street','59188833-8','',NULL),('9931383',12475,'90',0,'Caxangá','Sobral','Ap #368-1117 Enim, Ave','16069966-7','',NULL),('9944572',12475,'182',0,'Caxangá','Canoas','P.O. Box 383, 1251 Nibh Av.','55347899-6','',NULL),('COD_Unid_Supo',0,'Nro_Funcionar',0,'nome','matriz','endereço','fone\r','',NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impressora`
--

DROP TABLE IF EXISTS `impressora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impressora` (
  `Cod_Equip` varchar(8) NOT NULL DEFAULT '',
  `modelo` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Equip`),
  CONSTRAINT `impressora_equip_fk` FOREIGN KEY (`Cod_Equip`) REFERENCES `equipamento` (`Cod_Equipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impressora`
--

LOCK TABLES `impressora` WRITE;
/*!40000 ALTER TABLE `impressora` DISABLE KEYS */;
/*!40000 ALTER TABLE `impressora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `Cod_Insumo` varchar(15) NOT NULL,
  `Cod_categoria_insumo` varchar(15) NOT NULL,
  `Descric` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Insumo`,`Cod_categoria_insumo`),
  KEY `fk_insumo_categoria1_idx` (`Cod_categoria_insumo`),
  CONSTRAINT `fk_insumo_categoria1` FOREIGN KEY (`Cod_categoria_insumo`) REFERENCES `categoria` (`Cod_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_usado_servico`
--

DROP TABLE IF EXISTS `insumo_usado_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo_usado_servico` (
  `COD_servico` varchar(13) NOT NULL,
  `COD_Insumo` varchar(15) NOT NULL,
  `qtd` int(11) NOT NULL,
  PRIMARY KEY (`COD_servico`,`COD_Insumo`),
  KEY `fk_servico_has_insumo_insumo1_idx` (`COD_Insumo`),
  KEY `fk_servico_has_insumo_servico1_idx` (`COD_servico`),
  CONSTRAINT `fk_servico_has_insumo_insumo1` FOREIGN KEY (`COD_Insumo`) REFERENCES `insumo` (`Cod_Insumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_has_insumo_servico1` FOREIGN KEY (`COD_servico`) REFERENCES `servico` (`COD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_usado_servico`
--

LOCK TABLES `insumo_usado_servico` WRITE;
/*!40000 ALTER TABLE `insumo_usado_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo_usado_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_estoque`
--

DROP TABLE IF EXISTS `item_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_estoque` (
  `Sequencial_insumo` varchar(16) NOT NULL,
  `Cod_insumo` varchar(15) NOT NULL,
  `Data_entrada` date NOT NULL,
  `Data_final` date NOT NULL,
  `Data_validade` date NOT NULL,
  `Preco_compra` varchar(14) NOT NULL,
  `Qtd_minima` int(11) NOT NULL,
  `Qtd_atual` int(11) NOT NULL,
  `Cod_Estante` int(11) NOT NULL,
  `ID_Almoxarif` varchar(14) NOT NULL,
  PRIMARY KEY (`Cod_insumo`,`Sequencial_insumo`),
  KEY `item_estoq_almoxarif_fk` (`ID_Almoxarif`),
  KEY `item_estoq_estante_fk` (`Cod_Estante`),
  CONSTRAINT `insumo_fk` FOREIGN KEY (`Cod_insumo`) REFERENCES `insumo` (`Cod_Insumo`),
  CONSTRAINT `item_estoq_almoxarif_fk` FOREIGN KEY (`ID_Almoxarif`) REFERENCES `almoxarifado` (`ID`),
  CONSTRAINT `item_estoq_estante_fk` FOREIGN KEY (`Cod_Estante`) REFERENCES `estante` (`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_estoque`
--

LOCK TABLES `item_estoque` WRITE;
/*!40000 ALTER TABLE `item_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada_trabalho`
--

DROP TABLE IF EXISTS `jornada_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornada_trabalho` (
  `ID` varchar(8) NOT NULL DEFAULT '',
  `funcionario_matricula` varchar(10) NOT NULL,
  `Horario_Inicio` int(11) NOT NULL,
  `Horario_Fim` int(11) NOT NULL,
  `Trabalha_Sabado` tinyint(1) NOT NULL,
  `Descricao` varchar(60) DEFAULT NULL,
  `jornada_trabalhocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`funcionario_matricula`)
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
-- Table structure for table `kpi`
--

DROP TABLE IF EXISTS `kpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpi` (
  `tecnico_matricula` varchar(10) NOT NULL,
  `Sequencial` int(11) NOT NULL DEFAULT '0',
  `Kpi_1` varchar(30) DEFAULT NULL,
  `Kpi_2` varchar(30) DEFAULT NULL,
  `Dsc_kpi_1` varchar(100) DEFAULT NULL,
  `Dsc_kpi_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tecnico_matricula`,`Sequencial`),
  KEY `fk_kpi_tecnico1_idx` (`tecnico_matricula`),
  CONSTRAINT `fk_kpi_tecnico1` FOREIGN KEY (`tecnico_matricula`) REFERENCES `tecnico` (`funcionario_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpi`
--

LOCK TABLES `kpi` WRITE;
/*!40000 ALTER TABLE `kpi` DISABLE KEYS */;
/*!40000 ALTER TABLE `kpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizacao` (
  `CNPJ` varchar(18) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `end` varchar(45) NOT NULL,
  PRIMARY KEY (`CNPJ`),
  CONSTRAINT `fk_Localizacao_unidade_de_suporte` FOREIGN KEY (`CNPJ`) REFERENCES `unidade_de_suporte` (`CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao`
--

LOCK TABLES `localizacao` WRITE;
/*!40000 ALTER TABLE `localizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nobreak`
--

DROP TABLE IF EXISTS `nobreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nobreak` (
  `Cod_Equip` varchar(8) NOT NULL DEFAULT '',
  `modelo` varchar(20) NOT NULL,
  `kva` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Equip`),
  CONSTRAINT `nobreak_equip_fk` FOREIGN KEY (`Cod_Equip`) REFERENCES `equipamento` (`Cod_Equipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nobreak`
--

LOCK TABLES `nobreak` WRITE;
/*!40000 ALTER TABLE `nobreak` DISABLE KEYS */;
/*!40000 ALTER TABLE `nobreak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orcamento` (
  `CodOrcamento` varchar(10) NOT NULL DEFAULT '',
  `DescOrcamento` varchar(50) NOT NULL,
  `DtAbert_Orcto` date NOT NULL,
  `DtEmissao_Orcto` date NOT NULL,
  `ValidadeEmDias_Orcto` date NOT NULL,
  `UltimaData_Orcto` date NOT NULL,
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
  `chamado_No_Seq` int(11) NOT NULL,
  `orcamento_CodOrcamento` varchar(10) NOT NULL,
  `Status_OS` varchar(20) NOT NULL,
  `DataCricao_OS` date NOT NULL,
  `Prazo_EmDias_OS` smallint(6) NOT NULL,
  `DtDevida` tinyint(1) NOT NULL,
  PRIMARY KEY (`Num_OS`,`chamado_No_Seq`,`orcamento_CodOrcamento`),
  KEY `fk_ordem_de_servico_chamado1_idx` (`chamado_No_Seq`),
  KEY `fk_ordem_de_servico_orcamento1_idx` (`orcamento_CodOrcamento`),
  CONSTRAINT `fk_ordem_de_servico_chamado1` FOREIGN KEY (`chamado_No_Seq`) REFERENCES `chamado` (`No_Seq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_de_servico_orcamento1` FOREIGN KEY (`orcamento_CodOrcamento`) REFERENCES `orcamento` (`CodOrcamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `parcela_pagamento`
--

DROP TABLE IF EXISTS `parcela_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcela_pagamento` (
  `Seq` int(11) NOT NULL DEFAULT '0',
  `fatura_COD` varchar(10) NOT NULL,
  `Dta_Pagto` date NOT NULL,
  `Dta_Parcela` date NOT NULL,
  `vl_pag_parcela` double NOT NULL,
  `vl_total` double NOT NULL,
  `juros` float NOT NULL,
  PRIMARY KEY (`Seq`,`fatura_COD`),
  KEY `fk_parcela_pagamento_fatura1_idx` (`fatura_COD`),
  CONSTRAINT `fk_parcela_pagamento_fatura1` FOREIGN KEY (`fatura_COD`) REFERENCES `fatura` (`COD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela_pagamento`
--

LOCK TABLES `parcela_pagamento` WRITE;
/*!40000 ALTER TABLE `parcela_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcela_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `COD` varchar(13) NOT NULL DEFAULT '',
  `COD_Tipo_Servico` varchar(15) NOT NULL,
  `Num_OS` varchar(10) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Valor` int(11) NOT NULL,
  PRIMARY KEY (`COD`,`Num_OS`,`COD_Tipo_Servico`),
  KEY `fk_servico_ordem_de_servico1_idx` (`Num_OS`),
  KEY `fk_servico_tipo_servico1_idx` (`COD_Tipo_Servico`),
  CONSTRAINT `fk_servico_ordem_de_servico1` FOREIGN KEY (`Num_OS`) REFERENCES `ordem_de_servico` (`Num_OS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_tipo_servico1` FOREIGN KEY (`COD_Tipo_Servico`) REFERENCES `tipo_servico` (`Cod_tipo_servico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisiona`
--

DROP TABLE IF EXISTS `supervisiona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisiona` (
  `Matricula_supervisor` varchar(10) NOT NULL DEFAULT '',
  `Data_inicio` date NOT NULL,
  PRIMARY KEY (`Matricula_supervisor`),
  CONSTRAINT `fk_supervisiona_supervisor` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisor` (`Matricula_supervisor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisiona`
--

LOCK TABLES `supervisiona` WRITE;
/*!40000 ALTER TABLE `supervisiona` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisiona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor` (
  `Matricula_supervisor` varchar(10) NOT NULL,
  PRIMARY KEY (`Matricula_supervisor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES ('16020110-0'),('16020909-9'),('16030723-1'),('16030910-9'),('16031120-9'),('16040225-2'),('16040324-6'),('16050614-0'),('16080614-7'),('16080618-4'),('16110117-3'),('16110128-8'),('16120208-1'),('16121128-4'),('16130703-6'),('16131212-4'),('16141013-5'),('16150120-7'),('16150912-1'),('16180902-6'),('16190315-6'),('16220620-5'),('16220702-1'),('16220726-8'),('16230222-8'),('16260101-7'),('16270626-2'),('16270707-0'),('16270710-5'),('16290215-5'),('16340225-7'),('16340907-9'),('16350815-4'),('16370607-1'),('16380717-0'),('16380819-6'),('16390711-9'),('16400314-5'),('16400318-2'),('16401004-2'),('16420114-6'),('16420524-9'),('16430904-7'),('16431025-1'),('16431106-4'),('16450806-8'),('16460409-9'),('16470418-0'),('16471122-0'),('16520407-1'),('16520828-9'),('16540825-5'),('16540913-4'),('16540921-5'),('16541018-9'),('16541210-8'),('16551208-4'),('16560728-3'),('16570703-3'),('16580316-5'),('16611126-9'),('16620828-2'),('16630122-0'),('16640202-3'),('16660118-2'),('16670110-4'),('16670207-7'),('16670624-1'),('16680821-1'),('16690814-5'),('16691205-9'),('16720811-5'),('16761219-3'),('16790116-5'),('16790328-1'),('16800117-8'),('16801008-8'),('16801120-0'),('16810925-9'),('16820329-4'),('16821219-8'),('16840819-4'),('16840826-7'),('16850522-0'),('16860906-5'),('16861122-6'),('16880118-5'),('16880403-0'),('16890508-0'),('16900925-2'),('16901030-6'),('16910605-0'),('16920325-6'),('16920402-7'),('16931209-1'),('16951018-2'),('16970509-6'),('16980113-0'),('16990122-0'),('16990402-9');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico` (
  `funcionario_matricula` varchar(10) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_campo`
--

DROP TABLE IF EXISTS `tecnico_campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico_campo` (
  `matricula` varchar(10) NOT NULL,
  `tel_movel` varchar(14) NOT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `fk_tecnico_campo_tecnico1` FOREIGN KEY (`matricula`) REFERENCES `tecnico` (`funcionario_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_campo`
--

LOCK TABLES `tecnico_campo` WRITE;
/*!40000 ALTER TABLE `tecnico_campo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico_campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_interno`
--

DROP TABLE IF EXISTS `tecnico_interno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico_interno` (
  `funcionario_matricula` varchar(10) NOT NULL,
  `Grau_tecnico` varchar(30) NOT NULL,
  `Ramal` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_tecnico_interno_tecnico1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `tecnico` (`funcionario_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_interno`
--

LOCK TABLES `tecnico_interno` WRITE;
/*!40000 ALTER TABLE `tecnico_interno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico_interno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contrato` (
  `ID_Tipo_Contrato` varchar(5) NOT NULL,
  `Descric` varchar(30) NOT NULL,
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
-- Table structure for table `tipo_despesa`
--

DROP TABLE IF EXISTS `tipo_despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_despesa` (
  `ID` int(11) NOT NULL,
  `dsc` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_despesa`
--

LOCK TABLES `tipo_despesa` WRITE;
/*!40000 ALTER TABLE `tipo_despesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servico`
--

DROP TABLE IF EXISTS `tipo_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servico` (
  `Cod_tipo_servico` varchar(15) NOT NULL DEFAULT '',
  `Descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_tipo_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servico`
--

LOCK TABLES `tipo_servico` WRITE;
/*!40000 ALTER TABLE `tipo_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_de_suporte`
--

DROP TABLE IF EXISTS `unidade_de_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_de_suporte` (
  `COD_Unid_Suporte` varchar(15) NOT NULL,
  `CNPJ` varchar(18) NOT NULL,
  `Nro_Funcionarios` int(11) NOT NULL,
  `Estado` varchar(35) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `matriz` varchar(20) NOT NULL,
  `endereço` varchar(50) NOT NULL,
  `fone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`,`COD_Unid_Suporte`),
  KEY `fk_unid_suporte_funcionario_fk` (`CNPJ`),
  KEY `fk_unidade_de_suporte_empresa1_idx` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_de_suporte`
--

LOCK TABLES `unidade_de_suporte` WRITE;
/*!40000 ALTER TABLE `unidade_de_suporte` DISABLE KEYS */;
INSERT INTO `unidade_de_suporte` VALUES ('1375488','12.475.369/1254-05',88,'BA','Aurora','Dominic','7925 Sed St.','12355290-5923\r'),('1375499','12.475.369/1254-05',209,'Ceara','Eros LLP','Slade','P.O. Box 267, 8236 Ac Avenue','34759192-3965\r'),('8732101','12.475.369/1254-05',204,'Pernambuco','Jardim Sao Paulo','Caruaru','Ap #970-116 Non St.','33475142-2859\r'),('1375494','12.475.369/1254-06',156,'Bahia','Egestas Nunc Consulting','Madeline','P.O. Box 399, 3876 Nisi. St.','34667568-6866\r'),('1375495','12.475.369/1254-06',26,'PA','Mattis Cras Eget Inc.','Keiko','P.O. Box 432, 2843 Donec Road','78755329-9199\r'),('1375499','12.475.369/1254-06',36,'SP','Natoque Penatibus Et Industries','Chancellor','607-8074 Justo Rd.','98595182-2032\r'),('1375500','12.475.369/1254-06',197,'SC','Mollis Integer Corp.','Zelda','P.O. Box 892, 5869 Odio Rd.','90314700-6422\r'),('1375489','12.475.369/1254-07',198,'Sao Paulo','Non Enim Incorporated','Elaine','457-2234 Eget, Rd.','59010869-3676\r'),('1375493','12.475.369/1254-07',84,'Minas Gerais','Felis Corp.','Carl','P.O. Box 952, 6738 Arcu. Avenue','91694786-7278\r'),('1375490','12.475.369/1254-08',258,'Sao Paulo','Aliquet Associates','Scott','P.O. Box 562, 7942 Bibendum Avenue','54962144-7332\r'),('1375496','12.475.369/1254-08',61,'GO','Nulla Eu Foundation','Boris','P.O. Box 121, 7063 Sit Street','05975014-5694\r'),('1375491','12.475.369/1254-09',130,'Ceara','Eget Limited','Kiayada','2869 Gravida Rd.','70630423-4337\r'),('1375497','12.475.369/1254-09',5,'BA','Ultrices Ltd','Xaviera','P.O. Box 658, 1685 Non St.','65431576-2158\r'),('1375498','12.475.369/1254-09',299,'Sao Paulo','Vel Arcu Eu Corp.','Gail','764-8305 Interdum. Avenue','04575125-3732\r'),('1375492','12.475.369/1254-10',122,'Sao Paulo','Sagittis Corp.','Ifeoma','P.O. Box 644, 2552 Non, Street','01975098-3356\r');
/*!40000 ALTER TABLE `unidade_de_suporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'assistech'
--

--
-- Dumping routines for database 'assistech'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-09 19:28:19
