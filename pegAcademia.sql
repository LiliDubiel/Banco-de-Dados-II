CREATE DATABASE academiapeg


DROP TABLE IF EXISTS tipo CASCADE;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS ALUNO CASCADE;
DROP TABLE IF EXISTS professor CASCADE;
DROP TABLE IF EXISTS treino CASCADE;
DROP TABLE IF EXISTS faz_treino CASCADE;


CREATE TABLE tipo(
	id_tipo INT PRIMARY KEY,
	descricao VARCHAR(15) NOT NULL);

INSERT INTO tipo VALUES (1, 'Administrador'),
(2, 'Professor'),
(3, 'Aluno');


CREATE TABLE usuario(
	id SERIAL PRIMARY KEY ,
	tipo INT NOT NULL,
	login VARCHAR(10) NOT NULL,
        senha VARCHAR(10),
	nome VARCHAR(50) NOT NULL,
	data_nasc VARCHAR(8) NOT NULL,
	endereco VARCHAR(50) NOT NULL,
	telefone VARCHAR(11),
	email VARCHAR(30),
	FOREIGN KEY(tipo) REFERENCES tipo(id_tipo)
	);



INSERT INTO usuario (tipo,login,senha,nome,data_nasc,endereco,telefone,email) VALUES (1,'adm','1234','Fulano','13/01/93',
			'Rua lalala','9999-1111','adm@adm.com'),
			(2,'professor','5678','Ciclana','02/01/86','Rua Aquela la','3333-2323','ciclana@lala.com'),
			(3,'aluno','9012','Beltrano','11/02/83','Rua Que sobe e Desce','3332-2111', 'beltraninho@lala.com');
					
CREATE TABLE ALUNO(
	cod_aluno int primary key,
	tipo INT NOT NULL,
	peso FLOAT NOT NULL,
	altura FLOAT NOT NULL,
	imc FLOAT NOT NULL,
	FOREIGN KEY(tipo) REFERENCES tipo(id_tipo)
	);
	


INSERT INTO ALUNO(cod_aluno,tipo,peso,altura,imc) VALUES (1,3,70,1.70,24.22),
							 (2,3,60,1.55,23),
							 (3,3,89,1.60,30);


CREATE TABLE professor(	
	cod_prof INT PRIMARY KEY ,
	tipo INT NOT NULL,
	salario FLOAT NOT NULL,
	FOREIGN KEY(tipo) REFERENCES tipo(id_tipo)
	);

INSERT INTO professor VALUES (10,2,1203.00),
			      (20,2,1350.00),
		              (30,2,1200.00);					




CREATE TABLE treino(
	cod_treino INT PRIMARY KEY,
	cod_prof INT NOT NULL,
	nome VARCHAR(50),
	FOREIGN KEY(cod_prof) REFERENCES professor(cod_prof)
	);

INSERT INTO treino VALUES (01,10,'ZUMBA'),
			  (02,20,'ABDOMINAL'),
			  (03,30,'LOCALIZADA');	

CREATE TABLE faz_treino (
	cod_aluno INT NOT NULL,
	cod_treino INT NOT NULL,
	data DATE,
	FOREIGN KEY(cod_aluno) REFERENCES aluno(cod_aluno),
	FOREIGN KEY(cod_treino) REFERENCES treino(cod_treino)
	)
	
	
INSERT INTO faz_treino VALUES(1,01,'2016-06-13'),
			      (2,02,'2016-06-15'),
			      (3,03,'2016-06-12');
	
