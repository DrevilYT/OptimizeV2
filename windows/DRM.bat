@echo off
setlocal

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :main
) else (
    goto :elevate
)

:elevate
:: Relaunch the script with administrative privileges
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\elevate.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\elevate.vbs"
"%temp%\elevate.vbs"
exit /b

:main
color C
mode 80, 28
title Drev's Resolution Manager
echo DDDDD   RRRR    EEEEE   V   V
echo D    D  R   R   E       V   V
echo D    D  RRRR    EEE      V V 
echo D    D  R   R   E        V  
echo DDDDD   R    R  EEEE     V  
echo.
echo.
echo 1. 1920 x 1080
echo 2. 1366 x 768
echo 3. 1024 x 768
echo 4. 800 x 600
echo 5. 640 x 480
echo c. Custom Resolution
echo x. Exit
echo.
set /p choice=Please select your option: 

if "%choice%"=="1" call :changeRes 1920 1080
if "%choice%"=="2" call :changeRes 1366 768
if "%choice%"=="3" call :changeRes 1024 768
if "%choice%"=="4" call :changeRes 800 600
if "%choice%"=="5" call :changeRes 640 480
if "%choice%"=="c" call :customRes
if "%choice%"=="x" exit

goto :main

:changeRes
echo.
echo Enter desired refresh rate (Hz):
echo.
set /p refreshRate=Refresh Rate: 
curl -s -o QRes.exe "https://drev.uk.to/dl/QRes.exe"
QRes.exe /x:%1 /y:%2 /r:%refreshRate%
del QRes.exe
goto :eof

:customRes
cls
echo DDDDD   RRRR    EEEEE   V   V
echo D    D  R   R   E       V   V
echo D    D  RRRR    EEE      V V 
echo D    D  R   R   E        V  
echo DDDDD   R    R  EEEE     V  
echo.
echo.
echo Enter custom resolution:
echo.
set /p customWidth=Width: 
echo.
set /p customHeight=Height: 
call :changeRes %customWidth% %customHeight%
goto :eof