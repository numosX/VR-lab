local DirectionalCube   = require "DirectionalCube"
local controller	    = DirectionalCube:new("Cube")

function onUse(use)
    if not vci.assets.IsMine then return end
    controller:pad_on()
end

function onUnuse(use)
    if not vci.assets.IsMine then return end
    
    controller:pad_off()
    local direction_string = controller:get_direction_string()
    print(direction_string)
end
