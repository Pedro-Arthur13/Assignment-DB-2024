CREATE TAble Cliente(
	id_cliente VARCHAR(5) NOT NULL,
  	nome VARCHAR(25),
  	cidade VARCHAR(50),
  	telefone VARCHAR(10),
  	
  	PRIMARY KEY (id_cliente)

);
CREATE TABLE Vendedor(
	id_vendedor VARCHAR(4),
  	nome VARCHAR(25),
  	comissao DECIMAL(15,2),
  
  	PRIMARY KEY (id_vendedor)
);
CREATE TABLE Grupo(
	id_grupo VARCHAR(4) NOT NULL,
  	descricao VARCHAR(11),
  	
  	PRIMARY KEY (id_grupo)
  
);
CREATE TABLE Produto(
	id_produto VARCHAR(4) NOT NULL,
  	id_grupo VARCHAR(4),
  	descricao VARCHAR(10),
  	preco DECIMAL(5,2),
  	estoque INT, 
  
  	FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo),
  
  	PRIMARY KEY (id_produto)
);
CREATE TABLE Venda(
	id_venda VARCHAR(5) NOT NULL,
	data DATE,
  	id_cliente VARCHAR(4),
  	id_vendedor VARCHAR(4),
  	desconto DECIMAL(5,2),
  	
  	FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),
  
  	PRIMARY KEY (id_venda)

);
CREATE TABLE ItemVenda(
	id_venda VARCHAR(5) NOT NULL,
  	id_produto VARCHAR(4) NOT NULL,
  	quantidade int,
  	valor_unitario DECIMAL(5,2),
  	valor_total DECIMAL(10,2),
  
  	FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
  	FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
  
  	PRIMARY KEY(id_venda,id_produto)
);

INSERT INTO Cliente VALUES
('C001', 'Janderson', 'Cajazeiras', '444444444'),
('C002', 'Luciano', 'Sousa', '555555555'),
('C003', 'Izabel', 'Patos', '777777777'),
('C004', 'Gilmar', 'João Pessoa', '888888888'),-- Cliente que vai só pra olhar
-- 5 tuplas além das de exemplo
('C005', 'Carlos', 'Xique-Xique', '395829104'),
('C006', 'Roberval', 'Anta Gorda', '487357845'),
('C007', 'Osvaldo', 'Rio Branco', '294835748'),
('C008', 'Gustavo', 'Piracicaba', '937594813'),
('C009', 'Antenor', 'Xarupi', '837763821');

INSERT INTO Vendedor VALUES
('V001', 'João', 1000.00),
('V002', 'Denis', 900.00),
('V003', 'Kamila', 1300.00),
('V004', 'Cícero', 1300.00),
-- 5 tuplas além das de exemplo
('V005', 'Arthur', 12000.00),
('V006', 'Miguel', 500.00),
('V007', 'Davi', 10.00),
('V008', 'Emmanuel', 12000.00),
('V009', 'Sandoval', 420.00);

INSERT INTO Grupo VALUES
('G001', 'Frutas'),
('G002', 'Verduras'),
-- 5 tuplas além das de exemplo
('G003', 'Carnes'),
('G004', 'Bebidas'),
('G005', 'Temperos'),
('G006', 'Grãos'),
('G007', 'Suplementos');

INSERT INTO Produto VALUES
('P001', 'G001', 'Maca', 4.00, 28),
('P002', 'G001', 'Goiaba', 10.00, 90),
('P003', 'G002', 'Repolho', 15.00, 33),
('P004', 'G002', 'Alface', 6.0, 30),
-- 5 tuplas além das de exemplo
('P005', 'G004', 'Vinho', 8.00, 50),
('P006', 'G006', 'Aveia', 5.00, 60),
('P007', 'G007', 'B12', 12.00, 40), -- vitamina B12 XD
('P008', 'G003', 'Picanha', 4.50, 35),
('P009', 'G005', 'Coentro', 3.00, 100);

INSERT INTO Venda VALUES
-- data YYYY-MM-DD
('VD001', '2024-04-03', 'C002', 'V003', 1.00),
('VD002', '2024-04-03', 'C001', 'V002', 2.00),
('VD003', '2024-04-05', 'C002', 'V001', 2.00),
('VD004', '2024-04-04', 'C003', 'V002', 3.00),
-- 5 tuplas além das de exemplo
('VD005', '2024-04-10', 'C005', 'V007', 0.50),
('VD006', '2024-03-22', 'C008', 'V008', 10.00),
('VD007', '2024-07-30', 'C007', 'V005', 2.00),
('VD008', '2024-10-02', 'C006', 'V009', 11.00),
('VD009', '2024-01-01', 'C009', 'V006', 4.00);


