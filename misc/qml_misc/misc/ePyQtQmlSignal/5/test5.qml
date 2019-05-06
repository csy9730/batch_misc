import Charts 1.0
import QtQuick 2.0

Item {
    width: 300; height: 200

    PieChart2 {
        id: aPieChart
        anchors.centerIn: parent
        width: 100; height: 100
        color: "red"

        onChartCleared: {
			console.log("The chart has been cleared") //槽
			txt.text = "The chart has been cleared"
		}
    }

    MouseArea {
        anchors.fill: parent
        onClicked: aPieChart.clearChart()
    }

    Text {
		id:txt
        anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter; bottomMargin: 20 }
        text: "Click anywhere to clear the chart"
    }
}