/*-------------------Task 1-----------------*/
DROP TRIGGER IF EXISTS topicDiapason;
DELIMITER //
CREATE TRIGGER topicDiapason BEFORE INSERT ON themes
FOR EACH ROW
    IF (SELECT COUNT(*) FROM themes) > 10
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Кількість більша 10';
    ELSEIF (SELECT COUNT(*) FROM themes) < 5
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Кількість менша за 5';
END IF;
//

DELIMITER ;

INSERT INTO themes(theme) VALUE('example');


/*-------------------Task 2-----------------*/
DROP TRIGGER IF EXISTS check_new_book;
DELIMITER //
CREATE TRIGGER check_new_book
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    IF NEW.is_new = 1 AND DATE_FORMAT(NEW.book_date, '%Y') <> YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A new books must have the current year as the release date.';
    END IF;
END //
DELIMITER ;

INSERT INTO books (is_new, name, price, publ_houseID, pages, format, book_date, book_count, theme_id, category_id)
VALUES (1, 'asdasd', 22, '2', 22, 'asdasd', '2005-01-01', 22,2, 2);


/*-------------------Task 3-----------------*/
DROP TRIGGER IF EXISTS check_price;
DELIMITER //
CREATE TRIGGER check_price
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    IF NEW.pages <= 100 AND NEW.price > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Книга з 100 сторінками не може коштувати більше 10';
    ELSEIF NEW.pages <= 200 AND NEW.price > 20 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Книга з 200 сторінками не може коштувати більше 20';
    ELSEIF NEW.pages <= 300 AND NEW.price > 30 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Книга з 300 сторінками не може коштувати більше 30.';
    END IF;
END //
DELIMITER ;

INSERT INTO books(name, pages,price) VALUES("Bible", 50, 30 );


/*-------------------Task 4-----------------*/
DROP TRIGGER IF EXISTS check_production_limit;
DELIMITER //
CREATE TRIGGER check_production_limit
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    IF NEW.publ_houseID = 1 AND NEW.book_count < 5000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '"BHV" have less then 5000 copies.';
    ELSEIF NEW.publ_houseID = 4 AND NEW.book_count < 10000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '"DiaSoft" have less then 10000 copies.';
    END IF;
END //
DELIMITER ;
INSERT INTO books(name, publ_houseID, pages) VALUES ("фівфів", (SELECT id From publishers WHERE publ_house = "DiaSoft"), 100);
INSERT INTO books(name, publ_houseID, pages) VALUES ("sql basics", 4, 100);


/*-------------------Task 5-----------------*/
DROP TRIGGER IF EXISTS check_duplicate_code_data;
DELIMITER //
CREATE TRIGGER check_duplicate_code_data
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    DECLARE duplicate_count INT;
    SELECT COUNT(*) INTO duplicate_count FROM books WHERE book_code = NEW.book_code AND (name <> NEW.name OR price <> NEW.price OR publ_houseID <> NEW.publ_houseID OR pages <> NEW.pages OR format <> NEW.format);
    IF duplicate_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Книги з однаковими кодами мають мати однакові данні';
    END IF;
END //
DELIMITER ; 
INSERT INTO books(book_code, name, publ_houseID, pages) VALUES (5110, "sql basics", 4, 100); 


/*-------------------Task 6-----------------*/
DROP TRIGGER IF EXISTS check_deletion_permission;
DELIMITER //
CREATE TRIGGER check_deletion_permission
BEFORE DELETE ON books
FOR EACH ROW
BEGIN
    IF CURRENT_USER() <> 'dbo' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Видалення заборонено. Необхідні права доступу.';
    ELSE
        DELETE FROM books WHERE id = OLD.id;
        SELECT CONCAT('Кількість видалених рядків: ', ROW_COUNT()) AS result;
    END IF;
END //
DELIMITER ;


/*-------------------Task 7-----------------*/
DROP TRIGGER IF EXISTS check_price_update_permission;
DELIMITER //
CREATE TRIGGER check_price_update_permission
BEFORE UPDATE ON books
FOR EACH ROW
BEGIN
    IF CURRENT_USER() = 'dbo' AND NEW.price <> OLD.price THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Зміни для цього користувача не дозволені';
    END IF;
END //
DELIMITER ;


/*-------------------Task 8-----------------*/
DROP TRIGGER IF EXISTS check_publishing_house;
DELIMITER //
CREATE TRIGGER check_publishing_house
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    IF (NEW.publ_houseID = 'ДМК' OR NEW.publ_houseID = 'Еком') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ДМК та ЕКОМ не видаються';
    END IF;
END //
DELIMITER ; 


/*-------------------Task 9-----------------*/
DROP TRIGGER IF EXISTS check_new_books_limit;
DELIMITER //
CREATE TRIGGER check_new_books_limit
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    DECLARE new_books_count INT;
    SELECT COUNT(*) INTO new_books_count FROM books WHERE publ_houseID = NEW.publ_houseID AND is_new = 1 AND YEAR(book_date) = YEAR(CURDATE()) AND MONTH(book_date) = MONTH(CURDATE());
    IF new_books_count >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Не більше 10 книг від видавництва за місяць';
    END IF;
END //
DELIMITER ;



/*-------------------Task 10-----------------*/
DROP TRIGGER IF EXISTS check_format_bhv_publishing;
DELIMITER //
CREATE TRIGGER check_format_bhv_publishing
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    IF NEW.publ_houseID = 1 AND NEW.format = '60x88 / 16' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BHV не випускає формат 60x88 / 16.';
    END IF;
END //
DELIMITER ;
