import QtQuick 2.4


Rectangle{
    width: 150;height: 250
	Rectangle{
		id: onElement
        color: "red"
		x:25;y:15;width:100;height:100
	}
	Rectangle{
		id: offElement
		x:25;y:135;width:100;height:100
	}
	states:[
		State{
            name: "on"
			PropertyChanges{ target: onElement; color:"red"}
			PropertyChanges{ target: offElement; color:"black"}
		},
		State{
            name: "off"
			PropertyChanges{ target: onElement; color:"black"}
			PropertyChanges{ target: offElement; color:"green"}
        }
	]
	state: "on"
	MouseArea{
     id: mouseArea
		anchors.fill :parent
        onClicked : {parent.state == "on" ?
                        parent.state = "off" : parent.state ="on"
                console.log("asdf")
        }
    }
}
