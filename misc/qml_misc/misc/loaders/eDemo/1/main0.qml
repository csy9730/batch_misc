import QtQuick 2.0
import QtQuick.Dialogs 1.2

Item {
    property bool isFirst : false;
    width: 200
    height: 200

    Loader {
        id: pageLoader
    }

    MouseArea {
        anchors.fill: parent
        onClicked: changePage();
    }
	Text{
		text:"abc"
	}
    function changePage() {
        if(isFirst) {
            pageLoader.source = "Page1.qml"
        } else {
            pageLoader.source = "Page2.qml"
        }

        isFirst = !isFirst;
    }

}