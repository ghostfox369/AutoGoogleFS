@echo �۰ʦw��Google�����ɮצ�y
@echo off

echo 00_�s�W�Ȧs��Ƨ�

md "%~dp0gdtemp"

SET "gd_source=https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe"
SET "gd_target=%~dp0gdtemp\GoogleDriveFSSetup.exe"

echo �U���P�w��Google�����ɮצ�y

IF EXIST "%gd_target%" (
    REM nothing
) ELSE (
    bitsadmin /transfer "GoogleDriveFSSetup" /download /priority normal "%gd_source%" "%gd_target%"
)
%gd_target% --silent --desktop_shortcut desktop_shortcut --gsuite_shortcuts=false >nul 2>&1

PAUSE