# Q1
SELECT ultima_inscricao AS "Inscrito?", COUNT(*) AS QuantInscricao
FROM Inscricao
GROUP BY ultima_inscricao;

#Q2
SELECT p.nome AS NomeParticipante, m.turma AS Turma, m.palestrante AS Palestrante
FROM Participante p
JOIN Inscricao i ON p.cpf = i.cpf
JOIN Minicurso m ON i.codMinicurso = m.codMinicurso
WHERE m.titulo LIKE '%Introdução ao MySQL%'
ORDER BY p.nome DESC;

#Q3
SELECT DISTINCT p.sexo AS Sexo, p.nome AS NomeParticipante
FROM Participante p
JOIN Inscricao i ON p.cpf = i.cpf
ORDER BY p.sexo DESC, p.nome ASC;

#Q4
SELECT p.nome AS NomeParticipante
FROM Participante p
WHERE p.cpf NOT IN (SELECT i.cpf FROM Inscricao i)
ORDER BY p.nome DESC;
