import QtQuick 2.0
import QtCharts 2.3
ChartView
{
    antialiasing: true
    property alias referenceToXAxis: xAxis
    property alias referenceToYAxis: yAxis
    property int previousMouseX: 0
    property int previousMouseY: 0
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
        anchors.fill: parent
        drag.axis: Drag.XAndYAxis

        onDoubleClicked:
        {
            parent.zoomReset()
        }

        onMouseXChanged: {

            if(mouseX>=previousMouseX)
            {
                previousMouseX=mouseX
                parent.scrollLeft(5)
            }
            else
            {
                previousMouseX=mouseX
                parent.scrollRight(5)
            }
        }

        onMouseYChanged: {

            if(mouseY>=previousMouseY)
            {
                previousMouseY=mouseY
                parent.scrollUp(5)
            }
            else
            {
                previousMouseY=mouseY
                parent.scrollDown(5)
            }
        }

        onWheel: {
            if(wheel.angleDelta.y==120)
                parent.zoomIn()
            if(wheel.angleDelta.y==-120)
                parent.zoomOut()
        }

    }


}
