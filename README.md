<img height="150" src="https://raw.githubusercontent.com/RaphaeleL/nvim/main/assets/logo.png" align="right" alt="Logo">

# NaaVim - beta

<b>Useable for </b>
macOS · Linux · (Windows)

> **NaaVim** is my Personal `nvim` Configuration for daily usage that works completely fine on Linux and MacOS. **NaaVim** is a complete ide layer for `nvim` and easily customizable. it includes some useful plugins, but not everything the nvim community provides, for example no dap.

> Checkout the [Performance Test's](https://github.com/RaphaeleL/nvim/tree/beta#performance) of NaaVim Beta

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
- Some Lua Functions: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- Git Commands: [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- Colorscheme: [rose-pine/neovim](https://github.com/rose-pine/neovim)
- File Explorer: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
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

- [NaaVim Beta v2](https://github.com/RaphaeleL/nvim/tree/beta): `0,24s` (without [lewis6991/gitsigns](https://github.com/lewis6991/gitsigns.nvim))
- [NvChad](https://github.com/NvChad/NvChad): `0,32s` (LazyLoading [Reference](https://github.com/NvChad/NvChad#what-is-it))
- [NaaVim Beta](https://github.com/RaphaeleL/nvim/tree/beta): `0,38s`
- [ThePrimeagen's Config](https://github.com/ThePrimeagen): `0,41s`
- [NaaVim Main](https://github.com/RaphaeleL/nvim): `0,83s`
- [CraftzDog's Config](https://github.com/craftzdog): `0,84s`
- [Adam Elmore's Config](https://github.com/adamelmore): `0,94s`
- [LunarVim Stable](https://github.com/LunarVim/LunarVim): `0,94s`
- [LunarVim Rolling](https://github.com/LunarVim/LunarVim/tree/rolling): `0,96s`
- [Christian Chiarulli's Config](https://github.com/ChristianChiarulli): `2,60s`

# Acknowledgments

This Configuration is inspired by:

- [NvChad](https://github.com/NvChad/NvChad)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [ThePrimeagen](https://github.com/ThePrimeagen)
- [TJ DeVries](https://github.com/tjdevries)
