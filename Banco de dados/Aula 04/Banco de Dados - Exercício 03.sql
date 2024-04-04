-- Exercícios Slide 03 quarta aula - exercícios 01 --> 08

create database IF NOT EXISTS cadastro_funcionarios;
USE cadastro_funcionarios;

create table funcionarios(
numero_matricula INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
nome_funcionario VARCHAR(100) NOT NULL,
horario_inicio_expediente DATETIME,
horario_fim_expediente DATETIME,
salario DECIMAL(8,2)
); 

insert into funcionarios (cpf, nome_funcionario, horario_inicio_expediente, horario_fim_expediente)
values ('000.111.222-72', 'José da Silva', '2024-04-02 08:00:00', '2024-04-02 09:00:00'),
	   ('952.149.444-82', 'Maria da Silveira', '2024-05-02 09:00:00', '2024-05-02 12:00:00'),
       ('052.212.322-27', 'Joaquina de Souza', '2024-06-03 10:00:00', '2024-06-03 13:00:00');

select * from funcionarios;
