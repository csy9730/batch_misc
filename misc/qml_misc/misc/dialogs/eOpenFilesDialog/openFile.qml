import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
 
ApplicationWindow{
    id: leftDockMenu
    //iconSource: "res/zlg.ico"
    visible: true
    width: 720
    height: 560
    title: "open_file"
    Rectangle {
        id: mainLeftView
        color: "blue"
        Button {
            id: demo1
            y: 0
            width: 100
            height: 100
            text: "Demo"
            anchors.top: parent.top
            anchors.left: parent.left
 
            onClicked: {
                fileDialog.open()
            }
        }
        Button {
            id: demo2
            x: 100
            width: 100
            height: 100
            text: "Demo1"
            anchors.left: demo1.right
            anchors.top: parent.top
 
            onClicked: {
                text1.text = "text2"
            }
        }
        Text {
            id: text1
            text: qsTr("text0")
            anchors.left: parent.right
            anchors.top: demo1.bottom
        }
    }
 
    FileDialog {
        id: fileDialog
        title: qsTr("Please choose an image file")
        selectFolder:true
        //nameFilters: ["Photo Files", "Image Files (*.jpg *.png *.gif *.bmp *.ico)", "*.*"]
        onAccepted: {
            text1.text = String(fileUrl)
            var filepath = new String(fileUrl)
            console.log("you select"+fielUrl)
        }
        onRejected: {
            console.log("Cancel")
            labels.text ="";

        }
    }

}
