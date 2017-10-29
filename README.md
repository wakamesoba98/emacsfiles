emacsfiles
=====

![screenshot](https://github.com/wakamesoba98/emacsfiles/blob/master/screenshot.png)

以下の3つに重点を置いてカスタマイズしています。

* 速い
* 見やすい
* IntelliJ

## Dependencies

* フォント
  * VLゴシック
  * Source Code Pro

## Setup

`~/.emacs.d/init.el` に以下の2行を書くと使用可能です。

```
(add-to-list 'load-path "/path/to/emacsfiles")
(load "core")
```

起動後に以下のコマンドを実行してアイコンフォントをインストールします。

```
M-x all-the-icons-install-fonts
```

## Keybinds

独自定義のキーバインドです。

* `C-z` Undo
* `C-S-z` Redo
* `<backtab>` (=`Shift+Tab`) 逆インデント
* `C-x C-d` 画面左にファイラー (Neotree) を表示します
* `C-c M-v` プロジェクトのnREPLに自動で繋ぎに行きます (clojure-mode)
* `C-c C-c p` 現在のファイルをChromeで開きます Markdown執筆に便利
* `M-x pd` LaTeXファイルからPDFをコンパイルします (要TeXLive)

## private.el

Gitに置けない個人設定はここに書きます。