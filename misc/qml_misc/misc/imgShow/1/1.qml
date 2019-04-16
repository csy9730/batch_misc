
import QtQuick 2.5
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.1
import Qt.labs.folderlistmodel 1.0
Window
{
    id: root
    visible: true
    width: 1024; height: 600
    color: "black"
    property int highestZ: 0
    property real defaultSize: 200
    property var currentFrame: undefined
    property real surfaceViewportRatio2: 1.5
    property real frameBorderRatio: 0.08;
    FileDialog
    {
        id: fileDialog
        title: "Choose a folder with some images"
        selectFolder: true
        onAccepted: folderModel.folder = fileUrl + "/"
    }
 
    Flickable
    {
        //Flickable�ṩһ����С���Ӵ�����ʾһ���ϴ�����ݸ��û��������û����ԶԸ����ݽ�����ק�����
 
        id: flick
        anchors.fill: parent;
        contentWidth: width * surfaceViewportRatio2;//���涨���Ratio������Ե���,��Ҫ���������Ƴ�����С
        contentHeight: height * surfaceViewportRatio2;
        Repeater
        {
            //FolderListModel��QT�ṩ��һ�����Է��ʱ���ϵͳ�ļ������ݵ�����������Խ���ȡ������Ϣ�ṩ��������ʹ��
            model: FolderListModel
            {
                id: folderModel
                objectName: "folderModel"
                //showDirs: false
                showDirs:true;//�Ƿ���ʾ�ļ��С�Ĭ��Ϊ��
                showDotAndDotDot: false;//���Ϊ�棬"." and ".."Ŀ¼��������model�У������ų���Ĭ��Ϊ��
                sortReversed: false;//���Ϊ�棬��ת����˳��Ĭ��Ϊ��
                nameFilters: ["*.png", "*.jpg", "*.gif"]
            }
            Rectangle
            {
                id: photoFrame
                objectName: "obj";
                color:"red";//�����Ϳ��Ʊ߿�Ϊ��ɫ��
                width: image.width * (1 + frameBorderRatio * image.height / image.width)
                height: image.height * (1.0+frameBorderRatio);
                scale: defaultSize / Math.max(image.sourceSize.width, image.sourceSize.height)
                Behavior on scale { NumberAnimation { duration: 300 } }
                Behavior on x { NumberAnimation { easing.amplitude: 1.05; easing.type: Easing.InOutSine; duration: 2000 } }
                Behavior on y { NumberAnimation { easing.type: Easing.OutInQuad; duration: 2000 } }
                border.color: "black"
                border.width: 3
                smooth: true
                antialiasing: true
                Component.onCompleted: //�齨��ɺ�����˶�
                {
                    x = Math.random() * root.width - width / 2
                    y = Math.random() * root.height - height / 2;
                    rotation = Math.random() * 13; //- 6
                }
                Image
                {
                    id: image
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    //fillMode:Image.PreserveAspectCrop
                    source: folderModel.folder + fileName
                    antialiasing: true
                }
                PinchArea //PinchArea��һ�����ɼ��Ķ���,��������һ���ɼ�����������һ��,Ϊ��Ӧ�Ŀɼ������ṩ���Ʋ���
                {
                    anchors.fill: parent
                    pinch.target: photoFrame
                    pinch.minimumRotation: -360
                    pinch.maximumRotation: 360
                    pinch.minimumScale: 0.2
                    pinch.maximumScale: 4
                    pinch.dragAxis: Pinch.XAndYAxis
                    onPinchStarted: setFrameColor();
                    property real zRestore: 0
 
                    MouseArea
                    {
                        id: dragArea
                        hoverEnabled: true
                        anchors.fill: parent
                        drag.target: photoFrame
 
                        //scrollGestureEnabled: false  // 2-finger-flick gesture should pass through to the Flickable
 
                        onPressed:
                        {
                            photoFrame.z = ++root.highestZ;
                            parent.setFrameColor();
                        }
                        onEntered: parent.setFrameColor();
                        onWheel:
                        {
                            if (wheel.modifiers & Qt.ControlModifier)
                            {
                                photoFrame.rotation += wheel.angleDelta.y / 120 * 5;
                                if (Math.abs(photoFrame.rotation) < 4)
                                    photoFrame.rotation = 0;
                            }
                            else
                            {
                                photoFrame.rotation += wheel.angleDelta.x / 120;
                                if (Math.abs(photoFrame.rotation) < 0.6)
                                    photoFrame.rotation = 0;
                                var scaleBefore = photoFrame.scale;
                                photoFrame.scale += photoFrame.scale * wheel.angleDelta.y / 120 / 10;
                            }
                        }
                    }
                    function setFrameColor() {
                        if (currentFrame)
                            currentFrame.border.color = "black";
                        currentFrame = photoFrame;
                        currentFrame.border.color = "yellow";
                    }
                }//PinchArea
            }//Rectangle
        }//Repeater
    }//Flickable
 
    Rectangle {//�Ҳ໬����
        id: verticalScrollDecorator
        anchors.right: parent.right
        anchors.margins: 2
        color: "cyan"
        border.color: "black"
        border.width: 1
        width: 5
        radius: 2
        antialiasing: true
        height: flick.height * (flick.height / flick.contentHeight) - (width - anchors.margins) * 2
        y:  flick.contentY * (flick.height / flick.contentHeight)
        NumberAnimation on opacity { id: vfade; easing.type: Easing.InOutQuint; to: 0; duration: 200 }
        onYChanged: { opacity = 1.0; fadeTimer.restart() }
    }
 
    Rectangle {//�·�ˮƽ������
        id: horizontalScrollDecorator
        anchors.bottom: parent.bottom
        anchors.margins: 2
        color: "cyan"
        border.color: "black"
        border.width: 1
        height: 5
        radius: 2
        antialiasing: true
        width: flick.width * (flick.width / flick.contentWidth) - (height - anchors.margins) * 2
        x:  flick.contentX * (flick.width / flick.contentWidth)
        NumberAnimation on opacity { id: hfade; to: 0; duration: 500 }
        onXChanged: { opacity = 1.0; fadeTimer.restart() }
    }
 
    Timer { id: fadeTimer; interval: 1000; onTriggered: { hfade.start(); vfade.start() } }
 
    Image {
    //һ��ͼ��ť��������ͼ��
        id:imageBT;
 
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        source: "qrc:/icons/icos/ninViewerHover.png"
        MouseArea {
            hoverEnabled:true;//��ʹû����갴��Ҳ��ִ��
            onEntered:
            {
                imageBT.source="qrc:/icons/icos/ninViewerpress.png";
            }
            onPressed:
            {
                imageBT.source="qrc:/icons/icos/ninViewerpress.png";
            }
            onExited:
            {
                imageBT.source="qrc:/icons/icos/ninViewerHover.png";
            }
            anchors.fill: parent
            anchors.margins: -10
            onClicked:
            {
                fileDialog.open();
            }
        }
    }
 
    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        color: "darkgrey"
        wrapMode: Text.WordWrap
        font.pointSize: 8
        text: "On a touchscreen: use two fingers to zoom and rotate, one finger to drag\n" +
              "With a mouse: drag normally, use the vertical wheel to zoom, horizontal wheel to rotate, or hold Ctrl while using the vertical wheel to rotate"
    }
 
    Component.onCompleted: fileDialog.open()
}
