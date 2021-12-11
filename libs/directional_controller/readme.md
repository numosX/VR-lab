# DirectionalControlHelper

## 概要

* ジェスチャーで操作できるUIを作る際、自分の視点から見た変化量を計算することは難しい。
* 例えば、左に動かしたからといって、x座標が必ず減るとは限らない。
* これを簡単にするクラスは自分の知る限り提供されていなかった。そこで作成することにした。

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

## 使用方法

* 下のようなコードをmain.luaに書く。

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

## 使用例

[![thumbnail](https://pbs.twimg.com/ext_tw_video_thumb/1469640767039623168/pu/img/TjMiDg2WjQBh4ySp.jpg:thumb)](https://video.twimg.com/ext_tw_video/1469640767039623168/pu/vid/480x270/EH_c4qG0JJY1FGnz.mp4)
* バグがあるときに撮影したので left と right が逆になってます（修正済み）

## 改変履歴
* 2021/12/11 21:28 v0.1 公開
* 2021/12/11 23:22 v0.1a バグ修正

## 参考文献
[クォータニオン計算便利ノート](https://www.mss.co.jp/technology/report/pdf/18-07.pdf)