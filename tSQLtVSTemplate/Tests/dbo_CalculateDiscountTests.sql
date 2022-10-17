/*--
EXEC tSQLt.DropClass dbo_CalculateDiscountTests;
--*/
GO
CREATE SCHEMA dbo_CalculateDiscountTests AUTHORIZATION [tSQLt.TestClass];
GO
CREATE PROCEDURE dbo_CalculateDiscountTests.[test returns no discount if order ammount is $49]
AS
BEGIN
  /*Assemble*/

  /*Act*/
  DECLARE @Actual DECIMAL(13,2) = (SELECT Discount FROM dbo.CalculateDiscount(49.00));
  /*Assert*/
  EXEC tSQLt.AssertEquals 0, @Actual;
END;
GO
CREATE PROCEDURE dbo_CalculateDiscountTests.[test returns no discount if order ammount is $51]
AS
BEGIN
  /*Assemble*/

  /*Act*/
  DECLARE @Actual DECIMAL(13,2) = (SELECT Discount FROM dbo.CalculateDiscount(51.00));
  /*Assert*/
  EXEC tSQLt.AssertEquals 5.1, @Actual;
END;
GO
CREATE PROCEDURE dbo_CalculateDiscountTests.[test returns no discount if order ammount is $50]
AS
BEGIN
  /*Assemble*/

  /*Act*/
  DECLARE @Actual DECIMAL(13,2) = (SELECT Discount FROM dbo.CalculateDiscount(50.00));
  /*Assert*/
  EXEC tSQLt.AssertEquals 5, @Actual;
END;
GO
