CREATE TABLE people(
	id INTEGER PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO people(id, name) VALUES
(1,	'Karen'),
(2,	'Manuel'),
(3,	'Ygor'),
(4,	'Valentine'),
(5,	'Jo');

SELECT name, LENGTH(name) FROM people
ORDER BY LENGTH(name) DESC;