return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPost', -- Using standard lazy event
  main = 'ibl',
  opts = {
    indent = {
      char = '│',
      highlight = 'IblIndent',
    },
    scope = {
      enabled = true,
      char = '│',
      highlight = 'IblScope',
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        'help',
        'terminal',
        'lazy',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
        'mason',
        'nvdash',
        'nvcheatsheet',
        '',
      },
      buftypes = { 'terminal' },
    },
  },
  config = function(_, opts)
    -- 1. Setup Highlights with your specific palette
    -- Gray3 (#2A2A2A) for standard lines
    vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#2A2A2A' })
    -- Blue (#7788AA) for the active scope line
    vim.api.nvim_set_hl(0, 'IblScope', { fg = '#2A2A2A' })

    -- 2. Register the NvChad-style hook to hide the first level
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

    -- 3. Initialize
    require('ibl').setup(opts)

    -- 4. Your WinScrolled fix for horizontal scrolling
    vim.api.nvim_create_augroup('IndentBlankLineFix', {})
    vim.api.nvim_create_autocmd('WinScrolled', {
      group = 'IndentBlankLineFix',
      callback = function()
        if vim.v.event.all and vim.v.event.all.leftcol ~= 0 then
          vim.cmd 'silent! IblRefresh'
        end
      end,
    })
  end,
}
