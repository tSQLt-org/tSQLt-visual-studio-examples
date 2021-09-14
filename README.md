# tSQLt-visual-studio-examples
Example solution with database projects for using tSQLt in Visual Studio 2019

## Solution Structure
The simplest way to use tSQLt in a VS Database Project is to get a tSQLt DACPAC (Data-tier Application) and include it as a database reference in your project.

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
