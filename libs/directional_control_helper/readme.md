# DirectionalControlHelper

## 概要

* バーチャルキャストで十字コントローラ(D-Pad)を使いたい。
* 例えば、物を掴んで動かし、方向に応じて異なる処理を実行したい。
* 自分の視点から見た変化量を計算することは難しい。例えば、物を左に動かしたからといって、x座標が必ず減るとは限らない。
* D-Padを簡単にするクラスは自分の知る限り提供されていなかった。そこで作成することにした。

## 使用準備

* Unity で VCI Object の設定を変える
	* Script Size を 2 にする
	* Name を それぞれ main と directional_control_helper にする
* main.lua と同じディレクトリに directional_control_helper.lua を配置
	* Workspace 以下のディレクトリ構造は、下記のようになるはず
```
your_VCI_directory/
├ directional_control_helper.lua
└ main.lua
```

## 使用方法

* 下のようなコードをmain.luaに書く。

```lua
local DirectionalControlHelper	= require "directional_control_helper"
local controller	    		= DirectionalControlHelper:new("Cube") -- "VCI SubItem 名、この例では Cube"


controller:enable_z_detection()   -- z 方向の移動（push/pull）を検出する場合
controller:enable_use_detection() -- 動かさずにuseする動作を検出する場合

function onUse(use)
    controller:pad_on()
end

function onUnuse(use)    
    controller:pad_off()
    local action = controller:get_direction_string()

	if action == "up" then
		-- do something
	elseif action == "down" then
		-- do something
	elseif action == "left" then
		-- do something
	elseif action == "right" then
		-- do something
	elseif action == "pull" then
		-- do something
	elseif action == "push" then
		-- do something
	elseif action == "use" then
		-- do something
	end
end

```


## 使用例（動画：クリックで再生）

[![thumbnail](https://pbs.twimg.com/ext_tw_video_thumb/1469720234323972097/pu/img/QfXqjtR87SxDyZy4.jpg)](https://video.twimg.com/ext_tw_video/1469720234323972097/pu/vid/1280x720/PlAoiR8a2QdtZqTa.mp4)

## 改変履歴
* 2021/12/11 21:28 v0.1 公開
* 2021/12/11 23:22 v0.1a バグ修正
* 2021/12/12  2:15 v0.2 push/pull/use に対応

## 参考文献
[クォータニオン計算便利ノート](https://www.mss.co.jp/technology/report/pdf/18-07.pdf)