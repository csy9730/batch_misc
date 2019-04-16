import QtQuick 2.3
import QtQuick.Window 2.2
 
Window {
    visible: true
    Rectangle{
 
        Text {//用于显示按键情况
            anchors.centerIn: parent
            id: keyname;
            text: qsTr("键盘记录器");
        }
        focus: true//不获取焦点是不能处理键盘事件的，所以要设置为true
        width: 200;
        height: 200;
        anchors.centerIn: parent;
        Keys.enabled: true;
        Keys.onEscapePressed: Qt.quit();
        Keys.onPressed: {
            switch(event.key)
            {
            case Qt.Key_0:
            case Qt.Key_1:
            case Qt.Key_2:
            case Qt.Key_3:
            case Qt.Key_4:
            case Qt.Key_5:
            case Qt.Key_6:
            case Qt.Key_7:
            case Qt.Key_8:
            case Qt.Key_9:
            event.accepted=true;
                keyname.text=event.key-Qt.Key_0;
                break;
            }
        }
    }
}