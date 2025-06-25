-- Geração de dados para a coleção de administradores:

SELECT JSON_OBJECT(
    '_id', T1.codAdm,
    'nome', T1.nome,
    'login', T1.login,
    'senha', T1.senha
)
FROM Administrador AS T1;

-- Gerando dados para a coleção servidores:

SELECT JSON_OBJECT(
    '_id', S.siape,
    'nome', S.nome,
    'email', S.email,
    'telefones', JSON_ARRAYAGG(ST.telefone)
)
FROM Servidor AS S
LEFT JOIN ServidorTelefone AS ST ON S.siape = ST.siape
GROUP BY S.siape, S.nome, S.email;

-- Gerando dados para a coleção equipamentos:

SELECT JSON_OBJECT(
    '_id', E.tombo,
    'nome', E.nome,
    'status', E.status,
    'dataHoraAtualizacaoStatus', E.dataHoraAtualizacaoStatus,
    'mantidoPor', JSON_OBJECT('codAdm', A.codAdm, 'nome', A.nome)
)
FROM Equipamento AS E
JOIN Administrador AS A ON E.codAdm = A.codAdm;

-- Gerando dados para a coleção reservasAuditorio:

SELECT JSON_OBJECT(
    '_id', RA.codReserva,
    'motivo', RA.motivo,
    'data', RA.data,
    'status', RA.status,
    'horaInicio', RA.horaInicial,
    'horaFim', RA.horaFinal,
    'dataHoraSolicitacao', RA.dataHoraSolicitacao,
    'reservadoPor',
        CASE
            WHEN S.siape IS NOT NULL THEN JSON_OBJECT('siape', S.siape, 'nome', S.nome, 'email', S.email)
            ELSE NULL
        END,
    'equipamentoReservado', COALESCE(
        (SELECT JSON_ARRAYAGG(
            JSON_OBJECT('tombo', E.tombo, 'nome', E.nome)
        )
        FROM EquipamentoReservado AS ER
        JOIN Equipamento AS E ON ER.tombo = E.tombo
        WHERE ER.codReserva = RA.codReserva),
        JSON_ARRAY()
    )
)
FROM ReservaAuditorio AS RA
LEFT JOIN Servidor AS S ON RA.siape = S.siape;

