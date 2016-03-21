::************************************************
:: SyncFile.bat
::************************************************
:: INPUT
::  %1 : �������f�B���N�g���̐�΃p�X
::  %2 : ������f�B���N�g���̐�΃p�X
::  %3 : �t�@�C�������̃p�^�[���i���K�\���s�j
::
:: OUTPUT
::  %ErrorLevel%
::   0 : ����I��
::   7 : �p�����[�^�����̓G���[
::   8 : �������f�B���N�g�����݃`�F�b�N�G���[
::   9 : ������f�B���N�g�����݃`�F�b�N�G���[
::************************************************
@echo off

set ErrorLevel=0

::�p�����[�^�K�{���̓`�F�b�N
IF "%1" EQU "" set ErrorLevel=7
IF "%2" EQU "" set ErrorLevel=7
IF "%3" EQU "" set ErrorLevel=7

IF %ErrorLevel% EQU 7 exit /b


::������
set SrcDir=%1

if not exist %SrcDir% (
	rem �������f�B���N�g�����݃`�F�b�N�G���[
	set ErrorLevel=8
	exit /b
)

::������
set DestDir=%2

if not exist %DestDir% (
	rem ������f�B���N�g�����݃`�F�b�N�G���[
	set ErrorLevel=9
	exit /b
)

::�����p�^�[��
set FilePtrn=%3


::�t�@�C������
robocopy %SrcDir% %DestDir% %FilePtrn% /LEV:1 /COPYALL /NP /R:3 /W:3


exit /b
::************************************************
