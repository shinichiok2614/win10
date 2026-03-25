# Cách tạo USB Boot bằng Grub4dos giúp cài đặt, sửa lỗi hệ điều hành

## Hướng dẫn Tạo USB Boot bằng Grub4dos

**Chuẩn bị:**  
\- USB dung lượng ≥ 1Gb.  
\- Phần mềm **[Hiren BootCD](https://taimienphi.vn/download-hiren-s-bootcd-7831)** ( với mọi phiên bản)  
\- Phần mềm **[Grub4dos](https://taimienphi.vn/download-grub4dos-7821)**

**Lưu ý:** Kể từ các phiên bản hệ điều hành Windows 10, 8.1, 8 để khởi chạy các phần mềm các bạn cần nhấn chuột phải vào file chạy và chọn **Run as administrator** nhé.

_Bước 1_: Format ổ USB, bạn nên sử dụng phần mềm **[HP USB Disk Storage Format Tool](https://taimienphi.vn/download-hp-usb-disk-storage-format-tol-219)** để format USB

**Mẹo**Nếu USB xuất hiện lỗi khi Format, bạn có thể tham khảo bài viết **[Sửa lỗi USB không cho Format](https://thuthuat.taimienphi.vn/sua-loi-usb-khong-format-duoc-1454n.aspx)**.

![tao usb boot](https://taimienphi.vn/tmp/cf/aut/MNcI-tao-usb-boot-voi-grub4dos.jpg)

_Bước 2_: Khởi động phần mềm Grub4dos lên.

\- Tại mục Disk, các bạn nhấn **Refresh** để nhận diện rồi chọn USB bạn muốn tạo Hiren's Boot

\- Cũng tương tự tại Part List các bạn nhấn **Refesh** và chọn **Whole disk (MBR)**

\- Sau khi đã thiết lập xong nhấn **Install** để cài đặt

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-1.jpg)

_Bước 3:_ Hộp thoại command thông báo thiết lập MBR/BS trên USB hoàn tất. Các bạn nhấn phím bất kỳ hoặc nhấn **Enter** để kết thúc.

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-2.jpg)

_Bước 4:_ Tiếp theo, các bạn tiếp tục copy 2 file **grldr** and **menu.lst** từ file grub4dos.zip đã giải nén ra vào USB nhé.

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-3.jpg)

_Bước 5:_ Mở thư mục chứa file Hiren's Boot.iso, các bạn tiến hành giải nén file Hiren's Boot.iso và copy toàn bộ các file vừa giải nén vào trong USB. 

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-4.jpg)

_Chạy thử USB Boot sau khi tạo_

Để kiểm tra chiếc USB này có hoạt động hay không cũng như quá trình thực hiện của bạn có sai sót chỗ nào không thì bạn chỉ việc nhấp đúp vào file DLC1Menu và chọn ngôn ngữ sử dụng (Ở đây Taimienphi chọn Việt Nam).

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-5.jpg)

Giao diện DLC Boot 2015 hiện ra, các bạn chọn **Công cụ khác**.

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-6.jpg)

Nhấn tiếp vào tùy chọn **MobaLiveCD**

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-7.jpg)

Cửa sổ MobaLiveCD hiện ra, các bạn nhấn vào tùy chọn **Run the LiveUSB**

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-8.jpg)

Lựa chọn nguồn là USB của bạn và nhấn **OK**

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-9.jpg)

Chọn **No**

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-10.jpg)

Và giao diện Hiren's Boot sẽ hiện ra như hình dưới đây với tùy từng phiên bản mà bạn đã giải nén vào USB ban nãy. Kể từ giờ bạn đã có trong tay một chiếc USB đa năng hỗ trợ bạn trong việc sửa chữa máy tính nhanh chóng.

![tao usb boot](https://imgt.taimienphi.vn/cf/images/ddt/2017/8/8/tao-usb-boot-voi-grub4dos-11.jpg)

_Những lỗi gặp phải trong quá trình tạo USB Boot_

\- Thực hiện các thao tác không đúng trình tự

\- Giải nén bộ Hiren's Boot sai hoặc thiếu file.

\- Thông thường nếu bạn đang bật phần mềm diệt virus thì có thể phần mềm này đã chặn việc đọc file file autorun được tạo trong USB boot, điều này dẫn đến tình trạng file autorun được tạo nhưng không có nội dung nên khi chúng ta Boot USB sẽ bị lỗi.

https://thuthuat.taimienphi.vn/tao-usb-boot-voi-grub4dos-1604n.aspx  
Bài viết trên đây chúng tôi đã hướng dẫn các bạn cách [tạo usb boot](https://thuthuat.taimienphi.vn/tao-usb-boot-voi-hirens-boot-954n.aspx) bằng Grub4dos, nhờ đó mỗi khi máy tính gặp sự cố mà lại không có ổ CD bạn có thể dùng USB để bung bản Ghost cũng như cài đặt lại hệ điều hành cho máy tính. Tùy vào phiên bản Hiren's Boot bạn tải về và sau khi giải nén sẽ có giao diện và các thành phần file khác nhau. Nhưng nhìn chung sau khi thực hiện các bước trên đây là bạn đã có thể hoàn thành việc tạo USB Boot bằng Grub4dos rồi đấy. Chúc các bạn thành công

