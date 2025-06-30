-- 🔹 1. Total Number of Customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;
-- 🔹 2. Total Number of Trips
SELECT COUNT(*) AS TotalTrips FROM Trips;
-- 🔹 3. Total Number of Bookings
SELECT COUNT(*) AS TotalBookings FROM Bookings;
-- 🔹 4. Total Number of Payments
SELECT COUNT(*) AS TotalPayments FROM Payments;
-- 🔹 5. Total Revenue Collected (from Payments)
SELECT SUM(AmountPaid) AS TotalRevenue FROM Payments;
-- 🔹 6. Bookings per Country
SELECT 
    c.Country,
    COUNT(*) AS TotalBookings
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.Country
ORDER BY TotalBookings DESC;
-- 🔹 7. Count of International vs Domestic Trips

SELECT 
    CASE 
        WHEN IsInternational = 1 THEN 'International' 
        ELSE 'Domestic' 
    END AS TripType,
    COUNT(*) AS TotalTrips
FROM Trips
GROUP BY IsInternational;
-- 🔹 8. Total People Booked (sum of NumPeople)
SELECT SUM(NumPeople) AS TotalPeopleBooked FROM Bookings;   
-- 🔹 9. Total Revenue Collected (from Payments)
SELECT SUM(AmountPaid) AS TotalRevenue FROM Payments;   
-- 🔹 10. Revenue by Payment Mode
SELECT PaymentMode, SUM(AmountPaid) AS TotalRevenue
FROM Payments
GROUP BY PaymentMode;

SELECT 
    PaymentMode,
    COUNT(*) AS TotalTransactions,
    SUM(AmountPaid) AS TotalAmount
FROM Payments
GROUP BY PaymentMode
ORDER BY TotalAmount DESC;

-- 🔹 11. Total Bookings by Country
SELECT 
    c.Country,
    COUNT(*) AS TotalBookings
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.Country
ORDER BY TotalBookings DESC;

-- 🔹 12. Top 5 Most Booked Trips
SELECT 
    t.Destination,
    COUNT(b.BookingID) AS TimesBooked
FROM Trips t
JOIN Bookings b ON t.TripID = b.TripID
GROUP BY t.Destination
ORDER BY TimesBooked DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 🔹 13. Average Group Size per Trip
SELECT 
    t.Destination,
    AVG(b.NumPeople) AS AvgGroupSize
FROM Trips t
JOIN Bookings b ON t.TripID = b.TripID
GROUP BY t.Destination
ORDER BY AvgGroupSize DESC;

-- 🔹 14. International vs Domestic Revenue
SELECT 
    CASE WHEN t.IsInternational = 1 THEN 'International' ELSE 'Domestic' END AS TripType,
    COUNT(p.PaymentID) AS TotalPayments,
    SUM(p.AmountPaid) AS TotalRevenue
FROM Trips t
JOIN Bookings b ON t.TripID = b.TripID
JOIN Payments p ON b.BookingID = p.BookingID
GROUP BY t.IsInternational;

-- 🔹 15. Customers with Multiple Bookings
SELECT 
    c.CustomerID,
    c.Name,
    COUNT(b.BookingID) AS TotalBookings
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(b.BookingID) > 1
ORDER BY TotalBookings DESC;

-- 🔹 16. Daily Booking Summary (last 30 days)
SELECT 
    CAST(b.BookingDate AS DATE) AS BookingDate,
    COUNT(b.BookingID) AS TotalBookings,
    SUM(p.AmountPaid) AS TotalRevenue
FROM Bookings b
JOIN Payments p ON b.BookingID = p.BookingID
WHERE b.BookingDate >= DATEADD(DAY, -30, GETDATE())
GROUP BY CAST(b.BookingDate AS DATE)
ORDER BY BookingDate DESC;

SELECT 
    BookingDate,
    COUNT(*) AS TotalBookings
FROM Bookings
WHERE BookingDate >= DATEADD(DAY, -30, GETDATE())
GROUP BY BookingDate
ORDER BY BookingDate DESC;

-- 🔹 17. Total Number of Bookings and Customers
SELECT 
    (SELECT COUNT(*) FROM Bookings) AS TotalBookings,
    (SELECT COUNT(*) FROM Customers) AS TotalCustomers;

    -- 🔹 18. Highest Paying Customers (Top 10)
  SELECT 
    c.CustomerID,
    c.Name,
    SUM(p.AmountPaid) AS TotalSpent
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Payments p ON b.BookingID = p.BookingID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;