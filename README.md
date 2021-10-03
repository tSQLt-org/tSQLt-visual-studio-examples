# tSQLt-visual-studio-examples
Example Visual Studio solutions and database projects for using tSQLt

# Notes
How to rename the database in a Visual Studio Project
Mucking with XML
1. Make sure the solution/project is saved.
1. Inspect the .proj file for the <TargetDatabaseName> element
1. Update the value to the desired name. Save the file. Close the file.
1. Reload the project in VS. (You usually will be prompted to reload.)

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



 

 