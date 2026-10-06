
# EXEMPLOS ' QUAIS ANIMAIS PERTENCEM A QUIAS TUTORES?
 
SELECT
A.nome AS 'Nome do Animal',
T.nome AS 'Nome do Tutor',
T.cidade AS 'Cidade do Tutor'
FROM
Animais AS A 
INNER JOIN
Tutores AS T ON A.idTutor_fk = T.idTutor;