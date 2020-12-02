import QtQuick 2.0

Rectangle {
    id: root
    width: 120
    height: 240
    color:"black"

    Column {
        id: col

        spacing: 8
        Rectangle {width: 96;height:25; color:"red" }
        Rectangle { width: 96;height:25; color:"brown"}
        Rectangle {width: 96;height:25; color:"red" }

    Row {
           id: row

           spacing: 8
          Rectangle {width: 20;height:25; color:"red" }
            Rectangle {width: 20;height:25; color:"purple" }
            Rectangle {width: 20;height:25; color:"red" }
       }
    Grid {
            id: grid
            rows: 2
            columns: 2

            spacing: 8
           Rectangle {width: 20;height:25; color:"red" }
          Rectangle {width: 20;height:25; color:"green" }
           Rectangle {width: 20;height:25; color:"red" }
            Rectangle {width: 20;height:25; color:"yellow" }
        }}
}
