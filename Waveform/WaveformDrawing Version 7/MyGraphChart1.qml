import QtQuick 2.0
import QtCharts 2.3
ChartView
{
    property alias referencetoMyChart: graph1
    property alias referencetoXAxis: xAxis
    property alias referencetoYAxis: yAxis
    signal sendSignalFromGraph1Area(variant referenceToMyGraph1,variant num)
    id:graph1
    antialiasing: true
    width: mainWindow.width*widthPercentage
    height:mainWindow.height/heightPercentage
    visible: true
    theme: ChartView.ChartThemeDark

    axes: [
        ValueAxis{
            id: xAxis
            min:mywaveform.xmin()-1;
            max:mywaveform.xmin()+15;
        },
        ValueAxis{
            id: yAxis
            min:mywaveform.ymin()-2;
            max:mywaveform.ymax()+2;
        }
    ]

    MouseArea{
        id:graph1MouseArea
        anchors.fill: graph1
        drag.target: graph1.referenceToWave
        drag.axis: Drag.XAndYAxis

        onDoubleClicked:
        {
            sendSignalFromGraph1Area(graph1,0)
            graph1.zoomReset()
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

    }
}
