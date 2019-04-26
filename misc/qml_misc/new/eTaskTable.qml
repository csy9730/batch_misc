import QtQuick 2.0

Rectangle {
    id: root
    width: 320; height: 240
    color: "lightgray"
    signal sendClicked(string str) // 定义信号

    Text {
        id: txt
        x: 20
        y: 28
        text:"New"
        font.pixelSize: 20
        // anchors.centerIn: parent
        MouseArea {
            id: mouse_area
            anchors.fill: parent  //有效区域
            onClicked: {
                root.sendClicked("Hello, Python3")//发射信号到Python
            }
        }
    }

    Text {
        id: txt1
        x: 22
        y: 94
        text: "Finished"
        font.pixelSize: 20
        MouseArea {
            id: mouse_area1
            anchors.fill: parent
        }
    }

    Text {
        id: txt2
        x: 22
        y: 167
        text: "Del"
        font.pixelSize: 20
        MouseArea {
            id: mouse_area2
            anchors.fill: parent
        }
    }


    Text {
        id: txt4
        x: 197
        y: 28
        text:"New"
        font.pixelSize: 20
        // anchors.centerIn: parent
        MouseArea {
            id: mouse_area4
            anchors.fill: parent  //有效区域
            onClicked: {
                root.sendClicked("Hello, Python3")//发射信号到Python
            }
        }
    }

    function abc(st) {// 定义函数
        txt.text += st
    }

}

