CREATE DATABASE  IF NOT EXISTS `universidade` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `universidade`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: universidade
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `matricula_aluno` int(11) NOT NULL,
  `nota_vestibular` decimal(5,3) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  PRIMARY KEY (`matricula_aluno`),
  KEY `aluno_codigo_curso_fk` (`codigo_curso`),
  CONSTRAINT `aluno_codigo_curso_fk` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  CONSTRAINT `aluno_matricula_aluno_fk` FOREIGN KEY (`matricula_aluno`) REFERENCES `pessoa` (`matricula_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1010,8.206,1),(1212,6.653,1),(1313,4.932,1),(1414,9.803,1),(1515,6.480,1),(1616,9.304,2),(1717,8.630,2),(1818,7.620,2),(1919,6.305,2),(2020,5.034,2),(2121,4.320,3),(2323,3.204,3),(2424,8.205,3),(2525,7.205,5),(2626,7.320,4),(2727,6.046,4),(2828,5.024,5),(2929,6.320,1),(3030,4.300,4),(8888,5.392,1),(9999,7.652,1);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_turma`
--

DROP TABLE IF EXISTS `aluno_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_turma` (
  `codigo_disciplina` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `ano_semestre` varchar(6) NOT NULL,
  `matricula_aluno` int(11) NOT NULL,
  `codigo_projeto` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_disciplina`,`codigo_curso`,`ano_semestre`,`matricula_aluno`),
  KEY `aluno_turma_matricula_aluno_fk` (`matricula_aluno`),
  KEY `aluno_turma_codigo_projeto_fk` (`codigo_projeto`),
  CONSTRAINT `aluno_turma_codigo_projeto_fk` FOREIGN KEY (`codigo_projeto`) REFERENCES `projeto` (`codigo_projeto`),
  CONSTRAINT `aluno_turma_matricula_aluno_fk` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula_aluno`),
  CONSTRAINT `aluno_turma_turma_fk` FOREIGN KEY (`codigo_disciplina`, `codigo_curso`, `ano_semestre`) REFERENCES `turma` (`codigo_disciplina`, `codigo_curso`, `ano_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_turma`
--

LOCK TABLES `aluno_turma` WRITE;
/*!40000 ALTER TABLE `aluno_turma` DISABLE KEYS */;
INSERT INTO `aluno_turma` VALUES (1,1,'2009.2',2020,NULL),(1,1,'2009.2',2121,NULL),(1,2,'2010.2',1818,NULL),(1,2,'2010.2',1919,NULL),(1,2,'2010.2',2020,NULL),(1,2,'2010.2',2121,NULL),(2,3,'2010.2',2929,NULL),(2,3,'2010.2',3030,NULL),(3,2,'2010.1',1616,NULL),(3,2,'2010.1',1717,NULL),(3,2,'2010.1',1818,NULL),(3,2,'2010.1',1919,NULL),(3,3,'2010.2',8888,NULL),(3,3,'2010.2',9999,NULL),(4,4,'2010.2',2828,NULL),(4,4,'2010.2',2929,NULL),(4,4,'2010.2',3030,NULL),(5,4,'2010.2',1010,NULL),(6,5,'2010.2',2626,NULL),(6,5,'2010.2',2727,NULL),(6,5,'2010.2',2828,NULL),(6,5,'2010.2',2929,NULL),(6,5,'2010.2',3030,NULL),(3,3,'2010.2',1616,1),(3,3,'2010.2',1717,1),(3,3,'2010.2',1818,1),(3,3,'2010.2',1919,1),(3,3,'2010.2',1010,2),(3,3,'2010.2',1212,2),(3,3,'2010.2',1313,2),(3,3,'2010.2',1414,2),(3,3,'2010.2',1515,2),(2,3,'2010.2',2020,3),(2,3,'2010.2',2121,3),(2,3,'2010.2',2323,3),(2,3,'2010.2',2424,3),(2,3,'2010.2',2525,3),(2,3,'2010.2',2626,4),(2,3,'2010.2',2727,4),(2,3,'2010.2',2828,4),(1,2,'2010.2',1010,5),(1,2,'2010.2',8888,5),(1,2,'2010.2',9999,5),(1,2,'2010.2',1212,6),(1,2,'2010.2',1313,6),(1,2,'2010.2',1414,6),(1,2,'2010.2',1515,6),(1,2,'2010.2',1616,6),(1,2,'2010.2',1717,6),(1,1,'2010.2',1313,7),(1,1,'2010.2',1414,7),(1,1,'2010.2',1515,7),(1,1,'2010.2',1616,8),(1,1,'2010.2',1717,8),(1,1,'2010.2',1818,9),(1,1,'2010.2',1919,9),(1,1,'2010.2',2020,9),(5,4,'2010.2',8888,10),(5,4,'2010.2',9999,10),(1,1,'2010.1',2020,11),(1,1,'2010.1',2121,11),(1,1,'2010.1',2323,11),(1,1,'2010.1',2424,11),(1,1,'2010.1',2525,11),(1,1,'2010.1',8888,11),(2,1,'2010.1',2323,12),(2,1,'2010.1',2424,12),(2,1,'2010.1',2525,12),(2,1,'2010.1',2626,12),(2,1,'2010.1',2727,13),(2,1,'2010.1',2828,13),(2,1,'2010.1',2929,13),(1,1,'2009.1',2323,14),(1,1,'2009.1',2424,14),(1,1,'2009.1',2525,15),(1,1,'2009.1',2626,15),(1,1,'2009.1',2727,16),(1,1,'2009.1',2828,17),(3,1,'2009.1',1010,18),(3,1,'2009.1',1212,18),(3,1,'2009.1',8888,18),(3,1,'2009.1',9999,18),(2,1,'2009.1',1010,19),(2,1,'2009.1',8888,19),(2,1,'2009.1',9999,19),(1,1,'2008.2',1313,20),(1,1,'2008.2',1414,20),(1,1,'2008.2',1515,20),(1,1,'2008.2',1616,20),(1,1,'2008.2',1717,20);
/*!40000 ALTER TABLE `aluno_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codigo_curso` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Engeharia da Computacao'),(2,'Ciencia da Computacao'),(3,'Sistemas de Informacao'),(4,'Estatistica'),(5,'Matematica');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `codigo_disciplina` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `ementa` varchar(50) NOT NULL,
  `conteudo_programatico` varchar(100) NOT NULL,
  `matricula_professor` int(11) NOT NULL,
  PRIMARY KEY (`codigo_disciplina`),
  KEY `disciplina_matricula_prof_fk` (`matricula_professor`),
  CONSTRAINT `disciplina_matricula_prof_fk` FOREIGN KEY (`matricula_professor`) REFERENCES `professor` (`matricula_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Programacao','E1','C1',1111),(2,'BD','E2','C2',2222),(3,'Estatistica','E3','C3',3333),(4,'Calculo','E4','C4',4444),(5,'Redes','E5','C5',5555),(6,'ES','E6','C6',6666);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ministra`
--

DROP TABLE IF EXISTS `ministra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ministra` (
  `codigo_disciplina` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `ano_semestre` varchar(6) NOT NULL,
  `matricula_professor` int(11) NOT NULL,
  PRIMARY KEY (`codigo_disciplina`,`codigo_curso`,`ano_semestre`,`matricula_professor`),
  KEY `ministra_matricula_prof_fk` (`matricula_professor`),
  CONSTRAINT `ministra_matricula_prof_fk` FOREIGN KEY (`matricula_professor`) REFERENCES `professor` (`matricula_professor`),
  CONSTRAINT `ministra_turma_fk` FOREIGN KEY (`codigo_disciplina`, `codigo_curso`, `ano_semestre`) REFERENCES `turma` (`codigo_disciplina`, `codigo_curso`, `ano_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministra`
--

LOCK TABLES `ministra` WRITE;
/*!40000 ALTER TABLE `ministra` DISABLE KEYS */;
INSERT INTO `ministra` VALUES (1,1,'2008.2',1111),(1,1,'2009.1',1111),(2,1,'2008.1',1111),(3,1,'2008.1',1111),(5,4,'2010.2',1111),(1,1,'2008.2',2222),(1,2,'2008.2',2222),(2,1,'2010.1',2222),(2,2,'2008.2',2222),(2,3,'2009.2',2222),(1,3,'2009.2',3333),(2,2,'2008.2',3333),(2,3,'2010.2',3333),(6,4,'2008.1',3333),(1,1,'2009.2',4444),(1,1,'2010.2',4444),(2,1,'2009.2',4444),(3,1,'2009.2',4444),(4,5,'2010.1',4444),(6,5,'2010.2',4444),(1,1,'2010.2',5555),(3,2,'2008.2',5555),(3,3,'2010.2',5555),(4,4,'2010.2',5555),(1,1,'2008.2',6666),(2,3,'2010.2',6666),(3,1,'2009.1',6666),(4,2,'2008.2',6666),(1,1,'2009.2',7777),(1,1,'2010.2',7777),(2,3,'2010.2',7777);
/*!40000 ALTER TABLE `ministra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoria`
--

DROP TABLE IF EXISTS `monitoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoria` (
  `codigo_disciplina` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `ano_semestre` varchar(6) NOT NULL,
  `matricula_aluno` int(11) NOT NULL,
  `matricula_professor` int(11) NOT NULL,
  PRIMARY KEY (`codigo_disciplina`,`codigo_curso`,`ano_semestre`,`matricula_aluno`),
  KEY `monitoria_matricula_aluno_fk` (`matricula_aluno`),
  KEY `monitoria_matricula_prof_fk` (`matricula_professor`),
  CONSTRAINT `monitoria_matricula_aluno_fk` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula_aluno`),
  CONSTRAINT `monitoria_matricula_prof_fk` FOREIGN KEY (`matricula_professor`) REFERENCES `professor` (`matricula_professor`),
  CONSTRAINT `monitoria_turma_fk` FOREIGN KEY (`codigo_disciplina`, `codigo_curso`, `ano_semestre`) REFERENCES `turma` (`codigo_disciplina`, `codigo_curso`, `ano_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoria`
--

LOCK TABLES `monitoria` WRITE;
/*!40000 ALTER TABLE `monitoria` DISABLE KEYS */;
INSERT INTO `monitoria` VALUES (1,1,'2008.2',3030,1111),(1,1,'2009.1',1919,1111),(2,1,'2008.1',3030,1111),(3,1,'2008.1',1212,1111),(5,4,'2010.2',8888,1111),(1,2,'2008.2',8888,2222),(2,1,'2010.1',8888,2222),(2,3,'2009.2',2323,2222),(2,2,'2008.2',2323,3333),(2,3,'2010.2',2525,3333),(6,4,'2008.1',9999,3333),(1,1,'2010.2',8888,4444),(2,1,'2009.2',8888,4444),(3,1,'2009.2',8888,4444),(4,5,'2010.1',1313,4444),(6,5,'2010.2',1010,4444),(3,3,'2010.2',1818,5555),(1,1,'2009.2',1313,7777);
/*!40000 ALTER TABLE `monitoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `matricula_pessoa` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  PRIMARY KEY (`matricula_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1010,'Olavo Ferreira','H'),(1111,'Jose Alcantara','H'),(1212,'Augustus Kilter','H'),(1313,'Mery dos Santos','M'),(1414,'Kildery Ramos','H'),(1515,'Valentina Oliveira','M'),(1616,'Ofeliana Araujo','M'),(1717,'Dezembrina Carneiro','M'),(1818,'Oristides Melo','H'),(1919,'Carlos Chagas','H'),(2020,'Gusmao Alencar','H'),(2121,'Luis Mario Moraes','H'),(2222,'Ricardo Nassau','H'),(2323,'Glenda Amorin','M'),(2424,'Pompeu de Toledo','H'),(2525,'Hortencia Maria','M'),(2626,'Amelia Lima','M'),(2727,'Kelly Desarlinas','M'),(2828,'Raphael Queiroga','H'),(2929,'Carmelita Santos','M'),(3030,'Helena Nunes','M'),(3333,'Maria das Dores','M'),(4444,'Sirenio Arruda','H'),(5555,'Alexandra Almeida','M'),(6666,'Lindalva Silva','M'),(7777,'Rosa Pereira','M'),(8888,'Joao Custodia','H'),(9999,'Fabiana Murer','M');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `matricula_professor` int(11) NOT NULL,
  `data_admissao` date NOT NULL,
  `matricula_lider` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula_professor`),
  KEY `professor_matricula_lider_fk` (`matricula_lider`),
  CONSTRAINT `professor_matricula_lider_fk` FOREIGN KEY (`matricula_lider`) REFERENCES `professor` (`matricula_professor`),
  CONSTRAINT `professor_matricula_prof_fk` FOREIGN KEY (`matricula_professor`) REFERENCES `pessoa` (`matricula_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1111,'2000-11-02',NULL),(2222,'1984-02-27',1111),(3333,'1972-07-15',NULL),(4444,'2001-01-06',1111),(5555,'2006-12-29',4444),(6666,'2006-03-16',3333),(7777,'1999-07-11',3333);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto` (
  `codigo_projeto` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `conceito` varchar(7) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'VoIP Cin','BOM','www.cin.ufpe.br/~voip'),(2,'TeleMundo','BOM','www.cin.ufpe.br/~telemundo'),(3,'Plano B','REGULAR','www.cin.ufpe.br/~planob'),(4,'Conceito 2','BOM','www.conceito2.com.br'),(5,'Stroleer','REGULAR','www.stroller.net'),(6,'FUT Robo','BOM','www.cin.ufpe.br/~futrobo'),(7,'Disco Player','REGULAR','www.discoplayer.com'),(8,'Rede Aberta','RUIM','www.cin.ufpe.br/~redeaberta'),(9,'AlerTorr','REGULAR','www.alertorr.edu.br'),(10,'Koleira Chips Caninos','BOM','www.ufpe.br/koleira'),(11,'Mega Site Promocoes','BOM','www.megasite.com.br'),(12,'Algema','RUIM','www.algema.com'),(13,'CinPlus','BOM','www.cin.ufpe.br/~cinplus'),(14,'SiGRH','RUIM','www.dti.ufrj.br/~sihr'),(15,'Cinuca','BOM','www.cin.ufpe.br/~cinuca'),(16,'Cin P2P','BOM','www.cin.ufpe.br/~cinp2p'),(17,'CasaAzul Editor','BOM','www.casaazul.com'),(18,'Piloto Automatico','RUIM','www.cti.ufmg.br/~pilotoautomatico'),(19,'IAX 40F','RUIM','www.cin.ufpe.br/~kjus/iax40f'),(20,'Poolire Comunicacao','BOM','www.cin.ufpe.br/~poolire');
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prova`
--

DROP TABLE IF EXISTS `prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prova` (
  `codigo_disciplina` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `ano_semestre` varchar(6) NOT NULL,
  `matricula_aluno` int(11) NOT NULL,
  `descricao` varchar(10) NOT NULL,
  `nota` decimal(3,1) NOT NULL,
  PRIMARY KEY (`codigo_disciplina`,`codigo_curso`,`ano_semestre`,`matricula_aluno`,`descricao`),
  CONSTRAINT `prova_aluno_turma_fk` FOREIGN KEY (`codigo_disciplina`, `codigo_curso`, `ano_semestre`, `matricula_aluno`) REFERENCES `aluno_turma` (`codigo_disciplina`, `codigo_curso`, `ano_semestre`, `matricula_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prova`
--

LOCK TABLES `prova` WRITE;
/*!40000 ALTER TABLE `prova` DISABLE KEYS */;
INSERT INTO `prova` VALUES (1,1,'2010.2',1313,'P1',8.3),(1,1,'2010.2',1313,'P2',9.2),(1,1,'2010.2',1414,'P1',7.2),(1,1,'2010.2',1414,'P2',7.1),(1,1,'2010.2',1515,'P1',9.3),(1,1,'2010.2',1515,'P2',9.2),(1,1,'2010.2',1616,'FINAL',5.2),(1,1,'2010.2',1616,'P1',10.0),(1,1,'2010.2',1616,'P2',3.2),(1,1,'2010.2',1717,'P1',7.2),(1,1,'2010.2',1717,'P2',8.3),(1,1,'2010.2',1818,'P1',9.3),(1,1,'2010.2',1818,'P2',7.2),(1,1,'2010.2',1919,'P1',8.3),(1,1,'2010.2',2020,'P1',9.3),(1,1,'2010.2',2020,'P2',7.2),(1,2,'2010.2',1010,'P1',5.3),(1,2,'2010.2',1010,'P2',9.0),(1,2,'2010.2',1212,'P1',7.2),(1,2,'2010.2',1212,'P2',7.3),(1,2,'2010.2',1313,'FINAL',10.0),(1,2,'2010.2',1313,'P1',2.4),(1,2,'2010.2',1313,'P2',9.0),(1,2,'2010.2',1414,'FINAL',6.2),(1,2,'2010.2',1414,'P1',5.3),(1,2,'2010.2',1414,'P2',5.5),(1,2,'2010.2',1515,'FINAL',6.3),(1,2,'2010.2',1515,'P1',10.0),(1,2,'2010.2',1515,'P2',3.2),(1,2,'2010.2',1616,'P1',7.9),(1,2,'2010.2',1616,'P2',8.3),(1,2,'2010.2',1717,'P1',6.3),(1,2,'2010.2',1717,'P2',8.2),(1,2,'2010.2',1818,'P1',8.4),(1,2,'2010.2',1818,'P2',7.3),(1,2,'2010.2',1919,'P1',7.3),(1,2,'2010.2',1919,'P2',9.3),(1,2,'2010.2',2020,'P1',5.3),(1,2,'2010.2',2020,'P2',9.1),(1,2,'2010.2',2121,'P1',8.3),(1,2,'2010.2',2121,'P2',8.9),(1,2,'2010.2',8888,'P1',8.2),(1,2,'2010.2',8888,'P2',6.7),(2,3,'2010.2',2020,'P2',2.9),(2,3,'2010.2',2020,'P3',4.8),(2,3,'2010.2',2121,'P1',3.5),(2,3,'2010.2',2121,'P2',7.3),(2,3,'2010.2',2121,'P3',9.2),(2,3,'2010.2',2323,'P1',7.1),(2,3,'2010.2',2323,'P2',9.3),(2,3,'2010.2',2323,'P3',6.2),(2,3,'2010.2',2424,'P1',7.3),(2,3,'2010.2',2424,'P2',7.8),(2,3,'2010.2',2424,'P3',6.9),(2,3,'2010.2',2525,'FINAL',9.5),(2,3,'2010.2',2525,'P1',3.4),(2,3,'2010.2',2525,'P2',4.5),(2,3,'2010.2',2525,'P3',7.2),(2,3,'2010.2',2626,'FINAL',4.2),(2,3,'2010.2',2626,'P1',2.3),(2,3,'2010.2',2626,'P2',2.1),(2,3,'2010.2',2626,'P3',0.1),(2,3,'2010.2',2727,'P1',6.8),(2,3,'2010.2',2727,'P2',8.9),(2,3,'2010.2',2727,'P3',9.0),(2,3,'2010.2',2828,'P1',9.0),(2,3,'2010.2',2828,'P2',7.9),(2,3,'2010.2',2828,'P3',8.9),(2,3,'2010.2',2929,'P1',10.0),(2,3,'2010.2',2929,'P2',9.5),(2,3,'2010.2',2929,'P3',9.8),(2,3,'2010.2',3030,'FINAL',7.4),(2,3,'2010.2',3030,'P1',6.3),(3,3,'2010.2',1010,'FINAL',9.2),(3,3,'2010.2',1010,'P1',2.4),(3,3,'2010.2',1010,'P2',5.1),(3,3,'2010.2',1212,'P1',5.6),(3,3,'2010.2',1212,'P2',8.9),(3,3,'2010.2',1313,'FINAL',6.2),(3,3,'2010.2',1313,'P1',2.4),(3,3,'2010.2',1313,'P2',7.1),(3,3,'2010.2',1414,'P1',9.0),(3,3,'2010.2',1414,'P2',9.7),(3,3,'2010.2',1515,'FINAL',10.0),(3,3,'2010.2',1515,'P2',3.7),(3,3,'2010.2',1717,'FINAL',5.7),(3,3,'2010.2',1717,'P1',2.1),(3,3,'2010.2',1717,'P2',4.6),(3,3,'2010.2',1818,'P1',7.8),(3,3,'2010.2',1818,'P2',10.0),(3,3,'2010.2',1919,'FINAL',8.9),(3,3,'2010.2',1919,'P1',2.5),(3,3,'2010.2',1919,'P2',4.6),(3,3,'2010.2',8888,'FINAL',2.1),(3,3,'2010.2',8888,'P1',3.8),(3,3,'2010.2',8888,'P2',0.2),(3,3,'2010.2',9999,'P1',2.4),(3,3,'2010.2',9999,'P2',1.6);
/*!40000 ALTER TABLE `prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `codigo_disciplina` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `ano_semestre` varchar(6) NOT NULL,
  PRIMARY KEY (`codigo_disciplina`,`codigo_curso`,`ano_semestre`),
  KEY `turma_codigo_curso_fk` (`codigo_curso`),
  CONSTRAINT `turma_codigo_curso_fk` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  CONSTRAINT `turma_codigo_disciplina_fk` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,1,'2008.1'),(1,1,'2008.2'),(1,1,'2009.1'),(1,1,'2009.2'),(1,1,'2010.1'),(1,1,'2010.2'),(2,1,'2008.1'),(2,1,'2009.1'),(2,1,'2009.2'),(2,1,'2010.1'),(3,1,'2008.1'),(3,1,'2009.1'),(3,1,'2009.2'),(4,1,'2008.1'),(1,2,'2008.2'),(1,2,'2010.2'),(2,2,'2008.2'),(3,2,'2008.2'),(3,2,'2009.2'),(3,2,'2010.1'),(4,2,'2008.2'),(1,3,'2009.2'),(2,3,'2009.2'),(2,3,'2010.2'),(3,3,'2010.2'),(4,4,'2010.2'),(5,4,'2008.1'),(5,4,'2008.2'),(5,4,'2010.2'),(6,4,'2008.1'),(6,4,'2008.2'),(4,5,'2010.1'),(6,5,'2010.2');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'universidade'
--

--
-- Dumping routines for database 'universidade'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-20 15:30:24
