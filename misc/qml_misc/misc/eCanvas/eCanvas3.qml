import QtQuick 2.5

Canvas {
    id: root
    // canvas size
    width: 200; height: 200
    // handler to override for drawing
    onPaint: {
         var ctx = getContext("2d")
        // setup a dark background
        ctx.strokeStyle = "#333"
        ctx.fillRect(0,0,root.width,root.height);

        // setup a blue shadow
        ctx.shadowColor = "#2ed5fa";
        ctx.shadowOffsetX = 2;
        ctx.shadowOffsetY = 2;
        ctx.shadowBlur = 10;

        // render green text
        //ctx.font = 'bold 80px Ubuntu';
        ctx.fillStyle = "#24d12e";
        ctx.fillText("Canvas!",30,80);
    }
}
