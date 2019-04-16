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
    MouseArea{
        anchors.fill: parent
        onClicked: {
            loaderB.item.rect.color = "yellow";
            rect.color = "red";
			rect0.color = "black";
        }
    }
}