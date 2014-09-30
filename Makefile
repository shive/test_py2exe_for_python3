# -*- mode: makefile-gmake; coding: euc-jp-unix -*-
#==============================================================================

CURL = curl
PYTOHN = python

.PHONY: clean run

run: .bin/hoge.exe
	$<

.bin/hoge.exe: hoge.py .virtualenv/Scripts/python.exe
	.virtualenv/Scripts/python.exe -m py2exe.build_exe -v --include=ctypes --optimize --compress --bundle-files=0 --dest=.bin $<

.virtualenv/Scripts/python.exe: .packages/pywin32-219.win-amd64-py3.4.exe .packages/py2exe-0.9.2.0.win-amd64.exe
	$(PYTHON) -m venv --clear .virtualenv
	.virtualenv/Scripts/python.exe -m easy_install $^
	/usr/bin/touch $@

.packages/pywin32-219.win-amd64-py3.4.exe:
	/usr/bin/mkdir -p .packages
	$(CURL) -L -o $@ http://sourceforge.net/projects/pywin32/files/pywin32/Build%20219/pywin32-219.win-amd64-py3.4.exe/download

.packages/py2exe-0.9.2.0.win-amd64.exe:
	/usr/bin/mkdir -p .packages
	$(CURL) -L -o $@ https://pypi.python.org/packages/any/p/py2exe/py2exe-0.9.2.0.win-amd64.exe#md5=05d90513c993b2f3ae0f7f21d69a6898

clean:
	/usr/bin/rm -fr .virtualenv .packages .bin __pycache__

