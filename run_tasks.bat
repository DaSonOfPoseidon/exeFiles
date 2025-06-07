@echo off
rem ─── Compute project root ─────────────────────────────────────────────────
set "ROOT=%~dp0.."

rem ─── Cache prefix & Tcl variables ────────────────────────────────────────
set "PYTHONPYCACHEPREFIX=%ROOT%\logs\pycache"
set "TCL_LIBRARY=%ROOT%\embedded_python\tcl\tcl8.6"

if not exist "%PYTHONPYCACHEPREFIX%" (
    mkdir "%PYTHONPYCACHEPREFIX%"
)

rem ─── Update the TaskScraper repo ─────────────────────────────────────────
echo Updating TaskScraper repo...
cd /d "%ROOT%\TaskScraper"
git pull origin main || exit /b %ERRORLEVEL%

rem ─── Launch the TaskScraper backend ───────────────────────────────────────
echo Launching TaskScraper...
"%ROOT%\embedded_python\python.exe" -X utf8 "%ROOT%\TaskScraper\backend.py" || exit /b %ERRORLEVEL%

exit /b 0
