import QtQuick 2.0
Item {
id: image1

property int imageHeight
property int imageWidth





//    Image{




//        source:
////        onStatusChanged: {
////            if(status==image1.Ready)

////        }
//    }
    BorderImage {
        //id: name
        source: "qtLogo.png"
        height: image1.imageHeight
        width: image1.imageWidth
        //width: 100; height: 100
        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5

    }

}
