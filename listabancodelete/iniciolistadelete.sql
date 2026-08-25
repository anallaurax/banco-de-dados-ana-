CREATE TABLE  `cliente` (
    `cpf` CHAR(14) PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `telefone` BIGINT NOT NULL
);
INSERT INTO cliente (cpf, nome, telefone) VALUES
('111.111.111-11', 'Ana Carolina Souza', 48991234567),
('222.222.222-22', 'Bruno Costa', 47988765432),
('333.333.333-33', 'Ana Clara Ferreira', 48999998888),
('444.444.444-44', 'Carlos de Souza', 51981817171),
('555.555.555-55', 'Cliente Teste Antigo', 99999999999);

#Exemplos de DEL #

DELETE FROM `cliente`
WHERE `cpf` = '222.222.222-22';


(PERIGOSO! CUIDADO!)
DELETE FROM `cliente`
WHERE `nome` LIKE 'Ana %';


#Exemplos de updat #

UPDATE `cliente` 
SET `telefone` = 47988776655 
WHERE `cpf` = '222.222.222-22';

UPDATE `cliente` 
SET `nome` = 'Ricardo Alves', telefone = 11976543210 
WHERE `cpf` = '555.555.555-55';
