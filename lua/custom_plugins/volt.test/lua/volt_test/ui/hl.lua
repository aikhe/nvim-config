local api = vim.api
local mix = require("volt.color").mix
local get_hl = require("volt.utils").get_hl
local lighten = require("volt.color").change_hex_lightness
local state = require "volt_test.state"

return function(ns)
  local bg

  if vim.g.base46_cache then
    local colors = dofile(vim.g.base46_cache .. "colors")
    bg = colors.black
  else
    bg = get_hl("Normal").bg
  end

  local transparent = not bg

  if transparent then
    bg = "#000000"
  end

  if state.config.border then
    -- Visible border: window bg same as editor, border is lighter
    local border_fg = lighten(bg, 15)
    api.nvim_set_hl(ns, "Normal", { bg = bg })
    api.nvim_set_hl(ns, "FloatBorder", { fg = border_fg, bg = bg })
    -- Terminal same as main window when border is visible
    api.nvim_set_hl(state.term_ns, "Normal", { bg = bg })
    api.nvim_set_hl(state.term_ns, "FloatBorder", { fg = border_fg, bg = bg })
  else
    -- Invisible border (typr style): window bg is slightly lighter, border matches
    local window_bg = lighten(bg, 2)
    api.nvim_set_hl(ns, "Normal", { bg = window_bg })
    api.nvim_set_hl(ns, "FloatBorder", { fg = window_bg, bg = window_bg })
    -- Terminal darker when border is invisible
    local term_bg = lighten(bg, -2) -- Darker than editor bg
    api.nvim_set_hl(state.term_ns, "Normal", { bg = term_bg })
    api.nvim_set_hl(state.term_ns, "FloatBorder", { fg = term_bg, bg = term_bg })
  end

  -- FoldColumn for terminal padding
  api.nvim_set_hl(state.term_ns, "FoldColumn", { bg = "NONE" })

  -- Correct word (Green)
  api.nvim_set_hl(ns, "VoltTestCorrect", { fg = "#a6e3a1" })
  -- Pending word (Grey)
  api.nvim_set_hl(ns, "VoltTestPending", { fg = "#585b70" })
  -- Active word (White)
  api.nvim_set_hl(ns, "VoltTestActive", { fg = "#cdd6f4", bold = true })

  -- Keycap style (e.g. for ESC, q)
  api.nvim_set_hl(ns, "VoltTestKey", { fg = "#cdd6f4", bg = "#313244" })
  -- Label style (e.g. 'Symbols', 'Lines')
  api.nvim_set_hl(ns, "VoltTestLabel", { fg = "#9399b2" })
  -- Accent/Icon style
  api.nvim_set_hl(ns, "VoltTestAccent", { fg = "#f38ba8" }) -- Redish/Pink for 'Lines'
end
