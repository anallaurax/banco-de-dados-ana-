-- 1. APAGAR O BANCO DE DADOS (Se já existir)
DROP DATABASE IF EXISTS `clinica_veterinaria`;

-- 2. CRIAR O BANCO DE DADOS
CREATE DATABASE `clinica_veterinaria`;

-- 3. USAR O BANCO DE DADOS
USE `clinica_veterinaria`;

-- 4. CRIAR AS TABELAS

-- Tabela de Tutores (Donos dos animais)
CREATE TABLE `Tutores` (
    `idTutor` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) UNIQUE,
    `telefone` VARCHAR(20),
    `cidade` VARCHAR(50)
);

-- Tabela de Veterinários
CREATE TABLE `Veterinarios` (
    `idVeterinario` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `crmv` VARCHAR(15) NOT NULL UNIQUE,
    `especialidade` VARCHAR(100) DEFAULT 'Clínico Geral'
);

-- Tabela de Animais (Foco principal dos exercícios)
CREATE TABLE `Animais` (
    `idAnimal` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `especie` VARCHAR(50), -- Ex: Cachorro, Gato, Ave
    `raca` VARCHAR(50),
    `dtNascimento` DATE,
    `peso_kg` DECIMAL(5, 2),
    `idTutor_fk` INT,
    `obs` TEXT, -- Coluna para testar IS NULL
    FOREIGN KEY (`idTutor_fk`) REFERENCES `Tutores`(`idTutor`)
);

-- Tabela de Consultas (Foco principal dos exercícios)
CREATE TABLE `Consultas` (
    `idConsulta` INT AUTO_INCREMENT PRIMARY KEY,
    `idAnimal_fk` INT,
    `idVeterinario_fk` INT,
    `dtConsulta` DATETIME,
    `motivo` VARCHAR(255),
    `diagnostico` TEXT, -- Coluna para testar IS NOT NULL
    `custo` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`idAnimal_fk`) REFERENCES `Animais`(`idAnimal`),
    FOREIGN KEY (`idVeterinario_fk`) REFERENCES `Veterinarios`(`idVeterinario`)
);


-- 5. INSERIR DADOS DE EXEMPLO

-- Inserir Tutores
INSERT INTO `Tutores` (`nome`, `email`, `telefone`, `cidade`) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98888-1111', 'São Paulo'),
('Bruno Costa', 'bruno.costa@email.com', '(21) 97777-2222', 'Rio de Janeiro'),
('Carla Dias', 'carla.dias@email.com', '(31) 96666-3333', 'Belo Horizonte'),
('Daniel Moreira', 'daniel.moreira@email.com', '(48) 95555-4444', 'Florianópolis'),
('Elisa Fernandes', NULL, '(51) 94444-5555', 'Porto Alegre');

-- Inserir Veterinários
INSERT INTO `Veterinarios` (`nome`, `crmv`, `especialidade`) VALUES
('Dr. Ricardo Alves', 'SP-12345', 'Clínico Geral'),
('Dra. Beatriz Lima', 'RJ-54321', 'Cirurgiã'),
('Dr. Mário Sérgio', 'MG-98765', 'Dermatologista'),
('Dra. Lúcia Mendes', 'SP-11223', 'Clínico Geral');

-- Inserir Animais
INSERT INTO `Animais` (`nome`, `especie`, `raca`, `dtNascimento`, `peso_kg`, `idTutor_fk`, `obs`) VALUES
('Thor', 'Cachorro', 'Labrador', '2022-05-15', 28.50, 1, NULL),
('Mia', 'Gato', 'Siamês', '2021-10-01', 4.20, 2, 'Alérgica a frutos do mar'),
('Loki', 'Cachorro', 'Golden Retriever', '2023-01-20', 25.10, 1, 'Muito agitado'),
('Bolinha', 'Cachorro', 'Pug', '2019-03-10', 8.70, 3, NULL),
('Piu-Piu', 'Ave', 'Canário', '2023-11-30', 0.15, 4, NULL),
('Frajola', 'Gato', 'Persa', '2018-07-25', 5.50, 5, 'Necessita escovação diária'),
('Max', 'Cachorro', 'Pastor Alemão', '2020-02-12', 32.00, 2, 'Cão de guarda'),
('Nemo', 'Peixe', 'Peixe-Palhaço', '2024-01-05', 0.10, 3, NULL),
('Garfield', 'Gato', 'SRD', '2021-04-01', 6.80, 4, 'Come muito');

-- Inserir Consultas
INSERT INTO `Consultas` (`idAnimal_fk`, `idVeterinario_fk`, `dtConsulta`, `motivo`, `diagnostico`, `custo`) VALUES
(1, 1, '2025-01-10 10:30:00', 'Check-up anual', 'Saudável', 150.00),
(2, 2, '2025-01-12 14:00:00', 'Vacina V5', 'Aplicação de vacina', 80.00),
(4, 1, '2025-02-05 09:15:00', 'Problema de pele', 'Dermatite alérgica', 180.00),
(3, 3, '2025-02-15 11:00:00', 'Coceira intensa', 'Dermatite (tratamento iniciado)', 200.00),
(1, 1, '2025-03-20 16:00:00', 'Vômito', 'Gastroenterite leve', 220.00),
(5, 4, '2025-04-01 10:00:00', 'Asa machucada', NULL, 100.00),
(7, 2, '2025-04-10 12:00:00', 'Check-up e vacina', 'Saudável, vacina anti-rábica aplicada', 190.00),
(2, 1, '2025-05-05 15:30:00', 'Espirros', 'Rinotraqueíte felina', 170.00),
(6, 3, '2025-05-15 08:30:00', 'Consulta dermatológica', 'Revisão da dermatite', 120.00);

