from PIL import Image, ImageSequence
import os

# FIND: .gif file inside the directory to convert into frame png files.    

# Function: Extract Frames
# Description: Extracts frames from a single .gif file extension
# Parameters: 
#            gif -> (str) name of gif file
#            outputDir -> (str) name of the file you want to output the frames to.
def extract_frames(outputDir, gif_file):
    # Extract Frames to @Resources folder in the directory templates/gif_rm_files/
    im = Image.open(gif_file)
    os.makedirs(outputDir, exist_ok=True)
    for i, frame in enumerate(ImageSequence.Iterator(im)):
        frame = frame.convert("RGBA")
        framePath = os.path.join(outputDir, f"frame_{i}.png")
        frame.save(framePath, format="PNG")        
        
# extract_frames("templates/gif_rm_files/@Resources")
        


        
    
