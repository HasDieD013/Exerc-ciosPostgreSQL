CREATE TABLE categories(
	id NUMERIC PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE products(
	id NUMERIC PRIMARY KEY,
	name VARCHAR(255),
	amount NUMERIC,
	price NUMERIC,
	id_categories NUMERIC REFERENCES categories(id)
);

INSERT INTO categories(id, name) VALUES
(1, 'wood'),
(2, 'luxury'),
(3, 'vintage'),
(4, 'modern'),
(5, 'super luxury');

INSERT INTO products(id, name, amount, price, id_categories) VALUES
(1, 'Two-door wardrobe', 100, 800, 1),
(2, 'Dining table', 1000, 560, 3),
(3, 'Towel holder', 10000, 25.50, 4),
(4, 'Computer desk', 350, 320.50, 2),
(5, 'Chair', 3000, 210.64, 4),
(6, 'Single bed', 750, 460, 1);


SELECT categories.name, SUM(amount) FROM categories
INNER JOIN products
	ON products.id_categories = categories.id
GROUP BY categories.name
