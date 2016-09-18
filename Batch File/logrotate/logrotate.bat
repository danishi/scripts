@echo off
cd %~dp0
setlocal enabledelayedexpansion

:: ログを残す日数(例：-30 ＝ 更新日が30日前)
set /a deleteLimit=-30

call :getTimeStamp

::ログのローテーション
for /f "delims=? eol=#" %%i in (logrotate.ini) do (

	if exist "%%i" (
		move "%%i" "%%i_%TimeStamp%"
		type nul > "%%i"
	)

	rem ログの削除
	call :getDirName "%%i"
	forfiles /P !dirname! /D %deleteLimit% /M "*.log*" /c "cmd /c del @path"
)

endlocal
exit /b


:: ***** SUBROUTINE *****
:getTimeStamp

	setlocal

	::YYYY/MM/DD
	::0123456789

	set YYYY=%DATE:~0,-6%
	set MM=%DATE:~5,-3%
	set DD=%DATE:~-2%

	::hh:mm:ss.mm
	::01234567890

	 set /a H=%TIME:~0,-9%
	 set M=%TIME:~3,-6%
	 set S=%TIME:~6,-3%

	if %H% lss 10 (
		set H=0%H%
	)
	endlocal & set TimeStamp=%YYYY%%MM%%DD%-%H%%M%%S%

exit /b

:getDirName

	setlocal
	endlocal & set dirname=%~dp1

exit /b

