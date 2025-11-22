@echo off
setlocal ENABLEDELAYEDEXPANSION

echo ============================================
echo   FFmpeg - Cat frame + Nen RAR tu dong
echo ============================================

:: Tim video dau tien trong thu muc
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

:: Tao thu muc output theo ten video
set NAME=%VIDEO%
set NAME=%NAME:~0,-4%
set OUTDIR=%NAME%_frames

mkdir "%OUTDIR%" 2>nul

echo Dang cat frame moi 20 frame...
ffmpeg -i "%VIDEO%" -vf "select='not(mod(n,50))'" -vsync vfr "%OUTDIR%\frame_%%05d.jpg"

echo.
echo Cat xong! Dang nen file RAR...

:: Duong dan RAR.exe (sua neu WinRAR cai o noi khac)
set RARPATH="C:\Program Files\WinRAR\rar.exe"

:: File output RAR:
set RARFILE=%NAME%_frames.rar

:: Nen thu muc
%RARPATH% a -r "%RARFILE%" "%OUTDIR%\*"

echo.
echo Nen thanh cong: %RARFILE%
pause
