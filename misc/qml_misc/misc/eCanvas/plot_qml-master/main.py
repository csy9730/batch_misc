import sys
import math
import numpy as np

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot,QTimer

def generate_points(left_bound, right_bound, func):
    step = 0.005
    points = [[float(i), float(func(i))] for i in np.arange(left_bound, right_bound + step, step)]
    return points
 

class Plot(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.rb = 1
        self.incFlag = True
    updCanv = pyqtSignal(list, arguments=['upd'])
 
    @pyqtSlot(float, float, str)
    def upd(self, left_bound, right_bound, func):
        if func in ('cos', 'sin', 'tan'):

            points = generate_points(left_bound, right_bound, eval(f"math.{func}"))
        if func == 'sqrt':
            if left_bound >= 0:
                points = generate_points(left_bound, right_bound, math.sqrt)
            else:
                points = []
        if func == 'x^2':
            points = generate_points(left_bound, right_bound, lambda x: x * x*self.rb  )
        
        print(points)
        print(self.rb)
        self.updCanv.emit(points)
    def inc(self):
        print(self.rb)
        if self.rb>55:
            self.rb *=0.9
            self.incFlag =False
        elif self.rb<0.02:
            self.rb *=1.1
            self.incFlag =True
        elif self.incFlag ==True:
            self.rb *=1.1
        else:
            self.rb *=0.9
			
    #@pyqtSlot( result=list)
    def emitDat(self):
        print("emit dat")
        points = generate_points(-5, 5, lambda x: x * x + 0.3)
        print( points )
        self.updCanv.emit(points)


if __name__ == "__main__":
    sys.argv += ['--style', 'material']
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    plot = Plot()
    engine.rootContext().setContextProperty("plot", plot)
    engine.load("main.qml")
    engine.quit.connect(app.quit)

    timer = QTimer()
    timer.start(2000)
    #timer.timeout.connect(plot.emitDat)
    timer.timeout.connect(plot.inc)

    sys.exit(app.exec_())
