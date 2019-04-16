import QtQuick 2.4
 
Rectangle {
    width: 200; height:200
    Loader {
        id: loader
        focus: true
    }
    MouseArea {
        anchors.fill: parent
		acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
			if(mouse.button == Qt.LeftButton)
                loader.source = "KeyReader.qml"
			else
				loader.source = ""
		}
    }
    //Keys.onPressed: {
    //    console.log("Captured: ", event.text);
    //}
}
