-- Exercícios Slide 03 quarta aula - exercícios 01 --> 08

create database IF NOT EXISTS solucao_exercicios;
USE solucao_exercicios;

create table solucao_exercicios(
numero_exercicio INTEGER PRIMARY KEY AUTO_INCREMENT,
descricao_exercicio VARCHAR(100) NOT NULL,
data_exercicio DATE NOT NULL,
descricao_solucao VARCHAR(200)
);

insert into solucao_exercicios (descricao_exercicio, data_exercicio, descricao_solucao)
values ('exercicios 01 SQL', '2024-04-02 09:00:00', 'feito no Workbench'),
	   ('exercicios 02 SQL', '2024-05-02 09:00:00', 'feito no Workbench'),
       ('exercicios 03 SQL', '2024-06-03 10:00:00', 'feito no Workbench');

select * from solucao_exercicios;