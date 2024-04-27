CREATE DATABASE IF NOT EXISTS olimpiadas;

USE olimpiadas;

DROP TABLE IF EXISTS atleta_idioma;
DROP TABLE IF EXISTS atleta_prova;
DROP TABLE IF EXISTS atleta_evento;
DROP TABLE IF EXISTS atleta_esporte;
DROP TABLE IF EXISTS pais_idioma;
DROP TABLE IF EXISTS idioma;
DROP TABLE IF EXISTS atleta;
DROP TABLE IF EXISTS prova;
DROP TABLE IF EXISTS eventos;
DROP TABLE IF EXISTS esporte;
DROP TABLE IF EXISTS pais;
DROP TABLE IF EXISTS continente;
DROP TABLE IF EXISTS tecnico;


CREATE TABLE esporte (
codigo_esporte INT NOT NULL PRIMARY KEY,
nome_esporte VARCHAR(100) NOT NULL,
sigla_coi_esporte CHAR(2) NOT NULL
);

CREATE TABLE continente(
codigo_continente INT NOT NULL PRIMARY KEY,
nome_continente VARCHAR(100) NOT NULL
);

# 16-1
CREATE TABLE pais (
codigo_pais INTEGER NOT NULL PRIMARY KEY,
nome_oficial_pais VARCHAR(100) NOT NULL,
nome_coi_pais VARCHAR (100) NOT NULL,
sigla_coi_pais CHAR(3) NOT NULL,
codigo_continente INT NOT NULL,
FOREIGN KEY (codigo_continente) REFERENCES continente(codigo_continente)
);
-- codigo_continente INT REFERENCES continente(codigo_continente)

CREATE TABLE atleta (
codigo_atleta INT NOT NULL PRIMARY KEY,
nome_atleta VARCHAR(100) NOT NULL,
sexo CHAR(1) NOT NULL,
codigo_pais INT NOT NULL,
FOREIGN KEY (codigo_pais) REFERENCES pais(codigo_pais)
);

-- codigo_tecnico INT NOT NULL,
-- codigo_esporte INT NOT NULL,
-- FOREIGN KEY (codigo_esporte) REFERENCES esporte(codigo_esporte),
-- FOREIGN KEY (codigo_tecnico) REFERENCES tecnico(codigo_tecnico)

# Script professor
-- CREATE TABLE atleta (
-- codigo_atleta INT NOT NULL PRIMARY KEY,
-- nome_atleta VARCHAR(100) NOT NULL,
-- sexo CHAR(1) NOT NULL,
-- codigo_pais INT NOT NULL REFERENCES pais(codigo_pais),
-- codigo_tecnico INT REFERENCES tecnico(codigo_tecnico)
-- );


CREATE TABLE tecnico(
codigo_tecnico INT NOT NULL PRIMARY KEY,
nome_tecnico VARCHAR(100) NOT NULL,
sexo CHAR(1) NOT NULL,
codigo_pais INT NOT NULL REFERENCES pais(codigo_pais)
);
-- codigo_pais INT NOT NULL REFERENCES pais(codigo_pais)

# 17-2
CREATE TABLE prova(
codigo_prova INT NOT NULL PRIMARY KEY,
nome_prova VARCHAR(100) NOT NULL,
horario_inicio DATETIME NOT NULL
);
-- codigo_evento INT NOT NULL,

# 16-2
# 17-2
CREATE TABLE evento(
codigo_evento INT NOT NULL PRIMARY KEY,
nome_evento VARCHAR(100) NOT NULL,
codigo_esporte INT NOT NULL,
FOREIGN KEY (codigo_esporte) REFERENCES esporte(codigo_esporte)
);
-- codigo_prova INT NOT NULL
-- FOREIGN KEY (codigo_prova) REFERENCES prova(codigo_prova)

# Exemplo script Professor
-- CREATE TABLE evento (
-- codigo_evento	INT NOT NULL PRIMARY KEY,
-- nome_evento		VARCHAR(100) NOT NULL,
-- codigo_esporte	INT NOT NULL REFERENCES esporte(codigo_esporte)
-- );

# 18-1
CREATE TABLE atleta_esporte (
    codigo_atleta INT NOT NULL,
    codigo_esporte INT NOT NULL,
    PRIMARY KEY (codigo_atleta, codigo_esporte),
    FOREIGN KEY (codigo_atleta) REFERENCES atleta(codigo_atleta),
    FOREIGN KEY (codigo_esporte) REFERENCES esporte(codigo_esporte) 
);

# 18-2
CREATE TABLE atleta_evento (
    codigo_atleta INT NOT NULL,
    codigo_evento INT NOT NULL,
    PRIMARY KEY (codigo_atleta, codigo_evento),
    FOREIGN KEY (codigo_atleta) REFERENCES atleta(codigo_atleta),
    FOREIGN KEY (codigo_evento) REFERENCES evento(codigo_evento) 
);

CREATE TABLE atleta_prova (
    codigo_atleta INT NOT NULL,
    codigo_prova INT NOT NULL,
    PRIMARY KEY (codigo_atleta, codigo_prova),
    FOREIGN KEY (codigo_atleta) REFERENCES atleta(codigo_atleta),
    FOREIGN KEY (codigo_prova) REFERENCES prova(codigo_prova) 
);

