::------------------------------------------------
::�����T�u���[�`���̎g����
::------------------------------------------------
::call�͑��o�b�`�t�@�C���ȊO�ɁA�����T�u���[�`���̌Ăяo���ɂ��g�����Ƃ��ł���
::------------------------------------------------
:CONTROL

@echo off
title %~n0%~x0
setlocal

echo INIT��
call :INIT
echo.

echo MAIN��
call :MAIN
echo.

echo END��
call :END
echo.

echo �L�[�����ŏI��
pause > nul

::goto :eof�Ńv���O�����̖����ɔ��
goto :eof

::------------------------------------------------
:INIT

	set Current=��������
	set /a Counter+=1
	echo %Current% %Counter%

::exit /b�œ����T�u���[�`���̏I�[���L�q����
exit /b
::------------------------------------------------
:MAIN

	set Current=�又��
	set /a Counter+=1
	echo %Current% %Counter%

exit /b
::------------------------------------------------
:END

	set Current=�I������
	set /a Counter+=1
	echo %Current% %Counter%

exit /b
::------------------------------------------------
