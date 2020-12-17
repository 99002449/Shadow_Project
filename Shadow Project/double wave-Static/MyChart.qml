
import QtQuick 2.0
import QtCharts 2.3
ChartView
{
    //title: "Spline"
    property alias referencetoMyChart: mychartview
    property alias referencetoXAxis: xAxis
     property alias referencetoYAxis: yAxis
        id:mychartview
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



}
