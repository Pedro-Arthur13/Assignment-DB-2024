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





# Questões e Resoluções

## Questão 1: Criar as tabelas
### Enunciado
Criar as tabelas para o esquema abaixo:

- Cliente (id_cliente, nome, cidade, telefone)
- Vendedor (id_vendedor, nome, comissao)
- Grupo (id_grupo, descricao)
- Produto (id_produto, id_grupo, descricao, preco, estoque)
- Venda (id_venda, data, id_cliente, id_vendedor, desconto)
- Item_Venda (id_venda, id_produto, quantidade, valor_unitario, valor_total)

### Resolução
```sql
CREATE TABLE Cliente (
    id_cliente VARCHAR(5) NOT NULL,
    nome VARCHAR(25),
    cidade VARCHAR(50),
    telefone VARCHAR(10),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE Vendedor (
    id_vendedor VARCHAR(4),
    nome VARCHAR(25),
    comissao DECIMAL(15,2),
    PRIMARY KEY (id_vendedor)
);

CREATE TABLE Grupo (
    id_grupo VARCHAR(4) NOT NULL,
    descricao VARCHAR(11),
    PRIMARY KEY (id_grupo)
);

CREATE TABLE Produto (
    id_produto VARCHAR(4) NOT NULL,
    id_grupo VARCHAR(4),
    descricao VARCHAR(10),
    preco DECIMAL(5,2),
    estoque INT,
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo),
    PRIMARY KEY (id_produto)
);

CREATE TABLE Venda (
    id_venda VARCHAR(5) NOT NULL,
    data DATE,
    id_cliente VARCHAR(4),
    id_vendedor VARCHAR(4),
    desconto DECIMAL(5,2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),
    PRIMARY KEY (id_venda)
);

CREATE TABLE ItemVenda (
    id_venda VARCHAR(5) NOT NULL,
    id_produto VARCHAR(4) NOT NULL,
    quantidade INT,
    valor_unitario DECIMAL(5,2),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    PRIMARY KEY(id_venda, id_produto)
);
```

---

## Questão 2: Inserir pelo menos 5 tuplas a mais
### Enunciado
Inserir pelo menos cinco tuplas a mais em cada tabela apresentada.

### Resolução
```sql
-- Inserindo novos clientes
INSERT INTO Cliente VALUES
('C005', 'Carlos', 'Xique-Xique', '395829104'),
('C006', 'Roberval', 'Anta Gorda', '487357845'),
('C007', 'Osvaldo', 'Rio Branco', '294835748'),
('C008', 'Gustavo', 'Piracicaba', '937594813'),
('C009', 'Antenor', 'Xarupi', '837763821');

-- Inserindo novos vendedores
INSERT INTO Vendedor VALUES
('V005', 'Arthur', 12000.00),
('V006', 'Miguel', 500.00),
('V007', 'Davi', 10.00),
('V008', 'Emmanuel', 12000.00),
('V009', 'Sandoval', 420.00);

-- Inserindo novos grupos
INSERT INTO Grupo VALUES
('G003', 'Carnes'),
('G004', 'Bebidas'),
('G005', 'Temperos'),
('G006', 'Grãos'),
('G007', 'Suplementos');

-- Inserindo novos produtos
INSERT INTO Produto VALUES
('P005', 'G004', 'Vinho', 8.00, 50),
('P006', 'G006', 'Aveia', 5.00, 60),
('P007', 'G007', 'B12', 12.00, 40),
('P008', 'G003', 'Picanha', 4.50, 35),
('P009', 'G005', 'Coentro', 3.00, 100);

-- Inserindo novas vendas
INSERT INTO Venda VALUES
('VD005', '2024-04-10', 'C005', 'V007', 0.50),
('VD006', '2024-03-22', 'C008', 'V008', 10.00),
('VD007', '2024-07-30', 'C007', 'V005', 2.00),
('VD008', '2024-10-02', 'C006', 'V009', 11.00),
('VD009', '2024-01-01', 'C009', 'V006', 4.00);
```

---

## Questão 3: Gerar uma lista de produtos que começam com "R" ou terminam com "a"
### Enunciado
Gere uma lista contendo a descrição de todos os produtos que começam com a letra "R" ou terminam com a letra "a".

### Resolução
```sql
SELECT descricao
FROM Produto
WHERE descricao LIKE 'R%' OR descricao LIKE '%a';
```

---

