return {
  'nvzone/floaterm',
  dependencies = 'nvzone/volt',
  cmd = 'FloatermToggle',
  opts = {
    border = true,
    size = { h = 60, w = 70 },

    -- to use, make this func(buf)
    mappings = { sidebar = nil, term = nil },

    -- Default sets of terminals you'd like to open
    terminals = {
      { name = 'Terminal' },
      -- cmd can be function too
      -- { name = 'Terminal', cmd = 'neofetch' },
      -- More terminals
    },
  },
}
