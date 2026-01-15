local volt = require "volt"
local ui = require "volt.ui"

local M = {}

M.open = function()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 60
  local height = 15

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "single",
  }

  vim.api.nvim_open_win(buf, true, opts)

  local state = { checked = false, progress = 50 }

  local layout = {
    {
      name = "header",
      lines = function()
        return {
          { { "My Plugin", "Title" } },
          { { string.rep("─", width - 4), "LineNr" } },
        }
      end,
    },
    {
      name = "body",
      lines = function()
        return {
          {
            ui.checkbox {
              active = state.checked,
              txt = "Toggle option",
              actions = {
                click = function()
                  state.checked = not state.checked
                  volt.redraw(buf, "body")
                end,
              },
            },
          },
          ui.progressbar {
            w = 40,
            val = state.progress,
          },
        }
      end,
    },
  }

  volt.gen_data {
    {
      buf = buf,
      layout = layout,
      xpad = 2,
      ns = vim.api.nvim_create_namespace "MyPlugin",
    },
  }

  volt.mappings {
    bufs = { buf },
    winclosed_event = true,
  }

  volt.run(buf, {
    h = height,
    w = width,
  })
end

return M
