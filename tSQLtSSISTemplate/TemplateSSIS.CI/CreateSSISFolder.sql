DECLARE @folder_id BIGINT
EXEC [SSISDB].[catalog].[create_folder] @folder_name=N'TestFolder', @folder_id=@folder_id OUTPUT
SELECT @folder_id
EXEC [SSISDB].[catalog].[set_folder_description] @folder_name=N'TestFolder', @folder_description=N'Ephemeral folder for testing!'
