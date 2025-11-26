return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require 'telescope.actions'

    -- https://github.com/MagicDuck/grug-far.nvim/pull/305
    local is_windows = vim.fn.has 'win64' == 1 or vim.fn.has 'win32' == 1
    local vimfnameescape = vim.fn.fnameescape
    local winfnameescape = function(path)
      local escaped_path = vimfnameescape(path)
      if is_windows then
        local need_extra_esc = path:find '[%[%]`%$~]'
        local esc = need_extra_esc and '\\\\' or '\\'
        escaped_path = escaped_path:gsub('\\[%(%)%^&;]', esc .. '%1')
        if need_extra_esc then
          escaped_path = escaped_path:gsub("\\\\['` ]", '\\%1')
        end
      end
      return escaped_path
    end

    local select_default = function(prompt_bufnr)
      vim.fn.fnameescape = winfnameescape
      local result = actions.select_default(prompt_bufnr, 'default')
      vim.fn.fnameescape = vimfnameescape
      return result
    end

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<cr>'] = select_default,
            ['<c-d>'] = actions.delete_buffer,
          },
          n = {
            ['<cr>'] = select_default,
            ['<c-d>'] = actions.delete_buffer,
            ['dd'] = actions.delete_buffer,
          },
        },
        file_ignore_patterns = { 'node_modules', '.next', '.git' },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
