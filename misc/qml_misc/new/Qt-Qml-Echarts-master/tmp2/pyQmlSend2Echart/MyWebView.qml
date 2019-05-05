import QtQuick 2.0
import QtWebChannel 1.0
import QtWebEngine 1.4

Item {

    anchors.fill: parent
	Text{
		text: "abc text"
		width:200
		height: 300
	}
    WebEngineView{
        anchors.fill: parent
        url:"index.html"
//      url: "http://www.baidu.com"
		webChannel: channel
    }

	WebChannel {
		id: channel
		//registeredObjects: printer
		// channel.registerObject('printer', printer)  # 
	}

}
