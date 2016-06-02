::************************************************
::Create
::************************************************
if %1 neq 1 exit

	setlocal
	:loop
	cls
	set fileName=初期値
	echo ************
	echo *  Create  *
	echo ************
	echo [Data]
	dir /b ..\Data
	echo ************
	echo.
	echo Create file name (99:Exit)
	set /p fileName=

	if %fileName% equ 99 exit /b

	if %fileName% equ 初期値 (
		echo Error!
		timeout /t 1 /nobreak > nul
		goto loop
	)

	if exist ..\Data\%fileName% (
		echo File exist!
		timeout /t 1 /nobreak > nul
		goto loop
	) else (
		rem type nul > ファイル名で空のファイルを作成
		type nul > ..\Data\%fileName%
	)

	echo.
	echo %fileName% Created!
	echo.
	echo Push key down
	pause > nul

	endlocal

exit /b
::************************************************
