local awful = require("awful")
local wibox = require("wibox")
local menubar = require("menubar")
local gears = require("gears")
local lain = require("lain")

-- {{{ Variable definitions

-- path to awesome config dir
awesome_home = awful.util.getdir("config")

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
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
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

-- either use thinkpads hardware buttons or pulse audio
-- function to read status of hardware (sound) buttons
volfile = "/proc/acpi/ibm/volume"
function readvol()
    vol_file = io.open(volfile, "r")
    vol_line = vol_file:read()
    mutestatus = vol_file:read()
    vol_file:close()
    vol = "N/A"
    for column in string.gmatch(vol_line, "%S+") do
        if tonumber(column) ~= nil then
            --vol = round(column*100/14)
            vol = math.floor(column*100/14)
        end
    end

    if string.find(mutestatus, "on", 1, true) then
        volcolor = theme.bg_urgent
    else 
        volcolor = theme.fg_normal
    end

return " AUDIO:<span color='" .. volcolor .. "'>" .. vol .. "% </span>"
end
-- try to find/read hardware buttons
if volfile and  awful.util.file_readable(volfile) then
    widgets.vol = {}
    widgets.vol.widget = wibox.widget.textbox()
    widgets.vol.widget:set_markup(readvol())
    voltimer = gears.timer{
        timeout=10,
        autostart=true,
        callback=function() widgets.vol.widget:set_markup(readvol()) end
    }
-- read pulse audio as fallback
else
    widgets.vol = lain.widget.pulseaudio({
        settings = function()
            if volume_now.muted == "no" then 
                volcolor = theme.fg_normal
            else 
                volcolor = theme.bg_urgent 
            end
            widget:set_markup( ' AUDIO:'.. lain.util.markup(volcolor, volume_now.left .. "% "))
        end})
end

-- livetime for the wibar showing the widgets (show with mod4+v)
statusbox_timer_timeout = 4
-- }}

-- {{{ Custom key bindings
custom_keys = gears.table.join(
    awful.key({ modkey }, "c", function () lain.widget.calendar.show(7) end, 
        {description = "show calendar", group = "widgets"}),
    awful.key({             }, "Print", function() awful.spawn.with_shell(screenshot_cmd .. screenshot_dest()) end, 
    {description = "Take a Screenshot", group = "tag"})
)
-- }}}
