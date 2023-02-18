local wezterm = require 'wezterm'

return {
  font = wezterm.font('Cica'),
  font_size = 15.0,
  --color_scheme = "Solarized Dark - Patched",
  color_scheme = "Tangoesque (terminal.sexy)",

  -- Resize Pane
  keys = {
    {
      key = 'p',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.ActivateKeyTable { name = 'resize_pane', one_shot = false }
    },
  },

  key_tables = {
    resize_pane = {
      { key = 'h', action = wezterm.action.AdjustPaneSize { "Left", 1 } },
      { key = 'j', action = wezterm.action.AdjustPaneSize { "Down", 1 } },
      { key = 'k', action = wezterm.action.AdjustPaneSize { "Up", 1 } },
      { key = 'l', action = wezterm.action.AdjustPaneSize { "Right", 1 } },
      { key = 'Escape', action = 'PopKeyTable' },
    },
  },

}
