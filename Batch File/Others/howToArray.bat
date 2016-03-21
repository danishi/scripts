::************************************************
::howToArray.bat
::************************************************
:: enabledelayedexpansion オプションと変数を
:: エクスクラメーションで囲むと
:: 遅延環境変数を回避することができる
::
:: %アクセスは構文解析時に環境変数を展開
:: !アクセスは実行直前に環境変数を展開
::************************************************
@echo off
title %~n0%~x0

setlocal enabledelayedexpansion

::配列定義
for /l %%i in (0, 1, 9) do (

	set ary[%%i]=%%i

)

::forを使った要素の参照
for /l %%i in (0, 1, 9) do (

	echo ary[%%i} = !ary[%%i]!

)

::単体での要素の参照
echo.
echo ary[0] = %ary[0]%
echo ary[1] = %ary[1]%
echo ary[2] = %ary[2]%

endlocal

pause > nul

exit /b
::************************************************
