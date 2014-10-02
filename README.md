<!-- -*- coding: utf-8-with-signature-unix -*- -->

## 概要
py2exe for python3 リリース記念。py2exe使ってみた。

curlでpywin32/py2exeをダウンロードしてvirtualenvを作ってinstallし、
*.pyをビルドして*.exeを作る。

make hello → printのみのシンプルなプログラム

make msgbox → PySideでメッセージボックス表示

## 課題
入力スクリプトを読み込むところ(py2exe/runtime.py)で文字コードが考慮されていない
- コメントにtodoっぽいのが書いてある
- エントリファイルはcp932で書いておけばいい
  - サブファイルはimportロジックで読み込まれるので問題無し

PySideはbundle-files=3じゃないとダメ (http://sourceforge.net/p/py2exe/bugs/134/)
- PyQtはどうか？

## 参考
https://pypi.python.org/pypi/py2exe/0.9.2.0

