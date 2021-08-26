USE shop;
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
    id SERIAL PRIMARY KEY,
/*
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    PRIMARY KEY(id, name(10)), // здесь первичный ключ создаётся по столбцу id и первым 10 символам столбца name
*/
    name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

-- INSERT INTO catalogs VALUES (NULL, 'Процессоры');
-- INSERT INTO catalogs (id, name) VALUES (NULL, 'Мат. платы');
-- INSERT INTO catalogs (name, id) VALUES ('Мат. платы', NULL);
-- INSERT INTO catalogs VALUES (DEFAULT, 'Видеокарты');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT 'Имя покупателя',
    birthday_at DATE COMMENT 'Дата рождения',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT 'Название',
    description TEXT COMMENT 'Описание',
    price DECIMAL (11,2) COMMENT 'Цена',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    catalog_id INT UNSIGNED,
    KEY index_of_catalog_id(catalog_id) -- объявление индекса по столбцу catalog_id
) COMMENT = 'Товарные позиции';

-- создать индекс в уже существующей таблице можно при помощи оператора CREATE INDEX
-- CREATE INDEX index_of_catalog_id ON products (catalog_id);

-- удалить индексиз таблицы при помощи оператора DROP INDEX
-- DROP INDEX index_of_catalog_id ON products;

-- BTREE - бинарное дерево
-- CREATE INDEX index_of_catalog_id USING BTREE ON products (catalog_id);

-- HASH - хэш-таблица
-- CREATE INDEX index_of_catalog_id USING HASH ON products (catalog_id);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT UNSIGNED,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
    id SERIAL PRIMARY KEY,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций'
    -- KEY order_id(order_id),
    -- KEY product_id(product_id)
    -- KEY order_id(order_id, product_id),
    -- KEY product_id(product_id, order_id)

) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
    id SERIAL PRIMARY KEY,
    user_id INT UNSIGNED,
    product_id INT UNSIGNED,
    discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
    finished_at DATETIME,
    started_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY index_of_user_id(user_id),
    KEY index_of_product_id(product_id)
 ) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT 'Название',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
    id SERIAL PRIMARY KEY,
    storehouse_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    value INT UNSIGNED COMMENT 'Запас товарной позиции на складе'
) COMMENT = 'Запасы на складе';

/* INSERT INTO users (id, name, birthday_at) VALUES (1, 'hello', '1979-01-21'); */
/* SELECT * FROM users; */

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

/* SELECT * FROM users; */
-- INSERT IGNORE INTO catalogs VALUES
--     (DEFAULT, 'Процессоры'),
--     (DEFAULT, 'Мат. платы'),
--     (DEFAULT, 'Видеокарты'),
--     (DEFAULT, 'Видеокарты');
-- Повторяющаяся запись не вставляется но и сообщение об ошибке не выводится

/* SELECT id, name FROM catalogs; */
-- SELECT * FROM catalogs;
-- CRUD операции (create - INSERT, read - SELECT, update - UPDATE, delete - DELETE)
-- DELETE FROM catalogs;
-- DELETE FROM catalogs LIMIT 2; -- При помощи ключевого слова LIMIT мы можем удалять лишь ограниченный объём записей (в этом случае 2)
-- DELETE FROM catalogs WHERE id > 1 LIMIT 1;
-- TRUNCATE полностью очищает таблицу и не допускает условного удаления. Быстрее чем DELETE и обнуляет AUTO_INCREMENT
-- TRUNCATE catalogs;
-- UPDATE позволяет менять значения полей в уже существующих записях
-- UPDATE catalogs SET name = 'Процессоры (Intel)' WHERE name = 'Процессоры';

-- CREATE TABLE cat (
  -- id SERIAL PRIMARY KEY,
  -- name VARCHAR(255)
-- );
-- INSERT INTO cat SELECT * FROM catalogs;
-- SELECT * FROM cat;

-- Условная выборка
/* SELECT * FROM catalogs WHERE id > 2; */
/* SELECT * FROM catalogs WHERE id > 2 AND id <= 4; */
/* SELECT * FROM catalogs WHERE id BETWEEN 3 AND 4; */
/* SELECT * FROM catalogs WHERE id NOT BETWEEN 3 AND 4; */
/* SELECT * FROM catalogs WHERE id IN (1,2,5); */
/* SELECT * FROM catalogs WHERE id NOT IN (1,2,5); */
/* SELECT * FROM catalogs WHERE NOT id IN (1,2,5);  */
/* SELECT * FROM catalogs WHERE name = 'Процессоры'; */
/* SELECT * FROM catalogs WHERE name LIKE '%ы'; */
/* SELECT * FROM catalogs WHERE name NOT LIKE '%ы'; */
/* SELECT * FROM users WHERE birthday_at >= '1990-01-01' AND birthday_at < '2000-01-01'; */
/* SELECT * FROM users WHERE birthday_at BETWEEN '1990-01-01' AND '2000-01-01'; */
/* SELECT * FROM users WHERE birthday_at LIKE '199%'; */
/* SELECT * FROM catalogs ORDER BY id; */
/* SELECT id, name FROM catalogs ORDER BY name; */
/* SELECT * FROM products; */
/* SELECT id, catalog_id, price, name FROM products ORDER BY catalog_id, price; */
/* SELECT id, catalog_id, price, name FROM products ORDER BY catalog_id, price DESC; */
/* SELECT id, catalog_id, price, name FROM products ORDER BY catalog_id DESC, price DESC; */

/* SELECT * FROM products ORDER BY name LIMIT 2; */
/* SELECT * FROM products ORDER BY name LIMIT 2, 2; --  Первое указывает позицию, начиная с которой необходимо вернуть результат, а второе — количество извлекаемых записей. */
/* SELECT * FROM products ORDER BY name LIMIT 2 OFFSET 2; */

/* SELECT catalog_id FROM products ORDER BY catalog_id; */

/* SELECT id, name, birthday_at, DATE(created_at), DATE(updated_at) FROM users; */
/* SELECT id, name, birthday_at, DATE(created_at) AS created_at, DATE(updated_at) AS updated_at FROM users; */
-- SELECT id, name, birthday_at, DATE(created_at) created_at, DATE(updated_at) updated_at FROM users;
/* SELECT name, (TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25 AS age FROM users; */
/* SELECT name, FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) AS age FROM users; */
/* SELECT name, TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age FROM users; */

-- Случайное значение
-- SELECT * FROM users ORDER BY RAND();
-- SELECT * FROM users ORDER BY RAND() LIMIT 1;

-- SELECT VERSION() FROM DUAL;

/* INSERT INTO catalogs VALUES (NULL, 'Колонки');
INSERT INTO products (name, description, price, catalog_id) VALUES ('Logitech', 'Колонка Logitech.', 5000.00, LAST_INSERT_ID());
SELECT * FROM catalogs;
SELECT id, name, description, price, catalog_id FROM products; */

SELECT id, SUBSTRING(name, 1, 5) AS name FROM users;

SELECT id, CONCAT(name, ' ', TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS name FROM users;



