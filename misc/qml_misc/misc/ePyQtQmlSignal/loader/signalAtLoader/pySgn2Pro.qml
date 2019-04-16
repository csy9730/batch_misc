import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 720
    height: 560
    title: "ZAL_AI"
	color: "lightblue"
    onClosing: {
        ZalAi.on_closed()
    }

    ColumnLayout {
        id: columnLayout
        x: 262
        y: 159
        width: 277
        height: 255

        RowLayout {
            id: rowLayout5
            x: 287
            y: 188
            width: 100
            height: 100
            Button {
                id: button4
                objectName: "TrainButton"
                x: 429
                y: 181
                text: qsTr("开始训练")
                Layout.fillWidth: true
                //Layout.rowSpan: 3
                Layout.minimumWidth: 100
                //Layout.minimumHeight: parent.height
                onClicked: ZalAi.trainAction()
            }

        }

        //进度条
        ProgressBar{
            id: progBar
            orientation: Qt.Horizon; 
            minimumValue: 0;
            maximumValue: 1;
            value: 0.0;
            width: 20;
            height: 200;
            visible: true
        }
    }

    function progBarStep2(asdf)
    {

        ZalAi.outputString("progBarStep2") //QML显式的调用Python函数
        progBar.value = asdf/10.0
    }
}
