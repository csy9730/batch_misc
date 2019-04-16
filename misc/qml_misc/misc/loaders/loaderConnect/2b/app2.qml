import QtQuick 2.4
 
Rectangle {
    width: 500; height:300
	property var wid : 100
    Loader {
        id: loader
        focus: true
		width:wid
		onLoaded: {
			loader.item.width = wid;
			console.log("onLoaded",wid);            
			wid+=50
        }
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
