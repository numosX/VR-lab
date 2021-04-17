# VScode の使い方

## インストール方法など

* 省略

## 拡張機能のインストール

### EmmyLua 

* Lua コーディング補助用の拡張機能

### PasteImage

* 使用方法
	* win + shift + s 、スクショしたい領域を指定。選択範囲がクリップボードに入る。
	* alt + ctrl + v でクリップボードの画像をペースト＆URIを自動生成

* 設定
	* 初期設定のままでは、画像が編集中のmarkdownファイルと同じディレクトリに保存される
	* 下記の様に設定し、同じディレクトリ下のimagesファイルにまとまる

```json
	// 画像を保存するディレクトリの設定
	"pasteImage.path": "./images/",
```

## ドキュメントの作成方法

* 編集用ブランチの作成とブランチの切り替え
  * ここでは develop という名前のブランチを作成する場合の例を示す
```
git checkout -b develop
```
* markdown を用いてドキュメントを作成or編集する
  * ctrl + k を押してから v を押すと、Preview が表示される
* 編集状態の反映
```
git commit -a -m "編集した内容の簡単な説明"
```
* 編集結果の共有
```
git push origin develop
```

## 備考

* ローカルのdevelopブランチで作業中に、main に更新があった場合

```
git checkout main
git pull
git checkout develop
git rebase main
```