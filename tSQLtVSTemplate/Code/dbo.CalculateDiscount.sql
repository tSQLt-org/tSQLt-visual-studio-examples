/*--
DROP FUNCTION IF EXISTS dbo.CalculateDiscount;
--*/
GO
CREATE FUNCTION dbo.CalculateDiscount(@ammount DECIMAL(13,2))
RETURNS TABLE
AS
RETURN
  SELECT CASE WHEN @ammount>=50 THEN @ammount*0.1 ELSE 0 END discount;
GO
