-- GEISON DE OLIVEIRA LEMOS FERREIRA
-- Q1 -- 

DELIMITER //

CREATE FUNCTION qtd_inscritos(nome_canal VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT Quantidade_inscritos INTO total
    FROM canal
    WHERE Nome = nome_canal
    LIMIT 1;
    RETURN total;

END //

DELIMITER ;

-- Q2 --

DELIMITER //

CREATE FUNCTION media_visualizacoes(nome_canal VARCHAR(100), anos INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(10,2);

    SELECT AVG(t.Quantidade_visualizacoes) INTO media
    FROM transmissao t
    JOIN canal c ON t.codigo_canal = c.Codigo
    WHERE c.Nome = nome_canal
      AND t.Data_hora_inicio >= DATE_SUB(CURRENT_DATE(), INTERVAL anos YEAR);

    RETURN media;
END //

DELIMITER ;

-- Q3 --

DROP PROCEDURE IF EXISTS registrar_historico_canais;

DELIMITER //

CREATE PROCEDURE registrar_historico_canais()
BEGIN
    CREATE TABLE IF NOT EXISTS HistoricoCanal (
        id INT AUTO_INCREMENT PRIMARY KEY,
        codigo INT,
        nome VARCHAR(100),
        descricao TEXT,
        qtd_inscritos INT,
        qtd_visualizacoes INT,
        data_registro DATETIME
    );

    INSERT INTO HistoricoCanal (codigo, nome, descricao, qtd_inscritos, qtd_visualizacoes, data_registro)
    SELECT 
        c.Codigo,
        c.Nome,
        c.Descricao,
        c.Quantidade_inscritos,
        (
            SELECT SUM(t.Quantidade_visualizacoes)
            FROM transmissao t
            WHERE t.codigo_canal = c.Codigo
              AND t.Data_hora_inicio >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 MONTH)
        ) AS total_visualizacoes,
        NOW()
    FROM canal c
    WHERE 
        c.Quantidade_inscritos >= 1000 AND
        (
            SELECT SUM(t.Quantidade_visualizacoes)
            FROM transmissao t
            WHERE t.codigo_canal = c.Codigo
              AND t.Data_hora_inicio >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 MONTH)
        ) >= 10000;
END //

DELIMITER ;

-- Q4 --

DROP PROCEDURE IF EXISTS desativar_contas_inativas;

DELIMITER //

CREATE PROCEDURE desativar_contas_inativas()
BEGIN
    UPDATE usuario
    SET Status = 'Desativado'
    WHERE Data_hora_ultimo_acesso < DATE_SUB(CURRENT_DATE(), INTERVAL 3 YEAR);
END //

DELIMITER ;

-- Q5 --

DROP FUNCTION IF EXISTS calcular_media_visualizacoes;

DELIMITER //

CREATE FUNCTION calcular_media_visualizacoes(canal_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(10,2);

    SELECT AVG(Quantidade_visualizacoes) INTO media
    FROM transmissao
    WHERE codigo_canal = canal_id
      AND Data_hora_inicio >= DATE_SUB(CURRENT_DATE(), INTERVAL 2 YEAR);

    RETURN IFNULL(media, 0);
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS atualizar_nivel_influencia;

DELIMITER //

CREATE PROCEDURE atualizar_nivel_influencia()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE canal_id INT;
    DECLARE media DECIMAL(10,2);

    DECLARE cur CURSOR FOR SELECT Codigo FROM canal;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO canal_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET media = calcular_media_visualizacoes(canal_id);

        IF media <= 50 THEN
            UPDATE canal SET nivel_influencia = 4 WHERE Codigo = canal_id;
        ELSEIF media <= 500 THEN
            UPDATE canal SET nivel_influencia = 3 WHERE Codigo = canal_id;
        ELSEIF media <= 10000 THEN
            UPDATE canal SET nivel_influencia = 2 WHERE Codigo = canal_id;
        ELSE
            UPDATE canal SET nivel_influencia = 1 WHERE Codigo = canal_id;
        END IF;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;




