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
 

 