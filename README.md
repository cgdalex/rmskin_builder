# 🎨 Rainmeter GIF Skin Builder

> A simple script that converts any GIF into a fully packaged `.rmskin` file for Rainmeter — automatically extracting frames and building the skin structure for you.

---

## 🧩 Overview

This tool lets you take a **GIF animation** and transform it into a **Rainmeter skin** that animates frame-by-frame.  
It can either:
- 🎞️ **Automatically** extract PNGs from a GIF file, or  
- 📂 Use **pre-made PNG frames** from a folder.  

Perfect for customizing your desktop with animated visuals!

---

## ⚙️ Features

- 🖼️ Converts GIFs into PNG frames automatically using [Pillow](https://pillow.readthedocs.io/).  
- 📦 Builds a valid `.rmskin` package with all required assets.  
- 🧰 Supports manual mode (user-supplied PNGs).  
- ⚡ Command-line interface for easy automation.

---

## 🧰 Requirements

- Python 3.9 or newer  
- [Pillow](https://pypi.org/project/Pillow/) (for GIF frame extraction)  
- Rainmeter (to test the generated skin)

Install dependencies:
```bash
pip install Pillow
```
---

##🛠️ Project Structure

rmskin-builder/
├── rmskin_builder.py
├── utils/
│   └── gif_tools.py
├── templates/
│   └── READTHIS.txt
├── gifs/
│   └── demo.gif
├── output/
├── examples/
│   └── demo.gif
└── README.md

## 🚀 Getting Started: Method #1
1. Clone the repository:
   ```bash
   git clone [text](https://github.com/cgdalex/rmskin_builder.git)
   ```
2. Install dependencies:
   ```bash
    pip install -r requirements.txt
    ```
3. Place your `.gif` files in the `gifs/` directory.
4. Run the script:
   ```bash
    python rmskin_builder.py
   ```

## 🚀 Getting Started: Method #2 - Using the script.bat (Windows)
Easier way to run the script since the project is mainly built for Windows users.
* Make sure you have Python installed and added to your system PATH.*
* Either way, the script creates the necessary virtual environment and installs dependencies automatically.*

- Run the `script.bat` file located in the root directory:
```bash
    ./script.bat
```

Both methods will:
- Process all `.gif` files in the `gifs/` directory.
- Generate corresponding Rainmeter skin folders in the `output/` directory.

---## 📄 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

