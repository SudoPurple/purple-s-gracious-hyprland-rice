# 🌌 Purple's Hyprland Rice

A fully dynamic, Material You-themed Hyprland desktop environment, powered by **Matugen** and configured in **Lua** for maximum customization.

---

## 🎨 Features
* **Lua Configured Hyprland:** All window manager configurations are written programmatically in Lua for clean structure and modularity.
* **Dynamic Color Engine:** Pressing `SUPER + SHIFT + W` cycles the wallpaper and triggers **Matugen** to extract a matching Material color palette, instantly styling Waybar, Rofi, Dunst, Kitty, btop, and your active window borders on-the-fly.

---


## 🛠️ Software Stack & Components
* **WM:** [Hyprland](https://hyprland.org/) (Lua backend)
* **Bar:** [Waybar](https://github.com/Alexays/Waybar)
* **Launcher:** [Rofi](https://github.com/davatorium/rofi)
* **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
* **Notification Daemon:** [Dunst](https://dunst-project.org/)
* **Color Generator:** [Matugen](https://github.com/InioAsgards/matugen)
* **Info Fetcher:** [Fastfetch](https://github.com/fastfetch-cli/fastfetch) (Featuring a custom *Subahibi* quote!)
* **Wallpaper Manager:** `awww-daemon`

---

## ⌨️ Keyboard Shortcuts (Cheat Sheet)

| Keybinding | Action |
|:---|:---|
| `SUPER + Q` | Open Terminal (Kitty) |
| `SUPER + C` | Close Active Window |
| `SUPER + R` | Open App Launcher (Rofi) |
| `SUPER + E` | Open File Manager (Dolphin) |
| `SUPER + V` | Toggle Floating Mode |
| `SUPER + F` | Toggle Fullscreen Mode |
| `SUPER + B` | Open Clipboard History |
| `SUPER + SHIFT + W` | Cycle Wallpaper & Re-color Desktop (Matugen) |
| `SUPER + S` | Toggle Special Workspace (Scratchpad) |
| `SUPER + SHIFT + S` | Move Active Window to Special Workspace |
| `Print Screen` | Take Screenshot (`rishot`) |
| `SUPER + Mouse LMB` | Drag Window |
| `SUPER + Mouse RMB` | Resize Window |

---

## 🚀 Installation & Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/hyprland-rice.git
   cd hyprland-rice
   ```

2. **Run the Symlink Installer:**
   This script will safely back up any of your existing configurations in `~/.config` and create symbolic links pointing directly to this folder:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Required Packages:**
   Make sure you have the core packages installed:
   ```bash
   sudo pacman -S hyprland waybar rofi kitty dunst matugen fastfetch cliphist playerctl brightnessctl wpctl
   ```
