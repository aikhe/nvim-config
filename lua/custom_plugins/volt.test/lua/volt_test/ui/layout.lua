local ui = require "volt_test.ui"

local empty_line = {
  lines = function() return { {} } end,
  name = "emptyline",
}

return {
  {
    lines = ui.title,
    name = "title",
  },
  empty_line,
  {
    lines = ui.content,
    name = "content",
  },
  -- empty_line,
  -- {
  --   lines = ui.bottom_text,
  --   name = "bottom_text",
  -- },
}
