/*Q1*/

DELIMITER $$

CREATE TRIGGER tr_delete_dependentes
BEFORE DELETE ON Funcionario
FOR EACH ROW
BEGIN
    DELETE FROM Dependente
    WHERE matricula = OLD.matricula;
END$$

DELIMITER ;

/*Q2*/

DELIMITER $$

CREATE TRIGGER tr_delete_projeto_relacionados
BEFORE DELETE ON Projeto
FOR EACH ROW
BEGIN
    DELETE FROM HorasTrabalhadas
    WHERE codProjeto = OLD.codProjeto;
    DELETE FROM FuncionarioProjeto
    WHERE codProjeto = OLD.codProjeto;
END$$

DELIMITER ;

/*Q3*/

DELIMITER $$

CREATE TRIGGER tr_valida_idade_dependente
BEFORE INSERT ON Dependente
FOR EACH ROW
BEGIN
    DECLARE idade INT;

    SET idade = TIMESTAMPDIFF(YEAR, NEW.dataNascimento, CURDATE());

    IF (NEW.sexo = 'M' AND idade > 18) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dependente do sexo masculino não pode ter mais de 18 anos.';
    END IF;

    IF (NEW.sexo = 'F' AND idade > 21) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dependente do sexo feminino não pode ter mais de 21 anos.';
    END IF;
END$$

DELIMITER ;

/* Q4 - Foram utilizados dois triggers para isso: */

-- Trigger para o insert 

DELIMITER $$

CREATE TRIGGER tr_prevent_supervisor_igual_func_insert
BEFORE INSERT ON Funcionario
FOR EACH ROW
BEGIN
    IF NEW.matricula = NEW.matriculaSupervisor THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Um funcionário não pode ser seu próprio supervisor.';
    END IF;
END$$

DELIMITER ;

-- Trigger para o update:

DELIMITER $$

CREATE TRIGGER tr_prevent_supervisor_igual_func_update
BEFORE UPDATE ON Funcionario
FOR EACH ROW
BEGIN
    IF NEW.matricula = NEW.matriculaSupervisor THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Um funcionário não pode ser seu próprio supervisor.';
    END IF;
END$$

DELIMITER ;

/*Q5 - Novamente, temos dois triggers:*/

-- insert:

DELIMITER $$

CREATE TRIGGER tr_projeto_limite_horas_insert
BEFORE INSERT ON Projeto
FOR EACH ROW
BEGIN
    IF NEW.horasPrevistas > 2000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é permitido criar projetos com mais de 2.000 horas previstas.';
    END IF;
END$$

DELIMITER ;


-- update:

DELIMITER $$

CREATE TRIGGER tr_projeto_limite_horas_update
BEFORE UPDATE ON Projeto
FOR EACH ROW
BEGIN
    IF NEW.horasPrevistas > 2000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é permitido atualizar projetos para mais de 2.000 horas previstas.';
    END IF;
END$$

DELIMITER ;

/*Q6 - Teremos três triggers para resolver esta questão:*/


-- insert:

DELIMITER $$

CREATE TRIGGER tr_bonus_salario_insert
AFTER INSERT ON FuncionarioProjeto
FOR EACH ROW
BEGIN
    UPDATE Funcionario
    SET salario = salario + 800
    WHERE matricula = NEW.matricula;
END$$

DELIMITER ;

-- update:

DELIMITER $$

CREATE TRIGGER tr_bonus_salario_update
AFTER UPDATE ON FuncionarioProjeto
FOR EACH ROW
BEGIN
    IF OLD.dataFim IS NULL AND NEW.dataFim IS NOT NULL THEN
        UPDATE Funcionario
        SET salario = salario - 800
        WHERE matricula = NEW.matricula;
    END IF;
END$$

DELIMITER ;

-- delete:

DELIMITER $$

CREATE TRIGGER tr_bonus_salario_delete
AFTER DELETE ON FuncionarioProjeto
FOR EACH ROW
BEGIN
    UPDATE Funcionario
    SET salario = salario - 800
    WHERE matricula = OLD.matricula;
END$$

DELIMITER ;








