USE library_db;


-- Базовые SELECT:


SELECT * FROM books;
SELECT * FROM authors;
SELECT * FROM loans;
SELECT * FROM borrowers;
SELECT * FROM books LIMIT 5;
SELECT title, published_year FROM books;
SELECT MAX(published_year) FROM books;
SELECT MIN(published_year) FROM books;
SELECT MIN(published_year) AS oldest, MAX(published_year) AS newest FROM books; -- самый старый и новый год публикации 
SELECT COUNT(*) AS total_books FROM books; -- количество строк
SELECT AVG(published_year) AS avg_books FROM books; -- среднее значение
SELECT DISTINCT author_id FROM books; -- уникальные значения DISTINCT
SELECT ROUND(AVG(published_year), 0) FROM books; -- округление
SELECT COUNT(DISTINCT author_id) AS uniq_author FROM books;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors;
SELECT id, title, CAST(published_year AS CHAR) AS year_text FROM books; -- делает из числа текст


-- SELECT с условиями(WHERE):


SELECT * FROM books WHERE published_year > 1900;
SELECT * FROM books WHERE title = '1984';
SELECT * FROM books WHERE author_id != 1;
SELECT * FROM books WHERE author_id >= 4;
SELECT * FROM books WHERE author_id = 1;
SELECT author_id,title FROM books WHERE author_id >= 4;
SELECT * FROM books WHERE title LIKE '%Harry Potter%';
SELECT * FROM books WHERE title REGEXP '[0-9]';  --  НАХОДИТ ГДЕ ЕСТЬ ХОТЯБЫ ОДНА ЦИФРА
SELECT * FROM books WHERE published_year BETWEEN 1850 AND 1899;
SELECT * FROM authors WHERE last_name LIKE 'D%';
SELECT * FROM books WHERE title LIKE '%e';
SELECT * FROM books WHERE title NOT LIKE '%Harry Potter%';
SELECT * FROM books WHERE author_id IS NOT NULL;  -- (IS NULL)
SELECT * FROM books WHERE author_id IN (1,2);   -- выбирает только 1 2 автор ид 
SELECT * FROM books WHERE id NOT IN (10,9,8,7,6); --  не выбирает 10 9 8 7 6 в автор ид
SELECT * FROM books WHERE available = 1 AND author_id > 2;
SELECT * FROM borrowers WHERE email NOT LIKE '%example.com' or id <= 5;
SELECT * FROM loans WHERE return_date IS NULL OR id  = 4;
SELECT * FROM loans WHERE return_date IS NULL OR return_date > '2025-10-05';
SELECT * FROM loans WHERE return_date < CURDATE(); -- книги которые были возвращены до сегододняшней даты
SELECT * FROM loans WHERE loan_date > '2025-09-05' AND return_date IS NOT NULL; 
SELECT * FROM books WHERE author_id IN (1,2,3) AND author_id IS NOT NULL;
SELECT * FROM authors WHERE CHAR_LENGTH(first_name) = 4;  -- длина firstname 4 символа
SELECT * FROM books WHERE title LIKE 'A%' OR title LIKE 'H%';
SELECT * FROM loans WHERE loan_date >= '2025-09-05' AND return_date IS NULL; 
SELECT * FROM books WHERE author_id IN (SELECT id FROM authors WHERE last_name = 'Orwell');
SELECT MIN(published_year) AS oldest, MAX(published_year) AS newest FROM books; -- самый старый и новый год публикации 
SELECT COUNT(*) AS active_loans FROM loans WHERE return_date IS NULL;
SELECT id, return_date FROM loans WHERE return_date IS NULL;


-- ORDER BY, LIMIT, +OFFSET


SELECT title FROM books ORDER BY LENGTH(title) DESC;
SELECT * FROM books ORDER BY published_year DESC; -- сортировка от новых к старым 
SELECT * FROM books ORDER BY published_year ASC; -- от старых к новым
SELECT title, published_year FROM books ORDER BY published_year DESC;
SELECT title, published_year FROM books ORDER BY published_year ASC; -- сортировка по году (можно было добавить YEAR/MONTS,DAY)
SELECT title, published_year, available FROM books ORDER BY available DESC, published_year ASC;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors ORDER BY full_name ASC;  -- обединение 2 столбцов дял этого запроса а так они не сохраняются 
SELECT title, LENGTH(title) as len FROM books ORDER BY LEN DESC; -- сортировка по длине тайтла от самого длиного
SELECT * FROM books ORDER BY published_year DESC LIMIT 4; 
SELECT * FROM books ORDER BY published_year DESC LIMIT 5 OFFSET 5; -- OFFSET 5- пропускаем первые 5 строк 
SELECT title, LENGTH(title) AS len FROM books ORDER BY len ASC;
SELECT title FROM books ORDER BY RAND() LIMIT 5; -- любые 5
SELECT title , published_year FROM books ORDER BY published_year DESC LIMIT 5;
SELECT * FROM books ORDER BY available DESC, published_year DESC;
SELECT * FROM books LIMIT 5 OFFSET 5;
SELECT * FROM books ORDER BY RAND() LIMIT 3;
SELECT * FROM books ORDER BY LENGTH(title) DESC, published_year ASC;


