-- Створення бази данних 'Школа';
CREATE DATABASE School;
-- використання бази данних 'школа' за замовчуванням;
USE School;
-- створення таблиці 'предмети';
CREATE TABLE IF NOT EXISTS `subject`(
subject_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR (65) NOT NULL,
koef DOUBLE NOT NULL
);
-- наповнення таблиці 'предмети';
INSERT INTO `subject`(`name`, koef) VALUES
('Maths',3.5),
('Biology',4.57),
('Literature',6.89),
('Physics',4.76),
('English',7.5);
-- створення таблиці 'аудитрія';
CREATE TABLE IF NOT EXISTS classroom(
classrom_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR (65) NOT NULL,
seats INT NOT NULL 
);

-- наповнення таблиці 'аудиторія';
INSERT INTO classroom  VALUES
(1,'Maths',15),
(2,'Biology',17),
(3,'Literature',16),
(4,'Physics',14),
(5,'English',20);
-- створення таблиці 'вчитель';
CREATE TABLE IF NOT EXISTS teacher (
teacher_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR (45) NOT NULL,
date_of_birthday DATE DEFAULT '2022-01-01'
);
-- наповнення таблиці вчитель;
INSERT INTO teacher (teacher_id, `name`, date_of_birthday) VALUES
(1,'Victor Myhaylovich', '1978-04-21' ),
(2,'Mykola Petrovich', '1971-06-11' ),
(3,'Sergiy Anatoliyovich', '1969-07-28' ),
(4,'Anna Victorivna', '1973-02-12' ),
(5,'Kateryna Myhaylivna', '1988-09-17'),
(6,'Nestor Ivanovych','1982-01-17',5);
-- створення таблиці 'студент';
CREATE TABLE IF NOT EXISTS student(
student_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR (45) NOT NULL,
date_of_birthday DATE DEFAULT '2022-01-01',
class TINYINT NOT NULL
);
-- наповнення таблиці 'студент';
INSERT INTO student VALUES
(1,'Halyna', default, 5 ),
(2,'Victoria', '2000-01-12', 4 ),
(3,'Svitlana', '2002-07-21', 2 ),
(4,'Anton', '2001-02-14', 1),
(5,'Volodymyr', '1999-01-17', 4),
(6,'Pavlo', '2006-12-19', 3 ),
(7,'Oleksandr', '2006-11-01', 3 ),
(8,'Vira', '2000-04-09', 4 );
-- створення співвідношееня між таблицями за умовою:'Предмет може викладатися лише в одній аудиторії, а аудиторія належить лише одному предмету'; 
ALTER TABLE classroom ADD subject_id INT UNIQUE ;

ALTER TABLE classroom ADD CONSTRAINT fk_subject_id FOREIGN KEY(subject_id) REFERENCES `subject`(subject_id);

UPDATE classroom SET subject_id = 1 WHERE classrom_id = 1;
UPDATE classroom SET subject_id = 2 WHERE classrom_id = 2;
UPDATE classroom SET subject_id = 3 WHERE classrom_id = 3;
UPDATE classroom SET subject_id = 4 WHERE classrom_id = 4;
UPDATE classroom SET subject_id = 5 WHERE classrom_id = 5;
-- створення співвідношееня між таблицями за умовою:'Предмет можуть викладати багато вчителів, але один вчитель може викладати лише один предмет';
ALTER TABLE teacher ADD subject_id INT ;

ALTER TABLE teacher ADD CONSTRAINT fk_subjects_id FOREIGN KEY(subject_id) REFERENCES `subject`(subject_id);

UPDATE teacher SET subject_id = 1 WHERE teacher_id = 1;
UPDATE teacher SET subject_id = 2 WHERE teacher_id = 2;
UPDATE teacher SET subject_id = 3 WHERE teacher_id = 3;
UPDATE teacher SET subject_id = 4 WHERE teacher_id = 4;
UPDATE teacher SET subject_id = 5 WHERE teacher_id = 5;
UPDATE teacher SET subject_id = 5 WHERE teacher_id = 6;
-- створення співвідношееня між таблицями за умовою:'Вчитель може вчити багатьох учнів і один учень може вчитися в різних(багатьох) вчителів';
CREATE TABLE IF NOT EXISTS teacher_student(
teacher_id INT NOT NULL,
student_id INT NOT NULL,
CONSTRAINT id PRIMARY KEY (teacher_id,student_id),
FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id),
FOREIGN KEY (student_id) REFERENCES student (student_id)
);

INSERT INTO teacher_student VALUES
(1,1),(2,1),(1,2),(4,2),(3,3),(4,4),(2,5),(5,5),(6,6),(4,6),(3,7),(6,8),(3,8);
-- Виконання заданих записів;
-- 1)Вивести всіх вчителів, які народилися пізніше ніж 1980 рік ;
SELECT*FROM teacher WHERE date_of_birthday > '1980-01-01';
-- 2) Вивести всіх учнів, в яких ім’я НЕ починається на B;
SELECT*FROM student WHERE `name` NOT LIKE 'V%';
-- 3) Відсортувати предмети за koef ;
SELECT*FROM `subject` ORDER BY koef ;
-- 4) Вивести всю інформацію про найстаршого вчителя;
SELECT*FROM teacher WHERE date_of_birthday = (SELECT max(date_of_birthday) FROM teacher);
-- 5) Вивести скільки аудиторій є у школі;
SELECT count(*)FROM classroom; 
-- 6) Вивести загальну кількість місць у всіх аудиторіях в школі;
SELECT sum(seats)FROM classroom;
-- 7) Вивести всіх учнів, які народилися у році від 2000 до 2005;
 SELECT*FROM student WHERE date_of_birthday BETWEEN '2000-01-01' AND '2005-01-01';
 -- 8) Перейменувати поле name у таблиці Вчитель на teacher_name ;
 ALTER TABLE teacher RENAME COLUMN `name` TO teacher_name;
 -- 9) Вивести всіх вчителів, які викладають фізику;
SELECT * FROM teacher INNER JOIN `subject` ON teacher.subject_id = `subject`.subject_id WHERE `subject`.name = 'Physics'; 
-- 10) Вивести всіх учнів, яких вчить вчитель “ Mykola Petrovich ” ;
SELECT * FROM student INNER JOIN teacher_student ON teacher_student.student_id = student.student_id  WHERE teacher_student.teacher_id = 2;
-- 11) Вивести всіх вчителів, які вчать “Volodymyr”;
SELECT * FROM teacher INNER JOIN teacher_student ON teacher_student.teacher_id = teacher.teacher_id  WHERE teacher_student.student_id = 5;
-- 12) Вивести аудиторію, у якій викладають biology;
SELECT * FROM classroom LEFT JOIN `subject` ON classroom.subject_id=`subject`.subject_id WHERE classroom.`name` = 'biology';
-- 13) Вивести аудиторію в якій викладає вчитель “Victor Myhaylovich”;
SELECT * FROM classroom LEFT JOIN teacher ON classroom.subject_id=teacher.subject_id WHERE teacher.teacher_name= 'Victor Myhaylovich'; 
-- 14)  Вивести вчителі, який викладає у аудиторії для Physics;
SELECT * FROM classroom RIGHT JOIN teacher ON classroom.subject_id=teacher.subject_id WHERE classroom.`name` = 'Physics'; 
