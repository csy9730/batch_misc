import QtQuick 2.0

Item {
    property bool isFirst : false;
    width: 200
    height: 200

    Loader {
        id: pageLoader
        source: "Page1.qml"
    }


    Connections {
        target: pageLoader.item
        onMessage2: console.log(msg);
    }

}