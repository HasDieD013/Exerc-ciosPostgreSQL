CREATE TABLE customers(
	id NUMERIC PRIMARY KEY,
	name VARCHAR(255),
	street VARCHAR(255),
	city VARCHAR(255),
	state VARCHAR(255),
	credit_limit NUMERIC
);

CREATE TABLE natural_person(
	id_customers NUMERIC REFERENCES customers(id),
	cpf char(11)
);

INSERT INTO customers(id, name, street, city, state, credit_limit) VALUES
(1, 'Nicolas Diogo Cardoso', 'Acesso UM', 'Porto Alegre', 'RS', 475),
(2, 'Cecília Olivia Rodrigues', 'Rua Sizuka Usuy', 'Cianorte', 'PR', 3170),
(3, 'Augusto Fernando Carlos Eduardo Cardoso', 'Rua Baldomiro Koerich', 'Palhoça', 'SC', 1067),
(4, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', 475),
(5, 'Sabrina Heloisa Gabriela Barros', 'Rua Engenheiro Tito Marques Fernandes', 'Porto Alegre', 'RS', 4312),
(6, 'Joaquim Diego Lorenzo Araújo', 'Rua Vitorino', 'Novo Hamburgo', 'RS', 2314);

INSERT INTO natural_person(id_customers, cpf) VALUES
(1, '26774287840'),
(2, '97918477200');

SELECT SUBSTRING(cpf, 1, 3) || '.' ||
	   SUBSTRING(cpf, 4, 3) || '.' ||
	   SUBSTRING(cpf, 7, 3) || '-' ||
	   SUBSTRING(cpf, 10) AS "CPF"
FROM customers
LEFT JOIN natural_person
	ON natural_person.id_customers = customers.id
WHERE id = id_customers;
