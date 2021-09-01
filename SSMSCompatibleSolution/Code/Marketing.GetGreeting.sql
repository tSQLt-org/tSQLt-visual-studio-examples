CREATE FUNCTION Marketing.GetGreeting(@FirstName NVARCHAR(MAX), @LastName NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
  RETURN 'Dear ' + CASE 
                     WHEN @FirstName IS NULL THEN 'Friend'
                     WHEN @LastName IS NULL THEN @FirstName
                     ELSE LEFT(@FirstName,1) + '. ' + @LastName 
                   END;
END;