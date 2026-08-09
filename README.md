# Config is still in work so its dont recommend to use it for now
# Hyprland Desktop Environment Configuration

Personal dotfiles and system configurations for a Hyprland-based desktop workflow on CachyOS.

---

## Configuration Overview

This repository tracks core configurations for the Wayland window manager, terminal workspace, system bar, launcher, and system utilities:

* **Window Manager:** Hyprland (Lua configuration, keybindings, autostart, hyprlock)
* **Status Bar:** Waybar (Custom layouts, custom scripts for CPU and package tracking)
* **Application Launcher & Clipboard:** Rofi + Cliphist
* **Notifications:** Mako
* **On-Screen Display (OSD):** SwayOSD (Volume, brightness indicators)
* **Terminal & Shell:** Alacritty + Fish Shell
* **Screen Capture:** Satty
* **System Tools & Theming:** GTK 3.0/4.0, Fontconfig, MangoHud, Goverlay, Btop, Micro editor

---

## Directory Layout

```text
.config/
├── hypr/          # Core Hyprland configuration, keybindings, autostart, hyprlock
├── waybar/        # Waybar layout, CSS styling, and custom shell scripts
├── rofi/          # Rofi themes and cliphist clipboard runner
├── fish/          # Fish shell configs, aliases, and custom functions
├── alacritty/     # Terminal emulator configuration
├── mako/          # Desktop notification daemon rules
├── swayosd/       # Volume and brightness OSD configuration
├── satty/         # Screenshot annotation tool settings
├── MangoHud/      # Hardware monitoring overlay configuration
├── goverlay/      # MangoHud GUI preset settings
├── micro/         # Micro text editor keybindings and settings
├── gtk-3.0/       # GTK 3 theme and dark mode settings
├── gtk-4.0/       # GTK 4 theme settings
├── fontconfig/    # Font alias and rendering rules
├── mimeapps.list  # Default file associations
└── user-dirs.dirs # XDG directory mappings
```


## Prerequisites & Installation
### 1. Install Base Packages
#### On Arch Linux or CachyOS, ensure the necessary dependencies are installed:
```bash
sudo pacman -S --needed \
    hyprland \
    waybar \
    rofi-wayland \
    alacritty \
    fish \
    mako \
    swayosd \
    satty \
    mangohud \
    goverlay \
    btop \
    micro \
    cliphist \
    ttf-font-awesome
```
### 2. Apply Configuration
#### To clone and use these configurations directly in your home directory:
```bash
cd ~
git clone https://github.com/ShadowAngel27/hyprland-config.git ~/.config
```
If you already have existing configs, back them up before cloning:
```bash
mv ~/.config ~/.config.bak
git clone https://github.com/ShadowAngel27/hyprland-config.git ~/.config
```
## License
This repository is shared under the MIT License. Feel free to clone, modify, and adapt for your own setup.





