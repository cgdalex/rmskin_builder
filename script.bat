@echo off
echo Please include .gif files in the ./gifs/ directory for proper RMSkin functionality.
if not exist gifs (
    echo Warning: ./gifs/ directory not found. Please create it and add .gif files as needed.
)

echo Starting RMSkin build process...
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
echo RMSkin build process complete.
echo Please check the templates directory for your RMSkin folder.