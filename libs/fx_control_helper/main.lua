local FxControlHelper = require "fx_control_helper"

local fx_controller = FxControlHelper:new()

-- # Effekseer の設定
fx_controller:set_effect("vci_subitem_name")
fx_controller:disable_effect_loop()

-- # AudioClip の設定
fx_controller:set_sound("audio_clip_name")
fx_controller:set_sound_volume(0.5)
fx_controller:disable_sound_loop()

function onTriggerEnter(item, hit)
    if item == "vci_subitem_name" then
        fx_controller:play()
    end
end
