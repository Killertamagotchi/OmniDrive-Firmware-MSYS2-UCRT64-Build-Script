@echo off
chcp 65001 > nul
title Domesday Duplicator Complete Master Build System

echo ==================================================================
echo Starting MSYS2 UCRT64 environment for building OmniDrive Firmware...
echo ==================================================================
echo.

rem Starts the MSYS2/UCRT64 terminal and executes build_omnidrive_EN.sh in the current directory
C:\msys64\msys2_shell.cmd -ucrt64 -where "%~dp0" -c "./build_omnidrive_EN.sh"

echo.
echo ==================================================================
echo The build process has been handed over to MSYS2.
echo This window will now close. The Explorer windows
echo will open automatically once the build is complete!
echo ==================================================================
pause
