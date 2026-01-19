return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/bday.nvim',
    name = 'bday',

    opts = {
      terminal = 'powershell',
      size = { h = 70, w = 64 },
      edit_key = 'm',
      border = true,
      use_file_dir = true,
    },

    keys = {
      { '<leader>ef', '<cmd>lua require("bday").open_float()<cr>', desc = 'Bday Float' },
      -- { '<leader>es', '<cmd>lua require("bday").open_split()<cr>', desc = 'Bday Split' },
      { '<leader>et', '<cmd>lua require("bday").toggle()<cr>', desc = 'Bday Toggle' },
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
  --   'aikhe/bday',
  --   opt = true,
  -- },
}
