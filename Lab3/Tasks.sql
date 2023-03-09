/*-------------------Task 1------------------*/
SELECT * FROM task2.books WHERE price IS NULL OR price = 0;

/*-------------------Task 2------------------*/
SELECT * FROM task2.books WHERE price IS NOT NULL AND book_count IS NULL;

/*-------------------Task 3------------------*/
SELECT * FROM task2.books WHERE book_date IS NULL;

/*-------------------Task 4------------------*/
SELECT * FROM task2.books WHERE YEAR(CURDATE()) - YEAR(book_date) <= 1;

/*-------------------Task 5------------------*/
SELECT * FROM task2.books WHERE is_new = 1 ORDER BY price ASC;

/*-------------------Task 6------------------*/
SELECT * FROM task2.books WHERE pages >= 300 AND pages <= 400 ORDER BY name DESC;

/*-------------------Task 7------------------*/
SELECT * FROM task2.books WHERE price >= 20 AND price <= 40 ORDER BY book_date DESC;

/*-------------------Task 8------------------*/
SELECT * FROM task2.books ORDER BY name ASC, price DESC;

/*-------------------Task 9------------------*/
SELECT * FROM task2.books WHERE (price / pages) < 0.1;

/*-------------------Task 10-----------------*/
SELECT CHAR_LENGTH(name) AS length, UPPER(LEFT(name, 20)) AS firstElements FROM task2.books;

/*-------------------Task 11-----------------*/
SELECT CONCAT( UPPER(LEFT(name, 10)), '...', UPPER(RIGHT(name, 10))) AS title FROM task2.books;

/*-------------------Task 12-----------------*/
SELECT 
	name AS m_title, 
    book_date as m_date, 
	DAY(book_date) as m_day,	
    MONTH(book_date) as m_month,	
    YEAR(book_date) as m_year
FROM task2.books;

/*-------------------Task 13-----------------*/
SELECT 
	name AS m_title, 
    book_date as m_date, 
	CONCAT(DAY(book_date), ' / ', MONTH(book_date), ' / ', YEAR(book_date)) as m_formated_date
FROM task2.books;

/*-------------------Task 14-----------------*/
SELECT 
	book_code, 
    price,
    price * 40 AS m_uah,
    price * 1.2 AS m_eur,
    price * 70 AS m_rub
FROM task2.books;

/*-------------------Task 15-----------------*/
SELECT 
    book_code, 
    price, 
    ROUND(price * 40, 0) AS 'UAH.uah', 
    FLOOR(price * 40) AS 'UAH' 
FROM task2.books;

/*-------------------Task 16-----------------*/
INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(1234, 44444, 1, 'Том Сойер', 10, 'Том Сойер Inc.', 250, '70x100/16', '2022-3-3', 5000, 'Худ.Літ', 'Худ.Літ');

/*-------------------Task 17-----------------*/
INSERT INTO task2.books(number, book_code, name, price, publ_house, pages, format, book_count, theme, category)
VALUES(1234, 44444, 'Том Сойер', 10, 'Том Сойер Inc.', 250, '70x100/16', 5000, 'Худ.Літ', 'Худ.Літ');

/*-------------------Task 18-----------------*/
DELETE FROM task2.books WHERE book_date < '1990-01-01';

/*-------------------Task 19-----------------*/
UPDATE task2.books SET book_date = CURDATE() WHERE book_date IS NULL;

/*-------------------Task 20-----------------*/
UPDATE task2.books SET is_new = 1 WHERE book_date > '2005-1-1';
