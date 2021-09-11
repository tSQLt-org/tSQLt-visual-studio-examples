@echo OFF
pushd "%~dp0"

if not exist "%~dp0\tSQLt\" goto :download

:install

"%SQLCMD_HOME%\sqlcmd.exe" -i "%~dp0\build.sql" -S "%~1" %~2 -d "%~3"

popd
goto :EOF

:download

echo download tSQLt from https://tsqlt.org/download/tsqlt/
mkdir "%~dp0\tSQLt\"
curl https://tsqlt.org/download/tsqlt/ -o "%~dp0\tSQLt\tSQLt.zip"
tar -xf "%~dp0\tSQLt\tSQLt.zip" -C "%~dp0\tSQLt\\"

goto :install