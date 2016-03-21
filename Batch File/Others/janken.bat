::------------------------------------------------
::ジャンケンゲーム
::------------------------------------------------
::Reference
::
::	・RANDOM環境変数は、0～32767の範囲で乱数を発生させる
::	
::		(例)乱数0～10を発生させる
::			set /a R=%RANDOM%*11/32768
::
::	・インクリメント
::		set /a num+=1
::	・デクリメント
::		set /a num-=1
::
::	・指定秒数待機
::
::		・ネットワーク関連のコマンドを利用する方法
::			ping 1.0.0.0 -w 1000 -n 1 > nul
::
::		・timeoutコマンドを利用する方法
::			timeout /t [秒数] /nobreak > nul
::
::	・改行せずに文字を入力
::		set /p [適当な変数]=[表示したい文字列] < nul
::
::		nulデバイスから入力を行うことで、本来入力待ちで表示する文字列のみを標準出力に表示する
::
::初期処理----------------------------------------
@echo off
setlocal

::ウインドウのタイトルを変更
title %~n0%~x0

::変数定義
set /a CountGame=0
set /a CountWin=0
set /a CountLose=0
set /a Player=0
set /a Cpu=0

::定数定義
set /a GU=1
set /a CHOKI=2
set /a PA=3

::入力処理----------------------------------------
:begin

::画面クリア
cls

echo.
echo ジャンケン...
echo.

set /p Player=1:グー 2:チョキ 3:パー 9:ゲームを終了

if %Player% equ %GU% (

	rem グー

) else (

	if %Player% equ %CHOKI% (

		rem チョキ

	) else (

		if %Player% equ %PA% (

			rem パー

		) else (

				if %Player% equ 9 (

					goto :end

			) else (
					echo.
					echo 入力が誤り
					rem 1秒待機
					timeout /t 1 /nobreak > nul
					goto :begin
			)
		)
	)
)

echo.
echo ポン！
echo.

::勝敗判定----------------------------------------

::ゲームカウント
set /a CountGame+=1

::相手の手の乱数セット(1～3)
set /a Cpu=%RANDOM%*3/32768+1

if %Player% equ %GU% (

	set Player=グー
	if %Cpu% equ %GU% (
		set Cpu=グー
		goto :あいこ
	)
	if %Cpu% equ %CHOKI% (
		set Cpu=チョキ
		goto :勝利
	)
	if %Cpu% equ %PA% (
		set Cpu=パー
		goto :敗北
	)
)
if %Player% equ %CHOKI% (

	set Player=チョキ
	if %Cpu% equ %GU% (
		set Cpu=グー
		goto :敗北
	)
	if %Cpu% equ %CHOKI% (
		set Cpu=チョキ
		goto :あいこ
	)
	if %Cpu% equ %PA% (
		set Cpu=パー
		goto :勝利
	)
)
if %Player% equ %PA% (

	set Player=パー
	if %Cpu% equ %GU% (
		set Cpu=グー
		goto :勝利
	)
	if %Cpu% equ %CHOKI% (
		set Cpu=チョキ
		goto :敗北
	)
	if %Cpu% equ %PA% (
		set Cpu=パー
		goto :あいこ
	)
)

::戦後処理----------------------------------------

:勝利
set /a CountWin+=1

echo あなた：%Player%
echo ＣＰＵ；%Cpu%
echo.
echo あなたの勝ちです
echo.
echo キー押下で次のゲーム
pause > nul
goto :begin

:敗北
set /a CountLose+=1

echo あなた：%Player%
echo ＣＰＵ；%Cpu%
echo.
echo あなたの負けです
echo.
echo キー押下で次のゲーム
pause > nul
goto :begin

:あいこ

echo あなた：%Player%
echo ＣＰＵ；%Cpu%
echo.
echo あいこです
echo.
echo キー押下で次のゲーム
pause > nul
goto :begin

::終了処理----------------------------------------

:end

cls
set /p Buf=結果は < nul
timeout /t 1 /nobreak > nul
set /p Buf=. < nul
timeout /t 1 /nobreak > nul
set /p Buf=. < nul
timeout /t 1 /nobreak > nul

cls
echo.
echo ----戦績発表----
echo  総試合数：%CountGame%
echo  勝利数　：%CountWin%
echo  敗北数　：%CountLose%
set /a CountGame-=CountWin+CountLose
echo  引き分け：%CountGame%
echo ----------------
echo.
echo 何かキーを押すとゲームを終了します
pause > nul
exit /b
