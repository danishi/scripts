::-----------------------------------------------:
::ファイルのコピーを行う
::-----------------------------------------------:
@echo off

setlocal

:first

set /p fileName=カレントディレクトリ内のファイル名を入力してください(拡張子も含め)

if exist %fileName%* (

	goto :second

) else (

	echo そんなファイルはない
	goto :first

)

:second

copy %fileName% copy_%fileName%

echo ファイルをコピーしました。
echo.
echo 終了するには何かキーを押してください...
pause > nul

exit /b
