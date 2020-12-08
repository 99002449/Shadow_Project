import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
ColumnLayout
{
    width: (mainWindow.width - mainWindow.width*widthPercentage ) *(1/5)
    Layout.alignment: {
        Qt.AlignTop
      Qt.AlignLeft
    }
    Button
    {
        id:addGraphButton
        text: "Add Graph"
    }

    Text {
        id: title
        font.pointSize: 24
        font.bold: true
        color: "Red"

        text: qsTr("W\nA\nV\nE\nF\nO\nR\nM")
    }
}

