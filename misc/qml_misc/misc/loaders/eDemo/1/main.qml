import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    property bool isFirst : false;
    width: 200
    height: 200
	visible :true
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