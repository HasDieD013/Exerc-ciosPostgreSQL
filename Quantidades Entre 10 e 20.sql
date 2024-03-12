CREATE TABLE providers(
	id NUMERIC PRIMARY KEY,
	name VARCHAR(255),
	street VARCHAR(255),
	city VARCHAR(255),
	state CHAR(2)
);

CREATE TABLE products(
	id NUMERIC PRIMARY KEY,
	name VARCHAR(255),
	amount NUMERIC,
	price NUMERIC,
	id_providers NUMERIC REFERENCES providers(id)
);

INSERT INTO providers(id, name, street, city, state) VALUES
(1, 'Ajax SA', 'Rua Presidente Castelo Branco', 'Porto Alegre', 'RS'),
(2, 'Sansul SA', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
(3, 'Pr Sheppard Chairs', 'Rua do Moinho', 'Santa Maria', 'RS'),
(4, 'Elon Electro', 'Rua Apolo', 'São Paulo', 'SP'),
(5, 'Mike Electro', 'Rua Pedro da Cunha', 'Curitiba', 'PR');

INSERT INTO products(id, name, amount, price, id_providers) VALUES
(1, 'Blue Chair', 30, 300.00, 5),
(2, 'Red Chair', 50, 2150.00, 2),
(3, 'Disney Wardrobe', 400, 829.50, 4),
(4, 'Executive Chair', 17, 9.90, 3),
(5, 'Solar Panel', 30, 3000.25, 4);

SELECT products.name FROM products
LEFT JOIN providers 
	ON products.id_providers = providers.id
WHERE amount BETWEEN 10 AND 20 AND providers.name LIKE 'P%';


