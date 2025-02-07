local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- make it look nice
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

return config
