::************************************************
::�d����ǂ�
::************************************************
::���C�����[�`��
::************************************************
:CONTROL

	@call :INIT
	call :MAIN
	call :END

exit /b
::************************************************
::��������
::************************************************
:INIT

	@echo off
	title %~n0%~x0
	
exit /b
::************************************************
::�又��
::************************************************
:MAIN

	:loop1
	cls
	::�������̂P
	set val1=?
	set /p val1=�����P����͂��Ă�������(�����P��)

	call :fERRCH1 %val1%

	if %flag% equ 1 (
		echo ���̓G���[�ł�
		timeout /t 1 /nobreak > nul
		goto loop1
	)

	:loop2
	cls
	echo �����P = %val1%
	::�������̂Q
	set val2=?
	set /p val2=�����Q����͂��Ă�������(�����P��)

	call :fERRCH1 %val2%

	if %flag% equ 1 (
		echo ���̓G���[�ł�
		timeout /t 1 /nobreak > nul
		goto loop2
	)

	:loop3
	cls
	echo �����P = %val1%
	echo �����Q = %val2%

	::���Z�q����
	set operator=?
	set /p operator=���Z�q����͂��Ă�������(+, -, *, /)

	call :fERRCH2 %operator%

	if %flag% equ 1 (
		echo ���̓G���[�ł�
		timeout /t 1 /nobreak > nul
		goto loop3
	)

	::�v�Z
	cls
	if %operator% equ + call :fADD %val1% %val2%
	if %operator% equ - call :fSUB %val1% %val2%
	if %operator% equ * call :fMULT %val1% %val2%
	if %operator% equ / call :fDIV %val1% %val2%

	echo %val1% %operator% %val2% = %Answer%
	echo.

	choice /c YN /m "������x�v�Z���܂����H"
	if %ERRORLEVEL% equ 1 goto loop1

exit /b
::************************************************
::�I������
::************************************************
:END

	echo �I�����܂�
	timeout /t 1 /nobreak > nul

exit /b
::************************************************
::�����G���[�`�F�b�N�P(0�`9�̂P���̐���)
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
	::endlocal��set��1�s�Ŏg���ƁA���ϐ��������p����B

exit /b
::************************************************
::�����G���[�`�F�b�N�Q(+, -, *, /�̂ǂꂩ)
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
::���Z
::************************************************
:fADD

	setlocal
	set /a Wa=%1+%2
	endlocal & set Answer=%Wa%

exit /b
::************************************************
::���Z
::************************************************
:fSUB

	setlocal
	set /a Sa=%1-%2
	endlocal & set Answer=%Sa%

exit /b
::************************************************
::��Z
::************************************************
:fMULT

	setlocal
	set /a Seki=%1*%2
	endlocal & set Answer=%Seki%

exit /b
::************************************************
::���Z(�]����o��)
::************************************************
:fDIV

	setlocal
	set /a Shou=%1/%2
	set /a Amari=%1%%2
	if %Amari% equ 0 (
		endlocal & set Answer=%Shou%
	) else (
		endlocal & set Answer=%Shou%�]��%Amari%
	)

exit /b
::************************************************
