::************************************************
::howToArray.bat
::************************************************
:: enabledelayedexpansion �I�v�V�����ƕϐ���
:: �G�N�X�N�����[�V�����ň͂ނ�
:: �x�����ϐ���������邱�Ƃ��ł���
::
:: %�A�N�Z�X�͍\����͎��Ɋ��ϐ���W�J
:: !�A�N�Z�X�͎��s���O�Ɋ��ϐ���W�J
::************************************************
@echo off
title %~n0%~x0

setlocal enabledelayedexpansion

::�z���`
for /l %%i in (0, 1, 9) do (

	set ary[%%i]=%%i

)

::for���g�����v�f�̎Q��
for /l %%i in (0, 1, 9) do (

	echo ary[%%i} = !ary[%%i]!

)

::�P�̂ł̗v�f�̎Q��
echo.
echo ary[0] = %ary[0]%
echo ary[1] = %ary[1]%
echo ary[2] = %ary[2]%

endlocal

pause > nul

exit /b
::************************************************
