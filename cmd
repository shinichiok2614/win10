explorer .
  
Bật Hibernate trong Windows
powercfg -h on

thêm "Tắt máy" vào menu chuột phải
HKEY_CLASSES_ROOT\Directory\Background\shell
Nhấn chuột phải > New > Key > đặt tên là Shutdown
Trong Shutdown, tạo key con tên command
Nhấp vào command, sửa Default thành:
shutdown -s -t 0
Tắt máy	shutdown -s -t 0
Khởi động lại	shutdown -r -t 0
Khoá máy	rundll32.exe user32.dll,LockWorkStation
Hibernate	shutdown /h
Đăng xuất	shutdown -l

Thêm mở nhanh Folder/Ứng dụng vào Menu Chuột Phải
Giả sử bạn muốn mở D:\Tài liệu nhanh:
Vào Registry:
HKEY_CLASSES_ROOT\Directory\Background\shell
Tạo key OpenDocs → chỉnh Default: "Mở Tài liệu"
Trong OpenDocs, tạo key con command → chỉnh Default:
explorer D:\Tài liệu

✨ Bật God Mode – Chế độ thượng đế
Tạo thư mục mới và đặt tên:
GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}
→ Windows sẽ chuyển nó thành biểu tượng "GodMode" chứa tất cả thiết lập hệ thống.

🛠️ Tùy chỉnh menu Send To (Gửi tới...)
Nhấn Win + R → gõ:\
shell:sendto

run:
shell:startup	Mở thư mục khởi động
shell:sendto	Mở Send To
shell:recent	Danh sách file gần đây
shell:downloads	Mở thư mục tải xuống

Ẩn 1 file bất kỳ	attrib +h +s file.txt
Xoá lịch sử Recent Files	del /f /s /q %AppData%\Microsoft\Windows\Recent\*
Khóa nhanh máy tính	rundll32.exe user32.dll,LockWorkStation
Quản lý người dùng nâng cao	control userpasswords2 hoặc netplwiz
Hiển thị file/thư mục ẩn	Tạo phím tắt: explorer.exe /select,"%userprofile%\AppData"

Xem lịch sử kết nối WiFi	netsh wlan show profile
Xem mật khẩu WiFi đã lưu	netsh wlan show profile name="Tên_Mạng" key=clear

Khóa nhanh máy tính	rundll32.exe user32.dll,LockWorkStation
Ẩn 1 file bất kỳ	attrib +h +s file.txt

Tạo danh sách tất cả file trong thư mục:
dir /b > danh-sach.txt
