-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
-- Aluno: Brendo Gomes Prates
-- Disciplina: Banco de dadods II
-- avaliação 2-unidade
-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
-- 1. O Hospital não permitirá a visualização, inserção, atualização ou exclusão diretamente nas tabelas 
-- do banco de dados. Assim, as operações de escrita serão realizadas através de procedures, enquanto 
-- que as consultas serão pré-estabelecidas através de visões. Sabendo disso, faça o que se pede:
-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

-- =============================================================================================================
-- a) (0,5 Ponto) Crie um usuário com o nome de "Recepcionista". Esse usuário deve possuir uma senha e apenas 
-- terá acesso ao banco a partir da máquina local. Ele será o usuário utilizado nas transações iniciadas pela 
-- recepção do hospital.
-- =============================================================================================================

create user Recepcionista@localhost
identified by '123';

-- =============================================================================================================
-- b) (0,5 Ponto) A recepção poderá consultar as consultas cadastradas, algumas informações dos pacientes e 
-- algumas informações dos médicos. Essas informações serão necessárias para o registro de novas consultas 
-- e para a confirmação de consultas já existentes. Portanto, crie a seguinte visão:
-- =============================================================================================================

--  Deve-se exibir, em relação a cada paciente, o nome completo, o CPF, a data de nascimento, a cor, o 
-- sexo, a quantidade de consultas aguardando atendimento, a quantidade de consultas que foram realizadas 
-- e a quantidade de consultas que foram canceladas.

drop view if exists vw_consulta;
create view vw_consulta(Nome, CPF, Data_nascimento, Cor, Sexo, Qnt_consultas_aguardadas,
Qnt_consultas_realizadas, Qnt_consultas_canceladas) as 
select a.nome_completo, a.cpf_paciente, a.data_nascimento, a.cor, a.sexo,
sum(case when b.status = 'aguardando' then 1 else 0 end), -- consultas aguardadas
sum(case when b.status = 'realizada' then 1 else 0 end), --  consultas realizadas
sum(case when b.status = 'cancelada' then 1 else 0 end) --   consultas canceladas
-- (select distinct count(*)from consulta where status like 'cancelada')  metodo errado perdi 20min de prova nisso kkk
from paciente A, consulta B
where a.cpf_paciente = b.cpf_paciente
group by cpf_paciente;

select * from vw_consulta; -- ver view

-- =============================================================================================================
-- c) (0,5 Ponto) Conceda, ao usuário "Recepcionista", o privilégio de CONSULTA na visão criada no Item b)
-- =============================================================================================================

grant select on vw_consulta to Recepcionista@localhost;

-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
-- 2. O Hospital deseja melhorar o desempenho das consultas SQL com técnicas de tuning (otimização) a 
-- fim de permitir que os usuários acessem as informações mais rápidas. Diante deste contexto, 
-- responda:
-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

-- =============================================================================================================
-- a) (0,5 Ponto) Que técnica, estudada em BD-2, pode ser utilizada para aumentar o desempenho das consultas?
-- =============================================================================================================
	-- Uma tecnica que pode ser utilizada é a indexação de alguma coluna da tabela "coluna apropiada", isso ira almentar
    -- o desempenho das consultas. 
    
-- =============================================================================================================
-- b) (0,5 Ponto) Dê um exemplo de otimização que possa ser feita a partir da necessidade do usuário "Recepcionista".
-- =============================================================================================================
	-- Você pode criar um índice na coluna nome_paciente da tabela paciente para acelerar as consultas
	-- que envolvem a pesquisa de um paciente de um nome específico, é um otimo índice ja que é mais comum
	-- realizar consultas de paciente pelo seu nome do que pelo seu cpf(que é a chave primaria).
    
    -- Você tambem pode criar um índice na coluna cpf_paciente da tabela Consulta, para acelerar as consultas que envolvem
    -- a pesquisa de consultas de um paciente específico, ja que é mais pratico procurar a consulta de um paciente pelo
    -- seu cpf do que pelo codigo_consulta ( o cpf_cliente é chave secundaria);

-- =============================================================================================================
-- c) (0,5 Ponto) Implemente o código do Item b)
-- =============================================================================================================

create index idx_nome_paciente on paciente(nome_completo); -- index do nome do paciente
create index idx_cpf_paciente on Consulta(cpf_paciente); -- index do cpf do paciente

show index from paciente; -- ver index nome paciente
show index from consulta; -- ver index  cpf paciente

-- testando indices
explain select * from paciente force index(idx_nome_paciente);
explain select * from consulta force index(idx_cpf_paciente);

-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
-- 3 Responder as questões com as regras de negócio a fim de garantir as restrições de integridade:
-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

