::------------------------------------------------
::�W�����P���Q�[��
::------------------------------------------------
::Reference
::
::	�ERANDOM���ϐ��́A0�`32767�͈̔͂ŗ����𔭐�������
::	
::		(��)����0�`10�𔭐�������
::			set /a R=%RANDOM%*11/32768
::
::	�E�C���N�������g
::		set /a num+=1
::	�E�f�N�������g
::		set /a num-=1
::
::	�E�w��b���ҋ@
::
::		�E�l�b�g���[�N�֘A�̃R�}���h�𗘗p������@
::			ping 1.0.0.0 -w 1000 -n 1 > nul
::
::		�Etimeout�R�}���h�𗘗p������@
::			timeout /t [�b��] /nobreak > nul
::
::	�E���s�����ɕ��������
::		set /p [�K���ȕϐ�]=[�\��������������] < nul
::
::		nul�f�o�C�X������͂��s�����ƂŁA�{�����͑҂��ŕ\�����镶����݂̂�W���o�͂ɕ\������
::
::��������----------------------------------------
@echo off
setlocal

::�E�C���h�E�̃^�C�g����ύX
title %~n0%~x0

::�ϐ���`
set /a CountGame=0
set /a CountWin=0
set /a CountLose=0
set /a Player=0
set /a Cpu=0

::�萔��`
set /a GU=1
set /a CHOKI=2
set /a PA=3

::���͏���----------------------------------------
:begin

::��ʃN���A
cls

echo.
echo �W�����P��...
echo.

set /p Player=1:�O�[ 2:�`���L 3:�p�[ 9:�Q�[�����I��

if %Player% equ %GU% (

	rem �O�[

) else (

	if %Player% equ %CHOKI% (

		rem �`���L

	) else (

		if %Player% equ %PA% (

			rem �p�[

		) else (

				if %Player% equ 9 (

					goto :end

			) else (
					echo.
					echo ���͂����
					rem 1�b�ҋ@
					timeout /t 1 /nobreak > nul
					goto :begin
			)
		)
	)
)

echo.
echo �|���I
echo.

::���s����----------------------------------------

::�Q�[���J�E���g
set /a CountGame+=1

::����̎�̗����Z�b�g(1�`3)
set /a Cpu=%RANDOM%*3/32768+1

if %Player% equ %GU% (

	set Player=�O�[
	if %Cpu% equ %GU% (
		set Cpu=�O�[
		goto :������
	)
	if %Cpu% equ %CHOKI% (
		set Cpu=�`���L
		goto :����
	)
	if %Cpu% equ %PA% (
		set Cpu=�p�[
		goto :�s�k
	)
)
if %Player% equ %CHOKI% (

	set Player=�`���L
	if %Cpu% equ %GU% (
		set Cpu=�O�[
		goto :�s�k
	)
	if %Cpu% equ %CHOKI% (
		set Cpu=�`���L
		goto :������
	)
	if %Cpu% equ %PA% (
		set Cpu=�p�[
		goto :����
	)
)
if %Player% equ %PA% (

	set Player=�p�[
	if %Cpu% equ %GU% (
		set Cpu=�O�[
		goto :����
	)
	if %Cpu% equ %CHOKI% (
		set Cpu=�`���L
		goto :�s�k
	)
	if %Cpu% equ %PA% (
		set Cpu=�p�[
		goto :������
	)
)

::��㏈��----------------------------------------

:����
set /a CountWin+=1

echo ���Ȃ��F%Player%
echo �b�o�t�G%Cpu%
echo.
echo ���Ȃ��̏����ł�
echo.
echo �L�[�����Ŏ��̃Q�[��
pause > nul
goto :begin

:�s�k
set /a CountLose+=1

echo ���Ȃ��F%Player%
echo �b�o�t�G%Cpu%
echo.
echo ���Ȃ��̕����ł�
echo.
echo �L�[�����Ŏ��̃Q�[��
pause > nul
goto :begin

:������

echo ���Ȃ��F%Player%
echo �b�o�t�G%Cpu%
echo.
echo �������ł�
echo.
echo �L�[�����Ŏ��̃Q�[��
pause > nul
goto :begin

::�I������----------------------------------------

:end

cls
set /p Buf=���ʂ� < nul
timeout /t 1 /nobreak > nul
set /p Buf=. < nul
timeout /t 1 /nobreak > nul
set /p Buf=. < nul
timeout /t 1 /nobreak > nul

cls
echo.
echo ----��є��\----
echo  ���������F%CountGame%
echo  �������@�F%CountWin%
echo  �s�k���@�F%CountLose%
set /a CountGame-=CountWin+CountLose
echo  ���������F%CountGame%
echo ----------------
echo.
echo �����L�[�������ƃQ�[�����I�����܂�
pause > nul
exit /b
