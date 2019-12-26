@echo 自動安裝Google雲端檔案串流
@echo off

echo 00_新增暫存資料夾

md "%~dp0gdtemp"

SET "gd_source=https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe"
SET "gd_target=%~dp0gdtemp\GoogleDriveFSSetup.exe"
SET "kbfix_source=https://download.microsoft.com/download/C/8/7/C87AE67E-A228-48FB-8F02-B2A9A1238099/Windows6.1-KB3033929-x64.msu"
SET "kbfix_target=%~dp0gdtemp\Windows6.1-KB3033929-x64.msu

echo 下載與安裝Google雲端檔案串流

ver | find "10.0" > nul
if %ERRORLEVEL% == 0 goto win10
 
ver | find "6.1" > nul
if %ERRORLEVEL% == 0 goto win7

:win7
IF EXIST "%kbfix_target%" (
    REM nothing
) ELSE (
    bitsadmin /transfer "KB3033929" /download /priority normal "%kbfix_source%" "%kbfix_target%"
)
WUSA "%kbfix_target%" /quiet /norestart

IF EXIST "%gd_target%" (
    REM nothing
) ELSE (
    bitsadmin /transfer "GoogleDriveFSSetup" /download /priority normal "%gd_source%" "%gd_target%"
)
%gd_target% --silent --desktop_shortcut desktop_shortcut --gsuite_shortcuts=false >nul 2>&1
goto exit


:win10
IF EXIST "%gd_target%" (
    REM nothing
) ELSE (
    bitsadmin /transfer "GoogleDriveFSSetup" /download /priority normal "%gd_source%" "%gd_target%"
)
%gd_target% --silent --desktop_shortcut desktop_shortcut --gsuite_shortcuts=false >nul 2>&1
goto exit

:exit
pause