import QtQuick 2.0
import QtCharts 2.3
ChartView
{
    property alias referencetoMyChart: graph2
    property alias referencetoXAxis: xAxis
    property alias referencetoYAxis: yAxis
    signal sendSignalFromGraph2Area(variant referenceToMyGraph2,variant num)
    id:graph2
    antialiasing: true
    width: mainWindow.width*widthPercentage
    height:mainWindow.height/heightPercentage
    visible: true
    theme: ChartView.ChartThemeDark

    axes: [
        ValueAxis{
            id: xAxis
        },
        ValueAxis{
            id: yAxis

        }
    ]

    MouseArea{
        id:graph2MouseArea
        anchors.fill: graph2
        drag.axis: Drag.XAndYAxis

        onDoubleClicked:
        {
            sendSignalFromGraph2Area(graph2,1)
            graph2.zoomReset()
        }
        onMouseXChanged: {

            if(mouseX>=previousMouseX)
            {
                previousMouseX=mouseX
                graph2.scrollLeft(5)
            }
            else
            {
                previousMouseX=mouseX
                graph2.scrollRight(5)
            }
        }

        onMouseYChanged: {

            if(mouseY>=previousMouseY)
            {
                previousMouseY=mouseY
                graph2.scrollUp(5)
            }
            else
            {
                previousMouseY=mouseY
                graph2.scrollDown(5)
            }
        }

        onWheel: {
            if(wheel.angleDelta.y==120)
                graph2.zoomIn()
            if(wheel.angleDelta.y==-120)
                graph2.zoomOut()
        }

    }
}
