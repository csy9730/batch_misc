import QtQuick 2.0
 
Rectangle {
    id: myItem
    //signal message(string msg)
    width: 150; height: 100
	color:"blue"
    MouseArea {
        anchors.fill: parent
        onClicked: {
			console.log("clck")
			
		}
    }
	
	focus:true
	Keys.enabled:true
	Keys.onPressed: {
		console.log("key pressed")
		//myItem.message("clicked!")
		switch(event.key){
		case Qt.Key_Left:
			console.log("Key_Left")
			break;
		case Qt.Key_Right:
			console.log("Key_Right")
			break;
		case Qt.Key_Down:
			console.log("Key_Down")
			break;
		case Qt.Key_Up:
			console.log("Key_Up")
			break;
		default:
			return;
		}
		event.accepted = true
	}

}