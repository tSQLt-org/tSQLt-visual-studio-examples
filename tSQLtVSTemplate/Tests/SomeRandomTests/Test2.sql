CREATE PROCEDURE SomeRandomTests.[Test2]
AS
	EXEC tSQLt.FakeTable @TableName = 'dbo.ARandomTable';

	EXEC dbo.SomeRandomProc;

	EXEC tSQLt.AssertEmptyTable @TableName = 'dbo.ARandomTable';

RETURN 0