-- Алиасы (AS)


SELECT id, title, published_year, 2025 - published_year AS age_books FROM books;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors;


-- Функции


SELECT UPPER(title) AS title_upper, LOWER(title) AS title_lower FROM books;
SELECT title, LENGTH(title) AS len FROM books ORDER BY len ASC;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors;
SELECT LEFT(title, 8) AS short_title FROM books;  -- берем первые 8 символов (RIGHT)
SELECT SUBSTRING(title, 1, 15) AS preview FROM books; -- берем символы от1до15
SELECT ROUND(AVG(published_year), 0) AS avg_year FROM books; -- округление
SELECT title, CASE WHEN available = 1 THEN 'в наличии' ELSE 'нет в наличии' END AS in_stock FROM books; -- CASE WHEN,THEN,ELSE,END это как if в питоне
SELECT * FROM books WHERE published_year >= YEAR(CURDATE()) - 30; -- книги выпустили за последние 30 лет


-- Агрегаты + GROUP BY + HAVING


SELECT author_id, COUNT(*) FROM books GROUP BY author_id;  -- сколько у каждого автора книг
SELECT COUNT(*) AS total_books FROM books;
SELECT SUM(published_year) FROM books;
SELECT AVG(published_year) AS avg_year FROM books;
SELECT MIN(published_year) AS oldest, MAX(published_year) AS newest FROM books;
SELECT author_id, COUNT(*) AS aut_count FROM books GROUP BY author_id HAVING COUNT(*) > 1;
SELECT author_id, COUNT(*) FROM books GROUP BY author_id;
SELECT published_year, COUNT(*) FROM books GROUP BY published_year;
SELECT available, COUNT(*) FROM books GROUP BY available;
SELECT borrower_id, COUNT(*) FROM loans GROUP BY borrower_id HAVING COUNT(*) >= 2;
SELECT AVG(published_year) FROM books;
SELECT MIN(published_year) AS oldest_book, MAX(published_year) AS new_book FROM books;
SELECT MONTH(l.loan_date) AS loan_month, COUNT(*) AS loans_count
FROM loans l
GROUP BY MONTH(l.loan_date)
ORDER BY loans_count DESC
LIMIT 1;


-- JOIN,LEFT,RIGHT,UNION


SELECT b.title, a.last_name FROM books b JOIN authors a ON b.author_id = a.id;

SELECT b.title, a.first_name, a.last_name
FROM books b
INNER JOIN authors a ON b.author_id = a.id; -- возвращает только совпадающие строки 

SELECT b.title, a.first_name, a.last_name
FROM books b
LEFT JOIN authors a ON b.author_id = a.id; -- все книги будут показаны

SELECT a.first_name, a.last_name, b.title FROM authors a LEFT JOIN books b ON a.id = b.author_id; -- Все авторы, даже без книг

SELECT b.title, a.first_name, a.last_name
FROM books b
RIGHT JOIN authors a ON b.author_id = a.id; -- показывает все авторы 

SELECT b.title, b.author_id, a.last_name
FROM books b
INNER JOIN authors a ON b.author_id = a.id;

SELECT b.title, a.last_name
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE b.author_id = 8;

SELECT b.first_name, b.last_name, a.title
FROM authors b  -- левая таблица
LEFT JOIN books a ON a.author_id = b.id;

SELECT b.title, br.name
FROM loans l
JOIN books b ON l.book_id = b.id
JOIN borrowers br ON l.borrower_id = br.id;

SELECT b.id, b.name, COUNT(a.id) as loans_count
FROM borrowers b
LEFT JOIN loans a ON a.borrower_id = b.id
GROUP BY b.id,b.name;

SELECT b.title, a.name
FROM books b
JOIN loans br ON br.book_id = b.id
JOIN borrowers a ON a.id = br.book_id
WHERE (br.return_date IS NULL);

SELECT b.name, COUNT(l.borrower_id) AS co_unt
FROM borrowers b
JOIN loans l ON b.id = l.borrower_id
WHERE l.return_date IS NULL
GROUP BY b.name;

SELECT b.title, COUNT(l.book_id) AS loans_count
FROM books b
LEFT JOIN loans l ON l.book_id = b.id
GROUP BY b.id, b.title
ORDER BY loans_count DESC;

