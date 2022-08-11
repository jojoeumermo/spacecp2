-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10-Fev-2017 às 01:13
-- Versão do servidor: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banco`
--
CREATE DATABASE IF NOT EXISTS `banco` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `banco`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `amigos`
--

CREATE TABLE `amigos` (
  `id_amizade` int(11) NOT NULL,
  `id_amigo1` int(11) NOT NULL,
  `id_amigo2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `amigos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `curtidas`
--

CREATE TABLE `curtidas` (
  `id_curtida` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `curtidas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `id_de` int(11) NOT NULL,
  `id_para` int(11) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `lido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagens`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagens`
--

CREATE TABLE `postagens` (
  `id_post` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fotoPost` text NOT NULL,
  `conteudo` text CHARACTER SET utf16 NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `postagens`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacoes`
--

CREATE TABLE `solicitacoes` (
  `id_solicitacao` int(11) NOT NULL,
  `id_usuario1` int(11) NOT NULL,
  `id_usuario2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `solicitacoes`
--
-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL DEFAULT '',
  `nome` varchar(200) CHARACTER SET utf8 NOT NULL,
  `email` varchar(200) NOT NULL,
  `horario` datetime NOT NULL,
  `limite` datetime NOT NULL,
  `senha` varchar(200) NOT NULL,
  `nascimento` date NOT NULL,
  `cidade` varchar(256) NOT NULL DEFAULT '',
  `profissao` varchar(200) NOT NULL DEFAULT '',
  `blocks` varchar(200) NOT NULL DEFAULT '',
  `sexo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `foto`, `nome`, `email`, `horario`, `limite`, `senha`, `nascimento`, `cidade`, `profissao`, `blocks`, `sexo`) VALUES
(1, '', 'Marcos', 'lucas.designer@hotmail.com.br', '2017-02-06 02:33:28', '2017-02-09 00:49:27', '123', '0000-00-00', '', '', '', 0),
(2, '9dfd4ec460e7b73f1b62ebb7cec75a76.jpg', 'THX b13', 'joao@hotmail.com', '2017-02-09 04:37:39', '2017-02-09 04:54:37', '123', '2000-11-07', 'SALVADOR', 'Programador', '', 0),
(4, '', 'Milena', '', '2017-02-10 00:00:00', '2017-02-24 00:00:00', '', '2017-02-25', '', '', '', 0),
(13, 'default.jpg', 'Thiaguinho', 'thiago.nogueira187@gmail.com', '2017-02-09 00:53:07', '2017-02-09 00:54:23', 'Hamburg', '2017-02-06', 'Hamburg', 'programador', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`id_amizade`);

--
-- Indexes for table `curtidas`
--
ALTER TABLE `curtidas`
  ADD PRIMARY KEY (`id_curtida`);

--
-- Indexes for table `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postagens`
--
ALTER TABLE `postagens`
  ADD PRIMARY KEY (`id_post`);

--
-- Indexes for table `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD PRIMARY KEY (`id_solicitacao`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amigos`
--
ALTER TABLE `amigos`
  MODIFY `id_amizade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `curtidas`
--
ALTER TABLE `curtidas`
  MODIFY `id_curtida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `postagens`
--
ALTER TABLE `postagens`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `solicitacoes`
--
ALTER TABLE `solicitacoes`
  MODIFY `id_solicitacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;


ALTER TABLE `solicitacoes`
  ADD FOREIGN KEY (`id_usuario1`) REFERENCES `usuarios`(`id`);

ALTER TABLE `solicitacoes`
  ADD FOREIGN KEY (`id_usuario2`) REFERENCES `usuarios`(`id`);

ALTER TABLE `amigos`
  ADD FOREIGN KEY (`id_amigo1`) REFERENCES `usuarios`(`id`);

ALTER TABLE `amigos`
  ADD FOREIGN KEY (`id_amigo2`) REFERENCES `usuarios`(`id`);

ALTER TABLE `postagens`
  ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`);

ALTER TABLE `mensagens`
  ADD FOREIGN KEY (`id_de`) REFERENCES `usuarios`(`id`);

ALTER TABLE `mensagens`
  ADD FOREIGN KEY (`id_para`) REFERENCES `usuarios`(`id`);

ALTER TABLE `curtidas`
  ADD FOREIGN KEY (`id_post`) REFERENCES `postagens`(`id_post`);

ALTER TABLE `curtidas`
  ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`);

