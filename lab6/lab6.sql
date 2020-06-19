--1. (#15)  Напишите SQL запросы  для решения задач ниже. 
CREATE TABLE PC 
(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	cpu INTEGER NOT NULL,
	memory INTEGER NOT NULL,
	hdd INTEGER NOT NULL
);

INSERT INTO PC (cpu, memory, hdd) VALUES (1600, 2000, 500);
INSERT INTO PC (cpu, memory, hdd) VALUES (2400, 3000, 800);
INSERT INTO PC (cpu, memory, hdd) VALUES (3200, 3000, 1200);
INSERT INTO PC (cpu, memory, hdd) VALUES (2400, 2000, 500);

--1) Тактовые частоты CPU тех компьютеров, у которых объем памяти 3000 Мб. Вывод: id, cpu, memory

SELECT id, cpu, memory
FROM PC
WHERE memory = 3000;

--2) Минимальный объём жесткого диска, установленного в компьютере на складе. Вывод: hdd

SELECT MIN(hdd) AS min_hdd
FROM PC;

--3) Количество компьютеров с минимальным объемом жесткого диска, доступного на складе. Вывод: count, hdd

SELECT COUNT(hdd) AS count, hdd
FROM PC
WHERE hdd = (SELECT MIN(hdd) FROM PC);

--2. (#30) Есть таблица следующего вида:

CREATE TABLE track_downloads
(
	download_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	track_id INTEGER NOT NULL,
	user_id	INTEGER NOT NULL,
	download_time TEXT NOT NULL
);

INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (2, 1, '2010-11-19');
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (2, 2, '2010-11-19');
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (3, 1, '2010-11-19');
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (7, 2, '2010-11-19');
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (17, 2, '2011-11-19');
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (3, 3, '2011-11-19');
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (4, 3, '2011-11-19');
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (8, 4, '2010-11-19');

/*Напишите SQL-запрос, возвращающий все пары (download_count, user_count), 
    удовлетворяющие следующему условию: 
    user_count — общее ненулевое число пользователей, сделавших 
    ровно download_count скачиваний 19 ноября 2010 года.*/

SELECT download_count, COUNT(*) AS user_count
FROM (
	SELECT track_id, COUNT(*) AS download_count
	FROM track_downloads
	WHERE download_time = '2010-11-19'
	GROUP BY user_id
) AS download_count
GROUP BY download_count;

/*3. (#10) Опишите разницу типов данных DATETIME и TIMESTAMP
DATETIME хранит дату в формате:  'YYYY-MM-DD hh:mm:ss' в виде целого числа,
И поддерживает диапазон значений: от '1000-01-01 00:00:00' до '9999-12-31 23:59:59'
Время записанное в DATETIME не зависит от временной зоны установленной на сервере
Занимает 8 байт.
TIMESTAMP хранит значения, равное количеству секунд прошедших с полуночи 1 января 1970 года по усреднённому
времени Гринвича.При получении значения из бд возвращает дату с учетом часового пояса
Занимает 4 байт. Значение TIMESTAMP не может быть пустым и хранит по умолчанию NOW()
 */

/* 4.(#20)  Необходимо создать таблицу студентов (поля id, name) и таблицу курсов (поля id, name).
Каждый студент может посещать несколько курсов. Названия курсов и имена студентов - произвольны.*/

CREATE TABLE course
(
    id_course INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

INSERT INTO course (name) VALUES ('ООП');
INSERT INTO course (name) VALUES ('WEB');
INSERT INTO course (name) VALUES ('База Данных');

CREATE TABLE student
(
    id_student INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

INSERT INTO student (name) VALUES ('Антон');
INSERT INTO student (name) VALUES ('Сергей');
INSERT INTO student (name) VALUES ('Вячеслав');
INSERT INTO student (name) VALUES ('Владислав');
INSERT INTO student (name) VALUES ('Димтрий');
INSERT INTO student (name) VALUES ('Тимур');
INSERT INTO student (name) VALUES ('Максим');
INSERT INTO student (name) VALUES ('Павел');
INSERT INTO student (name) VALUES ('Константин');
INSERT INTO student (name) VALUES ('Анастасия');
INSERT INTO student (name) VALUES ('Екатерина');
INSERT INTO student (name) VALUES ('Татьяна');
INSERT INTO student (name) VALUES ('Ольга');

CREATE TABLE student_on_course
(
    id_student_on_course INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    id_course  INTEGER NOT NULL,
    id_student INTEGER NOT NULL,
	FOREIGN KEY (id_course) REFERENCES course (id_course)
	FOREIGN KEY (id_student) REFERENCES  student (id_student)
);

INSERT INTO student_on_course (id_course, id_student) VALUES (1, 1);
INSERT INTO student_on_course (id_course, id_student) VALUES (1, 2);
INSERT INTO student_on_course (id_course, id_student) VALUES (1, 3);
INSERT INTO student_on_course (id_course, id_student) VALUES (1, 4);
INSERT INTO student_on_course (id_course, id_student) VALUES (1, 5);
INSERT INTO student_on_course (id_course, id_student) VALUES (1, 6);

INSERT INTO student_on_course (id_course, id_student) VALUES (2, 1);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 2);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 3);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 4);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 5);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 6);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 7);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 8);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 9);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 10);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 11);
INSERT INTO student_on_course (id_course, id_student) VALUES (2, 12);

