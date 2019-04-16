
import QtQuick 2.4
 
Item {
    width: 100; height: 100
    Loader {
		focus:true
        id: myLoader
        source: "MyItem.qml"
    }
    Connections {
        target: myLoader.item
        //onMessage: console.log(msg)
    }
}
