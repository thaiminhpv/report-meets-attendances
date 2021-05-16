#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Ctr+Shi+Alt+T : mo lenh, Window+/ : tat lenh
; Cua so phai 100% view, Paint phai o vi tri 7 (Bam Window+7 test)
; Phai save paint 1 lan truoc (Download), thu muc luu ko co anh
; De thanh bookmark: CTr+Shi+B



+!^t::
Loop, 50 {
	WinActivate, Chrome
	;copy png name -> x
	Loop, 4 {
	Sleep, 120
		Send, {Right}
	}
	Sleep, 120
	Send, {CtrlDown}c{CtrlUp}
	Sleep, 200
	x := clipboard
	Sleep, 200
	Loop, 4 {
	Sleep, 120
		Send, {Left}
	}
	Sleep, 200
	;Copy link room at sheet
	Send, {CtrlDown}c{CtrlUp}
	Sleep, 140
	Send, {CtrlDown}t{CtrlUp}
	Sleep, 200
	Send, {CtrlDown}v{CtrlUp}
	Sleep, 120
	Send, {Enter}
	Sleep, 5000
	;tat mic va camera va vao phong
	Click, 418, 597
	Sleep, 80
	Click, 494, 597
	Sleep, 80
	Click, 1000, 437
	Sleep, 4000
	;chup anh man hinh
	Send, {PrintScreen}
	IfWinExist, Untitled - Paint
		{
			MsgBox, Paint has already Exist
			break
		}
	Send, #7 ;paint
	Sleep, 1000
	Send, {CtrlDown}v{CtrlUp}
	Sleep, 300
	Send, {CtrlDown}s{CtrlUp}
	Sleep, 500
	Send, %x%
	Send, {Enter}
	WinActivate, paint
	Send, {AltDown}{F4}{AltUp}
	Sleep, 100
+!^u::
	;lay so hoc vien
	WinActivate, Chrome
	Sleep, 4000
	Click, 45, 90
	Sleep, 4000
;return
IfWinExist, Untitled - Paint
	{
			MsgBox, An error occur
			break
		}
	Send, {CtrlDown}c{CtrlUp}
	Sleep, 800
	; thoat ra va dien so hoc vien vao bang
	Send, {CtrlDown}w{CtrlUp}
	Sleep, 800
	Send, {Right}
	Sleep, 300
	Send, {Right}
	diem := clipboard - 2
	if diem is not integer 
	{
			MsgBox, An error occur
			break
	}
	Send, %diem%
	Sleep, 300
	Send, {Enter}
	Sleep, 300
	Send, {Left}
	Sleep, 300
	Send, {Left}
}
return

#/::
MsgBox, Turned Off
reload
return
