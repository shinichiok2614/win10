# Hướng dẫn cài MeTube

https://github.com/AppJail-makejails/metube

## Response:
Dưới đây là **hướng dẫn sử dụng cơ bản cho dự án [AppJail‑makejails/metube trên GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)**, bao gồm cách cài đặt và chạy MeTube bằng AppJail (FreeBSD Jails):

* * *

📌 1. Giới thiệu nhanh
----------------------

**MeTube** là một giao diện web để tải video/audio từ YouTube và nhiều trang khác sử dụng **yt-dlp** (fork của youtube-dl) — với hỗ trợ playlist. [GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)

*   _Lưu ý:_ Kho của AppJail-makejails/metube là bản Makejail để chạy MeTube như một **jail FreeBSD** (tương tự như container). [GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)

* * *

🛠️ 2. Yêu cầu
--------------

Trước khi cài, bạn cần:

*   **FreeBSD** đã cài AppJail (framework tạo Jail) và các công cụ liên quan. [GitHub](https://github.com/DtxdF/AppJail?utm_source=chatgpt.com)
*   Kiến thức cơ bản về FreeBSD Jail & AppJail.
*   Quyền root trên máy chủ.

> Nếu bạn chỉ muốn chạy MeTube nhanh bằng Docker (trên Linux/Windows/macOS), có thể dùng theo cách **Docker** (không qua AppJail) — mình sẽ hướng dẫn ở cuối.

* * *

📥 3. Tạo và cài MeTube bằng AppJail
------------------------------------

### 3.1 Tạo jail

Chạy lệnh sau để tạo một jail mới tên `metube`:

```sh
appjail makejail -j metube -f gh+AppJail-makejails/metube \
    -o virtualnet=":metube default" \
    -o nat \
    -o expose=8081
```

*   `-j metube`: Tên jail
*   `-f gh+.../metube`: Lấy Makejail từ repo GitHub
*   `expose=8081`: Mở port 8081 để truy cập web UI từ ngoài mạng. [GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)

* * *

### 3.2 Tạo thư mục dữ liệu

Trong jail, tạo thư mục chứa file tải về:

```sh
appjail cmd local metube mkdir -p app/files/downloads
appjail cmd local metube mkdir -p app/files/audio
appjail cmd local metube mkdir -p app/files/state
```

Thiết lập quyền:

```sh
appjail cmd local metube chown -Rf 1001:1001 app/files
```

> UID và GID `1001` dùng cho MeTube bên trong jail. [GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)

* * *

### 3.3 Thiết lập biến môi trường

Khi kích hoạt MeTube, bạn có thể gán các biến như thư mục tải, theme… Ví dụ:

```sh
appjail enable metube start \
    -V DEFAULT_THEME=dark \
    -V DOWNLOAD_DIR=files/downloads \
    -V AUDIO_DOWNLOAD_DIR=files/audio \
    -V STATE_DIR=files/state \
    -V TEMP_DIR=tmp \
    -V DELETE_FILE_ON_TRASHCAN=true
```

Các biến này tương ứng với cấu hình của MeTube (giống như trong Docker). [GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)

* * *

### 3.4 Khởi động

Bắt đầu chạy MeTube:

```sh
appjail start metube
```

Xong! Bạn có thể mở trình duyệt và truy cập:

```
http://IP_FREEBSD:8081
```

Thay `IP_FREEBSD` bằng địa chỉ IP của máy FreeBSD. [GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)

* * *

📍 4. Kiểm tra trạng thái & log
-------------------------------

*   **Xem trạng thái** jail MeTube:

```sh
appjail run -s metube_status metube
```

*   **Xem log ứng dụng**:

```sh
appjail run -s metube_log metube
```

> Cả hai là _stages_ tùy chỉnh trong Makejail của MeTube. [GitHub](https://github.com/AppJail-makejails/metube?utm_source=chatgpt.com)

* * *

🐋 5. Cách nhanh: chạy MeTube bằng Docker (không dùng AppJail)
--------------------------------------------------------------

Nếu bạn _không cần FreeBSD/Jail_, có thể dùng Docker như bản gốc của MeTube:

### 5.1 Chạy Docker

```sh
docker run -d -p 8081:8081 \
  -v /path/to/downloads:/downloads \
  ghcr.io/alexta69/metube
```

hoặc docker-compose:

```yaml
services:
  metube:
    image: ghcr.io/alexta69/metube
    ports:
      - "8081:8081"
    volumes:
      - /path/to/downloads:/downloads
```

Đây là cách phổ biến và dễ nhất để triển khai MeTube. [GitHub](https://github.com/alexta69/metube?utm_source=chatgpt.com)

### 5.2 Biến môi trường (tùy chọn)

Bạn có thể cấu hình thêm bằng environment variables, ví dụ:

```sh
-e DEFAULT_THEME=dark \
-e UID=1000 \
-e GID=1000
```

hoặc cấu hình tải theo nhu cầu (concurrent downloads, cookies…). [GitHub](https://github.com/alexta69/metube?utm_source=chatgpt.com)

* * *

⚠️ Lưu ý thường gặp
-------------------

*   **Lỗi quyền (permission denied)** khi ghi file vào thư mục tải — thường do user trong container/jail không có quyền ghi trên host. Pre-create thư mục với quyền phù hợp trước khi mount. [Reddit](https://www.reddit.com/r/homelab/comments/1qj4nqe/metube_having_permission_issues_i_cant_seem_to/?utm_source=chatgpt.com)
*   YouTube có thể thay đổi API/định dạng, nên đôi khi phải **cập nhật yt-dlp** trong MeTube để tải được video mới. [Reddit](https://www.reddit.com/r/selfhosted/comments/1iqoo8b?utm_source=chatgpt.com)

* * *

Nếu bạn muốn hướng dẫn chi tiết hơn theo môi trường của bạn (FreeBSD hoặc Docker, với ví dụ cụ thể), cho mình biết!

## Response:
Dưới đây là **hướng dẫn từng bước chạy MeTube bằng Docker** (cách đơn giản nhất, dùng được trên Windows, Linux, NAS…).

* * *

🔹 BƯỚC 1: Cài Docker
=====================

✅ Windows 10/11
---------------

1.  Tải Docker Desktop:  
    [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
2.  Cài đặt bình thường.
3.  Sau khi cài xong → mở Docker Desktop.
4.  Mở CMD hoặc PowerShell kiểm tra:

```bash
docker --version
```

Nếu hiện version là OK.

* * *

✅ Linux (Ubuntu ví dụ)
----------------------

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
```

Kiểm tra:

```bash
docker --version
```

* * *

🔹 BƯỚC 2: Tạo thư mục lưu file tải
===================================

Ví dụ:

### Windows:

Tạo thư mục:

```
D:\metube-downloads
```

### Linux:

```bash
mkdir -p ~/metube-downloads
```

* * *

🔹 BƯỚC 3: Chạy MeTube
======================

Chạy lệnh sau:

### Windows (PowerShell / CMD)

```bash
docker run -d ^
  -p 8081:8081 ^
  -v D:\metube-downloads:/downloads ^
  --name metube ^
  ghcr.io/alexta69/metube
```

### Linux

```bash
docker run -d \
  -p 8081:8081 \
  -v ~/metube-downloads:/downloads \
  --name metube \
  ghcr.io/alexta69/metube
```

* * *

🔹 BƯỚC 4: Mở giao diện web
===========================

Mở trình duyệt:

```
http://localhost:8081
```

Nếu chạy trên server khác thì thay `localhost` bằng IP máy đó.

* * *

🔹 BƯỚC 5: Cách sử dụng
=======================

1.  Dán link YouTube
2.  Chọn định dạng:
    *   Video
    *   Audio (MP3)
3.  Nhấn Download
4.  File sẽ nằm trong thư mục bạn đã tạo (`metube-downloads`)

* * *

🔹 Lệnh quản lý container
=========================

### Xem container đang chạy

```bash
docker ps
```

### Dừng

```bash
docker stop metube
```

### Chạy lại

```bash
docker start metube
```

### Xoá container

```bash
docker rm metube
```

* * *

🔹 (Tuỳ chọn) Cấu hình nâng cao
===============================

Ví dụ:

```bash
docker run -d \
  -p 8081:8081 \
  -v ~/metube-downloads:/downloads \
  -e DEFAULT_THEME=dark \
  -e UID=1000 \
  -e GID=1000 \
  --name metube \
  ghcr.io/alexta69/metube
```

### Một số biến hữu ích:

| Biến | Ý nghĩa |
| --- | --- |
| DEFAULT\_THEME=dark | Giao diện tối |
| UID / GID | Tránh lỗi quyền file |
| MAX\_CONCURRENT\_DOWNLOADS | Số tải song song |

* * *

🔹 Cách cập nhật MeTube
=======================

```bash
docker pull ghcr.io/alexta69/metube
docker stop metube
docker rm metube
```

Sau đó chạy lại lệnh `docker run` như ban đầu.

* * *

🔥 Cách chuyên nghiệp hơn: dùng docker-compose
==============================================

Tạo file `docker-compose.yml`:

```yaml
version: "3"

services:
  metube:
    image: ghcr.io/alexta69/metube
    container_name: metube
    ports:
      - "8081:8081"
    volumes:
      - ./downloads:/downloads
    environment:
      - DEFAULT_THEME=dark
    restart: unless-stopped
```

Chạy:

```bash
docker compose up -d
```

* * *

Nếu bạn nói mình đang dùng **Windows hay Linux**, mình có thể viết đúng lệnh theo máy bạn luôn để tránh lỗi path 👍

## Response:
Phụ thuộc vào lúc bạn chạy `docker run` có **map thư mục (-v)** hay không.

* * *

🔹 Trường hợp 1: Bạn có dùng `-v`
=================================

Ví dụ bạn chạy:

```bash
docker run -d \
  -p 8081:8081 \
  -v D:\metube-downloads:/downloads \
  --name metube \
  ghcr.io/alexta69/metube
```

👉 Nhạc sẽ nằm trong:

```
D:\metube-downloads
```

Vì:

```
-v THƯ_MỤC_MÁY_THẬT:/downloads
```

Docker map thư mục `/downloads` trong container ra thư mục máy bạn.

* * *

🔹 Trường hợp 2: Bạn KHÔNG dùng `-v`
====================================

Ví dụ bạn chỉ chạy:

```bash
docker run -d -p 8081:8081 ghcr.io/alexta69/metube
```

👉 Nhạc sẽ nằm bên trong container tại:

```
/downloads
```

Nhưng bạn **không thấy được trực tiếp từ Windows/Linux**.

Muốn xem, phải:

```bash
docker exec -it metube sh
cd /downloads
ls
```

⚠️ Và nếu xoá container → file sẽ mất luôn.

* * *

🔹 Cách kiểm tra container đang map ở đâu
=========================================

Chạy:

```bash
docker inspect metube
```

Tìm phần `"Mounts"` sẽ thấy:

```
"Source": "D:\\metube-downloads",
"Destination": "/downloads"
```

* * *

🔥 Khuyến nghị
==============

Luôn chạy với `-v` để:

*   Không mất file khi xoá container
*   Dễ quản lý
*   Dễ backup

* * *

Nếu bạn gửi mình lệnh `docker run` bạn đã dùng, mình sẽ nói chính xác file đang nằm ở đâu 👍



---
Powered by [ChatGPT Exporter](https://www.chatgptexporter.com)