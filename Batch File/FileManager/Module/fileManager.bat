::************************************************
::FileManager
::************************************************
:CONTROL

	@call :INIT
	call :MAIN
	call :END

exit /b
::************************************************
:INIT

	@echo off
	title %~n0%~x0
	cd %~dp0
	echo %~n0
	echo Copyright (C) 2013 Nishida. All rights reserved.
	echo.
	echo Push key down
	pause > nul

exit /b
::************************************************
:MAIN

	set endFlag=0
	:loop
	set menuFlag=0

	::ŒÄ‚Ño‚µŒ³‚©‚çŒÄ‚Î‚ê‚Ä‚¢‚é‚©”»’èƒtƒ‰ƒO
	set callFlag=1

	call menu.bat %callFlag%

	if %menuFlag% equ 1 call create.bat %callFlag%

	if %menuFlag% equ 2 call copy.bat %callFlag%

	if %menuFlag% equ 3 call delete.bat %callFlag%

	if %menuFlag% equ 4 call write.bat %callFlag%

	if %menuFlag% equ 5 call query.bat %callFlag%

	if %menuFlag% equ 6 set endFlag=1

	if %endFlag% equ 0 goto loop

exit /b
::************************************************
:END

	echo.
	echo Bye
	timeout /t 1 /nobreak > nul

exit /b
::************************************************
