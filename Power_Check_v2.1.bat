@set "params=%*"&cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/c cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@echo off
Title Power Check v2.1

ping -n 1.2 localhost >nul
set /P c=Welcome to Sonic's power check program! Thanks to Just Joey for all of the help to make the program run from a singular file. Would you like to check your system for power issues? [Y/N]
if /I "%c%" EQU "Y" goto :continue
if /I "%c%" EQU "N" goto :quit
goto :choice
:continue
cls
ping -n 2 localhost >nul
echo=
powercfg /energy
ping -n 5 localhost >nul
echo Thank you for using Sonic's power check!
ping -n 1.7 localhost >nul
:choice
set /P c=Would you like to delete the report file now? [Y/N]
if /I "%c%" EQU "Y" goto :del
if /I "%c%" EQU "N" goto :continue
goto :choice

:del
del energy-report.html
cls
:continue
cls
ping -n 2 localhost >nul
:choice
set /P c=Are you sure you want to restart your computer? [Y/N]
if /I "%c%" EQU "Y" goto :restart
if /I "%c%" EQU "N" goto :norestart
goto :choice

:restart
shutdown -r -t 0

:norestart
:quit
Exit

