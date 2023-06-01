/*-------------------Task 1-----------------*/
SELECT 
 books.name AS name_book, 
 books.price AS price_book,
 publishers.publ_house AS name_publisher
FROM books, publishers
WHERE books.publ_houseID = publishers.id;


/*-------------------Task 2-----------------*/
SELECT
 books.name AS name_book, 
 categories.category AS name_category
FROM books
INNER JOIN categories ON books.category_id = categories.id;


/*-------------------Task 3-----------------*/
SELECT 
    books.name AS name_book,
    books.price AS price_book,
    publishers.publ_house AS name_publisher,
    books.format AS format_book
FROM books
JOIN publishers ON books.publ_houseID = publishers.id;


/*-------------------Task 4-----------------*/
SELECT 
    themes.theme AS name_topic,
    categories.category AS name_category,
    books.name AS name_book,
    publishers.publ_house AS name_publisher
FROM books
JOIN publishers ON books.publ_houseID = publishers.id 
JOIN categories ON books.category_id = categories.id
JOIN themes ON books.theme_id = themes.id
WHERE categories.category = 'Інші книги'
ORDER BY themes.id DESC;


/*-------------------Task 5-----------------*/
SELECT * 
FROM books
JOIN publishers ON books.publ_houseID = publishers.id
WHERE publishers.publ_house = 'Видавнича група BHV' AND 
Year(books.book_date)>'2000' ;


/*-------------------Task 6-----------------*/
SELECT
 categories.category AS name_category,
    SUM(books.pages) AS sum_pages
FROM books
JOIN categories ON books.category_id = categories.id
GROUP BY books.category_id
ORDER BY sum_pages DESC;


/*-------------------Task 7-----------------*/
SELECT
    themes.theme AS name_topic,
    categories.category AS name_category,
 AVG(books.price) AS avg_price
FROM books
JOIN themes ON books.theme_id = themes.id
JOIN categories ON books.category_id = categories.id
WHERE themes.theme ='Використання ПК в цілому' 
AND categories.category LIKE '%Linux%';


/*-------------------Task 8-----------------*/
SELECT *
FROM books, categories, publishers, themes
WHERE books.category_id = categories.id 
AND books.publ_houseID = publishers.id 
AND books.theme_id = themes.id;


/*-------------------Task 9-----------------*/
SELECT *
FROM books
INNER JOIN categories ON books.category_id = categories.id
INNER JOIN publishers ON books.publ_houseID = publishers.id
INNER JOIN themes ON books.theme_id = themes.id;


/*-------------------Task 10-----------------*/
SELECT *
FROM books
LEFT JOIN categories ON books.category_id = categories.id
RIGHT JOIN themes ON books.theme_id = themes.id
LEFT JOIN publishers ON books.publ_houseID = publishers.id;


/*-------------------Task 11-----------------*/
SELECT
 a.name AS book1,
 b.name AS book2,
 a.pages
FROM books AS a
JOIN books AS b ON a.pages = b.pages 
AND a.id < b.id
ORDER BY a.pages;


/*-------------------Task 12-----------------*/
SELECT
 a.name AS book1,
 b.name AS book2,
 c.name AS book3,
 a.price
FROM books AS a
JOIN books AS b ON a.price = b.price AND a.id<b.id
JOIN books AS c ON a.price = c.price AND b.id<c.id AND b.price =c.price 
ORDER BY a.price;


/*-------------------Task 13-----------------*/
SELECT 
    a.name AS name_book
FROM books AS a
WHERE a.category_id = (
     SELECT c.id
     FROM categories AS c
     WHERE c.category = 'C&C++'
);


/*-------------------Task 14-----------------*/
SELECT 
    a.name AS name_book,
    a.book_date AS data_book
FROM books AS a
WHERE a.publ_houseID = (
     SELECT p.id
     FROM publishers AS p
     WHERE p.publ_house = 'Видавнича група BHV'AND 
        YEAR(a.book_date)>'2000'
);


/*-------------------Task 15-----------------*/
SELECT 
 p.publ_house AS name_publisher
FROM publishers AS p
WHERE EXISTS (
     SELECT a.publ_houseID
     FROM books AS a
     WHERE p.id = a.publ_houseID AND 
        a.pages > 400
);


/*-------------------Task 16-----------------*/
SELECT 
 c.category AS name_category
FROM categories AS c
WHERE (
     SELECT COUNT(a.category_id)
     FROM books AS a
     WHERE c.id = a.category_id
)>= 3;


/*-------------------Task 17-----------------*/
SELECT
 a.name AS name_book
FROM books AS a
WHERE EXISTS(
     SELECT *
     FROM publishers AS p
     WHERE p.publ_house = 'Видавнича група BHV' AND
      p.id = a.publ_houseID
);


/*-------------------Task 18-----------------*/
SELECT
 a.name AS name_book
FROM books AS a
WHERE NOT EXISTS(
     SELECT *
     FROM publishers AS p
     WHERE p.publ_house = 'Видавнича група BHV' AND
      p.id = a.publ_houseID
);


/*-------------------Task 19-----------------*/
SELECT category FROM categories 
UNION 
SELECT theme FROM themes 
ORDER BY category ASC;


/*-------------------Task 20-----------------*/
SELECT DISTINCT SUBSTRING_INDEX(a.name, ' ', 1) AS first_word 
FROM books AS a
UNION
SELECT DISTINCT SUBSTRING_INDEX(c.category, ' ', 1) AS first_word 
FROM categories AS c
ORDER BY first_word DESC;