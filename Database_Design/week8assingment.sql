-- Create database
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Table for Authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year INT,
    UNIQUE(first_name, last_name)
);

-- Table for Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    published_year INT,
    isbn VARCHAR(20) NOT NULL UNIQUE
);

-- Table for Members
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- Table for Staff
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    position VARCHAR(50) NOT NULL
);

-- Table for Transactions (Borrow/Return)
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    staff_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    due_date DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Table for Book_Author (Many-to-many relationship between Books and Authors)
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Sample Data (Optional)
INSERT INTO Authors (first_name, last_name, birth_year) VALUES ('J.K.', 'Rowling', 1965);
INSERT INTO Books (title, genre, published_year, isbn) VALUES ('Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 1997, '9780747532743');
INSERT INTO Members (first_name, last_name, date_of_birth, phone_number, email) VALUES ('John', 'Doe', '1990-05-15', '123-456-7890', 'johndoe@example.com');
INSERT INTO Staff (first_name, last_name, email, position) VALUES ('Alice', 'Smith', 'alice@library.com', 'Librarian');
INSERT INTO Transactions (member_id, book_id, staff_id, borrow_date, return_date, due_date) VALUES (1, 1, 1, '2025-05-10', NULL, '2025-06-10');
INSERT INTO Book_Author (book_id, author_id) VALUES (1, 1);
