# Rainmeter GIF Skin Builder

> A simple script that converts any GIF into a fully packaged `.rmskin` file for Rainmeter — automatically extracting frames and building the skin structure for you.

> IMPORTANT: zip2rmskin no longer works. As such, the guide to use the project no longer includes the method that uses it.


# Overview

This tool lets you take a **GIF animation** and transform it into a **Rainmeter skin** that animates frame-by-frame.  
It can either:
- **Automatically** extract PNGs from a GIF file, or  
- Use **pre-made PNG frames** from a folder.  

Perfect for customizing your desktop with animated visuals. *If you know what I mean.*

## What This Project Does

- Converts GIFs into PNG frames automatically using [Pillow](https://pillow.readthedocs.io/).  
- Builds the necessary folder structure to create a valid `.rmskin` package with all required assets.  
- Supports manual mode (user-supplied PNGs).  
- Command-line interface for easy automation.

## Requirements

- Python 3.9 or newer  
- [Pillow](https://pypi.org/project/Pillow/) (for GIF frame extraction)  
- Rainmeter (displays the .rmskin file)


## File Structure


```
rmskin-builder/
├── rmskin_builder.py
├── utils/
│   └── gif_tools.py
├── output/
│   └── READTHIS.txt
├── gifs/
│   └── demo.gif
├── examples/
│   └── demo.gif
└── README.md
```
# Windows Guide | Getting Started
1. Clone the repository:
   ```pwsh
   git clone https://github.com/cgdalex/rmskin_builder.git
   ```
2. Inside the Cloned Repo, Install dependencies by:
   ```pwsh
    pip install -r requirements.txt
    ```

3. Place your `.gif` files in the `gifs/` directory.
4. Run the script:
   ```bash
    python rmskin_builder.py
   ```

# Usage
* Make sure you have Python installed and added to your system PATH.*
* Either way, the script creates the necessary virtual environment and installs dependencies automatically.*

- Run the `script.bat` file located in the root directory:

This method will:
- Process all `.gif` files in the `gifs/` directory.
- Generate corresponding Rainmeter skin folders in the `output/` directory.
> The script will skip already processed gifs.

