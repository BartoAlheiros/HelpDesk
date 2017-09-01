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
  `Cod_Desp_Viag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `adm_fincanceiro_contracheque` (`Cod_Contracheque`),
  KEY `adm_financeiro_desp_viag_fk` (`Cod_Desp_Viag`),
  CONSTRAINT `adm_financeiro_desp_viag_fk` FOREIGN KEY (`Cod_Desp_Viag`) REFERENCES `despesa_viagem` (`COD`),
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
-- Table structure for table `almoxarifado`
--

DROP TABLE IF EXISTS `almoxarifado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almoxarifado` (
  `COD_ID` varchar(14) NOT NULL,
  `Qtd_total` int(11) DEFAULT NULL,
  `Entrada_mes` date DEFAULT NULL,
  `Saida_mes` date DEFAULT NULL,
  `Descricao` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`COD_ID`)
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
  `Matricula_funcionario` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `atendente_solucionador_direcionador_funcionario_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `Cod_categoria` varchar(15) NOT NULL,
  `Descricao` varchar(12) DEFAULT NULL,
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `COD` varchar(7) NOT NULL DEFAULT '',
  `Prioridade` enum('Alta','Media','Baixa') DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `UF_Estado` varchar(2) DEFAULT NULL,
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
-- Table structure for table `cliente_contato`
--

DROP TABLE IF EXISTS `cliente_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contato` (
  `Cod_Cliente` varchar(7) NOT NULL DEFAULT '',
  `Fone` varchar(12) DEFAULT NULL,
  `Celular` varchar(13) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  CONSTRAINT `cliente_contato_cliente_fk` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contato`
--

LOCK TABLES `cliente_contato` WRITE;
/*!40000 ALTER TABLE `cliente_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_fisico`
--

DROP TABLE IF EXISTS `cliente_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_fisico` (
  `Cod_Cliente` varchar(7) NOT NULL DEFAULT '',
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
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
  `Cod_Cliente` varchar(7) NOT NULL DEFAULT '',
  `CNPJ` varchar(14) NOT NULL,
  `Razao_Social` varchar(50) DEFAULT NULL,
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
  `Sist_OP` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Equipamento`),
  CONSTRAINT `computador_equipamento_fk` FOREIGN KEY (`Cod_Equipamento`) REFERENCES `equipamento` (`Cod_Equipamento`)
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
  `Matricula_Admin_Financeiro` varchar(10) NOT NULL,
  `Mat_Funcionario` varchar(10) NOT NULL,
  `Data_Contracheque` date DEFAULT NULL,
  `Horas_extras` int(10) DEFAULT NULL,
  `Salario_Base` int(9) DEFAULT NULL,
  `Adicional_Salario` int(9) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `contracheque_admin_fincanceiro_fk_idx` (`Matricula_Admin_Financeiro`),
  KEY `contracheque_func_fk` (`Mat_Funcionario`),
  CONSTRAINT `contracheque_admin_financeiro_fk` FOREIGN KEY (`Matricula_Admin_Financeiro`) REFERENCES `adm_financeiro` (`Matricula`),
  CONSTRAINT `contracheque_func_fk` FOREIGN KEY (`Mat_Funcionario`) REFERENCES `funcionario` (`Matricula`)
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
-- Table structure for table `despesa_viagem`
--

