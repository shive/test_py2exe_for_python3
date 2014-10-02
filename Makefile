# -*- mode: makefile-gmake; coding: euc-jp-unix -*-
#==============================================================================

CURL ?= curl
PYTHON ?= python
BUILD_EXE = .virtualenv/Scripts/python.exe -m py2exe.build_exe -v \
	--optimize --compress \
	 --include=ctypes --exclude=readline --exclude=pdb

.PHONY: clean msgbox hello

all: hello msgbox

msgbox: .bin/msgbox/msgbox.exe
	$<

hello: .bin/hello/hello.exe
	$<

.bin/msgbox/msgbox.exe: msgbox.py .virtualenv/Scripts/python.exe
	$(BUILD_EXE) --bundle-files=3 --dest=.bin/msgbox $<

.bin/hello/hello.exe: hello.py .virtualenv/Scripts/python.exe
	$(BUILD_EXE) --bundle-files=0 --dest=.bin/hello $<

.virtualenv/Scripts/python.exe: .packages/pywin32-219.win-amd64-py3.4.exe .packages/py2exe-0.9.2.0-py33.py34-none-any.whl .packages/PySide-1.2.2-cp34-none-win_amd64.whl
	$(PYTHON) -m venv --clear .virtualenv
	.virtualenv/Scripts/python.exe -m pip install .packages/*.whl
	.virtualenv/Scripts/python.exe -m easy_install .packages/*.exe
	/usr/bin/touch $@

.packages/pywin32-219.win-amd64-py3.4.exe:
	/usr/bin/mkdir -p .packages
	$(CURL) -L -o $@ http://sourceforge.net/projects/pywin32/files/pywin32/Build%20219/pywin32-219.win-amd64-py3.4.exe/download

.packages/py2exe-0.9.2.0-py33.py34-none-any.whl:
	/usr/bin/mkdir -p .packages
	$(CURL) -L -o $@ https://pypi.python.org/packages/3.4/p/py2exe/py2exe-0.9.2.0-py33.py34-none-any.whl#md5=9c86adc1467b6acd0921163d79fa939f

.packages/PySide-1.2.2-cp34-none-win_amd64.whl:
	/usr/bin/mkdir -p .packages
	$(CURL) -L -o $@ https://pypi.python.org/packages/3.4/P/PySide/PySide-1.2.2-cp34-none-win_amd64.whl#md5=f02e4b44109cc1d0db980a44484f6f90

clean:
	/usr/bin/rm -fr .virtualenv .packages .bin __pycache__

