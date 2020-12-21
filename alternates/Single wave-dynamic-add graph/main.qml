import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtCharts 2.3
Window {
    id:mainWindow
    visibility: "Maximized"
    visible: true
    width: 1600
    height:900
    QtObject
    {
        id: data
        property var content: [qsTr("Waveform Drawing - Shadow Project using Qt/QML"),qsTr("Samples/sec: "),qsTr("Please choose a file")]
    }
    title: qsTr(data.content[0]+mytrans.emptyString)
    color: "#000000"



    ScrollView {
        width: 200
        height: 200

        ListView {
            width: 1600; height: 900
            model: 2
            delegate:
                GraphAndSettings
            {
                height:150
                width: 1600
            }

        }


    }
}

