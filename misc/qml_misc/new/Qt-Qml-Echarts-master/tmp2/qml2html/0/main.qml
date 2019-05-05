import QtQuick 2.0
import QtWebEngine 1.4
import QtWebChannel 1.0

Item {

    /*anchors.fill: parent

    WebEngineView{
        anchors.fill: parent
       url:"test.html"
        //url:"testTimer.html"
//        url: "http://www.baidu.com"
    }
	*/

	// һ���������ԡ��źźͷ����Ķ��󡪡������κ���ͨ��Qt����һ��
	QtObject {
		id: someObject
	 
		// ID�������ID�£����������WebEngineView������֪��
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
			// ���źŽ���WebEngineView�˴���һ������(������ӵĻ�)
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