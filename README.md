# Basic IDE Config for Neovim 

This is my Personal `nvim` Configuration for daily usage that works completely fine on Linux and MacOS. 

## Install Neovim 

> in this case you'll need Neovim 0.7

### Package Manager 

You can install `nvim` using a package manager, such as brew `brew install neovim`, apt, pacman, etc., but keep in mind that `nvim` may be updated to a newer version when you update packages.

### Source 

If you want to make sure `nvim` is only updated when you want, then I recommend installing from source.

```bash 
$ git clone https://github.com/neovim/neovim.git
$ cd neovim
$ git checkout release-0.7
$ make CMAKE_BUILD_TYPE=Release
$ sudo make install
```

## Install Configuration

Be sure to delete or move your current nvim directory. Run nvim and install all the plugins with:

```bash 
:PackerInstall
```

In addition, the following command can be used to run a series of diagnostic tests to check the state of the Neovim installation. If it detects any problems, it usually offers suggestions on how to fix them or where to find out more

```bash 
:checkhealth
```

## Fonts 

You'll need the [Nerd Fonts](https://www.nerdfonts.com).




