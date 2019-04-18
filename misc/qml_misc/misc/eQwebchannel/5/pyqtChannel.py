import sys
import Web_UI
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import QObject,pyqtProperty
from PyQt5.QtWebChannel import QWebChannel
from MySharedObject import  MySharedObject
from PyQt5.QtWidgets import QApplication
import os

BASE_DIR = os.path.dirname(__file__)#获取当前文件夹的绝对路径

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QFrame()
    ui = Web_UI.Ui_Form()
    ui.setupUi(MainWindow)
    ui.webView1.load(QtCore.QUrl(r""+BASE_DIR+"/web_file3.html"))

    channel = QWebChannel() ##创建一个QwebChannel对象，用于传递PyQt的参数到JavaScript
    myObj = MySharedObject()
    print(myObj.strval)

    channel.registerObject('bridge', myObj)
    ui.webView1.page().setWebChannel(channel)

    MainWindow.show()
    sys.exit(app.exec_())
