-- --------------** ALL TABLES ** ------------------
select * from Members;
select * from Authors;
select * from Books;
select * from Loans;
select * from Payments;



-- ------------------------------------------------
-- UPDATE examples
-- ------------------------------------------------

-- Disable safe updates mode
SET SQL_SAFE_UPDATES = 0;

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

-- Re-enable safe updates mode
SET SQL_SAFE_UPDATES = 1;
