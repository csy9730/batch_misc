import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.3


ApplicationWindow{
	title:qsTr("Hello Image");
	width:600; height:600;
	visible: true
	Rectangle{
		 id:imageDisplay;
		 width:600; height:600;
		 Image{
			 id:img;
			 width:parent.width;
			 height:parent.height;
			 anchors.centerIn: parent;
			 fillMode: Image.PreserveAspectFit;
			 source:"finalfrontier.png";
		 }
		 MouseArea{
			anchors.fill: parent
			onWheel: {
				if (wheel.modifiers & Qt.ControlModifier) {
					imageDisplay.rotation += wheel.angleDelta.y / 120 * 5;
					if (Math.abs(imageDisplay.rotation) < 4)
						imageDisplay.rotation = 0;
				} else {
					imageDisplay.rotation += wheel.angleDelta.x / 120;
					if (Math.abs(imageDisplay.rotation) < 0.6)
						imageDisplay.rotation = 0;
					var scaleBefore = imageDisplay.scale;
					imageDisplay.scale += imageDisplay.scale * wheel.angleDelta.y / 120 / 10;
				}
			}
		 }
	}
}