import QtQuick 2.0
import QtCharts 2.0
ChartView{
	
	title:"Spline"
    anchors.fill:parent
    antialiasing:true
	SplineSeries{
		name: "SplineSeries"
		XYPoint{x:0;y:0.0}
		XYPoint{x:1.1;y:3.0}
		XYPoint{x:2.0;y:2.4}
		XYPoint{x:2.1;y:2.1}
		XYPoint{x:2.9;y:2.6}
	}
}
