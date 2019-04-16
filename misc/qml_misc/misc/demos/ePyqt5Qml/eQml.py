import sys
from PyQt5.QtWebEngine import QtWebEngine 
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtCore import QUrl
from PyQt5.QtQuick import QQuickView
pthLst=["eApp.qml","eWindow.qml","eItem.qml","eRect.qml"]
pth = pthLst[0]

def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(QUrl(pth))
    print( engine.rootObjects(),engine.rootContext())

    sys.exit(app.exec())
def main2():
    app = QGuiApplication(sys.argv)
    view = QQuickView()
    view.setSource(QUrl(pth))
    view.show()
    print( view.rootObject(),view.rootContext() )
    view.engine().quit.connect(app.quit)
    sys.exit(app.exec())
def main2a():
    app = QGuiApplication(sys.argv)
    view = QQuickView(QUrl(pth))
    view.show()
    print( view.rootObject(),view.rootContext() )

    view.engine().quit.connect(app.quit)
    sys.exit(app.exec())
if __name__=="__main__": 
    main2()
