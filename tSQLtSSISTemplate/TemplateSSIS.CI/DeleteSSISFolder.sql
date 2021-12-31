(MAX) = 'TestFolder';
DECLARE @cmd NVARCHAR(MAX) = 
ISNULL(
  (
    SELECT 'EXEC [SSISDB].[catalog].[delete_project] @project_name=N'''+P.name+''',@folder_name=N'''+F.name+''';'
      FROM SSISDB.catalog.folders AS F
      JOIN SSISDB.catalog.projects AS P
        ON P.folder_id = F.folder_id
     WHERE F.name = @FolderName
       FOR XML PATH(''),TYPE
  ).value('.','NVARCHAR(MAX)')
,'') + 
ISNULL(
  (
    SELECT 'EXEC [SSISDB].[catalog].[delete_environment] @environment_name=N'''+E.name+''',@folder_name=N'''+F.name+''';'
      FROM SSISDB.catalog.folders AS F
      JOIN SSISDB.catalog.environments AS E
        ON E.folder_id = F.folder_id
     WHERE F.name = @FolderName
       FOR XML PATH(''),TYPE
  ).value('.','NVARCHAR(MAX)')
,'') + 
(SELECT 'EXEC [SSISDB].[catalog].[delete_folder] @folder_name=N'''+F.name+''';'
  FROM SSISDB.catalog.folders AS F
 WHERE F.name = @FolderName);

--PRINT @cmd
EXEC(@cmd);
