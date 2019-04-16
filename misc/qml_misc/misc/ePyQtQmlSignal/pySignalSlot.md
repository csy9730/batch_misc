###Signal
SIGNAL 
�޲���
Я������ pyqtSignal(float)
Я��������� pyqtSignal(float,int)
Я�����ز��� 
  pyqtSignal([int,int ],[])  
Я��list,dict����   
    pyqtSignal(list)  
       

###SLOT
SLOT����Я�������ͷ���ֵ


sleep ������GUI��Ӧ
timer ������ȫ����GUI��Ӧ


 
###�źŰ�

��� 
     
* signal        �ź������ӷ���Դ���� emit�Խ���Դ
* slot        һ��ִ�к�����������Դ������ͷ���ֵ
* context       ������
* rootObject    UI�ĸ�����
* 


����������ֵ��δ��ݣ�

#####QML��Python���źŽ���

**QML����Python��Slot**

**QML����signal��Python**

**Python����Js����**

**Python����signal��Qml**



* QML����Python��Slot
 qmlͨ��rootContext���Զ����࣬UI��ֱ�ӵ��� @pyqtSlot(int,result=str)���ε�python����

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
    # slot function, input param type:int��return type: str
    @pyqtSlot(int, result=str)   
    def returnValue(self, value):
        return str(value+10)    
  
def main():
    con = MyClass()
    engine.rootContext().setContextProperty("con", con)

```
* QML�����źŵ�Python
QML�����źţ�QML�����źţ�python ͨ��rootObject�󶨲ۣ��յ��ź�python��ִ����Ӧ������

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

* python����js����
pythonͨ��rootObjectֱ�ӵ���javaScript����

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
    function updateRotater() {// ���庯��                             
        rotater.angle += 5
    }
}

```

```python
def main():
    timer = QTimer()
    timer.start(2000)
    timer.timeout.connect(view.rootObject().updateRotater) # ����QML����
```
  
* python����@signal����Js���������巢��


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

###getObject
QQuickViewֻ��rootObject,û��rootObjects
QQmlApplicationEngine��rootObjects()�����Ի�ȡQML�����


'self.combo_label_choice = self.win.findChild(QObject, 'combo_label_choice')


plot.binding( engine.rootObjects()[0].findChild(QObject,"itemCanvas").addPoint2 )



#####��qObject

```python
self.win = parent
self.ctx = context
self.btnOpen = self.win.findChild(QObject, 'btnOpen')
```

#####�������ԣ�
```python
self.btnOpen.setProperty('text', '�رմ���')
```	
#####���ñ���

```	
self.ctx.setContextProperty('ports', 'abc')
```	
        #self.cmbPort.setProperty('currentIndex', self.cmbPort.find(self.conf.get('serial', 'port')))
        #self.cmbBaud.setProperty('currentIndex', self.cmbBaud.find(self.conf.get('serial', 'baudrate')))

#####��ȡ����

```python
self.ser.port = self.cmbPort.property('currentText')[:self.cmbPort.property('currentText').index(' ')]
self.ser.parity = self.cmbParity.property('currentText')[0]
self.ser.baudrate = int(self.cmbBaud.property('currentText'))
```