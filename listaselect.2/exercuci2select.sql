--- Apilidadar colunas
--- nome, fabricante, dtcadastro
--- nome, marca, data de cadastro


SELECT
`nome` AS 'Nome do Produto',
`fabricante`AS 'Marca',
`dtCadastro` AS 'Data de Cadastro'
FROM `produtos`;

--- Ordem alfabetica (a-z ou 0-9)

SELECT `nome`, `preco`
FROM `produtos` ORDER BY `nome` ASC;

--- Ordenar pelo preço (alto - baiixo_)

SELECT
`nome` AS 'Nome',
`preco` AS 'Preço'
FROM `produtos` ORDER  BY `Preço` DESC;

--- top 5 produtos mais caros

SELECT `nome`, `preco`
FROM `produtos` ORDER BY `preco` DESC LIMIT 5;

--- paginação

SELECT `nome`, `preco`
FROM `produtos` LIMIT 0,5;