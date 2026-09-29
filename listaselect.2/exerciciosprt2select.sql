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

Seção 1: Renomeação de Colunas (Aliases AS)
O objetivo aqui é praticar a formatação da saída da consulta, tornando os cabeçalhos das colunas mais legíveis.
1 - Tutores: Selecione a coluna nome e a coluna cidade da tabela Tutores. Renomeie-as para 'Nome do Tutor' e 'Cidade'.
2 - Veterinários: Selecione o nome e a especialidade dos veterinários. Renomeie as colunas para 'Veterinário(a)' e 'Especialidade'.
3 - Animais e Peso: Liste o nome e o peso_kg de todos os animais. Renomeie as colunas para 'Nome do Animal' e 'Peso (kg)'.
4 - Consultas: Selecione a dtConsulta e o custo da tabela Consultas. Renomeie as colunas para 'Data da Consulta' e 'Valor (R$)'.

Seção 2: Ordenação de Resultados (ORDER BY)
O objetivo é praticar a classificação dos resultados em ordem ascendente (ASC) e descendente (DESC).
5 - Ordem Alfabética (ASC): Liste o nome de todos os Tutores em ordem alfabética (A-Z).
6 - Ordem Alfabética (DESC): Liste o nome de todos os Animais em ordem alfabética inversa (Z-A).
7 - Animais Mais Pesados (DESC): Liste o nome e o peso_kg dos animais, ordenados do mais pesado para o mais leve.
8 - Consultas Mais Baratas (ASC): Liste o motivo e o custo das consultas, ordenadas da mais barata para a mais cara.
9 - Animais Mais Novos (Data DESC): Liste o nome e a dtNascimento dos animais, ordenados do mais novo para o mais velho (data de nascimento mais recente primeiro).
10 - Animais Mais Velhos (Data ASC): Liste o nome e a dtNascimento dos animais, ordenados do mais velho para o mais novo (data de nascimento mais antiga primeiro).
11 - Consultas Recentes (Data/Hora DESC): Liste o motivo e a dtConsulta das consultas, ordenadas da mais recente para a mais antiga.
12 - Ordem Dupla: Liste os Animais ordenando primeiro pela especie (em ordem alfabética) e, para animais da mesma espécie, ordene pelo nome (também em ordem alfabética).

Seção 3: Limitação de Resultados (LIMIT)
O objetivo é praticar a restrição do número de linhas retornadas, essencial para "Top N" e paginação.
13 - Os 5 Primeiros: Selecione os 5 primeiros Animais cadastrados (use o idAnimal).
14 - Os 3 Primeiros: Selecione as 3 primeiras Consultas registradas na tabela (use a idConsulta).
15 - Paginação (Página 1): Simule uma página de resultados. Liste os Tutores, mas mostre apenas 2 por página. Exiba a "Página 1" (os dois primeiros).
16 - Paginação (Página 2): Usando a lógica do exercício anterior, exiba a "Página 2" da lista de Tutores (pule os 2 primeiros e mostre os 2 seguintes). Use a sintaxe LIMIT [offset], [count].

Seção 4: Desafios Combinados (AS, ORDER BY, LIMIT)
O objetivo é resolver problemas práticos combinando as três técnicas.
17 - O Animal Mais Pesado: Encontre o animal mais pesado da clínica. Exiba apenas o nome (como 'Animal Mais Pesado') e o peso_kg (como 'Peso (kg)').
18 - A Consulta Mais Cara: Qual foi a consulta de maior custo? Exiba o motivo (como 'Motivo'), o diagnostico (como 'Diagnóstico') e o custo (como 'Valor').
19 - Top 3 Animais Mais Novos: Liste os 3 animais mais novos (data de nascimento mais recente). Exiba o nome (como 'Nome'), a especie (como 'Espécie') e a dtNascimento (como 'Nascimento').
20 - As 2 Consultas Mais Antigas: Encontre as duas consultas mais antigas registradas. Exiba a dtConsulta (como 'Data') e o motivo (como 'Motivo').


# inicio dos exercicios


#EX1
SELECT 
`nome`AS 'Nome',
`cidade` AS 'Cidade'
FROM `Tutores`;

#EX2
SELECT 
`nome`AS 'Nome',
`especialidade` AS 'Especialidade'
FROM `Veterinários`;

#EX3    
SELECT 
`nome`AS 'Nome do Animal',
`peso_kg` AS 'Peso (kg)'
FROM `Animais`;

#EX4
SELECT 
`dtConsulta` AS 'Data da Consulta',
`custo` AS 'Valor (R$)'    
FROM `Consultas`;   

#EX5
SELECT
`nome` FROM `Tutores` ORDER BY `nome` ASC;

#EX6
SELECT
`nome` FROM `Animais` ORDER BY `nome` DESC;

#EX7
SELECT
`nome`, `peso_kg` FROM `Animais` ORDER BY `peso_kg` DESC;

#EX8
SELECT
`motivo`, `custo` FROM `Consultas` ORDER BY `custo` ASC;        

#EX9
SELECT
`nome`, `dtNascimento` FROM `Animais` ORDER BY `dtNascimento` DESC;

#EX10
SELECT
`nome`, `dtNascimento` FROM `Animais` ORDER BY `dtNascimento` ASC;

#EX11
SELECT
`motivo`, `dtConsulta` FROM `Consultas` ORDER BY `dtConsulta` DESC;

#EX12
SELECT
`nome`, `especie` FROM `Animais` ORDER BY `especie` ASC, `nome` ASC;    

#EX13
SELECT
`nome`, `especie` FROM `Animais` ORDER BY `idAnimal` ASC LIMIT 5;

#EX14
SELECT
`motivo`, `custo` FROM `Consultas` ORDER BY `idConsulta` ASC LIMIT 3;   

#EX15
SELECT
`nome`, `cidade` FROM `Tutores` ORDER BY `idTutor` ASC LIMIT 0,2;

#EX16
SELECT
`nome`, `cidade` FROM `Tutores` ORDER BY `idTutor` ASC LIMIT 2,2;

#EX17 
SELECT
`nome` AS 'Animal mais pesado',
`peso_kg` AS ' Peso (kg)'
FROM `Animais` ORDER BY `Peso (kg)` DESC;

#EX18
SELECT
`motivo` AS 'Motivo',
`diagnostico`AS 'Diagnostico',
`custo` AS 'Valor'
FROM `Consultas` ORDER BY `custo` DESC;

#EX19
SELECT
`nome` AS 'Nome',
`especie`AS 'Espécie',
`dtNascimento` AS 'Nascimento'
FROM `Animais` ORDER BY `Nascimento` ASC LIMIT 3;


#EX20
SELECT
`dtConsulta` AS 'Data',
`motivo` AS 'Motivo'
FROM `Consultas` ORDER BY `Data` ASC LIMIT 2;

