CREATE FUNCTION dbo.SplitString
(
	@param1 NVARCHAR(MAX)
)
RETURNS TABLE
AS
RETURN
SELECT SUBSTRING(@param1,X+1,XX-X-1) X2
  FROM
  (
    SELECT X, LEAD(X)OVER(ORDER BY X)XX
      FROM
      (
        SELECT TT.no-1 X FROM dbo.GetTallyTable(LEN(@param1)+2) AS TT 
         WHERE SUBSTRING(','+@param1+',',TT.no,1) = ','
      )X
  )X
WHERE XX IS NOT NULL;