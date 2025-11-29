require 'aikhe.options'
require 'aikhe.keymaps'
require 'aikhe.neovide'

require 'aikhe.health'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'aikhe.plugins.auto-tag',
  require 'aikhe.plugins.autocompletion',
  require 'aikhe.plugins.autopairs',
  require 'aikhe.plugins.autoformat',
  require 'aikhe.plugins.colors',
  require 'aikhe.plugins.comment',
  require 'aikhe.plugins.cord',
  require 'aikhe.plugins.debug',
  require 'aikhe.plugins.git',
  require 'aikhe.plugins.gitsigns',
  require 'aikhe.plugins.indent_line',
  require 'aikhe.plugins.lint',
  require 'aikhe.plugins.lsp',
  require 'aikhe.plugins.mini',
  require 'aikhe.plugins.neo-tree',
  require 'aikhe.plugins.oil',
  require 'aikhe.plugins.telescope',
  require 'aikhe.plugins.theme',
  require 'aikhe.plugins.todo-comments',
  require 'aikhe.plugins.treesitter',
  require 'aikhe.plugins.vim-sleuth',
  require 'aikhe.plugins.which-key',
  -- require 'aikhe.plugins.yazi',
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
