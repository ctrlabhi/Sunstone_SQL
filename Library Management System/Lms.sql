-- Create the database
CREATE DATABASE LibraryDB;

-- Switch to the database
USE LibraryDB;

-- Create the Student table
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_info VARCHAR(100),
    enrollment_date DATE
);

-- Create the Teacher table
CREATE TABLE Teacher (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_info VARCHAR(100),
    hire_date DATE
);

-- Create the Book table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    copies INT NOT NULL
);

-- Create the BookCopy table
CREATE TABLE BookCopy (
    book_copy_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    copy_number INT,
    status ENUM('Available', 'Issued') DEFAULT 'Available',
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Create the Issue table
CREATE TABLE Issue (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_copy_id INT,
    issuer_id INT,
    issuer_type ENUM('Student', 'Teacher'),
    issue_date DATE,
    return_date DATE,
    due_date DATE,
    fine_amount DECIMAL(10, 2),
    FOREIGN KEY (book_copy_id) REFERENCES BookCopy(book_copy_id)
);
