CREATE DATABASE Library;
use Library;

-- Members table
CREATE TABLE Members (
    member_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    phone       VARCHAR(20),
    address     VARCHAR(200) NOT NULL
);

-- Authors table
CREATE TABLE Authors (
    author_id   INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    country     VARCHAR(50)
);

-- Books table
CREATE TABLE Books (
    book_id        INT PRIMARY KEY AUTO_INCREMENT,
    title          VARCHAR(200) NOT NULL,
    author_id      INT,
    published_year INT,
    genre          VARCHAR(50),
    FOREIGN KEY(author_id) REFERENCES Authors(author_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Loans table
CREATE TABLE Loans (
    loan_id     INT PRIMARY KEY AUTO_INCREMENT,
    member_id   INT NOT NULL,
    book_id     INT NOT NULL,
    issue_date  DATE NOT NULL,   -- store as 'YYYY-MM-DD'
    return_date DATE,            -- NULL when not returned
    FOREIGN KEY(member_id) REFERENCES Members(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(book_id)   REFERENCES Books(book_id)   ON DELETE CASCADE ON UPDATE CASCADE
);

-- Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id  INT NOT NULL,
    amount     DECIMAL(10,2),
    method     VARCHAR(50) NOT NULL,
    status     VARCHAR(20) NOT NULL,
    FOREIGN KEY(member_id) REFERENCES Members(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
