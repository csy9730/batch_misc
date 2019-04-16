# 鼠标事件

鼠标事件：MouseEvent
MouseArea有如下信号：
* canceled() 
* clicked(MouseEvent mouse) 
* doubleClicked(MouseEvent mouse) 
* entered() 
* exited() 
* positionChanged(MouseEvent mouse) 
* pressAndHold(MouseEvent mouse) 
* pressed(MouseEvent mouse) 
* released(MouseEvent mouse) 
* wheel(MouseEvent mouse)

mouse.accepted属性
通过设置accepted为true防止鼠标事件传播到下一层项目。

mouse.x，mouse.y属性
通过x和y来获取鼠标位置。

mouse.button属性
通过button或buttons可以获取按下的按键； 
Qt.LeftButton、Qt.RightButton、Qt.MiddleButton、

modifiers
通过modifiers属性可以设置获取按下的键盘修饰符 
常用按键有： 
Qt.NoModifier:没有修饰符被按下 
Qt.ShiftModifier:Shift被按下 
Qt.ControlModifier:Ctrl被按下 
Qt.AltModifier:Alt被按下 
Qt.MetaModifier:Meta键被按下 
Qt.KeypadModifier:小键盘按钮被按下

wheel.modifiers & Qt.ControlModifier


滚轮属性
分为wheel.angleDelta.x，wheel.angleDelta.y，手机平板平台上对应两指缩放操作，
鼠标上对应滚轮缩放，对应y轴缩放，一般通过Ctrl+滚轮实现x轴缩放

#### demo

``` qml
import QtQuick 2.0
 
Rectangle {
    width: 100
    height: 100
    color: "green"
	visible:true
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            //右键
            if(mouse.button == Qt.RightButton)
                parent.color = "blue"
            //左键 + shift键
            else if((mouse.button == Qt.LeftButton) && (mouse.modifiers & Qt.ShiftModifier))
                parent.color = "green"
            else
                parent.color = "red"
        }
		 onDoubleClicked: {
			 parent.color = "yellow"
			 console.log("onDoubleClicked");
		} //双击触发
    }
}
```

##### misc

* qtcharts.LineSeries自带鼠标点击事件，会阻塞其他控件的鼠标点击事件




MouseArea还有一个有趣的drag组属性，可以实现拖拽效果，下面是其属性介绍：
drag.target：要拖拽对象的id。
drag.active：记录目标对象是否正在被拖拽。
drag.axis：设置拖拽方向，可以是Drag.XAxis/YAxis/XAndYAxis。
drag.minimumX/drag.maximumX：设置X方向可拖拽距离。
drag.minimumY/drag.maximumY：设置Y方向可拖拽距离。
drag.filterChildren：为true时，鼠标事件可被父对象接收。
drag.threshold：像素阈值，平台相关。
最后，再列举几个好玩的UI交互元素。
Flickable、Flipable可以实现弹动效果，就是一个小小的动画。
PinchArea可以通过两点触摸来实现旋转、缩放效果。
MutiPointTouchArea可以实现多点触摸手势。
Drag、DropArea也可以实现移动等效果。