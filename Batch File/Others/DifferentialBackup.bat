::************************************************
::DifferentialBackup.bat
::************************************************
@echo off
title %~n0%~x0

setlocal

echo �����o�b�N�A�b�v���s���܂��i�L�[�����ŊJ�n�j
pause > nul

set /p HALT=�I����V���b�g�_�E�����܂���(y/n)

::---���L�R�}���h��ҏW---
set SourceDrive=G:\
set DestDrive=F:\

robocopy %SourceDrive% %DestDrive% /MIR /R:1 /LOG:%homedrive%%homepath%^\Desktop^\copyLog.txt /NP

::------------------------

echo.
echo �������܂���

if %HALT% equ y (
	shutdown /s /t 180
) else (
	pause > nul
)

endlocal

exit /b
::************************************************
