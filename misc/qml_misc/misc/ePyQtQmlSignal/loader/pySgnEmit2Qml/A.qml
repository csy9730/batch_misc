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
    property alias textA: textA
	
    MouseArea{
        anchors.fill: parent
        onClicked: {
            loaderB.item.rect.color = "yellow";
            rect.color = "red";
            rect0.color = "black";
			
			loaderB.item.textB.text = "yellow";
            textA.text = "red";
            text0.text = "black";
        }
    }
    Text {
       id: textA
        x: 0
        y: 0
        anchors.fill: parent
        text: qsTr("TextA")
        font.pixelSize: 20
    }
}
