::************************************************
::Query
::************************************************
if %1 neq 1 exit

	setlocal
	:loop
	cls
	set fileName=初期値
	echo ************
	echo *  Query   *
	echo ************
	echo [Data]
	dir /b ..\Data
	echo ************
	echo.
	echo Query file name (99:Exit)
	set /p fileName=

	if %fileName% equ 99 exit /b

	if %fileName% equ 初期値 (
		echo Error!
		timeout /t 1 /nobreak > nul
		goto loop
	)

	if exist ..\Data\%fileName% (
		type ..\Data\%fileName%
	) else (
		echo File not exist!
		timeout /t 1 /nobreak > nul
		goto loop
	)

	echo.
	echo.
	echo %fileName% Queried!
	echo.
	echo Push key down
	pause > nul

	endlocal

exit /b
::************************************************