INSERT INTO ItemVenda VALUES
-- id_venda id_produto quantidade valor_unitario valor_total
('VD001', 'P001', 3, 4.00, 12.00),
('VD001', 'P002', 2, 10.00, 20.00),
('VD001', 'P003', 4, 15.00, 60.00),
('VD002', 'P004', 4, 6.00, 24.00), 
('VD003', 'P002', 4, 6.00, 24.00),
('VD003', 'P003', 5, 15.00, 76.00),-- valor errado de proposito
('VD003', 'P004', 3, 15.00, 45.00),
('VD004', 'P003', 2, 15.00, 30.00),
('VD004', 'P004', 1, 6.00, 6.00),
-- tuplas além das de exemplo
('VD005','P009',10,3.00,30.00),
('VD005','P008',1,4.50,4.50),
('VD006','P007',4,12.00,48.00),
('VD006','P001',4,4.00,16.00),
('VD006','P009',4,3.00,12.00),
('VD007','P006',3,5.00,15.00),
('VD007','P005',6,8.00,48.00),
('VD008','P009',8,3.00,24.00),
('VD008','P002',5,10.00,50.00),
('VD009','P007',5,12.00,60.00),
('VD009','P008',10,4.50,45.00);

-- Inserindo os valores com desconto na tabela ItemVenda
ALTER TABLE ItemVenda -- adiciona a coluna para item com desconto
ADD COLUMN valor_com_desconto DECIMAL(10,2);

UPDATE ItemVenda -- aidiona o desconto
SET valor_com_desconto = valor_total - Venda.desconto
FROM Venda
WHERE ItemVenda.id_venda = Venda.id_venda;

-- confere as colunas  do item venda
SELECT ItemVenda.id_venda, ItemVenda.id_produto, ItemVenda.quantidade, 
       ItemVenda.valor_unitario, ItemVenda.valor_total, 
       ItemVenda.valor_com_desconto, Venda.desconto
FROM ItemVenda
JOIN Venda ON ItemVenda.id_venda = Venda.id_venda;



/* Gere uma lista contendo a descrição de todos os produtos que começam com a 
 letra “R” ou terminam com a letra ”a”.*/ 
SELECT descricao
FROM Produto
WHERE descricao LIKE 'R%' OR descricao LIKE '%a'; 

/*Selecionar o nome do cliente e a descrição dos produtos de todos os clientes que compraram uma 
quantidade maior que 3 itens em uma compra.*/
-- pegando todos os clientes que compraram com quantidade > 3e quais produtos que eles compram
SELECT Cliente.nome, Produto.descricao, ItemVenda.quantidade
FROM Cliente
JOIN Venda ON Cliente.id_cliente = Venda.id_cliente
JOIN ItemVenda ON Venda.id_venda = ItemVenda.id_venda
JOIN Produto ON ItemVenda.id_produto = Produto.id_produto
WHERE ItemVenda.quantidade > 3  -- Filtra as compras onde a quantidade é maior que 3
ORDER BY ItemVenda.quantidade, Cliente.nome, Produto.descricao;


/*Recupere os nomes dos clientes que obtiveram descontos menores que 3 reais 
em uma compra.*/
Select DISTINCT Cliente.nome, Venda.desconto
From Cliente
Join Venda ON Cliente.id_cliente = Venda.id_cliente
WHERE Venda.desconto< 3;

/*Verifique com ficaria o preço dos produtos “Maça” e “Alface” 
caso fosse acrescentado 35% do seu preço*/

-- Utilizamos o round para arredondar o valor obtido
SELECT descricao, preco, ROUND(preco * 1.35,2) AS novo_preco
FROM Produto
Where descricao IN ('Maca','Alface');
/*Print sem o round()
Maca 4 5.4
Alface 6 8.100000000000001
*/

/*Verifique com ficaria o preço dos produtos do grupo de frutas 
caso fosse acrescentado 9% do seu preço.*/

-- AS implicito
Select Produto.descricao fruta, preco preco_antigo, preco*1.09 novo_preco
FROM Produto
Join Grupo ON Produto.id_grupo = Grupo.id_grupo
Where Grupo.descricao = 'Frutas';

