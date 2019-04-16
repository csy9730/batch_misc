import QtQuick 2.5
import QtCharts 2.0
ChartView{
	title:"Line"
	anchors.fill:parent
	antialiasing:true
	LineSeries{
		name:"LineSeries"
		XYPoint{x:0;y:0}
		XYPoint{x:1.1;y:2.1}
		XYPoint{x:2.0;y:3.3}
	
	}

}
