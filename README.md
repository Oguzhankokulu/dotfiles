# My Dotfiles

Welcome to my personal configuration files (dotfiles) for **Ubuntu**. 
This setup uses **GNOME** with **PaperWM**, **Kitty** terminal, and **Zsh**.

## Preview
![alt text](<Screenshot from 2026-01-02 03-15-39.png>)
![alt text](<Screenshot from 2026-01-02 03-15-20.png>)

## What's Inside?
* **Shell:** Zsh + Starship
* **Terminal:** Kitty
* **Fetch:** Fastfetch (Custom config)
* **Window Management:** PaperWM (GNOME Extension)
* **Theme:** Colloid GTK & Icons
* **Apps:** Vencord (Discord), Spicetify (Spotify)

## Prerequisites

Before installing, ensure you have the necessary tools:

```bash
# 1. Install GNU Stow and Git
sudo apt update
sudo apt install git stow

# 2. Install Zsh (if you haven't already)
sudo apt install zsh
chsh -s $(which zsh)

# 3. Install Kitty
sudo apt install kitty
```

## Installation
1. Clone the Repository

Clone this repo into your home directory (do not clone it directly into ~, keep it in a subfolder):

```bash
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/dotfiles
cd ~/dotfiles
```

2. Apply Configs (Stow)

Use GNU Stow to create symlinks for your configurations. This will link the files in this folder to your actual home directory.

```bash
# Link core configs
stow zsh
stow kitty
stow fastfetch

# Link app configs
stow vencord
stow spicetify

# Link themes and icons
stow ui

# Link GNOME extensions (PaperWM, etc.)
stow gnome-extensions
```

Note: If you get a conflict error, it means a default config file already exists. Back it up or delete it, then run stow again.

3. Restore System Settings (GTK Theme & PaperWM)

GNOME settings (like the Colloid theme, PaperWM keybinds, and hidden dock settings) are stored in the dconf database, not files. To restore them:

```bash
# Load the settings from the backup file
dconf load / < backup-misc/gnome_settings_backup.dconf
```

Structure

This repo follows the standard GNU Stow directory structure.

4. Obsidian Note

Obsidian settings are stored in the backup-misc folder. You must manually copy the .obsidian folder into your Vault:

```bash
cp -r ~/dotfiles/backup-misc/.obsidian /path/to/your/obsidian/vault/
```