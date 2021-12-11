# DirectionalControlHelper

## 概要

* 十字キーを簡単に実装できるクラス

```lua
local DirectionalControlHelper	= require "directional_controller"
local controller	    		= DirectionalControlHelper:new("Cube") -- "VCI SubItem 名、この例では Cube"

function onUse(use)
    controller:pad_on()
end

function onUnuse(use)    
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

## 改変履歴
* 2021/12/11 v0.1 公開
* 2021/12/11 v0.1a バグ修正（座標系の回転と位置ベクトルの回転が逆だった）