-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/03/2019 às 01:01
-- Versão do servidor: 10.1.37-MariaDB
-- Versão do PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: ` tdiweb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `payment_method`
--

INSERT INTO `payment_method` (`id`, `description`) VALUES
(1, 'Dinheiro'),
(2, 'Cartão de Crédito');

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_drink`
--

CREATE TABLE `product_drink` (
  `id` int(10) NOT NULL,
  `description` varchar(150) NOT NULL,
  `volume_ml` int(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_unity` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `product_drink`
--

INSERT INTO `product_drink` (`id`, `description`, `volume_ml`, `quantity`, `price_unity`) VALUES
(1, 'Nenhum', 0, 0, '0.00'),
(2, 'Lata de Coca-cola', 350, 12, '5.65'),
(3, 'Lata Kuat Guaraná', 220, 5, '4.99'),
(4, 'Coca-Cola Original', 600, 7, '5.78'),
(5, 'Coca-cola Garrafa', 2000, 4, '6.75');

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_pasta`
--

CREATE TABLE `product_pasta` (
  `id` int(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price_unity` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `product_pasta`
--

INSERT INTO `product_pasta` (`id`, `name`, `quantity`, `price_unity`) VALUES
(1, 'PAN PIZZA', 20, '15.99'),
(2, 'MASSA FINA', 20, '17.85'),
(3, 'MASSA TRADICIONAL', 19, '18.99'),
(4, 'BORDA RECHEADA', 20, '19.99');

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_pizza`
--

CREATE TABLE `product_pizza` (
  `id` int(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `product_pizza`
--

INSERT INTO `product_pizza` (`id`, `name`, `description`, `price`) VALUES
(1, 'MUSSARELA', 'Exclusiva mussarela do Pizza Hut servida sobre molho de tomate especial.', '12.00'),
(2, 'NAPOLITANA', 'Tomate fatiado, mussarela e orégano.', '13.65'),
(3, 'PORTUGUESA', 'Mussarela, presunto, azeitona e cebola.', '14.65'),
(4, 'CALABRESA', 'Mussarela, calabresa, cebola e azeitona.', '15.30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `profile_users`
--

CREATE TABLE `profile_users` (
  `id` int(10) NOT NULL,
  `profile_user` int(10) NOT NULL,
  `phone_01` int(10) NOT NULL,
  `phone_02` int(10) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `address_number` int(11) NOT NULL,
  `Observation` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `profile_users`
--

INSERT INTO `profile_users` (`id`, `profile_user`, `phone_01`, `phone_02`, `address`, `address_number`, `Observation`) VALUES
(3, 3, 99999999, NULL, 'Rua X', 430, 'Apt. 305');

-- --------------------------------------------------------

--
-- Estrutura para tabela `request_product`
--

CREATE TABLE `request_product` (
  `id` int(10) NOT NULL,
  `request_user` int(10) NOT NULL,
  `product_item` int(10) NOT NULL,
  `product_pasta` int(10) NOT NULL,
  `product_drink` int(11) NOT NULL,
  `product_size` int(10) NOT NULL,
  `observation` varchar(150) NOT NULL,
  `payment_method` int(10) NOT NULL,
  `total_price` decimal(5,2) NOT NULL,
  `date_request` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `request_product`
--

INSERT INTO `request_product` (`id`, `request_user`, `product_item`, `product_pasta`, `product_drink`, `product_size`, `observation`, `payment_method`, `total_price`, `date_request`) VALUES
(1, 3, 4, 3, 1, 2, 'Com muita cebola ', 1, '39.29', '2019-03-28 23:30:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `size_pizza`
--

CREATE TABLE `size_pizza` (
  `id` int(9) NOT NULL,
  `description` varchar(50) NOT NULL,
  `price_size` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `size_pizza`
--

INSERT INTO `size_pizza` (`id`, `description`, `price_size`) VALUES
(1, 'Pequena', '3.00'),
(2, 'Média', '5.00'),
(3, 'Grande', '6.00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `stock_product`
--

CREATE TABLE `stock_product` (
  `id` int(10) NOT NULL,
  `product_pasta` int(10) NOT NULL,
  `product_drink` int(10) NOT NULL,
  `date_stock_out` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `stock_product`
--

INSERT INTO `stock_product` (`id`, `product_pasta`, `product_drink`, `date_stock_out`) VALUES
(1, 3, 1, '2019-03-28 23:59:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `type_user`
--

CREATE TABLE `type_user` (
  `id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `type_user`
--

INSERT INTO `type_user` (`id`, `description`) VALUES
(1, 'Comum'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(9) NOT NULL,
  `login` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `date_register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type_user` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `password`, `date_register`, `last_login`, `type_user`) VALUES
(1, 'João', 'Joao@gmail.com', 'jo1010', '2019-03-28 23:00:57', '0000-00-00 00:00:00', 2),
(2, 'Maria', 'Maria@gmail.com', 'ma2523', '2019-03-28 23:00:57', '0000-00-00 00:00:00', 2),
(3, 'Thiago', 'Thiago@gmail.com', 'thi1010', '2019-03-28 23:00:57', '0000-00-00 00:00:00', 2);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `product_drink`
--
ALTER TABLE `product_drink`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `product_pasta`
--
ALTER TABLE `product_pasta`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `product_pizza`
--
ALTER TABLE `product_pizza`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `profile_users`
--
ALTER TABLE `profile_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_01` (`phone_01`),
  ADD UNIQUE KEY `phone_02` (`phone_02`),
  ADD KEY `profile_user` (`profile_user`);

--
-- Índices de tabela `request_product`
--
ALTER TABLE `request_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_product` (`product_item`),
  ADD KEY `request_payment_method` (`payment_method`),
  ADD KEY `request_product_drink` (`product_drink`),
  ADD KEY `request_user` (`request_user`),
  ADD KEY `request_pasta` (`product_pasta`),
  ADD KEY `request_product_size` (`product_size`);

--
-- Índices de tabela `size_pizza`
--
ALTER TABLE `size_pizza`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `stock_product`
--
ALTER TABLE `stock_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_product_pasta` (`product_pasta`),
  ADD KEY `stock_product_drink` (`product_drink`);

--
-- Índices de tabela `type_user`
--
ALTER TABLE `type_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`,`email`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `product_drink`
--
ALTER TABLE `product_drink`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `product_pasta`
--
ALTER TABLE `product_pasta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `product_pizza`
--
ALTER TABLE `product_pizza`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `profile_users`
--
ALTER TABLE `profile_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `request_product`
--
ALTER TABLE `request_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `size_pizza`
--
ALTER TABLE `size_pizza`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `stock_product`
--
ALTER TABLE `stock_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `type_user`
--
ALTER TABLE `type_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `profile_users`
--
ALTER TABLE `profile_users`
  ADD CONSTRAINT `profile_user` FOREIGN KEY (`profile_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `request_product`
--
ALTER TABLE `request_product`
  ADD CONSTRAINT `request_pasta` FOREIGN KEY (`product_pasta`) REFERENCES `product_pasta` (`id`),
  ADD CONSTRAINT `request_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `request_product` FOREIGN KEY (`product_item`) REFERENCES `product_pizza` (`id`),
  ADD CONSTRAINT `request_product_drink` FOREIGN KEY (`product_drink`) REFERENCES `product_drink` (`id`),
  ADD CONSTRAINT `request_product_size` FOREIGN KEY (`product_size`) REFERENCES `size_pizza` (`id`),
  ADD CONSTRAINT `request_user` FOREIGN KEY (`request_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `stock_product`
--
ALTER TABLE `stock_product`
  ADD CONSTRAINT `stock_product_drink` FOREIGN KEY (`product_drink`) REFERENCES `product_drink` (`id`),
  ADD CONSTRAINT `stock_product_pasta` FOREIGN KEY (`product_pasta`) REFERENCES `product_pasta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
