/*--
EXEC tSQLt.DropClass dbo_CalculateDiscountTests;
GO
--*/
CREATE SCHEMA dbo_CalculateDiscountTests AUTHORIZATION [tSQLt.TestClass];
GO
CREATE PROCEDURE dbo_CalculateDiscountTests.[test no discount for order value 49]
AS
BEGIN
  --Assemble
  
  --Act
  DECLARE @Actual NUMERIC(13,2) = (SELECT discount FROM dbo.CalculateDiscount(49.00));

  --Assert
  EXEC tSQLt.AssertEquals @Expected = 0, @Actual = @Actual;
END;
GO
CREATE PROCEDURE dbo_CalculateDiscountTests.[test returns 10% discount for oder value 51]
AS
BEGIN
  --Assemble
  
  --Act
  DECLARE @Actual NUMERIC(13,2) = (SELECT discount FROM dbo.CalculateDiscount(51.00));

  --Assert
  EXEC tSQLt.AssertEquals @Expected = 5.1, @Actual = @Actual;
END;
GO
CREATE PROCEDURE dbo_CalculateDiscountTests.[test returns 10% discount for oder value 50]
AS
BEGIN
  --Assemble
  
  --Act
  DECLARE @Actual NUMERIC(13,2) = (SELECT discount FROM dbo.CalculateDiscount(50.00));

  --Assert
  EXEC tSQLt.AssertEquals @Expected = 5.0, @Actual = @Actual;
END;
GO
