::************************************************
::Copy
::************************************************
if %1 neq 1 exit

	setlocal
	:loop1
	cls
	set fileName=�����l
	echo ************
	echo *   Copy   *
	echo ************
	echo [Data]
	dir /b ..\Data
	echo ************
	echo.
	echo Copy file name (99:Exit)
	set /p fileName=

	if %fileName% equ 99 exit /b

	if %fileName% equ �����l (
		echo Error!
		timeout /t 1 /nobreak > nul
		goto loop1
	)

	:loop2
	set newFileName=�����l
	if exist ..\Data\%fileName% (
		echo New file name
		set /p newFileName=
	) else (
		echo.
		echo File not exist!
		timeout /t 1 /nobreak > nul
		goto loop1
	)

	if %newFileName% equ �����l (
		echo Error!
		timeout /t 1 /nobreak > nul
		cls
		goto loop2
	)

	if exist ..\Data\%newFileName% (
		echo File exist!
		timeout /t 1 /nobreak > nul
		cls
		goto loop2
	)

	copy ..\Data\%fileName% ..\Data\%newFileName% > nul

	echo.
	echo %fileName% Copied!
	echo.
	echo Push key down
	pause > nul

	endlocal

exit /b
::************************************************
