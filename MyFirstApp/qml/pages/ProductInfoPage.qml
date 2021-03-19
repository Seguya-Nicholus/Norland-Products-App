import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

// Main Page
Page {



    property var model: ({})

    title: "Product Details"

    id:itemInfo

    preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait
    backgroundColor: "#E9FAFF"


    // add a navigation bar row to the right slot
    rightBarItem: NavigationBarRow {
        // ... and an icon button
        IconButtonBarItem {
            icon: IconType.heart
            onClicked: { console.log("item clicked") }
        }
    }

    // ========== Upper Section to display image and description
    Rectangle {
        id:topRect
        anchors.centerIn: parent.Center
        width: itemInfo.width
        radius: dp(10)
        height: parent.height/3
        color: "#F0F0F1"


        Rectangle {
            id: rectImage
            anchors.fill: parent
            color: "#F0F0F1"


            Rectangle {
                id: imgRect
                anchors.left: parent.left
                width: parent.width/2
                height: parent.height
                color: "transparent"

                AppImage {
                    id:productImage
                    anchors.right:  parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: model.ImagePath
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    fillMode: Image.PreserveAspectCrop
                    layer.enabled: true
                }
            }

            Rectangle {
                id: textRect
                anchors.right: parent.right
                width: parent.width/2
                height: parent.height
                color: "transparent"

                AppText {
                    id:productName
                    anchors.top: parent.top
                    anchors.topMargin: dp(50)
                    anchors.right: parent.right
                    anchors.rightMargin: dp(20)
                    text: model.ProductName
                    font.bold: true
                    color: "#1C97C9"
                    font.pixelSize: sp(20)
                }

                AppText{
                    id:productText
                    anchors.right: parent.right
                    anchors.rightMargin: dp(20)
                    anchors.top: productName.bottom
                    text: model.ProductText
                    font.pixelSize: sp(18)
                    color: "#A1A1A1"
                }

                AppText{
                    id: productCost
                    anchors.top: productText.bottom
                    anchors.topMargin: dp(15)
                    anchors.right: parent.right
                    anchors.rightMargin: dp(20)
                    font.bold: true
                    color: "#034083"
                    text: model.Cost
                    font.pixelSize: sp(20)
                }
            }
        }

    } // End Upper Section


    Rectangle{
        id:middleRect
        anchors.top: topRect.bottom
        width: itemInfo.width
        height: parent.height * 0.47
        color: "#E9FAFF"

        Rectangle {
            anchors.fill: parent
            anchors.topMargin: dp(5)
            anchors.bottomMargin: dp(5)
            anchors.leftMargin: dp(15)
            anchors.rightMargin: dp(15)
            color: "transparent"


            Rectangle {
                id:rectbelowImage
                anchors.fill: parent
                anchors.bottomMargin: parent.height * 0.7
                color: "transparent"

                Rectangle {
                    id:rectfirst
                    color: "transparent"
                    anchors.top: parent
                    width: parent.width
                    height: dp(50)

                    RowLayout {
                        id: firstRow
                        anchors.fill: parent
                        spacing: 2

                        Rectangle {
                            color: '#E9FAFF'
                            Layout.fillWidth: true
                            Layout.fillHeight:  true
                            Layout.minimumWidth: parent.width * 0.329
                            Layout.preferredWidth: parent.width * 0.329
                            Layout.maximumWidth: parent.width * 0.329
                            Layout.minimumHeight: parent.height

                            AppButton {
                                text: " Info"
                                radius: dp(18)
                                backgroundColor: "#6BEAFC"
                                textColor : "#034083"
                                flat: false
                                fontCapitalization: Font.Capitalize

                            }
                        }

                        Rectangle {
                            color: '#E9FAFF'
                            Layout.fillWidth: true
                            Layout.fillHeight:  true
                            Layout.minimumWidth: parent.width * 0.329
                            Layout.preferredWidth: parent.width * 0.329
                            Layout.maximumWidth: parent.width * 0.329
                            Layout.minimumHeight: parent.height

                            AppButton {
                                text: "Dosage"
                                radius: dp(18)
                                backgroundColor: "#E9FAFF"
                                textColor : "#034083"
                                borderColor : "#9EB9D9"
                                borderWidth: 1
                                flat: false
                                fontCapitalization: Font.Capitalize
                            }
                        }

                        Rectangle {
                            color: '#E9FAFF'
                            Layout.fillWidth: true
                            Layout.fillHeight:  true
                            Layout.minimumWidth: parent.width * 0.329
                            Layout.preferredWidth: parent.width * 0.329
                            Layout.maximumWidth: parent.width * 0.329
                            Layout.minimumHeight: parent.height


                            AppButton {
                                text: "Testimonials"
                                radius: dp(18)
                                backgroundColor: "#E9FAFF"
                                textColor : "#034083"
                                borderColor : "#9EB9D9"
                                borderWidth: 1
                                flat: false
                                fontCapitalization: Font.Capitalize
                            }

                        }
                    }
                }
                Rectangle {
                    id:rectMiddle
                    color: "transparent"
                    anchors.top: rectfirst.bottom
                    width: parent.width
                    height: dp(142)

                    AppText {
                        id:summaryText
                        width: parent.width
                        color: "#A1A1A1"
                        horizontalAlignment: AppText.AlignJustify
                        verticalAlignment: AppText.AlignJustify
                        text: qsTr("<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Consectetur adipiscing elit, sed do eiusmod tempor.")

                    }
                }
                Rectangle {
                    id:rectBottom
                    color: "transparent"
                    anchors.top: rectMiddle.bottom
                    width: parent.width
                    height: dp(41)

                    AppButton {
                        id:playAudio
                        text: IconType.fileaudioo + "  Audio"
                        radius: dp(18)
                        anchors.left: parent.left
                        fontCapitalization : Font.Capitalize
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: dp(10)
                        textSize:sp(18)

                        onClicked: {
                            navigationStack.push(audioPage)
                        }
                    }

                    AppButton {
                        id:playVideo
                        text: IconType.filevideoo + "  Video"
                        radius: dp(18)
                        anchors.left: playAudio.right
                        fontCapitalization : Font.Capitalize
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: dp(10)
                        textSize:sp(18)

                        onClicked: {
                            navigationStack.push(videoPage)
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id:bottomRect
        anchors.top: middleRect.bottom
        width: parent.width
        height: parent.height - middleRect.height - topRect.height
        color: "#E9FAFF"

        Rectangle {
            anchors.top: parent
            width : parent.width
            height: parent.height * 0.5
            color: "transparent"


            Rectangle {
                id:swipeRect
                width: parent.width * 0.95
                height: 80
                color: "black"
                border.color: "black"
                border.width: 1
                radius: dp(25)

                anchors.horizontalCenter: parent.horizontalCenter

                AppText{
                    text: model.Cost
                    color : "#FFFFFF"
                    anchors.verticalCenter:  parent.verticalCenter
                    anchors.left:  parent.left
                    anchors.leftMargin: dp(30)
                    font.pixelSize: sp(20)
                    font.bold: true
                }

                SwipeButton {
                    id:btn
                    anchors.verticalCenter: swipeRect.verticalCenter
                    anchors.right:  swipeRect.right
                    text: "<b>"+IconType.arrowright + "  Swipe to buy</b>"
                    textSize: sp(18)
                    minimumWidth: parent.width * 0.5
                    width: parent.width * 0.5
                    height: swipeRect.height
                    fontCapitalization : Font.Capitalize

                    radius:dp(25)
                    backgroundColor: "#999999"
                    textColor : "#FFFFFF"
                    hideOptionsOnClick : true

                    MouseArea {
                        anchors.fill: parent
                        preventStealing: true
                        property real velocity: 0.0
                        property int xStart: 0
                        property int xPrev: 0
                        property bool tracing: false
                        onPressed: {
                            xStart = mouse.x
                            xPrev = mouse.x
                            velocity = 0
                            tracing = true
                            console.log( " pressed  "+xStart)
                            console.log( " pressed  "+xPrev)
                        }
                        onPositionChanged: {
                            if ( !tracing ) return
                            var currVel = (mouse.x-xPrev)
                            velocity = (velocity + currVel)/2.0
                            xPrev = mouse.x
                            if ( velocity > 15 && mouse.x > parent.width*0.2 ) {
                                tracing = false
                                console.log( " Swiping Happening ...  ")
                                // SWIPE DETECTED !! EMIT SIGNAL or DO your action
                            }
                        }
                        onReleased: {
                            tracing = false
                            if ( velocity > 15 && mouse.x > parent.width*0.2 ) {
                                // SWIPE DETECTED !! EMIT SIGNAL or DO your action
                                console.log("Button Realesed")
                                navigationStack.push(myCartPage/*paymentPage*/)
                            }
                        }
                    }
                }
            } // End of Swipe Button


//            AppButton {
//                id:buttonMain
//                anchors.centerIn: parent
//                minimumWidth: parent.width * 0.9
//                width: parent.width * 0.9
//                height: parent.height
//                radius: dp(25)
//                backgroundColor: "#000000"


//                AppText{
//                    text: model.Cost
//                    color : "#FFFFFF"
//                    anchors.verticalCenter:  parent.verticalCenter
//                    anchors.left:  parent.left
//                    anchors.leftMargin: dp(30)
//                    font.pixelSize: sp(20)
//                    font.bold: true
//                }



//                SwipeButton {
//                    id:btn
//                    anchors.verticalCenter: parent.verticalCenter
//                    anchors.right:  parent.right
//                    text: "<b>"+IconType.arrowright + "  Swipe to buy</b>"
//                    textSize: sp(18)
//                    minimumWidth: parent.width * 0.5
//                    width: parent.width * 0.5
//                    height: buttonMain.height
//                    fontCapitalization : Font.Capitalize

//                    radius:dp(25)
//                    backgroundColor: "#999999"
//                    textColor : "#FFFFFF"
//                    hideOptionsOnClick : true

//                    MouseArea {
//                        anchors.fill: parent
//                        preventStealing: true
//                        property real velocity: 0.0
//                        property int xStart: 0
//                        property int xPrev: 0
//                        property bool tracing: false
//                        onPressed: {
//                            xStart = mouse.x
//                            xPrev = mouse.x
//                            velocity = 0
//                            tracing = true
//                            console.log( " pressed  "+xStart)
//                            console.log( " pressed  "+xPrev)
//                        }
//                        onPositionChanged: {
//                            if ( !tracing ) return
//                            var currVel = (mouse.x-xPrev)
//                            velocity = (velocity + currVel)/2.0
//                            xPrev = mouse.x
//                            if ( velocity > 15 && mouse.x > parent.width*0.2 ) {
//                                tracing = false
//                                console.log( " Swiping Happening ...  ")
//                                // SWIPE DETECTED !! EMIT SIGNAL or DO your action
//                            }
//                        }
//                        onReleased: {
//                            tracing = false
//                            if ( velocity > 15 && mouse.x > parent.width*0.2 ) {
//                                // SWIPE DETECTED !! EMIT SIGNAL or DO your action
//                                console.log("Button Realesed")
//                                navigationStack.push(myCartPage/*paymentPage*/)
//                            }
//                        }
//                    }
//                }
//            } // End of Swipe Button

        }

  // ========== Tab Control ========
        TabControl {
            id:tabControl1
            showIcon : true
            currentIndex: 1
            tabPosition: Qt.BottomEdge

            anchors.fill: parent
            NavigationItem {
                id:navItem1
                title: "Events"
                icon: IconType.calendar
            }

            //            currentTab : NavigationItem
            NavigationItem {
                id:navItem2
                title: "Locate Us"
                icon: IconType.mapmarker
            }

            NavigationItem {
                id:navItem3
                title: "Become a Member"
                icon: IconType.user
            }
        } // End of Tab Control




    }

    Component {
        id: audioPage
        ProductAudio {}
    }

    Component{
        id:videoPage
        ProductVideo {}
    }

    Component {
        id: paymentPage
        PaymentInfo{}
    }

    Component {
        id:myCartPage
        MyCartList {}
    }




} // End of Main Page
