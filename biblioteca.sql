CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `data_nascimento` varchar(45) DEFAULT NULL,
  `tel_res` varchar(45) DEFAULT NULL,
  `tel_cel` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `rua` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_has_livro`
--

DROP TABLE IF EXISTS `aluno_has_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_has_livro` (
  `id_emprestimo` int NOT NULL,
  `data_emprestimo` varchar(45) DEFAULT NULL,
  `data_devolucao` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `FUNCIONARIO_id_funcionario` int NOT NULL,
  `FUNCIONARIO_CARGOS_id_cargo` int NOT NULL,
  `ALUNO_id_aluno` int NOT NULL,
  `LIVRO_id_livro` int NOT NULL,
  `LIVRO_EDITORA_id_editora` int NOT NULL,
  PRIMARY KEY (`id_emprestimo`,`FUNCIONARIO_id_funcionario`,`FUNCIONARIO_CARGOS_id_cargo`,`ALUNO_id_aluno`,`LIVRO_id_livro`,`LIVRO_EDITORA_id_editora`),
  KEY `fk_ALUNO_has_LIVRO_FUNCIONARIO1_idx` (`FUNCIONARIO_id_funcionario`,`FUNCIONARIO_CARGOS_id_cargo`),
  KEY `fk_ALUNO_has_LIVRO_ALUNO1_idx` (`ALUNO_id_aluno`),
  KEY `fk_EMPRESTIMO_LIVRO1_idx` (`LIVRO_id_livro`,`LIVRO_EDITORA_id_editora`),
  CONSTRAINT `fk_ALUNO_has_LIVRO_ALUNO1` FOREIGN KEY (`ALUNO_id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `fk_ALUNO_has_LIVRO_FUNCIONARIO1` FOREIGN KEY (`FUNCIONARIO_id_funcionario`, `FUNCIONARIO_CARGOS_id_cargo`) REFERENCES `funcionario` (`id_funcionario`, `CARGOS_id_cargo`),
  CONSTRAINT `fk_EMPRESTIMO_LIVRO1` FOREIGN KEY (`LIVRO_id_livro`, `LIVRO_EDITORA_id_editora`) REFERENCES `livro` (`id_livro`, `EDITORA_id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_has_livro`
--

LOCK TABLES `aluno_has_livro` WRITE;
/*!40000 ALTER TABLE `aluno_has_livro` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_has_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) DEFAULT NULL,
  `salario` varchar(45) DEFAULT NULL,
  `carga_horaria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Bibliotecario','2000','44'),(2,'Gerente','6000','44');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `id_editora` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `rua` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplar`
--

DROP TABLE IF EXISTS `exemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemplar` (
  `id_exemplar` int NOT NULL AUTO_INCREMENT,
  `id_livro` varchar(45) DEFAULT NULL,
  `estado_conservacao` varchar(45) DEFAULT NULL,
  `disponibilidade` varchar(45) DEFAULT NULL,
  `LIVRO_id_livro` int NOT NULL,
  `LIVRO_EDITORA_id_editora` int NOT NULL,
  PRIMARY KEY (`id_exemplar`,`LIVRO_id_livro`,`LIVRO_EDITORA_id_editora`),
  KEY `fk_EXEMPLAR_LIVRO1_idx` (`LIVRO_id_livro`,`LIVRO_EDITORA_id_editora`),
  CONSTRAINT `fk_EXEMPLAR_LIVRO1` FOREIGN KEY (`LIVRO_id_livro`, `LIVRO_EDITORA_id_editora`) REFERENCES `livro` (`id_livro`, `EDITORA_id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplar`
--

LOCK TABLES `exemplar` WRITE;
/*!40000 ALTER TABLE `exemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `data_admissao` varchar(45) DEFAULT NULL,
  `CARGOS_id_cargo` int NOT NULL,
  PRIMARY KEY (`id_funcionario`,`CARGOS_id_cargo`),
  KEY `fk_FUNCIONARIO_CARGOS1_idx` (`CARGOS_id_cargo`),
  CONSTRAINT `fk_FUNCIONARIO_CARGOS1` FOREIGN KEY (`CARGOS_id_cargo`) REFERENCES `cargos` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Andre Roberto','2025-4-30',1),(2,'Paulo Jose','2025-4-15',2),(3,'Kaique Santos','2025-4-30',1),(4,'Adriano Alvares','2025-4-22',1),(5,'Guilherme dos Anjos','2025-4-15',1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `autor` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `ano_publicacao` varchar(45) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `id_editora` varchar(45) DEFAULT NULL,
  `EDITORA_id_editora` int NOT NULL,
  PRIMARY KEY (`id_livro`,`EDITORA_id_editora`),
  KEY `fk_LIVRO_EDITORA1_idx` (`EDITORA_id_editora`),
  CONSTRAINT `fk_LIVRO_EDITORA1` FOREIGN KEY (`EDITORA_id_editora`) REFERENCES `editora` (`id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'biblioteca'
--

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 22:47:22
