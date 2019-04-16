#!/usr/bin/env python
'''
1）QML显式的调用Python函数
定义一个继承QtCore.QObject类，
定义使用@pyqtSlot修饰符修饰的类成员函数

创建rootContext对象，并使用setContextProperty（string, object）注册对象，    
这样在QML中就可以调用这个修饰的类成员函数了。
'''

from PyQt5.QtCore import QUrl, QObject, pyqtSlot
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
import sys

class MyClass(QObject):
    def __init__(self):
        super(MyClass, self).__init__()
        self.i = 0
    @pyqtSlot(str)    # 输入参数为str类型
    def outputString(self, string):
        print(string)
    @pyqtSlot(int, result=str)    # 声明为槽，输入参数为int类型，返回值为str类型
    def returnValue(self, value):
        return str(value+10)

if __name__ == '__main__':
    from PyQt5.QtQml import QQmlApplicationEngine
    app=QGuiApplication(sys.argv)
    engine=QQmlApplicationEngine()
    engine.load(QUrl("test1b.qml"))

    con = MyClass()
    context = engine.rootContext()
    context.setContextProperty("con", con)

    sys.exit(app.exec())