-- Q4: Add loyalty points to customers 

ALTER TABLE Customers ADD LoyaltyPoints INT DEFAULT 0;

-- Q5 : Add a check constraint to ensure trip price is not negetive 
ALTER TABLE trips ADD constraint chk_price_positive CHECK (Price>=0 ) ;

-- Q6: Make PHONE Not Null 
ALTER TABLE Customers
ALTER COLUMN Phone VARCHAR(20) NOT NULL;

-- Q7 Add default booking date .

ALTER TABLE Bookings
ADD CONSTRAINT DF_Bookings_BookingDate
DEFAULT GETDATE() FOR BookingDate;

-- Q8 CREATE TABLE to assign agents to trips

CREATE TABLE TripAssignments (
    AgentID INT,
    TripID INT,
    AssignmentDate DATETIME CONSTRAINT DF_TripAssignments_AssignmentDate DEFAULT GETDATE(),
    PRIMARY KEY (AgentID, TripID)
);

-- Q9 drop column loyaltypoints from customers
ALTER TABLE Customers 
DROP COLUMN LoyaltyPoints;

-- Q10: Drop the entire tripassignments table
 drop table if exists tripassignments;
 
 


 ALTER TABLE Customers
DROP CONSTRAINT DF__customers__Loyal__3E52440B;

ALTER TABLE Customers
DROP COLUMN LoyaltyPoints;

ALTER TABLE Bookings
ADD CONSTRAINT FK_Bookings_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


ALTER TABLE Bookings
ADD CONSTRAINT FK_Bookings_Trips
FOREIGN KEY (TripID)
REFERENCES Trips(TripID);

SELECT 
    f.name AS ForeignKey,
    OBJECT_NAME(f.parent_object_id) AS TableName,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
    OBJECT_NAME (f.referenced_object_id) AS ReferenceTable,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ReferenceColumn
FROM 
    sys.foreign_keys AS f
INNER JOIN 
    sys.foreign_key_columns AS fc 
    ON f.object_id = fc.constraint_object_id
WHERE OBJECT_NAME(f.parent_object_id) = 'Bookings';

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentMode VARCHAR(50),
    PaymentDate DATETIME CONSTRAINT DF_PaymentDate DEFAULT GETDATE(),
    CONSTRAINT FK_Payments_Bookings FOREIGN KEY (BookingID)
        REFERENCES Bookings(BookingID),
    CONSTRAINT CHK_PaymentMode CHECK (PaymentMode IN ('UPI', 'Credit Card', 'Net Banking', 'Cash'))
);
