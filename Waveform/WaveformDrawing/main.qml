import QtQuick 2.12
import QtQml 2.3
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2
Window {
    id:mainWindow
    visibility: "Maximized"
    visible: true
    width: 1600
    height:900
    signal storeAndSendUrl(var url)

    title: qsTr("Waveform Drawing - Shadow Project using Qt/QML")
    property  double widthPercentage: 7/10
    property double heightPercentage: 2.5
    color: "#000000"

    GridLayout
    {
        Layout.alignment: Qt.AlignTop
        anchors.fill:parent
        rowSpacing:0
        rows:2
        columns: 3
        MyChart
        {
            id:graph1
        }
        MySettings
        {
            id:graph1Settings

        }
        MyTitle
        {
            Layout.rowSpan: 2
            id:myTitle
        }
        MyChart
        {
            id:graph2
        }
        MySettings
        {
            id:graph2Settings


        }


        FileDialog {
            id: fileDialog
            title: "Please choose a file"
            folder: shortcuts.home  //Default opens home directory
            nameFilters:"*.*"
            onAccepted: {
                storeAndSendUrl(this.fileUrl)
                console.log("first You chose: " + this.fileUrl)
            }
            onRejected: {
                console.log("Canceled")

            }
        }



    }

}







