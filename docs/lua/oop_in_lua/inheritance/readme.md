# lua でクラスを継承する

## はじめに

* 本稿ではluaのクラス継承方法を説明する。
* 継承が行えるクラスのテンプレートを公開した。
	* [親クラス](./parent_class.lua)
	* [子クラス](./child_class.lua)
	* [実行サンプル](./test.lua)

## 基本的な考え方

* 子クラスのコンストラクタで親クラスを初期化する
* 子クラスを通常通り初期化する
* 子クラスのテーブルに親クラスのテーブルをsetmetatableでくっつける

## コンストラクタの実装例

* 親クラスは普通に実装。
* 子クラスのコンストラクタは下記の様に実装する。

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
* テーブルAに無ければテーブルBを、Bに無ければCを...とテーブルをチェーンする。
* 上記実装では子クラスのテーブルを先に定義している。
	* 親クラスと子クラスのメンバ関数名が被っている場合、先に定義した子クラスが優先される。
	* これによりオーバーライドが実現できる。
	* メンバ変数も同様に子クラスが優先される。

## 関連文章

* [クラスの実装方法](../how_to_make_class/)
