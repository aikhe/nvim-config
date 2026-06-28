return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  -- Use the new top-level module
  main = 'nvim-treesitter',

  -- The old `opts` table with `highlight` and `indent` will no longer do anything.
  -- Instead, we install parsers and use an autocmd to enable features natively.
  init = function()
    -- 1. Automatically turn on Treesitter features when opening files
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        -- Safely start native treesitter highlighting
        pcall(vim.treesitter.start)

        -- Enable native treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,

  config = function(_, opts)
    -- 2. Setup the plugin (creates commands, handles paths)
    require('nvim-treesitter').setup(opts)

    -- 3. Explicitly install the languages you want
    local ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'typescript',
      'tsx',
      'javascript',
      'svelte',
      'css',
      'scss',
    }

    require('nvim-treesitter').install(ensure_installed)
  end,
}
