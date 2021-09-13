# tSQLt-visual-studio-examples
Example Visual Studio solutions and database projects for using tSQLt

## Solution Structure
The simplest way to use tSQLt in a VS Database Project is to get a tSQLt DacPac and include it as a database reference in your project.

The general project structure we recommend consists of one or more "code" projects and an equal number of "test" projects in your solution. Each test project needs to have a database reference to its code project (and other code prjects as needed).

|Example Project Structure|
|-|
|![Example Project Structure](https://user-images.githubusercontent.com/298017/133071915-2b530232-8387-44d6-a219-b7fa7f4e6832.png)
|
||

It is also recommended to change the "debug" database to a (developer-edition) SQL Server instance instead of the default localdb included with VS.

Finally, we recommend to set "always re-create database" to true, as it generally increases deployment speed. (Do not do this on shared development instances! But then, we recommend you do not use them in general.)

|The Project's Debug Properties|
|-|
|![The Project's Debug Properties](https://user-images.githubusercontent.com/298017/133068972-3076598d-980a-4778-9190-a7e8f8008e24.png)|
||

## Files

To create the test class (the schema) for tests to live in, VS is incompatible with the default call to `tSQLt.NewTestClass`. To get around that we created an alternative way to instantiate a new test class: 

`CREATE SCHEMA [SomeRandomTests] AUTHORIZATION [tSQLt.TestClass];`

Following standard VS recommendations, you can then create your tests in independent files. It might be a good idea, too, to place all objects that belong to a test class in a folder under the project as show in the screenshot above.
