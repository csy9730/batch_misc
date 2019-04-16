import QtQuick 2.0
//import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
ApplicationWindow {
    visible: true
    width: 220
    height: 260
    title: "ZAL_AI"
    color: "lightblue"
    Text {
        id: txt
        text: "Clicked me"
        anchors.verticalCenterOffset: -34
        anchors.horizontalCenterOffset: 0
        font.pixelSize: 20
        anchors.centerIn: parent
    }
    MouseArea {
        id: mouse_area
        anchors.fill: parent  // 有效区域
        onClicked: {
            var filepath = new String(txt.text)
            con.outputString(filepath) //QML显式的调用Python函数
        }

        Button {
            id: button
            x: 45
            y: 149
            text: qsTr("press to add number")
            onClicked: {
                console.log("test...")  // 控制台打印信息
                //var filepath = new String(button.text)
                button.text = con.returnValue(20) //QML显式的调用Python函数
            }
        }
    }
}
