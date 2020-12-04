import QtQuick 2.0

Rectangle {
    // We can now access the properties we defined from C++ from the whole QML file
    width: WINDOW_WIDTH
    height: WINDOW_HEIGHT

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
}
