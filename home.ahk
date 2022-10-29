SetTitleMatchMode, 2
#Include C:\dotfiles\AHK\Common.ahk

#Include c:/dotfiles/AHK/func.ahk

#IfWinActive ahk_class TscShellContainerClass
  Capslock::           ; (couldn't make Ctrl(+Shift)+Caps Lock work for some reason
    ; Need a short sleep here for focus to restore properly.
    Sleep 50
    WinMinimize A    ; need A to specify Active window
    ;MsgBox, Received Remote Desktop minimize hotkey    ; uncomment for debugging
  return
#IfWinActive

^Capslock::
ActiveWinClass("TscShellContainerClass", "")
return

; #h::
;    KeyWait, LWin
;    browser="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;    Clipboard =
;    SendInput, ^c
;    ClipWait, 2
;    If !(ErrorLevel) {
;        Clipboard = %Clipboard%
;        If Clipboard Contains www.,http://,.se,.com,.net,.org,.cz,.nu,.co.uk,
;          Run, %browser% %Clipboard%
;        Else  { 
;          Clipboard := RegExReplace(Clipboard, "\r?\n"," ")
;          StringReplace, Clipboard, Clipboard, `%, `%25, All ; This needs to be at the start 
;          StringReplace, Clipboard, Clipboard, %A_Tab%, `%09, All 
;          StringReplace, Clipboard, Clipboard, `", `%22, All 
;          StringReplace, Clipboard, Clipboard, `#, `%23, All 
;          StringReplace, Clipboard, Clipboard,  &, `%26, All 
;          StringReplace, Clipboard, Clipboard,  :, `%3A, All  
;          StringReplace, Clipboard, Clipboard,  `\, `%5C, All 
;          Run, www.google.com/search?q=%Clipboard%
;        }
;    }
;    Return
	