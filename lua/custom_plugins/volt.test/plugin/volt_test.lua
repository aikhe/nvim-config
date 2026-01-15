vim.api.nvim_create_user_command(
  "VoltTest",
  function() require("volt_test").open() end,
  {}
)

vim.keymap.set(
  "n",
  "<leader>et",
  function() require("exec").toggle() end,
  { desc = "Toggle exec" }
)
