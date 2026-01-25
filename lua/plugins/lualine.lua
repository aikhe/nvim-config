return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      black = '#141414',
      gray1 = '#080808',
      gray2 = '#191919',
      gray3 = '#2A2A2A',
      gray4 = '#222222',
      text_light = '#DEEEED',
      text_dim = '#7a7a7a',

      -- black = '#000000',
      -- gray1 = '#080808',
      -- gray2 = '#434f55',
      -- gray3 = '#a7c080',
      -- gray4 = '#dbbc7f',
      -- text_light = '#dbbc7f',
      -- text_dim = '#9da9a0',

      red = '#D70000',
      warn = '#FFAA88',
      green = '#789978',
      blue = '#7788AA',
      slate = '#cccccc',
    }

    local function get_bg()
      local hl = vim.api.nvim_get_hl(0, { name = 'Normal' })
      if hl and hl.bg then
        return string.format('#%06x', hl.bg)
      end
      return 'NONE'
    end

    colors.bg = get_bg()

    print(colors.bg)

    local Lukies_theme = {
      normal = {
        a = { fg = colors.text_light, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.bg },
        c = { fg = 'NONE', bg = colors.bg },
        x = { fg = 'NONE', bg = colors.bg },
        y = { fg = colors.text_dim, bg = colors.bg, gui = 'bold' },
        z = { fg = colors.text_dim, bg = colors.bg, gui = 'bold' },
      },
      insert = {
        a = { fg = colors.text_light, bg = colors.black, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.black },
        c = { fg = 'NONE', bg = colors.bg },
      },
      visual = {
        a = { fg = colors.text_light, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.bg },
        c = { fg = 'NONE', bg = colors.bg },
      },
      replace = {
        a = { fg = colors.text_light, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.bg },
        c = { fg = 'NONE', bg = colors.bg },
      },
      command = {
        a = { fg = colors.text_light, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.bg },
        c = { fg = 'NONE', bg = colors.bg },
      },
      inactive = {
        a = { fg = colors.text_light, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.text_dim, bg = colors.bg },
        c = { fg = 'NONE', bg = colors.bg },
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
      vim.api.nvim_set_hl(0, 'MyLualineSep', { fg = colors.text_light, bg = colors.text_light }),

      sections = {
        lualine_a = {
          {
            'mode',
            -- icon = ' ',
            icon = ' 󰝤',
            color = { fg = colors.text_light, bg = colors.bg },
            separator = { left = '%#MyLualineSep# ', right = '' },
          },
        },
        lualine_b = {
          {
            function()
              local icon = get_file_icon()
              local filename = vim.fn.expand '%:t'

              if not icon or icon:match '^%s*$' then
                icon = ' [+]'
              end

              return icon .. ' ' .. filename
              -- return '26.01.18'
            end,
            color = { fg = colors.text_dim, bg = colors.bg },
            separator = { right = '' },
          },
          -- {
          --   function()
          --     local icon, icon_highlight = get_file_icon()
          --     local filename = vim.fn.expand '%:t'
          --
          --     icon = icon and icon ~= '' and icon or '' -- placeholder icon
          --
          --     return icon .. ' ' .. filename .. ' ', icon_highlight
          --   end,
          --   color = { fg = colors.text_dim, bg = colors.bg },
          -- },
        },
        lualine_c = {
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
            color = { fg = colors.text_dim, bg = colors.bg },
          },
        },
        lualine_x = {
          {},
        },
        lualine_y = {
          {
            function()
              -- Terminal buffers
              if vim.bo.buftype == 'terminal' then
                local name = vim.api.nvim_buf_get_name(0)

                local term_cwd = name:match '^term://(.-)//%d+:'
                if term_cwd then
                  return vim.fn.fnamemodify(term_cwd, ':~')
                end
                return 'Terminal'
              end

              local dir = vim.fn.expand '%:p:h'
              if dir ~= '' then
                return vim.fn.fnamemodify(dir, ':~')
              end

              return '[No Name]'
            end,
            icon = '󰉖',
            color = { fg = colors.text_dim, bg = colors.bg },
          },
        },
        lualine_z = {
          {
            function()
              local total_lines = vim.fn.line '$'
              local current_line = vim.fn.line '.'
              local current_col = vim.fn.col '.'
              return string.format('%d/%d : %d', current_line, total_lines, current_col)
              -- return '1/18 : 1'
            end,
            icon = '󰉢 ',
            color = { fg = colors.text_light, bg = colors.bg },
            separator = { left = '' },
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
