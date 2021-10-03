# tSQLt-visual-studio-examples
Example solution with database projects for using tSQLt in Visual Studio 2019

# Notes
How to rename the database in a Visual Studio Project
Mucking with XML
1. Make sure the solution/project is saved.
1. Inspect the .proj file for the <TargetDatabaseName> element
1. Update the value to the desired name. Save the file. Close the file.
1. Reload the project in VS. (You usually will be prompted to reload.)

The general project structure we recommend consists of one or more "code" projects and an equal number of "test" projects in your solution. Each test project needs to have a database reference to its code project (and other code projects as needed),as well as, a database reference to the tSQLt DACPAC.

|Example Project Structure|
|-|
|![Example Project Structure](https://user-images.githubusercontent.com/298017/133071915-2b530232-8387-44d6-a219-b7fa7f4e6832.png)|
||

The "test" project database references must be configured to use "Same database" for their "Database Location".

|Add Database Reference|
|-|
|![Add Database Reference Dialog](https://user-images.githubusercontent.com/298017/133233973-62c2d27c-8343-41b8-8b10-d5d75040a1a7.png)|
||

After setting the project database references, you need to change the "debug" database to point to a (developer-edition) SQL Server instance instead of the default localdb included with VS.

Finally, we recommend to set "always re-create database" to true, as it generally increases deployment speed. Do not do this on shared development instances!

|The Project's Debug Properties|
|-|
|![The Project's Debug Properties](https://user-images.githubusercontent.com/298017/133068972-3076598d-980a-4778-9190-a7e8f8008e24.png)|
||

## Files

The default method of calling `tSQLt.NewTestClass` to create a tSQLt test class (the schema to organize your unit tests) does not work in Visual Studio database projects. To work around this issue, we created an alternative: 

`CREATE SCHEMA [SomeRandomTests] AUTHORIZATION [tSQLt.TestClass];`

Following standard VS recommendations, you can then create your tests in independent files. For maintainability it is a good idea to place all objects that belong to a test class in a folder within the project as show in the screenshot at the top.

The maybe indirect but right way.
1. Ensure that the Solution is saved.
1. In VS right-click on the project and select "Rename" from the context menu.
1. Change the name of the project to the desired database name. Click "Yes" when prompted "Do you also want to rename the target database name for the project?"
1. Save the solution
1. Change the project name back to the old (or desired) name. Click "No" when prompted "Do you also want to rename the target database name for the project?"

Draft Instructions

How best to work in Visual Studio

Please see the tSQLt-visual-studio-examples

1. Fork tSQLt-visual-studio-examples
1. Download the latest version of tSQLt
1. Unpack the tSQLt download and copy the correct MSSQL version of the dacpac in your Tests project. Use your own dacpacs at your own risk (please don’t).
1. Create a folder with the following pattern assuming:
1. The Schema of the Thing to Test is “MySchema”
1. The Thing to Test is “MyModule”
1. Create a schema file and “AUTHORIZATION [tSQLt.TestClass]” with a filename similar to  “MySchema_MyModuleTests.sql”
1. Write all tests for “MyModule” inside the “MySchema_MyModuleTests.sql” file separated by “GO”s.
   1. Why? Because if you want to change the name of the test in the future, you need only change it in this one place. Otherwise, if you have each test in its own file, you have to make three critical changes: 1) The name of the file 2) The revision history of this file in git 3) The name of the test within/in/inside the file.
1. Update the Debug settings for all projects with the Solution:
   1. Make sure that they deploy to a real but UNSHARED AND NOT PRODUCTION server. (Project Name → Properties → Debug → Target Connection String → Edit)
   1. “Always re-create database” is selected. (Project Name → Properties → Debug → Deployment Options → Check “Always re-create database”)


Open “Run_tSQLt.sql” (make sure you’re connected to the database specified for your deploy above) and click “Execute” or “Ctrl+Shift+E”. You can also highlight the third line in the file, the one that starts with EXEC tSQLt.Run, and click Execute to run a single test class.
