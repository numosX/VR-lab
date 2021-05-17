local ControlHelper = require "control_helper"

local control_helper = ControlHelper:new()
control_helper:set_threshold(0.3)	--ダブルグリップ許容時間 [s]

function updateAll()
	if control_helper:is_double_grip() then
		print("double grip")
	elseif control_helper:is_single_grip() then
		print("single grip")
	end	
end

function grip()
	control_helper:grip()
end
vci.message.On("grip", grip)

function onUse(use)
	vci.message.EmitWithId("grip", "", vci.assets.GetInstanceId())
end