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
    property int previousMouseX: 0
    property int previousMouseY: 0
    color: "#000000"

    GridLayout
    {
        Layout.alignment: Qt.AlignTop
        anchors.fill:parent
        rowSpacing:0
        rows:2
        columns: 3
        MyTitle
        {
            Layout.rowSpan: 2
            id:myTitle
        }
        MyChart
        {
            id:graph1
            MouseArea{
                id:graph1MouseArea
                anchors.fill: graph1
                drag.target: graph1.referenceToWave
                drag.axis: Drag.XAndYAxis

                /*   onPositionChanged: {
                        graph1.scrollLeft(3)
                        console.log(mouseX+"   "+mouseY)
                    }*/
                onMouseXChanged: {

                    if(mouseX>=previousMouseX)
                    {
                        previousMouseX=mouseX
                        graph1.scrollLeft(5)
                    }
                    else
                    {
                        previousMouseX=mouseX
                        graph1.scrollRight(5)
                    }
                }

                onMouseYChanged: {

                    if(mouseY>=previousMouseY)
                    {
                        previousMouseY=mouseY
                        graph1.scrollUp(5)
                    }
                    else
                    {
                        previousMouseY=mouseY
                        graph1.scrollDown(5)
                    }
                }

                onWheel: {
                    if(wheel.angleDelta.y==120)
                        graph1.zoomIn()
                    if(wheel.angleDelta.y==-120)
                        graph1.zoomOut()
                }
                onDoubleClicked: graph1.zoomReset()
            }


        }
        MySettings
        {
            id:graph1Settings

        }

        MyChart
        {
            id:graph2
            MouseArea{
                anchors.fill: graph2
                onWheel: {
                    if(wheel.angleDelta.y==120)
                        graph2.zoomIn()
                    if(wheel.angleDelta.y==-120)
                        graph2.zoomOut()
                }
                onDoubleClicked: graph2.zoomReset()
            }
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







