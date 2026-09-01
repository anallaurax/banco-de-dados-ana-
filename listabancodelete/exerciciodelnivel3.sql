Nível Avançado
11 - UPDATE: O gerente de projetos mudou. Transfira a gerência de todos os projetos do cliente 'Maria Oliveira' (CPF '222.222.222-22') para o empregado 'Carlos Pereira' (CPF '333.333.333-33'). Atenção: Primeiro, você precisaria atualizar o cargo do 'Carlos Pereira' para 'Gerente de Projetos' para manter a consistência do modelo.

12 - DELETE: Exclua todos os projetos que já passaram da data de dtFim (data de finalização) e cujo cliente não seja 'João da Silva'.


#INICIO

UPDATE `empregado`
SET `cargo`= `Gerente de Projetos`
WHERE `cpf` = '333.333.333-33'  #validado 

UPDATE `projeto`
SET `cpfGerente` = '333.333.333-33'
WHERE `cpfCliente` = '222.222.222-22' #validado


DELETE FROM `projeto`
WHERE `dtFim` < CURDATE()
AND `cpfCliente` <> '111.111.111-11' #validado   #essa parte fui obrigada a pesquisar