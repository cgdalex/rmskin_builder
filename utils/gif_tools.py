from PIL import Image, ImageSequence
import os

# Function: Extract Frames
# Description: Extracts frames from a single .gif file extension
# Parameters: 
#            gif -> (str) name of gif file
#            outputDir -> (str) name of the file you want to output the frames to.
def extract_frames(outputDir, gif_file):
    im = Image.open(gif_file)
    os.makedirs(outputDir, exist_ok=True)
    for i, frame in enumerate(ImageSequence.Iterator(im)):
        frame = frame.convert("RGBA")
        framePath = os.path.join(outputDir, f"frame_{i}.png")
        frame.save(framePath, format="PNG")        
