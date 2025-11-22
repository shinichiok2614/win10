# CÀI ĐẶT FFmpeg TRÊN WINDOWS

## Tải FFmpeg

Trang tải FFmpeg:\
https://www.gyan.dev/ffmpeg/builds/

Bản Essentials (phổ biến):\
https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip

Bạn cũng có thể dùng bản đầy đủ:\
**ffmpeg-git-full.7z** (hoặc `.zip`) --- bản đầy đủ và ổn định.

Giải nén sẽ được một thư mục dạng:

    ffmpeg/
     ├─ bin/
     ├─ doc/
     ├─ presets/

Trong đó **bin/** chứa file thực thi `ffmpeg.exe`.

------------------------------------------------------------------------

## Thêm FFmpeg vào PATH

Để dùng lệnh `ffmpeg` ở bất kỳ thư mục nào:

1.  Mở **Start Menu** → tìm **Environment Variables** → mở.
2.  Trong cửa sổ **System Properties**, chọn **Environment Variables**.
3.  Ở khung **System variables**, tìm mục **Path** → **Edit**.
4.  Bấm **New** → dán đường dẫn thư mục **bin** của FFmpeg.\
    Ví dụ:

```{=html}
<!-- -->
```
    C:\Toolsfmpegin

5.  Bấm **OK** để lưu.

------------------------------------------------------------------------

## Kiểm tra cài đặt

Mở **CMD** hoặc **PowerShell** và chạy:

    ffmpeg -version

Nếu hiện thông tin phiên bản → đã cài OK.

------------------------------------------------------------------------

## Lệnh trích frame mỗi 20 frame

Ví dụ lưu thành file JPG:

    ffmpeg -i input.mp4 -vf "select='not(mod(n,20))'" -vsync vfr frame_%05d.jpg
    ffmpeg -i a.mp4 -vf "select='not(mod(n,50))'" -vsync vfr frame_%05d.jpg

### Giải thích:

-   `select='not(mod(n,20))'`: chọn các frame có chỉ số `n` chia hết cho
    20 (0, 20, 40, ...).
-   `-vsync vfr`: xuất frame theo timestamp, tránh trùng.

Kết quả thu được:

    frame_00001.jpg
    frame_00002.jpg
    ...

Nếu muốn xuất PNG → thay `.jpg` bằng `.png`.
