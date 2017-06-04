local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local freedesktop = require("freedesktop")

-- confirm <question> to run <func> by clicking on the notification
function askfor(question, func) 
	naughty.notify({
        title   = question,
        text    = "click for 'yes'",
        timeout = 5,
        run     = func
	})
end

-- write theme name to awesome_home/themeswitch
-- and restart awesome
function write_theme(theme_dir)
    f=io.open(awesome_home .. "/themeswitch", "w")
    f:write(theme_dir)
    f:close()
    awful.util.eval(awesome.restart)
end

-- search for all themes in awesome_home/themes
themeswitch = {}
for theme_dir in io.popen('ls -1 ' .. awesome.themes_path):lines() do --using popen here is fine since it is only called at startup
    if awful.util.file_readable(awesome.themes_path .. '/' .. theme_dir .. "/theme.lua") then
	    table.insert(themeswitch, { theme_dir,  function() write_theme(theme_dir) end })
    end
end


myawesomemenu = { 
    { "logout", function() askfor("Do you really want to logout?",  awesome.quit) end},
    
    { "poweroff", function() askfor(
        "Do you really want to shutdown?",  
        function() awful.spawn(terminal .. " -x systemctl poweroff -i") end
        ) 
        end 
    },

    { "reboot", function() askfor(
        "Do you really want to reboot?",  
        function() awful.spawn(terminal .. " -x systemctl reboot -i") end
        ) 
        end 
    },

    { "standby", function() askfor(
        "Do you really want to suspend?",  
        function() awful.spawn(terminal .. " -x systemctl suspend") end
        ) 
        end 
    },
    
    { "lock screen", terminal .. " -x slock" },       
    { "theme switch", themeswitch },
}

mymainmenu = freedesktop.menu.build({
    before = {{ "Awesome", myawesomemenu, beautiful.awesome_icon }}
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
