# Q1 - Quais os alunos não possuem nenhum telefone? Fazer solução com Join, outra com Exists e outra com All.

#Solução usando Join:

SELECT a.*
FROM aluno a
LEFT JOIN alunotelefone t ON a.matricula = t.matricula
WHERE t.matricula IS NULL;


#Solução usando Exists:
SELECT *
FROM aluno a
WHERE NOT EXISTS (
    SELECT 1
    FROM alunotelefone t
    WHERE t.matricula = a.matricula
);


#Solução usando All:
SELECT *
FROM aluno a
WHERE a.matricula <> ALL (
    SELECT t.matricula
    FROM alunotelefone t
);


# Q2 - Quais as disciplinas do curso de Sistemas de Informação têm pelo menos um pré-requisito? Fazer solução com Exists e outra com Any.

#Solução usando Exists:
SELECT d.*
FROM Disciplina d
WHERE EXISTS (
    SELECT 1
    FROM Prerequisito p
    WHERE p.codDisciplina = d.codDisciplina
);


#Solução usando Any:
SELECT *
FROM Disciplina
WHERE codDisciplina = ANY (
    SELECT codDisciplina
    FROM Prerequisito
);

# Q3 - Qual o percentual de alunos não possui nenhum telefone? Mostrar o percentual com somente duas casas decimais. Fazer solução com Exists e outra com CASE.

#Solução usando Exists:
SELECT ROUND( 100.0 * (
	SELECT COUNT(*)
	FROM Aluno a
	WHERE NOT EXISTS (
		SELECT 1
                FROM AlunoTelefone t
                WHERE t.matricula = a.matricula
	)
) / COUNT(*), 2) AS percentual_sem_telefone
FROM Aluno;


#Solução usando CASE:
SELECT ROUND(100.0 * SUM(
	CASE WHEN a.matricula NOT IN (
		SELECT t.matricula
		FROM AlunoTelefone t
	) THEN 1
	ELSE 0
	END
) / COUNT(*), 2) AS percentual_sem_telefone
FROM Aluno a;

# Q4 - Quais os alunos do sistema acadêmico possuem nota maior do que todos os alunos que concluíram a disciplina Estrutura de Dados? Informar o nome, a nota, o curso e a disciplina destes alunos. Utilizar os alias apropriados. Fazer solução com All.

SELECT 
#subconsultinha pra gerar uma coluna com a maior nota de estrutura de dados antes dos alunos com notas maiores que essa
    (SELECT MAX(c2.nota)
     FROM Concluido c2
     JOIN Disciplina d2 ON c2.codDisciplina = d2.codDisciplina
     WHERE d2.nome = 'Estrutura de Dados') AS maior_nota_estrutura_dados,
     
    a.nome AS nome_aluno,
    c1.nota AS nota,
    cu.nome AS nome_curso,
    d1.nome AS nome_disciplina
FROM Aluno a
JOIN Curso cu ON a.codCurso = cu.codCurso
JOIN Concluido c1 ON a.matricula = c1.matricula
JOIN Disciplina d1 ON c1.codDisciplina = d1.codDisciplina
WHERE c1.nota > ALL (
    SELECT c3.nota
    FROM Concluido c3
    JOIN Disciplina d3 ON c3.codDisciplina = d3.codDisciplina
    WHERE d3.nome = 'Estrutura de Dados'
);


