import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

GridLayout
{
    property int worldTime: 10000
    columns: 1
    rows: 2
    rowSpacing: 40
    QtObject
    {
        id: data
        property var content: [qsTr("W\nA\nV\nE\nF\nO\nR\nM\n")]
    }
    Text {
        id: title
        font.pointSize: 40
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
                duration: worldTime * 0.3
            }

            // Afternoon
            PauseAnimation
            {
                duration: worldTime * 0.4
            }

            // Night
            ColorAnimation
            {
                to: "#fff5cc"
                duration: worldTime * 0.3
            }
        }
        ParallelAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation {
                target: title
                property: "scale"
                from: 1; to: 0.5
                duration: worldTime
                easing.type: Easing.InOutQuart
            }
        }
    }
}


