-- 11. add unique constraint on email in customer table

alter table customers add constraint unique_email unique (email);

-- Q 12: Add check constraint numpeople in bookings must be >=1

alter table bookings add constraint chk_numpeople check (numpeople >=1);

-- Q 13 : Add a new column triptype to trip tbles

alter table trips add triptype varchar(50) ;

-- Q 14: Rename phone column in customers mobile

EXEC sp_rename 'Customers.Phone', 'Mobile', 'COLUMN';

-- 	Q15 Change price column in trips to increase precision
ALTER TABLE Trips
ALTER COLUMN Price DECIMAL(12, 2);

-- Q 16: Add a table payments for tracking booking payments 
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentMode VARCHAR(50),
    PaymentDate DATETIME CONSTRAINT DF_Payments_PaymentDate DEFAULT GETDATE(),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Q17: Add check constraint to payments for allowed payment modes 
ALTER TABLE Payments ADD CONSTRAINT chk_payment_mode
CHECK (PaymentMode IN ('UPI', 'Credit Card', 'Net Banking', 'Cash'));

-- Q 18: Add index on destination in trips to improve search speed
create index idx_destination on trips(destination);

-- Q19: Drop check costrainst on rpice if it exists
ALTER TABLE Trips
DROP CONSTRAINT chk_price_positive;

-- Q 20 : Drop the payments table entirely
drop table if exists payments;

