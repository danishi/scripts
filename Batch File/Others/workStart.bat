::************************************************
::仕事開始
::************************************************
::メインルーチン
::************************************************
:CONTROL

	@call :INIT
	call :MAIN
	call :END

exit /b
::************************************************
::初期処理
::************************************************
:INIT

	@echo off
	title %~n0%~x0
	
	::日付と時刻
	echo %DATE% %TIME:~0,-9%:%TIME:~3,-6%
	echo 今日も頑張りましょう！
	echo.
	echo キー押下で開始
	pause > nul

exit /b
::************************************************
::主処理
::************************************************
:MAIN

	echo メーラー(outlook)起動
	start outlook
	echo.

	echo ブラウザ起動
	::任意のURLが規定のブラウザで起動される
	start https://www.google.co.jp/
	echo.

	echo マイコンピュータ
	start explorer.exe ::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
	echo.

	echo P-COM起動
	::任意のWSのパスを指定
	start 
	echo.

	echo 付箋紙起動
	start stikynot
	echo.

exit /b
::************************************************
::終了処理
::************************************************
:END

	echo 完了しました
	timeout /t 1 /nobreak > nul

exit /b
::************************************************
