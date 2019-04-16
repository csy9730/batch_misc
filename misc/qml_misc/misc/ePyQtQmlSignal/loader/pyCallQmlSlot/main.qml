import QtQuick.Window 2.2
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
	
//Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
	id:rot
    property var  fFlag:false
    function updateLoader() {// 定义函数
		if (fFlag == true){
			loaderA.item.rect.color = "purple";
			loaderB.item.rect.color = "black";
			rect0.color = "cyan";
			fFlag = !fFlag
		}else{
			loaderA.item.rect.color = "cyan";
			loaderB.item.rect.color = "purple";
			rect0.color = "black";
			fFlag = !fFlag
		}
    }
	Rectangle {
    	id:rect0
        width: 200
        height: 200
        color:"cyan"
		MouseArea{
        anchors.fill: parent
        onClicked: {
			updateLoader()
            //loaderA.item.rect.color = "purple";
            //loaderB.item.rect.color = "black";
			//rect0.color = "cyan";
        }
    }
    }
    Loader{
        id:loaderA
        source: "A.qml"
		anchors.left: rect0.right
    }
    Loader{
        id:loaderB
        source: "B.qml"
        anchors.left: loaderA.right
    }
}

