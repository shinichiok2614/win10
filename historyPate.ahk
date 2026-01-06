#NoEnv
#SingleInstance Force
SendMode Input

MaxClip := 10
ClipHistory := []
IsPasting := false

; Tạo menu rỗng
Menu, ClipMenu, Add, Dummy, PasteClip
Menu, ClipMenu, DeleteAll

OnClipboardChange("ClipChanged")

ClipChanged(Type) {
    global ClipHistory, MaxClip, IsPasting

    ; 🔒 Bỏ qua nếu đang paste
    if (IsPasting)
        return

    if (Type != 1)
        return

    Clip := Clipboard
    if (Clip = "")
        return

    if (ClipHistory.Length() > 0 && ClipHistory[1] = Clip)
        return

    ClipHistory.InsertAt(1, Clip)

    while (ClipHistory.Length() > MaxClip)
        ClipHistory.RemoveAt(MaxClip + 1)
}

^+v::
    global ClipHistory

    if (ClipHistory.Length() = 0) {
        MsgBox, Clipboard history trống
        return
    }

    Menu, ClipMenu, DeleteAll

    for index, item in ClipHistory {
        preview := SubStr(item, 1, 40)
        preview := StrReplace(preview, "`n", " ")
        Menu, ClipMenu, Add, % index ": " preview, PasteClip
    }

    Menu, ClipMenu, Show
return

PasteClip:
    global ClipHistory, IsPasting

    index := RegExReplace(A_ThisMenuItem, ":.*")

    IsPasting := true          ; 🔒 khóa listener
    Clipboard := ClipHistory[index]
    Sleep 50
    Send ^v
    Sleep 50
    IsPasting := false         ; 🔓 mở lại
return
