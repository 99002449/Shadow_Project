import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

GridLayout{
    property int count: 0
    property string str
    property alias browseButton:myBrowseButton
    // anchors.fill:parent
    rows:4
    columns: 2
    rowSpacing:-50

    Button{
        id:myBrowseButton
        Layout.fillWidth: true
        Layout.columnSpan: 2

        Layout.bottomMargin: 25
        Layout.minimumWidth :100
        text: "Browse File"
        implicitWidth: 90
        implicitHeight:40
        onClicked:
        {
            fileDialog.open()
        }

        background: Rectangle{
            id: buttonColor
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5

        }


    }

    Text {
        Layout.alignment: Qt.AlignCenter
        color: "white"
        text: qsTr("Amplitude")
        font.bold: true
        font.kerning: true
        font.letterSpacing: 2
        font.pixelSize: 14
    }
    Dial
    {
        id:amplitudeDial
        stepSize: 10
        implicitWidth:80
        Layout.alignment:  Qt.AlignTop
        Layout.bottomMargin: -10
        from:0
        to:100
        value:0
        background: Rectangle{
            color: "#fff5cc"
            radius: 60
            width: Math.max(64, Math.min(amplitudeDial.width, amplitudeDial.height))
            height: width
            y: 40
        }

    }
    Text {
        color: "white"
        Layout.alignment: Qt.AlignCenter
        text: qsTr("Sweep Speed")
        font.bold: true
        font.kerning: true
        font.letterSpacing: 2
        font.pixelSize: 14
    }
    Dial
    {
        id:sweepSpeedDial
        Layout.bottomMargin: 25
        Layout.alignment:  Qt.AlignTop
        implicitWidth:80
        from:0
        to:100
        value:0
        background: Rectangle{
            color: "#fff5cc"
            radius: 60
            width: Math.max(64, Math.min(amplitudeDial.width, amplitudeDial.height))
            height: width
            y: 40
        }
    }
    ComboBox
    {
        id:graphColorComboBox
        Layout.alignment:  Qt.AlignBottom
        model: ListModel {
            id: chooseColor
            ListElement { text: "Select Color" }
            ListElement { text: "Blue" }
            ListElement { text: "Green" }
            ListElement { text: "Red" }
            ListElement { text: "Yellow" }
        }

        background: Rectangle{
            id: combo1
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5

        }

        implicitHeight: 30
        implicitWidth: 140

        onActivated:  {
            if(graphColorComboBox.currentIndex===1)  graph1.referenceToWave.color="Blue"
            else if(graphColorComboBox.currentIndex===2)  graph1.referenceToWave.color="Green"
            else if(graphColorComboBox.currentIndex===3)  graph1.referenceToWave.color="Red"
            else if(graphColorComboBox.currentIndex===4)  graph1.referenceToWave.color="Yellow"
        }

    }

    ComboBox
    {
        id:graphThicknessComboBox
        Layout.alignment:  Qt.AlignBottom
        model: ["Select Thickness","25%", "50%", "75%","100%"]
        implicitHeight: 30
        implicitWidth: 140

        background: Rectangle{
            id: combo2
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5

        }

        onActivated:  {
            if(graphThicknessComboBox.currentIndex===1)  graph1.referenceToWave.width=3
            else if(graphThicknessComboBox.currentIndex===2) graph1.referenceToWave.width=6
            else if(graphThicknessComboBox.currentIndex===3)graph1.referenceToWave.width=8
            else if(graphThicknessComboBox.currentIndex===4)graph1.referenceToWave.width=10
            implicitHeight: 30
            implicitWidth: 140

        }


    }



}


