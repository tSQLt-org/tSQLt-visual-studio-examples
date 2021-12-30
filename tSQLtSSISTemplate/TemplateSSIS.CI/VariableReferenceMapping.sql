Declare @reference_id bigint
EXEC [SSISDB].[catalog].[create_environment_reference] @environment_name=N'TemplateSSIS', @environment_folder_name=N'TestFolder.ref', @reference_id=@reference_id OUTPUT, @project_name=N'TemplateSSIS', @folder_name=N'TestFolder', @reference_type=A
Select @reference_id
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'SourceDB_ConnectionString', @object_name=N'TemplateSSIS', @folder_name=N'TestFolder', @project_name=N'TemplateSSIS', @value_type=R, @parameter_value=N'SourceDB_ConnectionString'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'SourceDB_Password', @object_name=N'TemplateSSIS', @folder_name=N'TestFolder', @project_name=N'TemplateSSIS', @value_type=R, @parameter_value=N'SourceDB_Password'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'TargetDB_ConnectionString', @object_name=N'TemplateSSIS', @folder_name=N'TestFolder', @project_name=N'TemplateSSIS', @value_type=R, @parameter_value=N'TargetDB_ConnectionString'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'TargetDB_Password', @object_name=N'TemplateSSIS', @folder_name=N'TestFolder', @project_name=N'TemplateSSIS', @value_type=R, @parameter_value=N'TargetDB_Password'
GO

GO


