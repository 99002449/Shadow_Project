import QtQuick 2.0
import QtGraphicalEffects 1.0
Rectangle{
    id: world
    width: 1400
    height: 700

    property int worldTime: 10000


    //Sky
    Rectangle{
        id: sky
        anchors.fill: parent
        color: "light blue"
        z: -1
    }

    //mountain
    Image {
        id: mountain
        source: "mountain.png"
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom

        }
        height: parent.height * 0.8
    }

    //sun
    Rectangle{
        id: sun
        width: world.width * 0.05
        height: width
        x: 0
        y: world.height * 0.3
        radius: width/2
        color: "yellow"
    }

    Cloud {
        id: cloud1; mWorldTime: worldTime; x: 100; y: 100; width: 160; height: 100
    }
    Cloud {
        id: cloud2; mWorldTime: worldTime; x: 200; y: 300; width: 240; height: 100; z: 1

    }
    Cloud {
        id: cloud3; mWorldTime: worldTime; x: 400; y: 180; width: 200; height: 140; z: 1
    }
    Cloud {
        id: cloud4; mWorldTime: worldTime; x: 700; y: 280; width: 180; height: 120; z: 1
    }
    Cloud {
        id: cloud5; mWorldTime: worldTime; x: 900; y: 180; width: 380; height: 140; z: 1
    }
    Star{id:kk;  x: 1000; y: 500;}

    PropertyAnimation{
        target: sun
        property: "x"
        from: 0
        to: world.width
        duration: worldTime
        running: true

    }
    PropertyAnimation{
        target: sun
        property: "color"
        from: "red"
        to: "yellow"
        duration: worldTime
        running: true
    }
    PropertyAnimation{
        target: cloud1
        property: "rotation"
        from: 0
        to: 360
        duration: worldTime
        running: true

    }

    PropertyAnimation{
        target: cloud2
        property: "rotation"
        from: 0
        to: 360
        duration: worldTime
        running: true

    }
    PropertyAnimation{
        target: cloud3
        property: "rotation"
        from: 0
        to: 360
        duration: worldTime
        running: true

    }
    PropertyAnimation{
        target: cloud4
        property: "rotation"
        from: 0
        to: 360
        duration: worldTime
        running: true

    }
    PropertyAnimation{
        target: cloud5
        property: "rotation"
        from: 0
        to: 360
        duration: worldTime
        running: true

    }
    PropertyAnimation{
        target: kk
        property: "rotation"
        from: 0
        to: 360
        duration: worldTime
        running: true

    }
}
