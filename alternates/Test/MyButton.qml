import QtQuick 2.0

Item {

id: button1

property string backcolor
property string bordercolor
property int borderwidth
property int radius

property string text
property string color

property string enteredColor
property int enteredWidth

property string exitedColor
property int exitedWidth

property bool hoverEnabled: false


signal buttonClicked

Rectangle
{
     id: innerRac
     height: parent.height
     width: parent.width

     Text
     {
         anchors.centerIn: innerRac
         text: button1.text
         font.pixelSize: Math.round(innerRac.height/6)
         color: button1.color
         //Font.pixelSize: 20

     }

     border.color: button1.backcolor
     border.width: button1.borderwidth
     radius: button1.radius

     gradient: Gradient
     {
             GradientStop { position: 0.1; color: "lightsteelblue" }
             GradientStop { position: 1.0; color: "black" }
     }

      MouseArea
      {
        id: innerRacMouse
        hoverEnabled: button1.hoverEnabled
        onEntered: {
            innerRac.border.width = button1.enteredWidth
            //innerRac.rotation = 45
            innerRac.border.color = button1.enteredColor
        }
        onExited: {
            innerRac.border.width = button1.exitedWidth
            //innerRac.rotation = 45
            innerRac.border.color = button1.exitedColor

      }

      anchors.fill: innerRac
      onClicked: {
           buttonClicked();
        }

      }
}



}
