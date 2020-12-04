import QtQuick 2.0

Rectangle {
    id: root
    width: 360
    height: 360
    color: "black"
Column{
    spacing: 10
    Rectangle {
        id: rec1

        width: 360
        height: 360/3.3
        focus: true
        color: {

            if(activeFocus===true)
                "#00ffff"

            else
                "#ffffe6"
        //focus: true
        }
        KeyNavigation.down: rec2
        KeyNavigation.up: rec3



    }
    Rectangle {
        id: rec2
        width: 360
        height: 360/3.3
        color: activeFocus ? "#6600cc":"#ffffe6"
        focus: true
        KeyNavigation.down: rec3
        KeyNavigation.up: rec1



    }
    Rectangle {
        id: rec3
        width: 360
        height: 360/3.3
        color: activeFocus ? "#cc0066":"#ffffe6"
        focus: true
        KeyNavigation.down: rec1
        KeyNavigation.up: rec2




    }
}
}
