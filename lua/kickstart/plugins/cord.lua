return {
  {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    -- event = 'VeryLazy',
    opts = {
      editor = {
        image = nil,
        client = 'neovim',
        tooltip = 'Neovim',
      },
      display = {
        theme = 'onyx',
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
        details = 'Idling',
        state = nil,
        tooltip = '💤',
        icon = nil,
      },
      text = {
        viewing = '‎‎', -- Text to display when viewing a readonly file
        editing = 'hjkl', -- Text to display when editing a file
        file_browser = '', -- Text to display when browsing files (Empty string to disable)
        plugin_manager = '', -- Text to display when managing plugins (Empty string to disable)
        lsp_manager = '', -- Text to display when managing LSP servers (Empty string to disable)
        vcs = '', -- Text to display when using Git or Git-related plugin (Empty string to disable)
        workspace = '', -- Text to display when in a workspace (Empty string to disable)
      },
      buttons = nil,
      assets = {
        lazy = { -- Vim filetype or file name or file extension = table or string
          name = 'Lazy', -- Optional override for the icon name, redundant for language types
          icon = 'https://example.com/lazy.png', -- Rich Presence asset name or URL
          tooltip = 'lazy.nvim', -- Text to display when hovering over the icon
          type = 'plugin_manager', -- One of 'language', 'file_browser', 'plugin_manager', 'lsp_manager', 'vcs' or respective ordinals; defaults to 'language'
        },
        ['Cargo.toml'] = 'crates',
      },
      variables = nil,
      hooks = {
        on_ready = nil,
        on_update = nil,
        on_activity = nil,
        on_idle = nil,
        on_workspace_change = nil,
        on_disconnect = nil,
      },
      advanced = {
        plugin = {
          autocmds = true,
          log_level = vim.log.levels.INFO,
          cursor_update = 'on_hold',
          variables_in_functions = false,
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
          },
        },
      },
    }, -- calls require('cord').setup()
  },
}
