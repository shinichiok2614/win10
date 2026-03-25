# Hướng dẫn cài đặt Windows với WinNT Setup chuẩn UEFI - Lehait.net

[Thủ Thuật](https://lehait.net/thu-thuat/)

# Hướng dẫn cài đặt Windows với WinNT Setup chuẩn UEFI

 [![Photo of Lê Hà](https://secure.gravatar.com/avatar/f894515cb0a8f725c761703118a362d7bca72764d8a934193d6f389f48b9a8d8?s=140&d=mm&r=g)](https://lehait.net/author/lehait/)[Lê Hà](https://lehait.net/author/lehait/ "Lê Hà")24/08/24Last Updated: 24/10/25

66 176.747 2 minutes read

WinNT Setup hỗ trợ cài rất nhiều phiên bản Windows gồm XP\\7\\8\\10\\11. Các bạn có thể cài Windows theo chuẩn UEFI hoặc Legacy ở bất kỳ chuẩn boot nào. Cho dù các bạn đang sử dụng WinPE 32-bit hay 64-bit thì đều có thể thực hiện.

![](https://lehait.net/wp-content/uploads/2024/08/winnt-setup-uefi-01.jpg)

Download NHV Boot phiên bản mới nhất : [https://nhvboot.com/download](https://nhvboot.com/download)

Download Intel Rapid Storage Technology Driver (IRST): [tại đây](https://lehait.net/huong-dan-cai-dat-windows-tren-may-tinh-cpu-the-he-moi/)

IRST driver là driver quan trọng giúp Windows nhận diện ổ cứng RAID trên các máy tính Laptop Intel Gen 11 trở lên

## Hướng dẫn cài đặt Windows với WinNT Setup chuẩn UEFI

Windows boot chuẩn UEFI cần 2 phân vùng EFI (FAT32) và Windows (NTFS)

Chuẩn ổ cứng cho chế độ Windows boot UEFI là GPT

GPT (GUID Partition Table) là một chuẩn mới có khả năng thay thế cho MBR với các giao diện tối ưu hơn, tính năng tốt hơn. Chuẩn GPT còn tương thích tốt với UEFI để thay thế cho BIOS. Ưu điểm của chuẩn GPT là hỗ trợ dung lượng tối đa 256TB và số phân vùng trên ổ cứng lên đến con số 128.

Boot vào WinPE NHV BOOT mở phần mềm **Partition Wizard** tiến hành xoá phân vùng Windows cũ hoặc chia phân vùng ổ cứng.

Partition Wizard trong NHV BOOT có ở Desktop hoặc menu PStart.

Xoá hoặc phân chia phân vùng ổ cứng.

![](https://lehait.net/wp-content/uploads/2024/08/partition-gpt.jpg)

Tạo phân vùng EFI (FAT32)

![](https://lehait.net/wp-content/uploads/2024/08/partition-gpt-1.jpg)

**Partition Label**: EFI  
**Drive Letter**: None  
**File System**: FAT32  
**Partition Size**: 100MB

**Change Partition Type ID** phân vùng EFI, chọn **EFI System Partition** (ESP)

![](https://lehait.net/wp-content/uploads/2024/08/partition-gpt-2.jpg)

Tạo phân vùng Windows mới.

![](https://lehait.net/wp-content/uploads/2024/08/partition-gpt-3.jpg)

Chọn **Apply** để hoàn thành việc chia phân vùng.

Mở phần mềm **WinNT Setup**

![](https://lehait.net/wp-content/uploads/2024/08/winntsetup-uefi.jpg)

1.  Chọn Search…, tìm đến file ISO.
2.  **Boot drive:** chọn phân vùng **EFI (FAT32)**.
3.  Installation drive chọn phân vùng **Windows (NTFS)**
4.  **Options:** Chọn phiên bản Windows
5.  Cấu hình các lựa chọn xong các bạn click **Setup**

**Add Drivers:** Đối với Laptop sử dụng CPU Intel gen 11+ trở lên khi cài Windows với WinNT Setup sẽ cần phải thêm driver Intel Rapid Storage Technology (IRST).

_Các máy tính CPU AMD hoặc Intel Gen 10 trở xuống không cần thêm driver IRST_

Để mặc định, click **OK** để thực hiện tiến trình cài đặt.

![](https://lehait.net/wp-content/uploads/2024/08/winntsetup-uefi-1.jpg)

Sau khi hoàn thành click **Reboot** khởi động lại tiếp tục quá trình cài đặt Windows.

Tags

[Cài Windows từ ISO](https://lehait.net/tag/cai-windows-tu-iso/) [Win NT Setup](https://lehait.net/tag/win-nt-setup/) [Windows UEFI](https://lehait.net/tag/windows-uefi/)

 [![Photo of Lê Hà](https://secure.gravatar.com/avatar/f894515cb0a8f725c761703118a362d7bca72764d8a934193d6f389f48b9a8d8?s=140&d=mm&r=g)](https://lehait.net/author/lehait/)[Lê Hà](https://lehait.net/author/lehait/ "Lê Hà")24/08/24Last Updated: 24/10/25

66 176.747 2 minutes read

## Embedded Content

---

---

---