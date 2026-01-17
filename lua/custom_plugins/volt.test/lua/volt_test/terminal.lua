local M = {}

local api = vim.api
local state = require "volt_test.state"

--- Create a new terminal buffer and start the shell
M.new_term = function()
  if not state.term_buf or not api.nvim_buf_is_valid(state.term_buf) then
    state.term_buf = api.nvim_create_buf(false, true)
  end

  local term = state.config.terminal or "powershell"

  api.nvim_buf_call(state.term_buf, function()
    vim.fn.jobstart(term, {
      term = true,
      on_exit = function()
        vim.schedule(function()
          if state.term_buf and api.nvim_buf_is_valid(state.term_buf) then
            api.nvim_set_option_value(
              "modifiable",
              false,
              { buf = state.term_buf }
            )
          end
        end)
      end,
    })
  end)
end

--- Open the terminal window below the main volt window
---@param main_win_row number Row position of main window
---@param main_win_height number Height of main window
M.open_term_win = function(main_win_row, main_win_height)
  if not state.term_buf or not api.nvim_buf_is_valid(state.term_buf) then
    M.new_term()
  end

  local term_row = main_win_row + main_win_height + 2 -- 2 for border spacing

  local win_opts = {
    relative = "editor",
    width = state.w,
    height = state.term_h,
    col = (vim.o.columns - state.w) / 2,
    row = term_row,
    style = "minimal",
    border = "single",
  }

  -- Open with focus (true = enter window)
  state.term_win = api.nvim_open_win(state.term_buf, true, win_opts)

  -- Apply terminal-specific highlight namespace for darker bg
  api.nvim_win_set_hl_ns(state.term_win, state.term_ns)

  -- Terminal options for proper rendering
  vim.bo[state.term_buf].scrollback = 10000

  -- Add left padding via foldcolumn
  vim.wo[state.term_win].foldcolumn = tostring(state.xpad)

  -- Enter insert mode for terminal
  vim.cmd "startinsert"

  -- Close all windows when terminal window is closed (e.g. :q)
  api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(state.term_win),
    once = true,
    callback = function()
      vim.schedule(function() M.close() end)
    end,
  })

  -- Set up keymaps for terminal buffer
  vim.keymap.set(
    "t",
    "<Esc>",
    [[<C-\><C-n>]],
    { buffer = state.term_buf, noremap = true, silent = true }
  )

  vim.keymap.set(
    "n",
    "q",
    function() M.close() end,
    { buffer = state.term_buf, noremap = true, silent = true }
  )

  vim.keymap.set(
    "n",
    "<Esc>",
    function() M.close() end,
    { buffer = state.term_buf, noremap = true, silent = true }
  )
end

--- Close all windows and buffers
M.close = function()
  -- Close terminal window first
  if state.term_win and api.nvim_win_is_valid(state.term_win) then
    api.nvim_win_close(state.term_win, true)
  end
  state.term_win = nil

  -- Delete terminal buffer
  if state.term_buf and api.nvim_buf_is_valid(state.term_buf) then
    api.nvim_buf_delete(state.term_buf, { force = true })
  end
  state.term_buf = nil

  -- Close main volt window
  if state.win and api.nvim_win_is_valid(state.win) then
    api.nvim_win_close(state.win, true)
  end
  state.win = nil

  -- Delete main volt buffer
  if state.buf and api.nvim_buf_is_valid(state.buf) then
    api.nvim_buf_delete(state.buf, { force = true })
  end
  state.buf = nil
end

return M
