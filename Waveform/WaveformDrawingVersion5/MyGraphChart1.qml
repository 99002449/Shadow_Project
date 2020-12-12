import QtQuick 2.0
import QtCharts 2.3
ChartView
{
    //title: "Spline"
    property alias referencetoMyChart: graph1
    property alias referencetoXAxis: xAxis
    property alias referencetoYAxis: yAxis
    signal sendSignalFromGraph1Area(variant referenceToMyGraph1)
    id:graph1
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
        id:graph1MouseArea
        anchors.fill: graph1
        drag.target: graph1.referenceToWave
        drag.axis: Drag.XAndYAxis

        onClicked:
        {
            console.log("signal - onCLicked graph 1 id: "+graph1)
            do_it(graph1,0)
        }

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
