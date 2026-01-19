return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/exec.nvim',
    name = 'exec',

    opts = {
      terminal = 'powershell',
      size = { h = 70, w = 64 },
      edit_key = 'm',
      border = true,
      use_file_dir = true,
    },

    keys = {
      { '<leader>ef', '<cmd>lua require("exec").open_float()<cr>', desc = 'Exec Float' },
      -- { '<leader>es', '<cmd>lua require("exec").open_split()<cr>', desc = 'Exec Split' },
      { '<leader>et', '<cmd>lua require("exec").toggle()<cr>', desc = 'Exec Toggle' },
    },
  },

  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/volt.test',
    name = 'volt-test',
  },

  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/fleur.nvim',
    name = 'fleur',
    priority = 1000,
    lazy = false,
    config = function()
      -- vim.cmd [[colorscheme fleur]]
    end,
  },

  -- {
  --   'aikhe/exec',
  --   opt = true,
  -- },
}
