import sys
import math
import numpy as np

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine # , QQmlItem
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot,QTimer

class Plot(QObject):
    updCanv = pyqtSignal(float,float, arguments=['upd'])
    def __init__(self):
        QObject.__init__(self)
        self.rb = 1
        self.ii = 0
    def binding(self,fSlot):
        self.updCanv.connect(fSlot)

    def emitDat(self):
        ff =  lambda x: x * x + 0.3
        ff =  lambda x: 50+ 30* math.cos(x *0.2)
        points = ff(self.ii)
        self.ii+=1
        print( points )
        self.updCanv.emit(float( points),float(self.ii) )


if __name__ == "__main__":
    sys.argv += ['--style', 'material']
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    plot = Plot()
    engine.rootContext().setContextProperty("plot", plot)
    engine.load("eCanvasCurf3.qml")
    engine.quit.connect(app.quit)
    print( engine.rootObjects()[0] )

    plot.binding( engine.rootObjects()[0].addPoint )

    tim = QTimer()
    tim.start(10)
    tim.timeout.connect(plot.emitDat)


    sys.exit(app.exec_())
