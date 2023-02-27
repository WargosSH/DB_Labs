/*-------------------Task 1------------------*/
SELECT number, book_code, is_new, name, price, pages FROM task2.books; 

/*-------------------Task 2------------------*/
SELECT * FROM task2.books;

/*-------------------Task 3------------------*/
SELECT book_code, name, is_new, pages, price, number FROM task2.books;

/*-------------------Task 4------------------*/
SELECT * FROM task2.books LIMIT 10;

/*-------------------Task 5------------------*/
SELECT * FROM table_name LIMIT (SELECT COUNT(*) FROM table_name) * 0.1;

/*-------------------Task 6------------------*/
SELECT * FROM task2.books GROUP BY book_code;

/*-------------------Task 7------------------*/
SELECT * FROM task2.books WHERE is_new = true;

/*-------------------Task 8------------------*/
SELECT * FROM task2.books WHERE is_new = true AND price >= 20 AND price <= 30;

/*-------------------Task 9------------------*/
SELECT * FROM task2.books WHERE is_new = true AND (price < 20 OR price > 30);

/*-------------------Task 10-----------------*/
SELECT * FROM task2.books WHERE pages >= 300 AND pages <= 400 AND (price < 20 OR price > 30);

/*-------------------Task 11-----------------*/
SELECT * FROM task2.books WHERE YEAR(book_date) = 2000 AND (MONTH(book_date) = 1 OR MONTH(book_date) = 2 OR MONTH(book_date) = 12);

/*-------------------Task 12-----------------*/
SELECT * FROM task2.books WHERE book_code = 5110 OR book_code = 5141 OR book_code = 4985 OR book_code = 4241

/*-------------------Task 13-----------------*/
SELECT * FROM task2.books WHERE YEAR(book_date) IN (1999, 2001, 2003, 2005);

/*-------------------Task 14-----------------*/
SELECT * FROM task2.books WHERE name LIKE 'А%' OR name LIKE 'Б%' OR name LIKE 'В%' OR name LIKE 'Г%' OR name LIKE 'Ґ%' OR name LIKE 'Д%' OR name LIKE 'Е%' OR name LIKE 'Є%' OR name LIKE 'Ж%' OR name LIKE 'З%' OR name LIKE 'И%' OR name LIKE 'І%'OR name LIKE 'Ї%'OR name LIKE 'Й%'OR name LIKE 'К%';

/*-------------------Task 15-----------------*/
SELECT * FROM task2.books WHERE name LIKE 'АПП%' AND YEAR(book_date) = 2000 AND price < 20;

/*-------------------Task 16-----------------*/
SELECT * FROM task2.books WHERE name LIKE 'АПП%е' AND book_date BETWEEN '2000-01-01' AND '2000-06-30';

/*-------------------Task 17-----------------*/
SELECT * FROM task2.books WHERE name LIKE '%Microsoft%' AND name NOT LIKE '%Windows%';

/*-------------------Task 18-----------------*/
SELECT * FROM task2.books WHERE name REGEXP '[0-9]+';

/*-------------------Task 19-----------------*/
SELECT * FROM task2.books WHERE name REGEXP '[0-9]{3,}';

/*-------------------Task 20-----------------*/
SELECT * FROM task2.books WHERE name REGEXP '[0-9]{5}';