# ATIVIDADES
Passo 1: Seleção Básica (Tabelas e Colunas)
1 - Listar todas as informações da tabela Animais.
2 - Listar apenas o nome, email e cidade de todos os Tutores.
3 - Listar o nome e a especialidade de todos os Veterinarios.
4 - Listar apenas o motivo e o custo de todas as Consultas.

Passo 2: Filtros Simples (Cláusula WHERE e Operadores)
5 - Listar todos os dados dos animais que são da espécie 'Gato'.
6 - Listar o nome e o peso_kg dos animais que pesam mais de 20 kg.
7 - Listar todas as consultas que custaram exatamente R$ 150,00.
8 - Listar o nome e dtNascimento dos animais nascidos a partir de 1º de Janeiro de 2022 (inclusive).
9 - Listar o nome e a raca de todos os animais que não são da raça 'Labrador'.

Passo 3: Filtros Compostos (AND e OR)
10 - Listar todos os animais da espécie 'Cachorro' E que pesam menos de 10 kg.
11 - Listar todas as consultas que ocorreram no ano de 2025 E custaram mais de R$ 180,00.
12 - Listar todos os animais que são da espécie 'Cachorro' OU da espécie 'Gato'.
13 - Listar todos os tutores que moram em 'São Paulo' OU 'Rio de Janeiro'.
14 - Listar todos os animais que são ('Cachorro' E pesam mais de 30kg) OU ('Gato' E pesam menos de 5kg).

Passo 4: Filtros Especiais (LIKE, IN, BETWEEN, IS NULL)
15 - Listar o nome e o telefone dos tutores cujo nome começa com a letra 'A'.
16 - Listar o nome e a raca dos animais cuja raça contenha a palavra 'Retriever'.
17 - Listar o nome, email e cidade dos tutores que moram em 'Belo Horizonte', 'Florianópolis' ou 'Porto Alegre' (Use o operador IN).
18 - Listar o nome (do animal) e o custo das consultas que custaram entre R$ 100,00 e R$ 200,00 (Use o operador BETWEEN).
19 - Listar todos os animais que não têm observações cadastradas (onde a coluna obs é nula).
20 - Listar todas as consultas que já possuem um diagnóstico preenchido (onde a coluna diagnostico não é nula).


# INICIO DOS EXERCÍCIOS 


#EX1
SELECT * FROM `Animais`; -- validado

#EX2
SELECT `nome`, `email`, `cidade` FROM `Tutores`; -- validado

#EX3
SELECT `nome`, `especialidade` FROM `Veterinarios`; --validado

#EX4
SELECT `motivo`, `custo` FROM `Consultas`; -- validado

#EX5
SELECT * FROM `Animais` WHERE `especie` = 'Gato'; --  validado

#EX6
SELECT `nome`, `peso_kg` FROM `Animais` WHERE `peso_kg` > 20; -- validado

#EX7
SELECT * FROM `Consultas` WHERE `custo` = 150.00; -- validado

#EX8
SELECT `nome`, `dtNascimento` FROM `Animais` WHERE `dtNascimento` >= '2022-01-01'; -- validado

#EX9
SELECT `nome`, `raca` FROM `Animais` WHERE `raca` != 'Labrador';  -- validado

#EX10
SELECT * FROM `Animais` WHERE `especie`= 'Cachorro' AND `peso_kg` < 10; -- validado

#EX11
SELECT * FROM `Consultas` WHERE YEAR(`dtConsulta`) = 2025 AND `custo` != 180; -- validado

#EX12
SELECT * FROM `Animais` WHERE `especie` == 'Cachorro' OR `especie`== 'Gato'; --  validado

#EX13 
SELECT * FROM `Tutores` WHERE `cidade` == 'São Paulo' or `cidade`== 'Rio de Janeiro'; -- validado

#EX14
SELECT * FROM `Animais` WHERE `especie` == 'Cachorro' AND `peso_kg` <= 30 OR `especie` = 'Gato' AND `peso_kg` <= 30; -- validado

#EX15
SELECT `nome`, `telefone` FROM `Tutores` WHERE `nome` LIKE '%A%' OR `nome` LIKE '%a%'; -- validado

#EX16 
SELECT `nome`, `raca` FROM `Animais` WHERE `raca` LIKE '%Retriver%'; -- validado

#EX17
SELECT `nome`, `cidade`, `email`FROM `Tutores` WHERE `cidade` IN ('Belo Horizonte', 'Florianopolis', 'Porto Alegre'); -- validado

#EX18
SELECT `nome`, `custo` FROM `Consultas` WHERE `custo` BETWEEN 100 AND 200;

#EX19
SELECT * FROM `Animais` WHERE `obs` IS NULL  -- validado

#EX20
SELECT * FROM `Consultas` WHERE `diagnostico` IS NOT NULL -- validado