::-----------------------------------------------:
::�t�@�C���̃R�s�[���s��
::-----------------------------------------------:
@echo off

setlocal

:first

set /p fileName=�J�����g�f�B���N�g�����̃t�@�C��������͂��Ă�������(�g���q���܂�)

if exist %fileName%* (

	goto :second

) else (

	echo ����ȃt�@�C���͂Ȃ�
	goto :first

)

:second

copy %fileName% copy_%fileName%

echo �t�@�C�����R�s�[���܂����B
echo.
echo �I������ɂ͉����L�[�������Ă�������...
pause > nul

exit /b
