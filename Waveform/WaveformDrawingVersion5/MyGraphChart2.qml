import QtQuick 2.0
import QtCharts 2.3
ChartView
{
    //title: "Spline"
    property alias referencetoMyChart: graph2
    property alias referencetoXAxis: xAxis
    property alias referencetoYAxis: yAxis
    signal sendSignalFromGraph2Area(variant referenceToMyGraph2)
    id:graph2
    antialiasing: true
    width: mainWindow.width*widthPercentage
    height:mainWindow.height/heightPercentage
    visible: true
    //property alias referenceToWave: wave
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
        drag.target: graph2.referenceToWave
        drag.axis: Drag.XAndYAxis

        onClicked:
        {
            console.log("signal -onCLicked graph 2 id: "+graph2)
            do_it(graph2,1)
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
        onDoubleClicked: graph2.zoomReset()
    }
}
