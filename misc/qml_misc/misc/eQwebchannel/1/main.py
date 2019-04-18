#! /usr/bin/env
# -*- coding: utf-8 -*-
# webview.py

import sys,os
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QObject, pyqtSlot, QUrl
from PyQt5.QtWebChannel import QWebChannel
from PyQt5.QtWebEngineWidgets import QWebEngineView
# print(os.path.dirname(__file__)
class Print(QObject):
    # pyqtSlot，中文网络上大多称其为槽。作用是接收网页发起的信号
    @pyqtSlot(str, result=str) 
    def print(self, content):
        print(content)  # 对接收到的内容进行处理，比如调用打印机进行打印等等。此处略去，只在bash中显示接收到的消息
        return content


if __name__ == '__main__':
    print()
    app = QApplication(sys.argv)
    browser = QWebEngineView()  # 新增一个浏览器引擎
    browser.setWindowTitle('QWebChannel交互Demo')
    browser.resize(900, 600)
    channel = QWebChannel()  # 增加一个通信中需要用到的频道
    printer = Print()  # 通信过程中需要使用到的功能类
    channel.registerObject('printer', printer)  # 将功能类注册到频道中，注册名可以任意，但将在网页中作为标识
    browser.page().setWebChannel(channel)  # 在浏览器中设置该频道
    url_string = (r"file:///" + os.path.dirname(__file__) + "/index.html")
    browser.load(QUrl(url_string))
    browser.show()
    sys.exit(app.exec_())