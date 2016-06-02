::************************************************
::Menu
::************************************************
if %1 neq 1 exit

	setlocal
	:loop
	cls
	set flag=0
	set num=0
	echo ************
	echo *   MENU   *
	echo *          *
	echo * 1:Create *
	echo * 2:Copy   *
	echo * 3:Delete *
	echo * 4:Write  *
	echo * 5:Query  *
	echo * 6:Exit   *
	echo *          *
	echo ************
	echo.
	echo Please select number
	set /p num=

	if %num% equ 1 set flag=1
	if %num% equ 2 set flag=1
	if %num% equ 3 set flag=1
	if %num% equ 4 set flag=1
	if %num% equ 5 set flag=1
	if %num% equ 6 set flag=1

	if %flag% equ 0 (
		echo Error!
		timeout /t 1 /nobreak > nul
		goto loop
	)
	endlocal & set menuFlag=%num%

exit /b
::************************************************
