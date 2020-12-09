import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.3
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int x1: 10
    property int y1: 10
    ChartView
    {
        //title: "Spline"
        anchors.fill:parent
        antialiasing: true

        visible: true
        SplineSeries
        {
            //name: "SplineSeries"
            axisX:xAxisTick
            axisY:yAxisTick
            XYPoint { x: 0; y: 0.0 }
            XYPoint { x: x1; y: y1 }
            XYPoint { x: 1.9; y: 2.4 }
            XYPoint { x: 2.1; y: 2.1 }
            XYPoint { x: 2.9; y: 2.6 }
            XYPoint { x: 3.4; y: 2.3 }
            XYPoint { x: 4.1; y: 3.1 }

        }
        ValueAxis{
            id: xAxisTick
            min:0
            max:30
            tickCount: 4
        }
        ValueAxis{
            id: yAxisTick
            min:-10
            max:10
            tickCount: 4
        }
    }
}
