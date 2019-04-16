import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
ApplicationWindow {
    visible: true
    width: 720
    height: 560
    title: "ZAL_AI"
	Button {
        id:openBtn
        height: 25
        text:qsTr("浏览...")
        anchors.leftMargin: 10
        onClicked: {
            fds.open();
        }
    }
    Label {
        id: labels
        text: qsTr("")
        height: 25
        anchors.left:openBtn.right
        anchors.leftMargin: 10
    }

    FileDialog {
        id:fds
        title: "选择文件"
        folder: shortcuts.desktop
        selectExisting: true
        selectFolder: false
        selectMultiple: false
        nameFilters: ["json文件 (*.json)"]
        onAccepted: {
            labels.text = fds.fileUrl;
            console.log("You chose: " + fds.fileUrl);
        }

        onRejected: {
            labels.text = "";
            console.log("Canceled");
            Qt.quit();
        }

    }

}