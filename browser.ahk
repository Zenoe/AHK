


<#p::
myclip:=clipboard
gurl := "www.macmillandictionary.com/dictionary/british/" . myclip 
Run chrome.exe %gurl%
; run firefox.exe %gurl%
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
; Double up the quotes to escape them.
; Run, shutdown "/s /c ""MESSAGE"""
gurl := """https://www.google.com/#q=" . myclip . """"
Run chrome.exe %gurl%
return

; <#5::
; myclip:=clipboard
; MsgBox clipboard now has the following contents:%clipboard%
; return
<#b::
myclip:=clipboard
gurl := """https://www.baidu.com/s?&wd=" . myclip . """"
Run chrome.exe %gurl%
return

<#g::
gurl := "http://localhost:8000"
Run chrome.exe %gurl%
return
