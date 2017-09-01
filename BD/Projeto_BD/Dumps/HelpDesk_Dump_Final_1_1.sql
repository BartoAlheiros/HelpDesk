CREATE DATABASE  IF NOT EXISTS `assistech` /*!40100 DEFAULT CHARACTER SET latin1 */;
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
  `Matricula` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula`),
  CONSTRAINT `adm_financeiro_func_fk` FOREIGN KEY (`Matricula`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Id` int(11) NOT NULL,
  `Saida_mes` varchar(20) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Entrada_mes` varchar(20) NOT NULL,
  `Quantidade_total` int(11) NOT NULL,
  `Cod_Insumo` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almoxarifado`
--

LOCK TABLES `almoxarifado` WRITE;
/*!40000 ALTER TABLE `almoxarifado` DISABLE KEYS */;
/*!40000 ALTER TABLE `almoxarifado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atende`
--

DROP TABLE IF EXISTS `atende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atende` (
  `Sequencial_chamado` int(11) NOT NULL,
  `Mat_tec_campo` varchar(13) NOT NULL,
  PRIMARY KEY (`Sequencial_chamado`,`Mat_tec_campo`),
  KEY `atemnde_tec_campo_fk` (`Mat_tec_campo`),
  CONSTRAINT `atemnde_tec_campo_fk` FOREIGN KEY (`Mat_tec_campo`) REFERENCES `tecnico_campo` (`matricula`),
  CONSTRAINT `atende_chamado_fk` FOREIGN KEY (`Sequencial_chamado`) REFERENCES `chamado` (`Sequencial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atende`
--

LOCK TABLES `atende` WRITE;
/*!40000 ALTER TABLE `atende` DISABLE KEYS */;
/*!40000 ALTER TABLE `atende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendente_solucionador_direcionador`
--

DROP TABLE IF EXISTS `atendente_solucionador_direcionador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendente_solucionador_direcionador` (
  `matricula` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`matricula`),
  CONSTRAINT `atendente_soluc_direc_funciionario_fk` FOREIGN KEY (`matricula`) REFERENCES `tecnico` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendente_solucionador_direcionador`
--

LOCK TABLES `atendente_solucionador_direcionador` WRITE;
/*!40000 ALTER TABLE `atendente_solucionador_direcionador` DISABLE KEYS */;
/*!40000 ALTER TABLE `atendente_solucionador_direcionador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_problemas_kb`
--

DROP TABLE IF EXISTS `base_problemas_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_problemas_kb` (
  `Id` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Procedimento` varchar(1023) NOT NULL,
  `Solucao` varchar(1023) NOT NULL,
  `Data_entrada` date NOT NULL,
  `Tempo_necessario` float(4,2) NOT NULL,
  `obs` varchar(1023) NOT NULL,
  `Id_relacionado` int(11) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `base_probs_relacionado_com_fk` (`Id_relacionado`),
  KEY `base_probs_servico_fk` (`Cod_servico`),
  CONSTRAINT `base_probs_relacionado_com_fk` FOREIGN KEY (`Id_relacionado`) REFERENCES `base_problemas_kb` (`Id`),
  CONSTRAINT `base_probs_servico_fk` FOREIGN KEY (`Cod_servico`) REFERENCES `servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_problemas_kb`
--

LOCK TABLES `base_problemas_kb` WRITE;
/*!40000 ALTER TABLE `base_problemas_kb` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_problemas_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseou_em`
--

DROP TABLE IF EXISTS `baseou_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseou_em` (
  `Id_base_prob` int(11) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  PRIMARY KEY (`Id_base_prob`,`Cod_servico`),
  KEY `baseou_em_servico_fk` (`Cod_servico`),
  CONSTRAINT `baseou_em_base_probs_fk` FOREIGN KEY (`Id_base_prob`) REFERENCES `base_problemas_kb` (`Id`),
  CONSTRAINT `baseou_em_servico_fk` FOREIGN KEY (`Cod_servico`) REFERENCES `servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod` varchar(20) NOT NULL,
  `Descricao` varchar(80) NOT NULL,
  PRIMARY KEY (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Sequencial` int(11) NOT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Status_` varchar(20) DEFAULT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Prioridade` varchar(20) DEFAULT NULL,
  `Mat_supervisor` varchar(13) DEFAULT NULL,
  `Mat_tec_campo` varchar(13) DEFAULT NULL,
  `Mat_tec_interno` varchar(13) DEFAULT NULL,
  `Mat_atend` varchar(13) DEFAULT NULL,
  `Num_ordem_servico` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sequencial`),
  KEY `chamado_supervisor_fk` (`Mat_supervisor`),
  KEY `chamado_tec_campo_fk` (`Mat_tec_campo`),
  KEY `chamado_tec_interno_fk` (`Mat_tec_interno`),
  KEY `chamado_atend_sol_direc_fk` (`Mat_atend`),
  KEY `chamado_ordem_servico_fk` (`Num_ordem_servico`),
  CONSTRAINT `chamado_atend_sol_direc_fk` FOREIGN KEY (`Mat_atend`) REFERENCES `atendente_solucionador_direcionador` (`matricula`),
  CONSTRAINT `chamado_ordem_servico_fk` FOREIGN KEY (`Num_ordem_servico`) REFERENCES `ordem_servico` (`Num`),
  CONSTRAINT `chamado_supervisor_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `supervisor` (`matricula`),
  CONSTRAINT `chamado_tec_campo_fk` FOREIGN KEY (`Mat_tec_campo`) REFERENCES `tecnico_campo` (`matricula`),
  CONSTRAINT `chamado_tec_interno_fk` FOREIGN KEY (`Mat_tec_interno`) REFERENCES `tecnico_interno` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado`
--

LOCK TABLES `chamado` WRITE;
/*!40000 ALTER TABLE `chamado` DISABLE KEYS */;
/*!40000 ALTER TABLE `chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clie_abre`
--

DROP TABLE IF EXISTS `clie_abre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clie_abre` (
  `Cod` bigint(12) NOT NULL,
  `Dta_abertura` date NOT NULL,
  `Cod_Cliente` int(11) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `clie_abre_cliente_fk` (`Cod_Cliente`),
  CONSTRAINT `clie_abre_cliente_fk` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clie_abre`
--

LOCK TABLES `clie_abre` WRITE;
/*!40000 ALTER TABLE `clie_abre` DISABLE KEYS */;
/*!40000 ALTER TABLE `clie_abre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Cod` int(11) NOT NULL,
  `Prioridade` varchar(20) NOT NULL,
  `Endereco` varchar(200) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Fone` varchar(30) NOT NULL,
  PRIMARY KEY (`Cod`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_fis`
--

DROP TABLE IF EXISTS `cliente_fis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_fis` (
  `Cod_cliente` int(11) NOT NULL,
  `Cpf` varchar(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  PRIMARY KEY (`Cod_cliente`),
  CONSTRAINT `cliente_fis_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_fis`
--

LOCK TABLES `cliente_fis` WRITE;
/*!40000 ALTER TABLE `cliente_fis` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_fis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_jur`
--

DROP TABLE IF EXISTS `cliente_jur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_jur` (
  `Cod_cliente` int(11) NOT NULL,
  `Cnpj` bigint(14) NOT NULL,
  `Razao_social` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_cliente`),
  CONSTRAINT `cliente_jur_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod_equipamento` varchar(15) NOT NULL,
  `Sistema_operacional` varchar(10) NOT NULL,
  `Endereco_IP` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `computador_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Horas_extras` smallint(5) unsigned NOT NULL,
  `Salario_Base` int(9) NOT NULL,
  `Adicional_Salario` int(9) DEFAULT NULL,
  `Dta` date NOT NULL,
  `Matricula_Funcionario` varchar(13) NOT NULL,
  `Matricula_adm_financeiro` varchar(13) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Matricula_Funcionario` (`Matricula_Funcionario`),
  UNIQUE KEY `Matricula_adm_financeiro` (`Matricula_adm_financeiro`),
  CONSTRAINT `contracheque_adm_finc_fk` FOREIGN KEY (`Matricula_adm_financeiro`) REFERENCES `adm_financeiro` (`Matricula`),
  CONSTRAINT `contracheque_funcionario_fk` FOREIGN KEY (`Matricula_Funcionario`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod_contrato` varchar(15) NOT NULL,
  `Cnpj_Unidade_suporte` bigint(14) unsigned NOT NULL,
  `Id_tipo_contrato` int(10) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Data_fim` date NOT NULL,
  `Status_contrato` varchar(58) NOT NULL,
  `Cod_cliente` int(11) NOT NULL,
  PRIMARY KEY (`Cod_contrato`,`Cnpj_Unidade_suporte`,`Id_tipo_contrato`,`Cod_cliente`),
  KEY `contrato_tipo_contrato_fk` (`Id_tipo_contrato`),
  KEY `contrato_unidade_suporte_fk` (`Cnpj_Unidade_suporte`),
  KEY `contrato_cliente_jur_fk` (`Cod_cliente`),
  CONSTRAINT `contrato_cliente_jur_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente_jur` (`Cod_cliente`),
  CONSTRAINT `contrato_tipo_contrato_fk` FOREIGN KEY (`Id_tipo_contrato`) REFERENCES `tipo_contrato` (`Id`),
  CONSTRAINT `contrato_unidade_suporte_fk` FOREIGN KEY (`Cnpj_Unidade_suporte`) REFERENCES `unidade_de_suporte` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Nome` varchar(50) NOT NULL,
  `Sequencial` int(10) NOT NULL DEFAULT '0',
  `Matricula_funcionario` varchar(13) NOT NULL DEFAULT '',
  `Sexo` varchar(1) NOT NULL,
  `Data_nascimento` date NOT NULL,
  `Parentesco` varchar(20) NOT NULL,
  `Idade` int(3) NOT NULL,
  PRIMARY KEY (`Sequencial`,`Matricula_funcionario`),
  KEY `dependente_funcionario_fk` (`Matricula_funcionario`),
  CONSTRAINT `dependente_funcionario_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod` varchar(10) NOT NULL,
  `Valor` float(4,2) NOT NULL,
  `Id_tipo_despesa` int(11) NOT NULL,
  `Mat_adm_financeiro` varchar(13) NOT NULL,
  `Sequencial_chamado` int(11) NOT NULL,
  `Mat_tec_campo` varchar(13) NOT NULL,
  PRIMARY KEY (`Cod`),
  UNIQUE KEY `Mat_adm_financeiro` (`Mat_adm_financeiro`),
  KEY `despesa_tipo_despesa_fk` (`Id_tipo_despesa`),
  KEY `chamado_fk` (`Sequencial_chamado`),
  KEY `tec_campo_fk` (`Mat_tec_campo`),
  CONSTRAINT `chamado_fk` FOREIGN KEY (`Sequencial_chamado`) REFERENCES `atende` (`Sequencial_chamado`),
  CONSTRAINT `despesa_adm_financeiro_fk` FOREIGN KEY (`Mat_adm_financeiro`) REFERENCES `adm_financeiro` (`Matricula`),
  CONSTRAINT `despesa_tipo_despesa_fk` FOREIGN KEY (`Id_tipo_despesa`) REFERENCES `tipo_despesa` (`Id`),
  CONSTRAINT `tec_campo_fk` FOREIGN KEY (`Mat_tec_campo`) REFERENCES `atende` (`Mat_tec_campo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Id` int(11) NOT NULL,
  `Tipo` varchar(60) NOT NULL,
  `Data_Criacao` date NOT NULL,
  `Arquivo` varchar(50) NOT NULL,
  `Versao` float(2,2) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Cod_contrato` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cod_contrato` (`Cod_contrato`),
  CONSTRAINT `documento_cod_contrato_fk` FOREIGN KEY (`Cod_contrato`) REFERENCES `contrato` (`Cod_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `CNPJ` bigint(14) unsigned NOT NULL DEFAULT '0',
  `Razao_social` varchar(20) NOT NULL,
  `Endereco` varchar(30) NOT NULL,
  `Fone` varchar(15) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE KEY `Razao_social` (`Razao_social`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `end_fornecedor`
--

DROP TABLE IF EXISTS `end_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `end_fornecedor` (
  `Cnpj_Fornecedor` bigint(14) NOT NULL,
  `Endereco` varchar(30) NOT NULL,
  PRIMARY KEY (`Cnpj_Fornecedor`,`Endereco`),
  CONSTRAINT `end_fornecedor_fk` FOREIGN KEY (`Cnpj_Fornecedor`) REFERENCES `fornecedor` (`Cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `end_fornecedor`
--

LOCK TABLES `end_fornecedor` WRITE;
/*!40000 ALTER TABLE `end_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `end_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envolveu`
--

DROP TABLE IF EXISTS `envolveu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envolveu` (
  `Num_ordem_servico` int(11) NOT NULL,
  `Cod_equipamento` varchar(15) NOT NULL,
  PRIMARY KEY (`Num_ordem_servico`,`Cod_equipamento`),
  KEY `envolve_equipamento_fk` (`Cod_equipamento`),
  CONSTRAINT `envolve_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`),
  CONSTRAINT `envolveu_os_fk` FOREIGN KEY (`Num_ordem_servico`) REFERENCES `ordem_servico` (`Num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envolveu`
--

LOCK TABLES `envolveu` WRITE;
/*!40000 ALTER TABLE `envolveu` DISABLE KEYS */;
/*!40000 ALTER TABLE `envolveu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipamento` (
  `Cod` varchar(15) NOT NULL,
  `Data_entrada` date NOT NULL,
  `Setor` varchar(10) NOT NULL,
  `historico` varchar(80) NOT NULL,
  `Fabricante` varchar(20) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Cod_contrato` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `Cod_contrato_fk` (`Cod_contrato`),
  CONSTRAINT `Cod_contrato_fk` FOREIGN KEY (`Cod_contrato`) REFERENCES `contrato` (`Cod_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fatura` (
  `Cod` int(11) NOT NULL,
  `Num_parcelas` int(11) NOT NULL,
  `Valor_total` int(11) NOT NULL,
  `Status_` varchar(30) NOT NULL,
  `Cod_cliente` int(11) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `fatura_cliente_fk` (`Cod_cliente`),
  CONSTRAINT `fatura_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cnpj_Fornecedor` bigint(14) NOT NULL,
  `Cod_Insumo` varchar(15) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Data_fim` date NOT NULL,
  `Valor_unitario` float(4,2) NOT NULL,
  PRIMARY KEY (`Cnpj_Fornecedor`,`Cod_Insumo`),
  KEY `Cod_Insumo_fk` (`Cod_Insumo`),
  CONSTRAINT `Cnpj_Fornecedor_fk` FOREIGN KEY (`Cnpj_Fornecedor`) REFERENCES `fornecedor` (`Cnpj`),
  CONSTRAINT `Cod_Insumo_fk` FOREIGN KEY (`Cod_Insumo`) REFERENCES `insumo` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cnpj` bigint(14) NOT NULL,
  `Razao_social` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`Cnpj`),
  UNIQUE KEY `Razao_social` (`Razao_social`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Matricula` varchar(13) NOT NULL DEFAULT '',
  `CPF` bigint(11) NOT NULL,
  `Matricula_supervisor` varchar(13) NOT NULL,
  `CNPJ` bigint(14) unsigned NOT NULL,
  `Login` varchar(15) NOT NULL,
  `Senha` varchar(15) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Cod_Contracheque` bigint(20) unsigned DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Carga_hora` int(2) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  UNIQUE KEY `Login` (`Login`),
  UNIQUE KEY `Senha` (`Senha`),
  UNIQUE KEY `Cod_Contracheque` (`Cod_Contracheque`),
  UNIQUE KEY `Email` (`Email`),
  KEY `funcionario_supervisiona_fk` (`Matricula_supervisor`),
  CONSTRAINT `funcionario_supervisiona_fk` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisiona` (`Matricula_supervisor`),
  CONSTRAINT `funcionario_unid_sup_fk` FOREIGN KEY (`CNPJ`) REFERENCES `unidade_de_suporte` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod_equipamento` varchar(15) NOT NULL,
  `Modelo` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `impressora_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod` varchar(15) NOT NULL,
  `Descricao` varchar(128) NOT NULL,
  `Cod_categoria` varchar(20) NOT NULL,
  `Mat_supervisor` varchar(13) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `insumo_categoria_fk` (`Cod_categoria`),
  KEY `insumo_solicita_fk` (`Mat_supervisor`),
  CONSTRAINT `insumo_categoria_fk` FOREIGN KEY (`Cod_categoria`) REFERENCES `categoria` (`Cod`),
  CONSTRAINT `insumo_solicita_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `solicita` (`Mat_supervisor`),
  CONSTRAINT `insumo_supervisor_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `supervisor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod_Insumo` varchar(15) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  `Quantidade` varchar(29) NOT NULL,
  PRIMARY KEY (`Cod_Insumo`,`Cod_servico`),
  KEY `insumo_usado_servico_servico` (`Cod_servico`),
  CONSTRAINT `insumo_usado_servico_insumo_fk` FOREIGN KEY (`Cod_Insumo`) REFERENCES `insumo` (`Cod`),
  CONSTRAINT `insumo_usado_servico_servico` FOREIGN KEY (`Cod_servico`) REFERENCES `servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Sequencial` int(8) NOT NULL,
  `Cod_Insumo` varchar(15) NOT NULL,
  `Quantidade_Atual` int(6) NOT NULL,
  `Data_validade` date NOT NULL,
  `Data_final` date NOT NULL,
  `Data_entrada` date NOT NULL,
  `Preco_compra` int(8) NOT NULL,
  `Quantidade_minima` int(6) NOT NULL,
  `Id_almoxarifado` int(11) NOT NULL,
  PRIMARY KEY (`Sequencial`,`Cod_Insumo`),
  KEY `item_estoque_insumo_fk` (`Cod_Insumo`),
  KEY `item_estoque_almoxarifado_fk` (`Id_almoxarifado`),
  CONSTRAINT `item_estoque_almoxarifado_fk` FOREIGN KEY (`Id_almoxarifado`) REFERENCES `almoxarifado` (`Id`),
  CONSTRAINT `item_estoque_insumo_fk` FOREIGN KEY (`Cod_Insumo`) REFERENCES `insumo` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_estoque`
--

LOCK TABLES `item_estoque` WRITE;
/*!40000 ALTER TABLE `item_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada_de_trabalho`
--

DROP TABLE IF EXISTS `jornada_de_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornada_de_trabalho` (
  `Id` varchar(8) NOT NULL DEFAULT '',
  `Hora_inicio` time NOT NULL,
  `Hora_final` time NOT NULL,
  `Trabalha_sabado` tinyint(1) NOT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `Matricula_funcionario` varchar(13) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Matricula_funcionario` (`Matricula_funcionario`),
  CONSTRAINT `jorn_trab_funcionario_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada_de_trabalho`
--

LOCK TABLES `jornada_de_trabalho` WRITE;
/*!40000 ALTER TABLE `jornada_de_trabalho` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada_de_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kpi`
--

DROP TABLE IF EXISTS `kpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpi` (
  `Sequencial` int(11) NOT NULL,
  `Matricula_tecnico` varchar(13) NOT NULL DEFAULT '',
  `KPI_1` int(11) NOT NULL,
  `KPI_2` int(11) NOT NULL,
  `Dsc_KPI_1` varchar(100) NOT NULL,
  `Dsk_KPI_2` varchar(100) NOT NULL,
  PRIMARY KEY (`Sequencial`,`Matricula_tecnico`),
  KEY `kpi_tecnico_fk` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpi`
--

LOCK TABLES `kpi` WRITE;
/*!40000 ALTER TABLE `kpi` DISABLE KEYS */;
/*!40000 ALTER TABLE `kpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nobreak`
--

DROP TABLE IF EXISTS `nobreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nobreak` (
  `Cod_equipamento` varchar(15) NOT NULL,
  `KVA` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `nobreak_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod` int(11) NOT NULL,
  `Data_emissao` date NOT NULL,
  `Validade_num_dias` int(11) NOT NULL,
  `ultima_data` date NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Data_abertura` date NOT NULL,
  `Num_OS` int(11) NOT NULL,
  PRIMARY KEY (`Cod`),
  UNIQUE KEY `Num_OS` (`Num_OS`),
  CONSTRAINT `orcamento_os_fk` FOREIGN KEY (`Num_OS`) REFERENCES `ordem_servico` (`Num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico` (
  `Num` int(11) NOT NULL,
  `Data_devida` date NOT NULL,
  `Prazo_em_dias` int(11) NOT NULL,
  `Data_criacao` date NOT NULL,
  `Status_` varchar(20) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  `sequencial_chamado` int(11) NOT NULL,
  `Cod_orcamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Num`),
  UNIQUE KEY `Cod_orcamento` (`Cod_orcamento`),
  KEY `ord_servico_chamado_fk` (`sequencial_chamado`),
  CONSTRAINT `ord_servico_chamado_fk` FOREIGN KEY (`sequencial_chamado`) REFERENCES `chamado` (`Sequencial`),
  CONSTRAINT `ord_servico_orcamento_fk` FOREIGN KEY (`Cod_orcamento`) REFERENCES `orcamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela_pagamento`
--

DROP TABLE IF EXISTS `parcela_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcela_pagamento` (
  `Sequencial` int(11) NOT NULL,
  `Cod_fatura` int(11) NOT NULL,
  `Data_pagamento` date NOT NULL,
  `Data_parcela` date NOT NULL,
  `Juros` float(2,2) NOT NULL,
  `Valor_total` int(11) NOT NULL,
  `Valor_pagamento_parcelado` int(11) NOT NULL,
  PRIMARY KEY (`Sequencial`,`Cod_fatura`),
  KEY `parcela_pagamento_fatura_fk` (`Cod_fatura`),
  CONSTRAINT `parcela_pagamento_fatura_fk` FOREIGN KEY (`Cod_fatura`) REFERENCES `fatura` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Valor` float(4,2) NOT NULL,
  `Status_` varchar(255) NOT NULL,
  `Cod_Tipo_Servico` int(11) NOT NULL,
  `Num_OS` int(11) NOT NULL,
  PRIMARY KEY (`Cod`),
  UNIQUE KEY `Num_OS` (`Num_OS`),
  KEY `servico_tipo_servic_fk` (`Cod_Tipo_Servico`),
  CONSTRAINT `servico_ord_servico_fk` FOREIGN KEY (`Num_OS`) REFERENCES `ordem_servico` (`Num`),
  CONSTRAINT `servico_tipo_servic_fk` FOREIGN KEY (`Cod_Tipo_Servico`) REFERENCES `tipo_servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicita`
--

DROP TABLE IF EXISTS `solicita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicita` (
  `Mat_supervisor` varchar(13) NOT NULL,
  `Quantidade` int(4) DEFAULT NULL,
  PRIMARY KEY (`Mat_supervisor`),
  CONSTRAINT `solicita_supervisor_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `supervisor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicita`
--

LOCK TABLES `solicita` WRITE;
/*!40000 ALTER TABLE `solicita` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisiona`
--

DROP TABLE IF EXISTS `supervisiona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisiona` (
  `Matricula_supervisor` varchar(13) NOT NULL DEFAULT '',
  `data_inicio` date NOT NULL,
  PRIMARY KEY (`Matricula_supervisor`),
  CONSTRAINT `supervisiona_ibfk_1` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `matricula` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`matricula`),
  CONSTRAINT `funcionario_supervisor_fk` FOREIGN KEY (`matricula`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Matricula_tecnico` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_tecnico`),
  CONSTRAINT `tecnico_funcionario_fk` FOREIGN KEY (`Matricula_tecnico`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `matricula` varchar(13) NOT NULL DEFAULT '',
  `tel_movel` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `tel_movel` (`tel_movel`),
  CONSTRAINT `tecnico_campo_tecnico_fk` FOREIGN KEY (`matricula`) REFERENCES `tecnico` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `matricula` varchar(13) NOT NULL DEFAULT '',
  `Ramall` varchar(4) NOT NULL,
  `Grau_tec` varchar(30) NOT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `tec_interno_tecnico_fk` FOREIGN KEY (`matricula`) REFERENCES `tecnico` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Id` int(10) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Id` int(11) NOT NULL,
  `Descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `Cod` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servico`
--

LOCK TABLES `tipo_servico` WRITE;
/*!40000 ALTER TABLE `tipo_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv`
--

DROP TABLE IF EXISTS `tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tv` (
  `Cod_equipamento` varchar(15) NOT NULL,
  `Modelo` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `tv_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv`
--

LOCK TABLES `tv` WRITE;
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_de_suporte`
--

DROP TABLE IF EXISTS `unidade_de_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_de_suporte` (
  `CNPJ` bigint(14) unsigned NOT NULL DEFAULT '0',
  `Nro_funcionarios` int(11) DEFAULT NULL,
  `Nome` varchar(50) NOT NULL,
  `Matriz` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `FONE` varchar(16) NOT NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE KEY `endereco` (`endereco`),
  CONSTRAINT `fk_unid_suporte_empresa` FOREIGN KEY (`CNPJ`) REFERENCES `empresa` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_de_suporte`
--

LOCK TABLES `unidade_de_suporte` WRITE;
/*!40000 ALTER TABLE `unidade_de_suporte` DISABLE KEYS */;
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

-- Dump completed on 2017-08-11 16:28:45
