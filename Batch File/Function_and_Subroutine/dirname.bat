:dirname

::usage
@echo off
call :getDirName C:\testhoge\fugafuga.csv
echo %dirname%
exit /b

:: *****************************************
:getDirName

	setlocal
	endlocal & set dirname=%~dp1

exit /b
