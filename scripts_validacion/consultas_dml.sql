INSERT INTO categories (name) VALUES 
('Electrónica'), ('Hogar'), ('Ropa'), ('Deportes'), ('Juguetes');

INSERT INTO products (name, price, category_id) VALUES 
('Laptop', 800.00, 1), 
('Refrigeradora', 500.00, 2), 
('Camiseta', 15.00, 3), 
('Balón de Fútbol', 25.00, 4), 
('Figura de Acción', 10.00, 5);


INSERT INTO users (username, email) VALUES 
('jperez', 'jperez@mail.com'), 
('mlopez', 'mlopez@mail.com'), 
('aruiz', 'aruiz@mail.com'), 
('cgomez', 'cgomez@mail.com'), 
('hflores', 'hflores@mail.com');

INSERT INTO orders (user_id) VALUES 
(1), (2), (3), (4), (5);

INSERT INTO order_items (order_id, product_id, quantity, subtotal) VALUES 
(1, 1, 1, 800.00), 
(2, 2, 1, 500.00), 
(3, 3, 2, 30.00), 
(4, 4, 3, 75.00), 
(5, 5, 5, 50.00);


/* Prueba de validación: Intentar insertar un order_item con subtotal incorrecto */
INSERT INTO order_items (order_id, product_id, quantity, subtotal) VALUES 
(1, 1, 2, 1500.00); -- Esto debería generar un error debido a la validación del trigger.

INSERT INTO order_items (order_id, product_id, quantity, subtotal) VALUES 
(1, 1, 2, 1600.00); -- Esto debería insertarse correctamente ya que el subtotal es correcto (800 * 2 = 1600).

SELECT c.name AS categoria, SUM(oi.subtotal) AS total_vendido
FROM categories c
JOIN products p ON c.id = p.category_id
JOIN order_items oi ON p.id = oi.product_id
GROUP BY c.name;