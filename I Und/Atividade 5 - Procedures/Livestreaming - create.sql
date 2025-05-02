CREATE DATABASE IF NOT EXISTS Livestreaming;
USE Livestreaming;

CREATE TABLE usuario (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Apelido VARCHAR(30) NOT NULL,
  Senha VARCHAR(100) NOT NULL,
  Nome VARCHAR(100) DEFAULT NULL,
  Data_inscricao DATE NOT NULL,
  Data_hora_ultimo_acesso DATETIME NOT NULL,
  Status ENUM('Ativado','Desativado') NOT NULL,
  PRIMARY KEY (Codigo)
);

CREATE TABLE categoria (
  codigo INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(256) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE canal (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(50) NOT NULL,
  Descricao VARCHAR(256) DEFAULT NULL,
  Nivel_Influencia ENUM('1','2','3','4') DEFAULT NULL,
  Quantidade_inscritos INT DEFAULT NULL,
  Codigo_usuario INT DEFAULT NULL,
  PRIMARY KEY (Codigo),
  FOREIGN KEY (Codigo_usuario) REFERENCES usuario(Codigo)
);

CREATE TABLE transmissao (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Titulo VARCHAR(256) NOT NULL,
  Data_hora_inicio DATETIME NOT NULL,
  Quantidade_anuncios_exibidos MEDIUMINT DEFAULT NULL,
  Quantidade_visualizacoes INT DEFAULT NULL,
  Data_hora_fim DATETIME DEFAULT NULL,
  codigo_canal INT DEFAULT NULL,
  codigo_categoria INT DEFAULT NULL,
  PRIMARY KEY (Codigo),
  FOREIGN KEY (codigo_canal) REFERENCES canal(Codigo),
  FOREIGN KEY (codigo_categoria) REFERENCES categoria(codigo)
);

CREATE TABLE doacao (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Valor DECIMAL(7,2) NOT NULL,
  Mensagem VARCHAR(256) DEFAULT NULL,
  Data_hora DATETIME NOT NULL,
  Codigo_usuario INT DEFAULT NULL,
  Codigo_transmissao INT DEFAULT NULL,
  PRIMARY KEY (Codigo),
  FOREIGN KEY (Codigo_usuario) REFERENCES usuario(Codigo),
  FOREIGN KEY (Codigo_transmissao) REFERENCES transmissao(Codigo)
);

CREATE TABLE mensagem (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Texto VARCHAR(256) NOT NULL,
  Data_hora DATETIME NOT NULL,
  Codigo_usuario INT DEFAULT NULL,
  Codigo_transmissao INT DEFAULT NULL,
  PRIMARY KEY (Codigo),
  FOREIGN KEY (Codigo_usuario) REFERENCES usuario(Codigo),
  FOREIGN KEY (Codigo_transmissao) REFERENCES transmissao(Codigo)
);

-- Dados da tabela usuario
INSERT INTO usuario VALUES 
(1,'Indira','rT49U#18aQQF','Sophia Malu Débora de Paula','2023-12-01','2024-09-21 18:06:49','Ativado'),
(2,'MuscleMa','ecy80Y#99G%B','Betina Rosângela Camila Vieira','2024-02-01','2024-09-30 18:06:49','Ativado'),
(3,'Presbiopic','a7P0CCP32d@p','Fabio Makoto Akita','2024-09-21','2024-10-01 08:06:49','Ativado'),
(4,'Belizard','aK52DDS$R15y','Lucas Kaique Gustavo Souza','2023-10-01','2024-10-01 18:04:49','Ativado'),
(5,'DadOfTheDead','5FSg8%8LE!q^','Thales Henrique Emanuel da Luz','2020-10-01','2024-05-01 18:06:49','Ativado'),
(6,'Slyrack','b7G1#%Wc5T0B','Eduarda Bárbara da Luz','2023-11-01','2024-10-01 18:01:49','Ativado'),
(7,'MutantFate','!1wPpu3K46EA','Carlos Eduardo Ruan Bento Rocha','2024-09-01','2024-09-16 18:06:49','Ativado'),
(8,'Scapula','iD5^H6*Q9%Cn','Sophia Esther Cardoso','2024-06-01','2024-09-30 22:06:49','Ativado'),
(9,'Sceptre','k05%^UEhBB19','Fabiana Carolina Sophia Castro','2024-03-01','2024-10-01 18:06:35','Ativado'),
(10,'Warlockk','Iq&84y6!1*7%','Yuri Anderson Hugo da Cruz','2016-10-01','2020-10-01 18:06:49','Ativado'),
(11,'Archerwell','jEk@b60r7L6$','Gustavo Oliver Sales','2024-04-01','2020-10-01 18:06:49','Ativado'),
(12,'HereSheIs','qNC%s93VTl4U','Fátima Camila Silvana Cavalcanti','2015-10-01','2019-10-01 18:06:49','Desativado');

-- Dados da tabela categoria
INSERT INTO categoria VALUES 
(1,'Programação'),(2,'Jogos'),(3,'E-Sports'),(4,'IRL'),
(5,'Música'),(6,'Design'),(7,'Carreira');

-- Dados da tabela canal
INSERT INTO canal VALUES 
(1,'Revista TI Hoje','Um canal de comunicação com a comunidade interna e externa criado e mantido pela área de computação do IFBA - Campus Vitória da Conquista.',NULL,1477,1),
(2,'CS50','This is CS50, Harvard Universitys introduction to the intellectual enterprises of computer science and the art of programming.',NULL,1190000,2),
(3,'Akitando','Este é o canal "AKITANDO" onde eu, Fabio Akita, também conhecido como @AkitaOnRails vou falar dos assuntos que sempre gostei.',NULL,321000,3),
(4,'PGL','PGL is one of the biggest esports organizations in Europe, running and promoting events since 2002.',NULL,201000,12);

-- Dados da tabela transmissao
INSERT INTO transmissao VALUES 
(1,'[4K] Main Stream - PGL Major Stockholm 2021 - Challengers Stage - Day 1','2024-07-01 18:06:49',16,590874,'2024-07-02 05:06:49',4,3),
(2,'[4K] Main Stream - PGL Major Stockholm 2021 - Challengers Stage - Day 2','2024-07-01 18:06:49',16,359597,'2024-07-02 02:06:49',4,3),
(3,'[4K] Main Stream - PGL Major Stockholm 2021 - Challengers Stage - Day 3','2024-07-01 18:06:49',16,423321,'2024-07-02 04:06:49',4,3),
(4,'[4K] Main Stream - PGL Major Stockholm 2021 - Challengers Stage - Day 4','2024-07-01 18:06:49',16,453671,'2024-07-02 03:06:49',4,3),
(5,'Intercâmbio & Carreira Internacional','2024-09-21 18:06:49',0,233,'2024-09-21 20:06:49',1,7),
(6,'O mercado de Tech além do código - FT Yuri Cangussú','2024-09-22 18:06:49',0,50,'2024-09-22 20:06:49',1,7),
(7,'INTERCÂMBIO & TRABALHO - FEAT Amélia Moreira','2024-09-23 18:06:49',0,49,'2024-09-23 20:06:49',1,7),
(8,'Segurança da Informação e Ataques Cibernéticos','2024-09-16 18:06:49',0,144,'2024-09-16 20:06:49',1,1),
(9,'CS50P - Introduction','2024-08-01 18:06:49',0,14,'2024-08-01 18:10:49',2,1),
(10,'CS50P - Lecture 0 - Functions, Variables','2024-08-01 18:06:49',0,54,'2024-08-01 20:06:49',2,1),
(11,'CS50P - Lecture 1 - Conditionals','2024-08-01 18:06:49',0,36,'2024-08-01 20:06:49',2,1),
(12,'CS50P - Lecture 2 - Loops','2024-08-01 18:06:49',0,49,'2024-08-01 20:06:49',2,1),
(13,'Não Terceirize suas Decisões! | A Lição MAIS Importante da sua Vida','2024-07-01 18:06:49',0,1439,'2024-07-01 18:36:49',3,7),
(14,'Guia DEFINITIVO de Aprendendo a Aprender | A maior BRONCA da sua vida [RATED R]','2024-08-01 18:06:49',0,7726,'2024-08-01 18:46:49',3,7),
(15,'Entendendo GIT | (não é um tutorial!)','2024-08-01 18:06:49',0,1988,'2024-08-01 19:06:49',3,1),
(16,'A Forma Ideal de Projetos Web | Os 12 Fatores','2024-08-01 18:06:49',0,8536,'2024-08-01 18:41:49',3,1);
