SELECT BookingID, SUM(AmountPaid) AS TotalPaid
FROM Payments
GROUP BY BookingID;


SELECT t.Destination, SUM(p.AmountPaid) AS TotalRevenue
FROM Payments p
JOIN Bookings b ON b.BookingID = p.BookingID
JOIN Trips t ON t.TripID = b.TripID
GROUP BY t.Destination;