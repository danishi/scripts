'***************************************************************
'Writer
'***************************************************************
Option Explicit

WScript.Echo "witer.vbs start!"
WScript.Sleep(1000)	'1000ミリ秒停止

Dim objParm
Dim objFso
Dim objFile
Dim boolFlag
boolFlag = False
Dim intLine
intLine = 1
Dim strText
Set objParm = WScript.Arguments

'ファイル操作のためのオブジェクト(FSO)を作る
Set objFso = WScript.CreateObject("Scripting.FileSystemObject")

'FSOのOpenTextFileメソッドでファイルを開いてファイルオブジェクトを作る
Set objFile = objFso.OpenTextFile("..\Data\" & objParm(0), 2)

While boolFlag = False

	strText = InputBox(intLine & "行目：キャンセル押下で終了", intLine &"行目入力", vbCrLf)

	If strText = "" Then
		boolFlag = True
	Else
		'ファイルオブジェクトのWriteLineメソッドで書き込む
		objFile.WriteLine strText
		intLine = intLine + 1
	End If

Wend

WScript.Echo "writer.vbs end"
