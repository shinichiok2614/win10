#NoEnv
#SingleInstance Force
#UseHook
#InstallKeybdHook

if !A_IsAdmin {
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

clickMode := false

; =============================
; CTRL + `  → BẬT / TẮT
; =============================
^sc029::   ; Ctrl + `
    clickMode := !clickMode
    if (clickMode)
        ToolTip, CLICK MODE: ON, 10, 10
    else
        ToolTip
return

; =============================
; CHỈ KHI CLICK MODE = ON
; =============================
#If (clickMode)

; GIỮ ` = GIỮ CLICK TRÁI (CHỈ KHI KHÔNG GIỮ CTRL)
sc029::
    if !GetKeyState("Ctrl", "P")
        Click, Down Left
return

sc029 up::
    Click, Up Left
return

; 1 = CLICK GIỮA
1::Click, middle

; 2 = CLICK PHẢI
2::Click, right

; ESC = TRỞ VỀ THƯ MỤC CHA
Esc::
    Send !{Up}
return

; =============================
; CHUYỂN TAB
; =============================

; F1 = TAB TRÁI
F1::
    Send ^+{Tab}     ; Ctrl + Shift + Tab
return

; F2 = TAB PHẢI
F2::
    Send ^{Tab}      ; Ctrl + Tab
return

#If
