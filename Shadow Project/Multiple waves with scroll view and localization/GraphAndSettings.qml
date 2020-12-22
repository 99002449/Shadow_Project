import QtQuick 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtCharts 2.3

Item {

    signal signalSourceChanged(string source, int signalCount, int sampleCount);
    property string displayWaveformText:data.content[2]
   QtObject
   {
       id: data
       property var content: [qsTr("Samples per seconds: "),qsTr("Please choose a file"),qsTr("Waveform")]
   }

   property int  temp: 10
   property int ymax_temp:mywaveform.ymax()+1;
   property int ymin_temp:mywaveform.ymin()-1;
   property int xmax_temp:+1;
   property int xmin_temp:-1;
   property int samples: 10
   property variant graphComponent:null


   Timer
   {
       interval: 500; running: true; repeat: true
      onTriggered:  do_it();
   }


   RowLayout
   {
       Layout.alignment: Qt.AlignCenter
       anchors.fill:parent
       //chart
       MyChart
      {
           id: graph
       }

       //Settings
       MySettings
       {
               id:graphSettings
               Layout.alignment: Qt.AlignLeft
               Layout.leftMargin: -325
               text:qsTr(data.content[0]+mytrans.emptyString)
               items: ["10","60", "100", "200"]
               currentSelection: 0
               onSelectionChanged:
               {
                   signalSourceChanged(graphSettings.items[graphSettings.currentSelection],5,selection);
                   samples=graphSettings.items[graphSettings.currentSelection];
               }

       }


       //Browse file dailog
       FileDialog {
           id: fileDialog
           title: qsTr(data.content[1]+mytrans.emptyString)
           folder: shortcuts.home  //Default opens home directory
           nameFilters:"*.csv"
           onAccepted: {
               mywaveform.resizeFile_name(this.fileUrl);
               setupp();
               console.log("plotting=>>>> ");
           }
           onRejected: {
               console.log("Canceled")
           }
       }
   }

   function do_it()
   {
       graph.removeAllSeries();
       var xAxis = graph.referenceToXAxis
       var yAxis= graph.referenceToYAxis
       var graphColorComboBox=graphSettings.referenceToColorComboBox
       var graphThicknessComboBox=graphSettings.referenceToThicknessComboBox
       var amplitudeDial=graphSettings.referenceToAmplitudeDial
       var series = graph.createSeries(ChartView.SeriesTypeSpLine, qsTr(displayWaveformText+mytrans.emptyString),xAxis, yAxis);
       series.pointsVisible = true;
       series.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function
       var total=0;
       mywaveform.update_that();
       total=mywaveform.numberOfSamples();
       if(graphColorComboBox.currentIndex===1)  series.color="blue"
       else if(graphColorComboBox.currentIndex===2)  series.color="Green"
       else if(graphColorComboBox.currentIndex===3)  series.color="Red"
       else if(graphColorComboBox.currentIndex===4)  series.color="Yellow"

       if(graphThicknessComboBox.currentIndex===1)  series.width=0.5
       else if(graphThicknessComboBox.currentIndex===2) series.width=1
       else if(graphThicknessComboBox.currentIndex===3)series.width=1.5
       else if(graphThicknessComboBox.currentIndex===4)series.width=3.0

       if(temp >= total && total!==0)
       {temp=10;
           xAxis.max=mywaveform.xmin()+15
       }

       if(total!==0)
       {


           yAxis.min=ymin_temp/amplitudeDial.value;
           yAxis.max=ymax_temp/amplitudeDial.value;

           for(var j = 0;j < temp;j++)
           {
               var x=mywaveform.getX(j);
               var y = mywaveform.getY(j);
               series.append(x, y);
           }
           xAxis.max+=samples;
           temp=temp+samples;
       }
   }

   function setupp()
   {
       var yAxis= graph.referenceToYAxis
       yAxis.min=mywaveform.ymin()-1;
       yAxis.max=mywaveform.ymax()+1;

       ymin_temp=yAxis.min;
       ymax_temp=yAxis.max;


   }

}
