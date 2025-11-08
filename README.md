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


---
1️⃣ Automatic Mode (GIF input)
```bash
python builder.py --gif *path/to/animation.gif* --name MySkin
---

```🛠️ Project Structure

rmskin-builder/
├── builder.py
├── utils/
│   └── gif_tools.py
├── templates/
│   └── skin.ini.template
├── output/
├── examples/
│   └── demo.gif
└── README.md