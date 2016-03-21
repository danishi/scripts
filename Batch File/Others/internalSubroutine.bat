::------------------------------------------------
::内部サブルーチンの使い方
::------------------------------------------------
::callは他バッチファイル以外に、内部サブルーチンの呼び出しにも使うことができる
::------------------------------------------------
:CONTROL

@echo off
title %~n0%~x0
setlocal

echo INITへ
call :INIT
echo.

echo MAINへ
call :MAIN
echo.

echo ENDへ
call :END
echo.

echo キー押下で終了
pause > nul

::goto :eofでプログラムの末尾に飛ぶ
goto :eof

::------------------------------------------------
:INIT

	set Current=初期処理
	set /a Counter+=1
	echo %Current% %Counter%

::exit /bで内部サブルーチンの終端を記述する
exit /b
::------------------------------------------------
:MAIN

	set Current=主処理
	set /a Counter+=1
	echo %Current% %Counter%

exit /b
::------------------------------------------------
:END

	set Current=終了処理
	set /a Counter+=1
	echo %Current% %Counter%

exit /b
::------------------------------------------------
