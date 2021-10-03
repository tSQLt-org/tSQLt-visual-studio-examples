CREATE SCHEMA [dbo_ExampleProcedureTests] AUTHORIZATION [tSQLt.TestClass];
GO
CREATE PROCEDURE [dbo_ExampleProcedureTests].[test returns NULL AverageAmount if table is empty]
AS
BEGIN
  EXEC tSQLt.FakeTable 'dbo.ExampleTable';

  CREATE TABLE #Actual(
    AverageAmount DECIMAL(13,3)
  );

  INSERT INTO #Actual
  EXEC dbo.ExampleProcedure;

  SELECT TOP(0)A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;

  INSERT INTO #Expected VALUES(NULL);

  EXEC tSQLt.AssertEqualsTable @Expected = '#Expected', @Actual = '#Actual';
END;
GO