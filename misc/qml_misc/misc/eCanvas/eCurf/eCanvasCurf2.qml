import QtQuick 2.1
import QtQuick.Window 2.1

//import "qrc:/Canvas1/qml/RES/"

Window {
    visible: true
    width: imgBg.width
    height: imgBg.height
    title: qsTr("qmlPainterCanvas")

    property var _listData:[0,50,0,70,10,0,-50,0,100,0,30,0,25,-50,0,20,0,70,0,20,0]
    property var _list: new Array
    property int marginY: 300
    property int marginX: 200
    property int rct2H: 100
    property int spacing: 5
	property int maxLen: _listData.length+100
    property int currentIndex: 0
    property real valOfs: 0    

    Component.onCompleted: {
    }

    Image{
        id: imgBg
        source: "img/vistabg.png"
    }

    // x,y坐标变换： 变换成归一化坐标，再变换成像素坐标
    function sfAxisPoint2WH(x,y)
    {
        var rctBottom = -100
        var rctTop = 100
        var rctLeft = 0
        var rctRight = maxLen

        var rct2Bottom = canvas.height - marginY
        var rct2Top = canvas.height - marginY - rct2H
        var rct2Left = marginX
        var rct2Right = marginX+spacing*maxLen

        var  yRatio = (y - rctBottom )/( rctTop - rctBottom );//归一化
        var  xRatio = (x - rctLeft)/( rctRight - rctLeft);//归一化
        var wRatio=xRatio;
        var hRatio=1-yRatio;//
        var w=wRatio*( rct2Right - rct2Left ) + rct2Left ;
        //h=hRatio*(rct2.top-rct2.bottom) +rct2.bottom ;
        var h=hRatio*(rct2Bottom - rct2Top) + rct2Top ;
        return  [w,h];
    }


    Item{
        id: itemCanvas
        anchors.fill: parent

        Canvas {
            id: canvas
            anchors.fill: parent

            property real lastX: 0
            property real lastY: 0

            onPaint: {
                //0,0 在左上角
                var ctx = getContext('2d')

                ctx.clearRect(0, 0, canvas.width, canvas.height)

                ctx.lineWidth = 1.0
                ctx.strokeStyle = "red"//"#bdfcff"
                ctx.lineJoin = "miter"   //miter, bevel, round
                ctx.lineCap = "butt"        //butt,round,square
                ctx.beginPath()
                ctx.shadowColor = "#bdfcff"
                ctx.shadowBlur = 5
                ctx.shadowOffsetX = -2
                ctx.shadowOffsetY = -2

                //                console.log(_list.length)
                for(var i=0; i<_list.length; i++){
                    var xy = sfAxisPoint2WH( i, _list[i])
                    var x1 = xy[0]
                    var y1 = xy[1]
                    //var x1 = marginX + ( i+ maxLen-_list.length)*spacing
                    //var y1 = canvas.height - marginY - _list[i]

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
                ctx.stroke()

				//基线
                ctx.strokeStyle = "green"//"#bdfcff"
                ctx.beginPath()
                var xyO = sfAxisPoint2WH( 0, 0)
                var xyH = sfAxisPoint2WH( 0, 100)
                var xyW = sfAxisPoint2WH( maxLen, 0)
                ctx.moveTo(xyO[0], xyO[1])
                ctx.lineTo(xyH[0], xyH[1])

                ctx.moveTo(xyO[0], xyO[1])
                ctx.lineTo(xyW[0], xyW[1])
                ctx.stroke()

                for(var i = 0; i <_list.length ; i += 1)
                {
                    var x = sfAxisPoint2WH( i, _list[i])[0]
                    ctx.fillRect(x - 0.5, xyW[1], 1, 15)
                    //ctx.font = "11px 'Exo 2'";
                    ctx.strokeText(i, x - 0.5, xyW[1] + 20);
                }
                ctx.stroke()
                ctx.beginPath()
                for(var i = 0; i <20 ; i += 1)
                {
                    var yv = i*10.0-100
                    var y = sfAxisPoint2WH( 0,yv)[1]
                    ctx.fillRect( xyH[0],  y - 10.5, 11, 1)
                    //ctx.font = "11px 'Exo 2'";
                    ctx.strokeText(yv, xyH[0] - 20, y - 0.5);
                }
                ctx.stroke()
                /**/
            }

        }

    }

    Timer{
        id: timer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            addPoint(_listData[currentIndex]+valOfs)
            currentIndex++
            if(currentIndex>maxLen-1){
                currentIndex = 0
                //valOfs+=10.0
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
}
