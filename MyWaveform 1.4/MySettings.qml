import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls .Styles 1.0

GridLayout{
    property string text: "Option: "
    property variant items: ["first"]
    property int currentSelection: 0
    signal selectionChanged(variant selection)
    signal clicked

    property int count: 0
    property string str
    property alias browseButton:myBrowseButton
    property int indexOfColorComboBox
    property int indexOfThicknessComboBox
    property int amplitudeValue

    signal sendColorComboBoxSignal(int indexOfColorComboBox)
    signal sendThicknessComboBoxSignal(int indexOfThicknessComboBox)
    signal sendAmplitudeSignal(int amplitudeValue)
    // anchors.fill:parent
    id: mySettingsGridLayout
    rows:4
    columns: 2
    rowSpacing:-50



    Button{

        //create a signal
        id:myBrowseButton
        Layout.fillWidth: true
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop |Qt.AlignVCenter | Qt.AlignCenter
        Layout.bottomMargin: 25
        Layout.minimumWidth :100
        text: "Browse File"
        implicitWidth: 90
        implicitHeight:40

        background: Rectangle{
            id: buttonColor
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5

        }
        onClicked: fileDialog.open()
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
        to:99
        value:0
        background: Rectangle{
            color: "#fff5cc"
            radius: 60
            width: Math.max(64, Math.min(amplitudeDial.width, amplitudeDial.height))
            height: width
            y: 40
        }

        onMoved: {

            amplitudeValue=amplitudeDial.value
            sendAmplitudeSignal(amplitudeValue)
        }

    }


    /*  Text {
        color: "white"
        Layout.alignment: Qt.AlignCenter
        text: qsTr("Sweep Speed")
        font.bold: true
        font.kerning: true
        font.letterSpacing: 2
        font.pixelSize: 14
    }*/
    /*Dial
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
    }*/
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

        onActivated:
        {
            indexOfColorComboBox=graphColorComboBox.currentIndex
            console.log("signal - colorcombo box "+indexOfColorComboBox)
            sendColorComboBoxSignal(indexOfColorComboBox)
        }


    }

    ComboBox
    {
        id:graphThicknessComboBox
        Layout.alignment:  Qt.AlignBottom
         Layout.topMargin:40
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
            indexOfThicknessComboBox=graphThicknessComboBox.currentIndex
            sendThicknessComboBoxSignal(indexOfThicknessComboBox)
        }
    }

    Button
    {
        id: buttonText
        Layout.columnSpan: 2
         Layout.fillWidth: true
         Layout.topMargin: 80
         Layout.alignment: Qt.AlignBottom
        implicitWidth: 90
        implicitHeight:40
        background: Rectangle{
            id: buttonColor2
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
                radius: 5
        }


        Text {
            text: mySettingsGridLayout.text + mySettingsGridLayout.items[currentSelection]
            clip: true
            wrapMode: Text.WordWrap//adjusts the text as the digits increases
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }



        onClicked: {
            currentSelection = (currentSelection + 1) % items.length;
            selectionChanged(mySettingsGridLayout.items[currentSelection]);
        }
    }

}





