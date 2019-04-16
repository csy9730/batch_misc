import QtQuick 2.0
Item{
    width: 200
    height: 200
    Rectangle {
    	id:rect
        width: 200
        height: 200
        color:"red"
    }
    property alias rect: rect
    property alias loaderB: loaderB
    MouseArea{
        anchors.fill: parent
        onClicked: {
			rect0.color = "black";
			rect.color = "red";
            loaderB.item.rect2.color = "yellow";
            
			
        }
    }
	Loader{
        id:loaderB
        source: "B.qml"
        anchors.left: rect.right
    }
}