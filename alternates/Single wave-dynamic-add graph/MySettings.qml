import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import MyLang 1.0

GridLayout{
    property string text: "Option: "
    property variant items: ["first"]
    property int currentSelection: 0
    signal selectionChanged(variant selection)
    signal sendSignalToAddGraph()

    property int count: 0
    property string str
    property alias browseButton:myBrowseButton
    property  alias referenceToColorComboBox: graphColorComboBox
    property  alias referenceToThicknessComboBox: graphThicknessComboBox
    property alias referenceToAmplitudeDial: amplitudeDial
    id: graphSettingsGridLayout
    // anchors.fill:parent
    rows:5
    columns: 2
    rowSpacing:-50

    QtObject
    {
        id: data
        property var content: [qsTr("Browse"), qsTr("Amplitude"),
            qsTr("Select Color"),qsTr("Blue"),qsTr("Green"),qsTr("Red"),qsTr("Yellow"),
            qsTr("Select Thickness"),qsTr("Select Language"), qsTr("English"), qsTr("French"), qsTr("Japnese")]
        property var languageToolTip: [qsTr("UK - English"),qsTr("India - Hindi"),qsTr("Karnataka - Kannada"),qsTr("France - French"),qsTr("Japan - Japanese")]

    }
    Button
    {
        id: addGraphButton
        Layout.bottomMargin: 80
        Layout.alignment: Qt.AlignBottom
        implicitWidth: 150
        implicitHeight:40
        background: Rectangle{
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5
        }

        Text {
            //text: graphSettingsGridLayout.text + graphSettingsGridLayout.items[currentSelection]
                    text: "Add"
            clip: true
            wrapMode: Text.WordWrap//adjusts the text as the digits increases
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }

        onClicked: {
            console.log("clicked")
            sendSignalToAddGraph()
        }
    }
    Button
    {
        id: removeGraphButton



        Layout.bottomMargin: 80
        Layout.alignment: Qt.AlignBottom
        implicitWidth:150
        implicitHeight:40
        background: Rectangle{
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5
        }

        Text {
            //  text: graphSettingsGridLayout.text + graphSettingsGridLayout.items[currentSelection]
                    text: "Remove"
            clip: true
            wrapMode: Text.WordWrap//adjusts the text as the digits increases
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }

        onClicked: {

        }
    }

    Rectangle
    {
        Layout.bottomMargin: 120
        RowLayout
        {
            Image {
                property string toolTipTextEnglish: data.languageToolTip[0]
                id: english
                ToolTip.text: toolTipTextEnglish
                ToolTip.visible:toolTipTextEnglish ? mouseAreaImageEnglish.containsMouse : false
                source: "image/England.png"
                MouseArea{
                    id:mouseAreaImageEnglish
                    anchors.fill:english
                    onClicked: mytrans.updateLanguage(MyLang.ENG)
                    hoverEnabled: true
                }
            }
            Image {
                property string toolTipTextHindi:data.languageToolTip[1]
                id: india
                Layout.leftMargin: 7
                source: "image/India.png"
                ToolTip.text: toolTipTextHindi
                ToolTip.visible:toolTipTextHindi ? mouseAreaImageHindi.containsMouse : false
                MouseArea{
                    id:mouseAreaImageHindi
                    anchors.fill:india
                    onClicked: mytrans.updateLanguage(MyLang.HIN)
                    hoverEnabled: true
                }
            }
            Image {
                property string toolTipTextKannada: data.languageToolTip[2]
                id: kannada
                ToolTip.text: toolTipTextKannada
                ToolTip.visible:toolTipTextKannada? mouseAreaImageKannada.containsMouse : false
                Layout.leftMargin: 7
                source: "image/Karnataka.png"
                MouseArea{
                    id:mouseAreaImageKannada
                    anchors.fill:kannada
                    onClicked: mytrans.updateLanguage(MyLang.KAN)
                    hoverEnabled: true
                }
            }
            Image {
                property string toolTipTextFrench: data.languageToolTip[3]
                id: france
                ToolTip.text: toolTipTextFrench
                ToolTip.visible:toolTipTextFrench? mouseAreaImageFrance.containsMouse : false
                Layout.leftMargin: 7
                source: "image/France.png"
                MouseArea{
                    id:mouseAreaImageFrance
                    anchors.fill:france
                    onClicked: mytrans.updateLanguage(MyLang.FRE)
                    hoverEnabled: true
                }
            }
            Image {
                property string toolTipTextJapan: data.languageToolTip[4]
                id: japan
                ToolTip.text: toolTipTextJapan
                ToolTip.visible:toolTipTextJapan? mouseAreaImageJapan.containsMouse : false
                Layout.leftMargin: 7
                source: "image/Japan.png"
                MouseArea{
                    id:mouseAreaImageJapan
                    anchors.fill:japan
                    onClicked: mytrans.updateLanguage(MyLang.JAP)
                    hoverEnabled: true
                }
            }


        }
    }
    //browseButton
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
        onClicked:
        {
            fileDialog.open()
        }

        background: Rectangle{
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5
        }
    }
    //label for amplitude
    Text {
        Layout.alignment: Qt.AlignCenter
        color: "white"
        text: qsTr(data.content[1]+mytrans.emptyString+": "+amplitudeDial.value.toPrecision(1))
        font.bold: true
        font.kerning: true
        font.letterSpacing: 2
        font.pixelSize: 14
    }
    //Dial for amplitude
    Dial
    {
        id:amplitudeDial
        stepSize: 1
        implicitWidth:80
        Layout.alignment:  Qt.AlignTop
        Layout.bottomMargin: -10
        from:1
        to:5
        onMoved:{
            //yAxis.min=ymin_temp.min*value;
            //yAxis.max=ymax_temp.max*value;
        }
        background: Rectangle{
            color: "#fff5cc"
            radius: 60
            width: Math.max(64, Math.min(amplitudeDial.width, amplitudeDial.height))
            height: width
            y: 40
        }
    }

    //ComboBox for color
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
    }
    //ComboBox for thickness
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
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5
        }

        Text {
            text: graphSettingsGridLayout.text + graphSettingsGridLayout.items[currentSelection]
            clip: true
            wrapMode: Text.WordWrap//adjusts the text as the digits increases
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }

        onClicked: {
            currentSelection = (currentSelection + 1) % items.length;
            selectionChanged(graphSettingsGridLayout.items[currentSelection]);
        }
    }
}
