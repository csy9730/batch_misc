# PyQt和Qml信号交互
[TOC]

## 简介
基础概念包括信号与槽(Signal&Slot)，PyQt主要通过修饰符表示Signal和Slot。

### Signal
SIGNAL 根据参数分为以下几种
* 无参数
* 携带参数 pyqtSignal(float)
* 携带多个参数 pyqtSignal(float,int)
* 携带重载参数   pyqtSignal([int,int ],[])  
* 携带list,dict参数 pyqtSignal(list)  

### SLOT
SLOT可以携带参数和返回值,例如@pyqtSlot(float, result=str)

### 信号绑定

概念： 
     
* signal        信号量，从发射源对象 emit对接收源
* slot        一个执行函数句柄，可以带参数和返回值
* context       上下文
* connect       绑定


rootObject是QML界面的根对象

参数、返回值如何传递？

#### QML与Python的信号交互
QML与Python的信号交互包括以下方法：
**QML调用Python的Slot**
**QML发送signal到Python**
**Python调用Js函数**
**Python发送signal到Qml**



##### QML调用Python的Slot
 qml通过rootContext绑定自定义类QObject，UI中直接调用@pyqtSlot(int,result=str)修饰的python槽函数 

```javascript     
onClicked: {
    console.log("test...")  
    button.text = con.returnValue(20) 
}
```

```python
class MyClass(QObject):
    def __init__(self):
        super(MyClass, self).__init__()
    # slot function, input param type:int，return type: str
    @pyqtSlot(int, result=str)   
    def returnValue(self, value):
        return str(value+10)    
  
def main():
    con = MyClass()
    engine.rootContext().setContextProperty("con", con)

```
##### QML发送信号到Python
QML定义信号，QML发出信号，python 通过rootObject绑定槽，收到信号python则执行相应动作。

```javascript
signal sendClicked(string str) // QML define signal

onClicked: {
  root.sendClicked("Hello, Python3")//emit signal       
}
```

```python
def outputString(string):
    print(string)
def main():
    view.rootObject().sendClicked.connect(outputString) # python binding action
```

##### python调用js函数
python通过rootObject直接调用javaScript函数

```javascript
Rectangle {
    id: rotater
    property real angle : 0
    x: 240; y: 95
    width: 100; height: 5
    color: "black"
 
    transform: Rotation {
        origin.x: 10; origin.y: 5
        angle: rotater.angle
    }
    function updateRotater() {// 定义函数                         rotater.angle += 5
    }
}

```

```python
def main():
    timer = QTimer()
    timer.start(2000)
    timer.timeout.connect(view.rootObject().updateRotater) # 调用QML函数
```
  
##### python定义@signal，绑定Js函数，定义发射


```python
class Backend(QObject):
    update_date = pyqtSignal(str)
    def run(self):
        data = QDateTime.currentDateTime()
        self.update_date.emit(str(data))
    def bind(self,func):
        self.update_date.connect(func)
        
if __name__ == '__main__':
    view = QQuickView()
    view.setSource(QUrl(path))
    b = BackendOneshot()
    b.update_date.connect(view.rootObject().abc)
```

demo2

```python

class Plot(QObject):
    updCanv = pyqtSignal(float,float, arguments=['upd'])
    def __init__(self):
        QObject.__init__(self)
        self.rb = 1
        self.ii = 0
    def binding(self,fSlot):
        self.updCanv.connect(fSlot)
    def emitDat(self):
        ff =  lambda x: x * x + 0.3
        ff =  lambda x: 20+ 40* math.cos(x *0.2)
        points = ff(self.ii)
        self.ii+=1
        print( points )
        self.updCanv.emit(float( points))
```

### getObject
QQuickView只有rootObject,没有rootObjects
QQmlApplicationEngine有rootObjects()，可以获取QML组件。


'self.combo_label_choice = self.win.findChild(QObject, 'combo_label_choice')


plot.binding( engine.rootObjects()[0].findChild(QObject,"itemCanvas").addPoint2 )



##### 绑定qObject

```python
self.win = parent
self.ctx = context
self.btnOpen = self.win.findChild(QObject, 'btnOpen')
```

##### 设置属性：
```python
self.btnOpen.setProperty('text', '关闭串口')
```	
##### 设置变量

```	
self.ctx.setContextProperty('ports', 'abc')
```	
        #self.cmbPort.setProperty('currentIndex', self.cmbPort.find(self.conf.get('serial', 'port')))
        #self.cmbBaud.setProperty('currentIndex', self.cmbBaud.find(self.conf.get('serial', 'baudrate')))

##### 读取属性

```python
self.ser.port = self.cmbPort.property('currentText')[:self.cmbPort.property('currentText').index(' ')]
self.ser.parity = self.cmbParity.property('currentText')[0]
self.ser.baudrate = int(self.cmbBaud.property('currentText'))
```


### misc
sleep 会阻塞GUI响应
timer 不会完全阻塞GUI响应