DROP TABLE IF EXISTS `despesa_viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa_viagem` (
  `COD` varchar(10) NOT NULL,
  `Valor` mediumint(9) NOT NULL,
  PRIMARY KEY (`COD`)
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
  `Fabricante` varchar(30) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `Status` enum('Bom','Regular','Ruim') NOT NULL,
  `Historico` varchar(40) DEFAULT NULL,
  `Descricao` varchar(50) NOT NULL,
  `Setor` varchar(20) NOT NULL,
  `DataEntrada` date NOT NULL,
  `Num_Serie` varchar(11) DEFAULT NULL,
  `IP_Rede` varchar(12) DEFAULT NULL,
  `Mask_Rede` varchar(12) DEFAULT NULL,
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
-- Table structure for table `estante`
--

DROP TABLE IF EXISTS `estante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estante` (
  `COD` int(11) NOT NULL,
  `COD_ID_Almoxarif` varchar(10) NOT NULL,
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

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `Cod_Insumo` varchar(15) NOT NULL,
  `Descri` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Cod_Insumo`)
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
-- Table structure for table `item_estoque`
--

DROP TABLE IF EXISTS `item_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_estoque` (
  `Sequencial_insumo` varchar(16) NOT NULL,
  `Cod_insumo` varchar(15) NOT NULL,
  `Data_entrada` date DEFAULT NULL,
  `Data_final` date DEFAULT NULL,
  `Data_valida` date DEFAULT NULL,
  `Preco_compra` varchar(14) DEFAULT NULL,
  `Qtd_minima` int(11) DEFAULT NULL,
  `Qtd_atual` int(11) DEFAULT NULL,
  `Cod_Estante` int(11) DEFAULT NULL,
  `Cod_Almoxarif` varchar(14) NOT NULL,
  PRIMARY KEY (`Cod_insumo`,`Sequencial_insumo`),
  KEY `item_estoq_estante_fk` (`Cod_Estante`),
  KEY `item_estoq_almoxarif_fk` (`Cod_Almoxarif`),
  CONSTRAINT `insumo_fk` FOREIGN KEY (`Cod_insumo`) REFERENCES `insumo` (`Cod_Insumo`),
  CONSTRAINT `item_estoq_almoxarif_fk` FOREIGN KEY (`Cod_Almoxarif`) REFERENCES `almoxarifado` (`COD_ID`),
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
-- Table structure for table `kpi`
--

DROP TABLE IF EXISTS `kpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpi` (
  `Matricula_tecnico` varchar(10) NOT NULL DEFAULT '',
  `Sequencial` int(11) NOT NULL DEFAULT '0',
  `Kpi_1` varchar(30) DEFAULT NULL,
  `Kpi_2` varchar(30) DEFAULT NULL,
  `Dsc_kpi_1` varchar(100) DEFAULT NULL,
  `Dsc_kpi_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Sequencial`,`Matricula_tecnico`),
  KEY `kpi_tecnico_fk` (`Matricula_tecnico`),
  CONSTRAINT `kpi_tecnico_fk` FOREIGN KEY (`Matricula_tecnico`) REFERENCES `tecnico` (`Matricula_funcionario`)
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
  `Prazo_EmDias_OS` smallint(6) DEFAULT NULL,
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
-- Table structure for table `supervisao`
--

DROP TABLE IF EXISTS `supervisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisao` (
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
-- Dumping data for table `supervisao`
--

LOCK TABLES `supervisao` WRITE;
/*!40000 ALTER TABLE `supervisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor` (
  `Matricula_funcionario` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `funcionario_supervisor_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
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
  `Matricula_funcionario` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `funcionario_tecnico_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
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
  `Matricula_funcionario` varchar(10) NOT NULL DEFAULT '',
  `Telefone_movel` int(11) DEFAULT NULL,
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `funcionario_tecnico_campo_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
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
  `Matricula_funcionario` varchar(10) NOT NULL DEFAULT '',
  `Ramal` int(11) DEFAULT NULL,
  `Grau_tecnico` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `tecnico_interno_funcionario_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
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
-- Table structure for table `tipo_despesa`
--

DROP TABLE IF EXISTS `tipo_despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_despesa` (
  `ID` varchar(7) NOT NULL,
  `Cod_Despesa` varchar(10) NOT NULL,
  `dsc` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `tipo_despesa_desp_viag_fk` (`Cod_Despesa`),
  CONSTRAINT `tipo_despesa_desp_viag_fk` FOREIGN KEY (`Cod_Despesa`) REFERENCES `despesa_viagem` (`COD`)
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
-- Table structure for table `unidade_de_suporte`
--

DROP TABLE IF EXISTS `unidade_de_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_de_suporte` (
  `CNPJ_Empresa` varchar(14) NOT NULL,
  `COD` varchar(15) NOT NULL,
  `Estado` varchar(10) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `RazaoSocial` varchar(20) NOT NULL,
  `Endereço` varchar(30) NOT NULL,
  `Nome` varchar(15) DEFAULT NULL,
  `Matriz` varchar(20) NOT NULL,
  PRIMARY KEY (`COD`)
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

-- Dump completed on 2017-07-31 20:16:01
