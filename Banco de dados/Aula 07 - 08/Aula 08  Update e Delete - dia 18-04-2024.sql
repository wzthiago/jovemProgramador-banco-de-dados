SELECT * FROM produto;

SELECT * FROM produto WHERE fabricante IS NULL;

SELECT * FROM produto WHERE fabricante = 'Hewlettt Packard';

DELETE from produto 
WHERE codigo = 543;

DELETE FROM produto
WHERE nome LIKE '%Tablet%' AND fabricante = 'Canon';

UPDATE produto
SET nome = 'camera de nome alterado' 
WHERE codigo = 2;

UPDATE produto
SET
fabricante = 'Samsung',
preco = preco * 1.1
WHERE codigo IN (3, 4 ,5);

#15.1
UPDATE produto 
SET
preco = preco * 1.07
WHERE categoria = 'camera';

#15.2
DELETE FROM produto
WHERE fabricante IS NULL;

#15.3
UPDATE produto
SET fabricante = 'Hewlettt Packard'
WHERE fabricante = 'Hewlett-Packard';

#15.4
DELETE FROM produto
WHERE categoria LIKE '%Tablet%' AND fabricante = 'Coby';

#15.5
SELECT AVG(preco)
FROM produto
WHERE categoria = 'Televisor';
-- média do preço dos televisores é = R$ 547.200000

UPDATE produto
SET preco = preco * 1.05
WHERE categoria = 'televisor' AND (preco < 547.20);

