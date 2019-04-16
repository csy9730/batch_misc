import QtQuick 2.0
import QtQuick.Controls 1.4


ApplicationWindow {
    width: 300
    height: 300
    visible: true
    id: rct

    color: "#ff00ff"
	Rectangle{
		color:"blue"
        x:50
        y:50
		width:200
		height:200
        focus:true
		Keys.enabled:true
        Keys.onEscapePressed: {
            Qt.quit();
        }
        Keys.forwardTo: [moveText,likeQt];

        Text{
            width: 200
            height: 200
            id:moveText
            x:30
            y:30
            text: "press up,down left right to move "
            visible: true
            Keys.enabled:true
            Keys.onPressed: {
                console.log("pressed")
                switch(event.key){
                case Qt.Key_Left:
                    x-=10;
                    break;
                case Qt.Key_Right:
                    x+=10;
                    break;
                case Qt.Key_Down:
                    y+=10;
                    break;
                case Qt.Key_Up:
                    y-=10;
                    break;
                default:
                    return;
                }
                event.accepted = true
            }
        }

        CheckBox{
            id:likeQt
            text:"press space to checkbox"
            z:1
        }
	}

}
