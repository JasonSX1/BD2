
#Q6 - Quais os alunos (nome e nota) ficaram com nota acima de 7 na disciplina Estrutura de Dados?

SELECT a.nome AS NomeAluno, c.nota AS Nota
FROM concluido c
JOIN aluno a ON a.matricula = c.matricula
JOIN disciplina d ON d.codDisciplina = c.codDisciplina
WHERE d.nome = 'Estrutura de Dados' AND c.nota > 7;

#Q7 - Qual o total das disciplinas do curso Agronomia?

SELECT COUNT(DISTINCT codDisciplina) AS TotalDiscAgronomia FROM aluno a
JOIN curso c ON a.codCurso = c.codCurso
JOIN matriculado m ON m.matricula = a.matricula
WHERE c.nome = 'Agronomia';

#Q8 - Qual a quantidade de alunos do sexo masculino e feminino matriculados na disciplina Introdução a
Programação?

SELECT a.sexo, COUNT(*) AS TotalAluno
FROM aluno a
JOIN concluido c ON c.matricula = a.matricula
JOIN disciplina d ON d.codDisciplina = c.codDisciplina
WHERE d.nome = 'Introdução a Programação'
GROUP BY a.sexo;

#Q9 - *Qual a disciplina do curso de Sistemas de Informação com maior número de aprovação?
SELECT d.nome AS Disciplina, COUNT(*) AS TotalAprovados
FROM concluido c
JOIN disciplina d ON d.codDisciplina = c.codDisciplina
JOIN aluno a ON a.matricula = c.matricula
JOIN curso cr ON cr.codCurso = a.codCurso
WHERE cr.nome = 'Sistemas de Informação' AND c.nota >= 6
GROUP BY d.nome
ORDER BY TotalAprovados DESC
LIMIT 1;

#Q10 - A disciplina Estrutura de Dados é pré-requisito de quais disciplinas?

SELECT nome
FROM disciplina
WHERE codDisciplina IN (
    SELECT codDisciplina
    FROM prerequisito
    WHERE codPrerequisito = (
        SELECT codDisciplina
        FROM disciplina
        WHERE nome = 'Estrutura de Dados'
    )
);
