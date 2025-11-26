-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- My own keymaps
vim.keymap.set('n', '<leader>pv', '<Cmd>Oil<CR>', { silent = true })
vim.keymap.set('n', '<leader>pe', '<Cmd>Oil --float<CR>', { silent = true })

vim.keymap.set(
  'n',
  '<leader>d',
  '<cmd>lua vim.diagnostic.open_float()<CR>',
  { desc = 'Open diagnostic float' } -- Optional description
)
vim.keymap.set('n', '<leader>q', '<cmd>close<CR>', { desc = 'Close floating window' })

vim.keymap.set('n', '<leader>pf', [[<cmd>Neotree float<cr>]])
vim.keymap.set('n', '<leader>pt', [[<cmd>Neotree left<cr>]])
vim.keymap.set('n', '<leader>pc', [[<cmd>Neotree toggle<cr>]])

vim.keymap.set('n', '=', [[<cmd>vertical resize +5<cr>]]) -- make the window biger horizontally
vim.keymap.set('n', '-', [[<cmd>vertical resize -5<cr>]]) -- make the window smaller horizontally
vim.keymap.set('n', '<A-=>', [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger vertically by pressing shift and =
vim.keymap.set('n', '<M-->', [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller vertically by pressing shift and -

vim.keymap.set('n', 'J', '5j', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '5k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '20jzz', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '20kzz', { noremap = true, silent = true })

vim.keymap.set('v', 'J', '5j', { noremap = true, silent = true })
vim.keymap.set('v', 'K', '5k', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>j', '20jzz', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>k', '20kzz', { noremap = true, silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv")
-- vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set('n', '<leader>r', function()
  vim.cmd('belowright split | resize ' .. math.floor(vim.o.lines / 2))

  local dir = vim.fn.expand '%:p:h'
  local makefile_path = dir .. '/Makefile'
  local makefile_exists = vim.fn.filereadable(makefile_path) == 1
  local program = vim.fn.expand '%:t:r'

  if makefile_exists then
    vim.cmd('term cd ' .. dir .. ' && make run PROGRAM=' .. program)
  else
    print '%'
    vim.cmd 'term gcc % -o %:r.exe && %:r.exe'
  end

  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc>', [[:bd!<CR>]], { noremap = true, silent = true })
end, { desc = 'complie & run c', noremap = true, silent = true })

vim.keymap.set('n', '<leader>i', function()
  vim.cmd('belowright split | resize ' .. math.floor(vim.o.lines / 2))

  local dir = vim.fn.expand '%:p:h'
  local makefile_path = dir .. '/Makefile'
  local makefile_exists = vim.fn.filereadable(makefile_path)
  local program = vim.fn.expand '%:t:r'

  if makefile_exists == 1 then
    -- print '✅ makefile exists'
    vim.cmd('term cd ' .. dir .. ' && make clean PROGRAM=' .. program)
  else
    -- print '❌ no makefile found'
    vim.cmd [[term echo "no makefile found!"]]
  end

  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc>', [[:bd!<CR>]], { noremap = true, silent = true })
end, { desc = 'clean c build', noremap = true, silent = true })

vim.keymap.set('n', '<leader>db', '<cmd>:bd! | Oil<CR>', { desc = 'Delete current Buffer' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'oil',
  callback = function()
    vim.keymap.set('n', '<leader>yd', function()
      local current_dir = require('oil').get_current_dir()
      -- Use the "+ register to put text into the system clipboard
      vim.fn.setreg('+', current_dir)
      vim.notify('Yanked: ' .. current_dir, vim.log.levels.INFO, { title = 'Oil.nvim' })
    end, { desc = 'Oil: Yank current directory to system clipboard' })
  end,
})
