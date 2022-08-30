# Basic IDE Layer (Configuration) for Neovim

**NaaVim** is my Personal `nvim` Configuration for daily usage that works completely fine on Linux and MacOS. **NaaVim** is a complete ide layer for `nvim` and easily customizable. it includes some useful plugins, but not everything the nvim community provides, for example no dap.

## Table of Contents

1. [Installation](#installation)
   - [Package Manager](#package-manager)
   - [Source](#source)
2. [Configuration](#configuration)
   - [Font](#font)
   - [Strucutre](#strucutre)
3. [Plugins](#plugins)
   - [Basic-Plugins](#basic-plugins)
   - [UI](#ui)
   - [Lsp](#lsp)
   - [Auto Completion](#auto-completion)
   - [Colorscheme](#colorscheme)
   - [Treesitter](#treesitter)
   - [Snippets](#snippets)
4. [Showcase](#showcase)

## Installation

> Neovim 0.7

### Package-Manager

You can install `nvim` using a package manager, but keep in mind that `nvim` may be updated to a newer version when you update packages. This can lead to a plugin suddenly not working anymore.

### Source

If you want to make sure `nvim` is only updated when you want, then I recommend installing from source.

```
$ git clone https://github.com/neovim/neovim.git
$ cd neovim
$ git checkout release-0.7
$ make CMAKE_BUILD_TYPE=RelWithDebInfo
$ sudo make install
```

## Configuration

Be sure to delete or move your current `nvim` directory. Run `nvim` and install all the plugins with:

```
:PackerInstall
```

In addition, the following command can be used to run a series of diagnostic tests to check the state of the Neovim installation. If it detects any problems, it usually offers suggestions on how to fix them or where to find out more

```
:checkhealth
```

### Font

Use the [Nerd Fonts](https://www.nerdfonts.com) to get some fancy icons.

> [Iosevka Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)

### Structure

The File Strucutre explained.

```
- nvim
    - assets/           -- contains some demo images for the README.md
    - lua/              -- contains the configuration
        - user/         -- Wrapper, so you can name the Plugin Configuration Files can be named like the Plugin name
            - lsp/      -- Lsp Configuration
            - *.lua     -- Each has a Setup File if needed
        - *.lua         -- Basic NaaVim Configuration (Neovim Settings, ...)
    - init.lua          -- the start of the nvim configuration
```

## Plugins

there may well be some configurations files that are not called. for example neotree. i think it is better to have them rather than having to rewrite them.

> Plugins are managed by [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

### Basic Plugins

- Undo History: [mbbill/undotree](https://github.com/mbbill/undotree)
- Comment Blocks: [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)
- Auto Brackets: [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Performance: [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim)
- Required by every second Plugin: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- Run Code: [is0n/jaq-nvim](https://github.com/is0n/jaq-nvim)

### Git

use({ "lewis6991/gitsigns.nvim" })

### Colorscheme

- Colorscheme: [lunarvim/darkplus.nvim](https://github.com/lunarvim/darkplus.nvim)

### Telescope

- File Explorer: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Telescope's Dired: [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)

### Snippets

- Snippet Engine: [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- Snippets: [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

### UI

- Syntax Highlighting: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Icons: [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- Indent Highlighting: [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- Floating Terminal: [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- Shortcut Menu: [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- Tab Bar: [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)
- File Explorer: [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- Menu Bar: [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- Notifications: [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- Dashboard: [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

### LSP

- Lsp Installer / Config: [neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer](https://github.com/neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer)
- Diagnostics / Code Actions / ...: [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Lsp Config with Json: [tamago324/nlsp-settings.nvim](https://github.com/tamago324/nlsp-settings.nvim)

### Auto Completion

- Auto Completion Engine: [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Auto Completion for Buffered words: [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- Auto Completion for Paths: [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- Auto Completion for Commands: [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- Auto Completion for Lsp Stuff: [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- AI Completion: [tzachar/cmp-tabnine](https://github.com/tzachar/cmp-tabnine)

## Showcase

> Demo Pictures will be updated if Neovim 0.8 is released

![Demo-1](./assets/Demo-1.png)
![Demo-2](./assets/Demo-2.png)
![Demo-3](./assets/Demo-3.png)
![Demo-4](./assets/Demo-4.png)
![Demo-5](./assets/Demo-5.png)
