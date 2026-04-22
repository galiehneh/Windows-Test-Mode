@echo off
REM
REM script untuk masuk windows test mode
REM jalankan untuk memulai main games hypervisor
REM github.com/galiehneh
REM
REM Check for administrator privileges
net session >"%temp%\nul" 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges.
    echo Requesting elevation now...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
)
bcdedit /set nointegritychecks on
bcdedit /set testsigning on
echo PC akan restart setelah tekan [Enter]
echo [Close] window ini untuk cancel dan restart PC manual
pause
shutdown -t 01 -r -f
