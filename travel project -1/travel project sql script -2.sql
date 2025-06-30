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
 
 EXEC sp_help 'Bookings';
 



 
 