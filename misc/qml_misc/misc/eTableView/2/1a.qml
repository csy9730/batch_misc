import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    width: 360
    height: 360

	property var idx:1
    TableView{
        id: phoneTable
        anchors.fill: parent

        //TableViewColumn 描述表格的每一列
        TableViewColumn{role: "name"; title: "Name"; width: 30; elideMode: Text.ElideRight;}
        TableViewColumn{role: "cost"; title: "Cost"; width: 100;}
        TableViewColumn{role: "manufacture"; title: "Manufacture"; width: 140;}

        itemDelegate:Text{//设置每个单元格的字体样式
            text: styleData.value
            color: styleData.selected? "red" : styleData.textColor
            elide: styleData.elideMode
        }

//        rowDelegate :Rectangle{//设置行的背景色
//            color: styleData.selected ? root.highlight :
//                       (styleData.alternate ? root.alterBackground:root.background)
//            visible: false
//        }

        headerDelegate :Rectangle{//设置表头的样式
            implicitWidth: 10
            implicitHeight: 24
            gradient: styleData.pressed ? phoneTable.pressG :
                   (styleData.containsMouse ? phoneTable.hoverG : phoneTable.nomalG)
            border.width: 1
            border.color: "gray"
            Text{
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 4
                anchors.right: parent.right
                anchors.rightMargin: 4
                text: styleData.value
                color: styleData.pressed ? "red" : "blue"
                font.bold: true
            }
        }

        model: ListModel{
            id: phoneModel

            ListElement{
                name: "rongyao2";
                cost: "4900";
                manufacture: "huawei"
            }

            ListElement{
                name: "s6";
                cost: "4800";
                manufacture :"sumsung"
            }

            ListElement{
                name: "apple5"
                cost: "3300"
                manufacture: "apple"
            }

            ListElement{
                name: "Mi5"
                cost: "3200"
                manufacture: "xiaomi"
            }
        }//model is end

        focus: true

        Timer{
            id: timer2
            interval: 777
            running: true
            repeat: true
            onTriggered: {
					idx+=1
                  var a= {
                        "name": "小明"+ idx.toString(),//Math.random().toString() ,
                        "cost": "6",
                        "manufacture": "男",
                    }

                phoneModel.append( a);
            }
        }
		
		
		Timer{
            id: timer3
            interval: 2777
            running: true
            repeat: true
            onTriggered: {
                phoneModel.remove( phoneModel.count-3,1);
            }
        }
		
    }

}
