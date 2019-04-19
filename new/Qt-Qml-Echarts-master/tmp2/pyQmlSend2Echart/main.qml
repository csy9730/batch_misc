import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
	Text{
		id :tx
		text: "1 text"
		width:150
		height: 100
		//Textfield{
		//	onClicked:{
		//		tx.text = "11111"
		//	}	
		//}

	}
    MyWebView{

    }

}
