import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
Window {
    visible: true
    title:"stackView--涵涵"
    StackView {
        id: stack
        initialItem: view

        Component {
            id: view

            Rectangle {
                color:"#00FF00";

                Text {
                    text: stack.depth
                    anchors.centerIn: parent
                }
                Button{
                    text:"增加"
                    id:btn1
                    anchors.left:parent.left;
                    anchors.leftMargin: 10;
                    onClicked: stack.push(view)
                    style:ButtonStyle{
                        background:Rectangle{
                            color:"#FF0000";

                        }
                        label:Label{
                            text:"增加"
                            color:"white";
                            font.pixelSize:12;
                        }
                    }
                }
                Button{
                    text:"减少"
                    id:btn2
                    anchors.left:btn1.right;
                    anchors.leftMargin: 10;
                    onClicked: stack.pop();
                }
            }
        }
    }
}
