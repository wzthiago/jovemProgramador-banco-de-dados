CREATE DATABASE IF NOT EXISTS loja;

USE loja;

CREATE TABLE produto (
   codigo	SERIAL NOT NULL,
   nome		VARCHAR(200) NOT NULL,
   fabricante	VARCHAR(100),
   categoria	VARCHAR(100),
   preco	NUMERIC(8,2),
   PRIMARY KEY (codigo)
);

SELECT * FROM produto; 

SELECT codigo, nome, fabricante
FROM produto;

SELECT nome, categoria, preco
FROM produto
WHERE preco > 100;


-- Exercícios 10.1 ao 10.6
#10.1
SELECT nome, fabricante
FROM produto
WHERE fabricante = 'Motorola';

#10.2
SELECT nome, preco
FROM produto
WHERE fabricante = 'Nikon'
AND categoria = 'camera';

#10.3
SELECT nome, categoria, preco
FROM produto
WHERE categoria = 'Tablet'
AND preco >= 100 
AND preco <= 200;

#10.4
SELECT nome, preco
FROM produto
WHERE fabricante = 'Sony'
AND preco > 500;

#10.5
SELECT codigo, nome, fabricante, categoria, preco
FROM produto
WHERE preco < 100;

#10.6
SELECT nome, preco
FROM produto
WHERE categoria = 'Notebook'
AND (fabricante = 'Hewlett-Packard' or fabricante = 'Sony')
AND preco >= 500
AND preco <= 800;

-- Exemplos
#IN
SELECT * FROM produto
WHERE fabricante IN ('Sony', 'Motorola', 'Asus');

#LIKE
SELECT nome FROM produto
WHERE upper(nome) LIKE upper('%Portable%');

SELECT * FROM produto
WHERE categoria = 'Auto-falante'
AND fabricante = 'Dr. Hank'
AND nome LIKE '%portable%';

#NULL
SELECT * FROM produto
WHERE fabricante IS NULL;

#IS NOT NULL
SELECT * FROM produto
WHERE fabricante IS NOT NULL;

#ORDER BY
SELECT codigo, nome, preco 
FROM produto
ORDER BY preco;

SELECT codigo, nome, preco 
FROM produto
ORDER BY nome, preco;

#AVG média dos valores
SELECT AVG(preco)
FROM produto
WHERE categoria='Tablet';

SELECT categoria, fabricante, AVG(preco)
FROM produto
GROUP BY categoria, fabricante;
-- retorna a média de preço de cada categoria por cada fabricante


-- Exercícios 11.1 ao 11.5
#11.1
SELECT nome, categoria, fabricante, preco
FROM produto
WHERE fabricante IN ('Coby', 'Genesis', 'Samsung', 'Orange');

# 11.2
SELECT nome, preco
FROM produto
WHERE fabricante IN ('Nikon', 'Canon', 'Sony')
AND preco BETWEEN 100 AND 250;

# 11.3
SELECT nome, categoria, preco
FROM produto
WHERE categoria = 'Tablet'
AND nome LIKE '%vermelho%';

# 11.4
SELECT nome, categoria, fabricante, preco
FROM produto
WHERE fabricante IN ('Sony', 'Panasonic', 'LG')
AND nome LIKE '%preto%'
AND preco BETWEEN 100 AND 300;

# 11.5
SELECT * FROM produto
WHERE fabricante IS NULL;

#Exemplo de retornos idênticos
SELECT fabricante
FROM produto 
WHERE categoria = 'camera';

#DISTINCT exibe apenas resultados não repetidos 
SELECT DISTINCT fabricante
FROM produto
WHERE categoria = 'Camera';

select DISTINCT fabricante
from produto
where categoria = 'Camera'
and fabricante is not null;

-- Exercícios 12.1 ao 12.2
#12.1
SELECT DISTINCT categoria
FROM produto
WHERE fabricante IN ('Motorola');

#12.2
SELECT DISTINCT fabricante
FROM produto
WHERE categoria = 'Tablet';

-- Exercícios 13.1 ao 13.3
#13.1
SELECT nome, preco
FROM produto
WHERE fabricante = 'Nikon'
AND categoria = 'camera'
ORDER BY nome;

#13.2
SELECT nome, fabricante, preco
FROM produto
WHERE categoria = 'celular'
ORDER BY preco, fabricante;

#13.3
SELECT nome, categoria, fabricante, preco
FROM produto
WHERE fabricante = 'Samsung'
AND categoria = 'Tablet'
ORDER BY preco DESC;

#Exemplo AVG, MAX, MIN
SELECT AVG(preco), MAX(preco), MIN(preco)
FROM produto
WHERE categoria = 'Tablet';

#Exemplo - preço médio de cada categoria (GROUP BY)
SELECT categoria, AVG(preco)
FROM produto
GROUP BY categoria;

SELECT categoria, fabricante, AVG(preco)
FROM produto
GROUP BY categoria, fabricante;
-- retorna a média de preço de cada categoria por cada fabricante

-- Exercícios 14.1 ao 14.7
#14.1
SELECT fabricante, categoria, COUNT(*)
FROM produto
WHERE fabricante = 'Sony'
GROUP BY categoria
ORDER BY categoria;

#14.2
SELECT AVG(preco)
FROM produto
WHERE fabricante = 'Motorola'
AND categoria = 'celular';

#14.3
SELECT categoria, MIN(preco)
FROM produto
GROUP BY categoria;

#14.4
SELECT categoria, MAX(preco)
FROM produto
GROUP BY fabricante;

#14.5
SELECT categoria, fabricante, COUNT(*)
FROM produto
GROUP BY categoria, fabricante
ORDER BY categoria, fabricante;

#14.6

SELECT nome, AVG(preco)
FROM produto
WHERE categoria = 'Tablet'
AND nome LIKE '%vermelho%';

#
SELECT nome, AVG(preco)
FROM produto
WHERE categoria = 'Tablet' 
AND upper(nome) LIKE upper('%vermelho%');


#14.7
SELECT MIN(preco)
FROM produto
WHERE categoria = 'Celular'
AND preco > 100;

#
SELECT codigo, nome, fabricante, MIN(preco)
FROM produto
WHERE categoria = 'Celular'
AND preco BETWEEN 100 AND 120
ORDER BY preco, codigo;