SELECT name FROM borrowers
UNION
SELECT title FROM books;

SELECT name AS value, 'borrower' AS type FROM borrowers
UNION
SELECT title AS value, 'book' AS type FROM books;

SELECT name FROM borrowers
UNION ALL
SELECT email FROM borrowers;

SELECT a.first_name, a.last_name, COUNT(b.id) AS books_count
FROM authors a
LEFT JOIN books b ON a.id = b.author_id
GROUP BY a.id, a.first_name, a.last_name
ORDER BY books_count DESC;  -- всех авторов и сколько книг у каждого

SELECT br.name, COUNT(l.id) AS loans_count
FROM borrowers br
JOIN loans l ON br.id = l.borrower_id
GROUP BY br.id, br.name
ORDER BY loans_count DESC; -- показывает читателей и количество книг которые они брали 

SELECT a.first_name, a.last_name, AVG(b.published_year) AS avg_year
FROM authors a
JOIN books b ON a.id = b.author_id
GROUP BY a.id, a.first_name, a.last_name
ORDER BY avg_year;

SELECT a.first_name, a.last_name, COUNT(b.id) AS books_count
FROM authors a
JOIN books b ON a.id = b.author_id
GROUP BY a.id, a.first_name, a.last_name
HAVING COUNT(b.id) > 2
ORDER BY books_count DESC; -- только те авторы, у которых больше 2 книг 

SELECT br.name, COUNT(l.id) AS total_loans
FROM borrowers br
JOIN loans l ON br.id = l.borrower_id
GROUP BY br.id, br.name
HAVING COUNT(l.id) > 1
ORDER BY total_loans DESC; -- Читатели, которые брали книги более 1 раза 

SELECT b.title, br.name AS borrower 
FROM loans l 
JOIN books b ON l.book_id = b.id 
JOIN borrowers br ON l.borrower_id = br.id 
WHERE l.return_date IS NULL; -- Выданные книги с читателями 

SELECT name FROM borrowers 
UNION 
SELECT title FROM books; -- список имён и названий одним списком

-- подзапросы и EXISTS/NOT EXISTS


SELECT * FROM books WHERE author_id = (SELECT id FROM authors WHERE last_name = 'Orwell');
SELECT * FROM authors a WHERE EXISTS (SELECT 1 FROM books b WHERE b.author_id = a.id); -- выбираем только тех авторов, у кого есть книги
SELECT * FROM borrowers br WHERE EXISTS (SELECT 1 FROM loans l WHERE l.borrower_id = br.id AND l.return_date IS NULL);
SELECT * FROM borrowers WHERE id IN (SELECT borrower_id FROM loans WHERE return_date IS NULL);
SELECT * FROM books WHERE author_id = (SELECT id FROM authors  WHERE last_name = 'Rowling');
SELECT * FROM borrowers WHERE id IN (SELECT borrower_id FROM loans WHERE return_date IS NOT NULL);
SELECT * FROM authors a WHERE EXISTS (SELECT 1 FROM books b WHERE b.author_id = a .id);
SELECT * FROM authors a WHERE NOT EXISTS (SELECT 1 FROM books b WHERE b.author_id = a .id);
SELECT title,(SELECT COUNT(book_id) FROM loans l WHERE l.book_id = b.id) AS loan_count FROM books b;


-- INSERT, UPDATE, DELETE


INSERT INTO authors (first_name, last_name) VALUES ('New', 'Author');
UPDATE books SET available = 0 WHERE id = 5;
DELETE FROM borrowers WHERE id = 10;
UPDATE books SET available = 0 WHERE id = 1; -- Сделать книгу недоступной
UPDATE borrowers SET email = 'ivan.new@example.com' WHERE id = 1;	-- Изменение данных читателя
DELETE FROM loans WHERE id = 1;	 -- Удаление одной записи
DELETE FROM borrowers WHERE id = 10; -- 	Читатель удаляется, выдачи удаляются автоматически
INSERT INTO books (title,author_id,published_year,available) VALUES ( 'The Great Gatsby',8,1952,1 );
UPDATE authors SET first_name = 'Scott', last_name = 'Fitzgerald' WHERE id = 11;
UPDATE books SET author_id = 11 WHERE id = 11;
INSERT INTO authors (first_name, last_name) VALUES ( 'Herman', 'Melville' );
INSERT INTO books (title,author_id,published_year,available) VALUES ( 'Moby-Dick',12,1893,0 );
DELETE FROM borrowers WHERE id = 9;
INSERT INTO borrowers (name, email) VALUES ( 'Nik Solo', '123@gmail.com' );
UPDATE loans SET loan_date = '7623-01-02' WHERE id = 2;
DELETE FROM books WHERE id = 12;








