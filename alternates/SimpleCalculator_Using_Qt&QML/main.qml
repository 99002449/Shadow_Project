import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    id:root
    visible: true
    width: 400
    height: 300
    title: qsTr("Calculator")

    property int value

    signal calculateButtonClicked(var val1,var val2,var radioInput)
    signal clearButtonClicked()

    function checkSelectedRadio()
    {
        if(add.checked===true)
            return 1;
        else if(sub.checked===true)
            return 2;
        else if(mul.checked===true)
            return 3;
        else if(div.checked===true)
            return 4;

    }
    Column{
        id:column1
        spacing: 10

        Row{
            id: rowLayout1
            spacing: 10

            Label{
                id:textInput1Label
                text:"Input 1"
                font.family: "Helvetica"
                font.pointSize: 12
                color: "blue"
                leftPadding: 10
                topPadding: 10
            }
            TextField {
                id: input1
                width: 150
                font.family: "Helvetica"
                font.pointSize: 12
                color: "blue"
                focus: true
            }
        }

        Row{
            id: rowLayout2
            spacing: 10
            Label{
                id:textInput2Label
                font.family: "Helvetica"
                font.pointSize: 12
                color: "blue"
                text:"Input 2"
                leftPadding: 10
                topPadding: 10
            }
            TextField {
                id: input2
                width: 150
                font.family: "Helvetica"
                font.pointSize: 12
                color: "blue"
                focus: true
            }
        }


        Row
        {

            id: rowLayout3
            spacing: -40
            RadioButton{
                id:add
                text:"Addition"
                font.family: "Helvetica"
                font.pointSize: 15
                scale: 0.6
            }
            RadioButton{
               id:sub
                text:"Subtration"
                font.family: "Helvetica"
                font.pointSize: 15
                scale: 0.6
            }
            RadioButton{
                 id:mul
                text:"Multiplication"
                font.family: "Helvetica"
                font.pointSize: 15
                scale: 0.6
            }
            RadioButton{
                id:div
                text:"Division"
                font.family: "Helvetica"
                font.pointSize: 15
                scale: 0.6
            }
        }

        Row{
            id: rowLayout4
            spacing: 10
            Label{
                id:resultLabel
                font.family: "Helvetica"
                font.pointSize: 12
                color: "blue"
                text:"Result"
                leftPadding: 10
                topPadding: 10
            }
            TextField {
                id: resultTextField
                width: 150
                font.family: "Helvetica"
                font.pointSize: 12
                color: "blue"
                focus: true
            }
        }

        Row{
            id: rowLayout5
            spacing: 10

            Button{
                id: calculateButton
                text:"Calculate"
                onClicked: {
                   //value=checkSelectedRadio()
                    calculateButtonClicked(input1.text, input2.text,checkSelectedRadio())
                    resultTextField.text=calculator.result
                }
            }
            Button{
                id: clearButton
                text:"Clear"
                onClicked: {
                    clearButtonClicked()
                    input1.text=calculator.input1
                    input2.text=calculator.input2
                }

            }
        }

    }


}
