::************************************************
::ポケモンフラッシュ
::************************************************
::colorコマンドを引数を変えてループさせる
::------------------------------------------------
:CONTROL

@echo off
title %~n0%~x0
setlocal

:loop

call :HEXRANNUM
set /a Foreground=Hex

call :HEXRANNUM
set /a Background=Hex

color %Foreground%%Background%

goto :loop
::------------------------------------------------
::ランダム16進数作成
::------------------------------------------------
:HEXRANNUM

	set /a Hex=%RANDOM%*16/32768
	if %Hex% equ 10 set Hex=A
	if %Hex% equ 11 set Hex=B
	if %Hex% equ 12 set Hex=C
	if %Hex% equ 13 set Hex=D
	if %Hex% equ 14 set Hex=E
	if %Hex% equ 15 set Hex=F

exit /b
::------------------------------------------------
