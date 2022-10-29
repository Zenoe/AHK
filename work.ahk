#Include C:\dotfiles\AHK\Common.ahk

<#]::
run c:/dotfiles/ahk/work.ahk
return

getAscStr(str)
{
    charList:=StrSplit(str)
    for key,val in charList
        out.="{Asc " . asc(val) . "}"
    return out
}

#|::
inputs := ["linzhengyuan", "{TAB}", "08151631", "{Enter}", "{Space}"]
SendInputArray(inputs)
return

; telnet login
#9::
inputs := ["admin", "{enter}", "Ragile123","{enter}", "ru", "{enter}", "sudo su", "{enter}", "systemctl stop lldp.service", "{enter}"]
SendInputArray(inputs)
return


^!6::
; Alt 4 select window 4
; ctrl u, 1: select right panel
inputs := ["!4", "^]", "u", "1", "{Up}", "{enter}", "!l", "{Up}", "{enter}"]
SendInputArray(inputs, 20)
return

; ^!7::
; inputs := ["ssh admin@172.28.55.59","{enter}", "Ragile123","{enter}", "ru", "{enter}", "sudo su","{enter}", "systemctl stop lldp.service &", "{enter}"]
; SendInputArray(inputs, 180)
; return
^!8::
inputs := ["admin", "{enter}", "Ragile123","{enter}"]
SendInputArray(inputs)
return

; save buffer and run last command
^!;::
inputs := ["{Esc}","^s", "!0", "{Up}", "{enter}"]
SendInputArray(inputs, 200)
return

; save buffer and run last command and switch back to current panel
^!'::
Send, ^!;
Send, !0
return

; #1::
; ; Send {TAB}
; oldClip = %Clipboard%
; clipboard = 无线
; Send ^v
; Clipboard = %oldClip%
; return


; hotkeys and hotstrings:
:*:;wy::2004lzy156@163.com
:*:;sa::10.104.30.88
:*:;ub::10.110.198.50
:*:;pw::Ragile123
:*:;pu::123qwej
:*:;lz::linzhengyuan
:*:;sh::show in sta
:*:;rel::sudo config reload -y

:*:mytt::123456789

; Open Downloads folder
^+d::Run "C:\Users\ab\Downloads" ; ctrl+shift+d
return
