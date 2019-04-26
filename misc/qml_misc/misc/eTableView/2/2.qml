import QtQuick 2.2
import QtQuick.Controls 1.2

Rectangle{
    id: root
    width: 360
    height: 300

    property var background: "#d7e3bc"
    property var alterBackground: "white"
    property var highlight: "#e4f7d6"
    property var headerBkg: "#F0F0F0"
    property var normalG: Gradient{
        GradientStop{position: 0.0; color: "#c7d3ac"}
        GradientStop{position: 1.0; color: "#F0F0F0"}
    }
    property var hoverG: Gradient{
        GradientStop{position: 0.0; color: "white"}
        GradientStop{position: 1.0; color: "#d7e3bc"}
    }
    property var pressG: Gradient{
        GradientStop{position: 0.0; color: "#d7e3bc"}
        GradientStop{position: 1.0; color: "white"}
    }

    TableView{  //定义table的显示，包括定制外观
        id: phoneTable
        anchors.fill: parent
        focus: true
        TableViewColumn{role: "name"; title: "Name"; width: 100; elideMode: Text.ElideRight;}
        TableViewColumn{role: "cost"; title: "Cost"; width: 100; elideMode: Text.ElideRight;}
        TableViewColumn{role: "manufacture";title: "Manufacture"; width: 100; elideMode: Text.ElideRight;}

        itemDelegate: Text{
            text: styleData.value
            color: styleData.selected ? "red" : "black"
            elide: Text.ElideRight
        }

        rowDelegate: Rectangle{
            color: styleData.selected? root.highlight :
                         (styleData.alternate ? root.alterBackground : root.background)
        }

        headerDelegate: Rectangle{
            implicitWidth: 10
            implicitHeight: 24
            border.color: "gray"
            border.width: 1
            Text{
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 4
                anchors.right: parent.right
                anchors.rightMargin: 4
                text: styleData.value
                color: styleData.pressed ?"red" : "blue"
                font.bold: true
            }
        }//header delegate is end

        model: ListModel{
            id: phoneModel
            ListElement{
                name: "iphone5"
                cost: "4900"
                manufacture: "apple"
            }
            ListElement{
                name: "b199"
                cost: "1590"
                manufacture: "huawei"
            }
            ListElement{
                name: "MI25"
                cost: "1999"
                manufacture: "xiaomi"
            }
            ListElement{
                name: "galaxy s6"
                cost: "3900"
                manufacture: "samsung"
            }
        }//listmodel is end
    }
}
