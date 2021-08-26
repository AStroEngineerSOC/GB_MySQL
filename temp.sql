USE GB_SQL;
/* SELECT '3' + '5'; */
/* SELECT 'abc' + 'def' -- низя  */
/* SELECT 8 - 3; */
/* SELECT -7; */
/* SELECT 2 * 3; */
/* SELECT 18014398509481984 * 18014398509481984; */
/* SELECT 8 / 0; */
/* SELECT 5 DIV 2, 5 / 2, 5 % 2, 5 MOD 2; */
/* SELECT 2 > 3; */
/* SELECT 2 <= 3; */
/* SELECT 2 = 2, 2 = 3; */
/* SELECT 2 != 3, 2 <> 3; */
/* SELECT NOT TRUE, NOT FALSE; */
/* SELECT ! TRUE, ! FALSE; */
/* SELECT NOT 2 != 3, NOT 2 <> 3; */
/* SELECT 2 = NULL, 2 != NULL;
SELECT 2 <=> NULL, NULL <=> NULL;
SELECT 2 IS NULL, 2 IS NOT NULL, NULL IS NULL, NULL IS NOT NULL; */
-- Вычисляемый столбец
/* DROP TABLE IF EXISTS tbl; */
/* CREATE TABLE tbl ( */
  /* x INT, */
  /* y INT, */
  /* summ INT AS (x + y) */
  /* --summ INT AS (x + y) STORED -- такой столбец будет сохраняться на ЖД, иначе в оперативной памяти */
/* ); */
/* INSERT INTO */
  /* tbl (x, y) */
/* VALUES */
  /* (1, 1), (5, 6), (11, 12); */
/* SELECT * FROM tbl; */
/*  */
/* SELECT 2 IN (0,NULL,5,'wefwf'); */
/* SELECT 2 IN (2,NULL,5,'wefwf'); */

/* SELECT 'MySQL' = 'MySQL'; */
/* SELECT 'Программист' LIKE 'Программ%'; */
/* SELECT 'Программа' LIKE 'Программ%'; */
/* SELECT 'Программ' LIKE 'Программ%'; */
/*  */
/* SELECT 'Программирование' LIKE 'П%е','Печенье' LIKE 'П%е'; */
/* SELECT 'Программирование' LIKE '%ние','Кодирование' LIKE '%ние'; */

/* SELECT 'код' LIKE '___','рот' LIKE '___', 'абв' LIKE '___'; */

/* SELECT '15 %' LIKE '15 \%', 'my_sql' LIKE 'my\_sql'; */
/* SELECT '15' LIKE '15 \%', 'my sql' LIKE 'my\_sql'; */
/* -- Регулярные выражения */
/* SELECT 'программ' RLIKE 'грам', 'грампластинка' RLIKE 'грам'; */
/* SELECT 'программирование' RLIKE '^грам', 'грампластинка' RLIKE '^грам'; -- ^ соответсвует началу строки */
/* SELECT 'грампластинка' RLIKE '^грампластинка$'; -- $ соответствует концу строки */
/* SELECT 'abc' RLIKE 'abc|абв', 'абв' RLIKE 'abc|абв'; -- знак | позволяет задать альтернативные маски */
/* -- \\ - экранирование символов  */

-- RLIKE поиск в соответствии с регулярными выражениями
/* SELECT 'a' RLIKE '[abc]' AS a,
       'b' RLIKE '[abc]' AS b,
       'c' RLIKE '[abc]' AS c; */

/* SELECT 'Л' RLIKE '[а-яё]' AS L; */
/* SELECT 'z' RLIKE '[а-яё]' AS z; */

/* SELECT '1' RLIKE '[[:digit:]]', 'а' RLIKE '[[:digit:]]'; */
/* SELECT '1' RLIKE '[[:alpha:]]', 'а' RLIKE '[[:alpha:]]'; */

/* ? — символ входит ноль или один раз, */
/* * — любое количество вхождений, включая ноль, */
/* + — одно или более вхождений символа в строку. */

/* SELECT '1' RLIKE '^[[:digit:]]+$', '453455234' RLIKE '^[[:digit:]]+$';
SELECT '' RLIKE '^[[:digit:]]+$', '45.3455234' RLIKE '^[[:digit:]]+$'; */

-- SELECT NOW();
/* SELECT DATE_FORMAT('2018-06-12 01:59:59', 'На дворе %Y год');
SELECT DATE_FORMAT(NOW(), 'На дворе %Y год'); */
/* SELECT  UNIX_TIMESTAMP(NOW()) AS TIMESTAMP, */
        /* FROM_UNIXTIME(1915394563) AS DATETIME; */
/*  */
/* SELECT DATABASE(), USER(); */

DROP TABLE IF EXISTS distances;
CREATE TABLE distances (
  id SERIAL PRIMARY KEY,
  x1 INT NOT NULL,
  y1 INT NOT NULL,
  x2 INT NOT NULL,
  y2 INT NOT NULL,
  distance DOUBLE AS (SQRT(POW(x1-x2, 2) + POW(y1-y2, 2)))
) COMMENT = 'Расстояние между двумя точками';

INSERT INTO distances (x1, y1, x2, y2) VALUES
  ( 1,  1, 4, 5),
  ( 4, -1, 3, 2),
  (-2,  5, 1, 3);

SELECT * FROM distances;

SELECT ROUND(-2.9), ROUND(2.4), ROUND(2.5), ROUND(2.6); -- округление до ближайшего целого
SELECT CEILING(-2.9), CEILING(-2.1), CEILING(2.1), CEILING(2.9); -- округление в право
SELECT FLOOR(-2.9), FLOOR(-2.1), FLOOR(2.1), FLOOR(2.9); -- округление в лево

SELECT IF(TRUE, 'истина', 'ложь'), IF(FALSE, 'истина', 'ложь');
SELECT INET_ATON('62.145.69.10'), INET_ATON('127.0.0.1');
SELECT INET_NTOA(1049707786), INET_NTOA(2130706433);
SELECT UUID();
SELECT UUID();