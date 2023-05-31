/*-------------------Task 1-----------------*/
DROP PROCEDURE IF EXISTS books_info_base ;
CREATE PROCEDURE books_info_base()
SELECT books.name, books.price, publishers.publ_house, books.format
FROM books
INNER JOIN publishers ON books.publ_houseID = publishers.id;
CALL books_info_base();


/*-------------------Task 2-----------------*/
DROP PROCEDURE IF EXISTS books_info_full ;
CREATE PROCEDURE books_info_full()
SELECT themes.theme, categories.category, books.name, publishers.publ_house
FROM books
INNER JOIN themes ON books.theme_ID = themes.id
INNER JOIN categories ON books.category_ID = categories.id
INNER JOIN publishers ON books.publ_houseID = publishers.id;
CALL books_info_full();


/*-------------------Task 3-----------------*/
DROP PROCEDURE IF EXISTS book_filter_pr_date ;
CREATE PROCEDURE book_filter_pr_date(IN production_id VARCHAR(255), date_id VARCHAR(255))
SELECT books.name
FROM books
INNER JOIN publishers ON books.publ_houseID = publishers.id
WHERE publishers.publ_house = production_id AND books.book_date > date_id;
CALL book_filter_pr_date('Видавнича група BHV', '2000-01-01');


/*-------------------Task 4-----------------*/
DROP PROCEDURE IF EXISTS book_filter_pages ;
CREATE PROCEDURE book_filter_pages(IN sort_order BOOLEAN)
IF sort_order = 1 THEN 
    SELECT categories.category, SUM(pages) FROM books 
    INNER JOIN categories ON books.category_ID = categories.id
    GROUP BY category
    ORDER BY pages ASC;
ELSEIF sort_order = 0 THEN
    SELECT categories.category, SUM(pages) FROM books 
    INNER JOIN categories ON books.category_ID = categories.id
    GROUP BY category
    ORDER BY pages DESC;
ELSE
    SELECT * FROM books;  
END IF;

CALL book_filter_pages(0);
CALL book_filter_pages(1);

DROP PROCEDURE IF EXISTS book_filter_pages ;
CREATE PROCEDURE book_filter_pages()
SELECT categories.category, SUM(pages) FROM books 
INNER JOIN categories ON books.category_ID = categories.id
GROUP BY category
ORDER BY pages ASC;
CALL book_filter_pages();


/*-------------------Task 5-----------------*/
DROP PROCEDURE IF EXISTS book_avg_price;
CREATE PROCEDURE book_avg_price()
SELECT  AVG(books.price) as Average_Price
FROM books
INNER JOIN themes ON books.theme_ID = themes.id
INNER JOIN categories ON books.category_ID = categories.id
WHERE themes.theme = 'Використання ПК' AND categories.category = 'Linux';
CALL book_avg_price();


/*-------------------Task 6-----------------*/
DROP PROCEDURE IF EXISTS book_uni;
CREATE PROCEDURE book_uni()
SELECT * FROM books
INNER JOIN publishers ON books.publ_houseID = publishers.id
INNER JOIN categories ON books.category_ID = categories.id
INNER JOIN themes ON books.theme_ID = themes.id;
CALL book_uni();


/*-------------------Task 7-----------------*/
SELECT b1.name AS book1, b2.name AS book2, b1.pages AS pages
FROM books AS b1
JOIN books AS b2 ON b1.pages = b2.pages AND b1.id < b2.id;


/*-------------------Task 8-----------------*/
SELECT b1.name AS book1, b2.name AS book2, b3.name AS book3, b1.price AS price
FROM books AS b1
JOIN books AS b2 ON b1.price = b2.price AND b1.id < b2.id
JOIN books AS b3 ON b2.price = b3.price AND b2.id < b3.id;


/*-------------------Task 9-----------------*/
DROP PROCEDURE IF EXISTS book_by_category;
CREATE PROCEDURE book_by_category(IN user_category VARCHAR(255))
SELECT name FROM books
WHERE category_ID = (SELECT id FROM categories WHERE category = user_category);
CALL book_by_category('C&C++');



/*-------------------Task 10-----------------*/
DROP PROCEDURE IF EXISTS book_publisher_pagefilter;
CREATE PROCEDURE book_publisher_pagefilter(IN pagelim INT)
SELECT publ_houseID
FROM (
    SELECT books.publ_houseID, MIN(books.pages) as min
    FROM books
    INNER JOIN publishers ON books.publ_houseID = publishers.id
    GROUP BY books.publ_houseID
) subquery
WHERE subquery.min > pagelim;
CALL book_publisher_pagefilter(400);



/*-------------------Task 11-----------------*/
DROP PROCEDURE IF EXISTS category_more_then;
CREATE PROCEDURE category_more_then(IN bookcount INT) 
SELECT category FROM categories
WHERE (SELECT COUNT(*) FROM books WHERE category_ID = categories.id) > bookcount;
CALL category_more_then(3)


/*-------------------Task 12-----------------*/
SELECT b.*
FROM books AS b
JOIN publishers AS p ON b.publ_houseID = p.id
WHERE p.publ_house = 'Видавнича група BHV';


/*-------------------Task 13-----------------*/
SELECT b.*
FROM books AS b
LEFT JOIN publishers AS p ON b.publ_houseID = p.id AND p.publ_house = 'Видавнича група BHV'
WHERE p.id IS NULL;


/*-------------------Task 14-----------------*/
DROP PROCEDURE IF EXISTS category_and_topic;
CREATE PROCEDURE category_and_topic() 
SELECT  categories.id, categories.category FROM `categories` 
UNION 
SELECT  themes.id, themes.theme FROM `themes`
ORDER BY id;
CALL category_and_topic();


/*-------------------Task 15-----------------*/
DROP PROCEDURE IF EXISTS first_word;
CREATE PROCEDURE first_word() 
SELECT SUBSTRING_INDEX(name, ' ', 1) as FirstWordTitle FROM books ORDER BY FirstWordTitle DESC;
CALL first_word();