import QtQuick 2.0

Item {
    property bool isFirst : false;
    width: 200
    height: 200

    Loader {
        id: pageLoader
        source: "Page2.qml"
        focus: true
    }
  
    Keys.onPressed: {
        console.log("Captured: ", event.text);
         event.accepted = true;
    }

}