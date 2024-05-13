# Cmake.nvim

Simple Neovim plugin which integrates basic _cmake_ commands straight to your editor. 
It allows to configure, build and run your project without leaving the editor. 
Standard output of _cmake_ commands is shown in convenient popup window.

## Dependencies
- [cmake](https://cmake.org/) - you of course need _cmake_ installed on your system


## Usage
This plugin provides the command 
`:CM` which you can use with one of the following arguments:
| Argument | Description |
| --- | --- |
| `init` | Initializes cmake.nvim plugin inside the directory. Requires you to have _CMakeLists.txt_ inside it |