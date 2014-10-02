<!-- -*- coding: utf-8-with-signature-unix -*- -->

## 概要
py2exe for python3 リリース記念。py2exe使ってみた。

curlでpywin32/py2exeをダウンロードしてvirtualenvを作ってinstallし、
*.pyをビルドして*.exeを作る。

make hello → printのみのシンプルなプログラム

make msgbox → PySideでメッセージボックス表示

## 課題
- 入力スクリプトがcp932固定(環境変数依存か？)になっている。普段utf8でやってるんだけど、モードラインも読んでくれない？要調査。
  - モードラインは読んでいるものの、emacsのutf-8-unixとかはダメだし、読んだところで結局文字コードエラー。
- PySideはbundle-files=3じゃないとダメ。PyQtはどうか？ → http://sourceforge.net/p/py2exe/bugs/134/

## 参考
https://pypi.python.org/pypi/py2exe/0.9.2.0

