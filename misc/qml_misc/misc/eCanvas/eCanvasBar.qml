import QtQuick 2.0
Rectangle {
	width: 600
	height:400
	Canvas{
		id:canvas
		anchors.top: parent.top
		width: parent.width
		height:parent.height
		anchors.left: parent.left
		anchors.leftMargin: 30
		function drawVolume(ctx,color,x,y,w,h)
		{
			ctx.save();
			ctx.fillStyle = color;
			ctx.globalAlpha = 0.8;
			ctx.lineWidth = 0;
			ctx.beginPath();
			ctx.shadowOffsetX = 4;
			ctx.shadowBlur = 3.5;
			ctx.shadowColor = Qt.darker(color);
			ctx.fillRect(x,y,w,h);
			ctx.stroke();
			ctx.restore();
		}
		onPaint: {
			var draw =getContext("2d");
			draw.globalCompositeOperation = "source-over";
			draw.lineWidth = 1;
			for(var i=0;i<15;i++){
				drawVolume(draw,"#14aaff",i*35,350,20,-Math.random()*300);            
			}        
		}
	}
}