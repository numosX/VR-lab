# Lua の環境構築

## はじめに

* Vキャスを起動せずにスクリプトの動作確認をすることを想定し、環境構築を行う

## Luaのバイナリを入手する

* [公式サイトのダウンロードページ](http://luabinaries.sourceforge.net/download.html)からluaのバイナリをダウンロード
	* 執筆時は lua-5.4.2_Win64_bin.zip というファイル名
* 任意のディレクトリに解凍
	* ここでは C:\lua\ に解凍したとする

## Hello World してみる

* 下記スクリプトを作成。解凍したディレクトリに、test.lua という名前で保存。

```lua
print("Hello World !")
```

* ディレクトリは下記の様になっているはず

```
lua\
├ lua54.dll
├ lua54.exe
├ luac54.exe
├ test.lua
└ wlua54.exe
```

* powerShell を開く
* 解凍したディレクトリに移動する
* 作成したtest.lua を ダウンロードしたluaで実行する

```lua
> cd C:\lua\
> ./lua54.exe test.lua
Hello World !
```

## パスを通してどこでもluaが叩けるようにする

* パスを通す
	* Windows のアイコンをクリック
	* 設定、環境変数を編集
	* [UserName]のユーザー環境変数のPathをクリックし、編集ボタンを押す
	* 新規のボタンを押し、解答したディレクトリ（C:\lua\）と入力。
* powerShell を開いて、```lua54 -v``` と叩いて下記の様になることを確認。
	* lua54.exe のファイル名を lua.exe にすれば、luaと打って実行可能になる。

```
> lua54 -v
Lua 5.4.2  Copyright (C) 1994-2020 Lua.org, PUC-Rio
```
