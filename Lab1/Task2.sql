DROP DATABASE IF EXISTS task2;
CREATE DATABASE task2;
CREATE TABLE task2.books (
    number 		INT NOT NULL,
    book_code	INT NOT NULL,
    is_new		BOOLEAN DEFAULT 1,
    name		VARCHAR(256) NOT NULL,
    price		FLOAT,
    publ_house	VARCHAR(256) NOT NULL,
    pages		INT NOT NULL,
    format		VARCHAR(256),
    book_date	VARCHAR(256),
    book_count	INT NOT NULL,
    theme		VARCHAR(256),
    category	VARCHAR(256)
);

ALTER TABLE task2.books
ADD id INT NOT NULL AUTO_INCREMENT,
ADD CONSTRAINT books_pk
PRIMARY KEY (id);

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(2, 5110, 0, 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 'Видавнича група BHV', 400, '70x100/16', '07/24/2000', 5000, 'Використання ПК в цілому', 'Підручники');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(8, 4985, 0, 'Засвой самостійно модернізацію та ремонт ПК за 24 години, 2-ге вид.', 18.90, 'Вільямс', 288, '70x100/16', '07/07/2000', 5000, 'Використання ПК в цілому', 'Підручники');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(9, 5141, 0, 'Структури даних та алгоритми', 37.80, 'Вільямс', 384, '70x100/16', '9/29/2000', 5000, 'Використання ПК в цілому', 'Підручники');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(20, 5127, 0, 'Автоматизація інженерно-графічних робіт', 11.58, 'Видавнича група BHV', 256, '70x100/16', '6/15/2000', 5000, 'Використання ПК в цілому', 'Підручники');
/*******************************************/
INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(31, 5110, 0, ' Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 'Видавнича група BHV', 400, '70x100/16', '07/24/2000', 5000, 'Використання ПК в цілому', 'Апаратні засоби ПК');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(46, 5199, 0, 'Залізо IBM 2001', 30.07, 'МикроАрт', 368, '70x100/16', '12/02/2000', 5000, 'Використання ПК в цілому', 'Апаратні засоби ПК');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(50, 3851, 0, 'Захист інформації та безпека комп`ютерних систем', 26.00, 'DiaSoft', 480, '84х108/16', NULL, 5000, 'Використання ПК в цілому', 'Захист і безпека ПК');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(58, 3932, 0, 'Як перетворити персональний комп`ютер на вимірювальний комплекс', 7.65, 'ДМК', 144, '60х88/16', '06/09/1999', 5000, 'Використання ПК в цілому', 'Інші книги');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(59, 4713, 0, 'Plug-ins. Додаткові програми для музичних програм', 11.41, 'ДМК', 144, '70x100/16', '02/22/2000', 5000, 'Використання ПК в цілому', 'Інші книги');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(175, 5217, 0, 'Windows МЕ. Найновіші версії програм', 16.57, 'Триумф', 320, '70x100/16', '08/25/2000', 5000, 'Операційні системи', 'Windows 2000');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(176, 4829, 0, 'Windows 2000 Professional крок за кроком з CD', 27.25, 'Эком', 320, '70x100/16', '04/28/2000', 5000, 'Операційні системи', 'Windows 2000');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(188, 5170, 0, 'Linux версії', 24.43, 'ДКМ', 346, '70x100/16', '09/29/2000', 5000, 'Операційні системи', 'Linux');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(191, 860, 0, 'Операційна система UNIX', 3.50, 'Видавнича група BHV', 395, '84х100\16', '05/05/1997', 5000, 'Операційні системи', 'Unix');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(203, 44, 0, 'Відповіді на актуальні запитання щодо OS/2 Warp', 5.00, 'DiaSoft', 352, '60х84/16', '03/20/1996', 5000, 'Операційні системи', 'Інші операційні системи');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(206, 5176, 0, 'Windows Ме. Супутник користувача', 12.79, 'Видавнича група BHV', 306, '', '10/10/2000', 5000, 'Операційні системи', 'Інші операційні системи');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(209, 5462, 0, 'Мова програмування С++. Лекції та вправи', 29.00, 'DiaSoft', 652, ' 84х108/16', '12/12/2000', 5000, 'Програмування', 'C&C++');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(210, 4982, 0, 'Мова програмування С. Лекції та вправи', 29.00, 'DiaSoft', 432, ' 84х108/16', '07/12/2000', 5000, 'Програмування', 'C&C++');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(220, 4687, 0, 'Ефективне використання C++ .50 рекомендацій щодо покращення ваших програм та проектів', 17.60, 'ДМК', 240, '70x100/16', '02/03/2000', 5000, 'Програмування', 'C&C++');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(222, 235, 0, 'Інформаційні системи і структури даних', NULL, 'Києво-Могилянська академія', 288, '60х90/16', NULL, 400, 'Використання ПК в цілому', 'Інші книги');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(225, 8746, 1, 'Бази даних в інформаційних системах', NULL, 'Університет "Україна"', 418, '60х84/16', '25/07/2018', 100, 'Програмування', 'SQL');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(226, 2154, 1, 'Сервер на основі операційної системи FreeBSD 6.1', 0, 'Університет "Україна"', 216, '60х84/16', '03/11/2015', 500, 'Програмування', 'Інші операційні системи');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(245, 2662, 0, 'Організація баз даних та знань', 0, 'Вінниця: ВДТУ', 208, '60х90/16', '10/10/2001', 1000, 'Програмування', 'SQL');

INSERT INTO task2.books(number, book_code, is_new, name, price, publ_house, pages, format, book_date, book_count, theme, category)
VALUES(247, 5641, 1, 'Організація баз даних та знань', 0, 'Видавнича група BHV', 384, '70x100/16', '15/12/2021', 5000, 'Програмування', 'SQL');
