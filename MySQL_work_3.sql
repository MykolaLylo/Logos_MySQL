USE library;

SELECT * FROM book;

UPDATE book SET author_name = 'Linda' WHERE book_id = 3;
UPDATE book SET author_name = 'Vasyliy' WHERE book_id = 7;

SELECT count(*)  FROM book WHERE author_title IS not null;
SELECT * FROM book WHERE numbers_of_page =(SELECT min(numbers_of_page)FROM book);

SELECT max(numbers_of_page)FROM book;

ALTER TABLE book ADD price DOUBLE NOT NULL AFTER book_id;

SELECT avg(price) FROM book;

SELECT sum(price) FROM book  WHERE category = 'Fantasy';

SELECT min(price) FROM book;

SELECT * FROM book WHERE price =(SELECT min(price)FROM book);

SELECT* FROM book WHERE author_name LIKE '_o%';

SELECT* FROM book WHERE author_email LIKE 'val%com';

SELECT* FROM book WHERE author_surname LIKE '%i';

SELECT * FROM book WHERE price BETWEEN 300 AND 400  ;

SELECT * FROM book WHERE price NOT BETWEEN 100 AND 200;

DELETE FROM book WHERE book_id = 1;

DELETE FROM book WHERE isbn = 9875333;

ALTER TABLE book RENAME COLUMN date_publication TO date_release ;