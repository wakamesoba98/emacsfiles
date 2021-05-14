emacsfiles
=====

![screenshot](https://github.com/wakamesoba98/emacsfiles/blob/master/screenshot.png)

以下の3つに重点を置いてカスタマイズしています。

* 速い
* 見やすい
* IntelliJ

## Dependencies

* フォント
  * Noto Fonts
  * Source Code Pro
* コマンド
  * The Silver Searcher (`ag`)

## Setup

`~/.emacs.d/init.el` (Windowsの場合は `C:\Users\ユーザー名\AppData\Roaming\.emacs.d\init.el`) に以下の2行を書くと使用可能です。

```
(add-to-list 'load-path "/path/to/emacsfiles")
(load "core")
```

起動後に以下のコマンドを実行してアイコンフォントとPython用の仮想環境をインストールします。

```
M-x all-the-icons-install-fonts
M-x jedi:install-server
```

## Keybinds

独自定義のキーバインドです。

* `C-z` Undo
* `C-S-z` Redo
* `C-PgUp` 前のタブへ
* `C-PgDn` 次のタブへ
* `S-Tab` 逆インデント
* `C-Enter` Gitプロジェクト内のファイルを名前で検索します (IntelliJのShift2回押しに近い機能)
* `C-x C-d` 画面左にファイラー (Neotree) を表示します
* `C-c M-v` Vagrant上のnREPLに自動で繋ぎに行きます (clojure-mode)
* `C-c C-c p` 現在のファイルをChromeで開きます Markdown執筆に便利
* `M-x pd` LaTeXファイルからPDFをコンパイルします (要TeXLive)

## private.el

Gitに置けない個人設定はここに書きます。
