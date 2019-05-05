import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebChannel 1.0
import QtWebEngine 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
	property int urlFlag:1
    ColumnLayout {
        anchors.fill: parent
			anchors.margins: 5
		 Rectangle {
			Layout.fillWidth: true
			Layout.preferredHeight: parent.height * 0.4
			border.width: 2
			border.color: "green"

			TextInput {
				id: txt
				anchors.centerIn: parent
				font.pixelSize: 40
				color: "green"
				text: "Some text"
				focus: true		
			}			
            Button{
                text: "send to html"
                onClicked:{
                    // MyWebView.printStr()
					someObject.someSignal( txt.text)
					//someObject.someSNum( txt2.text)
                }
            }
			Button{
				y:30
                text: "timer html"
                onClicked:{
					urlFlag = !urlFlag
					web_view.url=urlFlag?"static/eEchartTimer/testTimer.html":"test.html"
                }
            }
		 }
		 Rectangle{
			Layout.fillWidth: true
			Layout.fillHeight: parent.height * 0.4
			border.width: 2
			border.color: "blue"

			QtObject {
				id: someObject

				// ID, under which this object will be known at WebEngineView side
				WebChannel.id: "backend"

				signal someSignal(string message);
				//signal someNum(float num);
				
				function changeText(newText) {
					console.log(newText);
					someSignal.emit( "abc")
					return "New text length: " 
				}
			}
			WebEngineView{
				id : web_view
				anchors.fill: parent
				anchors.margins: 5
				url:"test.html"
				webChannel:  web_channel
				onLoadingChanged: {
					if (loadRequest.errorString)
						{ console.error(loadRequest.errorString); }
				}
			}
			WebChannel {
				id : web_channel
				registeredObjects: [someObject]
			}
			Component.onCompleted:  {
				//web_channel.registerObject("jsBar", bar);
			}
			
		 }
	}


}
