# lua でクラスを継承する

## はじめに

* luaでクラスの継承が行えるクラスのテンプレートを公開した。
	* [親クラス](./parent_class.lua)
	* [子クラス](./child_class.lua)
	* [実行サンプル](./test.lua)
* 以下、この詳細を説明する。

## 基本的な考え方

* コンストラクタで親クラスを初期化する
* 子クラスを通常通り初期化する
* 子クラスのテーブルに親クラスのテーブルをsetmetatableでくっつける

## コンストラクタの実装例

```lua
local new = function()
	local parent_class = ParentClass:new()
	local self = {}
	local child_params = {
		_child_val = nil
	}
	setmetatable(self, {__index = child_params})
	setmetatable(child_params, {__index = child_functions})
	setmetatable(child_functions, {__index = parent_class})
	return self
end
```

* setmetatable の挙動は「もともとのテーブルに探しているkeyがなければ、別のテーブルも探してね」というもの。
* 親クラスと子クラスのメンバ関数名が被っている場合は子クラスが優先され、オーバーライドも可能となる。

## 関連文章

* [クラスの実装方法](../how_to_make_class/readme.md)を参照
