import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2


ApplicationWindow {
    visible: true
    width: 480
    height: 370
    title: "ZAL_AI"
    color: "#00ffffff"
    //color: "white"
    property alias button6: button6
    property alias pageLoader: pageLoader
    property alias button5: button5
    property alias button4: button4
    property ProgressBar progBar

    onClosing: {
        ZalAi.on_closed()
    }

    Loader{id:pageLoader}
    ColumnLayout {
        id: columnLayout
        x: 119
        y: 55
        width: 265
        height: 310
        ColumnLayout{
            id: rowLayout5
            x: 287
            y: 188
            width: 100
            height: 100
            Button {
                id: button4
                objectName: "TrainButton"
                //imgSrc: "图像训练.png"
                x: 429
                y: 41
                text: qsTr("图像训练")
                Layout.fillWidth: true

                //Layout.rowSpan: 3
                Layout.minimumWidth: 100
                //Layout.minimumHeight: parent.height
                //onClicked: ZalAi.trainAction()
                onClicked:{
                    pageLoader.source =  "pySgn2Pro.qml"
                }
            }

            Button {
                id: button5
                x: 429
                y: 81
                text: qsTr("一维信号分类")
                Layout.minimumWidth: 100
                objectName: "TrainButton"
                Layout.fillWidth: true
                onClicked:{
                    pageLoader.source =  "zal_ai0.qml"
                }
            }

            Button {
                id: button6
                x: 429
                y: 101
                text: qsTr("相机校准")
                Layout.minimumWidth: 100
                objectName: "TrainButton"
                Layout.fillWidth: true
                onClicked:{
                    pageLoader.source =  "zal_ai0.qml"
                }
            }
        }

        //进度条
        ProgressBar{
            id: progBar0
            x: 184
            y: 244
            orientation: Qt.Horizon;
            minimumValue: 0;
            maximumValue: 1;
            value: 0.1;
            width: 134
            height: 35
            visible: true
        }
    }
    function progBarStep(asdf)
    {
        ZalAi.outputString("progBarStep") //QML显式的调用Python函数
        progBar0.value = asdf
        progBar.value = asdf
    }





}
