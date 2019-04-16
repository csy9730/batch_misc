import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item{
    width:200;height:200
    visible: true
    Loader{id:pageLoader}
    MouseArea{
        anchors.rightMargin: 8
        anchors.bottomMargin: 8
        anchors.leftMargin: 98
        anchors.topMargin: 51
        Text {
            id: name
            text: qsTr("click here")
            visible: true
        }
        anchors.fill: parent
        onClicked: pageLoader.source =  "Page1Form.ui.qml"
    }
    MouseArea{
        anchors.rightMargin: 108
        anchors.bottomMargin: 12
        anchors.leftMargin: 8
        anchors.topMargin: 55
        Text {
            id: name2
            text: qsTr("click here2")
            visible: true
        }
        anchors.fill: parent
        onClicked: pageLoader.source =  ""
    }
}
