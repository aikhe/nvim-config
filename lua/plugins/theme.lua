return {
  'slugbyte/lackluster.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    --  When testing transparent backgrounds I found that comments where often hard to read,
    --  and menus didn't look good but using setup() tweaks you can easily address that!
    local lackluster = require 'lackluster'

    -- !must called setup() before setting the colorscheme!
    lackluster.setup {
      tweak_syntax = {
        comment = lackluster.color.gray4, -- or gray5
      },
      tweak_background = {
        normal = 'none',
        telescope = 'none',
        menu = lackluster.color.gray3,
        popup = 'none',
      },
    }

    -- vim.cmd.colorscheme("lackluster")
    vim.cmd.colorscheme 'lackluster-hack' -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
}

--return {
--   'nyoom-engineering/oxocarbon.nvim',
--   init = function()
--     vim.cmd.colorscheme 'oxocarbon'
--   end,
-- },

-- { -- You can easily change to a different colorscheme. Change the name of the colorscheme plugin below, and then change the command in the config to whatever the name of that colorscheme is.
--   --
--   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--   'folke/tokyonight.nvim',
--   priority = 1000, -- Make sure to load this before all the other start plugins.
--   opts = {
--     transparent = true, -- Enable this to disable setting the background color
--     terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--     styles = {
--       -- Style to be applied to different syntax groups
--       -- Value is any valid attr-list value for `:help nvim_set_hl`
--       comments = { italic = true },
--       keywords = { italic = true },
--       functions = {},
--       variables = {},
--       -- Background styles. Can be "dark", "transparent" or "normal"
--       sidebars = 'transparent', -- style for sidebars, see below
--       floats = 'transparent', -- style for floating windows
--     },
--     day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--     dim_inactive = false, -- dims inactive windows
--     lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--   },
--   init = function()
--     -- Load the colorscheme here.
--     -- Like many other themes, this one has different styles, and you could load
--     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--     vim.cmd.colorscheme 'tokyonight-night'

--     -- You can configure highlights by doing something like:
--     -- vim.cmd.hi 'Comment gui=none'
--   end,
-- }
