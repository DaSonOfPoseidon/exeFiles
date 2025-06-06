@echo off
cd /d "%~dp0"
set PYLIB=embedded_python\Lib
set PYTHONPYCACHEPREFIX=./logs/pycache
set TCL_LIBRARY=%~dp0embedded_python\tcl\tcl8.6

echo Updating repo...
cd ..\JobScraper
git pull origin main
cd /d "%~dp0

REM === Launch app ===
set PYTHONPATH=%CD%\embedded_python\lib
embedded_python\python.exe ..\JobScraper\main.py

pause
