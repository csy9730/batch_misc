import QtQuick 2.0

Item {
    GridView {
        id: gridView
        x: 83
        y: -200
        width: 140
        height: 140
        cellHeight: 70
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
        delegate: Item {
            x: 5
            height: 50
            Column {
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    x: 5
                    text: name
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                spacing: 5
            }
        }
        cellWidth: 70
    }

    Item {
        id: item1
        x: 284
        y: -334
        width: 91
        height: 55
    }

}
