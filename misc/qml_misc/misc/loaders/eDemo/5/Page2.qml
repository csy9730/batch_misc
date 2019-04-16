import QtQuick 2.0

Rectangle {
    width: 100
    height: 62
    Text {
        anchors.centerIn: parent
        text: "Page2 Test"
    }
    focus: true
    Keys.onPressed: {
        console.log("Loaded 2 item captured: ", event.text);
        event.accepted = true;
    }
}