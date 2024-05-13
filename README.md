# Cmake.nvim

Simple Neovim plugin which integrates basic _cmake_ commands straight to your editor. 
It allows to configure, build and run your project without leaving the editor. 
Standard output of _cmake_ commands is shown in convenient popup window.

## Dependencies
- [cmake](https://cmake.org/) - _cmake_ is required to call the commands


## Installation
To install the plugin, you can use your favorite plugin manager.
For example, if you are using [lazy.nvim](https://github.com/folke/lazy.nvim) just add 
the following line to your _init.lua file:
```
{"sejsmograf/cmake.nvim"}
```

## Usage
This plugin provides the command 
`:CM` which you can use with one of the following arguments:
| Argument | Description |
| --- | --- |
| `init` | Initializes cmake.nvim plugin inside the directory. Requires you to have _CMakeLists.txt_ inside it. _This command will create .cmake.nvim.json_ file, for storing your plugin configuration |
| `configure` | Calls cmake to configure the project. Uses the configuration from .cmake.nvim.json file. |
| `build` | Uses cmake to build the project. |
| `run` | Run the executable defined in CMakeLists.txt. and .cmake.nvim.json file. Shows the output in a popup window. |


## Todos
- Add more extensible configuration options
- Provide a way to call the commands asynchrounously
- Pass custom arguments to cmake commands