local awful = require("awful")
local wibox = require("wibox")
local menubar = require("menubar")
local gears = require("gears")
local lain = require("lain")

-- {{{ Variable definitions

-- path to awesome config dir
awesome_home = awful.util.getdir("config")

-- path to powerline installation
powerline_repository = awesome_home .. '/powerline/powerline/'

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
    awful.layout.suit.tile.left,
    awful.layout.suit.fair.horizontal,
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
widgets.clock   = wibox.widget.textclock()
widgets.cal     = lain.widget.calendar()
widgets.vol     = lain.widget.alsa({
    settings = function()
        lvl = " AUDIO:" .. volume_now.level .. "%"
        if volume_now.status == "off" then lvl = lvl .. "(M) " end
        widget:set_markup(lvl)
    end
})
widgets.cpu     = lain.widget.cpu({
    settings = function() 
        widget:set_markup(' CPU' .. cpu_now.usage .. "% ") 
    end
})
widgets.sysload = lain.widget.sysload({
    settings = function()
        widget:set_markup(' LOAD:' .. load_1 .. " ")
    end
})
widgets.temp    = lain.widget.temp({
    settings = function()
        widget:set_markup(" CPU_TEMP:" .. coretemp_now .. "°C ")
    end
})
widgets.netdown = wibox.widget.textbox()
widgets.netup   = lain.widget.net({
    settings = function()
        widget:set_markup(' UP:' .. net_now.sent .. 'Kb/s ')
        widgets.netdown:set_markup(' DOWN:' .. net_now.received .. 'Kb/s ')
    end
})

-- livetime for the wibar showing the widgets (show with mod4+v)
statusbox_timer_timeout = 4
-- }}

-- {{{ Custom key bindings
custom_keys = gears.table.join(
    awful.key({ modkey }, "c", function () lain.widget.calendar.show(7) end, 
        {description = "show calendar", group = "widgets"})
)
-- }}}
