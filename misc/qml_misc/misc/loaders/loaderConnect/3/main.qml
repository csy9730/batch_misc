mport QtQuick.Window 2.0
import QtQuick.Controls 2.0
//
//处理Loader -> source 中的 signal 和property问题
//
Window{
    id:rootWin;
    width: 400;
    height: 540;
    visible: true;
    
    Loader{
        id:modLoader;
        source: "qrc:/LoadedModule.qml";
        onLoaded: {
            //直接通过signal.connect方法连接
            modLoader.item.mouseClicked.connect(on_Mouse_Clicked);
            console.log(modLoader.item.content);
            
            /* 修改content */
            modLoader.item.content = qsTr("modify property < content >");
        }
    }
    function on_Mouse_Clicked(){
        console.log("on_Mouse_Clicked");
    }
}
