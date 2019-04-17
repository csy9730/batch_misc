import sys,os
from PyQt5.QtCore import pyqtSlot,QUrl
from PyQt5.QtWidgets import QApplication
from PyQt5.QtWebChannel import QWebChannel
from PyQt5.QtWebEngineWidgets import QWebEngineView, QWebEnginePage

html = '''
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>        
        <script src="../js/qwebchannel.js"></script>
    </head>
    <body> <h2 id="header">Header.</h2> </body>
    <script>
        var backend;
        new QWebChannel(qt.webChannelTransport, function (channel) {
            backend = channel.objects.backend;
        });

        document.getElementById("header").addEventListener("click", function(){
            backend.foo();
        });
    </script>
</html>
'''

class HelloWorldHtmlApp(QWebEngineView):

    def __init__(self):
        super().__init__()

        # setup a page with my html
        my_page = QWebEnginePage(self)
        #my_page.setHtml(html)
        #self.setPage(my_page)

        url_string = (r"" + os.path.dirname(__file__) + "/2.html")
        self.load(QUrl(url_string))
        # setup channel
        self.channel = QWebChannel()
        self.channel.registerObject('backend', self)
        self.page().setWebChannel(self.channel)
        self.show()

    @pyqtSlot()
    def foo(self):
        print('bar')


if __name__ == "__main__":
    app = QApplication.instance() or QApplication(sys.argv)
    view = HelloWorldHtmlApp()
    view.show()
    app.exec_()