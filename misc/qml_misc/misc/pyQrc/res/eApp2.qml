import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
	id :root
    visible: true
    width: 320
    height: 200
    title: "ZAL_AI"
    color: "lightblue"
	Image {
		id: mapImg
		source: "qrc:res/demobg.png"
		anchors.centerIn: parent
		x:0
		y:0
	}
    Text {
        text: "hello World"
        anchors.centerIn: parent
    }
}
