# tailコマンドの実行
$scriptPath = $MyInvocation.MyCommand.Path
$scriptParentPath = Split-Path -Parent $scriptPath
$logFileName = "Operation.log"

Get-Content $scriptParentPath\$logFileName -Wait -Tail 10
