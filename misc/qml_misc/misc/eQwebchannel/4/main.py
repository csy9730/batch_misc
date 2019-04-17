from PyQt5.QtWidgets import QApplication
import sys
from TMainWindow import TMainWindow
 
if __name__ == '__main__':
    app = QApplication(sys.argv)
 
    dlg = TMainWindow()
    dlg.show()
 
    app.exec_()