## Questão 4: Clientes que compraram mais de 3 itens em uma compra
### Enunciado
Selecionar o nome do cliente e a descrição dos produtos de todos os clientes que compraram uma quantidade maior que 3 itens em uma compra.

### Resolução
```sql
SELECT Cliente.nome, Produto.descricao, ItemVenda.quantidade
FROM Cliente
JOIN Venda ON Cliente.id_cliente = Venda.id_cliente
JOIN ItemVenda ON Venda.id_venda = ItemVenda.id_venda
JOIN Produto ON ItemVenda.id_produto = Produto.id_produto
WHERE ItemVenda.quantidade > 3  -- Filtra as compras onde a quantidade é maior que 3
ORDER BY ItemVenda.quantidade, Cliente.nome, Produto.descricao;
```

---

## Questão 5: Descontos menores que 3 reais
### Enunciado
Recupere os nomes dos clientes que obtiveram descontos menores que 3 reais em uma compra.

### Resolução
```sql
SELECT DISTINCT Cliente.nome, Venda.desconto
FROM Cliente
JOIN Venda ON Cliente.id_cliente = Venda.id_cliente
WHERE Venda.desconto < 3;
```

---

## Questão 6: Preço com 35% a mais para "Maça" e "Alface"
### Enunciado
Verifique como ficaria o preço dos produtos "Maça" e "Alface" caso fosse acrescentado 35% do seu preço.

### Resolução
```sql
SELECT descricao, preco, ROUND(preco * 1.35, 2) AS novo_preco
FROM Produto
WHERE descricao IN ('Maca', 'Alface');
```

---

## Questão 7: Preço com 9% a mais para os produtos do grupo "Frutas"
### Enunciado
Verifique como ficaria o preço dos produtos do grupo "Frutas" caso fosse acrescentado 9% do seu preço.

### Resolução
```sql
SELECT Produto.descricao AS fruta, preco AS preco_antigo, preco * 1.09 AS novo_preco
FROM Produto
JOIN Grupo ON Produto.id_grupo = Grupo.id_grupo
WHERE Grupo.descricao = 'Frutas';
```

---

## Questão 8: Preço com 9% para "Frutas" e 25% para "Verduras"
### Enunciado
Verifique como ficaria o preço dos produtos dos grupos "Frutas" e "Verduras" caso fosse acrescentado 9% para o preço das "Frutas" e 25% para o preço das "Verduras".

### Resolução
```sql
SELECT Produto.descricao AS produto, preco,
    CASE
        WHEN Grupo.descricao = 'Frutas' THEN preco * 1.09
        WHEN Grupo.descricao = 'Verduras' THEN preco * 1.25
    END AS novo_preco
FROM Produto
JOIN Grupo ON Produto.id_grupo = Grupo.id_grupo
WHERE Grupo.descricao IN ('Frutas', 'Verduras');
```


### 9. **Recupere o nome dos clientes que já realizaram compras.**
```sql
SELECT DISTINCT Cliente.nome
FROM Cliente
JOIN Venda on Cliente.id_cliente = Venda.id_cliente
ORDER BY Cliente.nome ASC;
```

### 10. **Recupere o nome dos clientes que ainda não realizaram compras.**
```sql
SELECT Cliente.nome
FROM Cliente
LEFT JOIN Venda ON Cliente.id_cliente = Venda.id_cliente
WHERE Venda.id_venda IS NULL OR Venda.data > CURRENT_DATE;
```

### 11. **Recupere o nome de cada cliente, o nome de cada vendedor e a data de cada venda realizada na loja. Ordene primeiramente pela data em ordem decrescente, depois pelo nome do cliente em ordem crescente.**
```sql
SELECT Cliente.nome AS nome_cliente, Vendedor.nome AS nome_vendedor, Venda.data AS data
FROM Venda
JOIN Cliente ON Venda.id_cliente = Cliente.id_cliente
JOIN Vendedor ON Venda.id_vendedor = Vendedor.id_vendedor
ORDER BY Venda.data DESC, Cliente.nome ASC;
```

### 12. **Recupere o nome dos clientes que nunca realizaram compras na loja.**
```sql
SELECT Cliente.nome
FROM Cliente
WHERE Cliente.id_cliente NOT IN (SELECT id_cliente FROM Venda);
```

