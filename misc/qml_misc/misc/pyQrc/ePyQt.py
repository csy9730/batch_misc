import sys,  os
import configparser

import rApp_rc

from PyQt5.QtGui import QGuiApplication,QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, pyqtProperty,QUrl,QThread,QTimer
from PyQt5.QtWidgets import QWidget, QFileDialog, QMessageBox, QTableWidgetItem, QAbstractItemView, QTextEdit,QApplication
from PyQt5.QtQuick import QQuickView

def main4(pth):
    app = QApplication([])
    engine = QQmlApplicationEngine()
    engine.load(QUrl(pth))
    # qml.show()
    app.exec_()
def main3(pth):
    app = QApplication(sys.argv)
    qml = QQmlApplicationEngine(pth)
    root = qml.rootObjects()
    print(root[0])
    # cs = QmlSer(qml.rootContext() ,root[0])
    # qml.rootContext().setContextProperty('ZalAi', cs)
    # print(qml.rootObjects()[0].progBarStep)
	
    sys.exit(app.exec())
if __name__ == '__main__':

    pthLst = ['main.qml','qrc:eApp.qml','qrc:res/eRect.qml','qrc:res/eItem.qml'
	,'qrc:res/eApp2.qml']
    pth = pthLst[4]
    if len(sys.argv)>1:
        pth = sys.argv[1].split('\\')[-1]
    print(pth)
    # pth = r"D:\projects\zal_ai\source\zal_ai_ui\res\ui\main.qml"
    # pth =r'res\ui\main.qml'
    main4(pth)