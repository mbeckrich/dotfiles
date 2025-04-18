local wezterm = require 'wezterm'
local theme = require 'colors/kanagawa-dragon'

return {
  term = 'wezterm',

  -- Letters
  freetype_interpreter_version = 40,
  font_size = 15,
  line_height = 1,

  -- -- In case this makes any difference for the Orcus symbol lol
  unicode_version = 15,
  font = wezterm.font_with_fallback({
    {
      family = "Martian Mono",
      weight = 'Regular',
      stretch = 'Normal',
      style = 'Normal'
    },
    {
      family = "Noto Sans Symbols 2",
      weight = 400
    },
    "Apple Color Emoji",
  }),

  -- Cursors
  default_cursor_style = "SteadyUnderline",
  cursor_blink_rate = 0,

  -- Windows
  enable_scroll_bar = false,
  window_decorations = "RESIZE",
  window_padding = {
    top = "1cell",
    right = "2cell",
    bottom = "1cell",
    left = "2cell",
  },

  -- Tabs
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_max_width = 64,

  window_close_confirmation = 'NeverPrompt',
  colors = theme
  -- color_scheme = 'mammoth'
}
