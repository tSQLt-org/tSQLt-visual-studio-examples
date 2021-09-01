CREATE SCHEMA [Marketing_GetGreeting_Tests] AUTHORIZATION [tSQLt.TestClass];
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test returns correct greeting for John Smith]
AS
BEGIN
  DECLARE @ActualGreeting NVARCHAR(MAX);
  DECLARE @FirstName NVARCHAR(MAX) = 'John';
  DECLARE @LastName NVARCHAR(MAX) = 'Smith';

  SELECT @ActualGreeting = Marketing.GetGreeting(@FirstName,@LastName);
  
  EXEC tSQLt.AssertEqualsString @Expected = 'Dear J. Smith', @Actual = @ActualGreeting;
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test returns correct greeting for another customer]
AS
BEGIN
  DECLARE @ActualGreeting NVARCHAR(MAX);
  DECLARE @FirstName NVARCHAR(MAX) = 'Diana';
  DECLARE @LastName NVARCHAR(MAX) = 'Doe';

  SELECT @ActualGreeting = Marketing.GetGreeting(@FirstName,@LastName);
  
  EXEC tSQLt.AssertEqualsString @Expected = 'Dear D. Doe', @Actual = @ActualGreeting;
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test if first name is unknown returns 'Dear Friend' as the greeting]
AS
BEGIN
  DECLARE @ActualGreeting NVARCHAR(MAX);
  DECLARE @FirstName NVARCHAR(MAX) = NULL;
  DECLARE @LastName NVARCHAR(MAX) = 'Doe';

  SELECT @ActualGreeting = Marketing.GetGreeting(@FirstName,@LastName);
  
  EXEC tSQLt.AssertEqualsString @Expected = 'Dear Friend', @Actual = @ActualGreeting;
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test if last name is unknown returns 'Dear <FirstName>' as the greeting]
AS
BEGIN
  DECLARE @ActualGreeting NVARCHAR(MAX);
  DECLARE @FirstName NVARCHAR(MAX) = 'Jordan';
  DECLARE @LastName NVARCHAR(MAX) = NULL;

  SELECT @ActualGreeting = Marketing.GetGreeting(@FirstName,@LastName);
  
  EXEC tSQLt.AssertEqualsString @Expected = 'Dear Jordan', @Actual = @ActualGreeting;
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test if both name parts are unknown returns 'Dear Friend' as the greeting]
AS
BEGIN
  DECLARE @ActualGreeting NVARCHAR(MAX);
  DECLARE @FirstName NVARCHAR(MAX) = NULL;
  DECLARE @LastName NVARCHAR(MAX) = NULL;

  SELECT @ActualGreeting = Marketing.GetGreeting(@FirstName,@LastName);

  EXEC tSQLt.AssertEqualsString @Expected = 'Dear Friend', @Actual = @ActualGreeting;
END
GO