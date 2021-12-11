# ControlHelper

## 概要

* 十字キーを簡単に実装できるクラス

```lua
local DirectionalController = require "directional_controller"
local controller	    	= DirectionalController:new("Cube") -- "VCI SubItem 名、この例では Cube"

function onUse(use)
    if not vci.assets.IsMine then return end
    controller:pad_on()
end

function onUnuse(use)
    if not vci.assets.IsMine then return end
    
    controller:pad_off()
    local direction = controller:get_direction_string()

	if direction == "up" then
		-- do something
	elseif direction == "down" then
		-- do something
	elseif direction == "left" then
		-- do something
	elseif direction == "right" then
		-- do something
	end
end

```

## 使用準備

* Unity で VCI Object の設定を変える
	* Script Size を 2 にする
	* Name を それぞれ main と directional_controller にする
* main.lua と同じディレクトリに directional_controller.lua を配置
	* Workspace 以下のディレクトリ構造は、下記のようになるはず
```
your_VCI_directory/
├ directional_controller.lua
└ main.lua
```