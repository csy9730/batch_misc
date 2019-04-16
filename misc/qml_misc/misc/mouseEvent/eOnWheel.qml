import QtQuick 2.0

Rectangle {
    property alias  txt: placeText.text //placeholder
    //clip: true
	width:100
	height:150
    //inputMask: "99.99"//
	color:"yellow"
    Text {
		focus:true
        id: placeText
        color: "#323232"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
		text: "10"
        visible: true //parent.text.length == 0
    }
    MouseArea {
        anchors.fill: parent
        enabled: parent.focus
        onWheel: {
			console.log("whl:")
            var datl = wheel.angleDelta.y/120;//一刻滚轮代表正负120度，所以除以120等于1或者-1
			  if(datl>0){
				  txt=(parseFloat(txt)+0.1).toFixed(2);//parseFloat转换为浮点
			  }else{
				  txt=(parseFloat(txt)-0.1).toFixed(2);//toFixed(2)保留两位小数点
			  }
			 
        }
    }
}
