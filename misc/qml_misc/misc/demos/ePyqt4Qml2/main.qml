import QtQuick 2.0
import Qt 4.7

Rectangle{
    width:  360
    height: 360
    Text {
        text: qStr("Hello World")
        anchors.centerIn: parent
    }
    MouseArea{
        anchors.fill:parent
        onClicked:{
            Qt.quit();
        }
    }
}

/*
Item {
	visible: true
	Text {
		 text: "hello World"
		anchors.centerIn: parent
	}
}

Item {
    width: 400
    height: 400
}

*/
