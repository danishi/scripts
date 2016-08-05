# 配置ディレクトリで一番新しいログに対してtailコマンドの実行
$scriptPath = $MyInvocation.MyCommand.Path
$scriptParentPath = Split-Path -Parent $scriptPath
$logFileName = (Get-ChildItem *.log | Sort-Object LastWriteTime -Desc)[0].Name

echo $logFileName
Get-Content $scriptParentPath\$logFileName -Wait -Tail 10
