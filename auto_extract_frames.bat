@echo off
echo ============================================
echo   FFmpeg - Tu dong tim video va cat frame
echo ============================================

:: Tìm video đầu tiên trong thư mục hiện tại
for %%f in (*.mp4 *.avi *.mkv *.mov) do (
    set VIDEO=%%f
    goto found
)

echo Khong tim thay file video trong thu muc!
echo Vui long dat video (.mp4, .avi, .mkv, .mov) cung folder voi file .bat
pause
exit /b

:found
echo Da tim thay video: %VIDEO%
echo Dang trich moi 20 frame...
echo.

ffmpeg -i "%VIDEO%" -vf "select='not(mod(n,50))'" -vsync vfr frame_%%05d.jpg

echo.
echo Hoan thanh! Da luu frame tai thu muc hien tai.
pause
