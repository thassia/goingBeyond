-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 26-Nov-2020 às 20:25
-- Versão do servidor: 5.7.11
-- PHP Version: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cadprofessor`
--

CREATE TABLE `tbl_cadprofessor` (
  `id_prof` smallint(6) NOT NULL,
  `formação` varchar(20) NOT NULL,
  `faculdade` varchar(30) NOT NULL,
  `idusuario` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cadusuario`
--

CREATE TABLE `tbl_cadusuario` (
  `id_usuario` smallint(6) NOT NULL,
  `tipo_usuario` varchar(2) DEFAULT NULL,
  `nome` varchar(15) NOT NULL,
  `sobrenome` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `genero` varchar(2) NOT NULL,
  `telefone` smallint(6) DEFAULT NULL,
  `dataNasc` date NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_disciplina`
--

CREATE TABLE `tbl_disciplina` (
  `id_disciplina` smallint(6) NOT NULL,
  `nome_disciplina` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_discusuario`
--

CREATE TABLE `tbl_discusuario` (
  `id_disciplina` smallint(6) DEFAULT NULL,
  `id_usuario` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cadprofessor`
--
ALTER TABLE `tbl_cadprofessor`
  ADD PRIMARY KEY (`id_prof`),
  ADD KEY `fk_IdUsuario` (`idusuario`);

--
-- Indexes for table `tbl_cadusuario`
--
ALTER TABLE `tbl_cadusuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `tbl_disciplina`
--
ALTER TABLE `tbl_disciplina`
  ADD PRIMARY KEY (`id_disciplina`);

--
-- Indexes for table `tbl_discusuario`
--
ALTER TABLE `tbl_discusuario`
  ADD KEY `fk_id_disciplina` (`id_disciplina`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cadprofessor`
--
ALTER TABLE `tbl_cadprofessor`
  MODIFY `id_prof` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_cadusuario`
--
ALTER TABLE `tbl_cadusuario`
  MODIFY `id_usuario` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_disciplina`
--
ALTER TABLE `tbl_disciplina`
  MODIFY `id_disciplina` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbl_cadprofessor`
--
ALTER TABLE `tbl_cadprofessor`
  ADD CONSTRAINT `fk_IdUsuario` FOREIGN KEY (`idusuario`) REFERENCES `tbl_cadusuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tbl_discusuario`
--
ALTER TABLE `tbl_discusuario`
  ADD CONSTRAINT `fk_id_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `tbl_disciplina` (`id_disciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_cadusuario` (`id_usuario`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
