; function
; if ActiveWinClass("classFoxitReader") = true
;   msgBox "t"
; else
;   msgBox "s"

ActiveWinClass(p_class_name, p_run_path="0", p_param="0")
{
 ;msgBox %p_class_name%
 ; attention: parameters value should be surrond by '%' to eval the value
  
  ; else select window by its class
  IfWinExist , ahk_class %p_class_name%
  {
    ifWinActive
    {
      WinMinimize, ahk_class %p_class_name%
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
IfWinNotExist, ahk_class %p_class_name%
    Run, %p_run_path%
GroupAdd, %p_grp_name%, ahk_class %p_class_name%
;if WinActive("ahk_exe %p_run_path%") ; wrong
;if WinActivate ahk_exe winword.exe; wrong
; WinAcitvate ~ is not a command nor function, should be change to
if WinActive ("ahk_exe %p_run_path%")
{
    GroupActivate, %p_grp_name%, r
}
else
{
    WinActivate ahk_class %p_class_name%
}
return
}