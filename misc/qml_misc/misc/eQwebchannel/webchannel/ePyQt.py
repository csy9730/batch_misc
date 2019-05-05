import sys,  os
import configparser


from PyQt5.QtGui import QGuiApplication,QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, pyqtProperty,QUrl,QThread,QTimer
from PyQt5.QtWidgets import QWidget, QFileDialog, QMessageBox, QTableWidgetItem, QAbstractItemView, QTextEdit,QApplication
from PyQt5.QtQuick import QQuickView

class pyQml(QObject):
    def __init__(self, context, parent=None):
        super().__init__(parent)
        self.win = parent
        self.ctx = context
        # self.netcfg_init()
        # self.initSetting()
    @pyqtSlot(str)  # 输入参数为str类型
    def outputString(self, st):
        print(st)

def main4(pth):
    app = QApplication([])
    engine = QQmlApplicationEngine()
    engine.load(QUrl(pth))
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
	
	

    #QCoreApplication::setOrganizationName("QtExamples");
    #QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    #QtWebEngine::initialize();


def main4(pth):
    # from PyQt5.QtWebEngine import QtWebEngine



    app = QGuiApplication(sys.argv)
    qml = QQmlApplicationEngine()
    qml.load(QUrl((pth)))
    root = qml.rootObjects()
    # a=QtWebEngine()
    # a.initialize()
    # print(root[0])
    sys.exit(app.exec())
def main5(pth):
    from PyQt5 import QtGui, QtQml
    #from OpenGL import GL  #Linux workaround.  See: http://goo.gl/s0SkFl

    app = QtGui.QGuiApplication(sys.argv)
    engine = QtQml.QQmlApplicationEngine()
    engine.load(pth)
    cs = pyQml(engine.rootContext(),engine.rootObjects()[0])
    engine.rootContext().setContextProperty('ZalAi', cs)
    app.exec_()


if __name__ == '__main__':

    pthLst = ['res/ui/zal_ai0.qml', 'res/ui/zal_ai2.qml', 'res/ui/zal_ai_pre.qml', 'res/ui/zal_ai_pre2.qml',
              'res/ui/zal_ai_pre3.qml', 'res/ui/zal_ai_pre4.qml', 'main.qml']
    pth = pthLst[6]
    if len(sys.argv)>1:
        pth = sys.argv[1].split('\\')[-1]
    print(pth)
    # pth = r"D:\projects\zal_ai\source\zal_ai_ui\res\ui\main.qml"
    # pth =r'res\ui\main.qml'
    main4(pth)