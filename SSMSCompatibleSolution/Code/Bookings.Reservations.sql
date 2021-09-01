CREATE SEQUENCE Bookings.ReservationSequence AS INT START WITH 0 INCREMENT BY 1;
GO
CREATE TABLE Bookings.Reservations
(
  ReservationId INT 
    CONSTRAINT [Booking.Reservations.ReservationId:DF] DEFAULT NEXT VALUE FOR Bookings.ReservationSequence
    CONSTRAINT [Booking.Reservations:PK] PRIMARY KEY CLUSTERED,
  CustomerId INT,
  HotelId INT,
  BookingDate DATETIME2,
  StartDate DATE,
  StayLengthInDays INT,
  ReservationDate DATE,
  AdditionalColumns BINARY(200),
  CONSTRAINT [Bookings.Reservations:FK-->Bookings.Customers] 
    FOREIGN KEY (CustomerId) REFERENCES Bookings.Customers(CustomerId)
);