-- =============================================================================================================
-- a) (1,0 Ponto) Criar um gatilho (trigger), ao cadastrar um médico na tabela "Medico", a fim de efetuar duas 
-- verificações:
-- =============================================================================================================
-- Se a hierarquia do médico for "Residente", deve-se cadastrar um novo registro na tabela "Residente" 
-- com a data atual sendo a data de início da residência e a especialidade sendo "Clínica";
-- Se a hierarquia do médico for "Docente", deve-se cadastrar um novo registro na tabela "Docente" com 
-- a titulação "Assistente", que é a titulação inicial do hospital.

delimiter $$
drop trigger if exists t_inserir_medico $$
create trigger t_inserir_medico
after insert on Medico 
for each row
begin
-- registrando um medico "Residente"
    if new.hierarquia = 'Residente' then
        insert into Residente (crm_residente, especialidade, data_inicio_residencia)
        values (new.crm_medico, 'Clínica', CURDATE()); 
-- registrando um medico "Docente"   
    elseif new.hierarquia = 'Docente' then
        insert into Docente (crm_docente, titulacao)
        values (new.crm_medico, 'Assistente');
    end if;
end$$
delimiter ;
-- Por fim, mostrar um exemplo de acionamento do gatilho para cada situação supracitada.
insert into medico values	
	   ('14132-BA', 'Mario Kard', 5000.00, 'Residente'), -- inserindo medico residente
       ('14130-BA', 'Minecraft Pirata', 10000.00, 'Docente'); -- inserindo medico docente

-- verificando se o medico foi adicionado aos residentes       
select * from residente
where crm_residente ='14132-BA';

-- verificando se o medico foi adicionado aos residentes 
select * from docente
where crm_docente ='14130-BA';

-- =============================================================================================================
-- b) (1,0 Ponto) Criar um procedimento (stored procedure) a fim de atualizar o status das consultas conforme
-- as regras:
-- =============================================================================================================
-- Se o status está "Aguardando" e a consulta não foi realizada após 24 horas da data prevista de realização, 
-- o status da consulta deve ser alterado para "Cancelada"; 

-- Se o status está "Aguardando" e a consulta foi realizada até 24 horas da data prevista de realização, o 
-- status da consulta deve ser alterado para "Realizada".
 
 -- tentei fazer com a view criada na questão mais acima mais buguei kkk fui no seco msm.
delimiter $$
drop procedure if exists sp_atualizar_status_consulta$$
create procedure sp_atualizar_status_consulta()
begin
update consulta set status = case when status = 'Aguardando' 
and data_hora_consulta_realizada is not null
and timestampdiff(hour, data_hora_consulta_prevista, data_hora_consulta_realizada) <= 24
then 'Realizada' -- consulta realizada

when status = 'Aguardando' and data_hora_consulta_realizada is null
and timestampdiff(hour, data_hora_consulta_prevista, now()) > 24
then 'Cancelada' -- consulta cancelada

else status -- status permanece
end;
end $$
delimiter ;

-- Por fim, mostrar como é feita a chamada do procedimento.
call sp_atualizar_status_consulta();
-- sem tempo para implementar :(

-- =============================================================================================================
-- c) (0,5 Ponto) Criar uma função (function) que retorna a quantidade de consulta com status "Aguardando" de 
-- um paciente para um específico tipo de exame, tendo o CPF do paciente e o tipo de exame como parâmetros. 
-- Por fim, mostrar um exemplo de chamada da função.
-- =============================================================================================================
delimiter $$
drop function if exists f_quantidade_consultas_aguardando $$
create function f_quantidade_consultas_aguardando(cpf_paciente char(11),
tipo_exame enum('Ecocardiograma', 'Eletrocardiograma', 'Mapa', 'Holter'))
returns int
begin
    declare quantidade_consultas int;
    select count(*) into quantidade_consultas from consulta a
    where a.cpf_paciente = cpf_paciente
    and status = 'Aguardando'
    and a.tipo_exame = tipo_exame;
    return quantidade_consultas;
end$$
delimiter ; 

-- teste se a função funcionar :(
select f_quantidade_consultas_aguardando('12345678901', 'Ecocardiograma');

-- =============================================================================================================
-- d) (1,0 Ponto) Um paciente pode agendar várias consultas para diferentes tipos de exame, exceto fazer um 
-- agendamento para o mesmo tipo de exame que ainda esteja com status "Aguardando". Assim, é necessário 
-- criar um gatilho (trigger) para atender essa regra de negócio. Então, o gatilho:
-- =============================================================================================================
-- Não deve permitir a inserção de uma consulta com o mesmo tipo de exame se já existir uma, com status 
-- "Aguardando", para o mesmo paciente;
-- Deve emitir uma mensagem de erro para o usuário, caso esta regra de negócio seja infringida.
-- Por fim, mostrar um exemplo de acionamento do gatilho.
-- OBS: Utilizar a função criação no Item c) a fim de auxiliar na resolução desta questão.

