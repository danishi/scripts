'***************************************************************
'Writer
'***************************************************************
Option Explicit

WScript.Echo "witer.vbs start!"
WScript.Sleep(1000)	'1000�~���b��~

Dim objParm
Dim objFso
Dim objFile
Dim boolFlag
boolFlag = False
Dim intLine
intLine = 1
Dim strText
Set objParm = WScript.Arguments

'�t�@�C������̂��߂̃I�u�W�F�N�g(FSO)�����
Set objFso = WScript.CreateObject("Scripting.FileSystemObject")

'FSO��OpenTextFile���\�b�h�Ńt�@�C�����J���ăt�@�C���I�u�W�F�N�g�����
Set objFile = objFso.OpenTextFile("..\Data\" & objParm(0), 2)

While boolFlag = False

	strText = InputBox(intLine & "�s�ځF�L�����Z�������ŏI��", intLine &"�s�ړ���", vbCrLf)

	If strText = "" Then
		boolFlag = True
	Else
		'�t�@�C���I�u�W�F�N�g��WriteLine���\�b�h�ŏ�������
		objFile.WriteLine strText
		intLine = intLine + 1
	End If

Wend

WScript.Echo "writer.vbs end"
