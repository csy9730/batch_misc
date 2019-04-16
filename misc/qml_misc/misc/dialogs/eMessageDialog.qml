import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
//import QtQuick.Window  1.0
Item{
    id: mainWindow
    visible: true
    width:  320
    height: 676

    //无边框
   //flags: Qt.FramelessWindowHint//|Qt.Window
    MessageDialog{
        id: msgTrainFinish
        x:200;y:20
        //x:0;y:0
        //anchors.right: parent.left
        width: 200
        height: 80
        visible: true
        title:'train !'
        text:"train finished "
        onAccepted: {

        }
    }

        //悬浮窗口自动消失定时器
    Timer{
        id:timerId
        interval: 5000
        onTriggered: {
            console.log("timer out")
            airMessageBoxId.visible = false;
        }
    }


      


//----------------------------AirMessageBox
/*
    //提示信息弹出框
    AirMessageBox{
        id:airMessageBoxId
        x:200;y:20
        //x:0;y:0
        //anchors.right: parent.left
        width: 200
        height: 80
        visible: true
    }
BorderImage {
    id:airMessageBox

    //显示内容
    property alias contectText: contentTextId.text

    width: 200; height: 80
    border { left: 20; top: 20; right: 30; bottom: 20 }
    horizontalTileMode: BorderImage.Repeat
    verticalTileMode: BorderImage.Repeat
    //source: "image/bg_other/balloon.png"

    Rectangle {
        id: shade;
        anchors.fill: airMessageBox;
        //radius: 10; color: "black";
        opacity: 0;
    }

*/
    //显示内容
    Text{
        id:contentTextId
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text:"message"
        font.pointSize: 10

    }

    Button {
        id: button
        x: 23
        y: 445
        text: qsTr("Button")
        onClicked: {
            msgTrainFinish.open()
        }
    }

}
