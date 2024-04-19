local Path = require("cmake.path_utils")
local Input = require("cmake.input_utils")
local Json = require("cmake.json_utils")

local M = {}

M.get_user_paths = function()
  local cwd = vim.fn.getcwd()
  local source_dir = Input.prompt_path("Enter source dir path: ", cwd)
  assert(Path.dir_exists(source_dir), "Given source directory doesnt exit")

  local cmakenvim_config_path = Path.join(source_dir, CONFIGURATION_FILENAME)
  if Path.file_exists(cmakenvim_config_path) then
    if
      Input.prompt_accept(
        "\nIt looks like you already initialized the plugin in this directory. Do you want to override it?"
      ) == true
    then
      print(Path.read_file(cmakenvim_config_path))
    else
    end
  end

  local cmakelists_path = Path.join(source_dir, CMAKE_FILENAME)
  assert(
    Path.file_exists(cmakelists_path),
    string.format("Source directory MUST contain %s file", CMAKE_FILENAME)
  )

  local build_dir = Input.prompt_path("Enter build dir path: ", Path.join(cwd, "build"))
  if not Path.dir_exists(build_dir) then
    if Input.prompt_accept("Build dir doesn't exists, it has to be created") then
      Path.create_dir(build_dir)
    else
      error("Build directory doesn't exists and no will to create id")
    end
  end

  local exec_name = vim.fn.input({
    prompt = "\nEnter executable file name: ",
    default = "main",
  })

  local config = {
    source_dir = source_dir,
    build_dir = build_dir,
    exec_name = exec_name,
  }

  Path.create_file(cmakenvim_config_path, Json.json_encode(config))
end

return M
