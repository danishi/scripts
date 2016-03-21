::************************************************
::タイピングゲーム
::************************************************
::Reference
::************************************************
::・現在時刻を取り出す
::
::	set T=%TIME%		時分秒	HH:MM:SS:FF
::	set H=%TIME:~0,-9%	時	HH
::	set M=%TIME:~3,-6%	分	MM
::	set S=%TIME:~6,-3%	秒	SS
::
::・サブルーチン内でsetlocalすると、変数のスコープがそのサブルーチン内に限られてしまう。
::・setlocal後に変更した変数はendlocalまたはexit後に元に戻る。
::************************************************
::メインルーチン
::************************************************
:CONTROL

	@call :INIT
	call :MAIN
	call :END

exit /b
::************************************************
::初期処理
::************************************************
:INIT

	@echo off
	title %~n0%~x0

	::制限時間＆問題数設定
	set Q=10
	set Rimit=1

	::開始アナウンス
	echo 制限時間は%Rimit%分、
	echo 問題数は%Q%問です。
	echo.

	set /p Buf=よーい < nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	echo.
	echo スタート
	timeout /t 1 /nobreak > nul

	::開始時刻の取得
	set StartTime=%TIME%

exit /b
::************************************************
::主処理
::************************************************
:MAIN

	set Counter=1

	:gameStart

	if %Counter% gtr %Q% goto :EOF

	call :fGETQUESTION

	:restart

	cls

	set Answer=?

	echo %Counter%問目
	echo.
	echo %Question%

	::答えの入力
	set /p Answer=

	if %Question% equ %Answer% (
		echo 正解
		timeout /t 1 /nobreak > nul
		set /a Counter+=1
		goto gameStart
	) else (
		echo 不正解
		timeout /t 1 /nobreak > nul
		goto restart
	)

exit /b
::************************************************
::終了処理
::************************************************
:END

	::終了時刻の取得
	set EndTime=%TIME%

	cls
	set /p Buf=結果は < nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	set /p Buf=. <nul
	timeout /t 1 /nobreak > nul
	echo.

	call :fRIMITTIME

	if %TimeOver% equ 1 (
		echo タイムオーバー
	) else (
		echo ゲームクリア
	)

	echo キー押下でゲーム終了
	pause > nul	

exit /b
::************************************************
::リストから文字列選択
::************************************************
:fGETQUESTION

	setlocal

	::乱数生成
	set /a Num=%RANDOM%*8/32768

	if %Num% equ 0 set Str=3.14159265359
	if %Num% equ 1 set Str=東京特許許可局
	if %Num% equ 2 set Str=computer
	if %Num% equ 3 set Str=おはようございます。
	if %Num% equ 4 set Str=天上天下唯我独尊
	if %Num% equ 5 set Str=CentralProcessingUnit
	if %Num% equ 6 set サーターアンダギー
	if %Num% equ 7 set MONGOL800

	endlocal & set Question=%Str%

exit /b
::************************************************
::時間オーバー判定
::************************************************
:fRIMITTIME

	::フラグオフ
	set TimeOver=0

	::分、秒取り出し
	set SM=%StartTime:~3,-6%
	set SS=%StartTime:~6,-3%
	set EM=%EndTime:~3,-6%
	set ES=%EndTime:~6,-3%

	::判定
	set /a PlayMinute=EM-SM

	if %PlayMinute% geq %Rimit% (
		if %ES% geq %SS% (
			set TimeOver=1
		)
	)
	
exit /b
::************************************************
