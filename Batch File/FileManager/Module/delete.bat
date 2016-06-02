::************************************************
::Delete
::************************************************
if %1 neq 1 exit

	setlocal
	:loop
	cls
	set fileName=‰Šú’l
	echo ************
	echo *  Delete  *
	echo ************
	echo [Data]
	dir /b ..\Data
	echo ************
	echo.
	echo Delete file name (99:Exit)
	set /p fileName=

	if %fileName% equ 99 exit /b

	if %fileName% equ ‰Šú’l (
		echo Error!
		timeout /t 1 /nobreak > nul
		goto loop
	)

	if exist ..\Data\%fileName% (
		del ..\Data\%fileName%
	) else (
		echo File not exist!
		timeout /t 1 /nobreak > nul
		goto loop
	)

	echo.
	echo %fileName% Deleted!
	echo.
	echo Push key down
	pause > nul

	endlocal

exit /b
::************************************************
