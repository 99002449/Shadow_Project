import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import MyLang 1.0
ColumnLayout
{
    QtObject
    {
        id: data
        property var content: [qsTr("W\nA\nV\nE\nF\nO\nR\nM\n"),qsTr("Add Graph"),qsTr("Remove Graph")]
        property var languageToolTip: [qsTr("UK - English"),qsTr("India - Hindi"),qsTr("Karnataka - Kannada"),qsTr("France - French"),qsTr("Japan - Japanese")]
    }
    Button
    {
        id: addGraphButton
        Layout.bottomMargin: 5
        implicitWidth: 100
        implicitHeight:40
        background: Rectangle{
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5
        }

        Text {
            text: qsTr(data.content[1]+mytrans.emptyString)
            clip: true
            wrapMode: Text.WordWrap//adjusts the text as the digits increases
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }


        ToolTip.text:  data.content[1]
        ToolTip.visible:  data.content[1] ? mouseAreaAddGraph.containsMouse : false
        MouseArea
        {
            id:mouseAreaAddGraph
            anchors.fill:addGraphButton
            hoverEnabled: true
            onClicked: {
                //code to add graph
            }
        }
    }
    Button
    {
        id: removeGraphButton
        Layout.bottomMargin: 5
        implicitWidth:100
        implicitHeight:40
        background: Rectangle{
            gradient: Gradient {
                GradientStop { position: 0 ; color: "#ffeb99"  }
                GradientStop { position: 1 ; color: "#997a00"  }
            }
            radius: 5
        }

        Text {
            text:qsTr(data.content[2]+mytrans.emptyString)
            clip: true
            wrapMode: Text.WordWrap//adjusts the text as the digits increases
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }


        ToolTip.text:  data.content[2]
        ToolTip.visible:  data.content[2] ? mouseAreaRemoveGraph.containsMouse : false
        MouseArea
        {
            id:mouseAreaRemoveGraph
            anchors.fill:removeGraphButton
            hoverEnabled: true
            onClicked: {
                //code to remove graph
            }
        }
    }
    Text {
        id: title
        Layout.topMargin: 20
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        font.pointSize: 35
        font.bold: true
        color: "#806600"
        text: qsTr(data.content[0]+mytrans.emptyString)
        SequentialAnimation on color
        {
            loops: Animation.Infinite
            // Morning
            ColorAnimation
            {
                to: "#cca300"
                duration: 10000 * 0.3
            }
            // Afternoon
            PauseAnimation
            {
                duration: 10000 * 0.4
            }
            // Night
            ColorAnimation
            {
                to: "#fff5cc"
                duration: 10000 * 0.3
            }
        }
        ParallelAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation {
                target: title
                property: "scale"
                from: 1; to: 0.5
                duration: 10000
                easing.type: Easing.InOutQuart
            }
        }
    }


    Image {
        property string toolTipTextEnglish: data.languageToolTip[0]
        id: english
        ToolTip.text: toolTipTextEnglish
        ToolTip.visible:toolTipTextEnglish ? mouseAreaImageEnglish.containsMouse : false
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter| Qt.AlignBottom
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
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter| Qt.AlignBottom
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
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter| Qt.AlignBottom
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
    /* Image {
                property string toolTipTextFrench: data.languageToolTip[3]
                 Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter| Qt.AlignBottom
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
            }*/
    Image {
        property string toolTipTextJapan: data.languageToolTip[4]
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter| Qt.AlignBottom
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


