::-----------------------------------------------:
::���o�b�`�t�@�C���̌Ăяo��
::-----------------------------------------------:
@echo off

setlocal

:loop

set /p PgmName=�Ăяo���o�b�`�t�@�C���̖��O�����(�J�����g�f�B���N�g��)

::���C���h�J�[�h
::* 0�����ȏ�̔C�ӂ̕�����
::? �󕶎��A�܂���1�����̔C�ӂ̕���

if exist %PgmName%* (

	call %PgmName%
	echo callBachFile.bat�ɖ߂��Ă���

) else (

	echo ����ȃt�@�C���͂Ȃ�
	goto :loop

)

pause

exit /b
