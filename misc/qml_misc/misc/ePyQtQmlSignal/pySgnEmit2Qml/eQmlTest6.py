# -*- coding: utf-8 -*-
#!/usr/bin/env python

from PyQt5.Qt import QDialog
from PyQt5.QtCore import QUrl,QObject, pyqtSignal,QThread,QDateTime
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView

import time
import sys

def outputString(string):
    print(string)


class Backend(QThread):
    update_date = pyqtSignal(str)
    def run(self):
        while True:
            data = QDateTime.currentDateTime()
            print(data)
            #data='abcdefg'
            self.update_date.emit(str(data))
            time.sleep(1)
class BackendOneshot(QObject):
    update_date = pyqtSignal(str)
    #def __init__(self):
        #QObject.__init__(self)
    def run(self):
        data = QDateTime.currentDateTime()
        print(data)
        self.update_date.emit(str(data))
        #time.sleep(1)
    def start(self):
        self.run()

class Window(QDialog):
    def __init__(self):
        QDialog.__init__(self)
        self.resize(400, 100)
        self.input = QLineEdit(self)
        self.input.resize(400, 100)

    def handleDisplay(self, data):
        self.input.setText(data)
def main0():
    import time
    path = 'test6.qml'   # 加载的QML文件
    app = QGuiApplication([])
    view = QQuickView()
    b = Backend()
    view.engine().quit.connect(app.quit)
    view.setSource(QUrl(path))
    view.show()
    b.update_date.connect(view.rootObject().abc)
    b.start()

    app.exec_()
def main2():
    import time
    path = 'test6.qml'   # 加载的QML文件
    app = QGuiApplication([])
    view = QQuickView()

    b = BackendOneshot()

    view.engine().quit.connect(app.quit)
    view.setSource(QUrl(path))
    view.show()

    #b.update_date.connect(outputString)
    b.update_date.connect(view.rootObject().abc)
    b.start()
    for i in range(3):
        b.run()
        time.sleep(1)
    app.exec_()

if __name__ == '__main__':
    main2()
