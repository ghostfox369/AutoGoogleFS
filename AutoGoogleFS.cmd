@echo 自動安裝Google雲端檔案串流
@echo off

echo 00_新增暫存資料夾

md "%~dp0gdtemp"

SET "gd_source=https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe"
SET "gd_target=%~dp0gdtemp\GoogleDriveFSSetup.exe"

echo 下載與安裝Google雲端檔案串流

IF EXIST "%gd_target%" (
    REM nothing
) ELSE (
    bitsadmin /transfer "GoogleDriveFSSetup" /download /priority normal "%gd_source%" "%gd_target%"
)
%gd_target% --silent --desktop_shortcut desktop_shortcut --gsuite_shortcuts=false >nul 2>&1

PAUSE