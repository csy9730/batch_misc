#QtCharts

安装方式:
* qt安装： 使用qt-opensource-windows-x86-5.9.0.exe安装时，勾选QtCharts
* whl:PyQtChart-5.9-5.9.1-cp35.cp36.cp37-none-win_amd64.whl
* py源码安装,需要调用qmake和sip编译

###要素

* chartView
* plot
    * PieSeries,DonutSeries
    * LineSeries,SplineSeries,ScatterSeries
    * QBarSeries,QStackedBarSeries
    * AreaSeries
    * HorizontalBarSeries
* axis
    * QValueAxis,QLogValueAxis
    * CategoryAxis,
    * QDateTimeAxis

plot通过以下属性绑定axis
* axisX,axisY
* axisAngular,axisRadial

其他属性设置：
* legend : 通过LineSeries.name设定
* title
#####code
* 饼图 PieSeries
* 折线图 LineSeries

**绘制饼图**

```javascript
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

    PieSeries {
        id: pieSeries
        PieSlice { label: "eaten"; value: 94.9 }
        PieSlice { label: "not yet eaten"; value: 5.1 }
    }
}
```

**绘制折线图**

LineSeries {
    id:series1
    axisX: axisX
    axisY: ValueAxis {
        id: axisY2
        min: 0
        max: 1
        tickCount: 5
		titleText :"loss ";
    }
	name:"acc"
	XYPoint { x: 0; y: 0}
}


```javascript
import QtQuick 2.0
import QtCharts 2.0

ChartView {
    width: 400
    height: 300
    theme: ChartView.ChartThemeBrownSand
    antialiasing: true


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

```

###misc
W: python打开qml出现错误？
    app需要改成QApplication
```python
if __name__ == '__main__':
	app = QApplication([])
	engine = QQmlApplicationEngine()
	engine.load(QUrl("main.qml"))
	app.exec_()
```
    
W：QtCharts不显示？
使用ChartViewrs容器，且要设置width，height




###绘图进阶
静态图
动态图：
数据添加：series1.append(x,y)
数据清除： series1.clear()


