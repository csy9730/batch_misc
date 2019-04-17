#! /usr/bin/env
# -*- coding: utf-8 -*-
# webview.py

import sys,os
from PyQt5.QtWidgets import QApplication,QMessageBox
from PyQt5.QtCore import QObject, pyqtSlot, QUrl,pyqtProperty,QTimer,pyqtSignal
from PyQt5.QtWebChannel import QWebChannel
from PyQt5.QtWebEngineWidgets import QWebEngineView

def printA():
    print("1")
# print(os.path.dirname(__file__)
class Print(QObject):
    sgn =pyqtSignal(str)
    @pyqtSlot(str, result=str)
    def print(self, content):
        print(content)  # 对接收到的内容进行处理，比如调用打印机进行打印等等。此处略去，只在bash中显示接收到的消息
        return content
    # pyqtSlot，中文网络上大多称其为槽。作用是接收网页发起的信号
    def __init__(self,strval = '100'):
        super(Print,self).__init__()
        self.strval = strval
    def _getStrValue(self):
        return self.strval
    def _setStrValue(self,st):
        self.strval = st
        print('获得页面参数：%s'% st)
        # QMessageBox.information(self,"Infomation", '获得的页面参数%s' % st)
    def incStrValue(self):
        print('页面参数：%s'% self.strval)
        sa = self.strval + "a"
        self.sgn.emit(sa)
        self._setStrValue(sa)
        #

    #需要定义的对外发布的方法
    strValue= pyqtProperty(str,_getStrValue,_setStrValue)




if __name__ == '__main__':
    print()
    app = QApplication(sys.argv)
    browser = QWebEngineView()  # 新增一个浏览器引擎
    browser.setWindowTitle('QWebChannel交互Demo')
    browser.resize(900, 600)
    channel = QWebChannel()  # 增加一个通信中需要用到的频道
    printer = Print()  # 通信过程中需要使用到的功能类
    print(printer.strval)
    channel.registerObject('bridge', printer)  # 将功能类注册到频道中，注册名可以任意，但将在网页中作为标识
    browser.page().setWebChannel(channel)  # 在浏览器中设置该频道
    url_string = (r"" + os.path.dirname(__file__) + "/web_file3.html")
    browser.load(QUrl(url_string))
    # printer._setStrValue("200")
    #printer.incStrValue()
    #printer.incStrValue()

    timer = QTimer()
    timer.start(2000)
    timer.timeout.connect(printer.incStrValue)  # 调用QML函数
    browser.page().runJavaScript("showAlert()")
    browser.show()
    #printer.sgn.connect( browser.page().runJavaScript("fAbc()") )
    sys.exit(app.exec_())
