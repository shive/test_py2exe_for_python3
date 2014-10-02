#!/bin/env python
# -*- mode: python; coding: utf-8-sig -*-
#======================================================================================================================

import sys
from PySide.QtCore import *
from PySide.QtGui import *

def msgbox():
    app = QApplication(sys.argv)
    msgbox = QMessageBox()
    msgbox.setText('ほげほげ ほげほげ ほげほげ')
    msgbox.show()
    return app.exec_()

