-- data.sql
PRAGMA foreign_keys = ON;

-- Members
INSERT INTO Members (first_name, last_name, email, phone, address) VALUES
('Ananya', 'Sharma', 'ananya.sharma@example.com', '9876543210', 'Delhi'),
('Ravi', 'Patel', 'ravi.patel@example.com', NULL, 'Ahmedabad'),
('Meera', 'Iyer', 'meera.iyer@example.com', '9823456789', 'Chennai'),
('Arjun', 'Verma', 'arjun.verma@example.com', '9811122233', 'Lucknow');

-- Authors
INSERT INTO Authors (author_name, country) VALUES
('Chetan Bhagat', 'India'),
('Amish Tripathi', 'India'),
('J.K. Rowling', 'UK'),
('George Orwell', 'UK');

-- Books (one with NULL published_year)
INSERT INTO Books (title, author_id, published_year, genre) VALUES
('2 States', 1, 2009, 'Fiction'),
('The Immortals of Meluha', 2, 2010, 'Mythology'),
('Harry Potter and the Sorcerer''s Stone', 3, 1997, 'Fantasy'),
('1984', 4, NULL, 'Dystopian');

-- Loans (return_date NULL = not returned)
INSERT INTO Loans (member_id, book_id, issue_date, return_date) VALUES
(1, 1, '2023-01-05', '2023-01-20'),
(2, 2, '2023-02-10', NULL),
(3, 3, '2023-03-15', '2023-03-25'),
(4, 4, '2023-04-01', NULL);

-- Payments (some amounts NULL to show pending)
INSERT INTO Payments (member_id, amount, method, status) VALUES
(1, 50.00, 'Cash', 'Completed'),
(2, NULL, 'UPI', 'Pending'),
(3, 100.00, 'Card', 'Completed'),
(4, 75.00, 'UPI', 'Completed');

-- ------------------------------------------------
-- UPDATE examples
-- ------------------------------------------------

-- Fill missing published_year for '1984'
UPDATE Books
SET published_year = 1949
WHERE title = '1984';

-- Set payment amount where it was NULL (example)
UPDATE Payments
SET amount = 25.00, status = 'Completed'
WHERE member_id = 2 AND amount IS NULL;

-- Update a member's phone
UPDATE Members
SET phone = '9898981234'
WHERE first_name = 'Ravi' AND last_name = 'Patel';

-- ------------------------------------------------
-- DELETE examples
-- ------------------------------------------------

-- Delete books never borrowed
DELETE FROM Books
WHERE book_id NOT IN (SELECT DISTINCT book_id FROM Loans);

-- Delete members with no loans (cleanup example)
DELETE FROM Members
WHERE member_id NOT IN (SELECT DISTINCT member_id FROM Loans);
