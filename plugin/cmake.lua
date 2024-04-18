local commands = require("cmake.commands")

vim.api.nvim_create_user_command(
  "CMI",
  commands.initialize_cmake_plugin,
  { desc = "Initialize cmake.nvim configuration" }
)
