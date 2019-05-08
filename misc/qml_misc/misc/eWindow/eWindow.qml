

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

ApplicationWindow {
    id:idMainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Test")

    CheckBox {

        x: 67
        y: 63
        text: qsTr("FullScreen")
        Binding on checked { value: idMainWindow.visibility === Window.FullScreen }
        onClicked: {
            idMainWindow.visibility = Window.FullScreen;
        }
    }

    CheckBox {

        x: 163
        y: 63
        text: qsTr("Windowed")
        Binding on checked { value: idMainWindow.visibility === Window.Windowed }
        onClicked: idMainWindow.visibility = Window.Windowed
    }

    CheckBox {

        x: 67
        y: 94
        text: "Maximized"
        Binding on checked { value: idMainWindow.visibility === Window.Maximized }
        onClicked: idMainWindow.visibility = Window.Maximized

    }

    CheckBox {

        x: 163
        y: 94
        text: "Minimized"
        Binding on checked { value: idMainWindow.visibility === Window.Minimized }
        onClicked: idMainWindow.visibility = Window.Minimized
    }

    Button {

        x: 338
        y: 60
        width: 68
        height: 50
        text: qsTr("Exit")
        onClicked:
        {
            Qt.quit();
        }
    }
}
