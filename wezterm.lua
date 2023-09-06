-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.default_prog = { 'pwsh', '-l' }

config.font = wezterm.font 'Iosevka Nerd Font Mono'
config.font_size = 10.0

config.color_scheme = "Dracula (Official)"
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.colors = {
    scrollbar_thumb = 'white',
}

config.background = {
    -- This is the deepest/back-most layer. It will be rendered first
    {
        source = {
            File = 'c:/ws/img/terminal-background-mtb-3.jpg',
        },
        hsb = {
          hue = 1.0,
          saturation = 1.0,
          brightness = 0.3,
        },
        -- When the viewport scrolls, move this layer 10% of the number of
        -- pixels moved by the main viewport. This makes it appear to be
        -- further behind the text.
        attachment = { Parallax = 0.1 },
    },
}

-- keymaps
-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
}

config.window_frame = {
  border_left_width = '0.5cell',
  border_right_width = '0.5cell',
  border_bottom_height = '0.25cell',
  border_top_height = '0.25cell',
  border_left_color = 'purple',
  border_right_color = 'purple',
  border_bottom_color = 'purple',
  border_top_color = 'purple',
}

-- and finally, return the configuration to wezterm
return config
