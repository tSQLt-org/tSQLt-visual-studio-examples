CREATE VIEW SSISObjects.TransformObjectList_GetObjects
AS
SELECT 
    name, 
    SCHEMA_NAME(schema_id) SchemaName, 
    QUOTENAME(SCHEMA_NAME(schema_id)) QuotedSchemaName, 
    QUOTENAME(name) QuotedName 
  FROM sys.objects;
GO