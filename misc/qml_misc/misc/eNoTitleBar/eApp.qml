import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import "./common/" as Common
ApplicationWindow {
	id :root
    visible: true
    width: 320
    height: 200
    title: "ZAL_AI"
    color: "lightblue"
	//color:Qt.rgba(0.5,0.5,0.5,0.9)
	// flags:Qt.Window | Qt.FramelessWindowHint
	Rectangle{
		x:0
		y:0
		height:25
		width:240
		color: "blue"
		MouseArea{
			id:moveArea
			anchors.fill:parent
			acceptedButtons:Qt.LeftButton
			property point clickPos: "0,0"
			onPressed:{
				clickPos = Qt.point(mouse.x,mouse.y)
			}
			onPositionChanged:{
				var delta = Qt.point(mouse.x -clickPos.x,mouse.y - clickPos.y)
				root.setX(root.x+delta.x)
				root.setY(root.y+delta.y)
			}
		}

	}
	Rectangle{
		x:280
		y:0
		height:25
		width:40
		//color: "red"
		Common.CustomButton  {
			id:minBtn
			x: 0
			y: 0
			anchors.fill:parent
			framewidth : 29
			clickType: 3
			btnurl: "../img/min.png"
			onSignalClickedBtn: {
				console.log("min")// signalQmlOptions("system","min");
				// Qt.quit()
				//root.close()
				// root.visibility = Window.FullScreen
				root.visibility = Window.Minimized
				root.visibility = Window.Windowed
				//root.maximize()//root.minimize()
				
			}
		}
	}
	Image {
		id: mapImg
		x:10
		y:35
		source: "../img/min.png"
		// anchors.centerIn: parent
	}
    Text {
        text: "hello World"
        anchors.centerIn: parent
    }
}
