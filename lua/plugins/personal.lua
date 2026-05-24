return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/cake.nvim',
    name = 'cake',

    cmd = { 'CakeToggle', 'CakeFloat', 'CakeSplitV', 'CakeSplitH', 'CakeRun' },

    opts = {
      terminal = 'powershell',
      title = ' cake.nvim',
      size = { h = 80, w = 70 },
      border = false,
      use_file_dir = true,

      mappings = {
        new_tab = 'n',
        edit_commands = 'm',
        edit_cwd = ';',
        rerun = 'r',
        kill_tab = 'x',
        next_tab = '<C-n>',
        prev_tab = '<C-p>',
      },
    },

    keys = {
      {
        '<leader>ef',
        function()
          require('cake').open { mode = 'float' }
        end,
        desc = 'Cake Float',
      },
      {
        '<leader>ev',
        function()
          require('cake').open { mode = 'splitv' }
        end,
        desc = 'Cake Split Vertical',
      },
      {
        '<leader>eh',
        function()
          require('cake').open { mode = 'splith' }
        end,
        desc = 'Cake Split Horizontal',
      },
      {
        '<leader>et',
        function()
          require('cake').toggle()
        end,
        desc = 'Cake Toggle',
      },
      {
        '<leader>er',
        function()
          require('cake').run()
        end,
        desc = 'Cake Run',
      },
    },
  },

  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/fleur.nvim',
    name = 'fleur',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd [[colorscheme fleur]]
    end,
  },

  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/wrapped.nvim',
    name = 'wrapped',
    cmd = { 'WrappedNvim' },
    opts = {
      path = vim.fn.stdpath 'config', -- path to your neovim configuration
      border = false,
      size = {
        width = 120,
        height = 40,
      },
      exclude_filetype = {
        '.gitmodules',
      },
      cap = {
        commits = 1000,
        plugins = 100,
        plugins_ever = 200,
        lines = 10000,
      },
      keys = {
        close = 'q',
        refresh = 'r',
        prev_year = '<',
        next_year = '>',
      },
    },
  },
}
