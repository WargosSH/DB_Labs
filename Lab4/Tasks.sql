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
SELECT YEAR(book_date), COUNT(*) AS total_books, SUM(price) AS total_price, AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price
FROM task2.books
WHERE price IS NOT NULL AND price < 10 OR price > 20
GROUP BY YEAR(book_date);


/*-------------------Task 6------------------*/
SELECT YEAR(book_date), COUNT(*) AS total_books, SUM(price) AS total_price, AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price
FROM task2.books
WHERE price IS NOT NULL AND price < 10 OR price > 20
GROUP BY YEAR(book_date);
ORDER BY book_count DESC;


/*-------------------Task 7------------------*/
SELECT 
    COUNT(*) AS BookCodes,
    COUNT(DISTINCT book_code) AS UniqueCodes
FROM
    task2.books;


/*-------------------Task 8------------------*/
SELECT 
    SUBSTRING(name, 1, 1) AS FirstLetter,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost
FROM
    task2.books
GROUP BY
    SUBSTRING(name, 1, 1);


/*-------------------Task 9------------------*/
SELECT 
    SUBSTRING(name, 1, 1) AS FirstLetter,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost
FROM
    task2.books
WHERE
    name NOT REGEXP '^[a-zA-Z0-9]'
GROUP BY
    SUBSTRING(name, 1, 1);



/*-------------------Task 10-----------------*/
SELECT 
    SUBSTRING(name, 1, 1) AS FirstLetter,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost
FROM
    task2.books
WHERE
    YEAR(book_date) > 2000
    AND name NOT REGEXP '^[a-zA-Z0-9]'
GROUP BY
    SUBSTRING(name, 1, 1);


/*-------------------Task 11-----------------*/
SELECT 
    SUBSTRING(name, 1, 1) AS FirstLetter,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost
FROM
    task2.books
WHERE
    YEAR(book_date) > 2000
    AND name NOT REGEXP '^[a-zA-Z0-9]'
GROUP BY
    SUBSTRING(name, 1, 1)
ORDER BY
    FirstLetter DESC;


/*-------------------Task 12-----------------*/
SELECT 
    YEAR(book_date) AS Year,
    MONTH(book_date) AS Month,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost
FROM
    task2.books
GROUP BY
    YEAR(book_date),
    MONTH(book_date);


/*-------------------Task 13-----------------*/
SELECT 
    YEAR(book_date) AS Year,
    MONTH(book_date) AS Month,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost
FROM
    task2.books
WHERE
    book_date IS NOT NULL
GROUP BY
    YEAR(book_date),
    MONTH(book_date);


/*-------------------Task 14-----------------*/
SELECT 
    YEAR(book_date) AS Year,
    MONTH(book_date) AS Month,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost
FROM
    task2.books
WHERE
    book_date IS NOT NULL
GROUP BY
    YEAR(book_date),
    MONTH(book_date)
ORDER BY
    YEAR(book_date) DESC,
    MONTH(book_date) ASC;


/*-------------------Task 15-----------------*/
SELECT 
    CASE 
        WHEN YEAR(book_date) >= YEAR(NOW()) - 1 THEN 'New'
        ELSE 'Not New'
    END AS is_new,
    price AS TotalPrice_UAH,
    price * 50 AS TotalPrice_EUR,
    price * 40 AS TotalPrice_USD
FROM
    task2.books
GROUP BY
    is_new;


/*-------------------Task 16-----------------*/
SELECT 
    CASE 
        WHEN YEAR(book_date) >= YEAR(NOW()) - 1 THEN 'New'
        ELSE 'Not New'
    END AS ,
    ROUND(SUM(CASE WHEN Валюта = 'UAH' THEN price ELSE 0 END)) AS TotalPrice_UAH,
    ROUND(SUM(CASE WHEN Валюта = 'EUR' THEN price ELSE 0 END)) AS TotalPrice_EUR,
    ROUND(SUM(CASE WHEN Валюта = 'USD' THEN price ELSE 0 END)) AS TotalPrice_USD
FROM
    task2.books
GROUP BY
    is_new;

/*-------------------Task 17-----------------*/
SELECT 
    publ_house,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost,
    AVG(price) AS AverageCost,
    MIN(price) AS MinPrice,
    MAX(price) AS MaxPrice
FROM
    task2.books
GROUP BY
    publ_house;


/*-------------------Task 18-----------------*/
SELECT 
    theme,
    publ_house,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost,
    AVG(price) AS AverageCost,
    MIN(price) AS MinPrice,
    MAX(price) AS MaxPrice
FROM
    task2.books
WHERE
    publ_house IN ('Видавнича група BHV', 'Вільямс', 'ДМК')
GROUP BY
    theme,
    publ_house;


/*-------------------Task 19-----------------*/
SELECT 
    category,
    theme,
    publ_house,
    COUNT(*) AS TotalBooks,
    SUM(price) AS TotalCost,
    AVG(price) AS AverageCost,
    MIN(price) AS MinPrice,
    MAX(price) AS MaxPrice
FROM
    task2.books
WHERE
    publ_house IN ('Видавнича група BHV', 'Вільямс', 'ДМК')
    AND theme IN ('Використання ПК в цілому', 'Операційні системи')
    AND category IN ('C&C++', 'Інші операційні системи', 'Windows 2000') -- Замініть на ваші потрібні категорії
GROUP BY
    category,
    theme,
    publ_house;


/*-------------------Task 20-----------------*/
SELECT 
    publ_house
FROM
    task2.books
GROUP BY
    publ_house
HAVING
    ROUND(price / pages) > 0.10;


