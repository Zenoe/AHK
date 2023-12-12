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
      if(p_class_name <> "cygwin/x X rl"){
      ;; there seems to be some issue with minimize x window
         WinMinimize %p_title% ahk_class %p_class_name%
      }
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
        run %p_run_path%, , , procId
        ; https://www.autohotkey.com/boards/viewtopic.php?t=84903
        ; workaround to activate application after lauching it
        WinWait, ahk_pid %procid%,,30
        If ErrorLevel
        {
        ;msgbox, 0x0,, 824E no window after 30 seconds. Aborting ...
        return
        }
        WinActivate, ahk_pid %procId%
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



SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}


    ; HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\
    engCode = 0x4090409
    ; cn Code is different for what return from GetKeyboardLayout (0x8040804)
    ; I don't know why
    cnCode := 00000804

; a: array contain texts to be sended
SendInputArray(a, t=90) {

    engCode = 0x4090409
    ; cnCode should be put inside this function. otherwise  SwitchIME(cnCode) will not work
    cnCode := 00000804

    SwitchIME(engCode)
    ; get current keyboard layout
    SetFormat, Integer, H
    WinGet, WinID,, A
    ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")

    ; switch to english input temporarily
    SwitchIME(engCode)

    ; By preceding any parameter with % , it becomes an expression.
    ; msgbox, % a[1] ", " a[2]
    ; b := a.clone()
    ; b[1] *= 3
    ; return b

    for i, text in a
    {
        SendInput % text
        Sleep t
    }

    SwitchIME(cnCode)
    Return

}


IME_GET(WinTitle="")
;-----------------------------------------------------------
; “获得 Input Method Editors 的状态”
; 1 是中文， 0 不是中文
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x005,0,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}


ActivateWindowFuzzy(title, targetClass := "", executablePath := "", parameter := "")
{
  WinGet, activeWindow, ID, A

  WinGet, windowList, List

  Loop, %windowList%
  {
    thisTitle := ""
    thisClass := ""
    WinGetTitle, thisTitle, % "ahk_id " windowList%A_Index%
    WinGetClass, thisClass, % "ahk_id " windowList%A_Index%

    if (RegExMatch(thisTitle, "i)" . title) && (targetClass = "" || thisClass = targetClass))
    {
      if (windowList%A_Index% = activeWindow)
      {
        WinMinimize, % "ahk_id " windowList%A_Index%
      }
      else
      {
        WinActivate, % "ahk_id " windowList%A_Index%
      }
      return
    }
  }

  if (executablePath != "")
  {
    Run, %executablePath% %parameter%
  }
}

ActivateChromeTab(tabTitle)
{
  ; Activate Chrome window
  WinActivate, ahk_class Chrome_WidgetWin_1

  ; Wait for Chrome to become the active window
  WinWaitActive, ahk_class Chrome_WidgetWin_1

  ; Get the title of the current tab
  WinGetTitle, currentTitle, ahk_class Chrome_WidgetWin_1

  ; Check if the current tab's title already contains the desired text
  if (InStr(currentTitle, tabTitle) > 0)
  {
    ; The desired tab is already active, exit the function
    return
  }

  ; Send Ctrl+1 to switch to the first tab
  SendInput, ^1

  ; Wait for the tab to load
  Sleep, 50
  
  ; Send Ctrl+Tab to cycle through the tabs until the desired tab is found
  Loop
  {
    ; Get the title of the current tab
    WinGetTitle, currentTitle, ahk_class Chrome_WidgetWin_1

    ; Check if the current tab's title matches the desired title
    if (InStr(currentTitle, tabTitle) > 0)
    {
      ; The desired tab is found, exit the loop
      break
    }

    ; Send Ctrl+Tab to switch to the next tab
    SendInput, ^{Tab}

    ; Wait for the tab to load
    Sleep, 50
  }
}
