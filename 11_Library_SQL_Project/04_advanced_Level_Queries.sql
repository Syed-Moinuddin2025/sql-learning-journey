-- Task 13: Identify members with overdue books (not returned within 30 days)

SELECT 
    ist.issued_member_id,
    m.member_name,
    bk.book_title,
    ist.issued_date,
    DATEDIFF(DAY, ist.issued_date, GETDATE()) AS overdue_days
FROM issued_status AS ist
JOIN members AS m
    ON m.member_id = ist.issued_member_id
JOIN books AS bk
    ON bk.isbn = ist.issued_book_isbn
LEFT JOIN return_status AS rs
    ON rs.issued_id = ist.issued_id
WHERE 
    rs.return_date IS NULL  -- not yet returned
    AND DATEDIFF(DAY, ist.issued_date, GETDATE()) > 30
ORDER BY ist.issued_member_id;



-- 
/*    
Task 14: Update Book Status on Return Write a query to update the status of books in the books table to "Yes" when they are returned (based on entries in the return_status table).
*/
-- Drop if it already exists
DROP PROCEDURE IF EXISTS add_return_records;
GO

-- Create the procedure
CREATE PROCEDURE add_return_records
    @p_return_id VARCHAR(10),
    @p_issued_id VARCHAR(10),
    @p_book_quality VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @v_isbn VARCHAR(50);
    DECLARE @v_book_name VARCHAR(80);

    -- 1. Insert return record
    INSERT INTO return_status(return_id, issued_id, return_date, book_quality)
    VALUES (@p_return_id, @p_issued_id, GETDATE(), @p_book_quality);

    -- 2. Get book details from issued_status
    SELECT 
        @v_isbn = issued_book_isbn,
        @v_book_name = issued_book_name
    FROM issued_status
    WHERE issued_id = @p_issued_id;

    -- 3. Update book status
    UPDATE books
    SET status = 'yes'
    WHERE isbn = @v_isbn;

    -- 4. Optional: Print message (for debug/logging)
    PRINT 'Thank you for returning the book: ' + @v_book_name;
END;
GO

EXEC add_return_records 'RS138', 'IS135', 'Good';

-- Another example
EXEC add_return_records 'RS148', 'IS140', 'Good';



/*
Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.
*/
-- Optional: Drop table if it already exists
DROP TABLE IF EXISTS branch_reports;
GO

-- Create summary table using SELECT INTO (SQL Server way)
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(DISTINCT ist.issued_id) AS number_book_issued,
    COUNT(DISTINCT rs.return_id) AS number_of_book_return,
    SUM(bk.rental_price) AS total_revenue
INTO branch_reports
FROM issued_status AS ist
JOIN employees AS e
    ON e.emp_id = ist.issued_emp_id
JOIN branch AS b
    ON e.branch_id = b.branch_id
LEFT JOIN return_status AS rs
    ON rs.issued_id = ist.issued_id
JOIN books AS bk
    ON ist.issued_book_isbn = bk.isbn
GROUP BY b.branch_id, b.manager_id;

-- View the result
SELECT * FROM branch_reports;




-- Task 16: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.
-- Optional: Drop if already exists
DROP TABLE IF EXISTS active_members;
GO

-- Create table using SELECT INTO
SELECT *
INTO active_members
FROM members
WHERE member_id IN (
    SELECT DISTINCT issued_member_id
    FROM issued_status
    WHERE issued_date >= DATEADD(MONTH, -2, GETDATE())
);

-- 
-- Task 17: Find Employees with the Most Book Issues Processed
-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.

SELECT 
    e.emp_name,
    b.*,
    COUNT(ist.issued_id) as no_book_issued
FROM issued_status as ist
JOIN
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
GROUP BY 1, 2



    