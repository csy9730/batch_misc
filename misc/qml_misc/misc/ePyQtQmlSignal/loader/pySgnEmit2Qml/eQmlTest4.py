# -*- coding: utf-8 -*-
from PyQt5.QtCore import QUrl, QTimer
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QUrl,QObject, pyqtSignal,QThread,QDateTime

import sys,time

def outputString(string):
    print(string)
	
class Backend(QThread):
	update_date = pyqtSignal(str)
	def run(self):
		while True:
			#data = QDateTime.currentDateTime()
			data=time.asctime().replace(':', ' ').replace(' ', '')
			print(data)
			#data='abcdefg'
			self.update_date.emit(str(data))
			time.sleep(1)

def main(pth):
	app = QApplication(sys.argv)	
	qml = QQmlApplicationEngine(pth)
	root = qml.rootObjects()[0]
	#print(root)
	timer = QTimer()
	timer.start(2000)
	timer.timeout.connect(root.updateLoader) # 调用QML函数
	app.exec_()
def main2(pth):
	app = QApplication(sys.argv)	
	qml = QQmlApplicationEngine(pth)
	root = qml.rootObjects()[0]

	b = Backend()
	b.update_date.connect(root.updateText)
	b.start()
	app.exec_()
if __name__ == '__main__':
	pth = 'main.qml'   # 加载的QML文件
	main2(pth)
	