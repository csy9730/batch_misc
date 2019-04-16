import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle{
	id:window
	width:240; height:150
	visible:true
	radius:5
    border.width: 5
	
	gradient: Gradient{
		GradientStop{ position:0.0  ; color:"red"}
		GradientStop{ position:0.33  ; color:"yellow"}
		GradientStop{ position:1.0  ; color:"green"}
	}
	
	Rectangle{
	id:window2
    width:70; height:45
	visible:true
	radius:2
	rotation: 45
    anchors.centerIn:parent
	opacity:0.5
	gradient: Gradient{
		GradientStop{ position:0.0  ; color:"blue"}
		GradientStop{ position:1.0  ; color:"purple"}
	}
	
}
}
