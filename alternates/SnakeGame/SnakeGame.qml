import QtQuick 2.0

//Snake game

Rectangle {
    id:root
    width: 400; height: 380
    color: "#5BEFE2"
    border.color: "black"
    border.width: 1
    property int countDownTime:10
    gradient: Gradient{
        GradientStop{ position:0.0;color:"#255BEFE2"}
        GradientStop{ position:1.0;color:"#5BEFE2"}

    }

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
        gradient: Gradient{
            GradientStop{ position:0.0;color:"#70000000"}
            GradientStop{ position:1.0;color:"#000000"}
           }
        onXChanged: checkRectanglePosition()
        onYChanged: checkRectanglePosition()
    }
    function checkRectanglePosition()
    {
        if( dot.x>=square.x && dot.x<=square.x +40 && dot.y>=square.y && dot.y<=square.y+20)
        {
            square.width+=5
            score.text=score.text*1+1
            dot.x=  Math.random()*100
            dot.y=Math.random()*100

        }
            if(square.x==-20)
            {
                    square.x=root.width
            }
            if(square.y==-20)
            {
                    square.y=300  //or root.height
            }
    }

    Rectangle {
        id: dot
        x: Math.random()*100
        y: Math.random()*100
        radius: 20
        width: 10; height: 10;
        color:"red"

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


    Text {
        text: "_____________________________________________"
        x:0
        y:300
         opacity: 0.7
        font.family: "Helvetica"
        font.pointSize: 12
        color: "blue"
    }


    Image{
        id: img
        y:300
        x:-20
        opacity: 0.7
        source:"ltts.jpg"
        scale: 0.4
    }

    Text {
        text: "Welcome to LTTS! Engineering the change"
        x:40
        y:360
         opacity: 0.7
        font.family: "Helvetica"
        font.pointSize: 12
        color: "blue"
    }

}
