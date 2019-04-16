import sys
from PyQt5.QtWebEngine import QtWebEngine 
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtCore import QUrl
if __name__=="__main__": 
	app=QGuiApplication(sys.argv) 
	engine=QQmlApplicationEngine() 
	engine.load(QUrl("openFile.qml"))
	sys.exit(app.exec())
