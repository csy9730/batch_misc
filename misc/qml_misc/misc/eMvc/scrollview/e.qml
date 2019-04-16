//import Material 0.1
import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
 
Item {
    width: 530
    height: 300
	visible:true
    ScrollView {
        id:scroll
        width: 530
        height: 300
 
        Rectangle {
            id:rect
            width: 500
            height: 900
            Rectangle {
                id: rect1
                anchors.top: rect.top
                width: 500
                height: 300
                color: "red"
                border.color: "blue"
            }
 
            Rectangle {
                id: rect2
                anchors.top: rect1.bottom
                width: 500
                height: 300
                color: "green"
                border.color: "blue"
            }
 
            Rectangle {
                id: rect3
                anchors.top: rect2.bottom
                width: 500
                height: 900
                color: "orange"
                border.color: "blue"
 
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        //scroll.flickableItem.contentY = rect2.y/2
                    }
                }
            }
        }
    }
}