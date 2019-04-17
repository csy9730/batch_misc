#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys,os
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QObject, pyqtSlot, QUrl
from PyQt5.QtWebChannel import QWebChannel
from PyQt5.QtWebEngineWidgets import QWebEngineView

class CallHandler(QObject):
    @pyqtSlot(result=str)
    def myHello(self):
        print('call received')
        return 'hello, Python'

if __name__ == '__main__':
    app = QApplication(sys.argv)
    view = QWebEngineView()
    channel = QWebChannel()
    handler = CallHandler()
    channel.registerObject('pyjs', handler)
    view.page().setWebChannel(channel)
    # url_string = "file:///D:/qt5/201709/webengine/test.html"
    url_string = (r"" + os.path.dirname(__file__) + "/1.html")

    view.load(QUrl(url_string))
    view.show()
    sys.exit(app.exec_())