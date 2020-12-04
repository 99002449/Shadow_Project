import QtQuick 2.0

Rectangle {
    id: outerRac
    width: 360
    height: 360
    //color: "#C11E72"
    gradient: Gradient {
        GradientStop { position: 0.0; color:  "#f1a7cd"}
        GradientStop { position: 1.0; color: "#C11E72" }
    }


    MyImage{
        imageHeight: 50
        imageWidth: 50
        x: 150
        y: 20

       // anchors.centerIn: outerRac

    }


    Rectangle{
        id: rectangle1
        width: 100
        height: 30
        x: 100
        y: 100

    }
    TextInput{
        id: textInput
        anchors.fill: rectangle1
        text: "ex bella"
        color: "black"

        //onAccepted: afterText.text = "Your name is "+ text
    }

    Text{
        id: text1
        x:100
        y:80
        width: 100
        height: 40
        color: "black"
        text: qsTr("Please enter your name")
        font.pixelSize: 15

    }

    MyButton{
        Text{
            id: afterText
            text: ""
            color: "black"
            anchors.top:textInput.bottom
            anchors.margins: 20
            x: 5
            y: 100
            height: 15
            font.pixelSize: 12



        }


        width: outerRac.width/3
        height: outerRac.width/8
        x: 120
        y: 160
        backcolor: "#B125EE"
        bordercolor: "pink"
        borderwidth: 10
        radius: 10
        text: "<b>Click me</b>"

        color: "white"

        enteredColor: "pink"
        enteredWidth: 7

        exitedColor: "lightpink"
        exitedWidth: 3

        hoverEnabled: true

        onButtonClicked: {

            afterText.text = "Hello " + textInput.text +"! Welcome to QT"

            x: 100
            y: 100
}




    }

}


/*2
import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 640

    Rectangle{
        id: rect
        anchors.centerIn: parent
        height: 50
        width: 100
        color: "blue"
        MouseArea{
            anchors.fill: parent
            onClicked: na.running = true
        }

        NumberAnimation {
            id: na    //ID of the QML Animation type
            target: rect    //The target item on which the animation should run
            property: "height"    //The property of the target item which should be changed by the animator to show effect
            duration: 200    //The duration for which the animation should run
            from: rect.height    //The initial numeric value of the property declared in 'property'
            to: 200    //The final numeric value of the property declared in 'property'
        }
    }

}
*/
/*
import QtQuick 2.0

Rectangle {
    id: page
    width: 320; height: 480
    color: "lightgray"

    Text {
        id: helloText
        text: "Hello world!"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24; font.bold: true
    }

    Grid {
        id: colorPicker
        x: 4; anchors.bottom: page.bottom; anchors.bottomMargin: 4
        rows: 2; columns: 3; spacing: 3

        Cell { cellColor: "red"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "green"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "black"; onClicked: helloText.color = cellColor }
    }
}*/
