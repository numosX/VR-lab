# DirectionalControlHelper

## 概要

* VCI SubItem を上下左右奥手前に動かしたときに簡単に方向を検出できるLuaクラス。
* 例えば「掴んで左方向に動かした」といったフリック入力を実装することができる。
* 具体的には、VCISubItemからOwnerへの方向を+z、地面から鉛直上向きを+yとして、左手座標系でxyz軸方向の移動を検出する。
* 移動量が少ない場合はuseとして検出することができる。

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

	-- 数値が欲しいときは下記のように実装する
	-- local dr_vec3 = controller:get_direction() 
end

```


## 使用例（動画：クリックで再生）

* オーディオプレイヤーを作成した。
	* 上下方向の入力で音量の上げ下げ
	* 左右方向の入力で曲選択
	* useで再生のOn/Off
* 曲を選択する例
	* [![thumbnail](https://pbs.twimg.com/ext_tw_video_thumb/1469720234323972097/pu/img/QfXqjtR87SxDyZy4.jpg)](https://video.twimg.com/ext_tw_video/1469720234323972097/pu/vid/1280x720/PlAoiR8a2QdtZqTa.mp4)

## 応用案

* リモコンとして、他のVCIを操作する。半径nメートル以内にいる場合、messageを受け付けるなどの処理を追加するとなお良い。
* 弓矢やパチンコといった引っ張る動作にも応用可能。

## 改変履歴
* 2021/12/11 21:28 v0.1 公開
* 2021/12/11 23:22 v0.1a バグ修正
* 2021/12/12 02:15 v0.2 push/pull/use に対応
* 2021/12/12 14:28 v0.3 向きを表すstrだけでなく、変化量Vector3も取得可能に

## 参考文献
[クォータニオン計算便利ノート](https://www.mss.co.jp/technology/report/pdf/18-07.pdf)