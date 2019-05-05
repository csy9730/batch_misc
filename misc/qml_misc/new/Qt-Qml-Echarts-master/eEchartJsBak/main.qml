import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import "dat.js" as Dat
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
	
	property var  xx:10
	
    MyWebView{

    }
	Timer {
		interval: 1000
		repeat: true
		triggeredOnStart: true
		running: true
		onTriggered: {
			xx+=1
			var yy = Math.random()			
			console.log( xx, Dat.xdat)
			// Dat.xdat.push( xx);
			Dat.xdatAppend(xx);
			ZalAi.outputString("abc"+String(yy)+','+String(Dat.xdat))
			
		}
	}
}
