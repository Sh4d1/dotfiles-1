-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- use a compositing manager for fancy shadows and true transparency
-- nah who cares really
-- awful.util.spawn_with_shell("xcompmgr -cF &")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/usr/share/awesome/themes/sky/theme.lua")

-- add default program commands as global variables
terminal = "konsole"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"
file_manager = "dolphin"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.floating,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
local wallpapers = {"wallpaper.jpg","wallpaper_right.jpg"}
if beautiful.wallpaper then
    for s = 1, screen.count() do
        if s < 3 then
            gears.wallpaper.maximized(wallpapers[s], s, false)
        else 
            gears.wallpaper.maximized("wallpaper.jpg", s, false)
        end
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -x man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "shutdown", "systemctl poweroff -i"}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "terminal", terminal, "/usr/share/icons/gnome/16x16/apps/terminal.png" },
                                    { "chrome", "google-chrome-stable --disable-hang-monitor", "/usr/share/icons/hicolor/16x16/apps/google-chrome.png"},
                                    { "chromium", "chromium", "/usr/share/icons/hicolor/16x16/apps/chromium.png"},
                                    { "firefox", "firefox", "/usr/share/icons/hicolor/16x16/apps/firefox.png" },
                                    { "file manager", file_manager, "/usr/share/icons/hicolor/16x16/apps/krusader_user.png"},
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}


-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock("%b %d, %H:%M %Z  |", 60, "Australia/Adelaide" )
mytextclock2 = awful.widget.textclock("%H:%M %Z", 60, "Europe/Paris")
mytextclock_margin_layout = wibox.layout.margin(mytextclock, 3,5,0,0)
mytextclock2_margin_layout = wibox.layout.margin(mytextclock2, 0,5,0,0)

tempmon = awful.widget.temperature()
tempmon_margin_layout = wibox.layout.margin(tempmon, 3,5,0,0)


-- Create a wibox for each screen and add it

mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock_margin_layout)
    right_layout:add(mytextclock2_margin_layout)
    right_layout:add(tempmon_margin_layout)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    -- (don't want to accidently quit!) awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),


    -- media keys
    -- awful.key({ modkey, "Shift"   }, "t", function ()  awful.util.spawn_with_shell("clementine --play-pause") end),
    -- awful.key({ modkey, "Shift"   }, "s", function ()  awful.util.spawn_with_shell("clementine --stop") end),
    -- awful.key({ modkey, "Shift"   }, "h", function ()  awful.util.spawn_with_shell("clementine --previous") end),
    -- awful.key({ modkey, "Shift"   }, "n", function ()  awful.util.spawn_with_shell("clementine --next") end),



    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    -- appfinder
    awful.key({ modkey },            "a",     function ()  awful.util.spawn_with_shell("xfce4-appfinder --disable-server") end),

    -- lock screen with xscreensaver
    awful.key({ modkey },            "s",     function ()  awful.util.spawn_with_shell("xscreensaver-command -lock") end),

    -- print screen using xfce4-screenshooter
    -- awful.key({ },            "Print",     function ()  awful.util.spawn_with_shell("xfce4-screenshooter") end),

    --change keyboard layouts (dvorak)
    --awful.key({ modkey },            "d",     function ()  awful.util.spawn_with_shell("setxkbmap -variant dvorak") end),

    -- (qwerty)
    --awful.key({ modkey },            "q",     function ()  awful.util.spawn_with_shell("setxkbmap -variant \"\"") end),
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
    -- Menubar (removed in favour of xfce4-appfinder)
    -- awful.key({ modkey }, "p", function() menubar.show() end)
) --end of global key shortcuts

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "g",      function (c) c.maximized_horizontal = false
                                                            c.maximized_vertical = false
                                                            c.maximized = false
                                                            c.fullscreen = false end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey, "Control" }, 1, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     maximized_vertical =  false,
                     maximized_horizontal = false,
                     size_hints_honor = false,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "xpad" },
      properties = { floating = true } },
    { rule = { class = "Alsa-tray" },
      properties = { floating = true } },
    { rule = { class = "Xfce4-appfinder" },
      properties = { floating = true }  },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

