#!/bin/env python
# -*- mode: python; coding: cp932 -*-
#======================================================================================================================

import sys
import PySide
from PySide.QtCore import *
from PySide.QtGui import *

if __name__ == '__main__':
    app = QApplication(sys.argv)
    msgbox = QMessageBox()
    msgbox.setText('�ق��ق� �ق��ق� �ق��ق�')
    msgbox.show()
    sys.exit(app.exec_())

