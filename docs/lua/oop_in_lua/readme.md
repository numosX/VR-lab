# Lua をオブジェクト思考で書く

## はじめに

* [クラスのテンプレート](./class_template.lua)を用意した。
	* 読みやすさ重視、インデントの数が少なるように記述した。
	* 再利用や改造も容易となったのでテンプレとして公開。
* 以下では、実装方法や使用方法などを説明する。

## メンバ関数の宣言とテーブル化

* 公開しているテンプレートでは、例として setName() や getName() などの関数を定義した。
* これらの関数を参照する public_functions テーブルを作成しておく。

```lua
local setName = function(self, str)
	assert(type(str) == "string", "input is not string")  -- 引数が正しいかを確認
	self.name = str -- メンバ変数への代入
end

local getName = function(self)
	return self.name -- メンバ変数を返す
end

local public_functions = {
	setName = setName,
	getName = getName,
}
```

## メンバ変数とメンバ関数の定義

* このテンプレートのコアとなるのは、コンストラクタ(new）の定義方法である。
* 例として、メンバ変数に name と counter を持つこととした。

```lua
local new = function()
	local __member_params = {
		name    = "undefined",
		counter = 0,
	}
	return setmetatable(__member_params, {__index = public_functions})
end

return {
	new = new
}
```

* このクラスを require すると、コンストラクタ（new）を持ったテーブルが返される。
* このコンストラクタは、メンバ変数とメンバ関数をまとめたテーブルを作成する機能を持っている。
	* メンバ変数にはクラスが使用する変数を定義する。
	* メンバ関数は別に定義しておき、それらを別のテーブルでまとめている（上述のpublic_functions）。
* setmetatable は、第一引数のテーブルにキーワードがない場合、別のテーブルを参照するようにする関数である。
	* メンバ変数をまとめたテーブルの他、メンバ関数をまとめたテーブルも参照するようにしている。
	* この実装により、一度メモリに乗せた関数を使いまわすことが可能となる。


## クラスの使い方

* require でクラスを読み込む
* コンストラクタを呼ぶ
* メンバ関数を叩きまくる

```lua
local ToyClass  = require "class_template"
local hoge  = ToyClass:new()    -- コンストラクタを呼び、オブジェクトを生成
hoge:setName("hugahuga")        -- オブジェクトとメンバ関数はコロンでつなぐ。
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
