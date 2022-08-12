USE library;

CREATE TABLE IF NOT EXISTS book_2(
book2_id INT PRIMARY KEY,
book_name VARCHAR (50) NOT NULL,
`description` VARCHAR(120) DEFAULT 'description is absent',
price INT NOT NULL,
isbn INT NOT NULL
);

INSERT INTO book_2(book_name, price, isbn,category_id, author_id)VALUES
('Harry Poter and the philosopher`s Stone',340,45632424,1,1),
('It',246,1156972,1,2),
('Shining',549,2360876,1,2),
('Wall in my head',141,7689123,3,6),
('Gareth Jones',360,34189951,2,5),
('The Witcher',213,90876986,1,3),
('H hh H',222,18267422,2,7),
('Margaret Thatcher',199,977345332,2,4),
('Harry Poter and the Chamber of Secrets',389,534654756,1,1),
('The Mist',299,09878756,1,2),
('Harry Poter and the Order of the Phoenix',370,34536788,1,1);

CREATE TABLE IF NOT EXISTS category(
category_id INT PRIMARY KEY,
category_name VARCHAR (45) NOT NULL
);

INSERT INTO category(category_id, category_name)VALUES
(1,'Fantasy'),
(2,'History'),
(3,'Psychology');

CREATE TABLE IF NOT EXISTS author(
author_id INT PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR (45) NOT NULL,
author_surname VARCHAR (45) NOT NULL,
date_of_birthday DATE NOT NULL,
email VARCHAR (65) UNIQUE NOT NULL
);

INSERT INTO author(author_name, author_surname, date_of_birthday, email) VALUES
('Joanne','Rowling','1965-07-31', 'joanne.Rowling@gmail.com'),
('Stephen','King','1947-09-21', 'stephen.king@gmail.com'),
('Adrzej','Sapkowski','1948-06-21', 'andrej.sapkowski@gmail.com'),
('Andriy','Halushka','1963-06-17', 'andriy.halushka@gmail.com'),
('Myroslav','Velykyi','1971-12-01', 'myroslav.velykyi@gmail.com'),
('Volodymyr','Stanchyshyn','1980-02-12', 'volodymyr.stanchyshyng@gmail.com'),
('Laurent','Binet','1968-01-29', 'laurent.binet@gmail.com');

ALTER TABLE book_2 ADD category_id INT;

ALTER TABLE book_2 
ADD CONSTRAINT fk_book_category
FOREIGN KEY (category_id)
REFERENCES category (category_id);

ALTER TABLE book_2 ADD author_id INT;

ALTER TABLE book_2 
ADD CONSTRAINT fk_book_author
FOREIGN KEY (author_id)
REFERENCES author (author_id);

SELECT * FROM book_2; 