CREATE DATABASE `empresa`;
USE `empresa`;
CREATE TABLE `cliente` (
`cpf` CHAR(14) PRIMARY KEY,
`nome` VARCHAR(100) NOT NULL,
`telefone` BIGINT NOT NULL
);

CREATE TABLE `empregado` (
`cpf` CHAR(14) PRIMARY KEY,
`nome` VARCHAR(100) NOT NULL,
`cargo` VARCHAR(100) NOT NULL
);


CREATE TABLE `projeto` (
`codProj` INT PRIMARY KEY AUTO_INCREMENT,
`nome` VARCHAR(100) NOT NULL,
`descricao` VARCHAR(100) NOT NULL,
`preco` DECIMAL(10,2) NOT NULL,
`dtFim` DATE NOT NULL,
`dtEstimada` DATE NOT NULL,
`dtSolicitacao` DATE NOT NULL,
`cpfGerente` CHAR(14) NOT NULL,
`cpfCliente` CHAR(14) NOT NULL,
FOREIGN KEY (`cpfCliente`) REFERENCES `cliente`(`cpf`),
FOREIGN KEY (`cpfGerente`) REFERENCES `empregado`(`cpf`)
);

CREATE TABLE `projEmp` (
`codProj` INT,
`cpfEmpregado` CHAR(14),
`hrTrab` FLOAT
);

ALTER TABLE `projEmp`
ADD CONSTRAINT PRIMARY KEY (`codProj`, `cpfEmpregado`);
ALTER TABLE `projEmp`
ADD CONSTRAINT FOREIGN KEY (`cpfEmpregado`) REFERENCES `empregado`(`cpf`);
ALTER TABLE `projEmp`
ADD CONSTRAINT FOREIGN KEY (`codProj`) REFERENCES `projeto`(`codProj`);


# inicio dos exercicios



#ex1
USE `cliente`;

INSERT INTO `cliente` (`cpf`, `nome`, `telefone`)
VALUES ('111.111.111-11', 'João da Silva', '48991234567'),
('222.222.222-22','Maria Oliveira', '48997654321'); #validado


#ex2
USE `empregado`;

INSERT INTO `empregado`(`cpf`, `nome`, `cargo` )
VALUES ('333.333.333-33', 'Carlos Pereira', 'Analista de Sistemas'),
('444.444.444-44', 'Ana Souza', 'Gerente de Projetos'),
('666.666.666-66', 'Lucas Andrade', 'Desenvolvedor Backend'); #validado


#ex3

USE `projeto`;

INSERT INTO `projeto`(`nome`,`descricao`,`preco`,`dtFim`, `dtEstimada`,`dtSolicitacao`, `cpfGerente`, `cpfCliente` )
VALUES ('Sistema de Vendas', 'Plataforma para e-commerce', ' 15000.00', '2025-12-01', ' 2025-11-15', '2025-09-10', '444.444.444-44', '111.111.111-11'),
('Aplicativo Financeiro', 'Gestão de despesas pessoais', '12000.00', '2025-10-30', '2025-10-20', ' 2025-09-12', '444.444.444-44', '222.222.222-22'),
('Site Institucional', 'Página para empresa local', '5000.00', '2025-11-01', '2025-10-25', '2025-09-20', '444.444.444-44', '555.555.555-55'),
('Controle de Estoque', 'Sistema para loja de roupas', '8000.00', '2025-12-20', '2025-12-05', '2025-09-25', '444.444.444-44', '777.777.777-77'); #validado


#ex4 

USE ` projEmp`;

INSERT INTO `projEmp` (`codProj`, `cpfEmpregado`, `hrTrab`)
VALUES (1, '333.333.333-33', 40),
(1, '444.444.444-44', 20),
(2, '333.333.333-33', 35),
(3, '666.666.666-66', 50);

#ex5 

USE `cliente`;

INSERT INTO `cliente` (`cpf`, `nome`, `telefone`)
VALUES ('555.555.555-55', 'Pedro Gomes', '48999887766'),
('777.777.777-77', 'Fernanda Lima', '48991231231');

