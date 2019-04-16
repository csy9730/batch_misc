import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
	Rectangle {
    	id:rect0
        width: 200
        height: 200
        color:"cyan"
		MouseArea{
        anchors.fill: parent
        onClicked: {
			rect0.color = "cyan";
            loaderA.item.rect.color = "purple";
            loaderA.item.loaderB.item.rect2.color = "black";
			
        }
    }
    }
    Loader{
        id:loaderA
        source: "A.qml"
		anchors.left: rect0.right
    }

}