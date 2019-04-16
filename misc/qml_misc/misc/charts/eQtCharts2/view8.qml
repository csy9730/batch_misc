import QtQuick 2.0
import QtCharts 2.0
import QtQuick.Controls 1.4


ApplicationWindow {
    width: 100
    height: 100
    visible: true
    id: rct

    color: "#ff00ff"

    Text{
        width: 200
        height: 300
        x:0
        y:0
        text: "abc"
        visible: true
    }

ChartView {
    width: 100
    height: 100
    theme: ChartView.ChartThemeBrownSand
    antialiasing: true
	LineSeries {

        XYPoint { x: 0; y: 4.3 }
        XYPoint { x: 1; y: 4.1 }
        XYPoint { x: 2; y: 4.7 }
        XYPoint { x: 3; y: 3.9 }
        XYPoint { x: 4; y: 5.2 }
    }

    }
}
