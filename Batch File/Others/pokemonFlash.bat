::************************************************
::�|�P�����t���b�V��
::************************************************
::color�R�}���h��������ς��ă��[�v������
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
::�����_��16�i���쐬
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
