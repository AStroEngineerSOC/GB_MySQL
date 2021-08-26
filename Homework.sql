USE GB_SQL;
DROP TABLE IF EXISTS users_dz;
CREATE TABLE users_dz(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

INSERT INTO 
  users_dz(name, birthday_at, created_at, updated_at) 
VALUES
  ('Геннадий_0', '1992-10-05', NULL, NULL),
  ('Геннадий_1', '1993-09-06', NULL, NULL),
  ('Геннадий_2', '1994-08-07', NULL, NULL),
  ('Геннадий_3', '1995-07-08', NULL, NULL),
  ('Геннадий_4', '1996-06-09', NULL, NULL),
  ('Геннадий_5', '1997-05-10', NULL, NULL);

SELECT * FROM users_dz;

UPDATE users_dz SET created_at = NOW(), updated_at = NOW();

SELECT * FROM users_dz;

DROP TABLE users_dz;

CREATE TABLE users_dz(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO
  users_dz(name, birthday_at, created_at, updated_at) 
VALUES
  ('Геннадий_0', '1992-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Геннадий_1', '1993-09-06', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Геннадий_2', '1994-08-07', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Геннадий_3', '1995-07-08', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Геннадий_4', '1996-06-09', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Геннадий_5', '1997-05-10', '07.01.2016 12:05', '07.01.2016 12:05');
/*
SELECT STR_TO_DATE(created_at, '%d.%m.%Y %k:%i') FROM users_dz; */

UPDATE users_dz SET
    created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
    updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

SELECT * FROM users_dz;

DESCRIBE users_dz;

ALTER TABLE users_dz CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users_dz CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

SELECT * FROM users_dz;

DESCRIBE users_dz;