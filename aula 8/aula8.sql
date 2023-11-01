-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/10/2023 às 02:47
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
-- Banco de dados: `aula8`
--
CREATE DATABASE IF NOT EXISTS `aula8` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `aula8`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(1, 'Aventura'),
(2, 'Futebol'),
(3, 'RPG');

-- --------------------------------------------------------

--
-- Estrutura para tabela `foto`
--

CREATE TABLE `foto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `jogo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `foto`
--

INSERT INTO `foto` (`id`, `descricao`, `foto`, `jogo_id`) VALUES
(1, 'Imagem 1', 'https://img.olhardigital.com.br/wp-content/uploads/2023/03/gta-5-gta-online.jpg', 1),
(2, 'Imagem 2', 'https://i.ytimg.com/vi/2kVFlqhucrE/maxresdefault.jpg', 1),
(3, 'Imagem 1', 'https://upload.wikimedia.org/wikipedia/pt/1/12/DiabloIIIcover.jpg', 2),
(4, 'Imagem 2', 'https://adrenaline.com.br/uploads/2023/07/11/77043/Diablo_3_nova_temporada_Reino_de_Testes_PC_12_de_julho_-_01.jpg', 2),
(5, 'Imagem 1', 'http://playstationbr.com/wp-content/gallery/witcher3/2559202-the_witcher_3_wild_hunt_geralt_ready_to_deliver_the_final_blow.png', 3),
(6, 'Imagem 2', 'https://2.bp.blogspot.com/-Y5nkN2QquFQ/VWkPVfJ-NXI/AAAAAAAAAy8/KkrUR5guuew/s1600/NFR7xCi.jpg', 3),
(7, 'Imagem 1', 'https://overplay.com.br/wp-content/uploads/2023/07/overplay-fifa23s.jpg', 4),
(8, 'Imagem 2', 'https://media.contentapi.ea.com/content/dam/ea/fifa/fifa-23/authenticity/common/f23-auth-featured-16x9.jpg.adapt.crop16x9.1023w.jpg', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo`
--

CREATE TABLE `jogo` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `jogo`
--

INSERT INTO `jogo` (`id`, `nome`, `descricao`, `categoria_id`) VALUES
(1, 'Grand Theft Auto V', 'Série de roubar carros volta a Los Santos, cidade baseada em Los Angeles, para muita praia e mais crimes.', 1),
(2, 'Diablo III', 'Continuação autêntica do RPG de ação mantém raízes, com multiplayer online e gráficos de ponta.', 3),
(3, 'The Witcher 3: Wild Hunt', 'O feiticeiro Geralt recupera sua memória e se diz cansado de ajudar os outros e parte em busca de seus entes queridos.', 1),
(4, 'Fifa 23', 'A nova versão do jogo de futebol da Electronic Arts tem, entre outras novidades, a estreia das ligas de clubes femininos.', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `data` date DEFAULT NULL,
  `hora` time NOT NULL,
  `resumo` varchar(250) DEFAULT NULL,
  `texto` text DEFAULT NULL,
  `jogo_id` int(11) NOT NULL,
  `foto` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `noticia`
--

INSERT INTO `noticia` (`id`, `titulo`, `data`, `hora`, `resumo`, `texto`, `jogo_id`, `foto`) VALUES
(1, 'GTA 5: jogador completa o jogo de forma pacifista após 3 anos', '2023-10-05', '15:10:15', 'Matthew demorou 3 anos, mais especificamente 1227 dias, para chegar ao final dos créditos do título com esse objetivo de matar ou machucar o menor número de NPCs possível.', 'O rapaz iniciou sua aventura em maio de 2019 e gravou mais de mil horas de gameplay, passando por todas as missões de história e evitando todos os assassinatos que conseguia. De acordo com suas próprias regras, apenas eliminações necessárias para a trama avançar seriam feitas.', 1, 'https://tm.ibxk.com.br/2023/10/04/04121226719179.jpg?ims=704x264'),
(2, 'Ainda falta algum tempo para conseguir jogar o novo \'GTA\'', '2023-10-03', '23:15:21', 'Rockstar Games foi recentemente alvo de um ataque informático que revelou dezenas de vídeos que mostram o novo ‘GTA’ ainda em desenvolvimento. Porém, parece que esta não é a única informação a surgir sobre o próximo jogo da série.', 'Adrien Perea, conhecido por desvendar informações antecipadamente sobre outros jogos da Rockstar Games, afirma na respetiva página de Twitter (via GameRant) que o novo ‘GTA’ só tem lançamento previsto para 2025.\n\nTendo em conta que os vídeos que foram revelados recentemente mostram uma versão inacabada do jogo, é bastante provável que a Rockstar Games queira levar o seu tempo a produzir esta continuação de ‘GTA V’.', 1, 'https://s2.glbimg.com/kh2Pt-BCO7Lxrin9Y3d7DvcXjk8=/400x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/w/s/8XiX8HTpu3SEz9PAwPdg/gta-6-leak.png'),
(3, '\"Diablo III\" já vendeu mais de 30 milhões de unidades', '2023-09-05', '13:51:11', '\"Diablo III\" recebeu críticas no lançamento, mas foi aprimorado com o passar dos anos', 'O RPG de ação \"Diablo III\" já vendeu mais de 30 milhões de unidades desde que foi lançado para PC em maio de 2012. Os números foram divulgados pela publisher Activision Blizzard em seu mais recente relatório fiscal.', 2, 'http://imguol.com/c/entretenimento/64/2015/08/05/diablo-iii-1438796060899_615x300.jpg'),
(4, 'Witcher 3 vai cobrar impostos de jogador que ganhar dinheiro desonestamente', '2023-10-06', '09:37:35', 'Na expansão Hearts of Stone, o jogador pode ser surpreendido por um cobrador de impostos.', 'O game \'The Witcher 3: Wild Hunt\' vai cobrar impostos de jogadores que não mantiveram sua total honestidade e venderam couros por um preço mais alto, pechincharam conchas para vender as pérolas bem mais caras depois ou que tenham roubado algo de alguém para vender.', 3, 'http://olhardigital.uol.com.br/uploads/acervo_imagens/2015/05/20150515123411_660_420.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plataforma`
--

CREATE TABLE `plataforma` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `plataforma`
--

INSERT INTO `plataforma` (`id`, `nome`) VALUES
(1, 'PC'),
(2, 'Playstation 4'),
(3, 'Xbox One'),
(4, 'Playstation 3'),
(5, 'Xbox 360');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plataforma_jogo`
--

CREATE TABLE `plataforma_jogo` (
  `id` int(11) NOT NULL,
  `plataforma_id` int(11) NOT NULL,
  `jogo_id` int(11) NOT NULL,
  `foto_capa` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `plataforma_jogo`
--

INSERT INTO `plataforma_jogo` (`id`, `plataforma_id`, `jogo_id`, `foto_capa`) VALUES
(1, 1, 2, 'http://ps3media.ign.com/ps3/image/object/714/714955/Diablo-3_PC_US_ESRB-fin.jpg'),
(2, 2, 1, 'http://ecx.images-amazon.com/images/I/916T5H6sCtL._SL1500_.jpg'),
(3, 2, 2, 'https://http2.mlstatic.com/D_NQ_NP_998983-MLB51507403943_092023-W.jpg'),
(4, 2, 3, 'http://oyster.ignimgs.com/wordpress/stg.ign.com/2015/05/81PnhUL9EpL._SL1500_-720x899.jpg'),
(5, 3, 2, 'http://ecx.images-amazon.com/images/I/7148dUWSRdL._SL1000_.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foto_jogo1_idx` (`jogo_id`);

--
-- Índices de tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jogo_categoria1_idx` (`categoria_id`);

--
-- Índices de tabela `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_noticia_jogo1_idx` (`jogo_id`);

--
-- Índices de tabela `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `plataforma_jogo`
--
ALTER TABLE `plataforma_jogo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtora_has_jogo_jogo1_idx` (`jogo_id`),
  ADD KEY `fk_produtora_has_jogo_produtora1_idx` (`plataforma_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `foto`
--
ALTER TABLE `foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `jogo`
--
ALTER TABLE `jogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `plataforma_jogo`
--
ALTER TABLE `plataforma_jogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_foto_jogo1` FOREIGN KEY (`jogo_id`) REFERENCES `jogo` (`id`);

--
-- Restrições para tabelas `jogo`
--
ALTER TABLE `jogo`
  ADD CONSTRAINT `fk_jogo_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

--
-- Restrições para tabelas `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `fk_noticia_jogo1` FOREIGN KEY (`jogo_id`) REFERENCES `jogo` (`id`);

--
-- Restrições para tabelas `plataforma_jogo`
--
ALTER TABLE `plataforma_jogo`
  ADD CONSTRAINT `fk_produtora_has_jogo_jogo1` FOREIGN KEY (`jogo_id`) REFERENCES `jogo` (`id`),
  ADD CONSTRAINT `fk_produtora_has_jogo_produtora1` FOREIGN KEY (`plataforma_id`) REFERENCES `plataforma` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
