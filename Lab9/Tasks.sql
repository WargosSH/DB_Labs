/*-------------------Task 1-----------------*/
DROP FUNCTION IF EXISTS CalculateTotalPriceByYear;
DELIMITER //
CREATE FUNCTION CalculateTotalPriceByYear(year_param INT)
RETURNS FLOAT
BEGIN
    DECLARE total_price FLOAT;
    SELECT SUM(price) INTO total_price FROM books WHERE YEAR(book_date) = year_param;
    RETURN total_price;
END //
DELIMITER ;
SELECT CalculateTotalPriceByYear(2000) AS TotalPrice;


/*-------------------Task 2-----------------*/
DROP PROCEDURE IF EXISTS GetBooksByYear;
DELIMITER //
CREATE PROCEDURE GetBooksByYear(year_param INT)
BEGIN
    CREATE TEMPORARY TABLE temp_books
    SELECT * FROM books WHERE YEAR(book_date) = year_param;
END //
DELIMITER ;

CALL GetBooksByYear(2023);
SELECT * FROM temp_books;


/*-------------------Task 3-----------------*/
DROP FUNCTION IF EXISTS GeneratePublisherList;
DELIMITER //
CREATE FUNCTION GeneratePublisherList(publishers_param VARCHAR(200))
RETURNS VARCHAR(200)
BEGIN
    DECLARE publisher_list VARCHAR(200);
    DECLARE current_publisher VARCHAR(40);
    DECLARE sep CHAR(1) DEFAULT';';
    DECLARE counter INT DEFAULT 1;
    
    SET publisher_list = '';
    
    WHILE LENGTH(publishers_param) > 0 DO
        SET current_publisher = SUBSTRING_INDEX(publishers_param, sep, 1);
        SET publishers_param = SUBSTRING(publishers_param, LENGTH(current_publisher) + 2);
        
        SET publisher_list = CONCAT(publisher_list, counter, '. ', current_publisher, '; ');
        SET counter = counter + 1;
    END WHILE;
    
    RETURN publisher_list;
END //

DELIMITER ;
SELECT GeneratePublisherList('bhv;asd;asdasd') AS PublisherList;


/*-------------------Task 4-----------------*/
-- +


/*-------------------Task 5-----------------*/
DROP PROCEDURE IF EXISTS PrintBooksByYear;

DELIMITER //
CREATE PROCEDURE PrintBooksByYear(year_param INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE book_title VARCHAR(200);
    
    DECLARE cur CURSOR FOR SELECT name FROM books WHERE YEAR(book_date) = year_param;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO book_title;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SELECT book_title;
    END LOOP;
    
    CLOSE cur;
    
END //
DELIMITER ;
