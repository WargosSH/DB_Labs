/*-------------------Task 1------------------*/
SELECT COUNT(*) AS total_books, SUM(price) AS total_price, AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price 
FROM task2.books;

/*-------------------Task 2------------------*/
SELECT COUNT(*) AS total_books 
FROM task2.books
WHERE price IS NOT NULL;

/*-------------------Task 3------------------*/
SELECT is_new, COUNT(*) AS total_books, SUM(price) AS total_price, AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price
FROM task2.books
WHERE price IS NOT NULL
GROUP BY is_new;

/*-------------------Task 4------------------*/
SELECT YEAR(book_date), COUNT(*) AS total_books, SUM(price) AS total_price, AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price
FROM task2.books
WHERE price IS NOT NULL
GROUP BY YEAR(book_date);

/*-------------------Task 5------------------*/


/*-------------------Task 6------------------*/


/*-------------------Task 7------------------*/


/*-------------------Task 8------------------*/


/*-------------------Task 9------------------*/


/*-------------------Task 10-----------------*/


/*-------------------Task 11-----------------*/


/*-------------------Task 12-----------------*/


/*-------------------Task 13-----------------*/


/*-------------------Task 14-----------------*/


/*-------------------Task 15-----------------*/


/*-------------------Task 16-----------------*/


/*-------------------Task 17-----------------*/


/*-------------------Task 18-----------------*/


/*-------------------Task 19-----------------*/


/*-------------------Task 20-----------------*/


