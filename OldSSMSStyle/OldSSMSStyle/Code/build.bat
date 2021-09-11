@echo OFF
pushd "%~dp0"

echo.
echo - Building and Deploying Project ----------------------------------------
"%SQLCMD_HOME%\sqlcmd.exe" -i "%~dp0\build.sql"  -S "%~1" %~2 -v DEMODB="%~3" 
echo.
echo - Finished Building and Deploying Project ---------------------------------

popd

