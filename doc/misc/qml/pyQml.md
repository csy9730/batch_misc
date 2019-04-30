# PyQml

### QML
qml核心为ECMAScript，语法为类似javascript语言的语法，使用类似json的字典结构。
qml文件以component组成。
QML界面的核心类分为以下三类
对应的component(rootObject)为Item,Rectangle,Window,ApplicationWindow

* QQmlApplicationEngine  对应window？拥有窗口完整控制权
* QQuickView ，对应Item,Rect，窗口控制权在c++代码里
* QQuickWidget，在QWidget界面上加载QML界面

### QML语法
基本类型： 整型，实数型，布尔，字符串，列表。与javascript的基本类型相同
import语句
对象：使用大括号类似字典格式。
冒号分离property和value
value可以使用javascript表达式
通过// ,/**/标记注释

信号处理器：属性名由on+属性+触发构成。 值为匿名函数。

附加属性，附加信号处理器：？？？
分组： ？
列表：使用方框号，可以包含多个对象（只能包含对象，不可包含基本类型）

扩展数据类型：
* date
* time
* rect
* point
* size
* color
* font

#### QML常见对象
* Rectangle        矩形
* MouseArea        鼠标点击区域
* Text
* Image ，BorderImage， AnimatedImage
* Window
* Item    Component
* Ancors 通过锚定其他部件，管理布局，锚定对象可以为id或parent


#### dynamic
* loader    实现动态改变component
* Repeater
* Scale
* Rotation
* Translate
* Transform
* Gradient
* 

#### QML属性
* id
* x,y,z
* width,height
* group
* source
* anchors
* color

id属性，同一个qml文件内不同对象的id不能相同，可以通过id实现引用，进而实现绑定（基于引用值持续更新值）。
color 格式为"#AARRGGBB"，前面两位透明度，00对应全透明，ff对应不透明。后六位对应RGB的十六进制六位。也可以使用 字符串表示：color: "white"，color： "#88ffffff" ， 
property属性： property属性值可以被其他对象读取，可以动态修改。

qml路径：
file:///
qml:/

### 相关EXE

```
cd C:\Qt\Qt5.9.0\5.9\mingw53_32\bin\
qmlscene.exe samegame.qml  // 命令行显示UI界面
# qml.exe,qmlprofiler.exe
```

#### QML依赖
``` QML 
// C:\Qt\Qt5.9.0\5.9\mingw53_32\qml\ QML的import路径：

import QtQuick 2.2 
// rootObject可以使用Item,Text,Rectangle,Image
// QtQuick.2路径下含有 qmldir,plugins.qmltypes,qtquick2plugin.dll

import QtQuick.Controls 1.4

// rootObject可以使用ApplicationWindow
// QtQuick.Controls.2.ApplicationWindow
//对应C:\Qt\Qt5.9.0\5.9\mingw53_32\qml\QtQuick\Controls

import QtQuick.Window 2.2 
// rootObject可以使用Window


//可以import导入js文件
import "create-component.js" as ImageCreator

import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
```


### main
核心构件：
* APPLICATION，服务器端？幕后执行，对应（control？）
* QML , 界面端，调用QML文件，对应（view？）
* 自定义类，数据模型控制端，（对应Model？）

QML运行时绑定事件动作。窗口控制权在c代码或对应的py代码中


```python
	app=QGuiApplication(sys.argv) 
	engine=QQmlApplicationEngine() 
	engine.load(QUrl("openFile.qml"))
	sys.exit(app.exec())
```

```qml

Window{
}
```


```python
    app = QGuiApplication([])
    view = QQuickView()   
    view.setSource(QUrl('test4.qml'))
    view.show()           
    app.exec_()
```


### plot
* canvas
* matplotlib
* customplot

##### canvas
接口类似html5的canvas元素。
如何实现函数绘图？

1. 初始化
2. 添加
3. 绘制
3. 缓存    
4. 擦除

缓存：context.save();
添加：lastX, lastY
绘制 moveTo，CurveTo

paint： line-blank 交替
timer：开始，暂停。

### todo
* slider
* 切换引导界面，主界面
* 绘图
* 引入子目录

### misc

对应界面或组件加载完成的触发事件：
Component.onCompleted:{}

W: 如何处理QQuickView获取rootObject失败

###### catolog
0. 初始化上下文
1. 绑定qObject
2. 设置属性
3. 读取属性
4. 信号绑定


初始化上下文
```python
    app = QGuiApplication(sys.argv)
    qml = QQmlApplicationEngine('zal_ai.qml')
    qml.rootContext().setContextProperty('Ser', QmlSer(qml.rootContext() ,qml.rootObjects()[0]))
    sys.exit(app.exec())
    
```

信号绑定

```javascript
Button {
	id: btnSend
	Layout.row: 0
	Layout.column: 1
	Layout.rowSpan: 3
	Layout.minimumWidth: 100
	Layout.minimumHeight: parent.height
    text: "发送"
    activeFocusOnPress: false  
    // click event binding          
	onClicked: Ser.on_btnSend_clicked()
                
}
```

```python	
    @pyqtSlot()
    def on_btnSend_clicked(self):
        self.txtMain.setProperty('text', '')
```