<!-- -*- coding: utf-8-with-signature-unix -*- -->

## 概要
py2exe for python3 リリース記念。py2exe使ってみた。

curlでpywin32/py2exeをダウンロードしてvirtualenvを作ってinstallし、
hoge.pyをビルドしてhoge.exeを作る。

## 課題
入力スクリプトがcp932固定(環境変数依存か？)になっている。普段utf8でやってるんだけど、モードラインも読んでくれない？要調査。


## 参考
https://pypi.python.org/pypi/py2exe/0.9.2.0

