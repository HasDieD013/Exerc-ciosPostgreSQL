CREATE TABLE prices(
	id NUMERIC PRIMARY KEY,
	categorie VARCHAR(255),
	value NUMERIC
);

CREATE TABLE movies(
	id NUMERIC PRIMARY KEY,
	name VARCHAR(255),
	id_prices NUMERIC REFERENCES prices(id)
);

INSERT INTO prices(id, categorie, value) VALUES
(1, 'Releases', 3.50),
(2, 'Bronze Seal', 2.00),
(3, 'Silver Seal', 2.50),
(4, 'Gold Seal' , 3.00),
(5, 'Promotion', 1.50);

INSERT INTO movies(id, name, id_prices) VALUES
(1, 'Batman', 3),
(2, 'The Battle of the Dark River', 3),
(3, 'White Duck', 5),
(4, 'Braking Barriers', 4),
(5, 'The Two Hours', 2);

SELECT movies.id, movies.name FROM movies
INNER JOIN prices 
	ON movies.id_prices = prices.id
WHERE value < 2.00;

