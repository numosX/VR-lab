# ControlHelper

## 概要

* ダブルグリップを簡単に実装できるクラス

```lua
local ControlHelper = require "control_helper"
local controller = ControlHelper:new()

function update()
	if controller:is_double_grip() then
		-- 2 回素早くグリップされた場合の処理を書く
	elseif controller:is_single_grip() then
		-- 1 回グリップされた場合の処理を書く
	end	
end

function onUse(use)
	controller:grip()
end
```

## 使用準備

* Unity で VCI Object の設定を変える
	* Script Size を 2 にする
	* Name を それぞれ main と control_helper にする
* main.lua と同じディレクトリに control_helper.lua　を配置
	* Workspace 以下のディレクトリ構造は、下記のようになるはず
```
your_VCI_directory/
├ control_helper.lua
└ main.lua
```