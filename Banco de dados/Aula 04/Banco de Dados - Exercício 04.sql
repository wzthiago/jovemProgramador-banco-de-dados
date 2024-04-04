-- Exercícios Slide 03 quarta aula - exercícios 01 --> 08

create database IF NOT EXISTS estacionamento_carros;
USE estacionamento_carros;

create table estacionamento_carros(
id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
placa_carro VARCHAR(10) NOT NULL,
horario_entrada DATETIME,
horario_saida DATETIME
);

insert into estacionamento_carros (placa_carro, horario_entrada, horario_saida)
values ('mlu9045', '2024-04-02 08:00:00', '2024-04-02 09:00:00'),
	   ('xml2058', '2024-05-02 09:00:00', '2024-05-02 12:00:00'),
       ('bmo5090', '2024-06-03 10:00:00', '2024-06-03 13:00:00');

select * from estacionamento_carros;
