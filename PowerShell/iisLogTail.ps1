# �z�u�f�B���N�g���ň�ԐV�������O�ɑ΂���tail�R�}���h�̎��s
$scriptPath = $MyInvocation.MyCommand.Path
$scriptParentPath = Split-Path -Parent $scriptPath
$logFileName = (Get-ChildItem *.log | Sort-Object LastWriteTime -Desc)[0].Name

echo $logFileName
Get-Content $scriptParentPath\$logFileName -Wait -Tail 10
