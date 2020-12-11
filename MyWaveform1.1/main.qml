import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtCharts 2.3
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
    color: "#000000"

    Timer
    {
        interval: 500; running: true; repeat: true
               onTriggered:  do_it();
    }


    GridLayout
    {
        Layout.alignment: Qt.AlignTop
        anchors.fill:parent
        rowSpacing:0
        rows:2
        columns: 3

        //chart
        ChartView
        {
            //title: "Spline"
            id: graph1
            antialiasing: true
            width: mainWindow.width*widthPercentage
            height:mainWindow.height/heightPercentage
            visible: true

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


        GridLayout{
            property int count: 0
            property string str
            property alias browseButton:myBrowseButton
            id:graph1Settings
            // anchors.fill:parent
            rows:4
            columns: 2
            rowSpacing:-50

            //browseButton
            Button{
                id:myBrowseButton
                Layout.fillWidth: true
                Layout.columnSpan: 2
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop |Qt.AlignVCenter | Qt.AlignCenter
                Layout.bottomMargin: 25
                Layout.minimumWidth :100
                text: "Browse File"
                implicitWidth: 90
                implicitHeight:40
                onClicked:
                {
                    fileDialog.open()
                }

                background: Rectangle{
                    id: buttonColor
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: "#ffeb99"  }
                        GradientStop { position: 1 ; color: "#997a00"  }
                    }
                    radius: 5

                }


            }

            //label for amplitude
            Text {
                Layout.alignment: Qt.AlignCenter
                color: "white"
                text: qsTr("Amplitude")
                font.bold: true
                font.kerning: true
                font.letterSpacing: 2
                font.pixelSize: 14
            }
              //Dial for amplitude
            Dial
            {
                id:amplitudeDial
                stepSize: 10
                implicitWidth:80
                Layout.alignment:  Qt.AlignTop
                Layout.bottomMargin: -10
                from:0
                to:100
                value:0
                background: Rectangle{
                    color: "#fff5cc"
                    radius: 60
                    width: Math.max(64, Math.min(amplitudeDial.width, amplitudeDial.height))
                    height: width
                    y: 40
                }

            }

              //label for Sweep Speed
            Text {
                color: "white"
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Sweep Speed")
                font.bold: true
                font.kerning: true
                font.letterSpacing: 2
                font.pixelSize: 14
            }

               //Dial for Sweep Speed
            Dial
            {
                id:sweepSpeedDial
                Layout.bottomMargin: 25
                Layout.alignment:  Qt.AlignTop
                implicitWidth:80
                from:0
                to:100
                //value:0
                wrap: true
                background: Rectangle{
                    color: "#fff5cc"
                    radius: 60
                    width: Math.max(64, Math.min(amplitudeDial.width, amplitudeDial.height))
                    height: width
                    y: 40
                }

                onMoved: {
                   // if(sweepSpeedDial.value>0){
                        console.log("  "+sweepSpeedDial.value)
                        graph1.zoomIn()
                  //  }
                }
            }

            //ComboBox for color
            ComboBox
            {
                id:graphColorComboBox
                Layout.alignment:  Qt.AlignBottom
                model: ListModel {
                    id: chooseColor
                    ListElement { text: "Select Color" }
                    ListElement { text: "Blue" }
                    ListElement { text: "Green" }
                    ListElement { text: "Red" }
                    ListElement { text: "Yellow" }
                }

                background: Rectangle{
                    id: combo1
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: "#ffeb99"  }
                        GradientStop { position: 1 ; color: "#997a00"  }
                    }
                    radius: 5

                }

                implicitHeight: 30
                implicitWidth: 140

                onActivated:  {
                    if(graphColorComboBox.currentIndex===1)  graph1.color="Blue"
                    else if(graphColorComboBox.currentIndex===2)  graph1.color="Green"
                    else if(graphColorComboBox.currentIndex===3)  graph1.color="Red"
                    else if(graphColorComboBox.currentIndex===4)  graph1.color="Yellow"
                }

            }
          //ComboBox for thickness
            ComboBox
            {
                id:graphThicknessComboBox
                Layout.alignment:  Qt.AlignBottom
                model: ["Select Thickness","25%", "50%", "75%","100%"]
                implicitHeight: 30
                implicitWidth: 140

                background: Rectangle{
                    id: combo2
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: "#ffeb99"  }
                        GradientStop { position: 1 ; color: "#997a00"  }
                    }
                    radius: 5

                }

                onActivated:  {
                    if(graphThicknessComboBox.currentIndex===1)  graph1.width=3
                    else if(graphThicknessComboBox.currentIndex===2) graph1.width=6
                    else if(graphThicknessComboBox.currentIndex===3)graph1.width=8
                    else if(graphThicknessComboBox.currentIndex===4)graph1.width=10
                    implicitHeight: 30
                    implicitWidth: 140

                }


            }



        }



        //Dancing text
        GridLayout
        {
            property int worldTime: 10000


            columns: 1
            rows: 2
            rowSpacing: 40

            Text {
                id: title
                font.pointSize: 55
                font.bold: true
                color: "#806600"

                text: qsTr("W\nA\nV\nE\nF\nO\nR\nM")
                SequentialAnimation on color
                {
                    loops: Animation.Infinite

                    // Morning
                    ColorAnimation
                    {
                        to: "#cca300"
                        duration: worldTime * 0.3
                    }

                    // Afternoon
                    PauseAnimation
                    {
                        duration: worldTime * 0.4
                    }

                    // Night
                    ColorAnimation
                    {
                        to: "#fff5cc"
                        duration: worldTime * 0.3
                    }
                }
                ParallelAnimation {
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: title
                        property: "scale"
                        from: 1; to: 0.5
                        duration: worldTime
                        easing.type: Easing.InOutQuart
                    }
                }
            }
        }


//Browse file dailog
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


    function do_it()
    {
    graph1.removeAllSeries();
        var series = graph1.createSeries(ChartView.SeriesTypeSpLine, "Wavefom 1", xAxis, yAxis);
        series.pointsVisible = true;
       // series.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
        series.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function
        var total=0;
        mywaveform.update_that();
        total=mywaveform.numberOfSamples();
        xAxis.min=mywaveform.xmin()-1;
        xAxis.max=mywaveform.xmax()+1;
        yAxis.min=mywaveform.ymin()-1;
        yAxis.max=mywaveform.ymax()+1;


        for(var j = 0;j < total;j++)
        {  var x=mywaveform.getX(j);
            var y = mywaveform.getY(j);
            series.append(x, y);
        }
    }
}
