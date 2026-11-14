@echo off
REM Runs start.ps1 with ExecutionPolicy Bypass (the default policy often blocks .ps1 files).
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0start.ps1"
set "EXIT_CODE=%ERRORLEVEL%"
REM Keep the window open so the error message can be read.
pause
exit /b %EXIT_CODE%
