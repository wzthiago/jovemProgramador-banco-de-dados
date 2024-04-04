-- Exercícios Slide 02 terceira aula - exercícios 01 --> 08

show databases;

create database IF NOT EXISTS exercicios_slide_terceira_aula;

USE exercicios_slide_terceira_aula;

create table cadastro_funcionarios ( 
numero_matricula INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
salario DECIMAL(8,2)
);

create table tbl_programa_televisao (
id_programa INT PRIMARY KEY AUTO_INCREMENT,
nome_programa VARCHAR(150) NOT NULL,
emissora VARCHAR(50) NOT NULL,
data_horario_inicio DATE NOT NULL,
data_horario_fim DATE NOT NULL
); 

create table funcionarios (
cpf INT PRIMARY KEY AUTO_INCREMENT,
numero_matricula INT NOT NULL,
nome_funcionario VARCHAR(100) NOT NULL,
horario_inicio_expediente DATE,
horario_fim_expediente DATE,
salario FLOAT
);

create table estacionamento_carros (
id INT PRIMARY KEY AUTO_INCREMENT,
placa_carro VARCHAR(10) NOT NULL,
horario_entrada DATE NOT NULL,
horario_saida DATE NOT NULL
);

create table biblioteca (
cod_isbi INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(100) NOT NULL,
autor VARCHAR (50) NOT NULL,
idioma VARCHAR(30) NOT NULL,
resumo VARCHAR(300),
data_lancamento DATE NOT NULL,
preco DECIMAL(8,2)
);

create table cadastrado_exercicios (
numero_exercicio INT PRIMARY KEY AUTO_INCREMENT,
descricao_exercicio VARCHAR(100) NOT NULL,
data_exercicio DATE NOT NULL,
descricao_solucao VARCHAR(200)
);

create table sistema_qualquer (
id INT PRIMARY KEY AUTO_INCREMENT,
login VARCHAR(80) NOT NULL,
nome_completo VARCHAR(100) NOT NULL,
senha VARCHAR(30) NOT NULL,
email VARCHAR(50) NOT NULL,
data_ultimo_acesso DATE NOT NULL
);




