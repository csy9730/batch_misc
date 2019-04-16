import sys,  os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, pyqtProperty,QUrl
from PyQt5.QtWidgets import QWidget, QFileDialog, QMessageBox, QTableWidgetItem, QAbstractItemView, QTextEdit,QApplication
from PyQt5.QtQuick import QQuickView



def main(pth):
    app = QGuiApplication(sys.argv)
    qml = QQmlApplicationEngine(pth)
    root = qml.rootObjects()
    print(root[0])
    cs = QmlSer(qml.rootContext() ,root[0])
    qml.rootContext().setContextProperty('ZalAi', cs)
    print(qml.rootObjects()[0].progBarStep)
    print(cs.win.progBarStep(40))
    #cs.win.addPoint2(0.14159,1)
    sys.exit(app.exec())

def main2(pth):
    app = QGuiApplication([])
    view = QQuickView()
    context = view.rootContext()
    view.setSource(QUrl(pth))
    view.engine().quit.connect(app.quit)
    view.show()
    con = QmlSer( context , view.rootObject())
    #print(con.win.addPoint2)
    context.setContextProperty("ZalAi", con)
    #con.netCfg.network.show_loss_acc.emDat.bind(view.rootObject().progBarStep)

    app.exec_()

def main3(pth):
	app = QApplication(sys.argv)
	#qml = QQmlApplicationEngine(pth)
	qml = QQmlApplicationEngine()
	print(QUrl(pth))
	qml.load(QUrl(pth))
	#root = qml.rootObjects()
	#print(root[0])
	#print(qml.rootObjects()[0].progBarStep)
	#for i in range(0):
	#    print(cs.win.progBarStep(i))
	#cs.win.addPoint2(0.14159,1)
	app.exec_()
	#sys.exit(app.exec())
if __name__ == '__main__':
	import sys
	print(sys.argv)
	if len(sys.argv)>1:
		pth = sys.argv[1]
	else:		
		pth ='main.qml'
	main3(pth)