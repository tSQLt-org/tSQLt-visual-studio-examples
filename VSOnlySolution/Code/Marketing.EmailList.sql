CREATE VIEW Marketing.EmailList
AS
SELECT C.CustomerId, C.FirstName, C.LastName, C.Email, C.OptIn, ISNULL(R.ReservationCount,0) ReservationCount
  FROM Bookings.Customers AS C
  LEFT JOIN (SELECT CustomerId, COUNT(1) ReservationCount FROM Bookings.Reservations GROUP BY CustomerId) AS R
    ON R.CustomerId = C.CustomerId
 WHERE C.OptIn = 1;

