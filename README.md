<img height="150" src="https://raw.githubusercontent.com/RaphaeleL/nvim/main/assets/logo.png" align="right" alt="Logo">

# NaaVim

<b>Useable for </b>
macOS · Linux · (Windows)

> **NaaVim** is my Personal `nvim` Configuration for daily usage that works completely fine on Linux and MacOS. **NaaVim** is a complete ide layer for `nvim` and easily customizable. it includes some useful plugins, but not everything the nvim community provides, for example no dap. Windows should somehow working, it's not Tested. Maybe with some small Changes.

## Install

> Neovim 0.8.1

You can install `nvim` using a package manager, but keep in mind that `nvim` may be updated to a newer version when you update packages. This can lead to a plugin suddenly not working anymore.

If you want to make sure `nvim` is only updated when you want, then I recommend installing from source this way:

```
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8.1
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Clone the Repository into `.config/` and start `nvim`. The Configuration is Installing every Plugin, Language Server and Syntax Highlighting automatically. Maybe you need to Restart `nvim`, that Treesitter is reloading everything too.

## Uninstall 

```bash 
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

## Structure

The File Structure explained.

```
- nvim
  - lua/              -- contains the configuration of NeoVim
    - *.lua           -- Neovim Settings, Keymappings, ... 
  - after/
    - plugin/*.lua    -- each Plugin has a Setup File 
    - ftplugin/*.vim  -- each Language has specific Settings 
  - init.lua          -- the start of every Configuration
```

## Plugins

> Plugins are managed by [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

### Basic Plugins

- Undo History: [mbbill/undotree](https://github.com/mbbill/undotree)
- Better Performance: [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim)
- Some Lua Functions: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- Git Commands: [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- Git Changes: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Colorscheme: [rose-pine/neovim](https://github.com/rose-pine/neovim)
- File Explorer: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Syntax Highlighting: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### Language Server Protocol

> Managed by [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

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

- [NaaVim](https://github.com/RaphaeleL/nvim): `0,22s` 
  - with [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) and no [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) 
  - with [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) the Performance is `0.54s` 
  - see `assets/time_proof_packer.png`
- [NaaVim](https://github.com/RaphaeleL/nvim): `0,31s` 
  - with [folke/lazy.nvim](https://github.com/folke/lazy.nvim) and [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) 
  - with LazyLoading
  - see `assets/time_proof_lazy.png`
- [NvChad](https://github.com/NvChad/NvChad): `0,32s` 
  - with [LazyLoading](https://github.com/NvChad/NvChad#what-is-it)
- [ThePrimeagen's Config](https://github.com/ThePrimeagen): `0,41s`
- [TJ DeVries' Config](https://github.com/tjdevries): `0,71s`
- [CraftzDog's Config](https://github.com/craftzdog): `0,84s`
- [Adam Elmore's Config](https://github.com/adamelmore): `0,94s`
- [LunarVim Stable](https://github.com/LunarVim/LunarVim): `0,94s`
- [LunarVim Rolling](https://github.com/LunarVim/LunarVim/tree/rolling): `0,96s`
- [Christian Chiarulli's Config](https://github.com/ChristianChiarulli): `2,60s`

> [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) compares the code with the current Git changes, so there can be a huge delay when opening `nvim`. 

# Acknowledgments

This Configuration is inspired by:

- [NvChad](https://github.com/NvChad/NvChad)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [ThePrimeagen](https://github.com/ThePrimeagen)
- [TJ DeVries](https://github.com/tjdevries)

<!-- ## Showcase -->
<!--  -->
<!-- > Some small details are not up to date (like Lualine, Winbar/Navic and WhichKey), but there are not new Pictures after every new Plugin :D -->
<!--  -->
<!-- ![Demo-1](./assets/Demo_1.png) -->
<!-- ![Demo-2](./assets/Demo_2.png) -->
<!-- ![Demo-3](./assets/Demo_3.png) -->
<!-- ![Demo-4](./assets/Demo_4.png) -->
<!-- ![Demo-5](./assets/Demo_5.png) -->
<!-- ![Demo-6](./assets/Demo_6.png) -->
<!-- ![Demo-7](./assets/Demo_7.png) -->
