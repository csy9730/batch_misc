#CANVAS


###core

* line,arc
* text
* gradient
* drawimage
* path
* pen Color&width

fillRect(x,y,w,h) 矩形填充
strokeText(txt,x,y) 矩形填充

###
画布原点（0，0），可以三国Transform平移改变
--->x
|
|
y

* Transform，scale，rotate，（基准点为(0,0)点，）
* save ，restore
* image buffer


###plot
接口类似html5的canvas元素。
如何实现函数绘图？

1. 初始化
2. 添加
3. 绘制
3. 缓存    
4. 擦除

缓存：context.save();
添加：lastX, lastY
绘制 moveTo，CurveTo

paint： line-blank 交替
timer：开始，暂停。
绘制：坐标轴

* region
* points
* view.axis
* axes




###code

```javascript

import QtQuick 2.0
Canvas {
    property real hue: 0
    property real lastX: width * Math.random();
    property real lastY: height * Math.random();
id: canvas
width: 800; height: 450

property bool requestLine: false
property bool requestBlank: true
Timer {
    id: lineTimer
    interval: 400
    repeat: true
    triggeredOnStart: true
    onTriggered: {
        canvas.requestLine = true
        canvas.requestPaint()
    }
}
Component.onCompleted: {
    lineTimer.start()
}
onPaint: {
    var context = getContext('2d')
    if(requestLine) {
        line(context)
        requestLine = false
        requestBlank = true
    }
    if(requestBlank) {
        blank(context)
        requestBlank = false
        requestLine = true
    }
}

function line(context) {
    context.save();
    context.translate(canvas.width/2, canvas.height/2);// move
    context.scale(0.9, 0.9);					// scale
    context.translate(-canvas.width/2, -canvas.height/2);
    context.beginPath();
    context.lineWidth = 5 + Math.random() * 10;
    context.moveTo(lastX, lastY);
    lastX = canvas.width * Math.random();
    lastY = canvas.height * Math.random();
    context.bezierCurveTo(canvas.width * Math.random(),
        canvas.height * Math.random(),
        canvas.width * Math.random(),
        canvas.height * Math.random(),
        lastX, lastY);
    hue += Math.random()*0.1
    if(hue > 1.0) {
        hue -= 1
    }
    context.strokeStyle = Qt.hsla(hue, 0.5, 0.5, 1.0);//HSVA
    // context.shadowColor = 'white';
    // context.shadowBlur = 10;
    context.stroke();
    context.restore();
    }
function blank(context) {
    context.fillStyle = Qt.rgba(0,0,0,0.1)    // RGBA
    context.fillRect(0, 0, canvas.width, canvas.height);
    }
}


```


###curf

updCanv = pyqtSignal(float,float, arguments=['upd'])
self.updCanv.connect(fSlot)


qtimer.connect(emitDat){ updCanv.emit }





//屏蔽父窗口的点击事件
                onPressed: {
                    canvas_two.lastX = mouseX//鼠标位置
                    canvas_two.lastY = mouseY
                }