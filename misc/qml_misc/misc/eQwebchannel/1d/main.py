#! /usr/bin/env
# -*- coding: utf-8 -*-
# webview.py

import sys,os
import random
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QObject, pyqtSlot, QUrl,pyqtSignal,QTimer
from PyQt5.QtWebChannel import QWebChannel
from PyQt5.QtWebEngineWidgets import QWebEngineView
# print(os.path.dirname(__file__)
class Print(QObject):
    sgn = pyqtSignal(str)
    def __init__(self):
        super(Print, self).__init__()
        self.strval = ""
        self.timer = QTimer()
        self.timer.timeout.connect(self.emitAll)  # 调用QML函数
    @pyqtSlot(str, result=str) 
    def print(self, content):
        print(content)
        self.strval = content
        return 'rcv:' + content
    def emitAll(self):
        self.sgn.emit(self.strval)
        print("emit")
        self.strval +=random.choice('abcdefghijklmnopqrstuvwxyz')

    @pyqtSlot()
    def startEmit(self):
        self.timer.start(1000)

    @pyqtSlot()
    def stoptEmit(self):
        print("stop emit")
        self.timer.stop()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    browser = QWebEngineView()  # 新增一个浏览器引擎
    browser.setWindowTitle('QWebChannel交互Demo')
    browser.resize(900, 600)
    channel = QWebChannel()  # 增加一个通信中需要用到的频道
    printer = Print()  # 通信过程中需要使用到的功能类
    channel.registerObject('printer', printer)  # 将功能类注册到频道中，注册名可以任意，但将在网页中作为标识
    browser.page().setWebChannel(channel)  # 在浏览器中设置该频道
    url_string = (r"" + os.path.split(os.path.abspath(__file__))[0]+ "\index.html").replace("\\",'/')
    #print( os.path.dirname(__file__)) 
    print(url_string)
    browser.load(QUrl(url_string))
    # printer.emitAll()
    browser.show()
    printer.startEmit()
    sys.exit(app.exec_())