-- Создание базы и переключение на неё
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- Таблица авторов
CREATE TABLE IF NOT EXISTS authors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Таблица читателей
CREATE TABLE IF NOT EXISTS borrowers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE
) ENGINE=InnoDB;

-- Таблица книг
CREATE TABLE IF NOT EXISTS books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author_id INT,
  published_year INT, -- исправлено с YEAR на INT
  available TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Таблица выдач
CREATE TABLE IF NOT EXISTS loans (
  id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  borrower_id INT NOT NULL,
  loan_date DATE NOT NULL,
  return_date DATE DEFAULT NULL,
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  FOREIGN KEY (borrower_id) REFERENCES borrowers(id) ON DELETE CASCADE
) ENGINE=InnoDB;