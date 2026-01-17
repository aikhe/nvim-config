local M = {}
local voltui = require "volt.ui"

local state = require "volt_test.state"

M.title = function()
  local width = state.w - (state.xpad * 2) - 4
  local line = {
    { "@ ", "VoltTestActive" },
    { "exec.nvim  ", "VoltTestLabel" },
    { "# ", "VoltTestActive" },
    { "Term One  ", "VoltTestLabel" },
    { "_pad_", "" },
    { "≡ ", "VoltTestActive" },
    { "Project  ", "VoltTestActive" },
    { "2026.01", "VoltTestLabel" },
  }

  local lines = { voltui.hpad(line, width) }
  voltui.border(lines)
  return lines
end

M.content = function()
  local lines = {
    {
      {
        "Neovim plugin ",
        "VoltTestPending",
      },
      {
        "managing persistent and reusable terminal sessions",
        "VoltTestActive",
      },
    },
    {
      {
        "Execute shell commands directly without leaving the Neovim editor",
        "VoltTestPending",
      },
    },
    {
      {
        "Integrates terminal workflows tightly with existing Neovim editing flow",
        "VoltTestPending",
      },
    },
    {
      {
        "Reduces context switching between terminal windows and editor buffers",
        "VoltTestPending",
      },
    },
    -- {},
  }

  -- Center the timer like typr does
  local timer_text = "⏱13s"
  local content_width = state.w - (state.xpad * 2)
  local left_pad =
    math.floor((content_width / 2) - (vim.api.nvim_strwidth(timer_text) / 2))
  local timer_line = {
    { string.rep(" ", left_pad), "" },
    { timer_text, "VoltTestActive" },
  }

  -- table.insert(lines, timer_line)

  return lines
end

M.body = function(buf) return {} end

M.bottom_text = function()
  local width = state.w - (state.xpad * 2) -- Full width available

  -- Helper for keys to add padding
  local key = function(char) return { " " .. char .. " ", "VoltTestKey" } end
  local txt = function(str) return { str, "VoltTestLabel" } end

  local line = {
    key "ESC",
    txt " or ",
    key "q",
    txt " - Quit   ",
    key "r",
    txt " - Re-run",
    { "_pad_", "" },
    key "p",
    txt " - Edit commands",
  }
  return { voltui.hpad(line, width) }
end

return M
