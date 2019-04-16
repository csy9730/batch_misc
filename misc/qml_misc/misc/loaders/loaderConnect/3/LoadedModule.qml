
import QtQuick 2.0
 
 
Rectangle {
    id:root;
    width: 200;
    height: 100;
    color: "blue";
    property string content: qsTr("This is a Rectangle Item");
    signal mouseClicked();
    
    MouseArea {
        anchors.fill: parent
        property bool oldState: true;
        onClicked: { 
            parent.color = oldState ? 'red' :"blue";
            oldState = !oldState;
            root.mouseClicked();
        }
    }
    onContentChanged: {
        console.log("property <content> has changed");
        console.log(root.content);
    }
}
