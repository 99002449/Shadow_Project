import QtQuick 2.12
import QtQml 2.3
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2
Window {
    id:mainWindow
    visibility: "Maximized"
    visible: true
    width: 1600
    height:900
    signal storeAndSendUrl(var url)
    title: qsTr("Waveform Drawing - Shadow Project using Qt/QML")
    property  double widthPercentage: 7/10
    property double heightPercentage: 2.5
    property int previousMouseX: 0
    property int previousMouseY: 0
    property variant referenceToMyGraph


    color: "#000000"

    GridLayout
    {
        Timer
           {
               interval: 15000; running: true; repeat: true
               onTriggered:  do_it(referenceToMyGraph );
           }



        Layout.alignment: Qt.AlignTop
        anchors.fill:parent
        rowSpacing:0
        rows:2
        columns: 3
        MyTitle
        {
            Layout.rowSpan: 2
            id:myTitle
        }
        MyGraphChart1
        {
            onSendSignalFromGraph1Area:
            {
                console.log("slot - graph area 1 id: "+referenceToMyGraph1)
            }
        }
        MySettings
        {
            id:graphSettings
            Layout.rowSpan: 2
        }

        MyGraphChart2
        {
            onSendSignalFromGraph2Area:
            {
                    console.log("slot - graph area 2 id: "+referenceToMyGraph2)
            }

        }


        FileDialog {
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



    }


    function do_it(referenceToMyGraph,number)
    {
        var series
        console.log("In do_it2 ( )  id:  "+ referenceToMyGraph)
        referenceToMyGraph.removeAllSeries();
        if(number===0)
        {
                        series =  referenceToMyGraph.referencetoMyChart.createSeries(MyGraphChart1.SeriesTypeSpLine, "Wavefom 1", referenceToMyGraph.referencetoXAxis, referenceToMyGraph.referencetoYAxis);
         console.log("In number ===0")
        }
            if(number===1)
            {
            series =  referenceToMyGraph.referencetoMyChart.createSeries(MyGraphChart2.SeriesTypeSpLine, "Wavefom 1", referenceToMyGraph.referencetoXAxis, referenceToMyGraph.referencetoYAxis);
        console.log("In number ===0")
            }
                series.pointsVisible = true;
        series.color = "white"
        series.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function
        var total=0;
        mywaveform.update_that();
        total=mywaveform.numberOfSamples();
            console.log("at plotxy axess")
        referenceToMyGraph.referencetoXAxis.min=mywaveform.xmin()-1;
        referenceToMyGraph.referencetoXAxis.max=mywaveform.xmax()+1;
        referenceToMyGraph.referencetoYAxis.min=mywaveform.ymin()-1;
        referenceToMyGraph.referencetoYAxis.max=mywaveform.ymax()+1;


        for(var j = 0;j < total;j++)
        {
            console.log("x y point appending")
            var x=mywaveform.getX(j);
            var y = mywaveform.getY(j);
            series.append(x, y);
        }


    }

    /*
    function do_it(val)
    {
        val.referencetoMyChart.removeAllSeries();
        var series =  val.referencetoMyChart.createSeries(MyChart.SeriesTypeSpLine, "Wavefom 1", val.referencetoXAxis, val.referencetoYAxis);
        series.pointsVisible = true;
        series.color = "white"
        series.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function
        var total=0;
        mywaveform.update_that();
        total=mywaveform.numberOfSamples();
        val.referencetoXAxis.min=mywaveform.xmin()-1;
        val.referencetoXAxis.max=mywaveform.xmax()+1;
        val.referencetoYAxis.min=mywaveform.ymin()-1;
        val.referencetoYAxis.max=mywaveform.ymax()+1;


        for(var j = 0;j < total;j++)
        {  var x=mywaveform.getX(j);
            var y = mywaveform.getY(j);
            series.append(x, y);
        }
    }
*/
}