INSERT INTO student_on_course (id_course, id_student) VALUES (3, 2);
INSERT INTO student_on_course (id_course, id_student) VALUES (3, 1);


--1. отобразить количество курсов, на которые ходит более 5 студентов
SELECT COUNT(id_course)
FROM (	SELECT id_student, id_course
	FROM student_on_course 
	GROUP BY id_course
	HAVING COUNT(student_on_course.id_student) > 5);
	
--2. отобразить все курсы, на которые записан определенный студент.
SELECT student.name, course.name FROM student_on_course
INNER JOIN student ON student.id_student = student_on_course.id_student
INNER JOIN course ON student_on_course.id_course = course.id_course
ORDER BY student.name;

-- 5. (5#) Может ли значение в столбце(ах), на который наложено ограничение foreign key, равняться null? Привидите пример.

--Может, если не установлено ограничение NOT NULL
CREATE TABLE car
(
	id_car INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	car_model TEXT
);

CREATE TABLE client
(                            
	
	id_client INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	id_car INTEGER NULL,
	FOREIGN	KEY (id_car)
	REFERENCES car (id_car)
);

INSERT INTO car (car_model) 
VALUES ('Audi');

INSERT INTO car (car_model) 
VALUES ('BMW');

INSERT INTO client (id_car)--У клиента нет автомобиля 
VALUES (NULL);

--6. (#15) Как удалить повторяющиеся строки с использованием ключевого слова Distinct?
--Приведите пример таблиц с данными и запросы. 

--Оператор SQL DISTINCT используется для указания на то, что следует работать только с уникальными значениями столбца.

CREATE TABLE temp_students
(                            	
	id_student INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	age INTEGER NOT NULL
);

INSERT INTO temp_students (name, age)
VALUES ('Дмитрий', 23);

INSERT INTO temp_students (name, age)
VALUES ('Олег', 20);

INSERT INTO temp_students (name, age)
VALUES ('Владислав', 21);

INSERT INTO temp_students (name, age)
VALUES ('Михаил', 19);

INSERT INTO temp_students (name, age)
VALUES ('Павел', 22);

SELECT DISTINCT age FROM temp_students;
--7. (#10) Есть две таблицы:
CREATE TABLE users 
(
	users_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL
);

CREATE TABLE orders
(
	orders_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	users_id INTEGER NOT NULL,
	status INTEGER NOT NULL,
	FOREIGN	KEY (user_id)
	REFERENCES users (user_id)
);


INSERT INTO users (name) VALUES ('Антон');
INSERT INTO users (name) VALUES ('Сергей');
INSERT INTO users (name) VALUES ('Глеб');

INSERT INTO orders (users_id, status) VALUES (1, 0);
INSERT INTO orders (users_id, status) VALUES (1, 1);
INSERT INTO orders (users_id, status) VALUES (1, 1);
INSERT INTO orders (users_id, status) VALUES (1, 0);
INSERT INTO orders (users_id, status) VALUES (1, 0);
INSERT INTO orders (users_id, status) VALUES (2, 0);
INSERT INTO orders (users_id, status) VALUES (2, 0);
INSERT INTO orders (users_id, status) VALUES (2, 1);
INSERT INTO orders (users_id, status) VALUES (3, 1);
INSERT INTO orders (users_id, status) VALUES (3, 1);
INSERT INTO orders (users_id, status) VALUES (3, 1);
INSERT INTO orders (users_id, status) VALUES (3, 1);
INSERT INTO orders (users_id, status) VALUES (3, 1);
                                              
-- 1) Выбрать всех пользователей из таблицы users, у которых ВСЕ записи в таблице orders имеют status = 0

SELECT users.users_id, users.name, orders.status
FROM users
INNER JOIN orders ON users.users_id = orders.users_id
GROUP BY users.users_id
HAVING SUM(orders.status) = 0;

 --2) Выбрать всех пользователей из таблицы users, у которых больше 5 записей в таблице orders имеют status = 1
SELECT users.users_id, users.name, orders.status FROM users
JOIN orders ON users.users_id = orders.users_id
GROUP BY users.users_id
HAVING SUM(orders.status) > 5;


/* 8. (#10)  В чем различие между выражениями HAVING и WHERE?
WHERE сначала фильтрует по условию, а потом группирует(если после него есть GROUP BY).
перед HAVING обязательно должен быть GROUP BY и сначала выполняется группировка, а потом фильтрация по условию. 
Вместе с HAVING можно использовать COUNT, SUM, AVG, MIN, MAX, а с WHERE - нет
HAVING используется только с SELECT, а выражение WHERE может использоваться с SELECT, UPDATE, DELETE. 
*/