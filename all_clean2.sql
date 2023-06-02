-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Jun-2023 às 14:13
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `all_clean2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_cartao`
--

CREATE TABLE `cliente_cartao` (
  `id_cliente_cartao` int NOT NULL,
  `numero_cartao` varchar(500) NOT NULL,
  `nome_cartao` varchar(100) NOT NULL,
  `validade_cartao` date NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cliente_cartao`
--

INSERT INTO `cliente_cartao` (`id_cliente_cartao`, `numero_cartao`, `nome_cartao`, `validade_cartao`, `id_usuario`) VALUES
(1, '4317907462930526', 'João', '2026-11-12', 3),
(2, '4589653904992317', 'Emily', '2023-07-21', 4),
(3, '4308012397140159', 'Cabral', '2027-05-12', 5),
(4, '4881336073644761', 'Daniel', '2027-01-14', 6),
(5, '4761685760862135', 'Guilherme', '2025-05-01', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `id_contato` int NOT NULL,
  `id_usuario` int NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL,
  `forma_pagamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id_forma_pagamento`, `forma_pagamento`) VALUES
(1, 'Cartão de Crédito'),
(2, 'PIX');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `id_planos` int NOT NULL,
  `id_usuario` int NOT NULL,
  `data_pedido` date NOT NULL,
  `horario_pedido` time NOT NULL,
  `endereco_pedido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_forma_pagamento` int NOT NULL,
  `status_pedido` varchar(100) NOT NULL,
  `id_cliente_cartao` int DEFAULT NULL,
  `status_pagamento` varchar(500) NOT NULL,
  `qtd_parcelas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_planos`, `id_usuario`, `data_pedido`, `horario_pedido`, `endereco_pedido`, `id_forma_pagamento`, `status_pedido`, `id_cliente_cartao`, `status_pagamento`, `qtd_parcelas`) VALUES
(1, 3, 3, '2023-05-22', '18:25:55', 'Rua Farim Fala Maluf', 1, 'Confirmado', 1, 'Aprovado', 3),
(2, 2, 4, '2023-05-24', '13:28:28', 'Rua 13 de Março', 1, 'Confirmado', 2, 'Aprovado', 10),
(3, 3, 5, '2023-05-26', '13:29:41', 'Rua Andorinhos', 1, 'Confirmado', 3, 'Aprovado', 4),
(4, 2, 6, '2023-05-29', '12:33:20', 'Rua XV de Novembro', 1, 'Confirmado', 4, 'Aprovado', 2),
(5, 1, 7, '2023-05-25', '11:35:40', 'Rua Oxford', 1, 'Confirmado', 5, 'Aprovado', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `planos`
--

CREATE TABLE `planos` (
  `id_planos` int NOT NULL,
  `nome_plano` varchar(100) NOT NULL,
  `descricao_plano` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `valor_plano` decimal(10,2) NOT NULL,
  `peso_plano` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `planos`
--

INSERT INTO `planos` (`id_planos`, `nome_plano`, `descricao_plano`, `valor_plano`, `peso_plano`) VALUES
(1, 'Básico', 'Roupas de algodão, tecidos sintéticos, toalhas de banho e rosto, pijamas e roupas íntimas', '80.00', 5),
(2, 'Intermediário', 'Plano básico + roupas de linho e seda, vestidos e saia, blusas com botões e camisas sociais', '150.00', 10),
(3, 'Avançado', 'Plano Básico + Intermediário + Roupas de lã e cashmere, ternos, vestidos de festa, roupas de couro, camurça, itens de alta costura, remoção de manchas difíceis', '220.00', 16);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nome_usuario` varchar(100) NOT NULL,
  `telefone_usuario` varchar(100) NOT NULL,
  `email_usuario` varchar(100) NOT NULL,
  `senha_usuario` varchar(50) NOT NULL,
  `data_cadastro_usuario` date NOT NULL,
  `cpf_usuario` varchar(100) NOT NULL,
  `endereco_usuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome_usuario`, `telefone_usuario`, `email_usuario`, `senha_usuario`, `data_cadastro_usuario`, `cpf_usuario`, `endereco_usuario`) VALUES
(3, 'Joãozinho', '(48) 961860921', 'joaozinho@gmail.com', '4545', '2023-05-19', '86477088142', ''),
(4, 'Emily', '(48) 967784462', 'emily.castro@gmail.com', '2345', '2023-05-10', '35515484711', ''),
(5, 'Cabral', '(48) 973274393', 'cabral.faria@gmail.com', '2389', '2023-05-11', '14783372730', ''),
(6, 'Daniel ', '(48) 922167322', 'daniel.faria@gmail.com', '6523', '2023-05-12', '84855014206', ''),
(7, 'Guilherme', '(48) 906173400', 'guilherme.faria@gmail.com', '4590', '2023-05-24', '32758833301', ''),
(8, 'Giovana', '(48) 950336207', 'giovana.costa@gmail.com', '8456', '2023-04-01', '19556885838', ''),
(9, 'Juliana', '(48) 986932844', 'juliana.hostosa@gmail.com', '8954', '2023-06-14', '65471815297', ''),
(10, 'Marina ', '(48) 947245862', 'marina.cabelo@gmail.com', '7897', '2023-04-13', '66444898269', ''),
(11, 'Matheus', '(48) 918700318', 'matheus.machado@gmail.com', '7687', '2023-05-09', '04413134699', ''),
(12, 'Beatriz', '(48) 951045879', 'safadinha.bia@gmail.com', '4378', '2023-05-08', '88816873566', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente_cartao`
--
ALTER TABLE `cliente_cartao`
  ADD PRIMARY KEY (`id_cliente_cartao`),
  ADD KEY `fk_id_usuario3` (`id_usuario`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id_contato`),
  ADD KEY `fk_id_usuario2` (`id_usuario`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_forma_pagamento`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_id_planos` (`id_planos`),
  ADD KEY `fk_id_usuario` (`id_usuario`),
  ADD KEY `fk_id_forma_pagamento` (`id_forma_pagamento`),
  ADD KEY `fk_id_cliente_cartao` (`id_cliente_cartao`);

--
-- Índices para tabela `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id_planos`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente_cartao`
--
ALTER TABLE `cliente_cartao`
  MODIFY `id_cliente_cartao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `id_contato` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_forma_pagamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `planos`
--
ALTER TABLE `planos`
  MODIFY `id_planos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente_cartao`
--
ALTER TABLE `cliente_cartao`
  ADD CONSTRAINT `fk_id_usuario3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `contato`
--
ALTER TABLE `contato`
  ADD CONSTRAINT `fk_id_usuario2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_id_cliente_cartao` FOREIGN KEY (`id_cliente_cartao`) REFERENCES `cliente_cartao` (`id_cliente_cartao`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_id_forma_pagamento` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_id_planos` FOREIGN KEY (`id_planos`) REFERENCES `planos` (`id_planos`),
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
