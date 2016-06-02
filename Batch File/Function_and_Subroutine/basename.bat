::basename

::usage
@echo off
call :getBasename C:\testhoge\fugafuga.csv
echo %basename%
exit /b

:: *****************************************
:getBasename

	setlocal
	endlocal & set basename=%~nx1

exit /b
