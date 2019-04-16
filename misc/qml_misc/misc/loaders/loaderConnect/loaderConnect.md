### loader&connect


#### loaded接收来自loader信号

``` qml
import QtQuick 2.4
 
Rectangle {
    width: 200; height:200
    Loader {
        id: loader
        focus: true
    }
    MouseArea {
        anchors.fill: parent
		acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
			if(mouse.button == Qt.LeftButton)
                loader.source = "KeyReader.qml"
			else
				loader.source = ""
		}
    }
    Keys.onPressed: {
        console.log("Captured: ", event.text);
    }
}

```


``` qml
import QtQuick 2.0
 
Item {
    Rectangle {
		width:100
		height:200
        focus: true
		color:"blue"
        Keys.onPressed: {
            console.log("Loaded item captured: ", event.text)
            event.accepted = true
        }
    }
}

```

* loaded接key事件收需要在loader开启焦点
* loaded的同名事件会覆盖loader的同名事件


#### loaded传递信号给loader
``` qml

import QtQuick 2.4
 
Item {
    width: 100; height: 100
    Loader {
        id: myLoader
        source: "MyItem.qml"
    }
    Connections {
        target: myLoader.item
        //onMessage: console.log(msg)
    }
}
```

``` qml
import QtQuick 2.0
 
Rectangle {
    id: myItem
    //signal message(string msg)
    width: 100; height: 100
	color:"blue"
    MouseArea {
        anchors.fill: parent
        onClicked: {
			console.log("clck")
			//myItem.message("clicked!")
		}
    }
}
```

* loaded注册信号并发送信号，loader接收信号