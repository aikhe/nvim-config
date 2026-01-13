require 'options'
require 'keymaps'
require 'neovide'

require 'health'

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
  require 'plugins.auto-tag',
  require 'plugins.autocompletion',
  require 'plugins.autopairs',
  require 'plugins.autoformat',
  require 'plugins.colors',
  require 'plugins.comment',
  require 'plugins.cord',
  require 'plugins.debug',
  require 'plugins.git',
  require 'plugins.gitsigns',
  require 'plugins.lint',
  require 'plugins.lsp',
  require 'plugins.mini',
  require 'plugins.neo-tree',
  require 'plugins.oil',
  require 'plugins.telescope',
  require 'plugins.theme',
  require 'plugins.todo-comments',
  require 'plugins.treesitter',
  require 'plugins.vim-sleuth',
  require 'plugins.which-key',
  require 'plugins.lualine',
  require 'plugins.blankline',
  require 'custom-plugins.exec',
  -- require 'plugins.yazi',
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
