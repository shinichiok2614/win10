toggle := true

Left::
+Left::
^Left::
!Left::
#Left::
if (toggle)
    return
Send {Left}
return

F12::
toggle := !toggle
ToolTip % toggle ? "← ĐÃ KHÓA" : "← ĐÃ MỞ"
SetTimer, RemoveToolTip, -1000
return

RemoveToolTip:
ToolTip
return
