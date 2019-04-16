import QtQuick 2.4

Rectangle{
    width:430; height :130
    color:"lightblue"

    Image{
        source:"qt-logo.png"
        x:8;y:22
        width: 62
        height: 48
        NumberAnimation on x
        {
            from:10 ; to : 350
            duration :2000
        }
    }
}
