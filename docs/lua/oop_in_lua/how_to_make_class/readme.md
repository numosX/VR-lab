# Lua でクラスを実装する方法

## はじめに

* [クラスのテンプレート](./class_template.lua)を用意した。
	* 読みやすさ重視、インデントの数が少なるように記述した。
	* 再利用や改造も容易となったのでテンプレとして公開。
* 以下では、実装方法や使用方法などを説明する。

## 基本的な考え方

* クラス用のテーブルを作成する。
* 変数への参照や関数への参照をテーブルに追加する。
* テーブルが複数個ある場合は、setmetatable を駆使する。

## メンバ関数の宣言とテーブル化

* 公開しているテンプレートでは、例として set_name() や get_name() などの関数を定義した。
* クラスの関数が呼ばれるとき、第一引数はメンバ変数やメンバ関数にアクセスするためのテーブルとなる。これをselfで受けることにする。

```lua
local set_name = function(self, str)
	assert(type(str) == "string", "input is not string")
	self._name = str
end

local get_name = function(self)
	return self._name
end
```

* メンバ関数をまとめたテーブルを作成する。

```lua
local member_functions = {
	set_name	= set_name,
	get_name	= get_name,
}
```

## メンバ変数とメンバ関数の定義

* このテンプレートのコアとなるのは、コンストラクタ new() の定義方法である。
* 例として、メンバ変数に name と counter を持つこととした。
* 空のテーブルを作成し、メンバ変数のテーブル、メンバ関数のテーブルを setmetatableでくっつける。
* new() は得られたテーブルを返す。

```lua
local new = function()
	local self = {}
	local member_params = {
		_name    = "undefined",
		_counter = 0,
	}
	setmetatable(self, {__index = member_params})
	setmetatable(member_params, {__index = member_functions})
	return self
end
```

* require したときは コンストラクタ new() を参照するテーブルを返すようにする。 

```lua
return {
	new = new
}
```

* このクラスを require すると、コンストラクタ new() を持ったテーブルが返される。
* このコンストラクタは、メンバ変数とメンバ関数をまとめたテーブルを作成する機能を持っている。
	* メンバ変数にはクラスが使用する変数を定義する。
	* メンバ関数は別に定義しておき、それらを別のテーブルでまとめている（上述の member_functions ）。
* setmetatable は、第一引数のテーブルにキーワードがない場合、別のテーブルを参照するようにする関数である。
	* メンバ変数をまとめたテーブルの他、メンバ関数をまとめたテーブルも参照するようにしている。
	* この実装により、一度メモリに乗せた関数を使いまわすことが可能となる。


## クラスの使い方

* require でクラスを読み込む
* コンストラクタを呼ぶ
* メンバ関数を叩きまくる

```lua
local ToyClass  = require "class_template"
local hoge  = ToyClass:new()	-- コンストラクタを呼び、オブジェクトを生成
hoge:set_name("hugahuga")		-- オブジェクトとメンバ関数はコロンでつなぐ。
```

## デモスクリプト

* 下記コマンドを実行。

```
> lua54  test.lua
```

## 備考

* Vキャス公式wikiの[クラスのような使い方をする](https://virtualcast.jp/wiki/vci/script/module)の実装方法では、簡略に書くことができる手軽さがあるが、メモリを無駄に消費する問題がある。
	* オブジェクトを生成するごとにメンバ関数を定義することになる。
* 上記問題の解決策
	* クラスの関数そのものはオブジェクトの外側で定義しておき、参照する様にする。

## 関連文章

* [クラスの継承方法](../inheritance/)