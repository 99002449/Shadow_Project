import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtCharts 2.1
import QtQuick.Dialogs 1.2

Window {
    id: window1
    title: "Chart test"
    visible: true
    width: 600
    height: 400

    Timer
    {
        interval: 500; running: true; repeat: true
               onTriggered:  do_it();
    }

    ChartView {
        id: chart
        anchors.fill: parent
        height:1000;
        axes: [
            ValueAxis{
                id: xAxis
            },
            ValueAxis{
                id: yAxis

            }
        ]

    }

    Button
    {
        id:button1
        width:200
        height:100
        text:"BROWSE"
        onClicked:fileDialog.open();
    }
    FileDialog
    {
           id: fileDialog
           title: "Please choose a file"
           folder: shortcuts.home  //Default opens home directory
           nameFilters:"*.*"
           onAccepted: {
               mywaveform.resizeFile_name(this.fileUrl);
               console.log("plotting=>>>> ");
           }
           onRejected: {
               console.log("Canceled")
           }
       }




function do_it()
{
chart.removeAllSeries();
    var series = chart.createSeries(ChartView.SeriesTypeSpLine, "line", xAxis, yAxis);
    series.pointsVisible = true;
   // series.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
    series.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function
    var total=0;
    mywaveform.update_that();
    total=mywaveform.numberOfSamples();
    xAxis.min=mywaveform.xmin()-5;
    xAxis.max=mywaveform.xmax()+5;
    yAxis.min=mywaveform.ymin()-5;
    yAxis.max=mywaveform.ymax()+5;


    for(var j = 0;j < total;j++)
    {  var x=mywaveform.getX(j);
        var y = mywaveform.getY(j);
        series.append(x, y);
    }
}

}
