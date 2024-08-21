local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'iTerm2 Default'

config.font = wezterm.font 'Dank Mono'
config.line_height = 1.5

config.use_fancy_tab_bar = false
config.enable_tab_bar = false

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

return config
