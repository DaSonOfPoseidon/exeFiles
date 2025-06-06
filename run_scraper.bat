@echo off

set "ROOT=%~dp0.."
set "PYTHONPYCACHEPREFIX=%ROOT%\logs\pycache"
set "TCL_LIBRARY=%ROOT%\embedded_python\tcl\tcl8.6"

if not exist "%PYTHONPYCACHEPREFIX%" (
    mkdir "%PYTHONPYCACHEPREFIX%"
)

echo Updating JobScraper repo...
cd /d "%ROOT%\JobScraper"
git pull origin main

echo Launching JobScraper...
"%ROOT%\embedded_python\python.exe" "%ROOT%\JobScraper\main.py"

pause
