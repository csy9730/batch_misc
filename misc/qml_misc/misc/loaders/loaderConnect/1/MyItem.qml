import QtQuick 2.0
 
Rectangle {
    id: myItem
    //signal message(string msg)
    width: 100; height: 100
	color:"blue"
    MouseArea {
        anchors.fill: parent
        onClicked: {
			console.log("clck")
			//myItem.message("clicked!")
		}
    }

}