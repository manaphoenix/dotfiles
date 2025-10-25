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
- **Build tools** (optional, for enhanced plugin features):
  - [Visual Studio Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/) or [MinGW](http://www.mingw.org/) with `make` for telescope-fzf-native performance boost

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
## 🔌 Plugins

### Plugin Manager
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager with fast, lazy loading

### Core Functionality
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
- **[mason.nvim](https://github.com/mason-org/mason.nvim)** - Package manager for LSP servers and tools
- **[mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)** - Mason LSP bridge
- **[mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)** - Auto-install LSP tools
- **[blink.cmp](https://github.com/saghen/blink.cmp)** - Fast completion engine
- **[blink-cmp-wezterm](https://github.com/junkblocker/blink-cmp-wezterm)** - WezTerm integration for blink.cmp

### UI & Interface
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Beautiful dashboard with custom ASCII art
- **[cyberdream.nvim](https://github.com/scottmckendry/cyberdream.nvim)** - Modern dark theme with Cyberdream colors
- **[noice.nvim](https://github.com/folke/noice.nvim)** - Enhanced UI for messages and command line
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Key binding hints and help
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons with Nerd Font support

### File Management
- **[oil.nvim](https://github.com/stevearc/oil.nvim)** - File explorer with mini.icons support
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder with multiple extensions
- **[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** - FZF integration for Telescope
- **[telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)** - UI select integration for Telescope

### Code Enhancement
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and parsing
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration with signs and blame
- **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** - Live markdown preview

### Utilities
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** - Collection of small QoL plugins (input handling enabled)
- **[mini.icons](https://github.com/nvim-mini/mini.icons)** - Icon provider
- **[mini.statusline](https://github.com/nvim-mini/mini.statusline)** - Lightweight statusline
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** - LSP status indicators
- **[vim-sleuth](https://github.com/tpope/vim-sleuth)** - Automatic indentation detection

### Development Tools
- **[venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)** - Python virtual environment selector
- **[uv.nvim](https://github.com/benamahony/uv.nvim)** - Python package management integration
- **[nvim-silicon](https://github.com/michaelrommel/nvim-silicon)** - Code screenshot generation with FiraCode Nerd Font

### Plugin Features
- **Lazy Loading:** All plugins are lazy-loaded for optimal startup performance
- **Auto-updates:** Plugin updates are automatically checked on startup
- **Dependencies:** All plugin dependencies are automatically managed
- **Integration:** Seamless integration with Cyberdream theme across all plugins

## 🔄 Updating

```powershell
cd $env:USERPROFILE\dotfiles
git pull
```

Neovim plugins will auto-update on launch if checker is enabled.

## 📄 Repository Files

This repository includes standard GitHub repository files:

- **[LICENSE](LICENSE)** - MIT License for usage and distribution
- **.gitignore** - Repository-specific files to ignore

## 📝 Notes

- These dotfiles are primarily designed for Windows but can be adapted for Linux/macOS
- Symbolic links require administrator privileges on Windows
- Make sure to backup your existing configurations before installing

---

**Happy coding!** 🎉
