return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      black = '#000000',
      gray1 = '#080808',
      gray2 = '#191919',
      gray3 = '#2A2A2A',
      gray4 = '#444444',
      text_light = '#DEEEED',
      text_dim = '#CCCCCC',
      red = '#D70000',
      warn = '#FFAA88',
      green = '#789978',
      blue = '#7788AA',
      slate = '#cccccc',
      transparent = 'NONE',
    }

    local Lukies_theme = {
      normal = {
        a = { fg = colors.text_light, bg = colors.black, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.black },
        c = { fg = 'NONE', bg = colors.black },
        x = { fg = 'NONE', bg = colors.black },
        y = { fg = colors.text_dim, bg = colors.black, gui = 'bold' },
        z = { fg = colors.text_dim, bg = colors.black },
      },
      insert = {
        a = { fg = colors.text_light, bg = colors.black, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.black },
        c = { fg = 'NONE', bg = colors.black },
      },
      visual = {
        a = { fg = colors.text_light, bg = colors.black, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.black },
        c = { fg = 'NONE', bg = colors.black },
      },
      replace = {
        a = { fg = colors.text_light, bg = colors.black, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.black },
        c = { fg = 'NONE', bg = colors.black },
      },
      command = {
        a = { fg = colors.text_light, bg = colors.black, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.black },
        c = { fg = 'NONE', bg = colors.black },
      },
      inactive = {
        a = { fg = colors.text_light, bg = colors.black, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.black },
        c = { fg = 'NONE', bg = colors.black },
      },
    }

    local devicons = require 'nvim-web-devicons'

    local function get_file_icon()
      local icon, icon_highlight = devicons.get_icon(vim.fn.expand '%:t', vim.fn.expand '%:e')
      if icon == nil then
        return ' ', ''
      end
      return icon, icon_highlight
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = Lukies_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icon = '󰝤 ',
            separator = { fg = colors.black, left = '', right = ' ' },
            right_padding = 0,
          },
        },
        lualine_b = {
          {
            function()
              local current_directory = vim.fn.expand '%:p:h:t'
              return current_directory ~= '' and current_directory .. '' or '[No Name]'
            end,
            icon = '󰉖',
            color = { fg = colors.text_dim, bg = colors.black },
            right_padding = 2,
          },
          {
            function()
              local icon, _ = get_file_icon()
              local filepath = vim.fn.expand '%:p'
              return (icon or '') .. ' ' .. filepath .. ' '
            end,
            color = { fg = colors.text_dim, bg = colors.black },
            separator = { right = '' },
          },
        },
        lualine_c = {
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
            color = { fg = colors.text_dim, bg = colors.black }, -- MOVED INSIDE
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            function()
              local total_lines = vim.fn.line '$'
              local current_line = vim.fn.line '.'
              local current_col = vim.fn.col '.'
              return string.format('%d/%d : %d ', current_line, total_lines, current_col)
            end,
            icon = ' 󰉢',
            color = { fg = colors.text_dim, bg = colors.black },
            separator = { left = '' },
          },
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
