-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/09/2023 às 23:48
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ex2`
--
CREATE DATABASE IF NOT EXISTS `ex2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ex2`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `num_matricula` int(11) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `id_turmas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `num_matricula`, `endereco`, `telefone`, `id_turmas`) VALUES
(1, 'Arthur', 21, 'Rua X', '56432189017', 2),
(2, 'Mario', 22, 'Rua Y', '78986512345', 1),
(3, 'Diego', 23, 'Rua D', '65777213451', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nacionalidade` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `autores`
--

INSERT INTO `autores` (`id`, `nome`, `nacionalidade`) VALUES
(1, 'João', 'Brasil'),
(2, 'Thomas', 'Brasil'),
(3, 'Carlos', 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores_livros`
--

CREATE TABLE `autores_livros` (
  `id` int(11) NOT NULL,
  `id_autores` int(11) NOT NULL,
  `id_livros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `autores_livros`
--

INSERT INTO `autores_livros` (`id`, `id_autores`, `id_livros`) VALUES
(1, 3, 2),
(2, 1, 1),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `valor_multa` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `id_aluno`, `data_emprestimo`, `data_devolucao`, `data_entrega`, `valor_multa`) VALUES
(1, 1, '2023-09-04', '2023-10-04', '2023-10-03', 0),
(2, 3, '2023-08-09', '2023-09-09', '2023-09-08', 0),
(3, 2, '2023-07-02', '2023-08-02', '2023-08-08', 25);

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos_livros`
--

CREATE TABLE `emprestimos_livros` (
  `id` int(11) NOT NULL,
  `id_emprestimos` int(11) NOT NULL,
  `id_livros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `emprestimos_livros`
--

INSERT INTO `emprestimos_livros` (`id`, `id_emprestimos`, `id_livros`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `paginas` int(11) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `linguagem` varchar(100) NOT NULL,
  `editora` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id`, `nome`, `paginas`, `materia`, `linguagem`, `editora`) VALUES
(1, 'livro desenvolvendo Php', 50, 'Php', 'Português', 'Developer'),
(2, 'Conceitos do Algoritmo', 75, 'Algoritmos', 'Português', 'Visualg'),
(3, 'Banco de dados e sua construção', 125, 'Banco de dados', 'Português', 'SI');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `num_turma` int(11) NOT NULL,
  `nome_curso` varchar(30) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `sala_aula` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id`, `num_turma`, `nome_curso`, `data_inicio`, `data_termino`, `sala_aula`) VALUES
(1, 23, 'Banco de dados', '2023-08-01', '2024-08-01', 'Laboratório 1'),
(2, 25, 'Algoritmos', '2024-08-02', '2025-08-01', 'Laboratório 2'),
(3, 26, 'Php', '2023-08-08', '2023-08-23', 'Sala 15');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_turmas`);

--
-- Índices de tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `autores_livros`
--
ALTER TABLE `autores_livros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_autores`),
  ADD KEY `fk3` (`id_livros`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk6` (`id_aluno`);

--
-- Índices de tabela `emprestimos_livros`
--
ALTER TABLE `emprestimos_livros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk4` (`id_emprestimos`),
  ADD KEY `fk5` (`id_livros`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `autores_livros`
--
ALTER TABLE `autores_livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `emprestimos_livros`
--
ALTER TABLE `emprestimos_livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_turmas`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `autores_livros`
--
ALTER TABLE `autores_livros`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_autores`) REFERENCES `autores` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id`);

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `fk6` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`);

--
-- Restrições para tabelas `emprestimos_livros`
--
ALTER TABLE `emprestimos_livros`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_emprestimos`) REFERENCES `emprestimos` (`id`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