/*Verifique com ficaria o preço dos produtos dos grupos de frutas e verduras caso fosse 
acrescentado 9% para o preço das “Frutas” e 25% para o preço das “Verduras”.*/

/* Se não especificar qual descricao quer vai dar o error de ambiguous column name: descricao
   porque ambas as tabelas tem o atributo nomeado descricao*/
-- exemplo de CASE https://stackoverflow.com/questions/14580294/sqlite-syntax-for-if-else-condition
Select Produto.descricao produto, preco,
	CASE -- tipo um if statement
    	WHEN Grupo.descricao = 'Frutas' THEN preco *1.09
        WHEN Grupo.descricao = 'Verduras' Then preco *1.25 
	END novo_preco -- AS implicito
FROM Produto
JOIN Grupo ON Produto.id_grupo = Grupo.id_grupo
WHERE Grupo.descricao IN ('Frutas','Verduras'); -- só vai pegar os de frutas e verduras

/*Recupere o nome dos clientes que já realizaram compras*/
SELECT DISTINCT Cliente.nome
From Cliente
Join Venda on Cliente.id_cliente = Venda.id_cliente
ORDER BY Cliente.nome ASC;

/*Recupere o nome dos clientes que ainda não realizaram compras*/
--clientes que foram registrados, mas que não efetuaram nenhuma compra.
-- A condição `WHERE Venda.id_venda IS NULL` filtra apenas aqueles clientes que não possuem vendas associadas.
SELECT Cliente.nome
FROM Cliente
LEFT JOIN Venda ON Cliente.id_cliente = Venda.id_cliente
WHERE Venda.id_venda IS NULL OR Venda.data > CURRENT_DATE; --filtra os clientes que têm vendas após a data atual
-- caso a compra dele seja após a data atual seria inválida, até porque não se viaja no tempo... anida


/*Recupere o nome de cada cliente, o nome de cada vendedor e a data de 
cada venda realizada na loja. Ordene primeiramente pela data em ordem decrescente,
depois pelo nome do cliente em ordem crescente*/
Select Cliente.nome nome_cliente, Vendedor.nome nome_vendedor, Venda.data data
From Venda
Join Cliente ON Venda.id_cliente = Cliente.id_cliente
Join Vendedor ON Venda.id_vendedor = Vendedor.id_vendedor
ORDER BY Venda.data DESC, Cliente.nome ASC;

/*Recupere o nome dos clientes que nunca realizaram compras na loja.*/
-- Essa abordagem verifica diretamente a ausência do ID do cliente na tabela `Venda`, sem considerar possíveis associações.
-- clientes que não têm registros de compras em nenhuma situação
SELECT Cliente.nome
From Cliente
WHERE Cliente.id_cliente NOT IN (Select id_cliente From Venda); -- ubconsulta que retorna os id_cliente dos cliente que realizaram compra

/*Recupere todas as informações dos vendedores juntamente com todas as informações das 
vendas realizadas por cada um. A consulta deverá manter todos os vendedores, até mesmo 
aqueles que não efetuaram vendas.*/
SELECT Vendedor.*, Venda.id_venda,Venda.data,Venda.id_cliente,Venda.desconto, Cliente.nome AS nome_cliente, Produto.descricao AS nome_produto
FROM Vendedor
LEFT JOIN Venda ON Vendedor.id_vendedor = Venda.id_vendedor
LEFT JOIN Cliente ON Venda.id_cliente = Cliente.id_cliente
LEFT JOIN ItemVenda ON Venda.id_venda = ItemVenda.id_venda
LEFT JOIN Produto ON ItemVenda.id_produto = Produto.id_produto;


/*Obtenha o “valor total” comprado de todos os itens que o cliente ‘Janderson’ já comprou*/
Select SUM(ItemVenda.valor_total)
From Venda
Join Cliente ON Venda.id_cliente = Cliente.id_cliente
Join ItemVenda ON Venda.id_venda = ItemVenda.id_venda
WHere Cliente.nome = 'Janderson';







/*Crie 3 exemplos de consultas (diferentes das anteriores e que usem novos recursos ou
instruções SQL ainda não apresentadas nas aulas).*/

-- Consulta com LIMIT (limia o número de resultados para 5)
-- Pegando apenas os 5 primeiros
SELECT Produto.descricao
FROM Produto
ORDER BY Produto.descricao ASC
LIMIT 5;

