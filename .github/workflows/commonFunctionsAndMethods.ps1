Function Exec-SqlFileOrQuery
{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()][string] $ServerName,
    [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()][string] $Login,
    [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()][string] $SqlCmdPath,
    [Parameter(Mandatory=$true, ParameterSetName = 'File')][ValidateNotNullOrEmpty()][string[]] $FileNames,
    [Parameter(Mandatory=$false, ParameterSetName = 'File')][Parameter(Mandatory=$true, ParameterSetName = 'Query')][ValidateNotNullOrEmpty()][string] $Query,
    [Parameter(Mandatory=$false)][string] $DatabaseName = "",
    [Parameter(Mandatory=$false)][string] $AdditionalParameters = ""
  );

  $DatabaseSelector = "";
  if($DatabaseName -ne ""){
    $DatabaseSelector = '-d "'+$DatabaseName+'"';
  }
  
  $ExecutionMessage = ""
  $FileNameSection = "";
  <# -i input_file[,input_file2...] #>
  if (![string]::isnullorempty($FileNames)) {
    $FileNameSection = '-i "'+($FileNames -Join '","')+'"';
    $ExecutionMessage = $FileNames;
  }
  $QuerySection = "";
  if (![string]::isnullorempty($Query)) {
    $QuerySection = '-Q "' + $Query + '"';
    $ExecutionMessage += " " + $Query;
  }
  

  $CallSqlCmd = '&"'+$SqlCmdPath+'\sqlcmd.exe" -S "'+$ServerName+'" '+$Login+' -b -I '+$FileNameSection+' '+$QuerySection+' '+$DatabaseSelector+' '+$AdditionalParameters+';';
  $CallSqlCmd = $CallSqlCmd + ';if($LASTEXITCODE -ne 0){throw "error during execution of "+$ExecutionMessage;}';

  Invoke-Expression $CallSqlCmd -ErrorAction Stop;
}