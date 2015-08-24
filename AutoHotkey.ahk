#SingleInstance Force
SetTitleMatchMode, 2
;DetectHiddenWindows, on

;******************Chrome
<#c::
IfWinExist ,Chrome
{
    ifWinActive
    {
        WinActivatebottom ,Chrome
    }
    else
    {
        WinActivate
    }
    return
}
else
{
    run chrome.exe
    return
}

return 

<#m::
IfWinExist , ahk_class TTOTAL_CMD
{
  ifWinActive
  {
    WinMinimize, ahk_class TTOTAL_CMD 
    WinActivatebottom ,ahk_class TTOTAL_CMD 
  }
  else
  {
    WinActivate
  }
  return
}
else
{
  run f:/totalcmd/TOTALCMD.EXE
  return
}

<#[::
run notepad c:/Documents and Settings/xwrj/My Documents/AutoHotkey.ahk
return

<#]::
run c:/Documents and Settings/xwrj/My Documents/AutoHotkey.ahk
return

;**************Notepad
<#o::
if WinExist("ahk_class Notepad")
    {
    ifWinActive
        {
	WinActivateBottom, ahk_class Notepad
    }
    else
    {
        WinActivate
    }
    return
}

<#+o::
run "notepad"
return

<#F12::
if WinExist("ahk_class TXGuiFoundation")
    {
    ifWinActive
        {
        ;WinActivateBottom, ahk_class TXGuiFoundation
        ;WinMaximize, ahk_class TXGuiFoundation
        WinMinimize, ahk_class TXGuiFoundation 
        }
    else
    {
        WinActivate
    }
    return
}
return

;********command line
#v::
If WinExist("ahk_class ConsoleWindowClass")
{
ifWinActive
WinActivatebottom , ahk_class ConsoleWindowClass
else
WinActivate
return
}
#+v::
run cmd.exe
return

;-----------------------------------------------------
#z::
IfWinExist ,ahk_class Emacs
{
ifWinActive
{
    ;WinMinimize, ahk_class Emacs
    WinActivatebottom ,ahk_class Emacs
}
else
WinActivate
return
}
else
	Run runemacs
return

;-----------------------------------------------------
<#x::
run explorer.exe C:\Documents and Settings\xwrj\Application Data\.emacs.d
return

$CapsLock::ESC
LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"


:://c:: 
Run http://www.iciba.com
return 

<#t::
if WinExist Windows 任务管理器 
WinActivate 
else 
Run taskmgr.exe 
return 

;-----------------------------------------------------
; <#5::
; myclip:=clipboard
; MsgBox clipboard now has the following contents:%clipboard%
; return
<#g::
myclip:=clipboard
;url:= %https://google.com/search?q=%%myclip%
; var2:="xxx"
; var1:="yyy"
; url:=var2 . var1  two ways of combination
; url = %var1%%var2%
;MsgBox, clipboard now has the following contents: %url%
;Run chrome.exe "https://google.com/search?q=" . myclip // unok
gurl := "https://google.com/search?q=" . myclip 
Run chrome.exe %gurl%
return

<#q:: !F4 ;退出
<#h::Send {Left}
<#j::Send {Down}
<#k::Send {Up}
<#l::Send {Right}
<#,::Send ^+{Left} 
<#.::Send ^+{Right} 
<#a::Send {Home}
<#e::Send {End}
<#n::Send ^{End}
<#p::Send ^{Home}
<#;::Send {PgUp}
<#'::Send {PgDn}
#Capslock::Send {Enter}

;选择一行 
>#space::
Send {Home}
Send +{End}
return

<#space::Send {Pause}
return

#?::Run calc.exe
return 

;-----------------------------------------------------
;#\::
;Send, {LWin down}
;Send, {LWin up}
;return
;#IfWinActive emacs
;Control::Capslock ; 把Control替换为Capslock
;Capslock::Control   ; 把Capslock替换为Control 
;-----------------------------------------------------
