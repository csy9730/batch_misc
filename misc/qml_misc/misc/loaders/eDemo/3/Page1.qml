import QtQuick 2.0

Rectangle {
    id: myItem
    signal message2(string msg)
    width: 100; height: 100

    MouseArea {
        anchors.fill: parent
        onClicked: myItem.message2("clicked!");
    }
	Text {
        anchors.centerIn: parent
        text: "Page1 Test"
    }
}
