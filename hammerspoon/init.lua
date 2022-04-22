-- Load Extensions
local application = hs.application
local window = hs.window
local hotkey = hs.hotkey
local fnutils = hs.fnutils
local alert = hs.alert
local grid = hs.grid

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
alert.show("Config loaded")

--- The margin between each window horizontally.
grid.MARGINX = 0

--- The margin between each window vertically.
grid.MARGINY = 0

--- The number of cells high the grid is.
grid.GRIDHEIGHT = 10

--- The number of cells wide the grid is.
grid.GRIDWIDTH = 16

-- Music controls
-- local spotify = require "hs.lb.spotify"

-- Set up hotkey combinations
local mash = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}

-- local function opendictionary()
--   alert.show("Lexicon, at your service.", 0.75)
--   application.launchorfocus("Dictionary")
-- end

-- hotkey.bind(mash, 'D', opendictionary)

hotkey.bind(mash, ';', function() grid.snap(window.focusedWindow()) end)
hotkey.bind(mash, "'", function() fnutils.map(window.visibleWindows(), grid.snap) end)

hotkey.bind(mash, '=', function() grid.adjustNumberOfColumns( 1) end)
hotkey.bind(mash, '-', function() grid.adjustNumberOfColumns(-1) end)

hotkey.bind(mashshift, 'h', function() window.focusedWindow():focusWindowWest() end)
hotkey.bind(mashshift, 'l', function() window.focusedWindow():focusWindowEast() end)
hotkey.bind(mashshift, 'k', function() window.focusedWindow():focusWindowNorth() end)
hotkey.bind(mashshift, 'j', function() window.focusedWindow():focusWindowSouth() end)

hotkey.bind(mash, 'M', grid.maximizeWindow)

hotkey.bind(mash, 'N', grid.pushWindowNextScreen)
hotkey.bind(mash, 'P', grid.pushWindowPrevScreen)

hotkey.bind(mash, 'J', grid.pushWindowDown)
hotkey.bind(mash, 'K', grid.pushWindowUp)
hotkey.bind(mash, 'H', grid.pushWindowLeft)
hotkey.bind(mash, 'L', grid.pushWindowRight)

hotkey.bind(mash, 'U', grid.resizeWindowTaller)
hotkey.bind(mash, 'O', grid.resizeWindowWider)
hotkey.bind(mash, 'I', grid.resizeWindowThinner)
hotkey.bind(mash, 'Y', grid.resizeWindowShorter)

-- hotkey.bind(mashshift, 'space', spotify.displayCurrentTrack)
-- hotkey.bind(mashshift, 'p', spotify.play)
-- hotkey.bind(mashshift, 'o', spotify.pause)
-- hotkey.bind(mashshift, 'n', spotify.next)
-- hotkey.bind(mashshift, 'i', spotify.previous)

alert.show("hammerspoon, at your service.")
