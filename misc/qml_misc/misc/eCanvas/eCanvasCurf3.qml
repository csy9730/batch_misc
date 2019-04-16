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
    property var _idxList: new Array
    property var _idxListData:[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

    property int marginY: 300
    property int marginX: 200
    property int rct2H: 100
    property int spacing: 25
    property int maxLen: _listData.length+30
    property int currentIndex: 0
    property real valOfs: 0
    property real rctLeft: 0

    Image{
        id: imgBg
        source: "img/vistabg.png"
    }

    // x,y坐标变换： 变换成归一化坐标，再变换成像素坐标
    function sfAxisPoint2WH(x,y)
    {
        var rctBottom = -100
        var rctTop = 100
        var rctRight = rctLeft + maxLen

        var rct2Bottom = canvas.height - marginY
        var rct2Top = canvas.height - marginY - rct2H
        var rct2Left = marginX
        var rct2Right = marginX+spacing*maxLen

        var w = (x - rctLeft)*( rct2Right - rct2Left ) /( rctRight - rctLeft)  + rct2Left ;
        var h = (rctTop - rctBottom -y + rctBottom )*(rct2Bottom - rct2Top) /( rctTop - rctBottom )+ rct2Top ;
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


                for(var i=0; i<_list.length; i++){
                    var xy = sfAxisPoint2WH( _idxListData[i] , _list[i])
                    var x1 = xy[0]
                    var y1 = xy[1]

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
                    var x = sfAxisPoint2WH( _idxListData[i], _list[i])[0]
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
    function addPoint(num){
      _list.push(num)
      if(_list.length>maxLen){
          _list.splice(0,1)
      }
      canvas.requestPaint()
    }
    function addPoint2(num,idx){
      _list.push(num)
      _idxListData.push(idx)

      if(_list.length>maxLen){
          _list.splice(0,1)
          _idxListData.splice(0,1)
          rctLeft+=1
      }
      canvas.requestPaint()
    }

  
}
