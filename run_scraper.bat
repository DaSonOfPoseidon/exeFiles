@echo off
rem ─── Compute project root (parent of this batFiles folder) ─────────────────
set "ROOT=%~dp0.."

rem ─── Cache prefix & Tcl variables ────────────────────────────────────────
set "PYTHONPYCACHEPREFIX=%ROOT%\logs\pycache"
set "TCL_LIBRARY=%ROOT%\embedded_python\tcl\tcl8.6"

if not exist "%PYTHONPYCACHEPREFIX%" (
    mkdir "%PYTHONPYCACHEPREFIX%"
)

rem ─── Update the JobScraper repo ──────────────────────────────────────────
echo Updating JobScraper repo...
cd /d "%ROOT%\JobScraper"
git pull origin main || exit /b %ERRORLEVEL%

rem ─── Launch the JobScraper GUI ───────────────────────────────────────────
echo Launching JobScraper...
"%ROOT%\embedded_python\python.exe" "%ROOT%\JobScraper\main.py" || exit /b %ERRORLEVEL%

rem ─── Done ─────────────────────────────────────────────────────────────────
exit /b 0
