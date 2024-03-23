CREATE TABLE empregados(
	cpf CHAR(11) PRIMARY KEY,
	enome VARCHAR(60),
	salario	FLOAT,
	cpf_supervisor CHAR(11),
	dnumero INTEGER
);

CREATE TABLE departamentos(
	dnumero INTEGER PRIMARY KEY,
	dnome VARCHAR(60),
	cpf_gerente CHAR(11) REFERENCES empregados(cpf)
);

CREATE TABLE trabalha(
	cpf_emp VARCHAR(11) REFERENCES empregados(cpf),
	pnumero INTEGER
);

CREATE TABLE projetos(
	pnumero INTEGER PRIMARY KEY,
	pnome VARCHAR(45),
	dnumero INTEGER REFERENCES departamentos(dnumero)
);


INSERT INTO empregados VALUES
(49382234322, 'João Silva',			2350,	2434332222,	1010),
(58673392229, 'Mario Silveira',		3500,	2434332222,	1010),
(24343322220, 'Aline Barros',		2350,	(null),		1010),
(17333321622, 'Tulio Vidal',		8350,	(null),		1020),
(42444352725, 'Juliana Rodrigues',	3310,	(null),		1020),
(10143326726, 'Natalia Marques',	2900,	(null),		1010);

INSERT INTO departamentos VALUES
(1010,	'Pesquisa',	49382234322),
(1020,	'Ensino',	24343322220);

INSERT INTO trabalha VALUES
(49382234322,	2010),
(58673392229,	2020),
(49382234322,	2020);

INSERT INTO projetos VALUES
(2010, 'Alpha',	1010),
(2020, 'Beta',	1020);

SELECT empregados.cpf, empregados.enome, departamentos.dnome FROM empregados, departamentos
WHERE cpf_supervisor IS NULL AND empregados.dnumero = departamentos.dnumero
ORDER BY empregados.cpf


