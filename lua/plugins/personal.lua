return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom_plugins/exec.nvim',
    name = 'exec',
    priority = 500,
    lazy = false,

    opts = {
      terminal = 'powershell',
      cmd = { 'javac Sample.java', 'java Sample' },
      size = { h = 60, w = 60 },
      border = 'single',
    },
  },
}