### 13. **Recupere todas as informações dos vendedores juntamente com todas as informações das vendas realizadas por cada um. A consulta deverá manter todos os vendedores, até mesmo aqueles que não efetuaram vendas.**
```sql
SELECT Vendedor.*, Venda.*, Cliente.nome AS nome_cliente, Produto.descricao AS nome_produto
FROM Vendedor
LEFT JOIN Venda ON Vendedor.id_vendedor = Venda.id_vendedor
LEFT JOIN Cliente ON Venda.id_cliente = Cliente.id_cliente
LEFT JOIN ItemVenda ON Venda.id_venda = ItemVenda.id_venda
LEFT JOIN Produto ON ItemVenda.id_produto = Produto.id_produto;
```

### 14. **Obtenha o “valor total” comprado de todos os itens que o cliente ‘Janderson’ já comprou.**
```sql
SELECT SUM(ItemVenda.valor_total)
FROM Venda
JOIN Cliente ON Venda.id_cliente = Cliente.id_cliente
JOIN ItemVenda ON Venda.id_venda = ItemVenda.id_venda
WHERE Cliente.nome = 'Janderson';
```

---

### 15. **Exemplos de novas consultas com novos recursos ou instruções SQL.**

#### a) **Consulta com `LIMIT` (limita o número de resultados para 5):**
```sql
SELECT Produto.descricao
FROM Produto
ORDER BY Produto.descricao ASC
LIMIT 5;
```

#### b) **Consulta com `NULLIF`:**
```sql
SELECT Produto.descricao, ItemVenda.quantidade,
       NULLIF(ItemVenda.valor_total, ItemVenda.quantidade * ItemVenda.valor_unitario) AS valor
FROM Produto
JOIN ItemVenda ON Produto.id_produto = ItemVenda.id_produto
ORDER BY Produto.descricao ASC;
```

#### c) **Consulta com `COALESCE`:**
```sql
INSERT INTO ItemVenda VALUES ('VD002', 'P003', 4, 6.00, NULL); -- Repolho com valor nulo de propósito

SELECT Produto.descricao, ItemVenda.quantidade, ItemVenda.id_venda,
       COALESCE(ItemVenda.valor_total, ItemVenda.quantidade * ItemVenda.valor_unitario) AS valor_total_calculado
FROM Produto
JOIN ItemVenda ON Produto.id_produto = ItemVenda.id_produto
WHERE ItemVenda.valor_total IS NULL
ORDER BY Produto.descricao ASC;
```

---

### 16. **Exemplos de atualização de dados.**

#### a) **Atualizando o preço das frutas de acordo com a quantidade de produtos no estoque:**
- Se o estoque for maior que 50, aumenta 10%  
- Se o estoque for entre 30 e 50, aumenta em 7%  
- Se o estoque for menor que 30, aumenta em 5%.

```sql
UPDATE Produto
SET preco = 
    CASE
        WHEN estoque > 50 THEN preco * 1.10
        WHEN estoque BETWEEN 30 AND 50 THEN preco * 1.07
        WHEN estoque < 30 THEN preco * 1.05
    END
WHERE id_grupo = 'G001';  -- Apenas frutas
```

#### b) **Adicionando "9" antes do telefone de todos os clientes que fizeram compras em 2024:**
```sql
UPDATE Cliente
SET telefone = '9' || telefone
WHERE id_cliente IN (SELECT DISTINCT id_cliente FROM Venda WHERE strftime('%Y', data) = '2024');
```

#### c) **Atualizando o valor total de compras que estavam errados:**
```sql
UPDATE ItemVenda
SET valor_total = quantidade * valor_unitario
WHERE valor_total != quantidade * valor_unitario AND valor_total IS NOT NULL;
```

---

### 17. **Exemplos de exclusão de dados.**

#### a) **Excluindo todas as vendas que não têm itens associados:**
```sql
INSERT INTO Venda (id_venda, data, id_cliente, id_vendedor, desconto)
VALUES (1001, '2024-12-19', 1, 2, 0);

DELETE FROM Venda
WHERE id_venda NOT IN (SELECT DISTINCT id_venda FROM ItemVenda);
```

#### b) **Excluindo vendedores que não realizaram vendas até agora:**
```sql
DELETE FROM Vendedor
WHERE id_vendedor NOT IN (SELECT DISTINCT id_vendedor FROM Venda);
```

#### c) **Excluindo clientes que não realizaram compras:**
```sql
DELETE FROM Cliente
WHERE id_cliente NOT IN (SELECT DISTINCT id_cliente FROM Venda);
```

---
**Aviso:**
Todos os dados apresentados neste documento são **fictícios** e foram criados **apenas para fins de exemplo e educação**. As consultas, valores e tabelas não representam dados reais e são usadas unicamente para demonstrar conceitos e práticas de SQL.


