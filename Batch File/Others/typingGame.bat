::************************************************
::�^�C�s���O�Q�[��
::************************************************
::Reference
::************************************************
::�E���ݎ��������o��
::
::	set T=%TIME%		�����b	HH:MM:SS:FF
::	set H=%TIME:~0,-9%	��	HH
::	set M=%TIME:~3,-6%	��	MM
::	set S=%TIME:~6,-3%	�b	SS
::
::�E�T�u���[�`������setlocal����ƁA�ϐ��̃X�R�[�v�����̃T�u���[�`�����Ɍ����Ă��܂��B
::�Esetlocal��ɕύX�����ϐ���endlocal�܂���exit��Ɍ��ɖ߂�B
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

	::�������ԁ���萔�ݒ�
	set Q=10
	set Rimit=1

	::�J�n�A�i�E���X
	echo �������Ԃ�%Rimit%���A
	echo ��萔��%Q%��ł��B
	echo.

	set /p Buf=��[�� < nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	echo.
	echo �X�^�[�g
	timeout /t 1 /nobreak > nul

	::�J�n�����̎擾
	set StartTime=%TIME%

exit /b
::************************************************
::�又��
::************************************************
:MAIN

	set Counter=1

	:gameStart

	if %Counter% gtr %Q% goto :EOF

	call :fGETQUESTION

	:restart

	cls

	set Answer=?

	echo %Counter%���
	echo.
	echo %Question%

	::�����̓���
	set /p Answer=

	if %Question% equ %Answer% (
		echo ����
		timeout /t 1 /nobreak > nul
		set /a Counter+=1
		goto gameStart
	) else (
		echo �s����
		timeout /t 1 /nobreak > nul
		goto restart
	)

exit /b
::************************************************
::�I������
::************************************************
:END

	::�I�������̎擾
	set EndTime=%TIME%

	cls
	set /p Buf=���ʂ� < nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	echo.

	call :fRIMITTIME

	if %TimeOver% equ 1 (
		echo �^�C���I�[�o�[
	) else (
		echo �Q�[���N���A
	)

	echo �L�[�����ŃQ�[���I��
	pause > nul	

exit /b
::************************************************
::���X�g���當����I��
::************************************************
:fGETQUESTION

	setlocal

	::��������
	set /a Num=%RANDOM%*8/32768

	if %Num% equ 0 set Str=3.14159265359
	if %Num% equ 1 set Str=������������
	if %Num% equ 2 set Str=computer
	if %Num% equ 3 set Str=���͂悤�������܂��B
	if %Num% equ 4 set Str=�V��V���B��Ƒ�
	if %Num% equ 5 set Str=CentralProcessingUnit
	if %Num% equ 6 set �T�[�^�[�A���_�M�[
	if %Num% equ 7 set MONGOL800

	endlocal & set Question=%Str%

exit /b
::************************************************
::���ԃI�[�o�[����
::************************************************
:fRIMITTIME

	::�t���O�I�t
	set TimeOver=0

	::���A�b���o��
	set SM=%StartTime:~3,-6%
	set SS=%StartTime:~6,-3%
	set EM=%EndTime:~3,-6%
	set ES=%EndTime:~6,-3%

	::����
	set /a PlayMinute=EM-SM

	if %PlayMinute% geq %Rimit% (
		if %ES% geq %SS% (
			set TimeOver=1
		)
	)
	
exit /b
::************************************************
