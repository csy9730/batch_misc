import QtQuick 2.0
import QtCharts 2.0
Item{
    width: 500
    height: 500

ChartView {
    width: 400
    height: 300
    theme: ChartView.ChartThemeBrownSand
    antialiasing: true
/*
    PieSeries {
        id: pieSeries
        PieSlice { label: "eaten"; value: 94.9 }
        PieSlice { label: "not yet eaten"; value: 5.1 }
    }
	*/
	LineSeries {
        axisY: CategoryAxis {
            min: 0
            max: 30
            CategoryRange {
                label: "critical"
                endValue: 2
            }
            CategoryRange {
                label: "low"
                endValue: 4
            }
            CategoryRange {
                label: "normal"
                endValue: 7
            }
            CategoryRange {
                label: "high"
                endValue: 15
            }
            CategoryRange {
                label: "extremely high"
                endValue: 30
            }
        }

        XYPoint { x: 0; y: 4.3 }
        XYPoint { x: 1; y: 4.1 }
        XYPoint { x: 2; y: 4.7 }
        XYPoint { x: 3; y: 3.9 }
        XYPoint { x: 4; y: 5.2 }
    }

    }

}
