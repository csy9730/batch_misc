import QtQuick 2.0


Rectangle {
    id: window
    width: 320
    height: 480
    focus: true
    color: "#2728d2"
    visible: true
    Text {
        id: text1
        x: 105
        y: 164
        text: qsTr("Text")
        font.pixelSize: 44
    }

    Timer{
        id: timer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            text1.text+='a'
            //string(Math.random())
        }
    }

    Timer{
        id: timer2
        interval: 777
        running: true
        repeat: true
        onTriggered: {
            text1.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        }
    }

}
