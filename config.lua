local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local menubar = require("menubar")
local gears = require("gears")
local lain = require("lain")

-- {{{ Variable definitions

-- path to awesome config dir
awesome_home = awful.util.getdir("config")

-- path to powerline installation
powerline_repository = awesome_home .. '/powerline/powerline/'

-- override vars from selected theme
theme=beautiful.get()
theme.font          = "Terminess powerline 8"
theme.border_width  = 0
theme.useless_gap   = 0
theme.tasklist_disable_icon = true


--default applications for the menu
terminal    = "xfce4-terminal"
editor      = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Screenshots directory
screenshot_dir = os.getenv("HOME") .. "/Screenshots/"
screenshot_cmd = "import -frame "
function screenshot_dest()
    return screenshot_dir .. os.time() .. ".png"
end

-- Default modkey.
modkey = "Mod4"

-- Hide menu launcher (mod+w still shows the menu)
show_mylauncher = false

-- }}}

-- {{{ Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.corner.nw
}
-- }}}

-- {{{ Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
menubar.cache_entries = true -- caching the icons
menubar.app_folders = { "/usr/share/applications/" }
menubar.show_categories = false 
-- }}}

-- {{{ Client Rules
custom_rules = {
    { rule = { class = "qutebrowser" }, properties = { screen = 1, tag = "1" } },
    { rule = { class = "Thunderbird" }, properties = { screen = 1, tag = "2" } },
}
-- }}}


-- {{ Widgets
widgets = {}
widgets.clock = wibox.widget.textclock()
widgets.cal = lain.widget.calendar()
-- }}

-- {{{ Custom key bindings
custom_keys = gears.table.join(
    awful.key({ modkey }, "c", function () lain.widget.calendar.show(7) end, 
        {description = "show calendar", group = "widgets"})
)
-- }}}
