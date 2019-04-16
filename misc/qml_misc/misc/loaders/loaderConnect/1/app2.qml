import QtQuick 2.0
//import QtCharts 2.0
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2


ApplicationWindow {
    visible: true
    width: 100; height: 100
    Loader {
        id: myLoader
        source: "MyItem.qml"
    }
    Connections {
        target: myLoader.item
        //onMessage: console.log(msg)
    }
}
