local gears = require('gears')
local theme_assets = require("beautiful.theme_assets")
local theme = {}

theme.font         = "monofur for Powerline 10.5"
theme.border_width = 0
theme.useless_gap  = 0
theme.wibar_height = 15
theme.menu_height  = 15
theme.menu_width   = 100

theme.fg_normal  = "#DCDCCC"
theme.bg_normal  = '#131313'
theme.fg_urgent  = "#FFFFFF"
theme.bg_urgent  = "#CB0000"
theme.bg_systray = "#C7C7C7"

theme.taglist_fg_focus      = '#197600'
theme.taglist_bg_focus      = '#aedd00'
theme.taglist_font          = "monofur for Powerline bold 8"
theme.taglist_fg_normal     = "#DCDCCC"
theme.taglist_bg_normal     = theme.bg_normal
theme.taglist_squares_sel   = theme_assets.taglist_squares_unsel(4, theme.taglist_fg_focus)
theme.taglist_squares_unsel = theme.taglist_squares_sel

theme.tasklist_font_focus               = "monofur for Powerline bold 9"
theme.tasklist_font                     = "monofur for Powerline 9"
theme.tasklist_fg_focus                 = '#FFFFFF'
theme.tasklist_bg_normal                = '#202020'
theme.tasklist_bg_focus                 = "#606060"
theme.tasklist_align                    = 'left'
theme.tasklist_spacing                  = 0
theme.tasklist_shape                    = gears.shape.powerline
theme.tasklist_shape_border_width       = 0
theme.tasklist_shape_border_width_focus = 0
theme.tasklist_disable_icon             = true
theme.tasklist_plain_task_name          = true

theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"

theme.wallpaper = theme_assets.wallpaper(theme.bg_normal, theme.taglist_bg_focus, theme_taglist_fg_focus)

return theme
