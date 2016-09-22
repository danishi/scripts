::************************************************
::DifferentialBackup.bat
::************************************************
@echo off
title %~n0%~x0

setlocal

echo 差分バックアップを行います（キー押下で開始）
pause > nul

set /p HALT=終了後シャットダウンしますか(y/n)

::---下記コマンドを編集---
set SourceDrive=G:\
set DestDrive=F:\

robocopy %SourceDrive% %DestDrive% /MIR /R:1 /LOG:%homedrive%%homepath%^\Desktop^\copyLog.txt /NP

::------------------------

echo.
echo 完了しました

if %HALT% equ y (
	shutdown /s /t 180
) else (
	pause > nul
)

endlocal

exit /b
::************************************************
