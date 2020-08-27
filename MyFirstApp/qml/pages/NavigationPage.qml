import QtQuick 2.0
import Felgo 3.0
import QtLocation 5.9
import QtPositioning 5.8

Page {

    Component.onCompleted: {
        NativeDialog.inputText("Delivery Address and Contact", "Delivery Address ?", "Input Address here", "", function(ok, address) {
            if(ok) {
                NativeDialog.inputText("Delivery Address and Contact", "Recipient Number ?", "Input Number here", "", function(ok, number) {
                    if(ok) {
                        inputBtn.text = "Input: " + text
                    }
                })
            }
        })

    }



    // show the map
    AppMap {
       center: QtPositioning.coordinate(0.31628 ,32.58219)
      anchors.fill: parent
      plugin: Plugin {
        name: "mapbox"
        // configure your own map_id and access_token here
        parameters: [  PluginParameter {
            name: "mapbox.mapping.map_id"
            value: "mapbox.streets"
          },
          PluginParameter {
            name: "mapbox.access_token"
            value: "pk.eyJ1IjoiZ3R2cGxheSIsImEiOiJjaWZ0Y2pkM2cwMXZqdWVsenJhcGZ3ZDl5In0.6xMVtyc0CkYNYup76iMVNQ"
          },
          PluginParameter {
            name: "mapbox.mapping.highdpi_tiles"
            value: true
          }]
      }

      // configure the map to try to display the user's position
      showUserPosition: true
      zoomLevel: 13

      // check for user position initially when component is created
      Component.onCompleted: {
        if(userPositionAvailable)
          center = userPosition.coordinate
      }

      // once we successfully received the location, we zoom to the user position
      onUserPositionAvailableChanged: {
        if(userPositionAvailable)
          zoomToUserPosition()
      }

      MapQuickItem {
        // overlay will be placed at the map center
        coordinate: QtPositioning.coordinate(0.31628 ,32.58219)

        // the anchor point specifies the point of the sourceItem that will be placed at the given coordinate
        anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)

        // source item holds the actual item that is displayed on the map
        sourceItem: Rectangle {
          width: dp(180)
          height: dp(50)
          color: "white"
          radius: dp(10)

          AppText {
            text: "The Heart of Uganda"
            anchors.centerIn: parent
          }
        }
      } // MapQuickItem
    }

}
