return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/cake.nvim',
    name = 'cake',
    -- lazy = false,

    cmd = {
      'CakeToggle',
      'CakeFloat',
      -- 'BdaySplit',
    },

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
        mode = { 'n', 'v' },
        function()
          require('cake').open_float()
        end,
        desc = 'Cake Float',
      },
      {
        '<leader>et',
        mode = { 'n', 'v' },
        function()
          require('cake').toggle()
        end,
        desc = 'Cake Toggle',
      },
      -- { '<leader>es', '<cmd>lua require("cake").open_split()<cr>', desc = 'Cake Split' },
    },
  },

  -- {
  --   dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/volt.test',
  --   name = 'volt-test',
  -- },

  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/fleur.nvim',
    name = 'fleur',
    priority = 1000,
    lazy = false,
    opts = {
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
      },
      plugins = {
        telescope = true,
      },
      -- on_colors = function(c)
      --   c.accent = '#FF79C6' -- Override accent color
      -- end,
    },
    config = function()
      vim.cmd [[colorscheme fleur]]
    end,
  },

  -- {
  --   'aikhe/bday',
  --   opt = true,
  -- },
}
