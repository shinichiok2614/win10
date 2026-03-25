
# Khắc phục lỗi chia sẻ máy in trên Windows 10/11


Việc chia sẻ máy in qua mạng LAN trên Windows 10 và Windows 11 đôi khi gặp phải nhiều vấn đề như không tìm thấy máy in, lỗi kết nối 0x0000011b, v.v. Những lỗi này có thể do Microsoft đã tăng cường bảo mật trong các giao thức chia sẻ.

Bài viết này hướng dẫn cách thiết lập và khắc phục lỗi khi chia sẻ máy in trong mạng nội bộ.

### Bước I. Thiết lập chia sẻ trong mạng Lan

### Để các máy tính có thể nhìn thấy nhau cần đặt mạng ở chế độ **Private**. Thao tác chuyển từ Public sang Private trong cài đặt Network.

Có thể chạy lệnh bên dưới trong PowerShell với quyền Administrator:

`Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private`

-   Truy cập **Control Panel\\Network and Internet\\Network and Sharing Center\\Advanced sharing settings**
-   Cấu hình chia sẻ mạng LAN

![](https://lehait.net/wp-content/uploads/2022/01/lan-1.jpg)

![](https://lehait.net/wp-content/uploads/2022/01/lan-2.jpg)

### Bước II. Printer Tweak – Công cụ fix lỗi chia sẻ máy in

Vì lý do bảo mật, Microsoft đã cấu hình chặt chẽ tính năng chia sẻ LAN và máy in. Hiện tại, bạn cần tạo tài khoản và đăng nhập để truy cập các máy chia sẻ.

Công cụ này giúp khôi phục tính năng chia sẻ máy in như trước đây. Nhờ đó, bạn có thể sử dụng chia sẻ dễ dàng hơn mà không cần đăng nhập.

Khi sử dụng công cụ, hãy đặt mạng thành Private. Công cụ đã tự động can thiệp, không yêu cầu đăng nhập như mặc định của MS.

![](https://lehait.net/wp-content/uploads/2022/01/printer-tweak.jpg)

### Download Printer Tweak

[Link 1](https://gofile.io/d/1e3zTU) [Link 2](https://pixeldrain.com/u/kSobbkpS)

Password: lehait.net

Lưu ý:

-   Tool chỉ chạy trên Windows 10/11 64 bit.
-   Tool tự động phát hiện Windows 10 or 11 để thay đổi cho phù hợp.

Sau khi thực hiện các bước trên, bạn có thể thêm và sử dụng máy in qua mạng LAN một cách ổn định.

