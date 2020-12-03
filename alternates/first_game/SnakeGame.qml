import QtQuick 2.0

//Snake game

Rectangle {
    id:root
    width: 400; height: 400
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
        width: 55; height: 20;
        color:"black"
        onXChanged: checkRectangleXPosition()
        onYChanged: checkRectangleXPosition()
    }
    function checkRectangleXPosition()
    { title.text= square.y;


        if((square.y>=dot.y && square.y<=dot.y+dot.height)&&(dot.x>=square.x)&&(dot.x<(square.x+square.width)))
        {
            if(dot.y<=0)
            {  score.text= score.text*1 + 1

                dot.y+=380;
                dot.x=Math.random()*100;
           }
            dot.y-=square.height;


        }


    }

    Rectangle {
        id: dot
        x: 300
        y: 300
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


}
