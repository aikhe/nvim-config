local volt = require "volt"
local state = require "volt_test.state"
local terminal = require "volt_test.terminal"

local M = {}

--- Create bottom text window
local function create_bottom_window(row)
  state.bottom_buf = vim.api.nvim_create_buf(false, true)

  local win_opts = {
    relative = "editor",
    width = state.w,
    height = state.bottom_h,
    col = (vim.o.columns - state.w) / 2,
    row = row,
    style = "minimal",
    border = "single",
  }

  state.bottom_win = vim.api.nvim_open_win(state.bottom_buf, false, win_opts)
  vim.api.nvim_win_set_hl_ns(state.bottom_win, state.ns)

  local bottom_layout = require "volt_test.ui.bottom_layout"

  volt.gen_data {
    {
      buf = state.bottom_buf,
      layout = bottom_layout,
      xpad = state.xpad,
      ns = state.ns,
    },
  }

  volt.run(state.bottom_buf, {
    h = state.bottom_h,
    w = state.w,
  })
end

M.open = function()
  -- First, generate layout to get actual height
  state.buf = vim.api.nvim_create_buf(false, true)

  local layout_sample = require "volt_test.ui.layout"

  volt.gen_data {
    {
      buf = state.buf,
      layout = layout_sample,
      xpad = state.xpad,
      ns = state.ns,
    },
  }

  state.h = require("volt.state")[state.buf].h

  -- Calculate total height of all windows (main + terminal + bottom + borders/spacing)
  local total_h = state.h + 2 + state.term_h + 2 + state.bottom_h + 2 -- +2 for each border
  local start_row = math.floor((vim.o.lines - total_h) / 2)

  -- Create main window
  local main_opts = {
    relative = "editor",
    width = state.w,
    height = state.h,
    col = (vim.o.columns - state.w) / 2,
    row = start_row,
    style = "minimal",
    border = "single",
  }

  state.win = vim.api.nvim_open_win(state.buf, true, main_opts)

  require "volt_test.ui.hl"(state.ns)
  vim.api.nvim_win_set_hl_ns(state.win, state.ns)

  volt.mappings {
    bufs = { state.buf },
    winclosed_event = true,
    after_close = function()
      state.buf = nil
      state.win = nil

      -- Close terminal
      if state.term_win and vim.api.nvim_win_is_valid(state.term_win) then
        vim.api.nvim_win_close(state.term_win, true)
      end
      state.term_win = nil

      if state.term_buf and vim.api.nvim_buf_is_valid(state.term_buf) then
        vim.api.nvim_buf_delete(state.term_buf, { force = true })
      end
      state.term_buf = nil

      -- Close bottom window
      if state.bottom_win and vim.api.nvim_win_is_valid(state.bottom_win) then
        vim.api.nvim_win_close(state.bottom_win, true)
      end
      state.bottom_win = nil

      if state.bottom_buf and vim.api.nvim_buf_is_valid(state.bottom_buf) then
        vim.api.nvim_buf_delete(state.bottom_buf, { force = true })
      end
      state.bottom_buf = nil
    end,
  }

  volt.run(state.buf, {
    h = state.h,
    w = state.w,
  })

  -- Open terminal window below main window
  local term_row = start_row + state.h + 2
  terminal.open_term_win(start_row, state.h)

  -- Open bottom text window below terminal
  local bottom_row = term_row + state.term_h + 2
  create_bottom_window(bottom_row)
end

return M
