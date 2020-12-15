import QtQuick 2.0

Rectangle
{
    property alias languageData:referenceToContent
    QtObject
    {
        property alias  referenceToContent: content
        id: data
        property var content: [qsTr("WAVEFORM"),qsTr("Browse"), qsTr("Amplitude"),
            qsTr("Select Color"),qsTr("Blue"),qsTr("Green"),qsTr("Red"),qsTr("Yellow"),
            qsTr("Select Thickness"),qsTr("Select Language"), qsTr("English"), qsTr("French"), qsTr("Japnese")]
    }
}

