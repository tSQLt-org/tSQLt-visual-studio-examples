USE master
GO

IF(DB_ID('$(DEMODB)')IS NOT NULL)
BEGIN
	-- EXEC returns the database context to the prior value once complete, despite the USE statement within.
	EXEC('USE $(DEMODB);ALTER DATABASE $(DEMODB) SET SINGLE_USER WITH ROLLBACK IMMEDIATE;');
	DROP DATABASE $(DEMODB);
END
GO
CREATE DATABASE $(DEMODB)
GO

USE $(DEMODB)
GO