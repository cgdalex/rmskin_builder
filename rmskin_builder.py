from utils.gif_tools import extract_frames
from pathlib import Path
import os

#################################################
# RM Skin Folder Builder--
# Creating all necessary files to create a displaying .gif file
#   for RainMeter.
# Dependencies: 
#           (Module) Pillow -- Image Manipulation Library
#                       (Necessary for creating png files of .gif file frames)
#################################################
gifs_directory = os.listdir("gifs")
for file in gifs_directory:
    if file.endswith('.gif'):
        gif_file = "gifs/" + file
        print(".gif file found: ", gif_file) 
        
        # Get gif file without extension for outputDir parameter
        gif_without_extension = Path(gif_file).stem
        skin_path = f"templates/{gif_without_extension}"
        frames_path = f"{skin_path}/@Resources"

        # Check's to see if folder is already made.
        if os.path.exists(skin_path):
            print(f"ERROR: {skin_path} already exists.")
            print("Please try another gif...\n")
            continue

        # Extracts Frames into specified folder
        extract_frames(frames_path, gif_file)

        # Finds how many frames images there are
        n_frames = 0
        frames = os.listdir(f"{frames_path}")
        for file in frames:
            n_frames += 1

        # IMPORTANT: Constructs the .ini file for rainmeter to process the skin
        txt_lines = [
            ';The Bigger the update value, the slower the image will move and vice versa.\n',
            '[Rainmeter]\n',
            'Update=100\n\n'
            '[Metadata]\n',
            'Name=GIFFrames\n',
            'Author=Rainmeter Team\n',
            'Information=Displays a deconstructed .gif file (individual frames) as if it was a .gif file.\n',
            'Version=Jan 16, 2016\n',
            'License=Creative Commons Attribution-Non-Commercial-Share Alike 3.0\n\n',
            '[ImageNumberCalc]\n',
            'Measure=Calc\n',
            f'Formula=Counter % {n_frames}\n\n',
            '[ImageMeter]\n',
            'Meter=Image\n',
            'ImageName=#@#frame_[ImageNumberCalc].png\n',
            ';If you want to edit the size of the gif, uncomment the next two lines\n',
            ';W={//WIDTH}\n',
            ';H={//HEIGHT}\n',
            'AntiAlias=1\n',
            'DynamicVariables=1\n'
        ]
        
        with open(f"{skin_path}/{gif_without_extension}.ini", "w") as f:
            f.writelines(txt_lines)
        print(f"Successfully created RainMeter skin folder in /{skin_path}\n")
        
    else:
        print(f"{file} is not a .gif file. Skipping...\n")
        continue
