CREATE DATABASE IF NOT EXISTS olimpiadas;

USE olimpiadas;

CREATE TABLE esporte (
codigo_esporte INT NOT NULL PRIMARY KEY,
nome_esporte VARCHAR(100) NOT NULL,
sigla_coi_esporte CHAR(2) NOT NULL
);

CREATE TABLE continente(
codigo_continente INT NOT NULL PRIMARY KEY,
nome_continente VARCHAR(100) NOT NULL
);

CREATE TABLE pais (
codigo_pais INTEGER NOT NULL PRIMARY KEY,
nome_oficial_pais VARCHAR(100) NOT NULL,
nome_coi_pais VARCHAR (100) NOT NULL,
sigla_coi_pais CHAR(3) NOT NULL,
codigo_continente INT NOT NULL,
FOREIGN KEY (codigo_continente) REFERENCES continente(codigo_continente)
);

CREATE TABLE atleta (
codigo_atleta INT NOT NULL PRIMARY KEY,
nome_atleta VARCHAR(100) NOT NULL,
sexo CHAR(1) NOT NULL,
codigo_esporte INT NOT NULL,
codigo_pais INT NOT NULL,
FOREIGN KEY (codigo_esporte) REFERENCES esporte(codigo_esporte),
FOREIGN KEY (codigo_pais) REFERENCES pais(codigo_pais)
);

CREATE TABLE eventos(
codigo_evento INT NOT NULL PRIMARY KEY,
nome_evento VARCHAR(100) NOT NULL,
codigo_esporte_associado INT NOT NULL,
FOREIGN KEY (codigo_esporte_associado) REFERENCES esporte(codigo_esporte)
);

CREATE TABLE idiomas(
codigo_idioma INT NOT NULL PRIMARY KEY,
nome_idioma VARCHAR(50) NOT NULL
);

CREATE TABLE atleta_idioma(
codigo_atleta INT NOT NULL,
codigo_idioma INT NOT NULL,
PRIMARY KEY (codi_atleta, codigo_idioma),
FOREIGN KEY (codigo_atleta) REFERENCES atleta(codigo_atleta),
FOREIGN KEY (codigo_idioma) REFERENCES idioma(codigo_idioma)
);


INSERT INTO esporte (codigo_esporte, nome_esporte, sigla_coi_esporte) VALUES (1, 'JUDO', 'JU'),
 (2, 'Boxing', 'BX'),
 (3, 'Football', 'FB'),
 (4, 'Water Polo', 'WP'),
 (5, 'Hockey', 'HO'),
 (6, 'Atletics', 'AT');
 
 INSERT INTO continente (codigo_continente, nome_continente) VALUES (1, 'America do Sul'),
 (2, 'America do Norte'),
 (3, 'Oceania'),
 (4, 'Europa'),
 (5, 'Asia'),
 (6, 'Africa');

INSERT INTO pais(codigo_pais, nome_oficial_pais, nome_coi_pais, sigla_coi_pais, codigo_continente) VALUES (1, 'Brasil', 'Brasil', 'BR', 1),
 (2, 'China', 'China', 'CH', 5),
 (3, 'France', 'France', 'BR', 4),
 (4, 'Argentina', 'Argentina', 'AR', 1),
 (5, 'Italy',  'Italy', 'IT', 4),
 (6, 'Iran',  'Iran', 'IR', 5);

INSERT INTO atleta (codigo_atleta, nome_atleta, sexo, codigo_esporte, codigo_pais) VALUES (1, 'Joseph Mohamed', 'M', 6, 2),
(2, 'Alan Lamusi', 'M', 2, 3),
(3, ' Arrasi Ilavi', 'M', 4, 2),
(4, 'Simon Rafagi', 'M', 5, 5),
(5, 'Jose da Silva', 'M', 1, 6),
(6, 'Maria de Lourdes', 'F', 1, 1),
(7, 'Pedro Novaes', 'M', 1, 3);



SELECT * FROM esporte;
SELECT * FROM continente;
SELECT * FROM pais;
SELECT * FROM atleta;
SELECT * FROM eventos;

SELECT atleta.nome_atleta, atleta.sexo, pais.nome_oficial_pais FROM atleta
LEFT JOIN pais on atleta.cogido_pais = codigo_pais; 