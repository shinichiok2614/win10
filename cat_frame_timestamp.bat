@echo off
setlocal ENABLEDELAYEDEXPANSION

echo ============================================
echo   FFmpeg - Cat frame + Timestamp
echo ============================================

:: Tìm video đầu tiên
set VIDEO=
for %%f in (*.mp4 *.avi *.mkv *.mov) do (
    set VIDEO=%%f
    goto found
)

echo Khong tim thay file video trong thu muc.
pause
exit /b

:found
echo Da tim thay video: %VIDEO%

:: Tạo thư mục output
set NAME=%VIDEO%
set NAME=%NAME:~0,-4%
set OUTDIR=%NAME%_frames
mkdir "%OUTDIR%" 2>nul

echo Dang cat frame moi 20 frame va in timestamp...

:: Filter timestamp (mm:ss)
set FILTER=drawtext=fontfile='C\\:/Windows/Fonts/arial.ttf':text='%{pts\\:gmtime\\:0\\:%M\\\\:%S}':x=10:y=h-40:fontsize=32:fontcolor=white:borderw=2

ffmpeg -i "%VIDEO%" -vf "select='not(mod(n,20))',"^
"%FILTER%" -vsync vfr "%OUTDIR%\\frame_%%05d.jpg"

echo.
echo Hoan thanh! Da luu frame tai thu muc: %OUTDIR%
pause
