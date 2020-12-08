import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.3
import QtQuick.Controls 2.5
Window
{
    id:mainWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("Hello World")
    property  double widthPercentage: 3/4
    property int heightPercentage: 4
    property int countNumberOfGraph:0
    Rectangle
    {
        anchors.fill:parent
        color: "black"
        MyGraph
        {
            id: graph1
            width: mainWindow.width*widthPercentage
            height:mainWindow.height/heightPercentage
            visible: false
        }
        MyGraph
        {
            id: graph2
            width: mainWindow.width*widthPercentage
            height:mainWindow.height/heightPercentage
            y:graph1.height + 10
            visible: false
        }
        MyGraph
        {
            id: graph3
            width: mainWindow.width*widthPercentage
            height:mainWindow.height/heightPercentage
            y:graph1.height*2+ 10
            visible: false
        }
        MyGraph
        {
            id: graph4
            width: mainWindow.width*widthPercentage
            height:mainWindow.height/heightPercentage
            y:graph1.height*3 + 10
            visible: false
        }
        MouseArea
        {
            anchors.fill:graph1
            onWheel: {
                //console.log("rotation", wheel.angleDelta.y)
                if(wheel.angleDelta.y==120)
                    graph1.zoomIn()
                if(wheel.angleDelta.y==-120)
                    graph1.zoomOut()
            }
        }
        MouseArea
        {
            anchors.fill:graph2
            onWheel: {
                //console.log("rotation", wheel.angleDelta.y)
                if(wheel.angleDelta.y==120)
                    graph2.zoomIn()
                if(wheel.angleDelta.y==-120)
                    graph2.zoomOut()
            }
        }
        MouseArea
        {
            anchors.fill:graph3
            onWheel: {
                //console.log("rotation", wheel.angleDelta.y)
                if(wheel.angleDelta.y==120)
                    graph3.zoomIn()
                if(wheel.angleDelta.y==-120)
                    graph3.zoomOut()
            }
        }
        MouseArea
        {
            anchors.fill:graph4
            onWheel: {
                //console.log("rotation", wheel.angleDelta.y)
                if(wheel.angleDelta.y==120)
                    graph4.zoomIn()
                if(wheel.angleDelta.y==-120)
                    graph4.zoomOut()
            }
        }


        Button{
            text: "Add Graph"
            id:addGraph
            x:mainWindow.width-120
            y:20
            onClicked:
            {
                if(countNumberOfGraph<4)
                {
                    ++countNumberOfGraph;
                    switch(countNumberOfGraph)
                    {
                    case 1: graph1.visible=true;break;
                    case 2: graph2.visible=true;break;
                    case 3: graph3.visible=true;break;
                    case 4: graph4.visible=true;break;
                    }
                }

            }

        }

    }
}
