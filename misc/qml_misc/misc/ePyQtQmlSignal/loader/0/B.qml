import QtQuick 2.0
Item{
    width: 200
    height: 200
    Rectangle {
    	id:rect
        width: 200
        height: 200
        color:"green"
    }
	property alias rect: rect
    MouseArea{
        anchors.fill: parent
        onClicked: {
            loaderA.item.rect.color = "blue";
            rect.color = "green";
			rect0.color = "gray";
        }
    }
}