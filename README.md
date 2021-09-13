# tSQLt-visual-studio-examples
Example Visual Studio solutions and database projects for using tSQLt

#Instructions
The simplest way to use tSQLt in a VS Database Project is to get a tSQLt DacPac and include it as a database reference in your project.

The general project structure we recommend consists of one or more "code" projects and an equal number of "test" projects in your solution. Each test project needs to have a database reference to its code project (and other code prjects as needed).

It is also recommended to change the "debug" database to a (developer-edition) SQL Server instance instead of the default localdb included with VS.

Finally, we recommend to set "always re-create database" to true, as it generally increases deployment speed. (Do not do this on shared development instances! But then, we recommend you do not use them in general.)

