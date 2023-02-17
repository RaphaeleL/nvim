<img height="150" src="https://raw.githubusercontent.com/RaphaeleL/nvim/main/assets/logo.png" align="right" alt="Logo">

# NaaVim

<b>Useable for </b>
macOS · Linux · (Windows)

> **NaaVim** is my Personal `nvim` Configuration for daily usage that works completely fine on Linux and MacOS. **NaaVim** is a complete ide layer for `nvim` and easily customizable. It includes some useful plugins, but not everything the `nvim` Community provides, for example no dap. Windows should somehow working, it's not tested, maybe with some small changes. Uhh and it's LazyLoading the Plugins, so the startuptime is *Blazyingly Fast*.

## Install

> Neovim 0.8.3

You can install `nvim` using a package manager, but keep in mind that `nvim` may be updated to a newer version when you update packages. This can lead to a plugin suddenly not working anymore.

If you want to make sure `nvim` is only updated when you want, then I recommend installing it from source this way:

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.8.3
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Clone the Repository into `.config/` and start `nvim`. The Configuration is Installing every Plugin, Language Server and Syntax Highlighting automatically.

```bash 
cd ~/.config
git clone https://github.com/RaphaeleL/nvim
```

## Uninstall 

```bash 
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

## Structure

The File Structure explained.

```
~/.config/nvim/
  - lua/                    -- Contains the configuration of NeoVim
    - plugins/*.lua         -- List of the Plugins, sorted by Type 
    - *.lua                 -- Neovim Settings, Keymappings, ... 
  - after/                  -- Automatically Load Vim / Lua Files
    - ftplugin/*.vim        -- some Languages own a setup File (in Vim Script)
  - init.lua                -- the start of every Configuration
```

## Plugins

Plugins are managed by [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

> Remove plugins that you have used less than 5 times in the last 3-4 weeks.

### Basic Plugins

- Better Performance: [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim)
- Some Lua Functions: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- Git Commands: [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- Git Changes: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Fuzzy File Explorer: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Syntax Highlighting: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Colorscheme: [RaphaeleL/my_vivid](https://github.com/RaphaeleL/my_vivid)

### Language Server Protocol

The Language Server Protocol turns a text editor into an IDE with autocompletion.

> Managed by [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim), which is not necessary, but quite more pleasant.

- Lsp Configuration: [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Lsp Package Manager: [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- Lsp Package Manager Configuration: [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- Auto Completion Enginge: [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Auto Completion for Buffer: [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- Auto Completion for Paths: [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- Auto Completion for LSP: [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- Snippet Engine: [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- Snippets: [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

The following plugins are really cool, useful and great. But they are not necessary. Thanks to LazyLoading there are no performance disadvantages through this and can therefore be maintained without any problems.

- Undo History: [mbbill/undotree](https://github.com/mbbill/undotree)
- Classic File Explorer: [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Floating File Explorer: [tamago324/lir.nvim](https://github.com/tamago324/lir.nvim)
- Floating File Explorer Git Extension: [tamago324/lir-git-status.nvim](https://github.com/tamago324/lir-git-status.nvim)
- Show Indentlines: [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- Highlight Words on Hover: [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)
- Some Icons: [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- Notifications: [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- Comments: [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)
- Git Commit View: [rhysd/git-messenger.vim](https://github.com/rhysd/git-messenger.vim)
- Rainbow Brackets: [mrjones2014/nvim-ts-rainbow](https://github.com/mrjones2014/nvim-ts-rainbow)
- Auto Close the Brackets: [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Search and Replace: [cshuaimin/ssr.nvim](https://github.com/cshuaimin/ssr.nvim)

# Acknowledgments

This Configuration is inspired by:

- [NvChad](https://github.com/NvChad)
- [LunarVim](https://github.com/LunarVim)
- [ThePrimeagen](https://github.com/ThePrimeagen)
- [TJ DeVries](https://github.com/tjdevries)

## Showcase

<img src="./assets/demo/Demo-1.png" align="center" alt="Demo1">
<img src="./assets/demo/Demo-2.png" align="center" alt="Demo2">
