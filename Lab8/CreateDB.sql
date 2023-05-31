DROP DATABASE IF EXISTS task8;
CREATE DATABASE task8;

/*-------------------Task 2.1-----------------*/
CREATE TABLE task8.publishers (
    id INT NOT NULL AUTO_INCREMENT,
    publ_house VARCHAR(256) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE task8.themes (
    id INT NOT NULL AUTO_INCREMENT,
    theme VARCHAR(256) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE task8.categories (
    id INT NOT NULL AUTO_INCREMENT,
    category VARCHAR(256) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE task8.books (
    id INT NOT NULL AUTO_INCREMENT,
    book_code INT NOT NULL,
    is_new BOOLEAN DEFAULT 1,
    name VARCHAR(256) NOT NULL,
    price FLOAT,
    publ_houseID INT,
    pages INT NOT NULL,
    format VARCHAR(256),
    book_date DATE,
    book_count INT NOT NULL,
    theme_id INT,
    category_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (publ_houseID) REFERENCES task8.publishers(id),
    FOREIGN KEY (theme_id) REFERENCES task8.themes(id),
    FOREIGN KEY (category_id) REFERENCES task8.categories(id)
);


/*-------------------Task 2.2-----------------*/
INSERT INTO task8.publishers (publ_house)
SELECT DISTINCT publ_house
FROM task2.books;

INSERT INTO task8.themes (theme)
SELECT DISTINCT theme
FROM task2.books;

INSERT INTO task8.categories (category)
SELECT DISTINCT category
FROM task2.books;

INSERT INTO task8.books(book_code, is_new, name, price, publ_houseID, pages, format, book_date, book_count, theme_id, category_id)
VALUES
(5110,'No', 'Апаратні засоби мультимедіа. Відеосистема РС',                                         15.51, 1,  400, '70х100/16', '2000-07-24', 5000, 1, 1),
(4985,'No', 'Засвой самостійно модернізацію та ремонт ПК за 24 години, 2-ге вид.',                  18.90, 2,  288, '70х100/16', '2000-07-07', 5000, 1, 1),
(5141,'No', 'Структури даних та алгоритми',                                                         37.80, 2,  384, '70х100/16', '2000-9-29',  5000, 1, 1),
(5127,'No', 'Автоматизація інженерно-графічних робіт',                                              11.58, 1,  256, '70х100/16', '2000-6-15',  5000, 1, 1),
(5110,'No', 'Апаратні засоби мультимедіа. Відеосистема РС',                                         15.51, 1,  400, '70х100/16', '2000-07-24', 5000, 1, 2),
(5199,'No', 'Залізо IBM 2001',                                                                      30.07, 3,  368, '70х100/16', '2000-12-02', 5000, 1, 2),
(3851,'No', 'Захист інформації та безпека комп''ютерних систем',                                    26.00, 4,  480, '84х108/16', NULL,         5000, 1, 3),
(3932,'No', 'Як перетворити персональний комп''ютер на вимірювальний комплекс',                     7.65,  5,  144, '60х88/16',  '1999-06-09', 5000, 1, 4),
(4713,'No', 'Plug-ins. Додаткові програми для музичних програм',                                    11.41, 5,  144, '70х100/16', '2000-02-22', 5000, 1, 4),
(5217,'No', 'Windows МЕ. Найновіші версії програм',                                                 16.57, 6,  320, '70х100/16', '2000-08-25', 5000, 2, 5),
(4829,'No', 'Windows 2000 Professional крок за кроком з CD',                                        27.25, 7,  320, '70х100/16', '2000-04-28', 5000, 2, 5),
(5170,'No', 'Linux версії',                                                                         24.43, 5,  346, '70х100/16', '2000-09-29', 5000, 2, 6),
(860, 'No', 'Операційна система UNIX',                                                              3.50,  1,  395, '84х100\\16','1997-05-05', 5000, 2, 7),
(44,  'No', 'Відповіді на актуальні запитання щодо OS/2 Warp',                                      5.00,  4,  352, '60х84/16',  '1996-03-20', 5000, 2, 8),
(5176,'No', 'Windows Ме. Супутник користувача',                                                     12.79, 1,  306, '',          '2000-10-10', 5000, 2, 8),
(5462,'No', 'Мова програмування С++. Лекції та вправи',                                             29.00, 4,  656, '84х108/16', '2000-12-12', 5000, 3, 9),
(4982,'No', 'Мова програмування С. Лекції та вправи',                                               29.00, 4,  432, '84х108/16', '2000-07-12', 5000, 3, 9),
(4687,'No', 'Ефективне використання C++ .50 рекомендацій щодо покращення ваших програм та проектів',17.60, 5,  240, '70х100/16', '2000-02-03', 5000, 3, 9),
(235, 'No', 'Інформаційні системи і структури даних',                                               NULL,  8,  288, '60х90/16',  NULL,         400,  1, 4),
(8746,'Yes','Бази даних в інформаційних системах',                                                  NULL,  9,  418, '60х84/16',  '2018-25-07', 100,  3, 10),
(2154,'Yes','Сервер на основі операційної системи FreeBSD 6.1',                                     0,     9,  216, '60х84/16',  '2015-03-11', 500,  3, 8),
(2662,'No', 'Організація баз даних та знань',                                                       0,     10, 208, '60х90/16',  '2001-10-10', 1000, 3, 10),
(5641,'Yes','Організація баз даних та знань',                                                       0,     1,  384, '70х100/16', '2021-15-12', 5000, 3, 10);
