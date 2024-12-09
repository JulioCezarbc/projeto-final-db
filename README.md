# projeto-final-db

# Modelo Físico de Dados (MFD) - Sistema de Pedidos e Clientes

## Descrição do MFD

Este projeto consiste na modelagem de um banco de dados relacional para um sistema de gerenciamento de pedidos e clientes. O modelo é composto pelas seguintes tabelas:

1. **`dishes`**: 
   - Armazena os pratos disponíveis no sistema.
   - Contém informações como nome, descrição e preço.

2. **`tb_clients`**: 
   - Registra os dados básicos dos clientes.
   - Inclui informações como nome e CEP.

3. **`tb_orders`**: 
   - Representa os pedidos realizados pelos clientes.
   - Contém campos para status do pedido, data/hora do pedido, valor total e o cliente associado.

4. **`tb_item_order`**: 
   - Relaciona os itens de um pedido com os pratos disponíveis.
   - Permite registrar a quantidade de cada prato incluído em um pedido específico.

### Principais Relacionamentos

- **Cliente e Pedido**: Um cliente pode realizar vários pedidos. Relacionamento representado pela chave estrangeira `client_id` na tabela `tb_orders`.
- **Pedido e Item de Pedido**: Um pedido pode conter vários itens. Relacionamento estabelecido pela chave estrangeira `order_id` na tabela `tb_item_order`.
- **Item de Pedido e Prato**: Cada item está associado a um prato disponível. Relacionamento feito pela chave estrangeira `dish_id` na tabela `tb_item_order`.

---

## Passos para Execução do Script no MySQL

1. **Pré-requisitos**:
   - Ter o MySQL instalado e configurado.
   - Acesso a um cliente MySQL, como o MySQL Workbench, ou linha de comando.

2. **Criação do Banco de Dados**:
   - Antes de executar o script, crie um banco de dados para armazenar as tabelas

3. **Execução do Script**:
   - Abra o arquivo `.sql` no cliente MySQL ou insira os comandos diretamente na interface.
   - Execute o script para criar as tabelas

---

## Observações Adicionais

### Dependências

- Este script não inclui dados de exemplo. Para testar, insira registros manualmente ou crie scripts adicionais para popular as tabelas.
- Utilize um cliente MySQL compatível com o conjunto de caracteres e collation especificados (`utf8mb4` e `utf8mb4_0900_ai_ci`).

### Restrições e Limitações

1. **Restrição de Integridade Referencial**:
   - As tabelas incluem chaves estrangeiras para garantir a consistência dos dados. Certifique-se de que os dados sejam inseridos na ordem correta:
     - Primeiro, insira clientes na tabela `tb_clients`.
     - Em seguida, insira pedidos na tabela `tb_orders`.
     - Por fim, insira itens na tabela `tb_item_order`.

2. **Enumeração de Status**:
   - A tabela `tb_orders` utiliza um campo ENUM para o status do pedido. Certifique-se de usar os valores definidos: `CANCELED`, `DELIVERED`, `PREPARING` ou `SHIPPED`.

3. **Dependência de Versão**:
   - O collation `utf8mb4_0900_ai_ci` é compatível com o MySQL 8.0 ou superior. Para versões anteriores, ajuste o collation conforme necessário.

