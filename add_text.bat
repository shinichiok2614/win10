@echo off
chcp 65001 >nul
setlocal ENABLEDELAYEDEXPANSION

:: ----------------------------------------
:: Cấu hình chung
set a=24
set x1=399
set y1=689
:: ----------------------------------------

echo ============================================
echo BAT - In text len nhieu anh (luu file moi voi add_ va text)
echo ============================================

:: Nhập danh sách file ảnh (có thể nhiều file, cách nhau bằng dấu cách)
set /p FILES=Nhap duong dan cac file anh (cach nhau bang dau cach): 
if "%FILES%"=="" (
    echo Ban chua nhap file anh. Thoat.
    pause
    exit /b
)

:: Nhập đoạn, vị trí, nội dung cùng lúc (vd: 2 2 1b)
:input_line
set /p input="Nhap doan vi tri noi_dung (vd: 2 2 1b): "
for /f "tokens=1,2,*" %%a in ("%input%") do (
    set seg=%%a
    set pos=%%b
    set text=%%c
)

:: Kiểm tra hợp lệ
if %seg% lss 1 goto input_line
if %seg% gtr 3 goto input_line
if %pos% lss 1 goto input_line
if %pos% gtr 7 goto input_line
if "%text%"=="" goto input_line

:: Tính vị trí tổng thể và tọa độ
set /a pos_total=(%seg%-1)*7 + (%pos%-1)
set /a xpos=x1 + pos_total * a
set /a ypos=y1

:: Lặp qua tất cả file ảnh
for %%i in (%FILES%) do (
    echo Dang xu ly: %%i
    set fname=%%~ni
    set ext=%%~xi
    set newname=!fname!_add_%text%!ext!
    ffmpeg -y -i "%%i" -vf "drawtext=fontfile='C\:/Windows/Fonts/arial.ttf':text='%text%':x=%xpos%:y=%ypos%:fontsize=22:fontcolor=white:borderw=2" "!newname!"
)

echo Hoan thanh! Tat ca anh da duoc luu voi ten moi (_add_text).
pause
