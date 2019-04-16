import QtQuick 2.0
 
Item {
    Rectangle {
		width:100
		height:200
        focus: true
		color:"blue"
        Keys.onPressed: {
            console.log("Loaded item captured: ", event.text)
            event.accepted = true
        }
    }
}
