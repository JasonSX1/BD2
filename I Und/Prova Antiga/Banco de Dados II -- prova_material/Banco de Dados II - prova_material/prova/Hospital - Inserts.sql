USE Hospital;

INSERT INTO Funcionario
VALUES ('95133231296', 'Isis Caroline Farias', '32998213420'),
	   ('42147555290', 'Rafael Mário Galvão', '32995835074');

INSERT INTO Medico
VALUES ('1469-BA', 'Abel Martin Marquez', 6000.00, 'Médico'),
	   ('52814-BA', 'Luiz Manuel Baptista', 7000.00, 'Médico'),	
	   ('14102-BA', 'Kevin Alexandre Sebastião Galvão', 5000.00, 'Residente'),	
	   ('13086-BA', 'Iago Nelson Alexandre de Paula', 5000.00, 'Residente'),	
	   ('92343-BA', 'Marcela Cecília Kamilly Bernardes', 9700.00, 'Docente'),	
	   ('2145-BA', 'André Gabriel Anthony Viana', 6000.00, 'Médico'),	
	   ('56671-BA', 'Bernardo Francisco Rafael Fogaça', 9700.00, 'Docente'),	
	   ('111224-BA', 'Igor Marcelo Peixoto', 9700.00, 'Docente'),	
	   ('81317-BA', 'Pedro Heitor da Mata', 9700.00, 'Docente'),	
	   ('3593-BA', 'Manoel César Peixoto', 6000.00, 'Médico'),	
	   ('24483-BA', 'Eloá Larissa Emanuelly Rezende', 5000.00, 'Residente'),	
	   ('2009-BA', 'Elaine Isabelle das Neves', 6000.00, 'Médico'),	
	   ('1519-BA', 'Márcio Ryan Figueiredo', 6000.00, 'Médico'),
	   ('7168-BA', 'Michelle Cabral Silva', 9000.00, 'Médico');

INSERT INTO Residente
	   -- Menos de 3 anos de residência
VALUES ('14102-BA', 'Mapa', DATE_SUB(NOW(), INTERVAL 3 MONTH), NULL),
	   ('13086-BA', 'Holter', DATE_SUB(NOW(), INTERVAL 2 YEAR), NULL),
	   -- Mais de três anos de residência.
	   ('24483-BA', 'Eletrocardiograma', DATE_SUB(NOW(), INTERVAL 39 MONTH), NULL),
	   -- Já finalizaram a residência.
	   ('1519-BA', 'Mapa', DATE_SUB(NOW(), INTERVAL 4 YEAR), DATE_SUB(NOW(), INTERVAL 9 MONTH));

INSERT INTO Docente
VALUES ('92343-BA', 'Titular'),	 
   	   ('56671-BA', 'Livre-docente'),	 
   	   ('111224-BA', 'Doutor'),	  
   	   ('81317-BA', 'Livre-docente');  


