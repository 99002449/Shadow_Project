import QtQuick 2.0

//Snake game

Rectangle {
    id:root
    width: 400; height: 200
    property int countDownTime:60

    Text{
        id:title
        text:"Snake Game!"
        x:170
    }


    Text{
        id:display
        text:"Score: "
        x:350
        y:0
    }

    Text{
        id:score
        text:"0"
        x:380
        y:0
    }

    Timer {
        id:time
        interval: 1000;
        running: true;
        repeat: true
        onTriggered: {
        root.countDownTime--
            if (countDownTime == 0)
            {
                    running = false;
                    displayTime.text="Times Up!!"
                    dot.visible=false
            }
        }
    }

    Text {
        id: displayTimeLabel
        text:   "Timer: "
        x:0
        y:0
    }
    Text {
        id: displayTime
        text:  countDownTime
        x:40
        y:0
    }

    Rectangle {
        id: square
        x: 20; y: 20
        width: 40; height: 20;
        color:"black"
        onXChanged: checkRectangleXPosition()
        onYChanged: checkRectangleXPosition()
    }
    function checkRectangleXPosition()
    {
        if( dot.x>=square.x && dot.x<=square.x +40 && dot.y>=square.y && dot.y<=square.y+20)
        {
            square.width+=5
            score.text=score.text*1+1
            dot.x=  Math.random()*100
            dot.y=Math.random()*100

        }

    }

    Rectangle {
        id: dot
        x: Math.random()*100
        y: Math.random()*100
        radius: 20
        width: 10; height: 10;
        color:"green"

    }
    focus: true
    Keys.onDigit1Pressed: square.rotation= square.rotation+90
    Keys.onLeftPressed: square.x -= 10
    Keys.onRightPressed: square.x += 10
    Keys.onUpPressed: square.y -= 10
    Keys.onDownPressed: square.y += 10
    Keys.onPressed: {
        switch(event.key) {
        case Qt.Key_Plus:
            square.scale += 0.2
            break;
        case Qt.Key_Minus:
            square.scale -= 0.2
            break;
        case Qt.Key_Space:
            square.x += 20
        }
    }


}
