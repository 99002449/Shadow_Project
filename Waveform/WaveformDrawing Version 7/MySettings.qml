import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls .Styles 1.0
import MyLang 1.0

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
    id: mySettingsGridLayout
    rows:5
    columns: 2
    rowSpacing:-50

    QtObject
    {
        id: data
        property var content: [qsTr("Browse"), qsTr("Amplitude"),
            qsTr("Select Color"),qsTr("Blue"),qsTr("Green"),qsTr("Red"),qsTr("Yellow"),
            qsTr("Select Thickness"),qsTr("Select Language"), qsTr("English"), qsTr("French"), qsTr("Japnese")]
    }



    Rectangle
   {
       Layout.bottomMargin: 120
        RowLayout
        {
            Image {
                id: english
                source: "image/England.png"
                MouseArea{
                    anchors.fill:english
                    onClicked: mytrans.updateLanguage(MyLang.ENG)
                }
            }
            Image {
                id: india
                Layout.leftMargin: 7
                source: "image/India.png"
                MouseArea{
                    anchors.fill:india
                    onClicked: mytrans.updateLanguage(MyLang.HIN)
                }
            }
            Image {
                id: kannada
                Layout.leftMargin: 7
                source: "image/Karnataka.png"
                MouseArea{
                    anchors.fill:kannada
                    onClicked: mytrans.updateLanguage(MyLang.KAN)
                }
            }
            Image {
                id: france
                Layout.leftMargin: 7
                source: "image/France.png"
                MouseArea{
                    anchors.fill:france
                    onClicked: mytrans.updateLanguage(MyLang.FRE)
                }
            }
            Image {
                id: japan
                Layout.leftMargin: 7
                source: "image/Japan.png"
                MouseArea{
                    anchors.fill:japan
                    onClicked: mytrans.updateLanguage(MyLang.JAP)
                }
            }


        }
    }
    Button{
        id:myBrowseButton
        Layout.fillWidth: true
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop |Qt.AlignVCenter | Qt.AlignCenter
        Layout.bottomMargin: 25
        Layout.minimumWidth :100
        text: qsTr(data.content[0]+mytrans.emptyString)
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
        text: qsTr(data.content[1]+mytrans.emptyString)
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

    ComboBox
    {
        id:graphColorComboBox
        Layout.alignment:  Qt.AlignBottom
        model: [qsTr(data.content[2]+mytrans.emptyString),qsTr(data.content[3]+mytrans.emptyString),
            qsTr(data.content[4]+mytrans.emptyString),qsTr(data.content[5]+mytrans.emptyString),qsTr(data.content[6]+mytrans.emptyString)]

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
            sendColorComboBoxSignal(indexOfColorComboBox)
        }
    }

    ComboBox
    {
        id:graphThicknessComboBox
        Layout.alignment:  Qt.AlignBottom
        Layout.topMargin:40
        model: [qsTr(data.content[7]+mytrans.emptyString),"25%", "50%", "75%","100%"]
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





