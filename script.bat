@echo off
setlocal enabledelayedexpansion

REM Ensure we run from the script's directory (handles drag-drop, Run from elsewhere, etc.)
cd /d "%~dp0"

echo --------------------------------
echo cgdalex RMSkin Builder v1.0.0
echo --------------------------------
echo Author: Alex Cortes
echo GitHub: https://github.com/cgdalex
echo Email: cgdalex@gmail.com
echo --------------------------------

REM Check required files/dirs exist
if not exist "gifs" (
    echo ERROR: ./gifs/ directory not found.
    echo Please create it and add .gif files as needed.
    echo --------------------------------
    pause
    exit /b 1
)

if not exist "requirements.txt" (
    echo ERROR: requirements.txt not found in script directory.
    echo --------------------------------
    pause
    exit /b 1
)

if not exist "rmskin_builder.py" (
    echo ERROR: rmskin_builder.py not found in script directory.
    echo --------------------------------
    pause
    exit /b 1
)

REM Warn if no .gif files (Python would run but produce nothing useful)
dir /b "gifs\*.gif" 2>nul | findstr . >nul
if errorlevel 1 (
    echo WARNING: ./gifs/ exists but contains no .gif files.
    echo Please add .gif files for RMSkin build. Exiting.
    echo --------------------------------
    pause
    exit /b 1
)

echo Please include .gif files in the ./gifs/ directory for proper RMSkin functionality.
echo --------------------------------

REM Resolve Python (prefer 'python', fallback to 'py -3')
set "PY=python"
where python >nul 2>&1
if errorlevel 1 (
    set "PY=py -3"
    where py >nul 2>&1
    if errorlevel 1 (
        echo ERROR: Neither 'python' nor 'py' found in PATH.
        echo Please install Python and ensure it is in PATH.
        echo --------------------------------
        pause
        exit /b 1
    )
)

echo Starting RMSkin build process...
echo --------------------------------

REM Setup Virtual Environment
if not exist "venv" (
    echo Setting up virtual environment...
    %PY% -m venv venv
    if errorlevel 1 (
        echo ERROR: Failed to create virtual environment.
        echo Ensure Python 'venv' module is available: %PY% -m venv --help
        echo --------------------------------
        pause
        exit /b 1
    )
    echo Virtual environment created.
    echo Activating and installing dependencies...
    call venv\Scripts\activate.bat
    pip install -r requirements.txt
    if errorlevel 1 (
        echo ERROR: pip install failed. Check requirements.txt and network.
        echo --------------------------------
        pause
        exit /b 1
    )
    echo Environment setup complete.
) else (
    echo Virtual environment already exists. Activating...
    call venv\Scripts\activate.bat
)

REM Run the RMSkin builder script (use 'python' so venv interpreter is used)
echo Starting RMSkin builder script...
python rmskin_builder.py
set "BUILD_ERR=!ERRORLEVEL!"
echo --------------------------------
if !BUILD_ERR! neq 0 (
    echo FAILED: RMSkin build ended with errors ^(exit code !BUILD_ERR!^).
    echo Check the output above for details.
    echo --------------------------------
    pause
    exit /b !BUILD_ERR!
)

echo SUCCESS: RMSkin build process completed.
echo --------------------------------
echo Please check the \output directory for your RMSkin folder.
echo --------------------------------
pause
exit /b 0
