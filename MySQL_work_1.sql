CREATE DATEBASE Library;
USE Library;
create table book(
book_id integer primary key ,
book_name varchar(120) not null,
book_description text default ('description is absent'),
date_publication date not null default ('2018-01-01'),
author varchar (60) not null,
category varchar(30) not null
); 

SELECT * FROM book;

INSERT INTO book(
book_id ,book_name,book_description,date_publication, category, author) VALUE
(1, 'Harry Potter  and the Philosopher`s Stone', default,'1997-06-26',"Fantasy", 'Joane Rowling' ),
(2, 'Java 8', default, '2015-11-11',"Science", 'Herbert Schildt' ),
(3, '300 Verse`s', default, '1987-04-12',"Poesy", 'Lina Kostenko'),
(4, 'Trail on the road', default, '2018-03-24',"Fiction", 'Valeriy Markus'),
(5, 'The power of introverts', default, '2014-01-29' ,"Psyhology", 'Susan Cane' ),
(6, 'Rich dad, poor dad', default, '1990-07-13',"business", 'Robert Kiyosaki'),
(7, 'Black Raven', default,'1999-03-09',"History", 'Vasyl Shklar'),
(8, 'It', default,'1997-08-17',"Fantasy", 'Stephen King' ),
(9, 'The Churchil Factor', default,'2019-05-09',"History", 'Boris Johnson' ),
(10, 'The why cafe', default,default,"Novel",'John Strelecky');