INSERT INTO Paciente
VALUES ('70012582026', 'Brenda Olivia Ferreira', '1948-07-20', 'Branco', 'Feminino'),
	   ('36421404324', 'Marcos Fábio Aparício', '2015-01-07', 'Preto', 'Feminino'),
	   ('18287261414', 'Isadora Manuela Farias', '1962-10-21', 'Pardo', 'Feminino'),
	   ('52810074160', 'Guilherme Francisco Heitor Rezende', '1972-07-01', 'Amarelo', 'Masculino'),
	   ('99371913606', 'Vicente Thiago Vicente dos Santos',  '1943-08-02', 'Indígena', 'Masculino'),
	   ('26257895812', 'Renato Rodrigo da Conceição', '1987-07-27', 'Pardo', 'Masculino'),
	   ('53995208690', 'Brenda Stella Alícia Araújo', '1993-09-07', 'Preto', 'Feminino'),
	   ('23174747333', 'Maya Rayssa Ferreira', '1966-09-11', 'Branco', 'Feminino'),
	   ('57374639155', 'Gabriel Alexandre dos Santos', '1987-07-19', 'Preto', 'Masculino'),
	   ('78590339092', 'Eduardo Carlos Castro', '2003-10-16', 'Branco', 'Masculino'),
	   ('97905125890', 'Erick Theo Anthony Alves', '2017-01-14', 'Pardo', 'Masculino'),
	   ('43715462264', 'Igor Henry da Mota', '1996-07-16', 'Amarelo', 'Masculino'),
	   ('82355308136', 'Alice Mariane Assunção', '2006-03-07', 'Indígena', 'Feminino'),
	   ('27834150111', 'Alexandre Edson Corte Real', '1989-02-18', 'Pardo', 'Masculino'),
	   ('98921247408', 'Luzia Daniela Silvana Almeida', '1976-04-17', 'Indígena', 'Feminino'),
	   ('22066908533', 'Heloisa Melissa Regina Teixeira', '1966-05-14', 'Amarelo', 'Feminino'),
	   ('90031946968', 'Felipe Cauã Lucca da Silva', '1985-05-01', 'Preto', 'Masculino'),
	   ('56027904038', 'Maitê Bruna Luzia Farias', '1977-05-11', 'Amarelo', 'Masculino'),
	   ('14672391191', 'Patrícia Larissa Gabriela da Luz', '1988-03-15', 'Indígena', 'Feminino'),
	   ('69542994133', 'Priscila Cláudia Isabelle Gomes', '2003-08-18', 'Preto', 'Feminino'),
	   ('84556550700', 'Vitória Luiza Francisca Souza', '1947-05-12', 'Branco', 'Feminino'),
	   ('57986655500', 'Rosângela Betina Nunes', '1966-03-07', 'Amarelo', 'Feminino'),
	   ('19884746559', 'Sandra Raimunda Almada', '1974-07-08', 'Indígena', 'Feminino'),
	   ('55946513060', 'Márcia Lúcia Alves', '1964-04-27', 'Pardo', 'Feminino'),
	   ('26691268040', 'Martin Márcio Nathan Moraes', '2005-01-13', 'Preto', 'Masculino'),
	   ('34708543603', 'Alexandre Diogo Murilo Castro', '1961-06-06', 'Branco', 'Masculino'),
	   ('27290064275', 'Clara Maitê Melissa Farias', '2013-09-24', 'Amarelo', 'Feminino');

INSERT INTO Consulta
	   -- Consultas que devem ser canceladas.
