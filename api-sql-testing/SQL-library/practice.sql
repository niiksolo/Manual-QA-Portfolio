USE library_db;

-- Простые SELECT:
SELECT * FROM books;
SELECT * FROM authors;
SELECT * FROM loans;
SELECT * FROM borrowers;

-- SELECT с условиями (WHERE):
Функции

Алиасы (AS)
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors;
SELECT b.title, a.last_name FROM books b JOIN authors a ON b.author_id = a.id;

EXISTS / NOT EXISTS
SELECT * FROM authors a WHERE EXISTS (SELECT 1 FROM books b WHERE b.author_id = a.id); -- выбираем только тех авторов, у кого есть книги

INSERT, UPDATE, DELETE
INSERT INTO authors (first_name, last_name) VALUES ('New', 'Author');
UPDATE books SET available = 0 WHERE id = 5;
DELETE FROM borrowers WHERE id = 10;
UPDATE books SET available = 0 WHERE id = 1; -- Сделать книгу недоступной
UPDATE borrowers SET email = 'ivan.new@example.com' WHERE id = 1;	Изменение данных читателя
DELETE	DELETE FROM loans WHERE id = 1;	-- Удаление одной записи
DELETE + CASCADE	DELETE FROM borrowers WHERE id = 10; -- 	Читатель удаляется, выдачи удаляются автоматически

SELECT * FROM books WHERE published_year > 1900;
SELECT * FROM books WHERE title = '1984';
SELECT * FROM books WHERE author_id != 1;
SELECT * FROM books WHERE author_id >= 4;
SELECT * FROM books WHERE title LIKE '%Harry Potter%';
SELECT * FROM books WHERE title REGEXP '[0-9]';  --  НАХОДИТ ГДЕ ЕСТЬ ХОТЯБЫ ОДНА ЦИФРА
SELECT * FROM books WHERE author_id = 1;
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
SELECT AVG(published_year) FROM books;
SELECT MAX(published_year), MIN(published_year) FROM books;
SELECT COUNT(DISTINCT author_id) FROM books;  -- количество уникальных авторов
SELECT * FROM loans WHERE return_date < CURDATE(); -- книги которые были возвращены до сегододняшней даты
SELECT * FROM loans WHERE loan_date > '2025-09-05' AND return_date IS NOT NULL; 
SELECT * FROM authors WHERE CHAR_LENGTH(first_name) = 4;  -- длина firstname 4 символа
SELECT * FROM books WHERE title LIKE 'A%' OR title LIKE 'H%';
SELECT author_id, COUNT(*) FROM books GROUP BY author_id;
SELECT ROUND(AVG(published_year), 0) FROM books; -- округление
 
SELECT * 
FROM borrowers br
WHERE EXISTS (
    SELECT 1 
    FROM loans l 
    WHERE l.borrower_id = br.id 
      AND l.return_date IS NULL
);

-- SELECT + ORDER BY, LIMIT, OFFSET

SELECT * FROM books ORDER BY published_year DESC; -- сортировка от новых к старым 
SELECT * FROM books ORDER BY published_year ASC;  от старых к новым
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors ORDER BY full_name ASC;  -- обединение 2 столбцов дял этого запроса а так они не сохраняются 
SELECT title, LENGTH(title) as len FROM books ORDER BY LEN DESC; -- сортировка по длине тайтла от самого длиного
SELECT title, published_year FROM books ORDER BY (published_year) ASC; -- сортировка по году (если бы был не только год можно было добавить YEAR/MONTS,DAY
SELECT * FROM books ORDER BY published_year DESC LIMIT 4; 
SELECT * FROM books ORDER BY published_year DESC LIMIT 5 OFFSET 5; -- OFFSET 5- пропускаем первые 5 строк 
SELECT MIN(published_year) AS oldest, MAX(published_year) AS newest FROM books; -- самый старый и новый год публикации 
SELECT COUNT(*) AS active_loans FROM loans WHERE return_date IS NULL;

-- JOIN:

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

-- Агрегаты + GROUP BY + HAVING

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


SELECT b.title, br.name AS borrower FROM loans l JOIN books b ON l.book_id = b.id JOIN borrowers br ON l.borrower_id = br.id WHERE l.return_date IS NULL; -- Выданные книги с читателями 

SELECT name FROM borrowers UNION SELECT title FROM books; -- список имён и названий одним списком










