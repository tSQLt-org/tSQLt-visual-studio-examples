CREATE SCHEMA TransformObjectListTests AUTHORIZATION [tSQLt.TestClass]
GO
--[@tSQLt:NoTransaction](DEFAULT)
CREATE PROCEDURE TransformObjectListTests.[test SSIS is cool]
AS
BEGIN
  DECLARE @package_name nvarchar(260) = N'TransformObjectList.dtsx';
  DECLARE @project_name nvarchar(128) = N'TemplateSSIS';
  DECLARE @folder_name nvarchar(128) = N'TestFolder';
  DECLARE @environment_name nvarchar(128) = N'TemplateSSIS';
  DECLARE @environment_folder_name nvarchar(128) = N'TestFolder.ref';

  -- SSIS Execution Parameters
  DECLARE @execution_id bigint;
  DECLARE @reference_id bigint = null;

  -- SSIS Catalog Variables (object_type = 50)
  DECLARE @logging_level smallint = 3;
  DECLARE @is_synchronized smallint = 1;

  -- Project Variables (object_type = 20)
  -- N/A

  -- Package Variables (object_type = 30)
  -- N/A

  /**********************************************************/
  /* Run the SSIS Package						              */
  /**********************************************************/

SELECT @reference_id = ER.reference_id
  FROM SSISDB.catalog.environment_references AS ER
  JOIN SSISDB.catalog.projects AS P
    ON P.project_id = ER.project_id
  JOIN SSISDB.catalog.folders AS F
    ON F.folder_id = P.folder_id
 WHERE F.name = @folder_name
   AND P.Name = @project_name
   AND ER.environment_folder_name = @environment_folder_name
   AND ER.environment_name = @environment_name


  EXEC [SSISDB].[catalog].[create_execution] 
      @package_name=@package_name, @execution_id=@execution_id OUTPUT, 
      @folder_name=@folder_name, @project_name=@project_name, 
      @use32bitruntime=False, @reference_id= @reference_id, @runinscaleout=False
  SELECT @execution_id

  EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id, @object_type = 50, @parameter_name=N'LOGGING_LEVEL', @parameter_value=@logging_level;
  EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id, @object_type = 50, @parameter_name=N'SYNCHRONIZED', @parameter_value=@is_synchronized;


  EXEC [SSISDB].[catalog].[start_execution] @execution_id



END;
GO