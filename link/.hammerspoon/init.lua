-- Load Extensions
local application = hs.application
local window = hs.window
local hotkey = hs.hotkey
local fnutils = hs.fnutils
local alert = hs.alert
local grid = hs.grid
-- Music controls
local spotify = hs.spotify

require "slowq"    -- Avoid accidental cmd-Q

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

--- The margin between each window vertically and horizontally.
grid.setMargins('10,10')

--- The number of cells high the grid is.
grid.GRIDHEIGHT = 6

--- The number of cells wide the grid is.
grid.GRIDWIDTH = 8

local animationDuration = 0.1
hs.window.animationDuration = animationDuration

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

hotkey.bind(mash, '.', function()
    local windows = hs.window.visibleWindows()
    for i in pairs(windows) do
        local window = windows[i]
        grid.snap(window)
    end
end)

-- -- Show and hide a stripe of Desktop {{{3
-- hotkey.bind(mash, ',', function()
--     local windows = hs.window.visibleWindows()
--     local finished = false
--     for i in pairs(windows) do
--         local window = windows[i]
--         local frame = window:frame()
--         local desktop = hs.window.desktop():frame()
--         if frame.x + frame.w > desktop.w - 120 and frame ~= desktop then
--             frame.w = desktop.w - frame.x - 120
--             alert.show(frame.w)
--             window:setFrame(frame)
--             finished = true
--         end
--     end
--     if finished then return end
--     for i in pairs(windows) do
--         local window = windows[i]
--         local frame = window:frame()
--         local desktop = hs.window.desktop():frame()
--         if frame.x + frame.w == desktop.w - 120 then
--             frame.w = frame.w + 100
--             window:setFrame(frame)
--         end
--     end
-- end)

-- Spotify

hotkey.bind(mashshift, 'space', spotify.displayCurrentTrack)
hotkey.bind(mashshift, 'p', spotify.playpause)
hotkey.bind(mashshift, 'n', spotify.next)
hotkey.bind(mashshift, 'i', spotify.previous)

alert.show("hammerspoon, at your service.")
