-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Tempo de geração: 22/08/2023 às 01:22
-- Versão do servidor: 5.7.39
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ex1`
--
CREATE DATABASE IF NOT EXISTS `ex1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ex1`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `endereco`, `telefone`) VALUES
(1, 'Fernando', '12345678901', 'Rua Logo ali', '56432189017'),
(2, 'Diego Macedo', '87650023212', 'Rua Tabajara', '78986512345'),
(3, 'Lucas', '67345900876', 'Rua Peixes', '65777213451');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `lugar_fab` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `marcas`
--

INSERT INTO `marcas` (`id`, `nome`, `lugar_fab`) VALUES
(1, 'BMW', 'Alemanha'),
(2, 'Ferrari', 'Itália'),
(3, 'Jaguar', 'Inglaterra');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `id_marcas` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `cor` varchar(100) NOT NULL,
  `ano_fab` year(4) NOT NULL,
  `ano_modelo` year(4) NOT NULL,
  `valor_compra` float NOT NULL,
  `valor_venda` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `placa`, `id_marcas`, `modelo`, `cor`, `ano_fab`, `ano_modelo`, `valor_compra`, `valor_venda`) VALUES
(4, 'NEP2525', 1, '316i 1.6 TB 16V 136cv 4p', 'Branco', 2014, 2014, 83473, 100350),
(5, 'NCC0709', 2, 'F430 SCUDERIA F1', 'Vermelha', 2008, 2008, 1036520, 1250000),
(6, 'GOY0818', 3, 'F-Type R AWD Supercharged Coupe 5.0 V8', 'Cinza', 2016, 2016, 523345, 650000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `id_veiculos` int(11) NOT NULL,
  `id_clientes` int(11) NOT NULL,
  `id_vendedores` int(11) NOT NULL,
  `data` date NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `id_veiculos`, `id_clientes`, `id_vendedores`, `data`, `valor`) VALUES
(1, 6, 2, 4, '2023-08-14', 120000),
(2, 5, 1, 6, '2023-08-29', 125000),
(3, 4, 3, 5, '2023-08-10', 600000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_entrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `vendedores`
--

INSERT INTO `vendedores` (`id`, `nome`, `cpf`, `data_entrada`) VALUES
(4, 'Julia', '09876543211', '2013-08-25'),
(5, 'Maria', '23456789013', '2003-07-13'),
(6, 'João', '56789012344', '2016-06-29');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_marcas`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_clientes`),
  ADD KEY `fk3` (`id_veiculos`),
  ADD KEY `fk4` (`id_vendedores`);

--
-- Índices de tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_marcas`) REFERENCES `marcas` (`id`);

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_veiculos`) REFERENCES `veiculos` (`id`),
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_vendedores`) REFERENCES `vendedores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
