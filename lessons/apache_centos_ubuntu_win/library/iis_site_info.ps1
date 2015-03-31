#!powershell

# WANT_JSON
# POWERSHELL_COMMON

$params = Parse-Args $args

$name = Get-Attr $params "name" $false;

Import-Module WebAdministration

$result = New-Object psobject @{
	changed = $FALSE
}

If ($name -ne $FALSE)
{
	$name = ""
}

$sites = Get-Website "$name"
Set-Attr $result "sites" $sites;

Exit-Json $result;
