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
            loaderA.item.rect.color = "purple";
            loaderB.item.rect.color = "black";
			rect0.color = "cyan";
        }
    }
    }
    Loader{
        id:loaderA
        source: "A.qml"
		anchors.left: rect0.right
    }
    Loader{
        id:loaderB
        source: "B.qml"
        anchors.left: loaderA.right
    }
}