delimiter $$
drop trigger if exists tw_consulta_inserir $$
create trigger tw_consulta_inserir
before insert on consulta 
for each row
begin
    if new.status = 'Aguardando'
    then if exists ( select * from consulta
    where cpf.paciente = new.cpf_paciente
    and tipo.exame = new.tipo_exame)-- iria implementar a função aqui 
    then
    signal sqlstate'80000'
    set message_text = 'Não da para agendar múltiplas consultas para um mesmo tipo de exame que esta sendo aguardado !!';
        end if;
	 end if;
END $$
delimiter ;

-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
-- 4. O Hospital terá uma alta quantidade de acessos simultâneos. Sendo assim, deseja-se que o SGBD 
-- seja o mais performático possível. Todavia, por questões de segurança e integridade, não deve ser 
-- permitido que dados que não foram efetivamente gravados na base de dados possam ser lidos por 
-- alguma outra transação. Sendo assim, o problema da leitura suja não pode ocorrer. Tendo em vista 
-- esse cenário, responda:
-- §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

-- =============================================================================================================
-- a) (0,5 Ponto) Qual é o nível de isolamento ideal para o SGBD nesse cenário?
-- =============================================================================================================
--  Considerando a necessidade de evitar leituras sujas e a alta quantidade de acessos simultâneos que teremos, qualquer nível
--  de isolamento acima do "Read Uncommitted ", ja é o suficiente para lidar com o problema de leitura suja.
--  Então da para se utilizar o nivel de isolamento (1) "Read Committed" Esse nível de isolamento ira nos garantir que nenhuma transação
--  possa ler dados não confirmados por uma transação em andamento.
--  Mas na duvida ou em casos que você queira uma segurança completa é recomendável utilizar o nivel de isolamento (3) "Serializable"
--  porque alem de garantir que sera evitado o problema de leitura suja, ele tambem nos garante que outros tipos de anomalias,
--  como o de leitura não repetivel e registro fantasma não irão ocorrer.

-- =============================================================================================================
-- b) (1,0 Ponto) Demonstre o problema da leitura suja utilizando um nível de isolamento diferente do informado
-- no Item a).
-- =============================================================================================================

-- $$$$$$$$$$$$$$$$$$$$$$
-- solução com problema
-- $$$$$$$$$$$$$$$$$$$$$$

-- Transação A
SET AUTOCOMMIT = 0;
set session transaction isolation level read uncommitted; 
start transaction;
select nome_completo from paciente
where cpf_paciente = "34708543603";  -- Lê um saldo não confirmado

-- Transação B
SET AUTOCOMMIT = 0;
set session transaction isolation level read uncommitted; 
start transaction;
update paciente set nome_completo = "Chapolin Colorado"
where cpf_paciente = "34708543603"; -- Modifica o nome

-- Transação A lê novamente antes do COMMIT da Transação B
select nome_completo from paciente
where cpf_paciente = "34708543603";

-- commit transação b
commit;

-- Neste caso, a transação 1 é realizada antes da transação 2. Mas, antes de ocorrer a finalização(commit ou rollback) da
-- transação 2 que edita dados que estao sendo utilizados, a transação 1 ler os dados alterados antes da  confirmação o que
-- acaba em uma leitura suja do nome.

-- $$$$$$$$$$$$$$$$$$$$$$
-- solução sem problema
-- $$$$$$$$$$$$$$$$$$$$$$

-- Transação A
SET AUTOCOMMIT = 0;
set session transaction isolation level Repeatable Read;
start transaction;
select nome_completo from paciente
where cpf_paciente = "34708543603";  -- Lê um saldo não confirmado

-- Transação B
SET AUTOCOMMIT = 0;
set session transaction isolation level Repeatable Read; 
start transaction;
update paciente set nome_completo = "Chapolin Colorado"
where cpf_paciente = "34708543603"; -- Modifica o nome

-- Transação A lê novamente antes do COMMIT da Transação B
-- porem o nome NÃO foi atualizados sem o COMMIT na Transação 2
select nome_completo from paciente
where cpf_paciente = "34708543603";

-- commit transação b
-- Ao confirmar a alteração do nome, a transação 1 poderá ler os dados atualizados
commit;

-- Transação 1
-- O nome só foi atualizado  SOMENTE após o COMMIT na Transação 2
-- Portanto, NÃO há uma leitura suja
select nome_completo from paciente
where cpf_paciente = "34708543603";

