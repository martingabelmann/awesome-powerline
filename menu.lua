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

myawesomemenu = { 
    { "logout", function() askfor("Do you really want to logout?",  
        function() awesome.quit() end
        ) 
    end
    },
    
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
    
    { "lock screen", terminal .. " -x slock" }
}

mymainmenu = freedesktop.menu.build({
    before = {{ "Awesome", myawesomemenu, beautiful.awesome_icon }},
        skip_items = { "Avahi", "urxvt", "Qt4", "Qt" }
})
if show_mylauncher then
    mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
end