VALUES (1, DATE_SUB(NOW(), INTERVAL 35 HOUR), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '52814-BA', '70012582026'),
	   (2, DATE_SUB(NOW(), INTERVAL 33 HOUR), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '56671-BA', '36421404324'),
	   (3, DATE_SUB(NOW(), INTERVAL 45 HOUR), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '81317-BA', '18287261414'),
	   (4, DATE_SUB(NOW(), INTERVAL 52 HOUR), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '24483-BA', '52810074160'),
	   (5, DATE_SUB(NOW(), INTERVAL 39 HOUR), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '1519-BA', '99371913606'),
	   (6, DATE_SUB(NOW(), INTERVAL 47 HOUR), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '2145-BA', '53995208690'),
	   (7, DATE_SUB(NOW(), INTERVAL 51 HOUR), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '111224-BA', '82355308136'),

	   -- Consultas para o CRM '2009-BA' (ocupado nos próximos 7 dias)
	   (8, DATE_ADD(NOW(), INTERVAL 1 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '2009-BA', '57986655500'),
	   (9, DATE_ADD(NOW(), INTERVAL 2 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '2009-BA', '22066908533'),
	   (10, DATE_ADD(NOW(), INTERVAL 3 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '2009-BA', '43715462264'),
	   (11, DATE_ADD(NOW(), INTERVAL 4 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '2009-BA', '27290064275'),
	   (12, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '2009-BA', '69542994133'),
	   (13, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '2009-BA', '19884746559'),
	   (14, DATE_ADD(NOW(), INTERVAL 7 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '2009-BA', '26691268040'),
	   (15, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '2009-BA', '27290064275'),
	   (16, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '2009-BA', '43715462264'),
	   (17, DATE_ADD(NOW(), INTERVAL 4 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '2009-BA', '26257895812'),


	   -- Consultas para o CRM '1519-BA' (ocupado nos próximos 7 dias)
	   (18, DATE_ADD(NOW(), INTERVAL 1 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '1519-BA', '27290064275'),
	   (19, DATE_ADD(NOW(), INTERVAL 2 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '111224-BA', '99371913606'),
	   (20, DATE_ADD(NOW(), INTERVAL 3 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '1519-BA', '36421404324'),
	   (21, DATE_ADD(NOW(), INTERVAL 4 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '1519-BA', '26257895812'),
	   (22, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '1519-BA', '99371913606'),
	   (23, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '1519-BA', '57374639155'),
	   (24, DATE_ADD(NOW(), INTERVAL 7 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '1519-BA', '36421404324'),
	   (25, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '1519-BA', '70012582026'),
	   (26, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '1519-BA', '90031946968'),
	   (27, DATE_ADD(NOW(), INTERVAL 4 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '1519-BA', '27834150111'),


	   -- Consultas (livre nos próximos 7 dias)
	   (28, DATE_ADD(NOW(), INTERVAL 1 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '24483-BA', '18287261414'),
	   (29, DATE_ADD(NOW(), INTERVAL 2 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '111224-BA', '22066908533'),
	   (30, DATE_ADD(NOW(), INTERVAL 3 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '52814-BA', '26257895812'),
	   (31, DATE_ADD(NOW(), INTERVAL 4 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '52814-BA', '52810074160'),
	   (32, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '52814-BA', '70012582026'),
	   (33, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '52814-BA', '27290064275'),
	   (34, DATE_ADD(NOW(), INTERVAL 7 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '52814-BA', '55946513060'),
	   (35, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '52814-BA', '14672391191'),
	   (36, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '52814-BA', '84556550700'),


	   -- Consultas (ocupado nos próximos 7 dias)
	   (38, DATE_ADD(NOW(), INTERVAL 1 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '24483-BA', '27290064275'),
	   (39, DATE_ADD(NOW(), INTERVAL 2 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '3593-BA', '99371913606'),
	   (40, DATE_ADD(NOW(), INTERVAL 3 DAY), NULL, 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '3593-BA', '36421404324'),
	   (41, DATE_ADD(NOW(), INTERVAL 4 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '3593-BA', '26257895812'),
	   (42, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '3593-BA', '99371913606'),
	   (43, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '3593-BA', '57374639155'),
	   (44, DATE_ADD(NOW(), INTERVAL 7 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '3593-BA', '36421404324'),
	   (45, DATE_ADD(NOW(), INTERVAL 6 DAY), NULL, 'CID-10', 250.00, 'Mapa', 'Aguardando', '3593-BA', '70012582026'),
	   (46, DATE_ADD(NOW(), INTERVAL 5 DAY), NULL, 'CID-10', 500.00, 'Holter', 'Aguardando', '3593-BA', '90031946968'),

	   -- Consultas realizadas no mês, porém o status está equivocado
	   (48, DATE_SUB(NOW(), INTERVAL 35 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 35 DAY), INTERVAL 1 HOUR ), 'CID-10', 500.00, 'Holter', 'Aguardando', '111224-BA', '34708543603'),
	   (49, DATE_SUB(NOW(), INTERVAL 36 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 36 DAY), INTERVAL 1 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '13086-BA', '27290064275'),
	   (50, DATE_SUB(NOW(), INTERVAL 37 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 37 DAY), INTERVAL 2 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Aguardando', '14102-BA', '26691268040'),
	   (51, DATE_SUB(NOW(), INTERVAL 38 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 38 DAY), INTERVAL 4 HOUR), 'CID-10', 250.00, 'Mapa', 'Aguardando', '1519-BA', '55946513060'),
	   (52, DATE_SUB(NOW(), INTERVAL 44 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 44 DAY), INTERVAL 3 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Aguardando', '2145-BA', '19884746559'),
	   
	   -- Consultas realizadas no mês passado
	   (53, DATE_SUB(NOW(), INTERVAL 32 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 32 DAY), INTERVAL 2 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Realizada', '92343-BA', '57986655500'),
	   (54, DATE_SUB(NOW(), INTERVAL 33 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 33 DAY), INTERVAL 3 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '92343-BA', '84556550700'),
	   (55, DATE_SUB(NOW(), INTERVAL 34 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 34 DAY), INTERVAL 1 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '111224-BA', '14672391191'),
	   (56, DATE_SUB(NOW(), INTERVAL 35 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 35 DAY), INTERVAL 4 HOUR), 'CID-10', 500.00, 'Holter', 'Realizada', '111224-BA', '56027904038'),
	   (57, DATE_SUB(NOW(), INTERVAL 36 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 36 DAY), INTERVAL 1 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Realizada', '111224-BA', '90031946968'),	   
	   (58, DATE_SUB(NOW(), INTERVAL 37 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 37 DAY), INTERVAL 2 HOUR), 'CID-10', 500.00, 'Holter', 'Realizada', '81317-BA', '22066908533'),
	   (59, DATE_SUB(NOW(), INTERVAL 38 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 38 DAY), INTERVAL 2 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '81317-BA', '98921247408'),
	   (60, DATE_SUB(NOW(), INTERVAL 39 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 39 DAY), INTERVAL 4 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '81317-BA', '27834150111'),
	   (61, DATE_SUB(NOW(), INTERVAL 40 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 40 DAY), INTERVAL 3 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '24483-BA', '82355308136'),
	   (62, DATE_SUB(NOW(), INTERVAL 41 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 41 DAY), INTERVAL 6 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Realizada', '24483-BA', '43715462264'),
	   (63, DATE_SUB(NOW(), INTERVAL 42 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 42 DAY), INTERVAL 4 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Realizada', '24483-BA', '97905125890'),
	   (64, DATE_SUB(NOW(), INTERVAL 43 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 43 DAY), INTERVAL 1 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '1519-BA', '78590339092'),
	   (65, DATE_SUB(NOW(), INTERVAL 44 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 44 DAY), INTERVAL 2 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '1519-BA', '57374639155'),
	   (66, DATE_SUB(NOW(), INTERVAL 45 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 45 DAY), INTERVAL 35 MINUTE), 'CID-10', 500.00, 'Holter', 'Realizada', '1519-BA', '23174747333'),
	   (67, DATE_SUB(NOW(), INTERVAL 46 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 46 DAY), INTERVAL 50 MINUTE), 'CID-10', 340.00, 'Ecocardiograma', 'Realizada', '2145-BA', '53995208690'),

	   -- Consultas realizadas no mês passado
	   (68, DATE_SUB(NOW(), INTERVAL 33 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 33 DAY), INTERVAL 1 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '14102-BA', '27834150111'),
	   (69, DATE_SUB(NOW(), INTERVAL 45 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 45 DAY), INTERVAL 1 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '14102-BA', '82355308136'),
	   (70, DATE_SUB(NOW(), INTERVAL 35 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 35 DAY), INTERVAL 2 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Realizada', '14102-BA', '43715462264'),
	   (71, DATE_SUB(NOW(), INTERVAL 44 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 44 DAY), INTERVAL 4 HOUR),'CID-10', 340.00, 'Ecocardiograma', 'Realizada', '13086-BA', '97905125890'),
	   (72, DATE_SUB(NOW(), INTERVAL 36 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 36 DAY), INTERVAL 3 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '13086-BA', '78590339092'),
	   (73, DATE_SUB(NOW(), INTERVAL 47 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 47 DAY), INTERVAL 2 HOUR), 'CID-10', 250.00, 'Mapa', 'Realizada', '13086-BA', '57374639155'),

	   -- Consultas realizadas durante todo período de residência do 24483-BA no mês passado
	   (74, DATE_SUB(NOW(), INTERVAL 45 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 45 DAY), INTERVAL 1 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '27834150111'),
	   (75, DATE_SUB(NOW(), INTERVAL 46 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 46 DAY), INTERVAL 3 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '82355308136'),
	   (76, DATE_SUB(NOW(), INTERVAL 50 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 50 DAY), INTERVAL 2 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '43715462264'),
	   (77, DATE_SUB(NOW(), INTERVAL 51 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 51 DAY), INTERVAL 4 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '97905125890'),
	   (78, DATE_SUB(NOW(), INTERVAL 39 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 39 DAY), INTERVAL 3 HOUR),'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '27834150111'),
	   (79, DATE_SUB(NOW(), INTERVAL 41 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 41 DAY), INTERVAL 6 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '57986655500'),
	   (80, DATE_SUB(NOW(), INTERVAL 53 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 53 DAY), INTERVAL 7 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '26691268040'),
	   (81, DATE_SUB(NOW(), INTERVAL 35 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 35 DAY), INTERVAL 1 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '19884746559'),
	   (82, DATE_SUB(NOW(), INTERVAL 47 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 47 DAY), INTERVAL 16 MINUTE), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '43715462264'),
	   (83, DATE_SUB(NOW(), INTERVAL 37 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 37 DAY), INTERVAL 10 MINUTE), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '70012582026'),
	   (84, DATE_SUB(NOW(), INTERVAL 55 DAY), DATE_ADD(DATE_SUB(NOW(), INTERVAL 55 DAY), INTERVAL 10 MINUTE), 'CID-10', 450.00, 'Eletrocardiograma', 'Realizada', '24483-BA', '27290064275'),


	   -- Consultas Canceladas
	   (85, DATE_SUB(NOW(), INTERVAL 1 YEAR), DATE_ADD(DATE_SUB(NOW(), INTERVAL 1 YEAR), INTERVAL 1 HOUR), 'CID-10', 250.00, 'Mapa', 'Cancelada', '24483-BA', '70012582026'),
	   (86, DATE_SUB(NOW(), INTERVAL 2 YEAR), DATE_ADD(DATE_SUB(NOW(), INTERVAL 2 YEAR), INTERVAL 9 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Cancelada', '111224-BA', '26257895812'),
	   (87, DATE_SUB(NOW(), INTERVAL 1 YEAR), DATE_ADD(DATE_SUB(NOW(), INTERVAL 1 YEAR), INTERVAL 2 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Cancelada', '111224-BA', '57374639155'),
	   (88, DATE_SUB(NOW(), INTERVAL 26 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 26 MONTH), INTERVAL 4 HOUR), 'CID-10', 500.00, 'Holter', 'Cancelada', '2145-BA', '82355308136'),
	   (89, DATE_SUB(NOW(), INTERVAL 4 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 HOUR),'CID-10', 340.00, 'Ecocardiograma', 'Cancelada', '3593-BA', '14672391191'),
	   (90, DATE_SUB(NOW(), INTERVAL 26 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 26 MONTH), INTERVAL 6 HOUR), 'CID-10', 250.00, 'Mapa', 'Cancelada', '2009-BA', '19884746559'),
	   (91, DATE_SUB(NOW(), INTERVAL 26 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 26 MONTH), INTERVAL 7 HOUR), 'CID-10', 500.00, 'Holter', 'Cancelada', '1519-BA', '26691268040'),
	   (92, DATE_SUB(NOW(), INTERVAL 9 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 9 MONTH), INTERVAL 1 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Cancelada', '2009-BA', '19884746559'),
	   (93, DATE_SUB(NOW(), INTERVAL 7 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 16 HOUR), 'CID-10', 500.00, 'Holter', 'Cancelada', '1469-BA', '43715462264'),
	   (94, DATE_SUB(NOW(), INTERVAL 9 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 9 MONTH), INTERVAL 2 HOUR), 'CID-10', 250.00,   'Mapa', 'Cancelada', '52814-BA', '70012582026'),
	   (95, DATE_SUB(NOW(), INTERVAL 4 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 10 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Cancelada', '52814-BA', '55946513060'),
	   (96, DATE_SUB(NOW(), INTERVAL 7 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 5 HOUR), 'CID-10', 450.00, 'Eletrocardiograma', 'Cancelada', '1519-BA', '19884746559'),
	   (97, DATE_SUB(NOW(), INTERVAL 4 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 10 HOUR), 'CID-10', 500.00, 'Holter', 'Cancelada', '1469-BA', '27290064275'),
	   (98, DATE_SUB(NOW(), INTERVAL 6 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 9 MONTH), INTERVAL 3 HOUR), 'CID-10', 340.00, 'Ecocardiograma', 'Cancelada', '92343-BA', '14672391191'),
	   (99, DATE_SUB(NOW(), INTERVAL 3 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 10 HOUR), 'CID-10', 500.00, 'Holter', 'Cancelada', '1519-BA', '69542994133'),
	   (100, DATE_SUB(NOW(), INTERVAL 1 MONTH), DATE_ADD(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 HOUR), 'CID-10', 500.00, 'Holter', 'Cancelada', '92343-BA', '27290064275');





INSERT INTO Laudo
	   -- Laudos definitivos
VALUES (67, 1, DATE_SUB(NOW(), INTERVAL 1 DAY), 'Lorem', 'Lorem Ipsum', 'Definitivo', NULL),
	   (66, 2, DATE_SUB(NOW(), INTERVAL 2 DAY), 'Etiam varius velit', 'Quisque feugiat nibh in laoreet venenatis.', 'Definitivo', NULL),
	   (65, 3, DATE_SUB(NOW(), INTERVAL 3 DAY), 'Aenean in diam e', 'pharetra, sem orci imperdiet', 'Definitivo', NULL),
	   (64, 4, DATE_SUB(NOW(), INTERVAL 4 DAY), 'Curabitur vel sodales ', 'tae nisi sagittis vehicula. Fu', 'Definitivo', NULL),
	   (63, 5, DATE_SUB(NOW(), INTERVAL 5 DAY), 'Nunc egestas ultricies e', 't scelerisque ac no', 'Definitivo', NULL),
	   (62, 6, DATE_SUB(NOW(), INTERVAL 6 DAY), 'equat metus lacus', 'augue sodal', 'Definitivo', NULL),

	   -- Provisórios
	   (68, 7, DATE_SUB(NOW(), INTERVAL 1 MONTH), 'finibus. Maec', 'c eu enim. Maec', 'Provisório', NULL),
	   (69, 8, DATE_SUB(NOW(), INTERVAL 20 DAY), 'pien, maximus vitae finibus sed', 'augue sodal', 'Provisório', NULL),
	   (70, 9, DATE_SUB(NOW(), INTERVAL 1 MONTH), 'rnare metus, vel tin', 'on metus. Duis ornare cursus elit,', 'Provisório', NULL),

	   -- Revisados
	   (71, 10, DATE_SUB(NOW(), INTERVAL 1 YEAR), 'odio. Aenean tempor ex non mag', 'it amet justo auctor malesuada. Mauris ves', 'Definitivo', '92343-BA'),
	   (72, 11, DATE_SUB(NOW(), INTERVAL 9 MONTH), 'equat metus lacus', 'arius diam, ut vulpu', 'Definitivo', '56671-BA'),
	   (73, 12, DATE_SUB(NOW(), INTERVAL 4 MONTH), 'ndit. Nam a semper arcu, nec fer', 'rius diam, ut vulput', 'Definitivo', '111224-BA'),

	   -- Laudos registrados durante toda a residência do 24483-BA
	   (74, 13, DATE_SUB(NOW(), INTERVAL 11 MONTH), 'Lorem', 'Lorem Ipsum', 'Definitivo', '92343-BA'),
	   (75, 14, DATE_SUB(NOW(), INTERVAL 23 MONTH), 'Etiam varius velit', 'Quisque feugiat nibh in laoreet venenatis.', 'Definitivo', '92343-BA'),
	   (76, 15, DATE_SUB(NOW(), INTERVAL 11 MONTH), 'Aenean in diam e', 'pharetra, sem orci imperdiet', 'Definitivo', '56671-BA'),
	   (77, 16, DATE_SUB(NOW(), INTERVAL 25 MONTH), 'Curabitur vel sodales ', 'tae nisi sagittis vehicula. Fu', 'Definitivo', '56671-BA'),
	   (78, 17, DATE_SUB(NOW(), INTERVAL 3 MONTH), 'Nunc egestas ultricies e', 't scelerisque ac no', 'Definitivo', '56671-BA'),
	   (79, 18, DATE_SUB(NOW(), INTERVAL 25 MONTH), 'equat metus lacus', 'augue sodal', 'Definitivo', '81317-BA'),
	   (80, 19, DATE_SUB(NOW(), INTERVAL 25 MONTH), 'Lorem', 'Lorem Ipsum', 'Definitivo', '81317-BA'),
	   (81, 20, DATE_SUB(NOW(), INTERVAL 8 MONTH), 'Curabitur vel sodales ', 'tae nisi sagittis vehicula. Fu', 'Definitivo', '92343-BA'),
	   (82, 21, DATE_SUB(NOW(), INTERVAL 6 MONTH), 'Etiam varius velit', 'Quisque feugiat nibh in laoreet venenatis.', 'Definitivo', '92343-BA'),
	   (83, 22, DATE_SUB(NOW(), INTERVAL 8 MONTH), 'Nunc egestas ultricies e', 't scelerisque ac no', 'Definitivo', '92343-BA'),
	   (84, 23, DATE_SUB(NOW(), INTERVAL 3 MONTH), 'Aenean in diam e', 'pharetra, sem orci imperdiet', 'Definitivo', '81317-BA');
