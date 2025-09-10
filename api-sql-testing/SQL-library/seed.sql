USE library_db;

-- Авторы
INSERT INTO authors (first_name, last_name) VALUES
('Leo', 'Tolstoy'), ('Fyodor', 'Dostoevsky'), ('J.K.', 'Rowling'),
('George', 'Orwell'), ('Jane', 'Austen'), ('Mark', 'Twain'),
('Charles', 'Dickens'), ('H.G.', 'Wells'), ('Agatha', 'Christie'), ('Arthur', 'Conan Doyle');

-- Читатели
INSERT INTO borrowers (name, email) VALUES
('Ivan Petrov', 'ivan.petrov@example.com'), ('Anna Smirnova', 'anna.smirnova@example.com'),
('John Smith', 'john.smith@example.com'), ('Maria Ivanova', 'maria.ivanova@example.com'),
('Alexey Popov', 'alexey.popov@example.com'), ('Olga Kuznetsova', 'olga.kuznetsova@example.com'),
('Dmitry Sokolov', 'dmitry.sokolov@example.com'), ('Elena Morozova', 'elena.morozova@example.com'),
('Nikolay Orlov', 'nikolay.orlov@example.com'), ('Svetlana Volkova', 'svetlana.volkova@example.com');

-- Книги
INSERT INTO books (title, author_id, published_year, available) VALUES
('War and Peace', 1, 1869, 1), ('Anna Karenina', 1, 1877, 1),
('Crime and Punishment', 2, 1866, 1), ('The Brothers Karamazov', 2, 1880, 1),
('Harry Potter and the Philosopher\'s Stone', 3, 1997, 1), 
('Harry Potter and the Chamber of Secrets', 3, 1998, 1),
('1984', 4, 1949, 1), ('Pride and Prejudice', 5, 1813, 1),
('Adventures of Huckleberry Finn', 6, 1884, 1), ('Great Expectations', 7, 1861, 1);

-- Выдачи книг
INSERT INTO loans (book_id, borrower_id, loan_date, return_date) VALUES
(1,1,'2025-09-01',NULL), (2,2,'2025-09-02',NULL), (3,3,'2025-09-03','2025-09-10'),
(4,4,'2025-09-04',NULL), (5,5,'2025-09-05','2025-09-08'), (6,6,'2025-09-06',NULL),
(7,7,'2025-09-07',NULL), (8,8,'2025-09-08','2025-09-09'), (9,9,'2025-09-09',NULL), (10,10,'2025-09-10',NULL);