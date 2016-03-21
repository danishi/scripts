::************************************************
::電卓もどき
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
	
exit /b
::************************************************
::主処理
::************************************************
:MAIN

	:loop1
	cls
	::引数その１
	set val1=?
	set /p val1=引数１を入力してください(数字１桁)

	call :fERRCH1 %val1%

	if %flag% equ 1 (
		echo 入力エラーです
		timeout /t 1 /nobreak > nul
		goto loop1
	)

	:loop2
	cls
	echo 引数１ = %val1%
	::引数その２
	set val2=?
	set /p val2=引数２を入力してください(数字１桁)

	call :fERRCH1 %val2%

	if %flag% equ 1 (
		echo 入力エラーです
		timeout /t 1 /nobreak > nul
		goto loop2
	)

	:loop3
	cls
	echo 引数１ = %val1%
	echo 引数２ = %val2%

	::演算子入力
	set operator=?
	set /p operator=演算子を入力してください(+, -, *, /)

	call :fERRCH2 %operator%

	if %flag% equ 1 (
		echo 入力エラーです
		timeout /t 1 /nobreak > nul
		goto loop3
	)

	::計算
	cls
	if %operator% equ + call :fADD %val1% %val2%
	if %operator% equ - call :fSUB %val1% %val2%
	if %operator% equ * call :fMULT %val1% %val2%
	if %operator% equ / call :fDIV %val1% %val2%

	echo %val1% %operator% %val2% = %Answer%
	echo.

	choice /c YN /m "もう一度計算しますか？"
	if %ERRORLEVEL% equ 1 goto loop1

exit /b
::************************************************
::終了処理
::************************************************
:END

	echo 終了します
	timeout /t 1 /nobreak > nul

exit /b
::************************************************
::引数エラーチェック１(0～9の１桁の数字)
::************************************************
:fERRCH1

	setlocal
	set err=1

	if %1 equ 0 set err=0
	if %1 equ 1 set err=0
	if %1 equ 2 set err=0
	if %1 equ 3 set err=0
	if %1 equ 4 set err=0
	if %1 equ 5 set err=0
	if %1 equ 6 set err=0
	if %1 equ 7 set err=0
	if %1 equ 8 set err=0
	if %1 equ 9 set err=0

	endlocal & set flag=%err%
	::endlocalとsetを1行で使うと、環境変数を引き継げる。

exit /b
::************************************************
::引数エラーチェック２(+, -, *, /のどれか)
::************************************************
:fERRCH2

	setlocal
	set err=1

	if %1 equ + set err=0
	if %1 equ - set err=0
	if %1 equ * set err=0
	if %1 equ / set err=0

	endlocal & set flag=%err%

exit /b
::************************************************
::加算
::************************************************
:fADD

	setlocal
	set /a Wa=%1+%2
	endlocal & set Answer=%Wa%

exit /b
::************************************************
::減算
::************************************************
:fSUB

	setlocal
	set /a Sa=%1-%2
	endlocal & set Answer=%Sa%

exit /b
::************************************************
::乗算
::************************************************
:fMULT

	setlocal
	set /a Seki=%1*%2
	endlocal & set Answer=%Seki%

exit /b
::************************************************
::除算(余りも出す)
::************************************************
:fDIV

	setlocal
	set /a Shou=%1/%2
	set /a Amari=%1%%2
	if %Amari% equ 0 (
		endlocal & set Answer=%Shou%
	) else (
		endlocal & set Answer=%Shou%余り%Amari%
	)

exit /b
::************************************************
