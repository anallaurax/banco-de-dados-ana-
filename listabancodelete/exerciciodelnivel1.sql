Nível Básico
1 - UPDATE: O cliente 'João da Silva' (CPF '111.111.111-11') mudou de número de telefone. Atualize o telefone dele para 48998765432.

2 - UPDATE: O empregado 'Carlos Pereira' (CPF '333.333.333-33') foi promovido. Atualize o cargo dele para 'Desenvolvedor Sênior'.

3 - DELETE: O cliente 'Pedro Gomes' (CPF '555.555.555-55') encerrou o contrato com a empresa. Remova o registro dele da tabela cliente.

4 - UPDATE: Aumente o preço de todos os projetos em 10%.

5 - DELETE: A alocação do empregado 'Carlos Pereira' (CPF '333.333.333-33') no projeto de código 2 (codProj = 2) foi um erro. Exclua esse registro da tabela projEmp.

# INICIO

UPDATE `cliente`
SET `telefone` = '48998765432'
WHERE `cpf`= '111.111.111-11' #validado


UPDATE `empregado`
SET `cargo` = 'Desenvolvedor Sênior'
WHERE `cpf`= '333.333.333-33'  #validado


DELETE FROM `cliente`
WHERE `cpf` = '555.555.555-55' #validado


UPDATE `projeto`
SET `preco` = `preco` * 1.10 #validado


DELETE FROM `projEmp`
WHERE `cpfEmpregado` = '333.333.333-33' AND `codProj` = 2 #validado
