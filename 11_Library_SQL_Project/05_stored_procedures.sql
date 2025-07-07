/*
Task 19: Stored Procedure Objective: 

Create a stored procedure to manage the status of books in a library system. 

Description: Write a stored procedure that updates the status of a book in the library based on its issuance. 

The procedure should function as follows: 

The stored procedure should take the book_id as an input parameter. 

The procedure should first check if the book is available (status = 'yes'). 

If the book is available, it should be issued, and the status in the books table should be updated to 'no'. 

If the book is not available (status = 'no'), the procedure should return an error message indicating that the book is currently not available.
*/

-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS issue_book;
GO

-- Create the procedure in SQL Server style
CREATE PROCEDURE issue_book
    @p_issued_id VARCHAR(10),
    @p_issued_member_id VARCHAR(30),
    @p_issued_book_isbn VARCHAR(30),
    @p_issued_emp_id VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @v_status VARCHAR(10);

    -- Step 1: Check current book status
    SELECT @v_status = status
    FROM books
    WHERE isbn = @p_issued_book_isbn;

    -- Step 2: If available, proceed with issue
    IF @v_status = 'yes'
    BEGIN
        INSERT INTO issued_status (
            issued_id, issued_member_id, issued_date, issued_book_isbn, issued_emp_id
        )
        VALUES (
            @p_issued_id, @p_issued_member_id, GETDATE(), @p_issued_book_isbn, @p_issued_emp_id
        );

        UPDATE books
        SET status = 'no'
        WHERE isbn = @p_issued_book_isbn;

        PRINT '✅ Book record added successfully for book ISBN: ' + @p_issued_book_isbn;
    END
    ELSE
    BEGIN
        PRINT '❌ Sorry, the requested book is currently unavailable. Book ISBN: ' + @p_issued_book_isbn;
    END
END;
GO

-- Available book (should succeed)
EXEC issue_book 'IS155', 'C108', '978-0-553-29698-2', 'E104';

-- Unavailable book (should fail gracefully)
EXEC issue_book 'IS156', 'C108', '978-0-375-41398-8', 'E104';



-- 