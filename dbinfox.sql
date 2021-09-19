-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18-Set-2021 às 15:01
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbinfox`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbclientes`
--

DROP TABLE IF EXISTS `tbclientes`;
CREATE TABLE IF NOT EXISTS `tbclientes` (
  `idcli` int NOT NULL AUTO_INCREMENT,
  `nomecli` varchar(50) NOT NULL,
  `endcli` varchar(100) DEFAULT NULL,
  `fonecli` varchar(50) NOT NULL,
  `emailcli` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcli`)
);

--
-- Extraindo dados da tabela `tbclientes`
--

INSERT INTO `tbclientes` (`idcli`, `nomecli`, `endcli`, `fonecli`, `emailcli`) VALUES
(1, 'Linus Torvalds', 'Rua Tux, 2015', '9999-9999', 'linus@linux.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbos`
--

DROP TABLE IF EXISTS `tbos`;
CREATE TABLE IF NOT EXISTS `tbos` (
  `os` int NOT NULL AUTO_INCREMENT,
  `data_os` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `equipamento` varchar(150) NOT NULL,
  `defeito` varchar(150) NOT NULL,
  `servico` varchar(150) DEFAULT NULL,
  `tecnico` varchar(30) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `idcli` int NOT NULL,
  PRIMARY KEY (`os`),
  KEY `idcli` (`idcli`)
);

--
-- Extraindo dados da tabela `tbos`
--

INSERT INTO `tbos` (`os`, `data_os`, `equipamento`, `defeito`, `servico`, `tecnico`, `valor`, `idcli`) VALUES
(1, '2021-09-16 18:42:44', 'Notebook', 'Não liga', 'Troca da fonte', 'Ze', '400.50', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuarios`
--

DROP TABLE IF EXISTS `tbusuarios`;
CREATE TABLE IF NOT EXISTS `tbusuarios` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `fone` varchar(15) DEFAULT NULL,
  `login` varchar(15) NOT NULL,
  `senha` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `login` (`login`)
);

--
-- Extraindo dados da tabela `tbusuarios`
--

INSERT INTO `tbusuarios` (`iduser`, `usuario`, `fone`, `login`, `senha`) VALUES
(1, 'admin', '8888-8888', 'admin', '123'),
(2, 'José de Assis', '8888-8888', 'joseassis', '123'),
(3, 'Bill Gates', '8888-8888', 'bill', '123456');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbos`
--
ALTER TABLE `tbos`
  ADD CONSTRAINT `tbos_ibfk_1` FOREIGN KEY (`idcli`) REFERENCES `tbclientes` (`idcli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
