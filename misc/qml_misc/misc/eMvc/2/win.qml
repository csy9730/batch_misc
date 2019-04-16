import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
 
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    ListModel {
          id: libraryModel
          ListElement {
              title: "A Masterpiece"
              author: "-Gabriel"
          }
          ListElement {
              title: "Brilliance"
              author: "-Jens"
          }
          ListElement {
              title: "Outstanding"
              author: "-Frederik"
          }
      }
 
    TableView {
        width: 500;
        height: 400;
 
         TableViewColumn {
             role: "title"
             title: "Title"
             width: 100
         }
         TableViewColumn {
             role: "author"
             title: "Author"
             width: 200
         }
         model: libraryModel
 
        rowDelegate : Rectangle{
            height: 40;
        }
 
         itemDelegate: Rectangle{
             //color: "#052641"
             border.width: 1
             height: 30;
             color : styleData.selected ? "#dd00498C": "#052641"
             Text {
                  //anchors.centerIn : parent
                  anchors.verticalCenter: parent.verticalCenter
                  x : 10;
                  anchors.leftMargin: 5
                  color : changeColor(styleData.value) ? "red": "white" //ÖØµã
                  text: styleData.value
 
                  font.pixelSize: parent.height*0.5
                  function changeColor( value )
                     {
                        var sss = value.indexOf("-");
                        if (value.indexOf("-")>-1)
                         return true;
                        else
                            return false;
                     }
              }
         }
     }
 }
