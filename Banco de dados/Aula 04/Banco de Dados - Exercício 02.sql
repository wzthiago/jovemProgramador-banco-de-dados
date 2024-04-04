-- Exercícios Slide 02 terceira aula - exercícios 01 --> 08
show databases;

create database IF NOT EXISTS programa_tv ;
USE programa_tv;

create table programas_tv (
id_programa INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome_programa VARCHAR(100) NOT NULL,
emissora VARCHAR(50) NOT NULL,
data_horario_inicio DATETIME NOT NULL,
data_horario_fim DATETIME NOT NULL
); 

insert into programas_tv (nome_programa, emissora, data_horario_inicio, data_horario_fim)
values ('Programa Esporte', 'Cultura', '2024-04-02 08:00:00', '2024-04-02 09:00:00'),
	   ('Programa Culinário', 'TV aberta', '2024-05-04 10:00:00', '2024-05-04 12:00:00'),
       ('Programa Notícias', 'TV Notícias', '2024-06-01 08:00:00', '2024-06-01 09:00:00');

select * from programas_tv;


