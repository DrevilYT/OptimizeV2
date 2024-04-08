::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD9VXheKPWW7B/Uu/e356uS7hkIeQe86dpvI5oCGJe0W+XnidIAk1XVU1sIPA3s=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD9VXheKPWW7B/Uu/e356uS7hkIeQe86dpvI5peBJOUvzmbJO5M10xo=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:home
color c
mode 80, 28
title Drev's Copilot Manager
echo DDDDD   RRRR    EEEEE   V   V
echo D    D  R   R   E       V   V
echo D    D  RRRR    EEE      V V 
echo D    D  R   R   E        V  
echo DDDDD   R    R  EEEE     V  
echo.
echo.
echo 1. Enable Copilot
echo 2. Disable Copilot
echo x. Exit
echo.
echo Note: Copilot Requires Edge.
echo.
set /p choice=Please select your option: 

if "%choice%"=="1" (
    cls
    Echo Enabling Copilot . . . 
    taskkill /f /im explorer.exe > nul 2>&1
    reg delete "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /f > nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d "1" /f > nul
    start explorer.exe
) else if "%choice%"=="2" (
    cls
    taskkill /f /im explorer.exe > nul 2>&1   
    echo Disabling Copilot . . . 
    mkdir C:\DCM
    cd /d c:\DCM
    curl -s -o nopilot.reg "https://drev.evils.in/OptimizeV2/windows/nopilot.reg"
    reg import nopilot.reg
    timeout /t 3 >nul
    start explorer.exe
) else if "%choice%"=="x" (
    exit
)
goto home