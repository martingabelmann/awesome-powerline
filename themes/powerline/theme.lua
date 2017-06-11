local gears = require('gears')
local theme_assets = require("beautiful.theme_assets")
local theme = {}

theme.font         = "monofur for Powerline 10.5"
theme.border_width = 0
theme.useless_gap  = 0

theme.wibar_height = 15

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

theme.menu_width        = 100
theme.menu_fg_focus     = theme.taglist_fg_focus
theme.menu_bg_focus     = theme.taglist_bg_focus
theme.menu_border_color = '#202020'
theme.menu_border_width = 1

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

theme.layout_icons = gears.filesystem.get_themes_dir() .. 'default/layouts/'
theme.layout_fairh      = theme.layout_icons .. 'fairhw.png'  
theme.layout_fairv      = theme.layout_icons .. 'fairvw.png' 
theme.layout_magnifier  = theme.layout_icons .. 'magnifierw.png' 
theme.layout_cornernw   = theme.layout_icons .. 'cornernww.png' 
theme.layout_cornerne   = theme.layout_icons .. 'cornernew.png' 
theme.layout_cornersw   = theme.layout_icons .. 'cornersww.png' 
theme.layout_cornerse   = theme.layout_icons .. 'cornersew.png' 
theme.layout_spiral     = theme.layout_icons .. 'spiralw.png' 
theme.layout_dwindle    = theme.layout_icons .. 'dwindlew.png' 
theme.layout_tile       = theme.layout_icons .. 'tilew.png' 
theme.layout_tiletop    = theme.layout_icons .. 'tiletopw.png' 
theme.layout_tilebottom = theme.layout_icons .. 'tilebottw.png' 
theme.layout_tileleft   = theme.layout_icons .. 'tileleftw.png' 
theme.layout_floating   = theme.layout_icons .. 'floatingw.png'
theme.layout_max        = theme.layout_icons .. 'maxw.png'
theme.layout_fullscreen = theme.layout_icons .. 'fullscrew.png'

theme.awesome_icon = theme_assets.awesome_icon(16, theme.fg_normal, theme.bg_normal)
return theme
