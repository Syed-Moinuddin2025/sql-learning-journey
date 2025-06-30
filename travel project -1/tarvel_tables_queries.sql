

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Trips;
DROP TABLE IF EXISTS Customers;

 CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    Phone VARCHAR(20),
    Country NVARCHAR(50)
);


BULK INSERT Customers
FROM 'D:\\SQL Data\\customers_utf8.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',  -- for UTF-8
    TABLOCK
);

SELECT * FROM Customers

CREATE TABLE Trips (
    TripID INT PRIMARY KEY,
    Destination NVARCHAR(100),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    IsInternational BIT NOT NULL,
    CONSTRAINT chk_price_positive CHECK (Price >= 0)
);


BULK INSERT Trips
FROM 'D:\\SQL Data\\trip_clean_utf8.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    TripID INT NOT NULL,
    BookingDate DATE NOT NULL DEFAULT GETDATE(),
    NumPeople TINYINT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TripID) REFERENCES Trips(TripID)
);

BULK INSERT Bookings
FROM 'D:\\SQL Data\\booking_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

SELECT TOP 10 BookingID FROM Bookings;

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentMode VARCHAR(50),
    PaymentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    CONSTRAINT chk_payment_mode CHECK (PaymentMode IN ('UPI', 'Credit Card', 'Net Banking', 'Cash'))
);

INSERT INTO Payments (PaymentID, BookingID, AmountPaid, PaymentMode)
SELECT 
    ROW_NUMBER() OVER (ORDER BY BookingID) AS PaymentID,
    BookingID,
    ROUND(10000 + (ABS(CHECKSUM(NEWID())) % 20000), 2) AS AmountPaid,  -- random between 10000–30000
    CHOOSE(ABS(CHECKSUM(NEWID())) % 4 + 1, 'UPI', 'Credit Card', 'Net Banking', 'Cash') AS PaymentMode
FROM Bookings;

SELECT COUNT(*) FROM Payments;
SELECT TOP 10 * FROM Payments ORDER BY PaymentDate DESC;

