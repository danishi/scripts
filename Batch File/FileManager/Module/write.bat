::************************************************
::Write
::************************************************
if %1 neq 1 exit

	setlocal
	:loop
	cls
	set fileName=‰Šú’l
	echo ************
	echo *  Write   *
	echo ************
	echo [Data]
	dir /b ..\Data
	echo ************
	echo.
	echo Write file name (99:Exit)
	set /p fileName=

	if %fileName% equ 99 exit /b

	if %fileName% equ ‰Šú’l (
		echo Error!
		timeout /t 1 /nobreak > nul
		goto loop
	)

	if not exist ..\Data\%fileName% (
		echo File not exist!
		timeout /t 1 /nobreak > nul
		goto loop
	)

	echo Write start!
	echo.
	cscript //nologo writer.vbs %FileName%
	echo.
	echo %fileName% Wrote!
	echo.
	echo Push key down
	pause > nul

	endlocal

exit /b
::************************************************
