import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.9

Page {

    title: "Product Audio"

    Component.onCompleted: {
    audio.play()

    }

//    Column {
//        anchors.centerIn: parent
//        AppButton {
//            anchors.horizontalCenter: parent.horizontalCenter
//            text: "Play Audio"
//            onClicked: {
//                audio.play()
//            }
//        }
//    }

    Audio {
        id: audio
        source: "https://felgo.com/web-assets/beep.mp3"
    }

//    NavigationStack {

//      Page {
//        title: "Video" // Is displayed in the title bar

//        MediaPlayer {
//          id: mediaplayer
//          autoPlay: true
//          loops: MediaPlayer.Infinite
////          source: "https://felgo.com/web-assets/video.mp4"
//          source: "https://felgo.com/web-assets/beep.mp3"
//        }

//        VideoOutput {
//          anchors.fill: parent
//          source: mediaplayer
//        }
////      }
////    }

}
