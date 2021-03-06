import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5


GridLayout{
    property int count: 0
    property double  previousAmplitudeDialValue:amplitudeDial.value
    property string str
    property alias browseButton:myBrowseButton
    // anchors.fill:parent
    id: mySettingsGridLayout
    rows:4
    columns: 2
    rowSpacing:-50

    Button{
        id:myBrowseButton
        Layout.fillWidth: true
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop |Qt.AlignVCenter | Qt.AlignCenter
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
        stepSize: 0.1

        implicitWidth:80
        Layout.alignment:  Qt.AlignTop
        Layout.bottomMargin: -10
        from:1.0
        to:1.5
        value:0
        background: Rectangle{
            color: "#fff5cc"
            radius: 60
            width: Math.max(64, Math.min(amplitudeDial.width, amplitudeDial.height))
            height: width
            y: 40
        }

        onMoved: {

            if(amplitudeDial.value>=previousAmplitudeDialValue){
                previousAmplitudeDialValue=amplitudeDial.value
                console.log(" value:: "+amplitudeDial.value.toPrecision(2))
                //graph1.scale +=0.2
                graph1.zoom(amplitudeDial.value.toPrecision(2)*0.0002)

            }
            else
            {
                previousAmplitudeDialValue=amplitudeDial.value
                 //graph1.zoom -=0.2
                graph1.zoom(-2)

            }
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
        to:99
        value:0
        wrap: true
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





