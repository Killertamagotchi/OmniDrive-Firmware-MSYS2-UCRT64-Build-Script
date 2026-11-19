@echo off
chcp 65001 > nul
title Domesday Duplicator Complete Master Build System

echo ==================================================================
echo   Starte MSYS2 UCRT64-Umgebung für Building OmniDrive Firmware...
echo ==================================================================
echo.

rem Startet das MSYS2/UCRT64-Terminal und fuehrt die build_omnidrive_DE.sh im aktuellen Verzeichnis aus
C:\msys64\msys2_shell.cmd -ucrt64 -where "%~dp0" -c "./build_omnidrive_DE.sh"

echo.
echo ==================================================================
echo   Der Build-Prozess wurde an MSYS2 übergeben.
echo   Dieses Fenster schliesst sich jetzt. Die Explorer-Fenster 
echo   öffnen sich automatisch, sobald der Build fertig ist!
echo ==================================================================
pause
