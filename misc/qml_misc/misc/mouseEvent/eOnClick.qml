import QtQuick 2.0
 
Rectangle {
    width: 100
    height: 100
    color: "green"
	visible:true
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            //ÓÒ¼ü
            if(mouse.button == Qt.RightButton)
                parent.color = "blue"
            //×ó¼ü + shift¼ü
            else if((mouse.button == Qt.LeftButton) && (mouse.modifiers & Qt.ShiftModifier))
                parent.color = "green"
            else
                parent.color = "red"
        }
		 onDoubleClicked: {
			 parent.color = "yellow"
			 console.log("onDoubleClicked");
			 
		} //Ë«»÷´¥·¢
    }
}
