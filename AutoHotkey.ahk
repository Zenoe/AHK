#SingleInstance Force

SetTitleMatchMode, 2
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
IfWinExist , Total Commander 8.0
{
  ifWinActive
  {
    WinActivatebottom ,Total Commander
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

;********command line
#v::
IfWinExist ,cmd.exe
{
ifWinActive
WinActivatebottom ,cmd.exe
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
WinActivatebottom ,ahk_class Emacs
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
<#q:: !F4 ;退出
<#g::Run https://guge.io
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
>#a::Send {PgUp}
>#e::Send {PgDn}
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
