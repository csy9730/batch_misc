import QtQuick 2.5
//import math    1.0

Canvas {
    id: root
    // canvas size
    width: 200; height: 200
    // handler to override for drawing
    onPaint: {
        // get context to draw with
        var ctx = getContext("2d")
        // setup the stroke
        ctx.lineWidth = 1
        ctx.strokeStyle = "blue"
        // setup the fill
        ctx.fillStyle = "steelblue"
        // begin a new path to draw
        ctx.beginPath()
        // top-left start point
        ctx.moveTo(50,50)

        var len = 100
        for (var i = 0;i<len;i++){
            //ctx.lineTo(50+i*1,30+i%25)
            ctx.lineTo(50+i*1,70+50*Math.sin(3.14*i/5))
        }
        //ctx.closePath()

        //ctx.fill()
        // stroke using line width and stroke style
        ctx.stroke()
    }
}
