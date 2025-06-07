@echo off
rem ─── Compute project root ─────────────────────────────────────────────────
set "ROOT=%~dp0.."

rem ─── Cache prefix & Tcl variables ────────────────────────────────────────
set "PYTHONPYCACHEPREFIX=%ROOT%\logs\pycache"
set "TCL_LIBRARY=%ROOT%\embedded_python\tcl\tcl8.6"

if not exist "%PYTHONPYCACHEPREFIX%" (
    mkdir "%PYTHONPYCACHEPREFIX%"
)

rem ─── Update the JobAssignment repo ───────────────────────────────────────
echo Updating JobAssignment repo...
cd /d "%ROOT%\JobAssignment"
git pull origin main || exit /b %ERRORLEVEL%

rem ─── Launch the Assigner script ──────────────────────────────────────────
echo Launching Assigner...
"%ROOT%\embedded_python\python.exe" -X utf8 "%ROOT%\JobAssignment\ASSigner.py" || exit /b %ERRORLEVEL%

exit /b 0
