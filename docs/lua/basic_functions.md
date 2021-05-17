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

* local を付けないとグローバル変数になる。
* 変数の大文字と小文字は区別される

```lua
local hoge	= 1			--数値
local hoge	= "文字列\tほげ"	--数値
local hoges	= {}		--配列
print(hoges[1])			-- 配列の取得（1-indexed ぽい; 詳細未確認）
local val_of = {a=1}		--連想配列
print(val_of.a)
print(val_of[a])

local hoge = "hoge"
local HOGE = "HOGE"
print(hoge)
print(HOGE)

local hoge = [[
	ヒアドキュメント
	複数行の文字列
]]
```

## 条件分岐

```lua
if (str_object == "hoge") then
	-- do something...
elseif (str_object == "fuga") then
	-- do something...
else
	-- do something...
end
```

## for ループ

```lua
for i=0, 10 do
	-- do something...
end

for i=0, 10, 2 do
	-- do something...
end

-- "i"pairs
for i, val in ipairs(some_list) do
	-- do something...
end

for key, val in pairs(some_dict) do
	-- do something...
end


```

## 関数の定義

```lua
function hoge(arg)

end
```

## 文字列

```lua
local str = "hogehoge"
print(string.len(str))			-- 長さ
print(string.sub(str, 3, 5))	-- 切り出し
print(string.find(str, "ge"))	-- 検索
print(string.gsub(str, "hoge", "huga"))	-- 検索
print(string.upper(str))		-- 全部大文字
print(string.lower(str))		-- 全部小文字

local name = "hoge"
local id = 24
local str2 = string.format("%s %010d", name, id)   -- ゼロ埋め
print(str2)
```

## リスト操作

```lua
local dump = function(table)
	for i, val in ipairs(table) do print(val) end
end

local numbers = {1,2,3,4,5}
table.insert(numbers, 6)
dump(numbers)
table.insert(numbers, 2, 100)
dump(numbers)
table.remove(numbers, 2)
dump(numbers)
```

## 日時

```lua
local time_stamp = os.date("%Y-%m-%d")
print(time_stamp)

local time_stamp_data = os.date("*t")
for key, val in pairs(time_stamp_data) do
  print(key)
  print(val)
end


```

## ソート

```lua

local sushi_of = {
	{name="maguro",	kakaku=100},
	{name="uni", 	kakaku=1000},
	{name="tako",	kakaku=200},
}

local sort_by_kakaku = function(a, b)
	return (a.kakaku < b.kakaku)
end

table.sort(sushi_of, sort_by_kakaku)

for index, value in pairs(sushi_of) do
	print(value.name..":"..value.kakaku)
end
```