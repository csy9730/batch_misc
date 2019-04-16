import sys

from PyQt4.QtCore import QDateTime, QObject, QUrl, pyqtSignal
from PyQt4.QtGui import QApplication
from PyQt4.QtDeclarative import QDeclarativeView

if __name__=="__main__":
    app = QApplication(sys.argv)
    # Create the QML user interface.
    view = QDeclarativeView()
    view.setSource(QUrl('main.qml'))
    view.setResizeMode(QDeclarativeView.SizeRootObjectToView)
    view.setGeometry(100, 100, 400, 240)
    view.show()

    sys.exit(app.exec())
