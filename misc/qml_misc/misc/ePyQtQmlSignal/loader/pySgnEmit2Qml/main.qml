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
	
	function updateText(s1){
		if (fFlag == true){			
            text0.text = s1;
			loaderA.item.textA.text = s1;
			fFlag = !fFlag
		}else{
            text0.text = s1;
			loaderB.item.textB.text = s1;
			fFlag = !fFlag
		}
	}
    function updateLoader() {// 定义函数
		if (fFlag == true){
            rect0.color = "cyan";
			loaderA.item.rect.color = "purple";
			loaderB.item.rect.color = "pink";
			
            text0.text = "cyan";
			loaderA.item.textA.text = "purple";
			loaderB.item.textB.text = "pink";
			fFlag = !fFlag
		}else{
            rect0.color = "white";
			loaderA.item.rect.color = "cyan";
			loaderB.item.rect.color = "purple";
            text0.text = "white";
			loaderA.item.textA.text = "cyan";
			loaderB.item.textB.text = "purple";
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
        Text {
           id: text0
            x: 0
            y: 0
            anchors.fill: parent
            text: qsTr("TextB")
            font.pixelSize: 24
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

