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
    signal signalSourceChanged(string source, int signalCount, int sampleCount);

    QtObject
    {
        id: data
        property var content: [qsTr("Waveform Drawing - Shadow Project using Qt/QML"),qsTr("Samples/sec"),qsTr("Please choose a file")]
    }
    //Title
    title: qsTr(data.content[0]+mytrans.emptyString)
    property  double widthPercentage: 7/10
    property double heightPercentage: 2.5
    property int previousMouseX: 0
    property int previousMouseY: 0
    property variant referenceToMyGraph

    property int  temp: 10
    property int ymax_temp:mywaveform.ymax()+1;
    property int ymin_temp:mywaveform.ymin()-1;
    property int xmax_temp:+1;
    property int xmin_temp:-1;


    property int  colorIndex
    property  int thicknessIndex
    property int ampValue
    property variant globalSeries

    color: "#000000"

    GridLayout
    {
        /*Timer
        {
            interval:500; running: true; repeat: true
            onTriggered:    plotGraph();
        }*/



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
                referenceToMyGraph=referenceToMyGraph1
                do_it(referenceToMyGraph1,num)
            }

        }

        MySettings
        {
            id:graphSettings
            Layout.rowSpan: 2
            onSendColorComboBoxSignal:
            {
                colorIndex=indexOfColorComboBox
                colorChange()

            }
            onSendThicknessComboBoxSignal:
            {
                thicknessIndex=indexOfThicknessComboBox
                thicknessChange()
            }

            onSendAmplitudeSignal:
            {
                ampValue=amplitudeValue
                amplitudeChange()
            }

            text:qsTr(data.content[1]+mytrans.emptyString)
            items: ["60", "100", "200"]
            currentSelection: 0
            onSelectionChanged:
            {
                signalSourceChanged(graphSettings.items[graphSettings.currentSelection],5,selection);
            }
        }

        MyGraphChart2
        {
            onSendSignalFromGraph2Area:
            {
                referenceToMyGraph=referenceToMyGraph2
                do_it(referenceToMyGraph2,num)
            }

        }


        FileDialog {
            id: fileDialog
            title: qsTr(data.content[2]+mytrans.emptyString)
            folder: shortcuts.home  //Default opens home directory
            nameFilters:"*.csv"
            onAccepted: {
                mywaveform.resizeFile_name(this.fileUrl);
                console.log("plotting=>>>> ");
            }
            onRejected: {
                console.log("Canceled")

            }
        }

    }


    function  colorChange()
    {
        if(colorIndex===1)globalSeries.color="Blue"
        else if(colorIndex===2)  globalSeries.color="Green"
        else if(colorIndex===3)  globalSeries.color="Red"
        else if(colorIndex===4)  globalSeries.color="Yellow"
    }

    function  thicknessChange()
    {
        if(thicknessIndex===1)globalSeries.width=0.5
        else if(thicknessIndex===2)  globalSeries.width=1
        else if(thicknessIndex===3)  globalSeries.width=1.5
        else if(thicknessIndex===4)  globalSeries.width=3
    }


    function amplitudeChange()
    {
        var total=mywaveform.numberOfSamples();
        if(temp >= total && total!==0)
        {
            temp=10;
            referenceToMyGraph.referencetoXAxis.max=mywaveform.xmin()+15
        }

        if(total!==0)
        {
            referenceToMyGraph.referencetoXAxis.max+=10;
            temp=temp+10;

            referenceToMyGraph.referencetoYAxis.min=ymin_temp/ampValue;
            referenceToMyGraph.referencetoYAxis.max=ymax_temp/ampValue;


            for(var j = 0;j < temp;j++)
            {
                var x=mywaveform.getX(j);
                var y = mywaveform.getY(j);
                globalSeries.append(x, y);
            }}
    }

    function setupp()
    {

        referenceToMyGraph.referencetoYAxis.min=mywaveform.ymin()-1;
        referenceToMyGraph.referencetoYAxis.max=mywaveform.ymax()+1;

        ymin_temp=referenceToMyGraph.referencetoYAxis.min;
        ymax_temp=referenceToMyGraph.referencetoYAxis.max;


    }

    function do_it(referenceToMyGraph,number)
    {
        var series
        referenceToMyGraph.removeAllSeries();
        if(number===0)
        {
            series =  referenceToMyGraph.referencetoMyChart.createSeries(MyGraphChart1.SeriesTypeSpLine, "Wavefom 1", referenceToMyGraph.referencetoXAxis, referenceToMyGraph.referencetoYAxis);
            globalSeries =series
        }
        if(number===1)
        {
            series =  referenceToMyGraph.referencetoMyChart.createSeries(MyGraphChart2.SeriesTypeSpLine, "Wavefom 2", referenceToMyGraph.referencetoXAxis, referenceToMyGraph.referencetoYAxis);
            globalSeries =series
        }
        series.pointsVisible = true;
        series.color = "white"
        series.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function
        var total=0;


        mywaveform.update_that();
        total=mywaveform.numberOfSamples();
        referenceToMyGraph.referencetoXAxis.min=mywaveform.xmin()-1;
        referenceToMyGraph.referencetoXAxis.max=mywaveform.xmax()+1;
        referenceToMyGraph.referencetoYAxis.min=mywaveform.ymin()-1;
        referenceToMyGraph.referencetoYAxis.max=mywaveform.ymax()+1;
        plotGraph(series)

    }
    function plotGraph()
    {
        var total = mywaveform.numberOfSamples();
        if(mywaveform.numberOfSamples()!==0)
        {
            for(var j = 0;j < total;j++)
            {
                var x=mywaveform.getX(j)
                var y = mywaveform.getY(j)
                globalSeries.append(x, y);
            }
        }
    }
}







