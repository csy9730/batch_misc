import QtQuick 2.0
 
Item {
	width:100
	height:200
    Rectangle {
		width:parent.width
		height:parent.height
        focus: true
		color:"blue"
        Keys.onPressed: {
            console.log("Loaded item captured: ", event.text)
            event.accepted = true
        }
    }
}
