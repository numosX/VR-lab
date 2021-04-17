# Lua の書き方

## 概要

* 他言語経験者向けにざっくりとまとめる。
* 書き方は Javascript と bash を足して２で割ったみたいな感じ。
* 具体的なVCI実装方法は、[VCI実装TIPS](../vci/vci_code_tips.md)を参照。
* VC公式wikiの[スクリプトリファレンス](https://virtualcast.jp/wiki/vci/script/reference)も参照。

## コメント

```lua
--１行のコメント

--[[
複数行の
コメント
]]
```

## 変数

```lua
local hoge	= 1			--数値
local hoge	= "文字列"	--数値
local hoges	= {}		--配列
print(hoges[1])			-- 配列の取得（1-indexed ぽい; 詳細未確認）
```

## 条件分岐

```lua
if (str_object == "hoge") then
	-- do something...
end
```

## for ループ

```lua
for i=0, 10 do
	-- do something...
end
```

## 関数の定義

```lua
function hoge(arg)

end
```