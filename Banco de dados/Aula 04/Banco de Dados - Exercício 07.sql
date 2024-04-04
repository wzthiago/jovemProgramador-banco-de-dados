-- Exercícios Slide 03 quarta aula - exercícios 01 --> 08

create database IF NOT EXISTS dados_usuarios;
USE dados_usuarios;

create table dados_usuarios(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
login VARCHAR(80) NOT NULL,
nome_completo VARCHAR(100) NOT NULL,
senha VARCHAR(30) NOT NULL,
email VARCHAR(50) NOT NULL,
data_ultimo_acesso DATETIME NOT NULL
);

insert into dados_usuarios (login, nome_completo, senha, email, data_ultimo_acesso)
values ('wzusuario', 'Usuario da Silva', 'senha01', 'email@usuario.com', '2024-05-02 09:00:00'),
	   ('sqljoaquim', 'Joaquim Silverio', 'knzdfzf', 'joaquimsql@usuario.com', '2024-05-02 09:00:00'),
       ('javajoao', 'Joao Souza', 'anfffsa', 'joaojava@usuario.com', '2024-06-03 10:00:00');

select * from dados_usuarios;