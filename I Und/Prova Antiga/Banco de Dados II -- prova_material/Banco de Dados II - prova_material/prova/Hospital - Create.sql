-- =======================
-- Banco de Dados Hospital
-- =======================

DROP DATABASE IF EXISTS Hospital;

CREATE DATABASE Hospital;
USE Hospital;


CREATE TABLE Medico (
    crm_medico VARCHAR(20) PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    salario DECIMAL(7,2) UNSIGNED NOT NULL,
    hierarquia ENUM('Médico', 'Residente', 'Docente') NOT NULL
);

CREATE TABLE Paciente (
    cpf_paciente CHAR(11) PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cor ENUM('Branco', 'Preto', 'Pardo', 'Amarelo', 'Indígena') NOT NULL,
    sexo ENUM('Masculino', 'Feminino') NOT NULL
);

CREATE TABLE Laudo (
    codigo_consulta INTEGER UNSIGNED,
    codigo_laudo INTEGER UNSIGNED,
    data_hora_registro DATETIME NOT NULL,
    resultado VARCHAR(255) NOT NULL,
    conclusao VARCHAR(255),
    status ENUM('Provisório', 'Definitivo') NOT NULL,
    crm_docente VARCHAR(20),
    PRIMARY KEY (codigo_laudo, codigo_consulta)
);

CREATE TABLE Consulta (
    codigo_consulta INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    data_hora_consulta_prevista DATETIME NOT NULL,
    data_hora_consulta_realizada DATETIME,
    hipotese_diagnostica VARCHAR(15) NOT NULL,
    valor_consulta DECIMAL(6,2) UNSIGNED NOT NULL,
    tipo_exame ENUM('Ecocardiograma', 'Eletrocardiograma', 'Mapa', 'Holter') NOT NULL,
    status ENUM('Aguardando', 'Realizada', 'Cancelada') NOT NULL,
    crm_medico VARCHAR(20) NOT NULL,
    cpf_paciente CHAR(11) NOT NULL
);

CREATE TABLE Residente (
    crm_residente VARCHAR(20),
    especialidade VARCHAR(50),
    data_inicio_residencia DATE NOT NULL,
    data_fim_residencia DATE,
    PRIMARY KEY (crm_residente, especialidade)
);

CREATE TABLE Docente (
    crm_docente VARCHAR(20) PRIMARY KEY,
    titulacao ENUM('Doutor', 'Assistente', 'Livre-docente', 'Titular') NOT NULL
);

CREATE TABLE Pagamento (
    cpf_funcionario CHAR(11),
    crm_medico VARCHAR(20),
    mes_referencia TINYINT UNSIGNED,
    ano_referencia YEAR,
    data_hora DATETIME,
    honorario DECIMAL(6,2) UNSIGNED NOT NULL,
    PRIMARY KEY (cpf_funcionario, crm_medico, mes_referencia, ano_referencia)
);

CREATE TABLE Funcionario (
    cpf_funcionario CHAR(11) PRIMARY KEY,
    nome VARCHAR(255),
    telefone VARCHAR(11)
);
 
ALTER TABLE Laudo ADD CONSTRAINT FK_Laudo_2
    FOREIGN KEY (codigo_consulta)
    REFERENCES Consulta (codigo_consulta)
    ON DELETE CASCADE;
 
ALTER TABLE Laudo ADD CONSTRAINT FK_Laudo_3
    FOREIGN KEY (crm_docente)
    REFERENCES Docente (crm_docente);
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_2
    FOREIGN KEY (crm_medico)
    REFERENCES Medico (crm_medico);
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_3
    FOREIGN KEY (cpf_paciente)
    REFERENCES Paciente (cpf_paciente);
 
ALTER TABLE Residente ADD CONSTRAINT FK_Residente_1
    FOREIGN KEY (crm_residente)
    REFERENCES Medico (crm_medico)
    ON DELETE CASCADE;
 
ALTER TABLE Docente ADD CONSTRAINT FK_Docente_2
    FOREIGN KEY (crm_docente)
    REFERENCES Medico (crm_medico)
    ON DELETE CASCADE;
 
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_1
    FOREIGN KEY (cpf_funcionario)
    REFERENCES Funcionario (cpf_funcionario);
 
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_2
    FOREIGN KEY (crm_medico)
    REFERENCES Medico (crm_medico);