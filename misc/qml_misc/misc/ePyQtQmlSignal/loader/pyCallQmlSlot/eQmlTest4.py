# -*- coding: utf-8 -*-
from PyQt5.QtCore import QUrl, QTimer
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine


import sys


if __name__ == '__main__':
	pth = 'main.qml'   # 加载的QML文件
	
	app = QApplication(sys.argv)	
	qml = QQmlApplicationEngine(pth)
	root = qml.rootObjects()[0]
	print(root)

	timer = QTimer()
	timer.start(2000)
	timer.timeout.connect(root.updateLoader) # 调用QML函数

	app.exec_()