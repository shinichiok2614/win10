@echo off
setlocal enabledelayedexpansion

:: Các vị trí pixel cần kẻ vạch (dọc)
set positions=392 566 738 909

:: Màu và độ dày
set color=red
set thickness=3

:: Tạo thư mục output
if not exist output mkdir output

for %%f in (*.jpg *.jpeg *.png *.bmp *.webp) do (
    set filter=

    :: tạo chuỗi filter drawbox cho từng vị trí
    for %%x in (%positions%) do (
        if "!filter!"=="" (
            set filter=drawbox=x=%%x:y=0:w=%thickness%:h=ih:color=%color%
        ) else (
            set filter=!filter!,drawbox=x=%%x:y=0:w=%thickness%:h=ih:color=%color%
        )
    )

    echo Đang xử lý: %%f
    ffmpeg -y -i "%%f" -vf "!filter!" "output\%%f"
)

echo.
echo ==== HOÀN THÀNH ====
pause
