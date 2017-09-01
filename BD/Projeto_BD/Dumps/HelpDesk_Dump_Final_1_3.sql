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
  `Matricula_funcionario` varchar(10) NOT NULL DEFAULT '',
  `Cod_Contracheque` varchar(14) DEFAULT NULL,
  `Cod_Desp_Viag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Matricula_funcionario`),
  KEY `adm_financeiro_desp_viag_fk` (`Cod_Desp_Viag`),
  KEY `funcionario_adm_financeiro_idx_fk` (`Matricula_funcionario`),
  KEY `contracheque_admin_financeiro_fk` (`Cod_Contracheque`),
  KEY `fk_despesa_viagem_adm_financeiro1` (`Cod_Desp_Viag`),
  CONSTRAINT `adm_financeiro_desp_viag_fk` FOREIGN KEY (`Cod_Desp_Viag`) REFERENCES `despesa_viagem` (`COD`),
  CONSTRAINT `funcionario_adm_financeiro_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `Cod_cliente` int(11) DEFAULT NULL,
  `Dta_abertura` date DEFAULT NULL,
  PRIMARY KEY (`No_Seq`),
  KEY `chamado_cliente_fk` (`Cod_cliente`),
  CONSTRAINT `chamado_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
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
  `Cod` int(11) NOT NULL DEFAULT '0',
  `Prioridade` enum('Alta','Media','Baixa') NOT NULL,
  `email` varchar(45) NOT NULL,
  `fone` varchar(16) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod`)
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
  `Cod_cliente` int(11) NOT NULL DEFAULT '0',
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_cliente`),
  UNIQUE KEY `CPF` (`CPF`),
  CONSTRAINT `cliente_fis_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
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
  `Cod_cliente` int(11) NOT NULL DEFAULT '0',
  `CNPJ` varchar(14) NOT NULL,
  `Razao_Social` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_cliente`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  CONSTRAINT `cliente_jur_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
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
  `Adicional_Salario` int(9) NOT NULL DEFAULT '0',
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
  `Valor` mediumint(9) NOT NULL,
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
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('12.475.369/1254-05','SmarTECH','Rua Alberto Calado, 101.','3036-1012'),('12.475.369/1254-06','SOLCast','Rua Alberto Calado, 102.','3036-1013'),('12.475.369/1254-07','Sub11','Rua Alberto Calado, 103.','3036-1014'),('12.475.369/1254-08','ALFATecno','Rua Alberto Calado, 104.','3036-1015'),('12.475.369/1254-09','ARMAN','Rua Alberto Calado, 105.','3036-1016'),('12.475.369/1254-10','USAbit','Rua Alberto Calado, 107.','3036-1017');
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
  `Setor` varchar(30) NOT NULL,
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
  `matricula` varchar(10) NOT NULL DEFAULT '',
  `Cpf` varchar(14) NOT NULL,
  `Matricula_supervisor` varchar(10) NOT NULL,
  `unidade_de_suporte_CNPJ` varchar(18) NOT NULL,
  `Login` varchar(15) NOT NULL,
  `Senha` varchar(8) NOT NULL,
  `Nome` varchar(15) NOT NULL,
  `Cod_Contracheque` varchar(10) DEFAULT NULL,
  `Sequencial_Dependente` varchar(15) DEFAULT NULL,
  `Email` varchar(12) NOT NULL,
  `Carga_hora` int(10) DEFAULT NULL,
  PRIMARY KEY (`matricula`,`Cpf`),
  UNIQUE KEY `Matricula_UNIQUE` (`matricula`),
  KEY `fk_funcionario_unidade_de_suporte1_idx` (`unidade_de_suporte_CNPJ`),
  KEY `fk_funcionario_supervisiona1_idx` (`Matricula_supervisor`),
  KEY `fk_funcionario_unidade_de_suporte_idx` (`unidade_de_suporte_CNPJ`),
  CONSTRAINT `fk_funcionario_supervisiona1` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisiona` (`Matricula_supervisor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_unid_suporte` FOREIGN KEY (`unidade_de_suporte_CNPJ`) REFERENCES `unidade_de_suporte` (`CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `Trabalha_Sabado` varchar(5) NOT NULL,
  `Descricao` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`,`funcionario_matricula`),
  KEY `fk_jornada_trabalho_funcionario1_idx` (`funcionario_matricula`),
  CONSTRAINT `fk_jornada_trabalho_funcionario1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `unidade_de_suporte_CNPJ` varchar(18) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `end` varchar(45) NOT NULL,
  PRIMARY KEY (`unidade_de_suporte_CNPJ`),
  CONSTRAINT `fk_Localizacao_unidade_de_suporte1` FOREIGN KEY (`unidade_de_suporte_CNPJ`) REFERENCES `unidade_de_suporte` (`CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `vl_pag_parcela` float(4,2) NOT NULL,
  `vl_total` float(4,2) NOT NULL,
  `juros` float(2,2) NOT NULL,
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
  `Matricula_supervisionado` varchar(10) NOT NULL DEFAULT '',
  `Data_inicio` date NOT NULL,
  PRIMARY KEY (`Matricula_supervisor`,`Matricula_supervisionado`),
  KEY `supervisao_supervisionado_fk` (`Matricula_supervisionado`),
  CONSTRAINT `supervisao_supervisionado_fk` FOREIGN KEY (`Matricula_supervisionado`) REFERENCES `funcionario` (`matricula`),
  CONSTRAINT `supervisao_supervisor_fk` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `funcionario` (`matricula`)
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
  `funcionario_matricula` varchar(10) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_supervisor_funcionario1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
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
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_tecnico_funcionario1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `funcionario_matricula` varchar(10) NOT NULL,
  `tel_movel` varchar(14) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_tecnico_campo_tecnico1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `tecnico` (`funcionario_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `ID` varchar(7) NOT NULL,
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
  `Estado` varchar(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `matriz` varchar(20) NOT NULL,
  `endereço` varchar(50) NOT NULL,
  `fone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`,`COD_Unid_Suporte`),
  KEY `fk_unid_suporte_funcionario_fk` (`CNPJ`),
  KEY `fk_unidade_de_suporte_empresa1_idx` (`CNPJ`),
  CONSTRAINT `fk_unidade_de_suporte_empresa1` FOREIGN KEY (`CNPJ`) REFERENCES `empresa` (`CNPJ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_de_suporte`
--

LOCK TABLES `unidade_de_suporte` WRITE;
/*!40000 ALTER TABLE `unidade_de_suporte` DISABLE KEYS */;
INSERT INTO `unidade_de_suporte` VALUES ('1375488','12.475.369/1254-05',88,'BA','Pretium Et Rutrum LLC','Dominic','7925 Sed St.','12355290-5923'),('1375499','12.475.369/1254-05',209,'Ceará','Eros LLP','Slade','P.O. Box 267, 8236 Ac Avenue','34759192-3965'),('1375489','12.475.369/1254-07',198,'São Paulo','Non Enim Incorporated','Elaine','457-2234 Eget, Rd.','59010869-3676'),('1375490','12.475.369/1254-08',258,'São Paulo','Aliquet Associates','Scott','P.O. Box 562, 7942 Bibendum Avenue','54962144-7332'),('1375491','12.475.369/1254-09',130,'Ceará','Eget Limited','Kiayada','2869 Gravida Rd.','70630423-4337'),('1375492','12.475.369/1254-10',122,'São Paulo','Sagittis Corp.','Ifeoma','P.O. Box 644, 2552 Non, Street','01975098-3356');
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

-- Dump completed on 2017-08-11 21:46:08
