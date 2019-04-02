import sys,  os
import configparser


from PyQt5.QtGui import QGuiApplication,QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, pyqtProperty,QUrl,QThread,QTimer
from PyQt5.QtWidgets import QWidget, QFileDialog, QMessageBox, QTableWidgetItem, QAbstractItemView, QTextEdit,QApplication
from PyQt5.QtQuick import QQuickView


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