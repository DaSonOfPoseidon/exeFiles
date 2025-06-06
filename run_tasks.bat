@echo off

set "ROOT=%~dp0.."
set "PYTHONPYCACHEPREFIX=%ROOT%\logs\pycache"
set "TCL_LIBRARY=%ROOT%\embedded_python\tcl\tcl8.6"

if not exist "%PYTHONPYCACHEPREFIX%" (
    mkdir "%PYTHONPYCACHEPREFIX%"
)

echo Updating repo...
cd /d "%ROOT%\TaskScraper"
git pull origin main

echo Launching program...
"%ROOT%\embedded_python\python.exe" "%ROOT%\TaskScraper\backend.py"

pause