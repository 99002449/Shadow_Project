import QtQuick 2.0
import QtCharts 2.3

ChartView
{
    //title: "Spline"
    antialiasing: true
    SplineSeries
    {
        //name: "SplineSeries"
        axisX:xAxisTick
        axisY:yAxisTick
        XYPoint { x: 0; y: 0.0 }
        XYPoint { x: 1.1; y: 3.2 }
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
        tickCount: 13
    }
    ValueAxis{
        id: yAxisTick
        min:0
        max:30
        tickCount: 5
    }
}
