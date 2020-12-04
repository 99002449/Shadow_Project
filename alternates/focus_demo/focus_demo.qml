import QtQuick 2.0

Rectangle {id:root
    width: 360
    height: 360
    color: "red"
   Rectangle
   { width:25;height:25;id:one;
       x:50;y:75;
       color:"black"}
   Rectangle
   { width:25;height:25;id:two;
       x:25;y:100;
       color:"black"}
   Rectangle
   { width:25;height:25;id:three;
       x:75;y:100;
       color:"black"}
   Rectangle
   { width:25;height:25;id:four;
       focus:true;
       x:50;y:125;
       color:"black"}



Keys.onLeftPressed:{two.width+=10;two.x-=10;}
Keys.onRightPressed:{three.width+=10;}
Keys.onDownPressed:{ four.height+=10;}
Keys.onUpPressed:{one.height+=10;one.y-=10;}


}

