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
        property var content: [qsTr("Waveform Drawing - Shadow Project using Qt/QML")]
    }
    title: qsTr(data.content[0]+mytrans.emptyString)
    color: "#000000"


    //Title
    MyTitle
    {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Layout.topMargin: mainWindow.width-(mainWindow.width-20)
        id:mytitle
    }


   ScrollView {
        anchors.left:mytitle.right
        id:myScrollView
        width: 1500
        height: 500

        ListView {
            model:5
            spacing: 350
            delegate: ItemDelegate{
                anchors.bottomMargin: 40
                GraphAndSettings
                {
                    width: 1500
                    height: 400
                }
            }
        }
    }


}

