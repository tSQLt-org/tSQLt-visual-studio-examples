EXEC tSQLt.NewTestClass 'SomeRandomTests';
GO
CREATE PROCEDURE SomeRandomTests.[test 1]
AS
BEGIN
  
  EXEC tSQLt.FakeTable @TableName = 'dbo.ARandomTable';

  EXEC tSQLt.AssertEmptyTable @TableName = 'dbo.ARandomTable';
END;
GO
CREATE PROCEDURE SomeRandomTests.[test 2]
AS
BEGIN
  
  EXEC tSQLt.FakeTable @TableName = 'dbo.ARandomTable';

  EXEC dbo.ARandomProc;

  EXEC tSQLt.AssertEmptyTable @TableName = 'dbo.ARandomTable';
END;
GO
