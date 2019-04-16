import QtQuick 2.1
import QtQuick.Window 2.1

//import "qrc:/Canvas1/qml/RES/"

Window {
    visible: true
    width: 300
    height: 400
    title: qsTr("qmlPainterCanvas")

    property int marginY: 200
    property int marginX: 100
    property int spacing: 15


    Component.onCompleted: {
    }
    Rectangle{
        id:rec
        x:0
        y:0
        width: parent.width
        height: parent.height
        color: "gray"
        Canvas{
            x:0
            y:0
            id:canvas_two
            width: parent.width
            height: parent.height
            property real lastX
            property real lastY
            contextType: "2d"
            visible: true
            onPaint: {//绘图事件的响应
                //var context = getContext('2d')
                context.lineWidth=1.0;//线的宽度
                context.strokeStyle="red";//线的颜色
                context.fillStyle="white";//填充颜色
                context.beginPath();//开始
                context.moveTo(lastX, lastY)//移动到指定位置
                lastX = area.mouseX
                lastY = area.mouseY
                context.lineTo(lastX, lastY)//划线到指定位置
                context.stroke();//背景执行
            }
            MouseArea {
                id: area
                anchors.fill: parent//屏蔽父窗口的点击事件
                onPressed: {
                    canvas_two.lastX = mouseX//鼠标位置
                    canvas_two.lastY = mouseY
                }
                onPositionChanged: {//位置改变事件
                    canvas_two.requestPaint()//重绘
                }
            }
        }
    }
    /**/
}
