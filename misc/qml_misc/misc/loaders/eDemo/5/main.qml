import QtQuick 2.0

Item {
    property bool isFirst : false;
    width: 200
    height: 200

    Loader {
        id: pageLoader
        source: "Page2.qml"
        focus: true
        onStatusChanged:  console.log(pageLoader.status == Loader.Ready)
        onLoaded: console.log("Loaded")
    }

    MouseArea {
        anchors.fill: parent
        onClicked: changePage();
    }

    function changePage() {
        if(isFirst) {
            pageLoader.source = "Page1.qml"
        } else {
            pageLoader.source = "Page2.qml"
        }

        isFirst = !isFirst;
    }

    Component {
        id: rect
        Rectangle {
            width: 200
            height: 50
            color: "red"
            Text {
                text: "Default Page"
                anchors.fill: parent
            }
        }
    }

    Keys.onPressed: {
        console.log("Captured: ", event.text);
         event.accepted = true;
    }

}