import QtQuick 2.1
import QtQuick.Window 2.1

//import "qrc:/Canvas1/qml/RES/"

Window {
    visible: true
    width: imgBg.width*2
    height: imgBg.height
    title: qsTr("qmlPainterCanvas")

    property var _listData:[0,50,0,70,10,0,-60,0,50,0,30,0,25,-80,0,20,0,70,0,20,0]
    property var _list: new Array
    property int marginY: 200
    property int marginX: 100
    property int spacing: 15
    property int currentIndex: 0

    property int maxLen: _listData.length

    Component.onCompleted: {
    }

    Image{
        id: imgBg
        source: "img/vistabg.png"
    }

    Item{
        id: itemCanvas
        anchors.fill: parent

        transform: Rotation{
            axis.x: 0
            axis.y: 1
            axis.z: 1

            origin.x: 0
            origin.y: itemCanvas.height/2

            angle: 5
        }

        Canvas {
            id: canvas
            anchors.fill: parent

            property real lastX: 0
            property real lastY: 0

            onPaint: {
                //0,0 在左上角
                var ctx = getContext('2d')

                ctx.clearRect(0, 0, canvas.width, canvas.height)

                //基线
                ctx.lineWidth = 1.0
                ctx.strokeStyle = "red"//"#bdfcff"
                ctx.beginPath()
                ctx.moveTo(marginX, canvas.height - marginY)
                ctx.lineTo(300+marginX, canvas.height - marginY)
                ctx.stroke()

                ctx.lineWidth = 5.0
                ctx.strokeStyle = "#bdfcff"
                ctx.lineJoin = "miter"   //miter, bevel, round
                ctx.lineCap = "butt"        //butt,round,square
                ctx.beginPath()
                ctx.shadowColor = "#bdfcff"
                ctx.shadowBlur = 15
                ctx.shadowOffsetX = -5
                ctx.shadowOffsetY = -5

                //                console.log(_list.length)
                for(var i=0; i<_list.length; i++){

                    var x1 = i*spacing + marginX + (maxLen-_list.length)*spacing
                    var y1 = canvas.height - _list[i] - marginY

                    if(i == 0){
                        ctx.moveTo(x1, y1)
                    }
                    else if(i == _list.length-1){
                        ctx.lineTo(x1, y1)
                        ctx.stroke()
                    }
                    else{
                        ctx.lineTo(x1, y1)
                    }

                    lastX = x1
                    lastY = y1

                }
            }
        }

    }

    Timer{
        id: timer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            addPoint(_listData[currentIndex])
            currentIndex++
            if(currentIndex>maxLen-1){
                currentIndex = 0
            }
        }
    }

    function addPoint(num){
        _list.push(num)
        if(_list.length>maxLen){
            _list.splice(0,1)
        }
        canvas.requestPaint()
    }

    Rectangle{
        id:rec
        x:imgBg.width
        y:0
        width:imgBg.width
        height: imgBg.height
        color: "gray"
        Canvas{
            x:0
            y:0
            id:canvas_two
            width: imgBg.width
            height: imgBg.height
            property real lastX
            property real lastY
            contextType: "2d"
            visible: true
            onPaint: {//绘图事件的响应
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
}
