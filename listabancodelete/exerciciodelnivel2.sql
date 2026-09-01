Nível Intermediário
6 - UPDATE: Para todos os projetos solicitados antes de '2025-09-15', atualize a descrição para 'PROJETO LEGADO - ' concatenado com a descrição original. (Ex: 'PROJETO LEGADO - Plataforma para e-commerce').

7 - UPDATE: O empregado 'Lucas Andrade' (CPF '666.666.666-66') registrou 15 horas de trabalho a mais no projeto de código 3. Atualize o valor de hrTrab para o valor atual mais 15.

8 - DELETE: Remova todos os projetos cujo preço seja inferior a R$ 6000,00.

9 - UPDATE: A data estimada de entrega de todos os projetos gerenciados pela 'Ana Souza' (CPF '444.444.444-44') foi adiada em 7 dias. Atualize a coluna dtEstimada.

10 - DELETE: Um empregado com o CPF '999.999.999-99' foi cadastrado por engano e não está alocado em nenhum projeto. Delete-o da tabela empregado. (Este exercício pressupõe que você insira um registro para poder testar).


#INICIO

UPDATE `projeto`
SET `descricao` = CONCAT('PROJETO LEGADO - ', `descricao`)
WHERE `dtSolicitacao` < '2025-09-15' #validado


UPDATE `projEmp`
SET `hrTrab` = `hrTrab` + 15
WHERE `cpfEmpregado` = '666.666.666-66' AND `codProj` = 3 #validado


DELETE FROM `projeto`
WHERE `preco` < 6000.00 #validado


UPDATE `projeto`
SET `dtEstimada` = DATE_ADD(`dtEstimada`, INTERVAL 7 DAY)  #PESQUISEI SOBRE
WHERE `cpfGerente` = '444.444.444-44' #validado


DELETE FROM `empregado`
WHERE `cpf` = '999.999.999-99' #validado
