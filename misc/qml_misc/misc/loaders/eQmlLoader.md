# QML.loader

通过loader可以 动态加载QML界面，实现动态切换QML界面。

### main

* loaded的rootObject使用ApplicationWindow或Window，则会变成弹出窗口（非模态新界面）；loaded使用Item或其他，则loader会把被加载界面与源界面直接叠加

w:loader界面和loadedModule如何信号交互？

loader通过loaderId.item.id访问loaded的模块
loaded模块难以访问loader，但可以发送signal给loader

loader通过loaderId.item可以访问id,变量，属性

//property bool isFirst : false;
