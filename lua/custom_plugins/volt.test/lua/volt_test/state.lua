local M = {
  ns = vim.api.nvim_create_namespace "VoltTest",
  term_ns = vim.api.nvim_create_namespace "VoltTestTerm", -- Separate namespace for terminal
  checked = false,
  progress = 50,
  xpad = 2,
  w = 80,
  h = 20,

  -- Terminal state
  term_buf = nil,
  term_win = nil,
  term_h = 15, -- Terminal window height

  -- Bottom text window state
  bottom_buf = nil,
  bottom_win = nil,
  bottom_h = 1, -- Bottom window height

  -- User config
  config = {
    border = fale, -- false = invisible border (typr style), true = visible border
    terminal = "powershell", -- terminal to use
  },
}

return M
