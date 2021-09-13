CREATE PROCEDURE SomeRandomTests.[Test1]
AS
	EXEC tSQLt.FakeTable @TableName = 'dbo.ARandomTable';
	EXEC tSQLt.AssertEmptyTable @TableName = 'dbo.ARandomTable';

RETURN 0