-- Consulta com NULLIF
-- verifica o valor total das compras, mas se ele for igual ao valor unitario multiplicado pela quantidade retorna null
-- É útil para indicar algum erro, pois se algum não retornar null pode ser um erro no valor total
SELECT Produto.descricao, ItemVenda.quantidade,
	NULLIF(ItemVenda.valor_total,ItemVenda.quantidade*ItemVenda.valor_unitario) valor
From Produto
Join ItemVenda ON Produto.id_produto = ItemVenda.id_produto
ORDER BY Produto.descricao ASC;

--Consulta COALESCE
-- Caso algum valor total esteja faltando, retornaremos o valor calculado com a quantidade e o valor unitário.
-- se o valor_total estiver NULL, o COALESCE() retornará o valor calculado multiplicando a quantidade pelo valor unitário do produto.
insert into ItemVenda VALUES
('VD002', 'P003', 4,6.00,null,null); -- repolho com valor nullo de proposito

SELECT Produto.descricao, ItemVenda.quantidade,ItemVenda.id_venda, 
       COALESCE(ItemVenda.valor_total, ItemVenda.quantidade * ItemVenda.valor_unitario) AS valor_total_calculado
FROM Produto
JOIN ItemVenda ON Produto.id_produto = ItemVenda.id_produto
WHERE ItemVenda.valor_total IS NULL -- pra vir apenas o repolho que esta com valor nullo
ORDER BY Produto.descricao ASC;





/*Crie 3 exemplos de atualização de dados*/


--Atualizando o preco das frutas de acordo com a quantidade de produtos no estoque
/* Se o estoque for maior que 50 aumenta 10%
Se o estoque for entre 30 e 50  aumenta em 7%
Se o estoque for menor que 30 aumente em 5% */
UPDATE Produto
SET preco = 
    CASE
        WHEN estoque > 50 THEN preco * 1.10
        WHEN estoque BETWEEN 30 AND 50 THEN preco * 1.07
        WHEN estoque < 30 THEN preco * 1.05
    END
WHERE id_grupo = 'G001';  -- Apenas das frutas
-- conferindo

SELECT id_produto, descricao, preco, estoque
FROM Produto
WHERE id_grupo = 'G001';



-- Adicionando 9 antes do telefone de todos os clientes que fizeram compras em 2024
UPDATE Cliente
SET telefone = '9' || telefone
WHERE id_cliente IN (SELECT DISTINCT id_cliente FROM Venda WHERE strftime('%Y', data) = '2024');

-- Conferindo
Select Cliente.nome, Cliente.telefone
From Cliente;



-- Atualizando o valor total daqueles produtos com o valor total errado
-- conferir
SELECT id_venda, id_produto, quantidade, valor_unitario, valor_total
FROM ItemVenda
WHERE valor_total != quantidade * valor_unitario
AND valor_total IS NOT NULL;

UPDATE ItemVenda
SET valor_total = quantidade * valor_unitario
WHERE valor_total != quantidade * valor_unitario AND valor_total IS NOT NULL;






/*Crie 3 exemplos de exclusão de dados.*/

-- Excluindo todas as vendas que não tem itens associados
INSERT INTO Venda (id_venda, data, id_cliente, id_vendedor, desconto)
VALUES (1001, '2024-12-19', 1, 2, 0);

DELETE FROM Venda
WHERE id_venda NOT IN (SELECT DISTINCT id_venda FROM ItemVenda);

-- verificando
SELECT id_venda, data
FROM Venda
WHERE id_venda NOT IN (
    SELECT DISTINCT id_venda
    FROM ItemVenda
);


-- Excluindo os vendedodres que nao ealizaram vendas ate agora
DELETE FROM Vendedor -- deleta cicero
WHERE id_vendedor NOT IN (
    SELECT DISTINCT id_vendedor
    FROM Venda
);
--conferindo
SELECT Vendedor.id_vendedor, Vendedor.nome
FROM Vendedor
WHERE Vendedor.id_vendedor NOT IN (
    SELECT DISTINCT id_vendedor
    FROM Venda
);


-- excluindo clientes que não realizaram compras
DELETE FROM Cliente -- exclui gilmar
WHERE id_cliente NOT IN (SELECT DISTINCT id_cliente FROM Venda);

--conferindo
SELECT nome
FROM Cliente
WHERE id_cliente NOT IN (SELECT DISTINCT id_cliente FROM Venda);
