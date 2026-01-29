@echo off

echo --------------------------------
echo cgdalex RMSkin Builder v1.0.0
echo --------------------------------
echo Author: Alex Cortes
echo GitHub: https://github.com/cgdalex
echo Email: cgdalex@gmail.com
echo --------------------------------


echo --------------------------------
echo Please include .gif files in the ./gifs/ directory for proper RMSkin functionality.
echo --------------------------------
if not exist gifs (
    echo Warning: ./gifs/ directory not found. Please create it and add .gif files as needed.
    echo --------------------------------
    exit
)

echo Starting RMSkin build process...
echo --------------------------------
@REM  Setup Virtual Environment
if not exist venv (
    echo Setting up virtual environment...
    python -m venv venv

    echo Virtual environment created.
    echo Activating virtual environment and installing dependencies...
    call venv\Scripts\activate.bat

    pip install -r requirements.txt
    echo Environment setup complete.
) else (
    echo Virtual environment already exists. Activating...
    call venv\Scripts\activate.bat
)
@REM Run the RMSkin builder script
echo Starting RMSkin builder script...
python rmskin_builder.py
echo --------------------------------
echo SUCCESS: RMSkin build process completed.
echo --------------------------------
echo Please check the \output directory for your RMSkin folder.
echo --------------------------------
pause
exit