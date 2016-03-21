::************************************************
:: SyncFile.bat
::************************************************
:: INPUT
::  %1 : 同期元ディレクトリの絶対パス
::  %2 : 同期先ディレクトリの絶対パス
::  %3 : ファイル検索のパターン（正規表現不可）
::
:: OUTPUT
::  %ErrorLevel%
::   0 : 正常終了
::   7 : パラメータ未入力エラー
::   8 : 同期元ディレクトリ存在チェックエラー
::   9 : 同期先ディレクトリ存在チェックエラー
::************************************************
@echo off

set ErrorLevel=0

::パラメータ必須入力チェック
IF "%1" EQU "" set ErrorLevel=7
IF "%2" EQU "" set ErrorLevel=7
IF "%3" EQU "" set ErrorLevel=7

IF %ErrorLevel% EQU 7 exit /b


::同期元
set SrcDir=%1

if not exist %SrcDir% (
	rem 同期元ディレクトリ存在チェックエラー
	set ErrorLevel=8
	exit /b
)

::同期先
set DestDir=%2

if not exist %DestDir% (
	rem 同期先ディレクトリ存在チェックエラー
	set ErrorLevel=9
	exit /b
)

::検索パターン
set FilePtrn=%3


::ファイル同期
robocopy %SrcDir% %DestDir% %FilePtrn% /LEV:1 /COPYALL /NP /R:3 /W:3


exit /b
::************************************************
