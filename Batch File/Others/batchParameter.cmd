::************************************************
::バッチパラメータ
::************************************************
::呼び出されたバッチファイルがパラメータとして
::もっている自分の情報
::------------------------------------------------
:CONTROL

@echo off
title %~n0%~x0
setlocal

echo %%0%   ：フルパス(""あり)
echo %0
echo.
echo %%~0%  ：フルパス(""なし)
echo %~0
echo.
echo %%~f0% ：フルパス(""なし)
echo %~f0
echo.
echo %%~d0% ：ドライブ名のみ
echo %~d0
echo.
echo %%~p0% ：パスのみ
echo %~p0
echo.
echo %%~n0% ：ファイル名のみ
echo %~n0
echo.
echo %%~x0% ：拡張子のみ
echo %~x0
echo.
echo %%~t0% ：更新日付・時刻
echo %~t0
echo.
echo %%~z0% ：ファイルサイズ(Byte)
echo %~z0
echo.

pause > nul
exit/b
::------------------------------------------------
