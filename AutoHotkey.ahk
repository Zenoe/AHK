#Include D:\portable\AHK\Common.ahk

;******************Chrome
; 用此法在cygwin 界面上无法切换到chrome, 改用ActiveWinClass
; <#c
; IfWinExist ,Chrome
; {
;     ifWinActive
;     {
;         ; WinActivatebottom ,Chrome
;     }
;     else
;     {
;         WinActivate
;     }
;     return
; }
; else
; {
;     run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
;     return
; }

return 

<#]::
run d:/portable/ahk/Autohotkey.ahk
return



; <#+z::
; run emacsclient "newfile.txt" 
; return
;-----------------------------------------------------


<#[::
run emacsclient --no-wait "c:/Documents and Settings/ab/My Documents/AutoHotkey.ahk"
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
