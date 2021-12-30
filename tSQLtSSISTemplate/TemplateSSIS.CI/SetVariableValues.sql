EXEC [SSISDB].[catalog].[create_environment] @environment_name=N'TemplateSSIS', @environment_description=N'', @folder_name=N'TestFolder.ref'
GO
DECLARE @var sql_variant = N'Data Source=.,41419;User ID=tSQLt.Build.SSIS;Initial Catalog=tSQLt_Dev;Provider=SQLNCLI11.1;Application Name=SourceDBConnection;Auto Translate=False; '
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'SourceDB_ConnectionString', @sensitive=False, @description=N'', @environment_name=N'TemplateSSIS', @folder_name=N'TestFolder.ref', @value=@var, @data_type=N'String'
GO
DECLARE @var sql_variant = N'Data Source=.,41419;User ID=tSQLt.Build.SSIS;Initial Catalog=tSQLt_Dev;Provider=SQLNCLI11.1;Application Name=TargetDBConnection;Auto Translate=False; '
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'TargetDB_ConnectionString', @sensitive=False, @description=N'', @environment_name=N'TemplateSSIS', @folder_name=N'TestFolder.ref', @value=@var, @data_type=N'String'
GO
DECLARE @var SQL_VARIANT = N''
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'SourceDB_Password', @sensitive=True, @description=N'', @environment_name=N'TemplateSSIS', @folder_name=N'TestFolder.ref', @value=@var, @data_type=N'String'
GO
DECLARE @var SQL_VARIANT = N''
EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'TargetDB_Password', @sensitive=True, @description=N'', @environment_name=N'TemplateSSIS', @folder_name=N'TestFolder.ref', @value=@var, @data_type=N'String'
GO

GO


GO