function run_once(command)
  if not command then
    do return nil end
  end
  local program = command:match("[^ ]+")


  -- If program is not running
  if os.execute("pgrep -x -n \"" .. program .. "\"") == nil then
    awful.util.spawn_with_shell(command)
  end
end

do
  local run_once_commands =
    {
      "xscreensaver -no-splash",
--      "xfsettingsd", -- gtk settings provider
--      "pulseaudio --start", -- the sound server (started in xinitrc)
      "nm-applet", -- taskbar network manager
--      "udiskie -A -s -f dolphin", -- for automounting drives (add -A option for non-automatic) [dolphin has mounting capabilities]
--      "skype",
--      "artha",
      "clipit",
--      "mpd", -- can have this as a systemd user service
      "dropbox",
--    "alsa-tray",
--      "pasystray", --this instead of alsa-tray since using pulseaudio
      "hexchat --minimize=2",
      "clementine",
      "shutter --min_at_startup",
--      "choqok",
--      "deluge-gtk",
--      "ario --minimized", -- if using mpd
      "blueman-applet",
    }

  for index, command in ipairs(run_once_commands) do
      run_once(command)
  end

  -- commands to run each time reset awesome wm
  local run_each_commands = 
  {
      "setxkbmap -variant dvorak -option caps:ctrl_modifier -option compose:ralt", -- composekey = right alt, capslock key now acts as control
      "xset r rate 175 80",
      "sleep 3 ; numlockx",
      "xcape -e 'Caps_Lock=Escape' -t 300", -- set physical capslock key as escape on quick press
      "synclient LeftEdge=-2393 RightEdge=2651 TopEdge=-2030 BottomEdge=2139 FingerLow=1 FingerHigh=2 MaxTapTime=250 MaxTapMove=500 MaxDoubleTapTime=100 SingleTapTimeout=180 ClickTime=100 EmulateMidButtonTime=0 EmulateTwoFingerMinZ=282 EmulateTwoFingerMinW=7 VertScrollDelta=-157 HorizScrollDelta=-156 VertEdgeScroll=0 HorizEdgeScroll=0 CornerCoasting=0 VertTwoFingerScroll=1 HorizTwoFingerScroll=1 MinSpeed=2.0339 MaxSpeed=4.75774 AccelFactor=0.0363118 TouchpadOff=0 LockedDrags=0 LockedDragTimeout=5000 RTCornerButton=0 RBCornerButton=0 LTCornerButton=0 LBCornerButton=0 TapButton1=1 TapButton2=3 TapButton3=2 ClickFinger1=1 ClickFinger2=3 ClickFinger3=2 CircularScrolling=0 CircScrollDelta=0.10472 CircScrollTrigger=0 CircularPad=0 PalmDetect=0 PalmMinWidth=10 PalmMinZ=200 CoastingSpeed=10 CoastingFriction=20 PressureMotionMinZ=30 PressureMotionMaxZ=160 PressureMotionMinFactor=1 PressureMotionMaxFactor=1 GrabEventDevice=0 TapAndDragGesture=1 AreaLeftEdge=0 AreaRightEdge=0 AreaTopEdge=0 AreaBottomEdge=0 HorizHysteresis=4 VertHysteresis=4 ClickPad=1 RightButtonAreaLeft=0 RightButtonAreaRight=0 RightButtonAreaTop=0 RightButtonAreaBottom=0 MiddleButtonAreaLeft=0 MiddleButtonAreaRight=0 MiddleButtonAreaTop=0 MiddleButtonAreaBottom=0",
      "wmname LG3D", -- so java applications render properly
      "killall touchegg ; touchegg"
  }

  for index, command in ipairs(run_each_commands) do
      awful.util.spawn_with_shell(command)
  end
end


-- multimonitor stuff for the desktop
awful.util.spawn_with_shell("xrandr --output HDMI1 --auto --pos 0x0 --output VGA1 --auto --pos 1920x180") 
awful.util.spawn_with_shell("xrandr --output HDMI1 --primary") 