CREATE TABLE atleta_idioma (
   codigo_atleta INT NOT NULL,
   codigo_idioma INT NOT NULL,
   PRIMARY KEY (codigo_atleta, codigo_idioma),
   FOREIGN KEY (codigo_atleta) REFERENCES atleta(codigo_atleta),
   FOREIGN KEY (codigo_idioma) REFERENCES idioma(codigo_idioma)   
); 
-- s

# 19-1
CREATE TABLE idioma (
   codigo_idioma INT NOT NULL PRIMARY KEY,
   nome_idioma VARCHAR(50) NOT NULL
);

CREATE TABLE pais_idioma (
    codigo_pais INT NOT NULL,
    codigo_idioma INT NOT NULL,
    PRIMARY KEY (codigo_pais, codigo_idioma),
    FOREIGN KEY (codigo_pais) REFERENCES pais(codigo_pais),
    FOREIGN KEY (codigo_idioma) REFERENCES idioma(codigo_idioma) 
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

INSERT INTO atleta (codigo_atleta, nome_atleta, sexo, codigo_pais) VALUES (1, 'Joseph Mohamed', 'M', 6, 2),
(2, 'Alan Lamusi', 'M', 3),
(3, ' Arrasi Ilavi', 'M', 2),
(4, 'Simon Rafagi', 'M', 5),
(5, 'Jose da Silva', 'M', 4),
(6, 'Maria de Lourdes', 'F', 1),
(7, 'Pedro Novaes', 'M', 3);

SELECT * FROM esporte;
SELECT * FROM continente;
SELECT * FROM pais;
SELECT * FROM atleta;
SELECT * FROM eventos;
SELECT * FROM provas;
SELECT * FROM tecnico;


-- Crie um SELECT que retorne o nome de cada um dos eventos da olimpíada junto com o nome do esporte associado*/
SELECT evento.nome_evento, esporte.nome_esporte
FROM evento
INNER JOIN esporte ON evento.codigo_esporte = esporte.codigo_esporte;

-- Faça um SELECT que retorne o nome de todos os atletas da Oceania
SELECT 	atleta.nome_atleta
FROM atleta
INNER JOIN pais ON atleta.codigo_pais = pais.codigo_pais
INNER JOIN continente ON
	pais.codigo_continente = continente.codigo_continente
WHERE 
	continente.nome_continente = 'Oceania'

-- Faça um SELECT que retorne o nome e horário de todas as provas do esporte Basketball

select
	prova.horario_inicio
from prova
inner join evento on
	prova.codigo_evento = evento.codigo_evento
inner join esporte on
	evento.codigo_esporte  = esporte.codigo_esporte
where 
	esporte.nome_esporte = 'Basketball'


-- Faça um SELECT que retorne o nome de todos os esportes que terão provas no dia 01/08
select distinct
	esporte.nome_esporte
from esporte
inner join evento on
	esporte.codigo_esporte = evento.codigo_esporte
inner join prova on
	prova.codigo_evento = evento.codigo_evento
where
	prova.hora_inicio_prova >= '2012-08-02 00:00:00'
	and prova.hora_inicio_prova < '2012-08-02 00:00:00'


select
	atleta.nome_atleta
from atleta
inner join atleta_idioma on
	atleta.codigo_atleta = atleta_idioma.codigo_atleta
inner join idioma on
	atleta_idioma.codigo_idioma = idioma.codigo_idioma
where
	idioma.nome_idioma = 'Portuguese'

insert into atleta_idioma (codigo_atleta, codigo_idioma)
select codigo_atleta, 7 from atleta where codigo_pais = 27;

select distinct
	pais.nome_oficial_pais
from pais
inner join atleta on
	pais.codigo_pais = atleta.codigo_pais
inner join atleta_evento on
	atleta.codigo_atleta = atleta_evento.codigo_atleta
inner join evento on
	evento.codigo_evento = atleta_evento.codigo_evento
inner join esporte on
	evento.codigo_esporte = esporte.codigo_esporte
where
	esporte.nome_esporte = 'Badminton'

select
	atleta.nome_atleta,
	pais.nome_oficial_pais,
	continente.nome_continente
from atleta
inner join pais on
	atleta.codigo_pais = pais.codigo_pais
left outer join continente on
	pais.codigo_continente = continente.codigo_continente

select 
	atleta.nome_atleta,
	tecnico.nome_tecnico
from atleta
left outer join tecnico on
	atleta.codigo_tecnico = tecnico.codigo_tecnico

update atleta
set codigo_tecnico = 2
where
	sexo = 'M'
	and codigo_pais = 27
	and codigo_atleta in (
		select codigo_atleta
		from atleta_esporte
		where codigo_esporte = 33)

select 
 c.nome_continente,
 count(*)
from atleta a
inner join pais p on
	a.codigo_pais = p.codigo_pais
left outer join continente c on
	p.codigo_continente = c.codigo_continente
group by 
	c.nome_continente

select 
	esporte.nome_esporte,
	count(*)
from evento
inner join esporte on
	evento.codigo_esporte = esporte.codigo_esporte
group by esporte.nome_esporte

select
	es.nome_esporte,
	count(*)
from prova p
inner join evento ev on
 p.codigo_evento = ev.codigo_evento
inner join esporte es on
	ev.codigo_esporte = es.codigo_esporte
group by
	es.nome_esporte

selectuniversidade
*
from atleta a
left outer join tecnico t on
	a.codigo_tecnico = t.codigo_tecnico
where
	a.codigo_pais <> t.codigo_pais