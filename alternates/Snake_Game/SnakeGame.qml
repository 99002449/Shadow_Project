import QtQuick 2.0

//Snake game

Rectangle {
    id:root
    width: 900; height: 700
    color: "#5BEFE2"
    border.color: "black"
    border.width: 1
    property int countDownTime:60
    property int bonusCountDownTime
    property int bonusDotCount
    property int normalDotCount
    property  int  multiplier: 500
    gradient: Gradient{
        GradientStop{ position:0.0;color:"#255BEFE2"}
        GradientStop{ position:1.0;color:"#5BEFE2"}
    }

    //Title
    Text{
        id:title
        text:"Snake Game!"
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Helvetica"
        font.pointSize: 16
        color: "#B125EE"
    }

    // Score label
    Text{
        id:display
        text:"Score: "
        x:root.width-70
        y:0
        font.pointSize: 12
        color: "#B125EE"
    }

    //Score
    Text{
        id:score
        text:"0"
        x:root.width-23
        y:0
        font.pointSize: 12
        color: "#B125EE"
    }

    //Timer label
    Text {
        id: displayTimeLabel
        text:   "Timer: "
        x:0
        y:0
        font.pointSize: 12
        color: "#B125EE"
    }

    //Timer count
    Text {
        id: displayTime
        text:  countDownTime
        x:50
        y:0
        font.pointSize: 12
        color: "#B125EE"
    }

    //Timer
    Timer {
        id:time
        interval: 1000;
        repeat: true
        onTriggered: {
            countDownTime--
            if (countDownTime == 0)
            {
                running = false;
                displayTime.text="Times Up!!"
                gameOver.visible=true
                dot.visible=false
                bonusDot.visible=false
                square.visible=false
            }
            if(countDownTime%10==0)
            {
                bonusDot.x= Math.random()*multiplier
                bonusDot.y= Math.random()*multiplier
                bonusDot.visible=true
                bonusCountDownTime=3 //setting bonusDot time limit
            }
            if(bonusCountDownTime==0)
            {
                bonusDot.x=-100
                bonusDot.y= -100
                bonusDot.visible=false      //disable bonus dot
            }

            bonusCountDownTime--
        }
    }


    //Game Instrution Message
    Text{
        id: gameInstructions
        visible: true
        text:" Game Rules:\n\n\t1. Use Up,Down,Right and Left keys to move the Snake
                                            \n\t2. There are Dots which appear in the Game (Red & Green)
                                            \n\t3. Red Dot appears always and if eaten by Snake score increases by 1
                                            \n\t4. Green Dot appears every 10 sec and is available for 3 seconds
                                            \n\t5  If eaten by snake score is increase by 5 and Time is increase by 5 sec
                                            \n\t6  Time Limit is 60 Seconds
                                            \n\t7. Make the Snake eat as many as Dot (Green/Red)
                     \n\t-------------------- ALL THE BEST ----------------------\n\n\n\t\t Press SpaceBar to Start the Game "
        anchors.verticalCenter : parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Helvetica"
        font.pointSize: 12
        color: "#B125EE"

        }

    //gameover Message
    Text{
        id:gameOver
        visible: false
        text:"-----------  Gamer Over ------------ \n\n\tScore: "+score.text+"\n\tBonus Dots Count: "+bonusDotCount+"\n\tNormal Dot Count: "+normalDotCount  /*+"\n\nPress SpaceBar to Re-Start the Game"*/
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter : parent.verticalCenter
        font.family: "Helvetica"
        font.pointSize: 14
        color: "#B125EE"
    }

    //Bonus Dot
    Rectangle {
        id: bonusDot
        x: Math.random()*multiplier
        y: Math.random()*multiplier
        visible: false
        radius: 20
        width: 10; height: 10;
        color:"darkgreen"

    }




    Rectangle {
        id: square
        x: 20; y: 20
        width: 40; height: 20;
        color:"black"
        visible:false
        gradient: Gradient{
            GradientStop{ position:0.0;color:"#70000000"}
            GradientStop{ position:1.0;color:"#000000"}
        }
        onXChanged: checkRectanglePosition()
        onYChanged: checkRectanglePosition()
    }
    function checkRectanglePosition()
    {
        //condition to check whether the snake/square lies in the same coradinates as of red dot
        if( dot.x>=square.x && dot.x<=square.x +40 && dot.y>=square.y && dot.y<=square.y+20)
        {
            square.width+=5
            score.text=score.text*1+1
            normalDotCount++
            dot.x=  Math.random()*multiplier
            dot.y=Math.random()*multiplier
        }

        //condition to check whether the snake/square lies in the same coradinates as of red dot
        if( bonusDot.x>=square.x && bonusDot.x<=square.x +40 && bonusDot.y>=square.y && bonusDot.y<=square.y+20)
        {
            score.text=score.text*1+5
            countDownTime+=5
            bonusDotCount++
            bonusDot.x=-100
            bonusDot.y=-100
        }
        if(square.x==-20)//left border
            square.x=root.width

        if(square.x==root.width+20)//right border
            square.x=0

        if(square.y==-20)//Top Border
            square.y=300  //or root.height

        if(square.y==root.height-80+10)//bottom border
            square.y=0
    }

    Rectangle {
        id: dot
        x: Math.random()*multiplier
        y: Math.random()*multiplier
        visible: false
        radius: 20
        width: 10; height: 10;
        color:"red"
    }
    focus: true
    Keys.onLeftPressed: {
        square.rotation=180
        square.x -= 10
    }
    Keys.onRightPressed: {
        square.rotation=180
        square.x += 10
    }
    Keys.onUpPressed: {
        square.rotation=90
        square.y -= 10
    }
    Keys.onDownPressed: {
        square.rotation=90
        square.y += 10
    }
   Keys.onPressed: {
       switch(event.key) {
       case Qt.Key_Space:
           gameInstructions.visible=false
           dot.visible=true
           bonusDot.visible=true
           square.visible=true
           time.start()
           break;
/*
        case Qt.Key_S:
            gameOver.visible=false
            gameInstructions.visible=true
            time.start()

            break;*/
       }
    }



    /*Keys.onPressed: {
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
    }*/


    Text {
        text: "______________________________________________________________________________________________________________________________________________________________________________________"
        x:0
        y:root.height-80
        opacity: 0.7
        font.family: "Helvetica"
        font.pointSize: 12
        color: "blue"
    }


    Image{
        id: img
        y:root.height-80
        x:root.width/2-220
        opacity: 0.7
        source:"ltts.jpg"
        scale: 0.4
    }

    Text {
        text: "Welcome to LTTS! Engineering the change"
        y:root.height-20
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0.7
        font.family: "Helvetica"
        font.pointSize: 12
        color: "blue"
    }

}
