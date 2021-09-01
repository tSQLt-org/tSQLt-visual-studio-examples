CREATE SCHEMA [Marketing_EmailList_Tests] AUTHORIZATION [tSQLt.TestClass];
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test returns no rows if customers table is empty]
AS
BEGIN
  EXEC tSQLt.FakeTable @TableName = 'Bookings.Customers';

  SELECT * INTO #Actual FROM Marketing.EmailList AS C;

  EXEC tSQLt.AssertEmptyTable @TableName='#Actual';
END;
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test returns correct columns for a single opted-in customer]
AS
BEGIN
  EXEC tSQLt.FakeTable @TableName = 'Bookings.Customers';
  INSERT INTO Bookings.Customers (CustomerId, FirstName, LastName, Email, OptIn)
       VALUES(1201,'1201_fn','1201_ln','1201_email',1);

  SELECT CustomerId, FirstName, LastName, Email, OptIn INTO #Actual FROM Marketing.EmailList AS C;
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  INSERT INTO #Expected
       VALUES(1201,'1201_fn','1201_ln','1201_email',1);

  EXEC tSQLt.AssertEqualsTable @Expected='#Expected', @Actual='#Actual';
END;
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test returns multiple opted-in customers]
AS
BEGIN
  EXEC tSQLt.FakeTable @TableName = 'Bookings.Customers';
  INSERT INTO Bookings.Customers (CustomerId, OptIn)
       VALUES(1201,1),(1202,1),(1203,1);

  SELECT CustomerId, OptIn INTO #Actual FROM Marketing.EmailList AS C;
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  INSERT INTO #Expected
       VALUES(1201,1),(1202,1),(1203,1);

  EXEC tSQLt.AssertEqualsTable @Expected='#Expected', @Actual='#Actual';
END;
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test returns only opted-in customers]
AS
BEGIN
  EXEC tSQLt.FakeTable @TableName = 'Bookings.Customers';
  INSERT INTO Bookings.Customers (CustomerId, OptIn)
       VALUES(1201,0),(1202,1),(1203,0);

  SELECT CustomerId, OptIn INTO #Actual FROM Marketing.EmailList AS C;
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  INSERT INTO #Expected
       VALUES(1202,1);

  EXEC tSQLt.AssertEqualsTable @Expected='#Expected', @Actual='#Actual';
END;
GO
/*---------------------------------------------------------------------------
-- Tests below this line are for the optional exercise
---------------------------------------------------------------------------*/
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test returns accurate reservation count for each customer]
AS
BEGIN
  EXEC tSQLt.FakeTable @TableName = 'Bookings.Customers';
  EXEC tSQLt.FakeTable @TableName = 'Bookings.Reservations';
  INSERT INTO Bookings.Customers (CustomerId, OptIn)
       VALUES(1201,1),(1202,1),(1203,1);
  INSERT INTO Bookings.Reservations(CustomerId)
       VALUES(1202),(1203),(1203),(1203);

  SELECT CustomerId, ReservationCount INTO #Actual FROM Marketing.EmailList AS C;
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  INSERT INTO #Expected
       VALUES(1201,0),(1202,1),(1203,3);

  EXEC tSQLt.AssertEqualsTable @Expected='#Expected', @Actual='#Actual';
END;
GO
