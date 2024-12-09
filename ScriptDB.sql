-- Tabela 'dishes': Armazena os pratos disponíveis no sistema.
-- Cada prato possui um ID único, descrição, nome e preço.
CREATE TABLE `dishes` (
  `id` bigint NOT NULL AUTO_INCREMENT, -- Identificador único do prato.
  `description` varchar(255) DEFAULT NULL, -- Descrição do prato (opcional).
  `name` varchar(255) DEFAULT NULL, -- Nome do prato (opcional).
  `price` double DEFAULT NULL, -- Preço do prato (opcional).
  PRIMARY KEY (`id`) -- Chave primária, garantindo unicidade para cada prato.
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela 'tb_clients': Armazena os dados dos clientes.
-- Cada cliente possui um ID único, CEP e nome.
CREATE TABLE `tb_clients` (
  `id` bigint NOT NULL AUTO_INCREMENT, -- Identificador único do cliente.
  `cep` varchar(255) DEFAULT NULL, -- CEP do cliente (opcional).
  `name` varchar(255) DEFAULT NULL, -- Nome do cliente (opcional).
  PRIMARY KEY (`id`) -- Chave primária, garantindo unicidade para cada cliente.
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela 'tb_orders': Representa os pedidos feitos pelos clientes.
-- Cada pedido possui um ID único, status, data e hora do pedido, valor total e um cliente associado.
CREATE TABLE `tb_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT, -- Identificador único do pedido.
  `status` enum('CANCELED','DELIVERED','PREPARING','SHIPPED') NOT NULL, -- Status do pedido.
  `timestamp` datetime(6) NOT NULL, -- Data e hora do pedido com precisão de microsegundos.
  `valor` double NOT NULL, -- Valor total do pedido.
  `client_id` bigint DEFAULT NULL, -- ID do cliente associado ao pedido.
  PRIMARY KEY (`id`), -- Chave primária, garantindo unicidade para cada pedido.
  KEY `FKkmo3qtyo4fqtjp25i8xpqb0t3` (`client_id`), -- Índice para otimizar consultas por cliente.
  CONSTRAINT `FKkmo3qtyo4fqtjp25i8xpqb0t3` FOREIGN KEY (`client_id`) REFERENCES `tb_clients` (`id`) -- Restrição de chave estrangeira, ligando o pedido a um cliente.
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela 'tb_item_order': Relaciona os itens de um pedido com os pratos disponíveis.
-- Cada item possui um ID único, quantidade, prato associado e pedido associado.
CREATE TABLE `tb_item_order` (
  `id` bigint NOT NULL AUTO_INCREMENT, -- Identificador único do item do pedido.
  `quantity` int NOT NULL, -- Quantidade do prato no pedido.
  `dish_id` bigint DEFAULT NULL, -- ID do prato associado.
  `order_id` bigint DEFAULT NULL, -- ID do pedido associado.
  PRIMARY KEY (`id`), -- Chave primária, garantindo unicidade para cada item de pedido.
  KEY `FK287unb4sp1x40m79mfhaxnyof` (`dish_id`), -- Índice para otimizar consultas por prato.
  KEY `FKafat1v1rpvawerdxm5yskyqir` (`order_id`), -- Índice para otimizar consultas por pedido.
  CONSTRAINT `FK287unb4sp1x40m79mfhaxnyof` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`), -- Restrição de chave estrangeira, ligando o item ao prato correspondente.
  CONSTRAINT `FKafat1v1rpvawerdxm5yskyqir` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`) -- Restrição de chave estrangeira, ligando o item ao pedido correspondente.
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
