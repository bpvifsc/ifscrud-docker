-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2022 at 12:38 PM
-- Server version: 8.0.29-0ubuntu0.22.04.2
-- PHP Version: 8.1.2

USE IFSCrud;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `IFSCrud`
--

-- --------------------------------------------------------

--
-- Table structure for table `alunos`
--

CREATE TABLE `alunos` (
  `id` int NOT NULL,
  `nome` varchar(512) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `email`, `telefone`) VALUES
(1, 'José Maria Castro', 'jcj@gmail.com', '+55(48)99999-9999'),
(2, 'José Joaquim Jamil', 'jjj@gmail.com', '489999999'),
(3, 'Maria Marta Monteiro', 'mmm@gmail.com', '47988899999'),
(4, 'Otávio Olinto Oliveira', 'ooo@gmail.com', '489888989899'),
(5, 'Carlos Castro Camargo', 'ccc@gmail.com', '4888988989');

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `descricao` text NOT NULL,
  `tipo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nome`, `descricao`, `tipo`) VALUES
(1, 'CT Desenvolvimento de Sistemas', 'Curso Técnico em Desenvolvimento de Sistemas', 1),
(2, 'CST Gestão de TI', 'Curso Superior em Gestão de Tecnologia da Informação', 2);

-- --------------------------------------------------------

--
-- Table structure for table `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `cursos_id` int NOT NULL,
  `fase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `disciplinas`
--

INSERT INTO `disciplinas` (`id`, `nome`, `cursos_id`, `fase`) VALUES
(1, 'IHC', 1, 1),
(2, 'Programação I', 1, 2),
(3, 'Banco de Dados', 1, 3),
(4, 'Algoritmos', 2, 1),
(5, 'POO', 2, 2),
(6, 'Eng. de Software', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `matriculas`
--

CREATE TABLE `matriculas` (
  `id` int NOT NULL,
  `alunos_id` int NOT NULL,
  `cursos_id` int NOT NULL,
  `disciplinas_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `matriculas`
--

INSERT INTO `matriculas` (`id`, `alunos_id`, `cursos_id`, `disciplinas_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 2, 2, 4),
(5, 2, 2, 5),
(6, 3, 2, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cursos_id` (`cursos_id`);

--
-- Indexes for table `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alunos_id` (`alunos_id`),
  ADD KEY `cursos_id` (`cursos_id`),
  ADD KEY `disciplinas_id` (`disciplinas_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`);

--
-- Constraints for table `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`disciplinas_id`) REFERENCES `disciplinas` (`id`),
  ADD CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`alunos_id`) REFERENCES `alunos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
