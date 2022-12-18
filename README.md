# NaVim

<b>Useable for </b>
macOS · Linux · (Windows)

> **NaVim** is my Personal `nvim` Configuration for daily usage that works completely fine on Linux and MacOS. **NaaVim** is a complete ide layer for `nvim` and easily customizable. it includes some useful plugins, but not everything the nvim community provides, for example no dap.

## Installation

> Neovim 0.8.1

### Package-Manager

You can install `nvim` using a package manager, but keep in mind that `nvim` may be updated to a newer version when you update packages. This can lead to a plugin suddenly not working anymore.

### Source

If you want to make sure `nvim` is only updated when you want, then I recommend installing from source.

```
$ git clone https://github.com/neovim/neovim.git
$ cd neovim
$ git checkout release-0.8.1
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

Use the [Nerd Fonts](https://www.nerdfonts.com) to get some fancy icons. Such **Nerd Fonts** are not mandatory, but are needed for the display of the icons.

> [Iosevka Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)

```bash
$ curl -fLo "<FONT NAME> Nerd Font Complete.otf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/<FONT_NAME>%20Nerd%20Font%20Complete.otf
```

or for macOS Users via Homebrew:

```bash
$ brew tap homebrew/cask-fonts
$ brew install --cask font-<FONT NAME>-nerd-font
```

### Colorscheme

At the moment one from [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) is in use.

### Structure

The File Structure explained.

```
- nvim
    - lua/              -- contains the configuration of NeoVim
        - *.lua         -- Neovim Settings, Keymappings, ... 
    - after/plugin/
        - *.lua         -- each Plugin has a Setup File (if needed)
    - init.lua          -- the start of every Configuration
```

## Plugins

> Plugins are managed by [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

### Basic Plugins

- Undo History: [mbbill/undotree](https://github.com/mbbill/undotree)
- Better Performance: [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim)
- some Lua Functions: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

### Git

- Gitsigns beside Numbers: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Git Commands in Nvim: [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

### Colorscheme

- Colorscheme: [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)

### Telescope

- File Explorer: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- File Browser: [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)

### Treesitter

- Syntax Highlighting: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### LSP

> Managed by [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)

- Lsp Config: [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Lsp Package Manager: [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- Lsp Package Manager Config: [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- Auto Completion: [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Auto Completion: [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- Auto Completion: [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- Snippets Engine:[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- Snippets: [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- Snippets: [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- Snippets: [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- Snippets: [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

# Performance 

Messured with the `time` Command for a 3000 Line Linux Kernel [File](https://raw.githubusercontent.com/torvalds/linux/master/kernel/auditsc.c):

> Yes, Vim is always faster than NeoVim with plugins will ever be. but compared to the popular LunarVim, NaVim Beta (without LazyLoading!) is twice as fast! NvChad is a faster than NaVim Beta is currently, but LazyLoading is used there. With much larger files (then the 3000 Lines File mentioned), NaVim Beta will be faster.

- NaVim Main: `0,83s`
- NaVim Beta: `0,41s`
- LunarVim Stable: `0,94s`
- LunarVim Rolling: `0,96s`
- NvChad: `0,22s`
- Vim: `0,04s`

# Acknowledgments

This Configuration is inspired by:

- [NvChad](https://github.com/NvChad/NvChad)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [ThePrimeagen](https://github.com/ThePrimeagen)
- [TJ DeVries](https://github.com/tjdevries)
