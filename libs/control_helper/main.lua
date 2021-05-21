local ControlHelper = require "control_helper"

local controller = ControlHelper:new()
controller:set_threshold(0.3)	--ダブルグリップ許容時間 [s]

function updateAll()
	if controller:is_double_grip() then
		print("double grip")
	elseif controller:is_single_grip() then
		print("single grip")
	end	
end

function grip()
	controller:grip()
end
vci.message.On("grip", grip)

function onUse(use)
	vci.message.EmitWithId("grip", "", vci.assets.GetInstanceId())
end