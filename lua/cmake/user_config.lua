local Path = require("cmake.utils.path_utils")
local Input = require("cmake.utils.input_utils")
local Json = require("cmake.utils.json_utils")

local M = {}

local function save_user_config(filename, config)
  local json_config = Json.json_encode(config)
  Path.create_file(filename, json_config)
end

local function prompt_user_config()
  local cwd = vim.fn.getcwd()
  local source_dir = Input.prompt_path("Enter source dir path: ", cwd)
  assert(Path.dir_exists(source_dir), "Given source directory doesnt exit")

  local cmakelists_path = Path.join(source_dir, CMAKE_FILENAME)
  assert(
    Path.file_exists(cmakelists_path),
    string.format("Source directory must contain %s file", CMAKE_FILENAME)
  )

  local build_dir =
    Input.prompt_path("Enter build dir path: ", Path.join(source_dir, "build"))
  if not Path.dir_exists(build_dir) then
    if
      Input.prompt_accept("Build dir doesn't exists, it has to be created")
    then
      Path.create_dir(build_dir)
    else
      error("Build directory doesn't exists and no confirmation to create it")
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

  return config
end

M.create_user_config = function()
  local cwd = vim.fn.getcwd()

  if Path.file_exists(Path.join(cwd, CONFIGURATION_FILENAME)) then
    if
      not Input.prompt_accept(
        "Configuration file already exists, do you want to override it?"
      )
    then
      return
    end
  end

  local config = prompt_user_config()
  local filename = Path.join(config.source_dir, CONFIGURATION_FILENAME)
  save_user_config(filename, config)
end

M.get_user_config = function()
  local cwd = vim.fn.getcwd()
  local config_filename = Path.join(cwd, CONFIGURATION_FILENAME)
  assert(
    Path.file_exists(config_filename),
    "No user config found in current dir"
  )
  local data = Path.read_file(config_filename)
  return Json.json_decode(data)
end

return M
