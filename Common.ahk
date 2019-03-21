#Include d:/portable/AHK/func.ahk
#Include d:/portable/AHK/rj.ahk

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

; ;; pdf
; <#+p::
; ActiveWinClass("classFoxitReader")
; return


;**************Notepad
<#o::
ActiveWinClass("Notepad", "Notepad")
return

<#+o::
run "notepad"
return

<#f::
ActiveWinClass("EVERYTHING", "D:\portable\Everything\Everything.exe")
return

<#+f::
ActiveWinClass("EVERYTHING", "D:\portable\Everything\Everything.exe", "Clipboard")
return

<#+s::
run regedit.exe
return

<#F12::
ActiveWinClass("TXGuiFoundation")
return

<#F11::
if WinExist("ahk_class ahk_class #32770")
    {
    ifWinActive
        {
        WinMinimize, ahk_class ahk_class #32770
        }
    else
    {
        WinActivate
    }
    return
}
return

#v::
ActiveWinClass("VirtualConsoleClass", "D:\portable\cmder\vendor\conemu-maximus5\ConEmu64.exe")
; ActiveWinClass("ConsoleWindowClass","cmd.exe")
return

#x::
ActiveWinClass("mintty", "D:\portable\.babun\cygwin\bin\mintty.exe")
return

#+c::
ActiveWinClass("Chrome_WidgetWin_1", "D:\portable\TOOL\Chromium\chrome.exe")
;ActiveWinClass("Chrome_WidgetWin_1", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return

#m::
IfWinExist ,Microsoft Visual Studio
{
ifWinActive
{
   WinActivatebottom Microsoft Visual Studio
}
else
   WinActivate
}
return
;-----------------------------------------------------
#z::
ActiveWinClass("Emacs", "D:\portable\emacs\bin\runemacs.exe")
; invoke #z without return would disable win7's drag and drop function
; it's very important to return
return

#+z::
ActiveWinClass("cygwin/x X rl")
; invoke #z without return would disable win7's drag and drop function
; it's very important to return

return
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

;$CapsLock::ESC
;LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

:://b:: 
  Run http://www.baidu.com
return 

<#t::
if WinExist Windows 任务
WinActivate 
else 
Run taskmgr.exe 
return 

<#+t::
Run D:\portable\ProcessExplorer\procexp.exe
return

<#q:: !F4 ;退出
<#h::Send {Left}
<#j::Send {Down}
<#k::Send {Up}
<#;::Send {Right}
<#,::Send ^+{Left} 
<#.::Send ^+{Right} 
<#a::Send {Home}
<#e::Send {End}
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
ActiveWinClass("SUMATRA_PDF_FRAME", "D:\portable\SumatraPDF\SumatraPDF.exe")
return

; <#n::
; ActiveWinClass("TNavicatMainForm", "C:\Program Files\PremiumSoft\Navicat Premium\navicat.exe")
; return


<#+w::
Run shell:RecycleBinFolder
return

<#+p::
Run shutdown -s -t 0
return

; <#+w::
; ; run network explorer
; Run explorer.exe ::{208D2C60-3AEA-1069-A2D7-08002B30309D}
; return

#g::
MyClip := ClipboardAll
;clipboard =
Send, ^c
ClipWait, 2
if ErrorLevel  ; ClipWait timed out.
    return
else{
    Clipboard = %Clipboard%
    If RegExMatch(Clipboard, "^(https?://|www\.)[a-zA-Z0-9_\-\.]+\.[a-zA-Z0-9_\-]{2,}[:\d]{0,5}(/\S*)?$"){
        Run %Clipboard%
    }
    Else{
        Run http://www.google.com/#hl=en&q=%Clipboard%
    }
}
Clipboard := MyClip
return

#c::
IfWinNotExist, ahk_class Chrome_WidgetWin_1
    Run, chrome.exe
GroupAdd, kjexplorers5, ahk_class Chrome_WidgetWin_1 ;You have to make a new group for each application, don't use the same one for all of them!
if WinActive("ahk_exe chrome.exe")
    GroupActivate, kjexplorers5, r
else
    WinActivate ahk_class Chrome_WidgetWin_1 ;you have to use WinActivatebottom if you didn't create a window group.
Return

#n::
; msgbox "xx"
cliptext = %clipboard%
Send ^{t}
SendInput  %cliptext% {Enter}
return


; #|::
; Send {TAB}
; SendInput  linzhengyuan
; Send {TAB}
; SendInput  password
; Send {Enter}
; return