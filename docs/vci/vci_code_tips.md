# VCI Code Tips

## はじめに

* 基本的な実装例は、公式wikiの[この辺](https://virtualcast.jp/wiki/vci/script/reference)によくまとまっている。
* 以下では、使用したり書いたりしたコードを抜粋して成形。

## 座標系

* Global座標系
	* 位置：Unity の原点(0,0,0)が基準
	* 回転：Z+方向を基準
* Local座標系
	* 位置：VCIが出現した位置
	* 回転：VCIが出現したときの方向を基準

## 基本的な物理パラメータの表現方法

* 位置と速度、角速度、加える力はVector3で表現する
* 回転はQuartanionで表現する
* 時刻は専用のクラスから取得する

```lua
-- 位置と速度、角速度、加える力
local position			= Vector3.__new(0,0,0)	-- r
local velocity			= Vector3.zero			-- v
local angluar_velocity	= Vector3.zero			-- omega
local force				= Vector3.__new(0,0,10)	-- f

-- 回転
local theta		= 30
local axis		= a_vci_sub_item.GetUp()
local rotation	= Quaternion.AngleAxis( theta, axis )	-- axis周りにtheta度回転
local rotation2	= Quaternion.Euler(30, 45, 60) 			-- オイラー角で指定、x,y,z軸の順で回転

-- 時刻/時間
local t = vci.me.Time				-- 現在時刻
local t = vci.me.Time.TotalSeconds	-- vci生成からの経過時間
```

## 位置

```lua
local vci_sub_item = vci.assets.GetTransform("VCISubItemName")
local position = vci_sub_item.GetPosition()
print(position.x, position.y, position.z)
```

## 速度
```lua
local vci_sub_item = vci.assets.GetTransform("VCISubItemName")
vci_sub_item.SetVelocity(vci_sub_item.GetRight())	-- X軸方向に飛ばす
vci_sub_item.SetVelocity(vci_sub_item.GetUp())		-- Y軸方向に飛ばす
vci_sub_item.SetVelocity(vci_sub_item.GetForward())	-- Z軸方向に飛ばす
```

## 乱数

```lua
math.random(-1,-1) -- 整数
```

## ユーザーからのコメントを取得する

* 公式で実装済み。
	* vci.message.On("comment", some_function) で some_functionを起動可能 
	* [vci.message(コメントの受信)](https://virtualcast.jp/wiki/vci/script/reference/messagecomment)
	* [string型の検索方法まとめ](https://virtualcast.jp/wiki/vci/script/tips/stringsearch)

```lua
function onMessage(sender, name, message)
    print(sender["name"].."「"..message.."」")
	--sender[“name”]			-> 送信者の名前
	--message					-> コメント
	--sender[“commentSource”]	-> "Nicolive", "Twitter" or "Showroom"
end
 
vci.message.On('comment', onMessage)
```

## デバッグ

```lua
print("hoge"... tostring(num))  -- tonumber() もある
```
## 弾幕実装に向けて

下記、関数が使えそう

```lua
SetActive(isActive: bool) 
_ALL_SetActive(isActive: bool)
```

* 具体的な使い方メモ（公式より抜粋）
```lua
local Parent = vci.assets.GetTransform("Parent")
local Child = vci.assets.GetTransform("Child")
 
Parent.SetActive(false) -- Parent は無効設定
Child.SetActive(true) -- Child は有効設定
 
--> Parent も Child も無効状態になり、非表示状態になる
 
print(Child.ActiveSelf) --> true. Child 自身は有効設定だが...
print(Child.ActiveInHierarchy) --> false. Child は実際には無効状態となる.
```