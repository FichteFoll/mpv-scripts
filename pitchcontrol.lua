local utils = require 'mp.utils'
local msg = require('mp.msg')
local options = require('mp.options')
local script_name = 'pitchcontrol'

local HALFTONE_SCALE = 1.059463094352953
local RUBBERBAND_LABEL = string.format("%s-rubberband", script_name)

local current_pitch = 0
local active = false


function set_halftone_pitch(pitch, activate)
    local pitch_scale = 1.0 * math.pow(HALFTONE_SCALE, pitch)

    if active then
        mp.commandv('af-command', RUBBERBAND_LABEL, 'set-pitch', pitch_scale)
    elseif activate or current_pitch == 0 then
        mp.command(('af add @%s:rubberband=pitch-scale=%s'):format(RUBBERBAND_LABEL, pitch_scale))
        active = true
    else
        mp.osd_message(("'%s' is inactive"):format(script_name))
        return
    end

    current_pitch = pitch

    -- output new pitch
    msg.debug(("new pitch-scale: %f"):format(pitch_scale))
    mp.osd_message(("Pitch: %+d halftones"):format(pitch))
end


function increase_handler()
    set_halftone_pitch(current_pitch + 1)
end


function decrease_handler()
    set_halftone_pitch(current_pitch - 1)
end


function toggle_handler()
    if active then
        mp.command(('af del @%s'):format(RUBBERBAND_LABEL))
        mp.osd_message(("'%s' deactivated"):format(script_name))
        active = false
    else
        set_halftone_pitch(current_pitch, true)
    end
end


mp.add_key_binding("Alt+p", "increase", decrease_handler)
mp.add_key_binding("Alt+P", "decrease", increase_handler)
mp.add_key_binding("Alt+l", "toggle", toggle_handler)
