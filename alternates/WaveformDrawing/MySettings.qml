import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
GridLayout{
    height: mainWindow.height/4
    width: (mainWindow.width - mainWindow.width*widthPercentage ) *(4/5)
    columns: 2

    ComboBox{
        height: 5
        width: 5
    }
}
