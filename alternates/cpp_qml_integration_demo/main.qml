import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qml to Cpp")

    signal dataSend()

    TextField{
        id:userTextInput
        text:myObj.data
    }


    Button{
        id:userButton
        text:"Receive Data"
        y:50
        onClicked: {
            dataSend()
        }
    }




}
