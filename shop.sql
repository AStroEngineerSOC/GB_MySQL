DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalog (
    id INT UNSIGNED NOT NULL,
    name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT UNSIGNED NOT NULL,
    birthday_at DATE COMMENT 'Дата рождения'
    name VARCHAR(255) COMMENT 'Имя покупателя'
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id INT UNSIGNED NOT NULL,
    name VARCHAR(255) COMMENT 'Название',
    description TEXT COMMENT 'Описание',
    price DECIMAL (11,2) COMMENT 'Цена',
    catalog_id INT UNSIGNED
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
    id INT UNSIGNED NOT NULL,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED
    total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций'
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
    id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0'
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
    id INT UNSIGNED NOT NULL,
    storehouse_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    value INT UNSIGNED COMMENT 'Запас товарной позиции на складе'
) COMMENT = 'Запасы на складе';