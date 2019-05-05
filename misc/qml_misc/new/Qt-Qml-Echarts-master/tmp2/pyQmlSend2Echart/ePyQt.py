#! /usr/bin/env
# -*- coding: utf-8 -*-
# webview.py

import sys,os
import random
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSlot, QUrl,pyqtSignal,QTimer
from PyQt5.QtWebChannel import QWebChannel
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtGui import QGuiApplication,QIcon
# print(os.path.dirname(__file__)
class Print(QObject):
    sgn = pyqtSignal(str)
    sgnDat = pyqtSignal(float)
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
        self.sgnDat.emit( random.randint(1,200))
        print("emit")
        self.strval +=random.choice('abcdefghijklmnopqrstuvwxyz')

    @pyqtSlot()
    def startEmit(self):
        self.timer.start(10)

    @pyqtSlot()
    def stoptEmit(self):
        print("stop emit")
        self.timer.stop()
def main4(pth):
    app = QGuiApplication(sys.argv)
    qml = QQmlApplicationEngine()
    qml.load(QUrl((pth)));
    printer = Print() 
    #root = qml.rootObjects()	
    qml.rootContext().setContextProperty('printer', printer)
    # qml.show()
    '''
    channel.registerObject('printer', printer)  # 

    '''
	
if __name__ == '__main__':
    

    url_string = (r"main.qml")
    print(url_string)
    main4(url_string)

    
