import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
Window {
    id:mainWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("Hello World")
    property  double widthPercentage: 3/5
    property int heightPercentage: 4
    color: "Black"
    GridLayout
    {
        anchors.fill:parent
        id:gridLayout
        columns: 3
        rows:4
        MyChart{ id:graph1}
        MySettings{id:graph1Settings}
        MyTitle
        {
            Layout.rowSpan: 4
             anchors.top:mainWindow.top
             anchors.right:mainWindow.right
            id:myTitle
        }

        MyChart{ id:graph2}
        MySettings{id:graph2Settings}

        MyChart{ id:graph3}
        MySettings{id:graph3Settings}

        MyChart{ id:graph4}
        MySettings{id:graph4Settings}
    }
}






