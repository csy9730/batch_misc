import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebChannel 1.0
import QtWebEngine 1.4

Item {

    anchors.fill: parent
		

	// 一个具有属性、信号和方法的对象——就像任何普通的Qt对象一样
	QtObject {
		id: someObject

		// ID，在这个ID下，这个对象在WebEngineView端是已知的
		WebChannel.id: "backend"

		property string someProperty: "Break on through to the other side"

		signal someSignal(string message);

		function changeText(newText) {
			txt.text = newText;
			return "New text length: " + newText.length;
		}
	}

	Text {
		id: txt
		text: "Some text"
		onTextChanged: {
			// 此信号将在WebEngineView端触发一个函数(如果连接的话)
			someObject.someSignal(text)
		}
	}

	WebEngineView {
		url: "index.html"
		webChannel: channel
	}

	WebChannel {
		id: channel
		registeredObjects: [someObject]
	}
}


