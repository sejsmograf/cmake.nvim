local Path = require("cmake.utils")

local M = {}

M.get_user_paths = function()
  local cwd = vim.fn.getcwd()
  local source_dir = Path.prompt_path("Enter source dir path: ", cwd)
  assert(Path.dir_exists(source_dir), "Given source directory doesnt exit")

  local cmake_file_path = Path.join_paths(source_dir, CMAKE_FILENAME)
  assert(
    Path.file_exists(cmake_file_path),
    string.format("Source directory MUST contain %s file", CMAKE_FILENAME)
  )

  local build_dir = Path.prompt_path("Enter build dir path: ", Path.join_paths(cwd, "build"))
  if not Path.dir_exists(build_dir) then
    --
  end

  local paths = {
    source_dir = source_dir,
    build_dir = build_dir,
  }

  return paths
end

return M
