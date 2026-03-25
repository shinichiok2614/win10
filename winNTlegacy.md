# Hướng dẫn cài đặt Windows với WinNT Setup chuẩn Legacy - Lehait.net

[Thủ Thuật](https://lehait.net/thu-thuat/)

# Hướng dẫn cài đặt Windows với WinNT Setup chuẩn Legacy

 [![Photo of Lê Hà](https://secure.gravatar.com/avatar/f894515cb0a8f725c761703118a362d7bca72764d8a934193d6f389f48b9a8d8?s=140&d=mm&r=g)](https://lehait.net/author/lehait/)[Lê Hà](https://lehait.net/author/lehait/ "Lê Hà")15/09/24Last Updated: 05/11/25

0 2.226 1 minute read

WinNT Setup hỗ trợ cài rất nhiều phiên bản Windows gồm XP\\7\\8\\10\\11. Các bạn có thể cài Windows theo chuẩn UEFI hoặc Legacy ở bất kỳ chuẩn boot nào. Cho dù các bạn đang sử dụng WinPE 32-bit hay 64-bit thì đều có thể thực hiện.

![](https://lehait.net/wp-content/uploads/2024/10/winnt-setup-legacy-01.jpg)

Download NHV Boot phiên bản mới nhất : [https://nhvboot.com/download](https://nhvboot.com/download)

Download Intel Rapid Storage Technology Driver (IRST): [tại đây](https://lehait.net/huong-dan-cai-dat-windows-tren-may-tinh-cpu-the-he-moi/)

_IRST driver là driver quan trọng giúp Windows nhận diện ổ cứng RAID trên các máy tính Laptop Intel Gen 11 trở lên._

## Hướng dẫn cài đặt Windows với WinNT Setup chuẩn Legacy

Windows chuẩn boot Legacy cần duy nhất 1 phân vùng _(Windows boot chuẩn UEFI cần 2 phân vùng EFI-FAT32 và Windows-NTFS)_

**Chuẩn ổ cứng cho chế độ Boot Legacy là MBR**

_MBR (Master Boot Record) là chuẩn quản lý thông tin được IBM phát minh vào năm 1983. MBR hỗ trợ dung lượng ổ cứng tối đa là 2TB và mỗi ổ đĩa chia được 4 phân vùng. Chuẩn MBR có khả năng tương thích với tất cả các phiên bản Windows hiện nay. Nhược điểm của MBR là chỉ hỗ trợ tối đa 2TB và 4 phân vùng._

Boot vào WinPE NHV BOOT mở phần mềm **Partition Wizard** tiến hành xoá phân vùng Windows cũ hoặc chia phân vùng ổ cứng.

Tiến hành xoá phân vùng Windows cũ.

![](https://lehait.net/wp-content/uploads/2024/10/partition-legacy-1.jpg)

Tạo phân vùng Windows mới

![](https://lehait.net/wp-content/uploads/2024/10/partition-legacy-2.jpg)

**Set Active** cho phân vùng Windows mới

![](https://lehait.net/wp-content/uploads/2024/10/partition-legacy.jpg)

Mở phần mềm **WinNT Setup**

![](https://lehait.net/wp-content/uploads/2024/10/wintsetup-legacy-1.jpg)

1.  Chọn **Search**…tìm đến file ISO
2.  **Boot drive** và **Installation drive** chọn phân vùng Windows mới đã tạo trước đó.
3.  **Options:** Chọn phiên bản Windows
4.  Cấu hình các lựa chọn xong các bạn click **Setup.**

**Add Drivers:** Đối với Laptop sử dụng CPU Intel gen 11+ trở lên khi cài Windows với WinNT Setup sẽ cần phải thêm driver Intel Rapid Storage Technology (IRST).

_Các máy tính CPU AMD hoặc Intel Gen 10 trở xuống không cần thêm driver IRST_

![](https://lehait.net/wp-content/uploads/2024/10/wintsetup-legacy-2.jpg)

Để mặc định, click **OK** để thực hiện tiến trình cài đặt.

Click **Reboot** khởi động lại tiếp tục quá trình cài đặt Windows.

Tags

[Cài đặt windows legacy](https://lehait.net/tag/cai-dat-windows-legacy/) [WinNT Setup](https://lehait.net/tag/winnt-setup/)

 [![Photo of Lê Hà](https://secure.gravatar.com/avatar/f894515cb0a8f725c761703118a362d7bca72764d8a934193d6f389f48b9a8d8?s=140&d=mm&r=g)](https://lehait.net/author/lehait/)[Lê Hà](https://lehait.net/author/lehait/ "Lê Hà")15/09/24Last Updated: 05/11/25

0 2.226 1 minute read

## Embedded Content

---

---

---