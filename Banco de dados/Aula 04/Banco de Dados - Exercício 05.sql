-- Exercícios Slide 03 quarta aula - exercícios 01 --> 08

create database IF NOT EXISTS biblioteca;
USE biblioteca;

create table biblioteca (
cod_isbi INTEGER PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(100) NOT NULL,
autor VARCHAR (50) NOT NULL,
idioma VARCHAR(30) NOT NULL,
resumo VARCHAR(300),
data_lancamento DATE NOT NULL,
preco DECIMAL(8,2) NOT NULL
);

insert into biblioteca (titulo, autor, idioma, resumo, data_lancamento, preco)
values ('SQL', 'José dos Dados', 'Portugues', 'Tudo sobre SQL', '2024-01-01', 200),
	   ('Java', 'João Nerd', 'Portugues', 'Tudo sobre Java', '2024-02-020', 300),
       ('Projeto Final', 'Bruno dos Porjetos', 'Portugues', 'Tudo sobre Projetos', '2024-02-22', 150);
       
       select * from biblioteca;