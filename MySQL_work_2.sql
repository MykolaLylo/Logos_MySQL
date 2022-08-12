USE library;

SELECT * FROM book;
SELECT * FROM book WHERE book_id IN (3,5,10);
SELECT * FROM book WHERE numbers_of_page > 350;
SELECT * FROM book WHERE author_age > 30;
SELECT * FROM book WHERE author_title IS NULL;
SELECT * FROM book WHERE author_email = 'valeriy_markus@gmail.com';
SELECT * FROM book WHERE isbn = 9875333;
SELECT * FROM book WHERE category = 'Fantasy';
SELECT * FROM book WHERE numbers_of_page > 300 AND author_age >60;
SELECT * FROM book WHERE category = 'History' OR category = 'Poesy';
SELECT * FROM book ORDER BY book_name;
SELECT * FROM book ORDER BY author_email;
SELECT * FROM book ORDER BY book_name;
SELECT * FROM book ORDER BY numbers_of_page AND book_name DESC;
SELECT DISTINCT category FROM book;
SELECT DISTINCT author_name FROM book;
SELECT * FROM book WHERE date_publication >  '2000-01-01';
SELECT * FROM book WHERE date_publication <  '2010-01-01';
ALTER TABLE book
ADD isbn INT (20) NOT NULL UNIQUE,
ADD numbers_of_page INT NOT NULL,
ADD author_name VARCHAR(45) NOT NULL,
ADD author_surname VARCHAR(45) NOT NULL,
ADD author_email VARCHAR (50) NOT NULL UNIQUE,
ADD author_age INT NOT NULL,
ADD author_birthday DATE NOT NULL,
ADD author_title TEXT(120) ;

INSERT INTO book (
book_id,
book_name,
book_description,
date_publication,
category,
isbn,
numbers_of_page,
author_name,
author_surname,
author_email,
author_age,
author_birthday,
author_title)

 VALUES
(1, 'Harry Potter  and the Philosopher`s Stone', default,'1997-06-26',"Fantasy",4532177, 465, 'Joane','Rowling','joane_rowling@gmail.com', 56, '1965-07-31', "Order national de la Legion d`honneur" ),
(2, 'Java 8', default, '2015-11-11',"Science",978014136, 356, 'Herbert','Schildt','herbert_schildt@gmail.com', 71, '1951-02-28', null ),
(3, '300 Verse`s', default, '1987-04-12',"Poesy",9875333, 345, 'Lina','Kostenko','lina_kostenko@gmail.com', 92, '1930-03-19', 'Order by name Taras Shevchenko' ),
(4, 'Trail on the road', default, '2018-03-24',"Fiction",46765441, 215, 'Valeriy','Markus','valeriy_markus@gmail.com', 28, '1993-07-14', null ),
(5, 'The power of introverts', default, '2014-01-29' ,"Psyhology",40097327, 321, 'Susan','Cain','susan_cane@gmail.com', 54, '1968-03-20', null ),
(6, 'Rich dad, poor dad', default, '1990-07-13',"business",5677332, 513, 'Robert','Kiyosaki','robert_kiyosaki@gmail.com', 75, '1947-08-04', 'Air Medal' ),
(7, 'Black Raven', default,'1999-03-09',"History",098654456, 332, 'Vasyl','Shklar','vasyl_shklar@gmail.com', 71 , '1951-06-10', 'The Gold writer`s of Ukraine' ),
(8, 'It', default,'1997-08-17',"Fantasy",7890436, 876, 'Stephen','King','stephen_king@gmail.com', 74, '1947-10-21', 'Goodreads Choice Awards' ),
(9, 'The Churchil Factor', default,'2019-05-09',"History",390964122, 479, 'Boris','Johnson','boris_johnson@gmail.com', 57, '1964-06-19', null ),
(10, 'The why cafe', default,default,"Novel",09754134, 219, 'John','Strelecky','john_Strelecky@gmail.com', 52, '1969-10-13', null )

;