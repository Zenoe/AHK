﻿#Include c:/portable/AHK/func.ahk
#Include c:/portable/AHK/rj.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; kill shift+space
<+space::
return

#SingleInstance Force
SetTitleMatchMode, 2
;DetectHiddenWindows, on


;*************************************
cos_mousedrag_treshold := 20 ; pixels
#IfWinNotActive ahk_class ConsoleWindowClass

; ~mbutton::
;   WinGetClass cos_class, A
;   if (cos_class == "Emacs")
;     SendInput ^y
;   else
;     SendInput ^v
;   return
  
#IfWinNotActive


;; clipx
^mbutton::
  sendinput ^+{insert}
  return

#i::Run, "C:\Windows\system32\rundll32.exe" sysdm.cpl`,EditEnvironmentVariables
return
; #+i::Run, "C:\WINDOWS\system32\rundll32.exe" shell32.dll,Control_RunDLL sysdm.cpl,,3  ; 直接在“运行”执行是OK的
#+i::Run "C:\WINDOWS\system32\rundll32.exe" shell32.dll`,Control_RunDLL sysdm.cpl
return

;;zeal
<#+z::
ActiveWinClass("Qt5QWindowIcon", "C:\portable\zeal-portable-0.6.1-windows-x86\zeal.exe")
return


<#v::
ActiveWinClass("Qt5152QWindowIcon", "C:\portable\nvim-win64\bin\nvim-qt.exe")
return

<#a::
ActiveWinClass("Emacs", "C:\portable\emacs\bin\runemacs.exe")
return

<#z::
ActiveWinClass("cygwin/x X rl", "", "", "Doom Emacs")
return

;**************Notepad
<#o::
ActiveWinClass("Notepad", "Notepad")
return

<#+o::
run "notepad"
return

<#f::
ActiveWinClass("EVERYTHING", "C:\Program Files\Everything\Everything.exe")
return

<#+f::
ActiveWinClass("EVERYTHING", "C:\Program Files\Everything\Everything.exe", "Clipboard")
return

<#+s::
run regedit.exe
return

#n::
ActiveWinClass("VirtualConsoleClass", "C:\portable\cmder\Cmder.exe")
return

#+c::
ActiveWinClass("Chrome_WidgetWin_1", "C:\portable\TOOL\Chromium\chrome.exe")
;ActiveWinClass("Chrome_WidgetWin_1", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return

; #m::
; IfWinExist ,Microsoft Visual Studio
; {
; ifWinActive
; {
;    WinActivatebottom Microsoft Visual Studio
; }
; else
;    WinActivate
; }
; return
;-----------------------------------------------------

;#z::
;ActiveGrpWinClass("cygwin/x X rl", "kjexplorers9", "XWin.exe")
;return
;#z::
;ActiveWinClass("cygwin/x X rl")
;return

; if ActiveWinClass("Emacs") = false
;   {
;     IfWinExist , ahk_class ahk_class mintty
;     {
;       WinActivate

;     }
;     else
;     {
;       ActiveWinClass("mintty", "D:\portable\.babun\cygwin\bin\mintty.exe")
;     }
;     ; WinWait, ahk_class mintty ;Waits until the specified window exists.
;       ;Waits until the specified window is active
;       WinWaitActive, ahk_class mintty 
;       send, emacs-w32 & {enter}
;       WinMinimize, ahk_class mintty
;   }
; return

;CapsLock::ESC
LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

RShift & CapsLock::SwitchIME(cnCode)

CapsLock::
send {Escape}
; A: for active window
WinGetTitle, title, A
If title contains "nvim"
{
    SwitchIME(engCode)
}
return

<#t::
if WinExist Windows 任务
WinActivate 
else 
Run taskmgr.exe 
return 

<#+t::
Run C:\portable\ProcessExplorer\procexp.exe
return

<#q:: !F4 ;退出
<#h::Send {Left}
<#j::Send {Down}
<#k::Send {Up}
<#;::Send {Right}
<#,::Send ^+{Left} 
<#.::Send ^+{Right} 
; <#a::Send {Home}
; <#+P::Send ^{Home}
; #Capslock::Send {Enter}

; ;选择一行 
; <#space::
; Send {Home}
; Send +{End}
; return

#?::Run calc.exe
return 

<#space::
if WinExist("ahk_exe wps.exe")
    {
    ifWinActive
        {
        WinMinimize, ahk_exe wps.exe
        }
    else
    {
        WinActivate
    }
    return
}
return


<#F11::
ActiveWinClass("SUMATRA_PDF_FRAME", "C:\portable\SumatraPDF\SumatraPDF.exe")
return

; <#n::
; ActiveWinClass("TNavicatMainForm", "C:\Program Files\PremiumSoft\Navicat Premium\navicat.exe")
; return


<#+w::
Run shell:RecycleBinFolder
return

;<#+p::
;Run shutdown -s -t 0
;return

; <#+w::
; ; run network explorer
; Run explorer.exe ::{208D2C60-3AEA-1069-A2D7-08002B30309D}
; return

#+e::
MyClip := ClipboardAll
;clipboard =
Send, ^c
ClipWait, 2
if ErrorLevel  ; ClipWait timed out.
    return
else{
    Clipboard = %Clipboard%
    Run http://www.baidu.com/s?wd=%Clipboard%
}
Clipboard := MyClip
return

#b::
MyClip := ClipboardAll
;clipboard =
Send, ^c
ClipWait, 2
if ErrorLevel  ; ClipWait timed out.
    return
else{
    Clipboard = %Clipboard%
    If RegExMatch(Clipboard, "^(https?://|www\.)[a-zA-Z0-9_\-\.]+\.[a-zA-Z0-9_\-]{1,}[:\d]{0,5}(/\S*)?$"){
        Run %Clipboard%
    }
    Else{
        Run http://www.baidu.com/s?wd=%Clipboard%
    }
}
Clipboard := MyClip
return

#g::
MyClip := ClipboardAll
;clipboard =
Send, ^c
ClipWait, 2
if ErrorLevel  ; ClipWait timed out.
    return
else{
    Clipboard = %Clipboard%
    If RegExMatch(Clipboard, "^(https?://|www\.)[a-zA-Z0-9_\-\.]+\.[a-zA-Z0-9_\-]{1,}[:\d]{0,5}(/\S*)?$"){
        Run %Clipboard%
    }
    Else{
        Run https://www.google.com.hk/search?hl=en&newwindow=1&safe=strict&tbo=d&site=&source=hp&q=%Clipboard%&btnG=Search
    }
}
Clipboard := MyClip
return

; #n::
; ActiveGrpWinClass("Chrome_WidgetWin_1", "kjexplorers4", "C:\Users\ab\AppData\Local\Programs\Microsoft VS Code\Code.exe")
; return

#c::
ActiveGrpWinClass("Chrome_WidgetWin_1", "kjexplorers5", "chrome.exe")
return

#s::
ActiveGrpWinClass("XLMAIN", "kjexplorers6", "EXCEL.EXE")
return

; #w::
; return

#x::
ActiveWinClass("mintty", "C:\Apps\cygwin\bin\mintty.exe", "0", "")
return

#+x::
ActiveGrpWinClass("mintty", "kjexplorers8", "mintty.exe")
return

~LButton & MButton::
;
Send ^{End}
;MsgBox You Pressed the Middle Button on your mouse.
return

~LButton & RButton::
Send ^w
return

;The tilde ~ prefix makes a hotkey keep its original function
; ~*q::
; 	SendEvent, {click}
; 	return

#+v::
cliptext = %clipboard%
SendInput  %cliptext% {Enter}
return

