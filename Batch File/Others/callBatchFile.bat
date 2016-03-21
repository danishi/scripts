::-----------------------------------------------:
::他バッチファイルの呼び出し
::-----------------------------------------------:
@echo off

setlocal

:loop

set /p PgmName=呼び出すバッチファイルの名前を入力(カレントディレクトリ)

::ワイルドカード
::* 0文字以上の任意の文字列
::? 空文字、または1文字の任意の文字

if exist %PgmName%* (

	call %PgmName%
	echo callBachFile.batに戻ってきた

) else (

	echo そんなファイルはない
	goto :loop

)

pause

exit /b
