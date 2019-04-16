import sys,  os
import configparser

from PyQt5 import QtCore, QtGui
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, pyqtProperty,QUrl,QTimer

from PyQt5.QtWidgets import QWidget, QFileDialog, QMessageBox, QTableWidgetItem, QAbstractItemView, QTextEdit
from PyQt5.QtQuick import QQuickView

import time
class BackendOneshot(QObject):
    update_date = pyqtSignal(float)
    def __init__(self):
        super(BackendOneshot, self).__init__()
        self.ii = 0
    def emitDat(self, data=0.3):
        self.ii +=0.1
        print(self.ii)
        self.update_date.emit(float(self.ii))

        #time.sleep(0.5)
    def bind(self,fSlot):
        self.update_date.connect(fSlot)

class QmlSer(QObject):
    def __init__(self, context, parent=None):
        super().__init__(parent)
        self.win = parent
        self.ctx = context
        self.emDat = BackendOneshot()

        self.timer = QTimer()
        self.timer.timeout.connect(self.emDat.emitDat)

    def setNetcfg(self):
        try:
            self.emDat.bind(self.win.progBarStep)
        except:
            QMessageBox.warning(self,'警告', '网络配置错误')

    @pyqtSlot(str)    # 输入参数为str类型
    def outputString(self, st):
        print(st)

    @pyqtSlot()
    def trainAction(self):
        print("trainAction")
        self.setNetcfg()
        if 1:
            self.timer.start(1000)
        else:
            for i in range(10):
                self.emDat.emitDat(i/10.0)
                time.sleep(0.5)
        print("setNetcfg")

pthLst=[  'pySgn2pre.qml', 'pySgn2pro.qml']
pth = pthLst[0 ]

def main():
    app = QGuiApplication(sys.argv)
    qml = QQmlApplicationEngine(pth)
    root = qml.rootObjects()
    print(qml.rootObjects())
    print(root[0])
    cs = QmlSer(qml.rootContext() ,root[0])
    qml.rootContext().setContextProperty('ZalAi', cs)
    print(qml.rootObjects()[0].progBarStep)
    print(cs.win.progBarStep)
    cs.win.progBarStep(0.14159)
    sys.exit(app.exec())

def main2():
    app = QGuiApplication([])
    view = QQuickView()
    context = view.rootContext()
    view.setSource(QUrl(pth))
    view.engine().quit.connect(app.quit)
    view.show()
    con = QmlSer( context , view.rootObject())
    print(con.win.progBarStep)
    context.setContextProperty("ZalAi", con)
    #con.netCfg.network.show_loss_acc.emDat.bind(view.rootObject().progBarStep)

    app.exec_()

if __name__ == '__main__':
    main()