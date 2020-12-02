import QtQuick 2.0



    Rectangle {
        width: 400; height: 200

        Rectangle {
            id: square
            x: 8; y: 8
            width: 40; height: 20;
            color:"black"

        }
        focus: true
        Keys.onDigit1Pressed: square.rotation= square.rotation+90

        Keys.onLeftPressed: square.x -= 8
        Keys.onRightPressed: square.x += 8
        Keys.onUpPressed: square.y -= 8
        Keys.onDownPressed: square.y += 8
        Keys.onPressed: {
            switch(event.key) {
                case Qt.Key_Plus:
                    square.scale += 0.2
                    break;
                case Qt.Key_Minus:
                    square.scale -= 0.2
                    break;
            }

        }
    }
