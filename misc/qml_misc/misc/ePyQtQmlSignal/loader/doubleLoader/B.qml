import QtQuick 2.0
Item{
    width: 200
    height: 200
    Rectangle {
    	id:rect2
        width: 200
        height: 200
        color:"green"
    }
	property alias rect2: rect2
    MouseArea{
        anchors.fill: parent
        onClicked: {
			rect0.color = "gray";
            loaderA.item.rect.color = "blue";
            rect2.color = "green";
        }
    }
}