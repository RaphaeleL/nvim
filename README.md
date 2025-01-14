# Neovim Configuration 

<b>Useable for </b>
macOS · Linux · Windows

> This is my personal `nvim` configuration for daily use, designed to work seamlessly across Linux, macOS, and Windows. It provides a comprehensive IDE layer for `nvim` that is easily customizable to fit your needs. While it includes several essential plugins, it doesn't aim to include everything the `nvim` community offers—for example, it doesn't include [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap).

## Install

> Neovim 0.11.0-dev

You can install `nvim` using a package manager, but keep in mind that `nvim` may be updated to a newer version when you update packages. This can lead to a plugin suddenly not working anymore.

If you want to make sure `nvim` is only updated when you want, then installing it from source.

Clone the Repository into `.config/` and start `nvim`, automatically every Plugin, Language Server and Syntax Highlighting will be installed.

```bash 
git clone https://github.com/RaphaeleL/nvim ~/.config/nvim
```

## Uninstall 

```bash 
rm -rf $(which nvim)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

# Acknowledgments

This Configuration is inspired by:

- [NvChad](https://github.com/NvChad)
- [LunarVim](https://github.com/LunarVim)
- [ThePrimeagen](https://github.com/ThePrimeagen)
- [T DeVries](https://github.com/tjdevries)
