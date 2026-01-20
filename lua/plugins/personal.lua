return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/bday.nvim',
    name = 'bday',
    -- lazy = false,

    opts = {
      terminal = 'powershell',
      size = { h = 70, w = 64 },
      edit_key = 'm',
      border = false,
      use_file_dir = true,
    },

    keys = {
      { '<leader>ef', '<cmd>BdayFloat<cr>', desc = 'Bday Float' },
      { '<leader>et', '<cmd>Bday<cr>', desc = 'Bday Toggle' },
      -- { '<leader>es', '<cmd>BdaySplit<cr>', desc = 'Bday Split' },
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
    config = function()
      -- vim.cmd [[colorscheme fleur]]
    end,
  },

  -- {
  --   'aikhe/bday',
  --   opt = true,
  -- },
}
