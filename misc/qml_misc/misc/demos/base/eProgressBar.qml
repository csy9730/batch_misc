import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle{

    width: 520;
    height: 280;
    color:"#a0b0c0";


    Row{

        anchors.fill:  parent;
        anchors.margins: 50;
        spacing: 8;



        //进度条1
        ProgressBar{

            minimumValue: 0;
            maximumValue: 100;
            value: 40;
            width: 150;
            height: 20;

            Timer{
                interval: 1000;
                repeat: true;
                running: true;
                onTriggered: {
                    if(parent.value < 99.1){
                        parent.value += 1;
                    }else{
                        stop();
                    }
                }

            }

        }

        //进度条2
        ProgressBar{
            orientation: Qt.Vertical; //设置竖直滚动条
            minimumValue: 0;
            maximumValue: 1;
            value: 0.2;
            width: 20;
            height: 200;
            Timer{

                interval: 1000;
                repeat: true;
                running: true;
                onTriggered: {
                    parent.value = Math.random();
                }
            }

        }


        //进度条3
        ProgressBar{

            minimumValue: 0;
            maximumValue: 1;
            value: 0.2;
            width: 80;
            height: 16;
            //当indeterminte设置为真实， ProcessBar变成了BusyIndicator了，请稍等，不久后就会告诉你答案
            indeterminate: true;
        }



        Item{
            width: 180;
            height: parent.height;

            //进度条4
            ProgressBar{

                id: customProgress;
                anchors.centerIn: parent;
                minimumValue: 0;
                maximumValue: 1;
                value: 0.2;
                width: 160;
                height: 20;

                style: ProgressBarStyle{
                    background: Rectangle{
                        implicitWidth: 200;
                        implicitHeight: 20;
                        border.width: 1;
                        border.color: control.hovered ? "green":"gray";
                        color:"lightgray";
                    }


                    progress: Rectangle{

                        color: "#208020";
                    }

                }

            }



            //进度条5
            ProgressBar{
                id: percentProcess;
                anchors.top: customProgress.bottom;
                anchors.topMargin: 4;
                anchors.horizontalCenter: parent.horizontalCenter;
                minimumValue: 0;
                maximumValue: 1;
                value: 0.33;
                width: 160;
                height: 20;

                style: ProgressBarStyle{
                    id: progressStyle;
                    background: Rectangle{
                        border.width: 1;
                        border.color: control.hovered?"green":"gray";
                        color:"lightgray";
                    }


                    progress: Rectangle{
                        color:"#208020";

                    }


                    panel: Item{

                        //通过panel属性，可以加载  progress Text background等组件

                        //设置外边框
                        implicitWidth: 200;
                        implicitHeight: 20;

                        Loader{
                            anchors.fill:  parent;
                            sourceComponent: background;
                        }


                        Loader{
                            id: progressLoader;
                            anchors.top: parent.top;
                            anchors.left: parent.left;
                            anchors.bottom:  parent.bottom;
                            anchors.margins: 3;
                            z: 1;
                            width: currentProgress * (parent.width - 6);
                            sourceComponent: progressStyle.progress;

                        }


                        Text{

                            color: "blue";
                            text:currentProgress * 100 + "%";
                            z: 2;
                            anchors.centerIn: parent;

                        }

                    }
                }

            }

        }

    }

}