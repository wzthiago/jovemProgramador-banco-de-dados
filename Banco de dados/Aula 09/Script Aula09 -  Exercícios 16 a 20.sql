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

CREATE TABLE provas(
codigo_provas INT NOT NULL PRIMARY KEY,
nome_prova VARCHAR(100) NOT NULL,
horario_inicio DATETIME NOT NULL
);

CREATE TABLE eventos(
codigo_evento INT NOT NULL PRIMARY KEY,
nome_evento VARCHAR(100) NOT NULL,
codigo_esporte_associado INT NOT NULL,
codigo_provas INT NOT NULL,
FOREIGN KEY (codigo_esporte_associado) REFERENCES esporte(codigo_esporte),
FOREIGN KEY (codigo_provas) REFERENCES provas(codigo_provas)
);


INSERT INTO esporte (codigo_esporte, nome_esporte, sigla_coi_esporte) VALUES (1, 'JUDO', 'JU'),
 (2, 'Boxing', 'BX'),
 (3, 'Football', 'FB'),
 (4, 'Water Polo', 'WP'),
 (5, 'Hockey', 'HO'),
 (6, 'Atletics', 'AT'),
 (7, 'Swimming', 'SW');
 
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

INSERT INTO eventos (codigo_evento, nome_evento, codigo_esporte_associado, codigo_provas) VALUES (1, 'Natacao master', 7, 7),
(2, 'Futebol sub 17 masculino', 3, 2),
(3, 'Atletismo salto em distância masculino', 6, 3),
(4, 'Polo Aquático masculino master', 4, 4),
(5, 'Judo feminino peso leve', 1, 5),
(6, 'Hockey masculino', 5, 6),
(7, 'Natacao maior idade', 7, 1);

INSERT INTO provas (codigo_provas, nome_prova, horario_inicio) VALUES (1, 'Natacao', '2024-04-25 15:30:00'),
(2, ' Jogo Futebol', '2024-04-28 08:00:00'),
(3, 'Prova Atletismo', '2024-05-29 10:00:00'),
(4, 'Jogo Polo Aquático', '2024-04-20 16:30:00'),
(5, 'Prova Judo', '2024-04-25 18:45:00'),
(6, 'Jogo Hockey', '2024-04-18 15:30:00'),
(7, 'Prova Natacao', '2024-04-15 14:30:00');

SELECT * FROM esporte;
SELECT * FROM continente;
SELECT * FROM pais;
SELECT * FROM atleta;
SELECT * FROM eventos;
SELECT * FROM provas;