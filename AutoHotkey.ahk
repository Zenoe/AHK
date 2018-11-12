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

<#g::
myclip:=clipboard
;gurl := "www.iciba.com/" . myclip 
; append quote marks into a string
if myclip
{
gurl := """" . myclip . """"
; Run chrome.exe %gurl%
run chrome.exe %gurl%
}
return