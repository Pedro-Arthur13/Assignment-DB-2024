# Assignment-DB-2024
Trabalho da matéria de Banco de dados ministrada pelo excelentíssimo professor **Janderson Ferreira Dutra**.

### Equipe:
- **Emanuel Rodrigues Batista**
- **Pedro Arthur Maciel Albuquerque**
---

# Projeto de Banco de Dados

Este projeto contém um conjunto de instruções SQL para a criação e manipulação de um banco de dados utilizado para simular uma loja com clientes, vendedores, produtos e vendas. O objetivo é demonstrar como estruturar um banco de dados relacional, realizar inserções, atualizar e excluir dados, além de realizar consultas complexas para análise das informações.

## Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

- **Cliente**: Contém informações sobre os clientes da loja, como nome, cidade e telefone.
- **Vendedor**: Armazena os dados dos vendedores, incluindo o nome e comissão.
- **Grupo**: Define os grupos de produtos, como "Frutas", "Verduras", etc.
- **Produto**: Contém detalhes sobre os produtos vendidos, como descrição, preço e estoque.
- **Venda**: Registra as transações de vendas, ligando clientes, vendedores e os produtos comprados.
- **ItemVenda**: Armazena os itens vendidos em cada transação, incluindo quantidade e valor total.

## Descrição das Tabelas e Relacionamentos

- A tabela **Cliente** está relacionada com a tabela **Venda**, onde cada cliente pode realizar várias compras.
- A tabela **Vendedor** está associada com a tabela **Venda**, cada venda sendo realizada por um vendedor específico.
- A tabela **Produto** está relacionada com a tabela **ItemVenda**, onde cada venda pode conter múltiplos produtos.
- A tabela **Grupo** classifica os produtos em diferentes categorias (ex: Frutas, Verduras).
- A tabela **ItemVenda** armazena os detalhes dos produtos comprados em cada venda.

## Consultas Realizadas

Foram realizadas diversas consultas SQL para análise de dados, como:

- **Consulta de Produtos**: Listagem de produtos que começam com a letra "R" ou terminam com "a".
- **Consulta de Clientes**: Identificação de clientes que compraram mais de 3 itens em uma transação.
- **Alterações no Preço**: Atualização de preços dos produtos com base em sua quantidade em estoque.
- **Desconto e Preço Total**: Cálculo de preços com desconto aplicado.
- **Clientes sem Compra**: Identificação de clientes que nunca realizaram compras na loja.

Além disso, exemplos de **inserção**, **atualização** e **exclusão** de dados foram fornecidos para ilustrar como gerenciar as informações no banco de dados.



