; function
; if ActiveWinClass("classFoxitReader") = true
;   msgBox "t"
; else
;   msgBox "s"

ActiveWinClass(p_class_name, p_run_path="0", p_param="0", p_title="")
{
 ;msgBox %p_class_name%
 ; attention: parameters value should be surrond by '%' to eval the value
  
  ; else select window by its class and title combined with "SetTitleMatchMode, 2"
  IfWinExist %p_title% ahk_class %p_class_name%
  {
    ifWinActive
    {
      ;; put focus onto another window
      Send, {ALT DOWN}{TAB}{ALT UP}
      WinMinimize %p_title% ahk_class %p_class_name%
      
      ; WinGet, Instances, Count, ahk_class %p_class_name%
      ; If Instances > 1
      ;   WinActivateBottom, ahk_class %p_class_name%
    }
    else
    {
      WinActivate
    }
    return true
  }
  else
  {
    if p_run_path <> 0
    {
      if p_param <> 0
      {
        run %p_run_path% -search %Clipboard%
      }
      else
      {
        run %p_run_path%
      }
      return true
     }
    else
      return false
  }
}

ActiveGrpWinClass(p_class_name, p_grp_name, p_run_path)
{
; IfWinNotExist, ahk_class %p_class_name%
IfWinNotExist, ahk_exe %p_run_path%
    Run, %p_run_path%
; GroupAdd, %p_grp_name%, ahk_class %p_class_name%
GroupAdd, %p_grp_name%, ahk_exe %p_run_path%
;if WinActive("ahk_exe %p_run_path%") ; wrong
;if WinActivate ahk_exe winword.exe; wrong
; WinAcitvate ~ is not a command nor function, should be change to
if WinActive ("ahk_exe %p_run_path%")
{
    GroupActivate, %p_grp_name%, r
}
else
{
    ; WinActivate ahk_class %p_class_name%
    WinActivate ahk_exe %p_run_path%
}
return
}
