return {
  {
    'vyfor/cord.nvim',
    build = function()
      if vim.fn.has 'win32' == 1 then
        os.execute 'bash -c "./build"'
      else
        os.execute './build'
      end
    end,
    opts = {
      enabled = true,
      log_level = vim.log.levels.OFF,
      editor = {
        client = 'neovim',
        tooltip = 'Neovim',
        icon = nil,
      },
      display = {
        theme = 'catppuccin',
        flavor = 'accent',
        swap_fields = false,
        swap_icons = true,
      },
      timestamp = {
        enabled = true,
        reset_on_idle = false,
        reset_on_change = false,
      },
      idle = {
        enabled = true,
        timeout = 300000,
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = true,
        smart_idle = true,
        details = '',
        state = nil,
        tooltip = '💤',
        icon = nil,
      },
      text = {
        viewing = '', -- Text to display when viewing a readonly file
        editing = '', -- Text to display when editing a file
        file_browser = '', -- Text to display when browsing files (Empty string to disable)
        plugin_manager = '', -- Text to display when managing plugins (Empty string to disable)
        lsp_manager = '', -- Text to display when managing LSP servers (Empty string to disable)
        vcs = '', -- Text to display when using Git or Git-related plugin (Empty string to disable)
        workspace = '', -- Text to display when in a workspace (Empty string to disable)
      },
      buttons = nil,
      -- buttons = {
      --   {
      --     label = 'View Repository',
      --     url = function(opts) return opts.repo_url end,
      --   },
      -- },
      assets = nil,
      variables = nil,
      hooks = {
        ready = nil,
        shutdown = nil,
        pre_activity = nil,
        post_activity = nil,
        idle_enter = nil,
        idle_leave = nil,
        workspace_change = nil,
      },
      plugins = nil,
      advanced = {
        plugin = {
          autocmds = true,
          cursor_update = 'on_hold',
          match_in_mappings = true,
        },
        server = {
          update = 'fetch',
          pipe_path = nil,
          executable_path = nil,
          timeout = 300000,
        },
        discord = {
          reconnect = {
            enabled = false,
            interval = 5000,
            initial = true,
          },
        },
      },
    },
    -- event = 'VeryLazy',
    -- opts = {
    --   editor = {
    --     image = nil,
    --     client = 'neovim',
    --     tooltip = 'Neovim',
    --   },
    --   display = {
    --     show_repository = false,
    --     theme = 'atom',
    --     flavor = 'dark',
    --     swap_fields = false,
    --     swap_icons = true,
    --   },
    --   timestamp = {
    --     enabled = true,
    --     reset_on_idle = false,
    --     reset_on_change = false,
    --   },
    --   idle = {
    --     enabled = true,
    --     timeout = 300000,
    --     show_status = true,
    --     ignore_focus = true,
    --     unidle_on_focus = true,
    --     smart_idle = true,
    --     details = '',
    --     state = nil,
    --     tooltip = '💤',
    --     icon = nil,
    --   },
    --   text = {
    --     -- viewing = '‎‎',
    --     viewing = '', -- Text to display when viewing a readonly file
    --     editing = '', -- Text to display when editing a file
    --     file_browser = '', -- Text to display when browsing files (Empty string to disable)
    --     plugin_manager = '', -- Text to display when managing plugins (Empty string to disable)
    --     lsp_manager = '', -- Text to display when managing LSP servers (Empty string to disable)
    --     vcs = '', -- Text to display when using Git or Git-related plugin (Empty string to disable)
    --     workspace = '', -- Text to display when in a workspace (Empty string to disable)
    --   },
    --   buttons = nil,
    -- }, -- calls require('cord').setup()
  },
}
