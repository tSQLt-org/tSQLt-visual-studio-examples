CREATE SCHEMA [dbo_SplitStringTests] AUTHORIZATION [tSQLt.TestClass];
GO
CREATE PROCEDURE [dbo_SplitStringTests].[test returns single row with empty string if input is empty]
AS
BEGIN
  SELECT * INTO #Actual FROM dbo.SplitString('');
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 0=1;
  INSERT INTO #Expected VALUES ('');

  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO
CREATE PROCEDURE [dbo_SplitStringTests].[test string without separator gets returned as single row]
AS
BEGIN
  SELECT * INTO #Actual FROM dbo.SplitString('abcd');
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 0=1;
  INSERT INTO #Expected VALUES ('abcd');

  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO
CREATE PROCEDURE [dbo_SplitStringTests].[test string with a single separator returns two values in separate rows]
AS
BEGIN
  SELECT * INTO #Actual FROM dbo.SplitString('ab,cd');
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 0=1;
  INSERT INTO #Expected VALUES ('ab'), ('cd');

  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO
CREATE PROCEDURE [dbo_SplitStringTests].[test string with some separators returns some+1 values in separate rows]
AS
BEGIN
  SELECT * INTO #Actual FROM dbo.SplitString('a,cdefg,jklm,hijkqp');
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 0=1;
  INSERT INTO #Expected VALUES ('a'), ('cdefg'), ('jklm'), ('hijkqp');

  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO


