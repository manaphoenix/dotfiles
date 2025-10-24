# 🚀 Dotfiles

My personal configuration files for Windows development environment, featuring a cohesive Cyberdream theme across all tools.

## 📦 What's Included

- **Neovim** - Modern Vim configuration with lazy.nvim plugin manager
- **PowerShell** - Custom profile with Oh My Posh prompt
- **WezTerm** - GPU-accelerated terminal emulator configuration
- **Git** - Cross-platform Git configuration and global gitignore

## 🎨 Theme

All configurations use the **Cyberdream** color scheme for a consistent, modern dark theme across the entire development environment.

## 📋 Prerequisites

Before installing these dotfiles, ensure you have the following installed:

- [Neovim](https://neovim.io/) (v0.9.0+)
- [PowerShell 7+](https://github.com/PowerShell/PowerShell)
- [WezTerm](https://wezfurlong.org/wezterm/)
- [Git](https://git-scm.com/)
- [Oh My Posh](https://ohmyposh.dev/)
- A [Nerd Font](https://www.nerdfonts.com/) (FiraCode Nerd Font or JetBrainsMono Nerd Font recommended)

## 🔧 Installation

### 1. Clone the Repository

```powershell
git clone https://github.com/yourusername/dotfiles.git $env:USERPROFILE\dotfiles
```

### 2. Neovim Setup

Create a symbolic link from the Neovim config directory to the dotfiles:

```powershell
# Remove existing config if present
Remove-Item -Path "$env:LOCALAPPDATA\nvim" -Recurse -Force -ErrorAction SilentlyContinue

# Create symbolic link
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dotfiles\nvim"
```

Launch Neovim and lazy.nvim will automatically install all plugins:

```powershell
nvim
```

### 3. PowerShell Profile

Link the PowerShell profile:

```powershell
# Create PowerShell profile directory if it doesn't exist
New-Item -ItemType Directory -Path (Split-Path $PROFILE) -Force

# Create symbolic link or copy the profile
Copy-Item "$env:USERPROFILE\dotfiles\powershell\profile.ps1" -Destination $PROFILE
```

Or add this line to your existing profile:

```powershell
. "$env:USERPROFILE\dotfiles\powershell\profile.ps1"
```

### 4. WezTerm Configuration

Create a symbolic link for WezTerm config:

```powershell
# Remove existing config if present
Remove-Item -Path "$env:USERPROFILE\.config\wezterm" -Recurse -Force -ErrorAction SilentlyContinue

# Create .config directory if it doesn't exist
New-Item -ItemType Directory -Path "$env:USERPROFILE\.config" -Force

# Create symbolic link
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\wezterm" -Target "$env:USERPROFILE\dotfiles\wezterm"
```

### 5. Git Configuration

Link Git configuration files:

```powershell
# Backup existing configs
Copy-Item "$env:USERPROFILE\.gitconfig" "$env:USERPROFILE\.gitconfig.backup" -ErrorAction SilentlyContinue
Copy-Item "$env:USERPROFILE\.gitignore_global" "$env:USERPROFILE\.gitignore_global.backup" -ErrorAction SilentlyContinue

# Create symbolic links
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitconfig" -Target "$env:USERPROFILE\dotfiles\git\.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitignore_global" -Target "$env:USERPROFILE\dotfiles\git\.gitignore_global" -Force
```

**Note:** You'll need to add your personal Git credentials. Create a `.gitconfig-windows` file in the git directory with:

```ini
[user]
    name = Your Name
    email = your.email@example.com
```

## ✨ Features

### Neovim
- **Plugin Manager:** lazy.nvim for fast, lazy-loaded plugins
- **Leader Key:** Space key for custom keybindings
- **Theme:** Cyberdream colorscheme
- **Auto-updates:** Automatic plugin update checking

### PowerShell
- **Prompt:** Oh My Posh with custom Cyberdream theme
- **Aliases:** `vi` command that launches Neovim with auto-clear
- **Auto-completion:** Enhanced file completion for the `vi` command

### WezTerm
- **Theme:** Custom Cyberdream color scheme
- **Font:** FiraCode Nerd Font / JetBrainsMono Nerd Font with fallbacks
- **Opacity:** 88% window background opacity for modern aesthetics
- **Performance:** 165 FPS max, 120 FPS animations
- **Startup:** Automatically centers window at 75% screen size
- **Keybindings:**
  - `Ctrl+Shift+Enter` - Toggle fullscreen
  - `Ctrl+Shift+F` - Search
  - `Ctrl+Shift+T` - New tab
  - `Ctrl+Shift+W` - Close tab

### Git
- **LFS Support:** Git Large File Storage configured
- **Auto-rebase:** Pull requests automatically rebase
- **Auto-prune:** Fetch automatically prunes deleted remote branches
- **Auto-stash:** Rebase automatically stashes changes
- **Aliases:**
  - `git st` - Status
  - `git co` - Checkout
  - `git br` - Branch
  - `git lg` - Pretty log with graph
- **Global Ignore:** Comprehensive gitignore for common files

## 🔄 Updating

To update your dotfiles:

```powershell
cd $env:USERPROFILE\dotfiles
git pull
```

Neovim plugins will auto-update on launch if checker is enabled.

## 🛠️ Customization

Feel free to fork and customize these dotfiles to your preferences:

- **Neovim plugins:** Edit `nvim/lua/plugins/` files
- **Neovim settings:** Modify `nvim/lua/settings.lua`
- **Neovim keymaps:** Update `nvim/lua/keymaps.lua`
- **PowerShell theme:** Customize `powershell/themes/cyberdream.omp.json`
- **WezTerm colors:** Adjust `wezterm/cyberdream.lua`
- **WezTerm settings:** Modify `wezterm/wezterm.lua`

## 📝 Notes

- These dotfiles are primarily designed for Windows but can be adapted for Linux/macOS
- Symbolic links require administrator privileges on Windows
- Make sure to backup your existing configurations before installing

## 📄 License

Feel free to use and modify these dotfiles for your own setup!

---

**Happy coding!** 🎉
