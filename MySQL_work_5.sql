USE library;

SELECT*FROM book_2;
SELECT*FROM author;
SELECT*FROM author_book;

CREATE TABLE IF NOT EXISTS book_2(
book_id INT PRIMARY KEY AUTO_INCREMENT,
book_name VARCHAR(60) NOT NULL,
price DOUBLE DEFAULT(0.00),
`description` VARCHAR(120) DEFAULT ('description is absent'),
category VARCHAR(45) NOT NULL,
isbn INT UNIQUE NOT NULL,
date_release DATE DEFAULT (2022-01-01)
);

INSERT INTO book_2 (book_name, price, `description`,category, isbn, date_release) VALUES 
('Не накидайся на зефір!', 250.50, default, 'Psychology', 122675356, '2009-04-21'),
('Момент еврики', 171.49, default, 'Psychology', 54552326, '2019-06-11'),
('То є Львів', 270.70, default, 'History', 1224551234, '2016-09-20'),
('Джордж і незламний код', 290.89, default, 'For_children', 231525221, '2001-01-19'),
('Записки українського Самашедшго', 211.55, default, 'For_children', 123332623, '2007-05-01'),
('Лотта та її катастрофа', 202.00, default, 'For_children', 099926751, '2015-05-05'),
('Шість головоломок для дона Ісидро Пароді', 120.50, default, 'Mysticism', 367453312, '2012-02-21'),
('Пульт Гвенді', 259.99, default, 'Mysticism', 1222721136, '2011-07-29'),
('Воно', 333.39, default, 'Fantasy', 167567667, '2019-06-27'),
('Метаморфози', 150.19, default, 'Biology', 12676565, '2015-05-30'),
('24 особистості Біллі Міллігана', 199.00, default, 'Detective', 75553589, '2012-09-23');

CREATE TABLE IF NOT EXISTS author(
author_id INT PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR (45) NOT NULL,
author_surname VARCHAR (45) NOT NULL,
birthday DATE,
email VARCHAR(50)
);

INSERT INTO author(author_name, author_surname, birthday, email)VALUES
('Хаокім','де Пасада','1951-01-31','1951Haokim@gmail.com'),
('Еллен','Сінгер','1957-11-11','1957Elen@gmail.com'),
('Джон','Куніос','1961-09-21','1961John@gmail.com'),
('Марк','Біман','1969-12-22','1969Mark@gmail.com'),
('Люсі','Гокінг','1960-11-17','1960Luci@gmail.com'),
('Стівен','Гокінг','1958-03-13','1958Stephen@gmail.com'),
('Ліна','Костенко','1957-04-12','1957Lina@gmail.com'),
('Аліс','Пантермюлер','1966-11-19','1966Alice@gmail.com'),
('Даніела','Коль','1970-07-01','1970Danila@gmail.com'),
('Хорхе','Борхер','1952-06-06','1952Horhe@gmail.com'),
('Адольфо','Касерес','1947-08-12','1947Adopho@gmail.com'),
('Стівен','Кінг','1946-11-19','1946Stephen@gmail.com'),
('Річард','Чізман','1969-05-31','1969Richard@gmail.com'),
('Даніел','Кіз','1964-02-09','1964Daniel@gmail.com');

drop table author_book;

CREATE TABLE IF NOT EXISTS author_book(
author_id INT NOT NULL,
book_id INT NOT NULL,
CONSTRAINT id PRIMARY KEY (author_id,book_id),
FOREIGN KEY (author_id) REFERENCES author (author_id),
FOREIGN KEY (book_id) REFERENCES book_2 (book_id)
);

 INSERT INTO author_book(author_id,book_id) VALUES 
 (1,23),(2,23),(3,24),(4,24),(7,25),(5,26),(6,26),(7,27),(8,28),(9,28),(10,29),(11,29), (12,30),(13,30),(12,31),(1,32),(14,33);
 
 SELECT * FROM book_2 INNER JOIN author_book ON book_2.book_id=author_book.book_id ;